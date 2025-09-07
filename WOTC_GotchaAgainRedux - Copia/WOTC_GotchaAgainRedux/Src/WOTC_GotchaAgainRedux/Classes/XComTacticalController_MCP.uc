////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS (IRIDAR)
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    11/07/23	08:00
////////////////////////////////////////////////////////////////////////////////////////////////////

class XComTacticalController_MCP extends XComTacticalController;

`include(WOTC_GotchaAgainRedux\Src\ModConfigMenuAPI\MCM_API_CfgHelpers.uci)

var bool bCanClick;

//=======================================================================================================================================================
//	THIS IS IRIDARS MISSCLICK PROTECTION MOD - INCORPORATED WITH PERMISSION!
//=======================================================================================================================================================

simulated function bool PerformPath(XGUnit kUnit, optional bool bUserCreated=false)
{
	//IF A CONTROLLER IS ACTIVE SKIP MCP REGARDLESS OF SETTINGS
	if (!`ISCONTROLLERACTIVE)
	{
		//IF MISS CLICK PROTECTION IS NOT DISABLED ADD A DELAY TO THE CLICK
		if (!`GETMCMVAR(DisableMCP))
		{
			if (bCanClick)
			{
				bCanClick = false;
				return super.PerformPath(kUnit, bUserCreated);
			}
			return false;
		}
	}

	//ELSE JUST RUN THE NORMAL FUNCTION, MCP WAS DISABLED
	return super.PerformPath(kUnit, bUserCreated);
}

//=======================================================================================================================================================
//=======================================================================================================================================================
