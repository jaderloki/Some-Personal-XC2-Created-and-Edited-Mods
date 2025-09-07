////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    16/10/23    01:45
////////////////////////////////////////////////////////////////////////////////////////////////////

class UnitIndicatorUtility_GA extends Object within UIUnitFlagManager_GA config (Game);

`include(WOTC_GotchaAgainRedux\Src\ModConfigMenuAPI\MCM_API_CfgHelpers.uci)

var config array<name> LoneWolfPerkNames, HackHaywirePerkNames, SquadSightGremlinPerkNames;
var config int LONEWOLF_MIN_DIST_TILES, LONEWOLF_MAX_DIST_TILES;

var private IconPack_GA IconPack;
var private CacheUtility_GA CacheUtility;
var private LOSUtility_GA LOSUtility;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  INIT
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

public function Init(CacheUtility_GA _CacheUtility, LOSUtility_GA _LOSUtility, IconPack_GA _IconPack)
{
    CacheUtility = _CacheUtility;
    LOSUtility = _LOSUtility;
    IconPack = _IconPack;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  SWITCH ICONS
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//SHOULDN'T BE NEEDED ANYMORE AS ONLY 1 ICON PACK
public function SwitchIconPack(IconPack_GA IconPackInstance)
{
    IconPack = IconPackInstance;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MAIN LOS INDICATORS
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

public function ProcessUnitIndicators(const out TTile DestinationTile, optional bool DoLoneWolfIndicator = false)
{
    local XComGameStateHistory History;
    local XComGameState_Unit TargetUnit;
    local UIUnitFlag UnitFlag;
    local GameRulesCache_VisibilityInfo VisibilityInfo;
    local LOSValues LOSValuesForUnit, initialLOSValues;
    local bool LoneWolfWillBeActive;
    local int LoneWolfDistance;

    History = `XCOMHISTORY;

    foreach Outer.m_arrFlags(UnitFlag)
    {
        TargetUnit = XComGameState_Unit(History.GetGameStateForObjectID(UnitFlag.StoredObjectID));

        if(TargetUnit == none)
        {
            continue;
        }

        LOSValuesForUnit = initialLOSValues;
        LoneWolfWillBeActive = false;
        LoneWolfDistance = -1;

        if(Outer.bControlledUnitIsVIP)
        {
            if(TargetUnit.IsEnemyUnit(Outer.ControlledUnit))
            {
                // VIPs have no use for the regular indicators since they cannot shoot. Instead we process LOS from
                // hostile units to the VIP to show an indicator for the hostile unit being able to see/shoot the VIP.
                if(`GETMCMVAR(bShowVIPSpottedByEnemyIndicators))
                {
                    LOSValuesForUnit = LOSUtility.GetLOSValues(TargetUnit.TileLocation, DestinationTile, TargetUnit, Outer.ControlledUnit, class'LOSUtility_GA'.static.GetUnitSightRange(TargetUnit));
                }
            }
            else
            {
                // For consistency, do the regular indicator for friendly units event though VIPs have no use for them
                LOSValuesForUnit = LOSUtility.GetLOSValues(DestinationTile, TargetUnit.TileLocation, Outer.ControlledUnit, TargetUnit, Outer.ControlledUnitSightRange);
            }
        }
        else
        {
            LOSValuesForUnit = LOSUtility.GetLOSValues(DestinationTile, TargetUnit.TileLocation, Outer.ControlledUnit, TargetUnit, Outer.ControlledUnitSightRange, VisibilityInfo);
            
            // Set VisibilityInfo from side-effect to be used in call to flanking function
            // Only update flanked status for enemy units
            if(TargetUnit.IsEnemyUnit(Outer.ControlledUnit))
            {
                LOSValuesForUnit.bFlanked = LOSUtility.TargetIsFlankedFromTile(DestinationTile, Outer.ControlledUnit, TargetUnit, VisibilityInfo);
            }
        }

        if(DoLoneWolfIndicator && TargetUnit == Outer.ControlledUnit && Outer.ControlledUnit.HasAnyOfTheAbilitiesFromAnySource(default.LoneWolfPerkNames))
        {
            LoneWolfActiveFromTile(DestinationTile, LoneWolfDistance);
            LoneWolfWillBeActive = true;

            //ADJUST ALPHA OF LWOTC LONEWOLF INDICATOR
            CacheUtility.GetLOSIndicatorForUnitFlag(UnitFlag).SetWolfAlpha(LoneWolfDistance);
        }

        CacheUtility.GetLOSIndicatorForUnitFlag(UnitFlag).SetIcon(IconPack, GetIndicatorValueForUnit(Outer.ControlledUnit, TargetUnit, LOSValuesForUnit, LoneWolfWillBeActive));
        
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  INFORMATION GATHERING - REPORT FOR OTHER FILES -
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

public function EIndicatorValue GetIndicatorValueForUnit(XComGameState_Unit SourceUnit, XComGameState_Unit TargetUnit, const out LOSValues LOSValuesForUnit, optional bool LoneWolfIndicator = false)
{
    // FIRST CHECK IF WE'RE DOING THE LONE WOLF INDICATOR ON OURSELF
    if(SourceUnit == TargetUnit) { if(LoneWolfIndicator) { return eLoneWolfActive; } else { return eNotVisible; } }

    // CHECK FOR CLEAR LOS TO TARGET, IF WE DON'T HAVE CLEAR LOS, BAIL
    if(!LOSValuesForUnit.bClearLOS)
    {
        // CHECK FOR UNIT HACKING, AS SQUADSIGHT HACKING DOES NOT ACTUALLY REQUIRE CLEAR LOS BUT STILL REQUIRES UNIT IS GAMEPLAY VISIBLE
        if(`GETMCMVAR(bShowSquadsightHackingIndicator) 
            && SourceUnit.HasAnyOfTheAbilitiesFromAnySource(default.HackHaywirePerkNames) 
            && TargetUnit.IsRobotic() 
            && !TargetUnit.HasBeenHacked() 
            && LOSValuesForUnit.bWithinGameplayVisible )
        {
            return eHackable;
        }

        // CHECK FOR SQUADSIGHT GREMLIN PERKS, AS THESE DO NOT ACTUALLY REQUIRE CLEAR LOS, OR REGULAR SIGHT RANGE, BUT STILL REQUIRES UNIT IS GAMEPLAY VISIBLE
        if(`GETMCMVAR(bShowSquadsightGremlinIndicator) 
            && SourceUnit.HasAnyOfTheAbilitiesFromAnySource(default.SquadSightGremlinPerkNames) 
            && LOSValuesForUnit.bWithinGameplayVisible )
        {
            return eSquadsightGremlin; //eSquadsight;
        }

        // NO CLEAR LOS, NOT VISIBLE        
        return eNotVisible;
    }

    // IF WE HAVE CLEAR LOS - CONTINUE ON -

    // HANDLE WITHIN NORMAL RANGE INDICATORS
    if(LOSValuesForUnit.bWithinRegularRange)
    {
        if(TargetUnit.IsEnemyUnit(Outer.ControlledUnit)) { return LOSValuesForUnit.bFlanked ? eFlanked : eSpotted; }    //STANDARD SIGHT ON ENEMY UNIT
        else if (`GETMCMVAR(bShowFriendlyLOSIndicators)) { return eSpottedFriendly; }                                   //STANDARD SIGHT ON FRIENDLY UNIT
        else if (Outer.bControlledUnitIsVIP)             { return eSpottedByEnemy;  }                                   //VIP SPOTTED BY ENEMY UNITS
    }

    // HANDLE WITHIN SQUADSIGHT RANGE INDICATORS (OR MORE PRECISELY OUTSIDE REGULAR RANGE AND STILL SEEN)
    //if (LOSValuesForUnit.bWithinGameplayVisible)
    //{
        if(SourceUnit.HasSquadsight())
        {
            if(TargetUnit.IsEnemyUnit(Outer.ControlledUnit)) { return LOSValuesForUnit.bFlanked ? eSquadsightFlanked : eSquadsight; }   //SQUADSIGHT ON ENEMY UNIT
            //else if (`GETMCMVAR(bShowFriendlyLOSIndicators)) { return eSpottedFriendly; }                                             //SQUADSIGHT ON FRIENDLY UNIT
            //else if (Outer.bControlledUnitIsVIP)             { return eSpottedByEnemy;  }                                             //SQUADSIGHT VIP SPOTTED BY ENEMY UNITS
        }

        // FINAL CHECK FOR A HACKING INDICATOR IF THE UNIT CAN DO THIS, EVEN WITH CLEAR LOS
        if(`GETMCMVAR(bShowSquadsightHackingIndicator) && SourceUnit.HasAnyOfTheAbilitiesFromAnySource(default.HackHaywirePerkNames) && TargetUnit.IsRobotic() && !TargetUnit.HasBeenHacked() )
        {
            return eHackable;
        }

        // CHECK FOR SQUADSIGHT GREMLIN PERKS, AS THESE DO NOT ACTUALLY REQUIRE CLEAR LOS, OR REGULAR SIGHT RANGE, BUT DO HAVE OTHER GAMPLAY VISIBILITY TAGS
        if(`GETMCMVAR(bShowSquadsightGremlinIndicator) && SourceUnit.HasAnyOfTheAbilitiesFromAnySource(default.SquadSightGremlinPerkNames) )
        {
            return eSquadsightGremlin; //eSquadsight;
        }
    //}

    // FINALLY DECLARE NOT 'WITHIN SIGHT'
    // Reaching this, we know there is clear LOS to the target, but it is outside regular range and the source unit does not qualify for a squadsight indicator, so we return not visible
    return eNotVisible;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  INFORMATION GATHERING - FIND INFO WE NEED -
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

private function bool LoneWolfActiveFromTile(const out TTile DestinationTile, out int TileDistance)
{
    local XComGameStateHistory History;
    local XComGameState_Unit TargetUnit;
    local XComWorldData WorldData;
    local UIUnitFlag UnitFlag;
    
    WorldData = `XWORLD;
    History = `XCOMHISTORY;

    foreach Outer.m_arrFlags(UnitFlag)
    {
        //GET TARGET UNIT OF THIS UNIT FLAG
        TargetUnit = XComGameState_Unit(History.GetGameStateForObjectID(UnitFlag.StoredObjectID));
        
        //SKIP IF ANY ONE OF THESE CONDITIONS PRESENT
        if(TargetUnit == none || TargetUnit == Outer.ControlledUnit || TargetUnit.IsEnemyUnit(Outer.ControlledUnit) || TargetUnit.IsBleedingOut() || TargetUnit.bRemovedFromPlay)
        {
            continue;
        }

        //CALCULATE DISTANCE BETWEEN BOTH UNITS TILES
        TileDistance = VSize(WorldData.GetPositionFromTileCoordinates(DestinationTile) - WorldData.GetPositionFromTileCoordinates(TargetUnit.TileLocation)) / WorldData.WORLD_StepSize;

        // Grabing the distance from the LW2/LWOTC file causes a conflict (depending on loadorder it seems) breaking loot-drops... WTF?!
        //if(TileDistance <= class'X2Effect_LoneWolf'.default.LONEWOLF_MIN_DIST_TILES)
        if(TileDistance < default.LONEWOLF_MIN_DIST_TILES )
        {
            return false;
        }
    }

    return true;
}

public static function bool UnitIsVIP(XComGameState_Unit Unit)
{
    // Civilians that can flank units will not be VIPs (e.g. resistance units from LW2)
    return Unit.GetMyTemplate().bIsCivilian && !Unit.GetMyTemplate().CanFlankUnits;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  CLEAR OUR SETTINGS
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

public function ClearUnitLOSIndicators()
{
    local int i;

    for(i = 0; i < CacheUtility.UnitFlagCache.Length; i++)
    {
        // This might not have been created yet
        if(CacheUtility.UnitFlagCache[i].UnitLOSIcon != none)
        {
            CacheUtility.UnitFlagCache[i].UnitLOSIcon.SetIcon(IconPack, eNotVisible);
        }
    }    
}
