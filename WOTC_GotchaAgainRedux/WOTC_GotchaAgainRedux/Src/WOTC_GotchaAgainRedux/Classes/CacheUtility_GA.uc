////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    16/10/23    01:45
////////////////////////////////////////////////////////////////////////////////////////////////////

class CacheUtility_GA extends Object dependson(IconPack_GA);

struct ArrowObjectRelation
{
    var XComGameState_IndicatorArrow_GA Arrow;
    var int ObjectID;
};

struct DoorHackingIndicatorRelation
{
    var DoorHackingIndicator_GA DoorHackingIndicator;
    var int ObjectID;
};

struct UnitFlagCacheItem
{
    var int UnitObjectID;
    var UIUnitFlag UnitFlag;
    var UIUnitLOSIndicator_GA UnitLOSIcon;
    var UIUnitActivationIndicator_GA UnitActivationIcon;
};

var IconPack_GA IconPack;

var bool bAdventTowersHaveBeenHacked;
var array<ArrowObjectRelation> ArrowObjectRelations;

var array<UnitFlagCacheItem> UnitFlagCache;
var array<DoorHackingIndicatorRelation> DoorHackingIndicators;

////////////////////////////////////////////////////////////////////////////////////////////////////
//	ON INIT
////////////////////////////////////////////////////////////////////////////////////////////////////

