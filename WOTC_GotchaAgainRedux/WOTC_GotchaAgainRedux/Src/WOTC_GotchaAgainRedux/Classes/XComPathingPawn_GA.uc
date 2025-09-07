////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    10/07/23    02:00
////////////////////////////////////////////////////////////////////////////////////////////////////

class XComPathingPawn_GA extends XComPathingPawn;

`include(WOTC_GotchaAgainRedux\Src\ModConfigMenuAPI\MCM_API_CfgHelpers.uci)

var private bool AlreadySearched;
var private bool PerfectInformationFound;

// This is done elsewhere in order to properly handle conflicts with our new markers
function /* protected */ UpdatePathMarkers()
{
    if(`GETMCMVAR(bUseCustomPathIndicatorSystem))
	{ 
		//======THIS IS GOTCHA AGAIN PEEK FROM CONCEALMENT UI FIX
		//CHECK MASTER TOGGLE, BAIL IF PFC IS DISABLED
		if (! `GETMCMVAR(DisablePFC))
		{
			//IF PFC IS NOT DISABLED AND WE'RE USING CUSTOM MARKERS WE NEED TO RECREATE THE CONCEALMENT BREAK MARKERS HERE FOR PFC'S RULES
			if (ConcealmentMarkers.Length > 0)
			{
				ConcealmentMarkers.Length = 0; //yes we check and recreate these!
				class'PeekFixUtility'.static.MakeConcealmentMarkers(self, ConcealmentMarkers);
			}
		}
		//======

		//USING CUSTOM SYSTEM RETURN
		//return; // NO LONGER REQUIRED AS USING IF/ELSE
	}
	else
	{
		//IF NOT USING NEW SYSTEM USE VANILLA
		super.UpdatePathMarkers();
	}

	//HIDE ALL CONCEALMENTBREAK GROUND TILE MARKERS
    if(`GETMCMVAR(HideGroundMarkers))
	{ 
		UpdateConcealmentTilesVisibility(true);
	}
}

// This override passes the entire PathingPawn instead of just the destination tile to the UnitFlagManager in order to create the path-indicators from there
// Requires pretty much all variables used in here to be changed from private to protected in order to compile
simulated function UpdatePathTileData()
{
	local array<StateObjectReference> ObjectsVisibleToPlayer;

	if(LastActiveUnit != none )
	{
		class'X2TacticalVisibilityHelpers'.static.FillPathTileDataAndVisibleObjects(LastActiveUnit.ObjectID, PathTiles, PathTileData, ObjectsVisibleToPlayer, true);
		
		//ShowLOSPreview is a basegame variable
		if(ShowLOSPreview)
		{
			UITacticalHUD_EnemyPreview(`PRES.m_kTacticalHUD.m_kEnemyPreview).UpdatePreviewTargets(PathTileData[PathTileData.Length - 1], ObjectsVisibleToPlayer);
            UIUnitFlagManager_GA(`PRES.m_kUnitFlagManager).RealizePreviewMovementAndLOS(self, PathTileData[PathTileData.Length - 1]);
		}
	}
}

//=======================================================================================================================================================
//	THIS IS IRIDARS MISSCLICK PROTECTION MOD - INCORPORATED WITH PERMISSION!
//=======================================================================================================================================================

simulated function RebuildPathingInformation(TTile PathDestination, Actor TargetActor, X2AbilityTemplate MeleeAbilityTemplate, TTile CursorTile)
{
	local float fdelay;

	//IF A CONTROLLER IS ACTIVE SKIP MCP REGARDLESS OF SETTINGS
	if (!`ISCONTROLLERACTIVE)
	{
		//IF MISS CLICK PROTECTION IS NOT DISABLED ADD A DELAY TO THE CLICK
		if (!`GETMCMVAR(DisableMCP))
		{
			//ensure activation is always slightly delayed even it is set to 0.0
			fdelay = `GETMCMVAR(fAllowClickDelay) + 0.01;
		
			DisallowCLick();
			SetTimer(fdelay, false, nameof(AllowClick), self);
		}
	}

	super.RebuildPathingInformation(PathDestination, TargetActor, MeleeAbilityTemplate, CursorTile);

}

private simulated function AllowClick()
{	
	local XComTacticalController_MCP TacticalController;

	TacticalController = XComTacticalController_MCP(GetALocalPlayerController());
	TacticalController.bCanClick = true;

	PuckMeshComponent.SetOpacity(1.0f);
}

private simulated function DisallowCLick()
{	
	local XComTacticalController_MCP TacticalController;

	TacticalController = XComTacticalController_MCP(GetALocalPlayerController());
	TacticalController.bCanClick = false;

	PuckMeshComponent.SetOpacity(`GETMCMVAR(fCursorOpacity_ClickDisallowed));
}

//=======================================================================================================================================================
//=======================================================================================================================================================
