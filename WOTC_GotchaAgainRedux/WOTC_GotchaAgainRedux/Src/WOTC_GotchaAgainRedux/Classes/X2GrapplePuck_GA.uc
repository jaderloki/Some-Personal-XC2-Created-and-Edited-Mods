////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    10/07/23    02:00
////////////////////////////////////////////////////////////////////////////////////////////////////

class X2GrapplePuck_GA extends X2GrapplePuck;

`include(WOTC_GotchaAgainRedux\Src\ModConfigMenuAPI\MCM_API_CfgHelpers.uci)

var private vector LastLOSLocation;

////////////////////////////////////////////////////////////////////////////////////////////////////
//	ON TICK - UPDATE PUCK BASED ON GOTCHA SETTINGS
////////////////////////////////////////////////////////////////////////////////////////////////////

simulated event Tick(float DeltaTime)
{
    local UIUnitFlagManager_GA UnitFlagManager;
    local GameplayTileData MoveToTileData;
    local Vector GrappleTargetLocation;

    //CALL BASEGAME UPDATE
    super.Tick(DeltaTime);

    // If this is not enabled, just return and skip updating the LOS indicators
    if(`GETMCMVAR(bShowLOSIndicatorsForGrappleDestinations))
    {
        // If a valid grapplelocation exists and a new one is selected, update LOS indicators based on it
        if(GetGrappleTargetLocation(GrappleTargetLocation) && GrappleTargetLocation != LastLOSLocation)
        {
            // Gotcha Agains overridden RealizePreviewEndOfMoveLOS does not use all fields of the GameplayTileData parameter, so we only fill what is needed
            MoveToTileData.SourceObjectID = XComTacticalController(`XWORLDINFO.GetALocalPlayerController()).ControllingUnit.ObjectID;
            MoveToTileData.EventTile = `XWORLD.GetTileCoordinatesFromPosition(GrappleTargetLocation);
            
            UnitFlagManager = UIUnitFlagManager_GA(`PRES.m_kUnitFlagManager);

            UnitFlagManager.GrappleIsActive = true;
            
            //UnitFlagManager.RealizePreviewEndOfMoveLOS(MoveToTileData);
            UnitFlagManager.RealizePreviewMovementAndLOS(none, MoveToTileData);
            UnitFlagManager.GrappleIsActive = false;

            LastLOSLocation = GrappleTargetLocation;
        }
    }
}
