////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    10/07/23    02:00
////////////////////////////////////////////////////////////////////////////////////////////////////

class X2MeleePathingPawn_GA extends X2MeleePathingPawn;

`include(WOTC_GotchaAgainRedux\Src\ModConfigMenuAPI\MCM_API_CfgHelpers.uci)

// We do this elsewhere in order to properly handle conflicts with our new markers
function /* protected */ UpdatePathMarkers()
{
    if(`GETMCMVAR(bUseCustomPathIndicatorSystem))
	{ 
		//======THIS IS GOTCHA AGAIN PEEK FROM CONCEALMENT UI FIX
		//CHECK MASTER TOGGLE, BAIL IF PFC IS DISABLED
		if (!`GETMCMVAR(DisablePFC))
		{
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
