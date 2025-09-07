////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    15/07/23    10:30
////////////////////////////////////////////////////////////////////////////////////////////////////

class MCM_GotchaAgainRedux_Settings extends Object config(WOTCGotchaAgainReduxSettings);

var config int VERSION_CFG;

// Localization Strings for Mod Config Menu Items
var public localized string	sSettingsPage_Label, sPageTitle_Label;
var public localized string	sGroupUnitIndicators_Label, sGroupObjectiveIndicators_Label, sGroupGrappleIndicators_Label;
var public localized string sGroupPathingIndicators_Label, sGroupCheats_Label, sGroupPeekFromConceal_Label, sGroupMissClickProtection_Label;

var int CurrentGameMode;

//***************************************
//Insert `MCM_API_Auto????Vars macros here
//Auto Variable creation, creates variables expected to exist by the other "Auto" Macros, including the config Variable itself
//_Label, _Tip and correct _MCMUI
//***************************************

`include(WOTC_GotchaAgainRedux\Src\ModConfigMenuAPI\MCM_API_Includes.uci)

//GROUP 1
`MCM_API_AutoCheckboxVars(bShowSquadsightHackingIndicator);
`MCM_API_AutoCheckboxVars(bShowSquadsightGremlinIndicator);
`MCM_API_AutoCheckboxVars(bShowFriendlyLOSIndicators);
`MCM_API_AutoCheckboxVars(bShowVIPSpottedByEnemyIndicators);
`MCM_API_AutoCheckboxVars(bShowLoneWolfIndicator);

//GROUP 2
`MCM_API_AutoDropdownVars(sIconPack);
`MCM_API_AutoCheckboxVars(bShowTowerHackingArrows);
`MCM_API_AutoCheckboxVars(bShowTowerHackingArrowsWithoutSight);
`MCM_API_AutoCheckboxVars(bHideTowerArrowsAfterHacking);
`MCM_API_AutoCheckboxVars(bShowRemoteDoorHackingIndicators);

//GROUP 3
`MCM_API_AutoCheckboxVars(bShowLOSIndicatorsForGrappleDestinations);
`MCM_API_AutoCheckboxVars(bDisableHideObjectiveArrowsWhenUsingGrapple);
`MCM_API_AutoCheckboxVars(bDisableDimHostileUnitFlagsWhenUsingGrapple);

//GROUP 4
`MCM_API_AutoCheckboxVars(bUseCustomPathIndicatorSystem);
`MCM_API_AutoCheckboxVars(bShowOverwatchTriggers);
`MCM_API_AutoCheckboxVars(bShowOverwatchTriggerForSuppression);
`MCM_API_AutoCheckboxVars(bShowActivationTriggers);
`MCM_API_AutoCheckboxVars(bShowNoiseIndicators);
`MCM_API_AutoCheckboxVars(bShowSmokeIndicator);
`MCM_API_AutoCheckboxVars(bShowDelayedDamageIndicator);
`MCM_API_AutoCheckboxVars(bShowHuntersMarkIndicator);

//GROUP 5
`MCM_API_AutoCheckboxVars(DisablePFC);
`MCM_API_AutoCheckboxVars(HideInHighCover);
`MCM_API_AutoCheckboxVars(HideWithHeightAdvantage);
`MCM_API_AutoCheckboxVars(HideGroundMarkers);
`MCM_API_AutoSliderVars(NumGraceTiles);
`MCM_API_AutoSliderVars(ExtraDetectionRange);
`MCM_API_AutoSliderVars(MinEligibleDetectionRange);

//GROUP 6
`MCM_API_AutoCheckboxVars(DisableMCP);
`MCM_API_AutoSliderVars(fAllowClickDelay,float);
`MCM_API_AutoSliderVars(fCursorOpacity_ClickDisallowed,float);

//GROUP 7
`MCM_API_AutoCheckboxVars(bAlwaysShowPodActivation);

//GROUP 8
`MCM_API_AutoCheckboxVars(bEnableLogging);

//********************************************************************
//Insert `MCM_API_Auto????Fns and MCM_API_AutoButtonHandler macros here
//Auto function creation, makes matching Getters and Save handlers
//********************************************************************

