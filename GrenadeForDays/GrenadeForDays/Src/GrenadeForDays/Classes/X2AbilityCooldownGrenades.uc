//---------------------------------------------------------------------------------------
//  FILE:    X2AbilityCooldown.uc
//  AUTHOR:  Joshua Bouscher
//           
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------
class X2AbilityCooldownGrenades extends X2AbilityCooldown config(GrenadesCooldowns);

struct native GrenadeInformation
{
	var Name TemplateName;
	var int BaseCooldown;
};
var config array<GrenadeInformation> grenadeType;
var float CooldownMultiplier;
var int currentQuantity;
var int firstTurnCooldownHitted;

/*
{
	listofgranade.append(5)
}
*/

simulated function ApplyCooldown(XComGameState_Ability kAbility, XComGameState_BaseObject AffectState, XComGameState_Item AffectWeapon, XComGameState NewGameState)
{
	local XComGameStateContext_Ability AbilityContext;

	// For debug only
	if(`CHEATMGR != None && `CHEATMGR.strAIForcedAbility ~= string(kAbility.GetMyTemplateName())){
		iNumTurns = 0;
	}
	if(currentQuantity == -1){
		currentQuantity = getItemQuantity(getItemName(kAbility, AffectWeapon), getUnitFromAbility(kAbility.OwnerStateObject));
	}

	if(bDoNotApplyOnHit){
		AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());
		if(AbilityContext != None && AbilityContext.IsResultContextHit()){
			return;
		}
	}
	if(currentQuantity == getItemQuantity(getItemName(kAbility, AffectWeapon), getUnitFromAbility(kAbility.OwnerStateObject))){
		firstTurnCooldownHitted = class'XComGameState_Turns'.static.getCurrentTurnNumber();
	}
	currentQuantity = FMax(0, currentQuantity - 1);

	//if(currentQuantity == 0){
		kAbility.iCooldown = GetNumTurns(kAbility, AffectState, AffectWeapon, NewGameState);

		//if(currentQuantity == 0){
			ApplyAdditionalCooldown(kAbility, AffectState, AffectWeapon, NewGameState);
		//}
	//}
}

simulated function int GetNumTurns(XComGameState_Ability kAbility, XComGameState_BaseObject AffectState, XComGameState_Item AffectWeapon, XComGameState NewGameState)
{
	local float cooldownValue;
	local name nameTemplate;
	local X2GrenadeTemplate GrenadeTemplate;
	local int numberOfTurnsToCooldown;

	`log("GetNumTurns");

	nameTemplate = getItemName(kAbility, AffectWeapon);

	cooldownValue = getNumberOfCooldowns(
		nameTemplate, 
		getUnitFromAbility(kAbility.OwnerStateObject),
		NewGameState
	) * cooldownMultiplier;
	`log("GetNumTurns nameTemplate " $ nameTemplate $ " cooldownvalue " $ FMax(0, FCeil(cooldownValue)) $ "  " $ cooldownValue $ " " $ nameTemplate $ " " $ cooldownMultiplier);
	numberOfTurnsToCooldown = FMax(0, FCeil(cooldownValue));
	//return firstTurnCooldownHitted = class'XComGameState_Turns'.static.getCurrentTurnNumber();
	return numberOfTurnsToCooldown;
}

simulated function int getNumberOfCooldowns(name thisTemplate, XComGameState_Unit unit, XComGameState NewGameState){
	local int quantity, k;
	local int baseCooldown;
	local GrenadeInformation grenadeInfo;
	local StateObjectReference ItemRef;
	local XComGameState_Item Item;

	quantity = getItemQuantity(thisTemplate, unit);
	
	baseCooldown = 5;
	foreach grenadeType(grenadeInfo){
		if(grenadeInfo.TemplateName == thisTemplate){
			baseCooldown = grenadeInfo.BaseCooldown;
			break;
		}
	}
	return baseCooldown / FMax(1, quantity);
}

simulated function int getItemQuantity(name thisTemplate, XComGameState_Unit unit){
	local int quantity;
	local StateObjectReference ItemRef;
	local XComGameState_Item Item;

	quantity = 0;
	`log("check quantity");
	foreach unit.InventoryItems(ItemRef){
		Item = XComGameState_Item(`XCOMHISTORY.GetGameStateForObjectID(ItemRef.ObjectID));
		`log("getNumberOfCooldowns 1 " $ Item.GetMyTemplateName() $ " " $ thisTemplate);
		if(Item.GetMyTemplateName() == thisTemplate){
			`log("got it " $ Item.Quantity $ " " $ Item.Ammo);
			quantity += FMax(1, Item.Ammo);
		}
	}
	
	return quantity;
}

simulated function name getItemName(XComGameState_Ability kAbility, XComGameState_Item AffectWeapon){
	local X2GrenadeTemplate GrenadeTemplate;
	if (kAbility.GetMyTemplate().bUseLaunchedGrenadeEffects){
		GrenadeTemplate = X2GrenadeTemplate(AffectWeapon.GetLoadedAmmoTemplate(kAbility));
		return GrenadeTemplate.DataName;
	}else{
		return AffectWeapon.GetMyTemplateName();
	}
}

simulated function XComGameState_Unit getUnitFromAbility(StateObjectReference OwnerStateObject){
	return XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(OwnerStateObject.ObjectID));
}