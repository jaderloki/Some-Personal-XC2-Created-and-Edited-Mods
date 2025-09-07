//---------------------------------------------------------------------------------------
//  FILE:    X2AbilityCooldown.uc
//  AUTHOR:  Joshua Bouscher
//           
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------
class X2AbilityCooldownGrenades extends X2AbilityCooldown

struct native GrenadeInformation
{
	var Name TemplateName;
	var int BaseCooldown;
};
var config array<GrenadeInformation> grenadeType;

simulated function ApplyCooldown(XComGameState_Ability kAbility, XComGameState_BaseObject AffectState, XComGameState_Item AffectWeapon, XComGameState NewGameState)
{
	local XComGameStateContext_Ability AbilityContext;

	// For debug only
	if(`CHEATMGR != None && `CHEATMGR.strAIForcedAbility ~= string(kAbility.GetMyTemplateName()))
		iNumTurns = 0;

	if(bDoNotApplyOnHit)
	{
		AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());
		if(AbilityContext != None && AbilityContext.IsResultContextHit())
			return;
	}
	kAbility.iCooldown = GetNumTurns(kAbility, AffectState, AffectWeapon, NewGameState);

	ApplyAdditionalCooldown(kAbility, AffectState, AffectWeapon, NewGameState);
}

simulated function int GetNumTurns(XComGameState_Ability kAbility, XComGameState_BaseObject AffectState, XComGameState_Item AffectWeapon, XComGameState NewGameState)
{
	return iNumTurns;
}

function getNumberOfCooldowns(name thisTemplate, XComGameState_Unit unit){
	local int quantity;
	local int baseCooldown;
	local XComGameState_Item InventoryItem;
	local array<XComGameState_Item> CurrentInventory;
	local GrenadeInformation grenadeInfo;

	quantity = 0;
	CurrentInventory = unit.GetAllInventoryItems(StartState);
	foreach CurrentInventory(InventoryItem){
		if(InventoryItem.GetMyTemplate() == thisTemplate){
			quantity++;
		}
	}
	
	baseCooldown = 5;
	foreach grenadeType(grenadeInfo){
		if(grenadeInfo.TemplateName == thisTemplate){
			return grenadeInfo.BaseCooldown;
		}
	}
}