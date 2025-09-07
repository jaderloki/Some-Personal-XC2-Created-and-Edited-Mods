////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    16/10/23    01:45
////////////////////////////////////////////////////////////////////////////////////////////////////

class UIUnitFlagManager_GA extends UIUnitFlagManager;

`include(WOTC_GotchaAgainRedux\Src\ModConfigMenuAPI\MCM_API_CfgHelpers.uci)

var privatewrite IconPack_GA LoadedIconPack;
var privatewrite CacheUtility_GA CacheUtilityInstance;
var privatewrite LOSUtility_GA LOSUtilityInstance;
var privatewrite UnitIndicatorUtility_GA UnitIndicatorUtility;
var privatewrite ObjectiveIndicatorUtility_GA ObjectiveIndicatorUtility;
var privatewrite PathIndicatorUtility_GA PathIndicatorUtility;

var protected XComGameState_Unit ControlledUnit;
var protected int ControlledUnitSightRange;
var protected bool bControlledUnitIsVIP;

var bool GrappleIsActive;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  ON INIT
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

simulated function OnInit()
{
    local Object ThisObj;

    //CALL THE BASE SETUP
    super.OnInit();

    //LOAD OUR NEW ICON PACK(S)
    LoadedIconPack = class'IconPack_GA'.static.LoadIconPack();

    //CACHE STUFF
    CacheUtilityInstance = new(self) class'CacheUtility_GA';
    CacheUtilityInstance.Init(LoadedIconPack);

    LOSUtilityInstance = new(self) class'LOSUtility_GA';

    UnitIndicatorUtility = new(self) class'UnitIndicatorUtility_GA';
    UnitIndicatorUtility.Init(CacheUtilityInstance, LOSUtilityInstance, LoadedIconPack);

    ObjectiveIndicatorUtility = new(self) class'ObjectiveIndicatorUtility_GA';
    ObjectiveIndicatorUtility.Init(CacheUtilityInstance, LOSUtilityInstance, UnitIndicatorUtility, LoadedIconPack);

    if(`GETMCMVAR(bUseCustomPathIndicatorSystem))
	{
        PathIndicatorUtility = new(self) class'PathIndicatorUtility_GA';
        PathIndicatorUtility.Init(CacheUtilityInstance, LOSUtilityInstance);
    }

	//Register ourselves with the visualization mgr - (again!) this allows the UI to synchronize/verify itself with with the game state. 
    //Normally, the unit flags are updated as part of the X2Actions that visualize the game state change. 
    //'OnVisualizationBlockComplete' allows this manager to double check that the UI is in the correct state, and make corrections if necessary
	`XCOMVISUALIZATIONMGR.RegisterObserver(self);

	//When loading a save, the flags initialize with data from the latest history index.
	//Some of the visualization sync actions may trigger updates from older indexes, though. Prevent them from leaving out-of-date flags.
	//(Motivating case: destructible objects triggering a flag update when created, but not explicitly when damaged later.)
	LatestHistoryIndex = `XCOMVISUALIZATIONMGR.LastStateHistoryVisualized;

	//force an update of buffs and debuffs, fixes an issue where they would not display after loading a saved game
	ForceUpdateBuffs();

    //CLASS ALREADY IS SUBSCRIBER TO VISUALISATION - SO MOVED THIS TO USING ONACTIVEUNITCHANGED EVENT
    //class'WorldInfo'.static.GetWorldInfo().MyWatchVariableMgr.RegisterWatchVariable( XComTacticalController(`PRES.Owner), 'm_kActiveUnit', self, OnSelectedUnitChanged);

    // Clear indicators whenever an ability is activated (includes moving)! ... includes the function of the super.object!
    ThisObj = self;
    `XEVENTMGR.RegisterForEvent(ThisObj, 'AbilityActivated', OnAbilityActivated, ELD_OnVisualizationBlockCompleted);
    `XEVENTMGR.RegisterForEvent(ThisObj, 'PlayerTurnBegun', OnPlayerTurnBegun, ELD_OnStateSubmitted);

    //REFACTOR LOOKING FOR SPECIFIC PERK NAMES NOW NO LONGER REQUIRES SPECIFICALLY CHECKING FOR LWOTC !!
    //bLongWar2Detected = class'X2DownloadableContentInfo_WOTC_GotchaAgainRedux'.static.IsModLoaded('LongWarOfTheChosen');
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  ICON SET FUNCTIONS - SHOULD NO LONGER NEED SWITCH AS ONLY 1 ICON SET ALLOWED
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//LOAD NEW ICON SETS
function SwitchIconPack(IconPack_GA IconPackInstance)
{
    LoadedIconPack = IconPackInstance;
    CacheUtilityInstance.SwitchIconPack(LoadedIconPack);
    UnitIndicatorUtility.SwitchIconPack(LoadedIconPack);
    ObjectiveIndicatorUtility.SwitchIconPack(LoadedIconPack);
}

