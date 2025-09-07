////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    10/07/23    02:00
////////////////////////////////////////////////////////////////////////////////////////////////////

class ObjectiveIndicatorUtility_GA extends Object within UIUnitFlagManager_GA config (Game);

`include(WOTC_GotchaAgainRedux\Src\ModConfigMenuAPI\MCM_API_CfgHelpers.uci)

var config array<name> HackingPerkNames, FinaliseHackingPerkNames;

var privatewrite IconPack_GA IconPack;
var privatewrite CacheUtility_GA CacheUtility;
var privatewrite LOSUtility_GA LOSUtility;
var privatewrite UnitIndicatorUtility_GA UnitIndicatorUtility;

var private bool InitializedArrows;
var private int LocalClientPlayerObjectID;
var private float LastDHIPrevention; // Used to make sure we only hide the default doorhacking indicators once per tick

////////////////////////////////////////////////////////////////////////////////////////////////////
//	ON INIT
////////////////////////////////////////////////////////////////////////////////////////////////////

public function Init(CacheUtility_GA CacheUtilityInstance, LOSUtility_GA LOSUtilityInstance, UnitIndicatorUtility_GA UnitIndicatorUtilityInstance, IconPack_GA IconPackInstance)
{
    CacheUtility = CacheUtilityInstance;
    LOSUtility = LOSUtilityInstance;
    UnitIndicatorUtility = UnitIndicatorUtilityInstance;
    IconPack = IconPackInstance;

	InitializedArrows = false;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	SWITCH ICON PACK -- SHOULD NO LONGER BE NEEDED AS ONLY ONE PACK --
////////////////////////////////////////////////////////////////////////////////////////////////////

public function SwitchIconPack(IconPack_GA IconPackInstance)
{
    IconPack = IconPackInstance;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	INDICATORS OBJECT PROCESSING
////////////////////////////////////////////////////////////////////////////////////////////////////

public function ProcessObjectiveIndicators(const out TTile DestinationTile)
{
    local XComGameState_IndicatorArrow_GA Arrow;
    local XComGameState_Unit TargetUnit;
    local GameRulesCache_VisibilityInfo VisibilityInfo;
    local LOSValues LOSValuesForObjective;
    local EIndicatorValue IndicatorValue;
    local XComGameState_InteractiveObject ObjectiveObject;
    local array<TTile> VisibilityTiles;
    local XComGameStateHistory History;

    History = `XCOMHISTORY;

    if(`GETMCMVAR(bShowRemoteDoorHackingIndicators) )
    {
        ProcessDoorHackingIndicators(DestinationTile);
    }

	if(`GETMCMVAR(bShowTowerHackingArrows) && !InitializedArrows)
    {
        RegisterForTowerTriggers();
    }

    foreach History.IterateByClassType(class'XComGameState_IndicatorArrow_GA', Arrow)
    {
        // First check if the objective being pointed at is an enemy unit which will mean it is a "neutralize VIP"-objective
        if(Arrow.PointsToUnit())
        {
            TargetUnit = XComGameState_Unit(History.GetGameStateForObjectID(Arrow.Unit.ObjectID));

            if(TargetUnit != none && TargetUnit.IsEnemyUnit(Outer.ControlledUnit))
            {
                // Set VisibilityInfo from side-effect to be used in call to flanking function
                LOSValuesForObjective = LOSUtility.GetLOSValues(DestinationTile, TargetUnit.TileLocation, Outer.ControlledUnit, TargetUnit, Outer.ControlledUnitSightRange, VisibilityInfo);
                LOSValuesForObjective.bFlanked = LOSUtility.TargetIsFlankedFromTile(DestinationTile, Outer.ControlledUnit, TargetUnit, VisibilityInfo);
                
                IndicatorValue = UnitIndicatorUtility.GetIndicatorValueForUnit(Outer.ControlledUnit, TargetUnit, LOSValuesForObjective);

                Arrow.SetIcon(IconPack, IndicatorValue);
            }

            continue;
        }

        ObjectiveObject = CacheUtility.GetObjectForArrow(Arrow);
        if (ObjectiveObject == none)
        {
            // Some objectives don't have an associated object (evac-beacons and maybe others)
            // We don't do any processing for these
            continue;
        }
        else if(ObjectiveObject.MustBeHacked())
        {
            // If the object cannot be hacked by the current unit we skip processing it
            if(!ObjectiveObject.CanInteractHack(Outer.ControlledUnit))
            {
                continue;
            }
            else if(`GETMCMVAR(bShowTowerHackingArrowsWithoutSight))
            {
                IndicatorValue = eHackable;
            }
            else if(Outer.ControlledUnit.HasAnyOfTheAbilitiesFromAnySource(default.HackingPerkNames))
            {
                VisibilityTiles.Length = 0;
                ObjectiveObject.NativeGetVisibilityLocation(VisibilityTiles);
                LOSValuesForObjective = GetBestLOSForTileArray(DestinationTile, VisibilityTiles, Outer.ControlledUnit, none, Outer.ControlledUnitSightRange);
                IndicatorValue = GetIndicatorValueForHackable(Outer.ControlledUnit, LOSValuesForObjective); // eHackable : eNotVisible;
            }
            else
            {
                // If Unit is not able to hack remotely, we do a final check if it will be possible to do a "regular" hack from the destination tile
                IndicatorValue = CanbeHackedByRegularUnitFromTile(DestinationTile, ObjectiveObject) ? eHackable : eNotVisible;
            }
        }
        else if (ObjectiveObject.TargetIsEnemy(Outer.ControlledUnit.ObjectID))
        {
            // If the objective is not hackable it must be a "destroy something" objective
            VisibilityTiles.Length = 0;
            ObjectiveObject.NativeGetVisibilityLocation(VisibilityTiles);
           
            LOSValuesForObjective = GetBestLOSForTileArray(DestinationTile, VisibilityTiles, Outer.ControlledUnit, none, Outer.ControlledUnitSightRange);
            IndicatorValue = GetIndicatorValueForDestructible(Outer.ControlledUnit, LOSValuesForObjective);
        }
        else
        {
            // If the objective is not hackable nor something we should destroy, we don't do anything
            continue;
        }

        Arrow.SetIcon(IconPack, IndicatorValue);
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	INDICATORS - RESET ALL
////////////////////////////////////////////////////////////////////////////////////////////////////

public function ResetAllObjectiveIndicators()
{
    local XComGameState_IndicatorArrow_GA Arrow;
    local XComGameState_InteractiveObject Tower;
    local EIndicatorValue IndicatorValue;
    local int i;

    // Don't change indicators for any towers if they have already been hacked
    if (!CacheUtility.bAdventTowersHaveBeenHacked)
    {
        for(i = 0; i < CacheUtility.ArrowObjectRelations.Length; i++)
        {
            Arrow = CacheUtility.ArrowObjectRelations[i].Arrow;
            Tower = CacheUtility.GetObjectForArrow(Arrow);

            if (Arrow.IsTowerIndicatorArrowByObjectType(CacheUtility, Arrow))
            {
                //hide thyself!
                IndicatorValue = UpdateTowerVisibility(Tower);
                Arrow.SetIcon(IconPack, IndicatorValue, true);
            }
        }
    }

	//hide door indicators
    for(i = 0; i < CacheUtility.DoorHackingIndicators.Length; i++)
    {
        CacheUtility.DoorHackingIndicators[i].DoorHackingIndicator.Hide();
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	INDICATORS - TOWER ARROWS
////////////////////////////////////////////////////////////////////////////////////////////////////

private function AddTowerArrow(XComGameState_InteractiveObject Tower)
{
    local XComGameState_IndicatorArrow_GA Arrow;
    local EIndicatorValue IndicatorValue;
    local vector ArrowLocation;
    local string ArrowIcon;

    IndicatorValue = CacheUtility.bAdventTowersHaveBeenHacked ? eAlreadyHacked : eNotVisible;

    ArrowIcon = IconPack.GetIconFromIconSet(eHackAdventTower, IndicatorValue);
    ArrowLocation = `XWORLD.GetPositionFromTileCoordinates(Tower.TileLocation);
    Arrow = XComGameState_IndicatorArrow_GA(class'XComGameState_IndicatorArrow_GA'.static.CreateArrowPointingAtLocation(ArrowLocation, , , , ArrowIcon));

    CacheUtility.AddRevealedTower(Tower, Arrow, IndicatorValue);
}

public function EIndicatorValue UpdateTowerVisibility(XComGameState_InteractiveObject Tower)
{
    local EIndicatorValue IndicatorValue;
    local LOSValues LOSValuesForTower;
    local array<TTile> VisibilityTiles;
    local TTile DestinationTile;

    if(Tower.MustBeHacked())
    {
        // If the object cannot be hacked by the current unit we skip processing it
        if(!Tower.CanInteractHack(Outer.ControlledUnit))
        {
            IndicatorValue = -1; //eNotVisible; //eNotVisible actually == default icon
        }
        else if(`GETMCMVAR(bShowTowerHackingArrowsWithoutSight))
        {
            IndicatorValue = eNotVisible; //eNotVisible actually == default icon
        }
        else if(Outer.ControlledUnit.HasAnyOfTheAbilitiesFromAnySource(default.HackingPerkNames) )
        {
            VisibilityTiles.Length = 0;
            Tower.NativeGetVisibilityLocation(VisibilityTiles);
            LOSValuesForTower = GetBestLOSForTileArray(DestinationTile, VisibilityTiles, Outer.ControlledUnit, none, Outer.ControlledUnitSightRange);
            IndicatorValue = GetIndicatorValueForHackable(Outer.ControlledUnit, LOSValuesForTower); // eHackable : eNotVisible;
        }
        else
        {
            // If Unit is not able to hack remotely, we do a final check if it will be possible to do a "regular" hack from the destination tile
            IndicatorValue = CanbeHackedByRegularUnitFromTile(DestinationTile, Tower) ? eHackable : eNotVisible;
        }
    
        //Arrow.SetIcon(IconPack, IndicatorValue);
        return IndicatorValue;
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	INDICATORS - DESTRUCTIBLES
////////////////////////////////////////////////////////////////////////////////////////////////////

public function EIndicatorValue GetIndicatorValueForDestructible(XComGameState_Unit SourceUnit, const out LOSValues LOSValuesForUnit)
{
    if(!LOSValuesForUnit.bClearLOS) return eNotVisible;

    // Reaching this, we know there is clear LOS
    if(LOSValuesForUnit.bWithinRegularRange) return eSpotted;

    // Here we also know the target is outside regular range
    return SourceUnit.HasSquadsight() ? eSquadsight : eNotVisible;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	INDICATORS - TOWERS
////////////////////////////////////////////////////////////////////////////////////////////////////

private function RegisterForTowerTriggers()
{
    local Object ThisObj;

    ThisObj = self;
    LocalClientPlayerObjectID = X2TacticalGameRuleset(XComGameInfo(class'Engine'.static.GetCurrentWorldInfo().Game).GameRuleset).GetLocalClientPlayerObjectID();

	// Add all currently visible towers if LocationScout sitrep is active.
	AddAllVisibleTowers();

    /* Register for reveal events */    `XEVENTMGR.RegisterForEvent(ThisObj, 'ObjectVisibilityChanged', OnTowerRevealed, ELD_OnStateSubmitted);
    /* Register for hacking events */   `XEVENTMGR.RegisterForEvent(ThisObj, 'AbilityActivated', OnHackFinalized, ELD_Immediate);
    /* Register for destroyed events */ `XEVENTMGR.RegisterForEvent(ThisObj, 'ObjectDestroyed', OnTowerDestroyed, ELD_OnStateSubmitted);

	InitializedArrows = true;
}

function EventListenerReturn OnTowerRevealed(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameState_InteractiveObject Tower;
    local XComInteractiveLevelActor TowerActor;
    local XComGameState_Unit SourceUnit;
    local GameRulesCache_VisibilityInfo VisibilityInfo;

    SourceUnit = XComGameState_Unit(EventSource);
    if(SourceUnit != none && SourceUnit.ControllingPlayer.ObjectID == LocalClientPlayerObjectID)
    {
        Tower = XComGameState_InteractiveObject(EventData);
        if(Tower != none)
        {
            TowerActor = XComInteractiveLevelActor(`XCOMHISTORY.GetVisualizer(Tower.ObjectID));
            if(TowerActor != none && TowerActor.ActorType == Type_AdventTower && !CacheUtility.TowerHasBeenRevealed(Tower))
            {
                // Get VisibilityInfo from side-effect
                X2TacticalGameRuleset(XComGameInfo(class'Engine'.static.GetCurrentWorldInfo().Game).GameRuleset).VisibilityMgr.GetVisibilityInfo(SourceUnit.ObjectID, Tower.ObjectId, VisibilityInfo);
                if(VisibilityInfo.bVisibleGameplay)
                {
                    AddTowerArrow(Tower);
                }
            }
        }
    }

	return ELR_NoInterrupt;
}

function EventListenerReturn OnTowerDestroyed(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameState_InteractiveObject Tower;
    local XComGameState_IndicatorArrow_GA Arrow;
    local XComInteractiveLevelActor TowerActor;
    
    Tower = XComGameState_InteractiveObject(EventSource);
    if(Tower != none)
    {
        TowerActor = XComInteractiveLevelActor(`XCOMHISTORY.GetVisualizer(Tower.ObjectID));
        if(TowerActor != none && TowerActor.ActorType == Type_AdventTower)
        {
            Arrow = CacheUtility.RemoveTowerFromCache(Tower);
            if(Arrow != none)
            {
                //remove thyself!
                Arrow.RemoveArrowPointingAtLocation(Arrow.Location);
            }
        }
    }

	return ELR_NoInterrupt;
}

public function AddAllVisibleTowers()
{
	local XComInteractiveLevelActor InteractiveActor;
	local XComGameState_InteractiveObject InteractiveObject;
	local XComGameStateHistory History;
	local XComGameState_BattleData BattleData;

	History = `XCOMHISTORY;
	BattleData = XComGameState_BattleData(History.GetSingleGameStateObjectForClass(class'XComGameState_BattleData'));

	if (BattleData.ActiveSitReps.Find('LocationScout') != INDEX_NONE || `GETMCMVAR(bShowTowerHackingArrowsWithoutSight) )
	{
		foreach class'WorldInfo'.static.GetWorldInfo().AllActors(class'XComInteractiveLevelActor', InteractiveActor)
		{
			InteractiveObject = InteractiveActor.GetInteractiveState(History.GetStartState());
			if(InteractiveActor.ActorType == Type_AdventTower && !CacheUtility.TowerHasBeenRevealed(InteractiveObject))
			{
				AddTowerArrow(InteractiveObject);
			}
		}
	}
}

function SetTowersHaveBeenHackedAlready()
{
    local XComGameState_IndicatorArrow_GA Arrow;
    local Object ThisObj;
    local int i;

    CacheUtility.bAdventTowersHaveBeenHacked = true;
    ThisObj = self;
    
    for(i = CacheUtility.ArrowObjectRelations.Length - 1; i > -1; i--)
    {
        Arrow = CacheUtility.ArrowObjectRelations[i].Arrow;

        if(Arrow.IsTowerIndicatorArrowByObjectType(CacheUtility, Arrow))
        {
            if(`GETMCMVAR(bHideTowerArrowsAfterHacking))
            {
                Arrow.RemoveArrowPointingAtLocation(Arrow.Location);
                CacheUtility.ArrowObjectRelations.RemoveItem(CacheUtility.ArrowObjectRelations[i]);

                // We can unregister from this event now since we no longer care about updating towers
                `XEVENTMGR.UnRegisterFromEvent(ThisObj, 'ObjectVisibilityChanged');
            }
            else
            {
                Arrow.SetIcon(IconPack, eAlreadyHacked);
            }
        }
    }

    // Unregister from this event since only one tower can be hacked per mission
    `XEVENTMGR.UnRegisterFromEvent(ThisObj, 'AbilityActivated');
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	INDICATORS - DOORS
////////////////////////////////////////////////////////////////////////////////////////////////////

public function ProcessDoorHackingIndicators(const out TTile DestinationTile)
{
    local XComGameState_InteractiveObject InteractiveObject;
    local DoorHackingIndicator_GA DoorHackingIndicator;
    local LOSValues LOSToDoor;
    local bool CanHackDoor;
    local int i;
    local array<TTile> VisibilityTiles;

    foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_InteractiveObject', InteractiveObject)
    {
        if(InteractiveObject.IsDoor() && InteractiveObject.LockStrength > 0 && !InteractiveObject.bHasBeenHacked)
        {
            DoorHackingIndicator = CacheUtility.GetDoorHackingIndicator(InteractiveObject, Outer);
            
            CanHackDoor = false;
            if(Outer.ControlledUnit.HasAnyOfTheAbilitiesFromAnySource(default.HackingPerkNames))
            {
                VisibilityTiles.Length = 0;
                InteractiveObject.NativeGetVisibilityLocation(VisibilityTiles);
                
                for(i = 0; i < VisibilityTiles.Length; i++)
                {
                    LOSToDoor = LOSUtility.GetLOSValues(DestinationTile, VisibilityTiles[i], Outer.ControlledUnit, none, Outer.ControlledUnitSightRange);

                    if(LOSToDoor.bClearLOS && LOSToDoor.bWithinRegularRange)
                    {
                        CanHackDoor = true;
                        break;
                    }
                }
            }
            else
            {
                CanHackDoor = CanBeHackedByRegularUnitFromTile(DestinationTile, InteractiveObject);
            }

            if(CanHackDoor) { DoorHackingIndicator.Show(); }
            else            { DoorHackingIndicator.Hide(); }
        }
    }
}

public function HideDefaultDoorHackingIndicators()
{
    local XComActionIconManager ActionIconManager;
    local int i;

    if(LastDHIPrevention == class'WorldInfo'.static.GetWorldInfo().TimeSeconds)
    {
        return;
    }

    ActionIconManager = XComPresentationLayer(XComPlayerController(class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController()).Pres).GetActionIconMgr();

    for(i = 0; i < ActionIconManager.ACTION_ICON_POOL_SIZE; i++)
    {
        if(ActionIconManager.InteractiveIconPool[i].Component.StaticMesh == StaticMesh'UI_3D.Hacking.Hacking_Door')
        {
            ActionIconManager.InteractiveIconPool[i].Component.SetHidden(true);
        }
    }

    LastDHIPrevention = class'WorldInfo'.static.GetWorldInfo().TimeSeconds;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	INDICATORS - HACKING
////////////////////////////////////////////////////////////////////////////////////////////////////

private function EIndicatorValue GetIndicatorValueForHackable(XComGameState_Unit SourceUnit, const out LOSValues LOSValuesForObjective)
{
    return (LOSValuesForObjective.bClearLOS && LOSValuesForObjective.bWithinRegularRange) ? eHackable : eNotVisible;
}

private function bool CanBeHackedByRegularUnitFromTile(const out TTile SourceTile, XComGameState_InteractiveObject ObjectiveObject)
{
    local TTile CheckTile;  // We need an out variable for the GetTileData() call
    local TileData DestTileData;
    local int i, j;
    local XComWorldData WorldData;

    WorldData = `XWORLD;

    for(j = 0; j < Outer.ControlledUnit.UnitHeight; j++)
    {
        CheckTile = SourceTile;
        CheckTile.Z += j;
        WorldData.GetTileData(CheckTile, DestTileData); // DestTileData from side-effect!

        for(i = 0; i < DestTileData.InteractPoints.Length; i++)
        {
            if(DestTileData.InteractPoints[i].InteractiveActor.ObjectID == ObjectiveObject.ObjectID)
            {
                return true;
            }
        }
    }
    return false;
}

function EventListenerReturn OnHackFinalized(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameState_Ability AbilityState;
    local XComInteractiveLevelActor TowerActor;

    // We're only interested in FinalizeIntrusion events
    AbilityState = XComGameState_Ability(EventData);
    if(AbilityState != none && default.FinaliseHackingPerkNames.Find(AbilityState.GetMyTemplateName()) != INDEX_NONE)
    {
        // Check if the hacked object was a tower
        TowerActor = XComInteractiveLevelActor(`XCOMHISTORY.GetVisualizer(XComGameStateContext_Ability(GameState.GetContext()).InputContext.PrimaryTarget.ObjectID));
        if(TowerActor != none && TowerActor.ActorType == Type_AdventTower)
        {
            SetTowersHaveBeenHackedAlready();
        }
    }
    
    return ELR_NoInterrupt;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	GET BEST LOS FOR TILE
////////////////////////////////////////////////////////////////////////////////////////////////////

private function LOSValues GetBestLOSForTileArray(const out TTile SourceTile, const out array<TTile> DestTiles, XComGameState_Unit SourceUnit, XComGameState_Unit TargetUnit, int SightRange)
{
    local LOSValues CurrentLOSValues,
                    BestLOSValuesSoFar;
    local int i;

    for(i = 0; i < DestTiles.Length; i++)
    {
        CurrentLOSValues = LOSUtility.GetLOSValues(SourceTile, DestTiles[i], SourceUnit, TargetUnit, SightRange);

        if(CurrentLOSValues.bClearLOS && !BestLOSValuesSoFar.bClearLOS ||
           CurrentLOSValues.bWithinRegularRange && !BestLOSValuesSoFar.bWithinRegularRange)
        {
            BestLOSValuesSoFar = CurrentLOSValues;
        }

        if(BestLOSValuesSoFar.bWithinRegularRange)
        {
            break;
        }
    }

    return BestLOSValuesSoFar;
}