`include(WOTC_GotchaAgainRedux\Src\ModConfigMenuAPI\MCM_API_CfgHelpers.uci)

//GROUP 1
`MCM_API_AutoCheckboxFns(bShowSquadsightHackingIndicator,               369 );
`MCM_API_AutoCheckboxFns(bShowSquadsightGremlinIndicator,               442 );
`MCM_API_AutoCheckboxFns(bShowFriendlyLOSIndicators,                    369 );
`MCM_API_AutoCheckboxFns(bShowVIPSpottedByEnemyIndicators,              369 );
`MCM_API_AutoCheckboxFns(bShowLoneWolfIndicator,                        369 );

//GROUP 2
`MCM_API_AutoDropdownFns(sIconPack,                                     369 );
`MCM_API_AutoCheckboxFns(bShowTowerHackingArrows,                       369 );
`MCM_API_AutoCheckboxFns(bShowTowerHackingArrowsWithoutSight,           369 );
`MCM_API_AutoCheckboxFns(bHideTowerArrowsAfterHacking,                  369 );
`MCM_API_AutoCheckboxFns(bShowRemoteDoorHackingIndicators,              369 );

//GROUP 3
`MCM_API_AutoCheckboxFns(bShowLOSIndicatorsForGrappleDestinations,      369 );
`MCM_API_AutoCheckboxFns(bDisableHideObjectiveArrowsWhenUsingGrapple,   369 );
`MCM_API_AutoCheckboxFns(bDisableDimHostileUnitFlagsWhenUsingGrapple,   369 );

//GROUP 4
`MCM_API_AutoCheckboxFns(bUseCustomPathIndicatorSystem,                 369 );
`MCM_API_AutoCheckboxFns(bShowOverwatchTriggers,                        369 );
`MCM_API_AutoCheckboxFns(bShowOverwatchTriggerForSuppression,           369 );
`MCM_API_AutoCheckboxFns(bShowActivationTriggers,                       369 );
`MCM_API_AutoCheckboxFns(bShowNoiseIndicators,                          369 );
`MCM_API_AutoCheckboxFns(bShowSmokeIndicator,                           369 );
`MCM_API_AutoCheckboxFns(bShowDelayedDamageIndicator,                   369 );
`MCM_API_AutoCheckboxFns(bShowHuntersMarkIndicator,                     369 );

//GROUP 5
`MCM_API_AutoCheckboxFns(DisablePFC,                                    369 );
`MCM_API_AutoCheckboxFns(HideInHighCover,                               369 );
`MCM_API_AutoCheckboxFns(HideWithHeightAdvantage,                       369 );
`MCM_API_AutoCheckboxFns(HideGroundMarkers,                             369 );
`MCM_API_AutoSliderFns(NumGraceTiles,,                                  369 );
`MCM_API_AutoSliderFns(ExtraDetectionRange,,                            369 );
`MCM_API_AutoSliderFns(MinEligibleDetectionRange,,                      369 );

//GROUP 6
`MCM_API_AutoCheckboxFns(DisableMCP,                                    369 );
`MCM_API_AutoSliderFns(fAllowClickDelay,float,                          642 );
`MCM_API_AutoSliderFns(fCursorOpacity_ClickDisallowed,float,            369 );

//GROUP 7
`MCM_API_AutoCheckboxFns(bAlwaysShowPodActivation,                      369 );

//GROUP 8
`MCM_API_AutoCheckboxFns(bEnableLogging,                                469 );

// MCM CONFIG VERSION CHECKER - NOT REQUIRED WITH MR.NICE MCM OPTIONS
//`MCM_CH_VersionChecker(class'MCM_FullShadowReport_Defaults'.default.VERSION_CFG, VERSION_CFG)

////////////////////////////////////////////////////////////////////////////////////////////////////
//	ON INT		// Everything in here runs only when you need to touch MCM.
////////////////////////////////////////////////////////////////////////////////////////////////////