public function Init(IconPack_GA IconPackInstance)
{
    IconPack = IconPackInstance;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	SWITCH ICON PACK -- SHOULD BE NO LONGER REQUIRED AS ONLY ONE ICON PACK --
////////////////////////////////////////////////////////////////////////////////////////////////////

public function SwitchIconPack(IconPack_GA IconPackInstance)
{
    local int i;

    IconPack = IconPackInstance;
    for(i = 0; i < ArrowObjectRelations.Length; i++)
    {
        ArrowObjectRelations[i].Arrow.SetIcon(IconPackInstance, ArrowObjectRelations[i].Arrow.CurrentIndicatorValue, true);
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	INDICATORS - ARROWS
////////////////////////////////////////////////////////////////////////////////////////////////////

public function XComGameState_InteractiveObject GetObjectForArrow(XComGameState_IndicatorArrow_GA Arrow)
{
    local XComGameState_InteractiveObject InteractiveObject;
    local ArrowObjectRelation newRelation;
    local TTile ArrowTile;
    local int i;

    // Try the local cache first
    i = ArrowObjectRelations.Find('Arrow', Arrow);
    if (i != INDEX_NONE)
    {
        return XComGameState_InteractiveObject(`XCOMHISTORY.GetGameStateForObjectID(ArrowObjectRelations[i].ObjectID));
    }

    // Else search all interactive objects and insert in the local cache before returning it
    ArrowTile = `XWORLD.GetTileCoordinatesFromPosition(Arrow.Location);
    
    foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_InteractiveObject', InteractiveObject)
    {
        if(ArrowTile == InteractiveObject.TileLocation)
        {
            newRelation.Arrow = Arrow;
            newRelation.ObjectID = InteractiveObject.ObjectID;
            ArrowObjectRelations.AddItem(newRelation);
            return InteractiveObject;
        }
    }
    return none;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	INDICATORS - DOORS
////////////////////////////////////////////////////////////////////////////////////////////////////

public function DoorHackingIndicator_GA GetDoorHackingIndicator(XComGameState_InteractiveObject Door, Actor SpawnObjectOwner)
{
    local DoorHackingIndicatorRelation newDoorHackingIndicatorRelation;
    local int i;

    i = DoorHackingIndicators.Find('ObjectID', Door.ObjectID);

    if(i == INDEX_NONE)
    {
        i = DoorHackingIndicators.Length;
        newDoorHackingIndicatorRelation.ObjectID = Door.ObjectID;
        newDoorHackingIndicatorRelation.DoorHackingIndicator = SpawnObjectOwner.Spawn(class'DoorHackingIndicator_GA', SpawnObjectOwner);
        newDoorHackingIndicatorRelation.DoorHackingIndicator.Init(Door);
        DoorHackingIndicators.AddItem(newDoorHackingIndicatorRelation);
    }

    return DoorHackingIndicators[i].DoorHackingIndicator;
}

public function DestroyAllDoorHackingIndicators()
{
    local int i;

    for(i = 0; i < DoorHackingIndicators.Length; i++)
    {
        DoorHackingIndicators[i].DoorHackingIndicator.Destroy();
    }

    DoorHackingIndicators.Length = 0;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	INDICATORS - TOWERS
////////////////////////////////////////////////////////////////////////////////////////////////////

public function bool TowerHasBeenRevealed(XComGameState_InteractiveObject Tower)
{
    return ArrowObjectRelations.Find('ObjectID', Tower.ObjectID) != INDEX_NONE;
}

public function AddRevealedTower(XComGameState_InteractiveObject Tower, XComGameState_IndicatorArrow_GA Arrow, EIndicatorValue IndicatorValue)
{
    local ArrowObjectRelation newRelation;

    newRelation.Arrow = Arrow;
    newRelation.ObjectID = Tower.ObjectID;
    ArrowObjectRelations.AddItem(newRelation);
}

public function XComGameState_IndicatorArrow_GA RemoveTowerFromCache(XComGameState_InteractiveObject TowerObject)
{
    local int i;
    local XComGameState_IndicatorArrow_GA Arrow;

    i = ArrowObjectRelations.Find('ObjectID', TowerObject.ObjectID);
    if (i != INDEX_NONE)
    {
        Arrow = ArrowObjectRelations[i].Arrow;
        ArrowObjectRelations.RemoveItem(ArrowObjectRelations[i]);
    }
    return Arrow;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	UNITFLAGS - LOS FLAGS
////////////////////////////////////////////////////////////////////////////////////////////////////

public function ForceUnitFlagCacheRefresh()
{
    local UIUnitFlagManager_GA UIFlgMgr;
    local UnitFlagCacheItem newCacheItem;
	local UIUnitFlag kFlag;
   	local int i;

    UIFlgMgr = UIUnitFlagManager_GA(`PRES.m_kUnitFlagManager);

    UnitFlagCache.Length = 0;

    for( i = 0 ; i > UIFlgMgr.m_arrFlags.Length ; i++ )
    {
        kFlag = UIFlgMgr.m_arrFlags[i];
        if (kFlag != none)
        {
            //newCacheItem = GetCacheItemForUnitFlag(kFlag);
            newCacheItem.UnitFlag = kFlag;
            newCacheItem.UnitObjectID = kFlag.StoredObjectID;
            newCacheItem.UnitLOSIcon = kFlag.Spawn(class'UIUnitLOSIndicator_GA', kFlag).InitIndicator(kFlag);
            newCacheItem.UnitActivationIcon = kFlag.Spawn(class'UIUnitActivationIndicator_GA', kFlag).InitIndicator();

            UnitFlagCache.AddItem(newCacheItem);
        }
    }
}

public function UIUnitLOSIndicator_GA GetLOSIndicatorForUnitFlag(UIUnitFlag UnitFlag)
{
    local int CacheIndex;

    CacheIndex = UnitFlagCache.Find('UnitFlag', UnitFlag);
    if(CacheIndex != INDEX_NONE)
    {
        return UnitFlagCache[CacheIndex].UnitLOSIcon;
    }

    //IF WE ARE HERE THE CACHE_INDEX == NONE
    //'GET' ALSO CREATES A NEW CACHE ENTRY IF NEEDED
    return GetCacheItemForUnitFlag(UnitFlag).UnitLOSIcon;
}

public function UIUnitActivationIndicator_GA GetActivationIndicatorForUnitObjectID(int ObjectID)
{
    local UIUnitFlagManager_GA UIFlgMgr;
    local UIUnitFlag UnitFlag;
    local int CacheIndex;

    CacheIndex = UnitFlagCache.Find('UnitObjectID', ObjectID);
    if(CacheIndex != INDEX_NONE)
    {
        return UnitFlagCache[CacheIndex].UnitActivationIcon;
    }
    
    //IF WE ARE HERE THE CACHE_INDEX == NONE
    //'GET' ALSO CREATES A NEW CACHE ENTRY IF NEEDED
    UIFlgMgr = UIUnitFlagManager_GA(`PRES.m_kUnitFlagManager);
    UnitFlag = UIFlgMgr.GetFlagForObjectID(ObjectID);

    return GetCacheItemForUnitFlag(UnitFlag).UnitActivationIcon;
}

private function UnitFlagCacheItem GetCacheItemForUnitFlag(UIUnitFlag UnitFlag)
{
    local UnitFlagCacheItem newCacheItem;
    local int CacheIndex;

    CacheIndex = UnitFlagCache.Find('UnitFlag', UnitFlag);
    if(CacheIndex != INDEX_NONE)
    {
        return UnitFlagCache[CacheIndex];
    }

    //IF WE ARE HERE THE CACHE_INDEX == NONE
    //CREATE A NEW CACHE ENTRY FOR THIS UNIT FLAG
    newCacheItem.UnitFlag = UnitFlag;
    newCacheItem.UnitObjectID = UnitFlag.StoredObjectID;
    newCacheItem.UnitLOSIcon = UnitFlag.Spawn(class'UIUnitLOSIndicator_GA', UnitFlag).InitIndicator(UnitFlag);
    newCacheItem.UnitActivationIcon = UnitFlag.Spawn(class'UIUnitActivationIndicator_GA', UnitFlag).InitIndicator();

    UnitFlagCache.AddItem(newCacheItem);

    return newCacheItem;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	REVEALED ENEMIES OF UNIT
////////////////////////////////////////////////////////////////////////////////////////////////////

/*
    <> TODO: INVESTIGATE USAGE OF TACTICAL VISIBILITY HELPERS HERE
    /// Returns an out param, VisibleUnits, containing all the units (and, optionally, destructibles) that a given player can see
	//Set default conditions (visible units need to be alive and game play visible) if no conditions were specified
    GetAllVisibleObjectsForPlayer(int PlayerStateObjectID, out array<StateObjectReference> VisibleUnits, optional array<X2Condition> RequiredConditions, int HistoryIndex = -1, bool IncludeNonUnits = false))

   	VisibilityMgr = `TACTICALRULES.VisibilityMgr;
    RequiredConditions = class'X2TacticalVisibilityHelpers'.default.LivingGameplayVisibleFilter;
	VisibilityMgr.GetAllVisibleToSource(kUnit.ObjectID, VisibleUnits, class'XComGameState_Unit', HistoryIndex, RequiredConditions);

    local GameRulesCache_VisibilityInfo OutVisInfo;
	local X2GameRulesetVisibilityManager VisibilityMgr;

   	VisibilityMgr = `TACTICALRULES.VisibilityMgr;
    VisibilityMgr.GetVisibilityInfo(Unit.ID, EnemyUnit.ID, OutVisInfo);
    if (OutVisInfo.bVisibleGameplay)
    {
        RevealedEnemies.AddItem(EnemyUnit);
    }

	//bVisibleBasic; //TRUE if LOS is clear *AND* PeekToTargetDist is less than the source's visibility radius.	
	//bVisibleGameplay reflects game play mechanics like stealth, where bVisiblBasic might be true but the state of the unit makes it hidden
*/

public function array<XComGameState_Unit> GetRevealedEnemiesOfUnit(XComGameState_Unit Unit, bool bForceAllRevealed)
{
    local array<XComGameState_Unit> RevealedEnemies;
    local XComGameState_Unit EnemyUnit;
    local int i;
    
    for(i = UnitFlagCache.Length - 1 ; i >= 0 ; i--)
    {
        EnemyUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(UnitFlagCache[i].UnitFlag.StoredObjectId));

        // Do some cleanup since we're going through the Cache anyway 
        // Extra check to ensure they are dead too ... Dead units don't have UnitFlags anymore
        // so if both of these are true we can remove it, anyway!
        if(UnitFlagCache[i].UnitFlag == none && EnemyUnit.IsDead() )
        {
            UnitFlagCache.RemoveItem(UnitFlagCache[i]);
            continue;
        }
        
        // If unit is alive enemy, and visible.. add it
        if(EnemyUnit.IsEnemyUnit(Unit) && EnemyUnit.IsAlive() && ((EnemyUnit.GetVisualizer().IsVisible() || bForceAllRevealed)) )
        {
            RevealedEnemies.AddItem(EnemyUnit);
        }
    }

    return RevealedEnemies;
}
