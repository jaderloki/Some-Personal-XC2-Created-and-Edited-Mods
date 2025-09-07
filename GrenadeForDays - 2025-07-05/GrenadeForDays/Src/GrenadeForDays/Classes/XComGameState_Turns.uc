//---------------------------------------------------------------------------------------
//  FILE:    X2AbilityCooldown.uc
//  AUTHOR:  Joshua Bouscher
//           
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------
class XComGameState_Turns extends XComGameState_BaseObject;

var int numberOfTurns;
static function addNewTurnNumber()
{
	local XComGameState_Turns fuck;
    fuck = XComGameState_Turns(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_Turns'));
	fuck.numberOfTurns = fuck.numberOfTurns + 1;
	`log("Turns count " $ fuck.numberOfTurns);
}

static function resetNumberOfTurns(XComGameState StartGameState) {
	local XComGameState_Turns fuck;

	fuck = XComGameState_Turns(StartGameState.CreateNewStateObject(class'XComGameState_Turns'));
	`log("Turns reseted");
	fuck.numberOfTurns = 0;
}

static function int getCurrentTurnNumber(){
	//local XComGameState_Turns fuck;

	//fuck = XComGameState_Turns(StartGameState.CreateNewStateObject(class'XComGameState_Turns'));
	//return fuck.numberOfTurns;
	return 1;
}