event OnInit(UIScreen Screen)
{
	`MCM_API_Register(Screen, ClientModCallback);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	BUILD SCREEN
////////////////////////////////////////////////////////////////////////////////////////////////////

simulated function ClientModCallback(MCM_API_Instance ConfigAPI, int GameMode)
{
    local MCM_API_SettingsPage Page;
    local MCM_API_SettingsGroup Group;

    local array<string> IconsArray;

    //POULATE DROPDOWN ARRAYS
    //AvailableIconPacks = ("vhs2", "lewe1","lewe2","lewe3","lewe4","lewe5","vhs0","vhs1");
    IconsArray.AddItem("vhs2");

    //Store current game mode as we need it for updates on save
    CurrentGameMode = GameMode;
    
	//ENSURE WE LOAD CURRENT SETTING FROM CONFIG FILE
	LoadSavedSettings();

	//CREATE NEW MOD PAGE AND BUTTON
	Page = ConfigAPI.NewSettingsPage(sSettingsPage_Label);
	Page.SetPageTitle(sPageTitle_Label);
	Page.SetSaveHandler(SaveButtonClicked);
	Page.EnableResetButton(ResetButtonClicked);

	//********************************************************
	//MCM_API_AutoAdd??????? Macro's go here for UI creation
	//********************************************************

	//GROUP 1
	Group = Page.AddGroup('Group1', sGroupUnitIndicators_Label);
		`MCM_API_AutoAddCheckbox(Group, bShowSquadsightHackingIndicator);
		`MCM_API_AutoAddCheckbox(Group, bShowSquadsightGremlinIndicator);
		`MCM_API_AutoAddCheckbox(Group, bShowFriendlyLOSIndicators);
		`MCM_API_AutoAddCheckbox(Group, bShowVIPSpottedByEnemyIndicators);
		`MCM_API_AutoAddCheckbox(Group, bShowLoneWolfIndicator);

		Group.AddLabel('empty_line', "<p align='CENTER'> --- </p>","");

	//GROUP 2
	Group = Page.AddGroup('Group2', sGroupObjectiveIndicators_Label);
		`MCM_API_AutoAddDropdown(Group, sIconPack, IconsArray, DropDownSaveHandler);
		`MCM_API_AutoAddCheckbox(Group, bShowTowerHackingArrows, CheckboxChangeHandler);
		`MCM_API_AutoAddCheckbox(Group, bShowTowerHackingArrowsWithoutSight);
		`MCM_API_AutoAddCheckbox(Group, bHideTowerArrowsAfterHacking);
		`MCM_API_AutoAddCheckbox(Group, bShowRemoteDoorHackingIndicators);

		Group.AddLabel('empty_line', "<p align='CENTER'> --- </p>","");

	//GROUP 3
	Group = Page.AddGroup('Group3', sGroupGrappleIndicators_Label);
		`MCM_API_AutoAddCheckbox(Group, bShowLOSIndicatorsForGrappleDestinations, CheckboxChangeHandler);
		`MCM_API_AutoAddCheckbox(Group, bDisableHideObjectiveArrowsWhenUsingGrapple);
		`MCM_API_AutoAddCheckbox(Group, bDisableDimHostileUnitFlagsWhenUsingGrapple);

		Group.AddLabel('empty_line', "<p align='CENTER'> --- </p>","");

    //GROUP 4
    Group = Page.AddGroup('Group4', sGroupPathingIndicators_Label);
		`MCM_API_AutoAddCheckbox(Group, bUseCustomPathIndicatorSystem, CheckboxChangeHandler);
		`MCM_API_AutoAddCheckbox(Group, bShowOverwatchTriggers, CheckboxChangeHandler);
		`MCM_API_AutoAddCheckbox(Group, bShowOverwatchTriggerForSuppression);
		`MCM_API_AutoAddCheckbox(Group, bShowActivationTriggers);
		`MCM_API_AutoAddCheckbox(Group, bShowNoiseIndicators);
		`MCM_API_AutoAddCheckbox(Group, bShowSmokeIndicator);
		`MCM_API_AutoAddCheckbox(Group, bShowDelayedDamageIndicator);
		`MCM_API_AutoAddCheckbox(Group, bShowHuntersMarkIndicator);

		Group.AddLabel('empty_line', "<p align='CENTER'> --- </p>","");

    //GROUP 5
 	Group = Page.AddGroup('Group5', sGroupPeekFromConceal_Label);
		`MCM_API_AutoAddCheckbox(Group, DisablePFC, CheckboxChangeHandler);
		`MCM_API_AutoAddCheckbox(Group, HideInHighCover);
		`MCM_API_AutoAddCheckbox(Group, HideWithHeightAdvantage);
		`MCM_API_AutoAddCheckbox(Group, HideGroundMarkers);
		`MCM_API_AutoAddSlider(Group, NumGraceTiles, 0, 10, 1);
		`MCM_API_AutoAddSlider(Group, ExtraDetectionRange, 0, 20, 1);
		`MCM_API_AutoAddSlider(Group, MinEligibleDetectionRange, 5, 50, 5);

		Group.AddLabel('empty_line', "<p align='CENTER'> --- </p>","");

    //GROUP 6
	Group = Page.AddGroup('Group6', sGroupMissClickProtection_Label);
		`MCM_API_AutoAddCheckbox(Group, DisableMCP, CheckboxChangeHandler);
		`MCM_API_AutoAddSlider(Group, fAllowClickDelay, 0.05, 3.00, 0.05);
		`MCM_API_AutoAddSlider(Group, fCursorOpacity_ClickDisallowed, 0.05, 1.00, 0.05);

		Group.AddLabel('empty_line', "<p align='CENTER'> --- </p>","");

    //GROUP 7
	Group = Page.AddGroup('Group7', sGroupCheats_Label);
		`MCM_API_AutoAddCheckbox(Group, bAlwaysShowPodActivation);

		Group.AddLabel('empty_line', "<p align='CENTER'> --- </p>","");

    //GROUP 8
	Group = Page.AddGroup('Group8', bEnableLogging_Label);
		`MCM_API_AutoAddCheckbox(Group, bEnableLogging);

		Group.AddLabel('empty_line', "<p align='CENTER'> --- </p>","");

	//DECIDE WHAT IS CURRENTLY EDITABLE BASED ON CURRENT SETTINGS
        sIconPack_MCMUI.SetEditable(false);

        bHideTowerArrowsAfterHacking_MCMUI.SetEditable(bShowTowerHackingArrows);
        bShowTowerHackingArrowsWithoutSight_MCMUI.SetEditable(bShowTowerHackingArrows);

        bDisableHideObjectiveArrowsWhenUsingGrapple_MCMUI.SetEditable(bShowLOSIndicatorsForGrappleDestinations);
        bDisableDimHostileUnitFlagsWhenUsingGrapple_MCMUI.SetEditable(bShowLOSIndicatorsForGrappleDestinations);

        bShowOverwatchTriggerForSuppression_MCMUI.SetEditable(bUseCustomPathIndicatorSystem && bShowOverwatchTriggers);
        bShowOverwatchTriggers_MCMUI.SetEditable(bUseCustomPathIndicatorSystem);
        bShowActivationTriggers_MCMUI.SetEditable(bUseCustomPathIndicatorSystem);
        bShowNoiseIndicators_MCMUI.SetEditable(bUseCustomPathIndicatorSystem);
        bShowSmokeIndicator_MCMUI.SetEditable(bUseCustomPathIndicatorSystem);
        bShowDelayedDamageIndicator_MCMUI.SetEditable(bUseCustomPathIndicatorSystem);
        bShowHuntersMarkIndicator_MCMUI.SetEditable(bUseCustomPathIndicatorSystem);

        HideInHighCover_MCMUI.SetEditable(!DisablePFC);
        HideWithHeightAdvantage_MCMUI.SetEditable(!DisablePFC);
        HideGroundMarkers_MCMUI.SetEditable(!DisablePFC);
        NumGraceTiles_MCMUI.SetEditable(!DisablePFC);
        ExtraDetectionRange_MCMUI.SetEditable(!DisablePFC);
        MinEligibleDetectionRange_MCMUI.SetEditable(!DisablePFC);

        fAllowClickDelay_MCMUI.SetEditable(!DisableMCP);
	    fCursorOpacity_ClickDisallowed_MCMUI.SetEditable(!DisableMCP);

    //FINALLY NOW WE'RE ALL SET UP - SHOW THE PAGE IN A SWEEPING FLOURISH
    Page.ShowSettings();
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	CUSTOM HANDLERS
////////////////////////////////////////////////////////////////////////////////////////////////////

//CHECK BOXES HANDLER TO HANDLE ENABLE/DISABLE OF BUTTONS BASED ON OTHER BUTTONS PRESSED
//ENSURE CHANGE SETTINGS VALUE FIRST, THEN ALL EDITABLE COMMANDS ARE THE SAME AS INIT EDITABLES

simulated function CheckboxChangeHandler(MCM_API_Setting _Setting, bool _SettingValue)
{
    switch(_Setting.GetName())
    {
        case 'bShowTowerHackingArrows':
            bShowTowerHackingArrows = _SettingValue;
            bHideTowerArrowsAfterHacking_MCMUI.SetEditable(bShowTowerHackingArrows);
            bShowTowerHackingArrowsWithoutSight_MCMUI.SetEditable(bShowTowerHackingArrows);
            break;
        case 'bShowLOSIndicatorsForGrappleDestinations':
            bShowLOSIndicatorsForGrappleDestinations = _SettingValue;
            bDisableHideObjectiveArrowsWhenUsingGrapple_MCMUI.SetEditable(bShowLOSIndicatorsForGrappleDestinations);
            bDisableDimHostileUnitFlagsWhenUsingGrapple_MCMUI.SetEditable(bShowLOSIndicatorsForGrappleDestinations);
            break;
        case 'bUseCustomPathIndicatorSystem':
            bUseCustomPathIndicatorSystem = _SettingValue;
            bShowOverwatchTriggerForSuppression_MCMUI.SetEditable(bUseCustomPathIndicatorSystem && bShowOverwatchTriggers);
            bShowOverwatchTriggers_MCMUI.SetEditable(bUseCustomPathIndicatorSystem);
            bShowActivationTriggers_MCMUI.SetEditable(bUseCustomPathIndicatorSystem);
            bShowNoiseIndicators_MCMUI.SetEditable(bUseCustomPathIndicatorSystem);
            bShowSmokeIndicator_MCMUI.SetEditable(bUseCustomPathIndicatorSystem);
            bShowDelayedDamageIndicator_MCMUI.SetEditable(bUseCustomPathIndicatorSystem);
            bShowHuntersMarkIndicator_MCMUI.SetEditable(bUseCustomPathIndicatorSystem);
            break;
        case 'bShowOverwatchTriggers':
            bShowOverwatchTriggers = _SettingValue;
            bShowOverwatchTriggerForSuppression_MCMUI.SetEditable(bUseCustomPathIndicatorSystem && bShowOverwatchTriggers);
            break;
        case 'DisablePFC':
            DisablePFC = _SettingValue;
            HideInHighCover_MCMUI.SetEditable(!DisablePFC);
            HideWithHeightAdvantage_MCMUI.SetEditable(!DisablePFC);
            HideGroundMarkers_MCMUI.SetEditable(!DisablePFC);
            NumGraceTiles_MCMUI.SetEditable(!DisablePFC);
            ExtraDetectionRange_MCMUI.SetEditable(!DisablePFC);
            MinEligibleDetectionRange_MCMUI.SetEditable(!DisablePFC);
            break;
        case 'DisableMCP':
            DisableMCP = _SettingValue;
            fAllowClickDelay_MCMUI.SetEditable(!DisableMCP);
    	    fCursorOpacity_ClickDisallowed_MCMUI.SetEditable(!DisableMCP);
            break;
        default:
            //say whut?
            break;
    }
}

simulated function DropDownSaveHandler(MCM_API_Setting _Setting, string _SettingValue)
{
    local IconPack_GA newIconPack;

    switch(_Setting.GetName())
    {
        case 'sIconPack':
            sIconPack = _SettingValue;

            if(CurrentGameMode == eGameMode_Tactical)
            {
                newIconPack = class'IconPack_GA'.static.LoadIconPack();
                UIUnitFlagManager_GA(`PRES.m_kUnitFlagManager).SwitchIconPack(newIconPack);
            }

            break;
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	SAVE SETTINGS TO CONFIGS
////////////////////////////////////////////////////////////////////////////////////////////////////

simulated function SaveButtonClicked(MCM_API_SettingsPage Page)
{
    UpdateTactical();

    VERSION_CFG = `MCM_CH_GetCompositeVersion();
	SaveConfig();
}

simulated function UpdateTactical()
{
    local UIUnitFlagManager_GA UIUnitFlagManager;
    local XComPathingPawn PathingPawn;
    local int i;

    if(CurrentGameMode == eGameMode_Tactical)
    {
        UIUnitFlagManager = UIUnitFlagManager_GA(`PRES.m_kUnitFlagManager);

        // Clear all indicators before saving to prevent stuff sticking around and not being updated because the setting was turned off
        UIUnitFlagManager.ClearLOSIndicators(true);

        // Destroy existing doorhacking indicators if they were turned off since they prevent the regular ones from showing up!
        if(!`GETMCMVAR(bShowRemoteDoorHackingIndicators))
        {
            UIUnitFlagManager.ObjectiveIndicatorUtility.CacheUtility.DestroyAllDoorHackingIndicators();
        }

        if(`GETMCMVAR(bShowTowerHackingArrowsWithoutSight))
        {
            UIUnitFlagManager.ObjectiveIndicatorUtility.AddAllVisibleTowers();
        }
        else
        {
            UIUnitFlagManager.ObjectiveIndicatorUtility.ResetAllObjectiveIndicators();
        }
        
        // In case default waypoint markers have been created and the settings are switched to use the custom system we need to clear these to avoid persisting markers.
        PathingPawn = XComTacticalController(class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController()).m_kPathingPawn;
        for(i = 0; i < PathingPawn.WaypointMeshPool.Length; i++)
        {
            PathingPawn.WaypointMeshPool[i].FadeOut();
        }
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	LOAD SETTINGS FROM CONFIGS - DEFAULT OR ACTUAL
////////////////////////////////////////////////////////////////////////////////////////////////////

simulated function LoadSavedSettings()
{
    //GROUP 1
    bShowSquadsightHackingIndicator             = `GETMCMVAR(bShowSquadsightHackingIndicator);
    bShowSquadsightGremlinIndicator             = `GETMCMVAR(bShowSquadsightGremlinIndicator);
    bShowFriendlyLOSIndicators                  = `GETMCMVAR(bShowFriendlyLOSIndicators);
    bShowVIPSpottedByEnemyIndicators            = `GETMCMVAR(bShowVIPSpottedByEnemyIndicators);
    bShowLoneWolfIndicator                      = `GETMCMVAR(bShowLoneWolfIndicator);

    //GROUP 2
    sIconPack                                   = `GETMCMVAR(sIconPack);
    bShowTowerHackingArrows                     = `GETMCMVAR(bShowTowerHackingArrows);
    bShowTowerHackingArrowsWithoutSight         = `GETMCMVAR(bShowTowerHackingArrowsWithoutSight);
    bHideTowerArrowsAfterHacking                = `GETMCMVAR(bHideTowerArrowsAfterHacking);
    bShowRemoteDoorHackingIndicators            = `GETMCMVAR(bShowRemoteDoorHackingIndicators);

    //GROUP 3
    bShowLOSIndicatorsForGrappleDestinations    = `GETMCMVAR(bShowLOSIndicatorsForGrappleDestinations);
    bDisableHideObjectiveArrowsWhenUsingGrapple = `GETMCMVAR(bDisableHideObjectiveArrowsWhenUsingGrapple);
    bDisableDimHostileUnitFlagsWhenUsingGrapple = `GETMCMVAR(bDisableDimHostileUnitFlagsWhenUsingGrapple);

    //GROUP 4
    bUseCustomPathIndicatorSystem               = `GETMCMVAR(bUseCustomPathIndicatorSystem);
    bShowOverwatchTriggers                      = `GETMCMVAR(bShowOverwatchTriggers);
    bShowOverwatchTriggerForSuppression         = `GETMCMVAR(bShowOverwatchTriggerForSuppression);
    bShowActivationTriggers                     = `GETMCMVAR(bShowActivationTriggers);
    bShowNoiseIndicators                        = `GETMCMVAR(bShowNoiseIndicators);
    bShowSmokeIndicator                         = `GETMCMVAR(bShowSmokeIndicator);
    bShowDelayedDamageIndicator                 = `GETMCMVAR(bShowDelayedDamageIndicator);
    bShowHuntersMarkIndicator                   = `GETMCMVAR(bShowHuntersMarkIndicator);

    //GROUP 5
    DisablePFC                                  = `GETMCMVAR(DisablePFC);
    HideInHighCover                             = `GETMCMVAR(HideInHighCover);
    HideWithHeightAdvantage                     = `GETMCMVAR(HideWithHeightAdvantage);
    HideGroundMarkers                           = `GETMCMVAR(HideGroundMarkers);
    NumGraceTiles                               = `GETMCMVAR(NumGraceTiles);
    ExtraDetectionRange                         = `GETMCMVAR(ExtraDetectionRange);
    MinEligibleDetectionRange                   = `GETMCMVAR(MinEligibleDetectionRange);

    //GROUP 6
    DisableMCP                                  = `GETMCMVAR(DisableMCP);
    fAllowClickDelay                            = `GETMCMVAR(fAllowClickDelay);
    fCursorOpacity_ClickDisallowed              = `GETMCMVAR(fCursorOpacity_ClickDisallowed);

    //GROUP 7
    bAlwaysShowPodActivation                    = `GETMCMVAR(bAlwaysShowPodActivation);

    //GROUP 8
    bEnableLogging                              = `GETMCMVAR(bEnableLogging);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	LOAD SETTINGS FROM CONFIGS - RESET TO DEFAULTS
////////////////////////////////////////////////////////////////////////////////////////////////////

simulated function ResetButtonClicked(MCM_API_SettingsPage Page)
{
    //GROUP 1
    `MCM_API_AutoReset(bShowSquadsightHackingIndicator);
    `MCM_API_AutoReset(bShowSquadsightGremlinIndicator);
    `MCM_API_AutoReset(bShowFriendlyLOSIndicators);
    `MCM_API_AutoReset(bShowVIPSpottedByEnemyIndicators);
    `MCM_API_AutoReset(bShowLoneWolfIndicator);

    //GROUP 2
    `MCM_API_AutoReset(sIconPack);
    `MCM_API_AutoReset(bShowTowerHackingArrows);
    `MCM_API_AutoReset(bShowTowerHackingArrowsWithoutSight);
    `MCM_API_AutoReset(bHideTowerArrowsAfterHacking);
    `MCM_API_AutoReset(bShowRemoteDoorHackingIndicators);

    //GROUP 3
    `MCM_API_AutoReset(bShowLOSIndicatorsForGrappleDestinations);
    `MCM_API_AutoReset(bDisableHideObjectiveArrowsWhenUsingGrapple);
    `MCM_API_AutoReset(bDisableDimHostileUnitFlagsWhenUsingGrapple);

    //GROUP 4
    `MCM_API_AutoReset(bUseCustomPathIndicatorSystem);
    `MCM_API_AutoReset(bShowOverwatchTriggers);
    `MCM_API_AutoReset(bShowOverwatchTriggerForSuppression);
    `MCM_API_AutoReset(bShowActivationTriggers);
    `MCM_API_AutoReset(bShowNoiseIndicators);
    `MCM_API_AutoReset(bShowSmokeIndicator);
    `MCM_API_AutoReset(bShowDelayedDamageIndicator);
    `MCM_API_AutoReset(bShowHuntersMarkIndicator);

    //GROUP 5
    `MCM_API_AutoReset(DisablePFC);
    `MCM_API_AutoReset(HideInHighCover);
    `MCM_API_AutoReset(HideWithHeightAdvantage);
    `MCM_API_AutoReset(HideGroundMarkers);
    `MCM_API_AutoReset(NumGraceTiles);
    `MCM_API_AutoReset(ExtraDetectionRange);
    `MCM_API_AutoReset(MinEligibleDetectionRange);

    //GROUP 6
    `MCM_API_AutoReset(DisableMCP);
    `MCM_API_AutoReset(fAllowClickDelay);
    `MCM_API_AutoReset(fCursorOpacity_ClickDisallowed);

    //GROUP 7
    `MCM_API_AutoReset(bAlwaysShowPodActivation);

    //GROUP 8
    `MCM_API_AutoReset(bEnableLogging);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
