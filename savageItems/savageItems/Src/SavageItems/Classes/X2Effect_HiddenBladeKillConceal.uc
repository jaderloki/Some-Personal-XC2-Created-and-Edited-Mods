//Based on
//---------------------------------------------------------------------------------------
//  FILE:    X2Effect_DLC_Day60Shadowfall.uc
//  AUTHOR:  Joshua Bouscher
//           
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------
class X2Effect_HiddenBladeKillConceal extends X2Effect_Persistent;

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
	local X2EventManager EventMgr;
	local XComGameState_Unit UnitState;
	local Object EffectObj;

	EventMgr = `XEVENTMGR;
	EffectObj = EffectGameState;
	UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));

	EventMgr.RegisterForEvent(EffectObj, 'KillMail', SAVHiddenBladesListener, ELD_OnStateSubmitted, , UnitState);
}

static function EventListenerReturn SAVHiddenBladesListener(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameStateContext_Ability AbilityContext;
	local XComGameState_Unit Killer;

	//  if the kill was made with Shadowfall and the killer is revealed, then conceal them
	Killer = XComGameState_Unit(EventSource);
	AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
	if (Killer != None && AbilityContext != none && AbilityContext.InputContext.AbilityTemplateName == 'SavHiddenBladeStab' && !Killer.IsConcealed())
	{
		Killer.EnterConcealment();      //  this creates a new game state and submits it
	}

	return ELR_NoInterrupt;
}