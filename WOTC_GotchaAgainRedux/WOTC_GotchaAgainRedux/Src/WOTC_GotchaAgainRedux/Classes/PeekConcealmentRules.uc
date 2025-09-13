////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    10/07/23    02:00
////////////////////////////////////////////////////////////////////////////////////////////////////

//THIS IS PEEK FROM CONCEALMENTS RULE CHANGES
class PeekConcealmentRules extends Object;

`include(WOTC_GotchaAgainRedux\Src\ModConfigMenuAPI\MCM_API_CfgHelpers.uci)

////////////////////////////////////////////////////////////////////////////////////////////////////
//	NEW IS VISIBLE CHECKS FOR PEEK FROM CONCEALMENT RULES
////////////////////////////////////////////////////////////////////////////////////////////////////

// Determines whether (ThisUnit) is, when concealed, visible to (OtherUnit).
static function bool IsVisible(XComGameState_Unit ThisUnitState, XComGameState_Unit OtherUnitState, GameRulesCache_VisibilityInfo VisibilityInfoFromOtherUnit)
{
	local float ConcealmentDetectionDistance;

	//CHECK MASTER TOGGLE, BAIL IF PFC IS DISABLED, IF IT IS DISABLED WE SHOULD NEVER GET HERE, BUT JUST IN CASE ...
	if (!`GETMCMVAR(DisablePFC))
	{
		// not visible when in high cover relative to the viewer unit
		if (`GETMCMVAR(HideInHighCover) && VisibilityInfoFromOtherUnit.TargetCover == CT_Standing)
		{
			return false; 
		}
		
		// not visible when in any cover + height advantage to the other unit
		if (`GETMCMVAR(HideWithHeightAdvantage) && ThisUnitState.HasHeightAdvantageOver(OtherUnitState, false) && VisibilityInfoFromOtherUnit.TargetCover != CT_None)
		{
			return false; 
		}
	}

	// need to be within detection range.
	ConcealmentDetectionDistance = ThisUnitState.GetConcealmentDetectionDistance(OtherUnitState);

	return VisibilityInfoFromOtherUnit.DefaultTargetDist <= Square(ConcealmentDetectionDistance);
}
