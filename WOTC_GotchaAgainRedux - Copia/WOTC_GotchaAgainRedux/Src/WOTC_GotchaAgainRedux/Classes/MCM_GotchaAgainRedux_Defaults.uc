////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    11/07/23    06:30
////////////////////////////////////////////////////////////////////////////////////////////////////

class MCM_GotchaAgainRedux_Defaults extends Object config(WOTCGotchaAgainReduxDefaults);

var config int VERSION_CFG;

var config bool bShowSquadsightHackingIndicator;
var config bool bShowSquadsightGremlinIndicator;
var config bool bShowFriendlyLOSIndicators;
var config bool bShowVIPSpottedByEnemyIndicators;
var config bool bShowLoneWolfIndicator;

var config string sIconPack;
var config bool bShowTowerHackingArrows;
var config bool bShowTowerHackingArrowsWithoutSight;
var config bool bHideTowerArrowsAfterHacking;
var config bool bShowRemoteDoorHackingIndicators;

var config bool bShowLOSIndicatorsForGrappleDestinations;
var config bool bDisableHideObjectiveArrowsWhenUsingGrapple;
var config bool bDisableDimHostileUnitFlagsWhenUsingGrapple;

var config bool bUseCustomPathIndicatorSystem;
var config bool bShowOverwatchTriggers;
var config bool bShowOverwatchTriggerForSuppression;
var config bool bShowActivationTriggers;
var config bool bShowNoiseIndicators;
var config bool bShowSmokeIndicator;
var config bool bShowDelayedDamageIndicator;
var config bool bShowHuntersMarkIndicator;

var config bool DisablePFC;
var config bool HideInHighCover;
var config bool HideWithHeightAdvantage;
var config bool HideGroundMarkers;
var config int NumGraceTiles;
var config int ExtraDetectionRange;
var config int MinEligibleDetectionRange;

var config bool DisableMCP;
var config float fAllowClickDelay;
var config float fCursorOpacity_ClickDisallowed;

var config bool bAlwaysShowPodActivation;

var config bool bEnableLogging;