function IconPack_GA GetIconPack()
{
    return LoadedIconPack;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  USE NEW LOS CALCS
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function RealizePreviewMovementAndLOS(XComPathingPawn PathingPawn, optional GameplayTileData MoveToTileData)
{
    //NEVER CALL THE BASE FUNCTION, WHICH CALLS THE FLAG'S [RealizeLOSPreview] FUNCTION, AS WE WANT TO REPLACE THIS WITH OUR OWN ICONS
    //super.RealizePreviewMovementAndLOS(PathingPawn, MoveToTileData); 

    // Do the "regular" LOS indicators
    if (PathingPawn != none)
    {
        RealizePreviewEndOfMoveLOS(PathingPawn.PathTileData[PathingPawn.PathTileData.Length - 1]);
    }
    else
    {
        RealizePreviewEndOfMoveLOS(MoveToTileData);
    }

    // Do movement path indicators if enabled
    if(`GETMCMVAR(bUseCustomPathIndicatorSystem) && !GrappleIsActive)
	{
        // This MUST happen after UnitIndicatorUtility.ProcessUnitIndicators, since a side-effect of that is updating the Cache for enemy units
        GetPathIndicatorUtility().ProcessPathIndicators(PathingPawn);
    }
}

//SETUP END OF MOVE LOS CHECKS
// Updates all unit flags to show whether the moving unit can see them at the end of its move
function RealizePreviewEndOfMoveLOS(GameplayTileData MoveToTileData)
{
    //NEVER CALL THE BASE FUNCTION, WHICH CALLS THE FLAG'S [RealizeLOSPreview] FUNCTION, AS WE WANT TO REPLACE THIS WITH OUR OWN ICONS
    //super.RealizePreviewEndOfMoveLOS(MoveToTileData); 

    ControlledUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(MoveToTileData.SourceObjectID));
    ControlledUnitSightRange = class'LOSUtility_GA'.static.GetUnitSightRange(ControlledUnit);
    bControlledUnitIsVIP = class'UnitIndicatorUtility_GA'.static.UnitIsVIP(ControlledUnit);

    UnitIndicatorUtility.ProcessUnitIndicators(MoveToTileData.EventTile, `GETMCMVAR(bShowLoneWolfIndicator)); //LONEWOLF && bLongWar2Detected

    if(bControlledUnitIsVIP){ ObjectiveIndicatorUtility.ResetAllObjectiveIndicators(); }
	else                   	{ ObjectiveIndicatorUtility.ProcessObjectiveIndicators(MoveToTileData.EventTile); }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  INFO GATHER
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Make sure the PathIndicatorUtility is instantiated if this setting was enabled after initializing
private function PathIndicatorUtility_GA GetPathIndicatorUtility()
{
    if(PathIndicatorUtility == none)
	{
        PathIndicatorUtility = new(self) class'PathIndicatorUtility_GA';
        PathIndicatorUtility.Init(CacheUtilityInstance, LOSUtilityInstance);
    }
    return PathIndicatorUtility;
}

//GET THIS CLASSES INSTATIATED OBJINDIUTIL
function ObjectiveIndicatorUtility_GA GetObjectiveIndicatorUtility()
{
    return ObjectiveIndicatorUtility;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  CONTROL ALPHA/DIMMING
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// In order to avoid also overriding the UIUnitFlag class, we do an extra check here and do NOT call RealizeTargetedState(), 
// which dims the flag, for hostile units if the raised Tactical menu is for the grapple ability
simulated function RealizeTargetedStates()
{
    local UIUnitFlag kFlag;
    local bool bMenuRaised, bDisableDim;
    local X2TargetingMethod_Grapple X2TMG;

    bMenuRaised = `PRES.m_kTacticalHUD.IsMenuRaised();
    bDisableDim = (`GETMCMVAR(bDisableDimHostileUnitFlagsWhenUsingGrapple) || `GETMCMVAR(bShowLOSIndicatorsForGrappleDestinations));
    X2TMG = X2TargetingMethod_Grapple(`PRES.m_kTacticalHUD.GetTargetingMethod());

    foreach m_arrFlags(kFlag)
    {
        //THE ONLY THING THAT CHANGES IS IF THE UNIT IS FRIENDLY OR NOT, ALL OTHER CHECKS CAN BE MADE ONCE OUTSIDE THE FOREACH LOOP
        if(!kFlag.m_bIsFriendly.GetValue() && X2TMG != none && bMenuRaised && bDisableDim ) { continue; }

        //if (kFlag.m_bIsFriendly.GetValue() && UnitIndicatorUtility.GetIndicatorValueForUnit(?,?,?,false))
        // <> TODO : INSERT OVERRIDE HERE FOR FRIENDLY UNITS IN SIGHT RANGE SO THIER FLAG DOESN'T DIM IF UNIT IS USING A FRIENDLY TARGET PERK
        kFlag.RealizeTargetedState();
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  UNIT FLAG MANIPULATIONS
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// This is called when an ability is selected for targeting stuff
simulated function ActivateExtensionForTargetedUnit(StateObjectReference ObjectRef)
{
    // Do not clear indicators when this shothud is for a melee-ability
    if(X2MeleePathingPawn_GA(PathIndicatorUtility.PathingPawn) == none)
	{
        ClearLOSIndicators();
    }

    super.ActivateExtensionForTargetedUnit(ObjectRef);
}

// ELR RESPONSE ON PERK ACTIVATED
public function EventListenerReturn OnAbilityActivated(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    ClearLOSIndicators();

	if( LatestHistoryIndex < GameState.HistoryIndex )
	{
		RealizeBuffs(-1, GameState.HistoryIndex);
		RealizeCover(-1, GameState.HistoryIndex);
        RealizeOverwatch(-1, GameState.HistoryIndex);
		LatestHistoryIndex = GameState.HistoryIndex;
	}

    return ELR_NoInterrupt;
}

// ELR RESPONSE ON PLAYER TURN BEGIN
function EventListenerReturn OnPlayerTurnBegun(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameState							NewGameState;
	local XComGameState_Player					PlayerState;

    //Data and Source are both the same for this event, so if we have one should have both... 
	PlayerState = XComGameState_Player(EventData);
	if (PlayerState == none) { return ELR_NoInterrupt; }

    //enable only on xcoms turn to cut down on spam
    if (PlayerState.TeamFlag == eTeam_XCom)
    {
    	//  CREATE A NEW GAMESTATE AS ELD_OSS PER IRIDARS INSTRUCTIONS
        NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Refreshing the UnitFlags");

        //class'X2DownloadableContentInfo_WOTC_GotchaAgainRedux'.static.RustyFix_UFE_GAR_ForceFlagRefresh();

        RemoveAllFlags();
        AddAllFlags();
        Update();
        CacheUtilityInstance.ForceUnitFlagCacheRefresh();
        
      	//  Submit the Game State so our changes take effect.
        `XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
    }
    
	return ELR_NoInterrupt;
}

simulated function EndTurn()
{
    ClearLOSIndicators(true);
    RefreshAllHealth();
    
    super.EndTurn();
}

//MOVED ACTIVE UNIT CHANGED TO USING THE EVENT FOR UPDATES
event OnActiveUnitChanged(XComGameState_Unit NewActiveUnit)
{
    ClearLOSIndicators();
}

//function OnSelectedUnitChanged()
//{
//    ClearLOSIndicators();
//}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  CLEAR ANY FLAGS INFO WE ENTERED/CREATED OURSELVES
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function ClearLOSIndicators(optional bool ForceClearCustomPathIndicators = false)
{
    // Clear all unit indicators
    UnitIndicatorUtility.ClearUnitLOSIndicators();

    // Reset all objective indicators
    ObjectiveIndicatorUtility.ResetAllObjectiveIndicators();

    if(`GETMCMVAR(bUseCustomPathIndicatorSystem) || ForceClearCustomPathIndicators)
	{
        // Clear all path indicators in the custom path-indicator system
        GetPathIndicatorUtility().ClearAllPathIndicators();
    } 
}

//CLEAR AND RESET UNIT PIPS FOR DAMAGE PREVIEWS
simulated function ClearAbilityDamagePreview()
{
	local UIUnitFlag kFlag;

	// Turn all flag info off initially 
	foreach m_arrFlags(kFlag)
	{
        //FIXES FLASHING PIPS ON HEALTH SHIELD BARS GETTING STUCK!
        //REMOVE CHECK FOR FRIENDLY/ENEMY JUST CLEAR THEM ALL TO 0
		//if( !kFlag.m_bIsFriendly.GetValue() )
		//{
			kFlag.SetHitPointsPreview(0);
			kFlag.SetArmorPointsPreview(0, 0);
    		kFlag.SetShieldPointsPreview(0);
		//}
	}
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  CONSOLE COMMAND HELPERS
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

simulated function RemoveAllFlags()
{
	local UIUnitFlag kFlag;
	local UISimpleFlag kSimpleFlag;
   	local int i;

    for( i = m_arrFlags.Length - 1; i >= 0; --i )
    {
        kFlag = m_arrFlags[i];
        kFlag.Remove();
    }

    for( i = m_arrSimpleFlags.Length - 1; i >= 0; --i )
    {
        kSimpleFlag = m_arrSimpleFlags[i];
        kSimpleFlag.Remove();
    }

    m_arrFlags.Length = 0;
    m_arrSimpleFlags.Length = 0;
}

simulated function AddAllFlags()
{
	local XComGameState_Unit UnitState;
	local XComGameState_Destructible DestructibleState;

    foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_Unit', UnitState, eReturnType_Reference)
    {
		if( UnitState != none && !UnitState.bRemovedFromPlay )
        {
            AddFlag(UnitState.GetReference());

            //IF THE NEWLY ADDED FLAG SHOULD BE HIDDEN, HIDE IT
            if( !UnitState.GetMyTemplate().bDisplayUIUnitFlag )
            {
                m_arrFlags[m_arrFlags.length-1].Hide();
            }
        }
    }

    foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_Destructible', DestructibleState, eReturnType_Reference)
    {
        if( DestructibleState.IsTargetable() )
        {
            AddFlag(DestructibleState.GetReference());
        }
    }
}