////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    10/07/23    02:00
////////////////////////////////////////////////////////////////////////////////////////////////////

class UISpecialMissionHUD_Arrows_GA extends UISpecialMissionHUD_Arrows;

`include(WOTC_GotchaAgainRedux\Src\ModConfigMenuAPI\MCM_API_CfgHelpers.uci)

////////////////////////////////////////////////////////////////////////////////////////////////////
//	UPDATE
////////////////////////////////////////////////////////////////////////////////////////////////////

function UpdateVisibility()
{
    // If this is not enabled, call use the superclass function
    if(`GETMCMVAR(bDisableHideObjectiveArrowsWhenUsingGrapple) || `GETMCMVAR(bShowLOSIndicatorsForGrappleDestinations))
	{
		//We want to hide these arrows while the shotHUD is open, except when it is for the grapple ability
		if( `PRES.m_kTacticalHUD.IsMenuRaised() && X2TargetingMethod_Grapple(`PRES.m_kTacticalHUD.GetTargetingMethod()) == none)
		{ Hide(); } else { Show(); }
	}
	else
	{
		super.UpdateVisibility();
        return;
    } 
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	RESTORE ARROWS ON LOAD
////////////////////////////////////////////////////////////////////////////////////////////////////

function AddExistingArrows()
{
	local XComGameState_IndicatorArrow_GA Arrow;

	//ADD AND UPDATE OUR NEW TYPE ARROWS
	foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_IndicatorArrow_GA', Arrow)
	{   
        // Detect if ADVENT towers have already been hacked in this mission
        if(Arrow.CurrentIndicatorValue == eAlreadyHacked && Arrow.IconSetIdentifier == eHackAdventTower)
		{
            UIUnitFlagManager_GA(`PRES.m_kUnitFlagManager).GetObjectiveIndicatorUtility().SetTowersHaveBeenHackedAlready();
        }

		ProcessArrowGameStateObject(Arrow);
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	ADD NEW INDICATOR ARROW - TOWARDS VIP OR OBJECT
////////////////////////////////////////////////////////////////////////////////////////////////////

simulated function AddArrowPointingAtActor( Actor kActor, optional vector offset, optional EUIState arrowState = eUIState_Warning, optional int arrowCount = -1, optional string icon = "")
{
	local int index;
	local T3DArrow actorArrow; 
	
	//`log( "Failing to add a UI arrow pointer to track an actor, because the actor reference is none.");
	if( kActor == none ) { return; }

	index = arr3DArrows.Find('kActor', kActor);
	if(index != -1)
	{
		// Update data on arrow
		arr3DArrows[index].offset = offset;
		arr3DArrows[index].arrowState = arrowState;
		arr3DArrows[index].arrowCounter = arrowCount;
        // Never replace with nothing!
        if(icon != "")
		{
		    arr3DArrows[index].icon = icon;
        }
	}
	else
	{
		actorArrow.kActor = kActor;
		actorArrow.offset = offset;
		actorArrow.arrowState = arrowState;
		actorArrow.arrowCounter = arrowCount;
		actorArrow.icon = icon;
		arr3DArrows.AddItem(actorArrow );
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	ADD NEW INDICATOR ARROW - TOWARDS LOCATION
////////////////////////////////////////////////////////////////////////////////////////////////////

simulated function AddArrowPointingAtLocation( vector loc, optional vector offset, optional EUIState arrowState = eUIState_Warning, optional int arrowCount = -1, optional string icon = "" )
{
	local int index;
	local T3DArrow actorArrow; 

	index = arr3DArrows.Find('loc', loc);
	if(index != -1)
	{
		// Update data on arrow
		arr3DArrows[index].offset = offset;
		arr3DArrows[index].arrowState = arrowState;
		arr3DArrows[index].arrowCounter = arrowCount;
        // Never replace with nothing!
        if(icon != "")
		{
		    arr3DArrows[index].icon = icon;
        }
	}
	else
	{
		actorArrow.loc = loc;
		actorArrow.offset = offset;
		actorArrow.arrowState = arrowState;
		actorArrow.arrowCounter = arrowCount;
		actorArrow.icon= icon;
		arr3DArrows.AddItem( actorArrow );
	}
}
