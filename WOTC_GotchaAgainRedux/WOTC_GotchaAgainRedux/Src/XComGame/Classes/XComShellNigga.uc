/**
 * Copyright 1998-2008 Epic Games, Inc. All Rights Reserved.
 */
//=============================================================================
// CheatManager
// Object within playercontroller that manages "cheat" commands
//=============================================================================

class XComShellNigga extends XComCheatManager;
	//native;

exec function ForceCompleteObjectiveGay()
{
	local XComGameStateHistory History;
	local XComGameState_Objective ObjectiveState;
	local XComGameState NewGameState;

	History = `XCOMHISTORY;
		NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("CHEAT: Force Complete Objective");

	foreach History.IterateByClassType(class'XComGameState_Objective', ObjectiveState)
	{
		//if (ObjectiveState.GetMyTemplateName() == ObjectiveName)
		//{
			ObjectiveState = XComGameState_Objective(NewGameState.ModifyStateObject(class'XComGameState_Objective', ObjectiveState.ObjectID));
			ObjectiveState.CompleteObjective(NewGameState);
		//}
	}

	if (NewGameState.GetNumGameStateObjects() > 0)
	{
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	}
	else
	{
		History.CleanupPendingGameState(NewGameState);
	}
}

defaultproperties
{
}
