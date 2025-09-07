//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_ExampleWeapon.uc
//  AUTHOR:  Ryan McFall
//           
//	Demonstrates how to use the X2DownloadableContentInfo class to specify unique mod
//  behavior when the player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_WOTC_GrenadeForDays extends X2DownloadableContentInfo config(GrenadesCooldowns);

struct native GrenadeActionInformation
{
	var Name TemplateName;
	var float CooldownMultiplier;
};
var config array<GrenadeActionInformation> actionsToModify;

/// <summary>
/// Called after the Templates have been created (but before they are validated) while this DLC / Mod is installed.
/// </summary>
static event OnPostTemplatesCreated()
{
	local GrenadeActionInformation grenadeInfo;

	`log("FFS GRENADES");
	foreach class'X2DownloadableContentInfo_WOTC_GrenadeForDays'.default.actionsToModify(grenadeInfo)
	{
		`log("FFS GRENADES LOOP " $ grenadeInfo.TemplateName);
		MakeCooldownInsteadOfCharge(grenadeInfo.TemplateName, grenadeInfo.CooldownMultiplier);
	}
	//MakeCooldownInsteadOfCharge('ThrowGrenade', 1);
	//MakeCooldownInsteadOfCharge('LaunchGrenade', 0.5);
	//MakeCooldownInsteadOfCharge('IRI_ThrowMolotov', 1);
	//MakeCooldownInsteadOfCharge('IRI_LaunchOrdnance', 1);
	//MakeCooldownInsteadOfCharge('IRI_BlastOrdnance', 1);
	//MakeCooldownInsteadOfCharge('LWRocketLauncher', 1);
	//MakeCooldownInsteadOfCharge('LWBlasterLauncher', 1);
	//MakeCooldownInsteadOfCharge('MicroMissiles', 1);
	//MakeCooldownInsteadOfCharge('LWFlamethrower', 1);

	//MakeCooldownInsteadOfCharge('Fire_UBS_Conv', 1);
	//MakeCooldownInsteadOfCharge('Fire_UBS_Mag', 1);
	//MakeCooldownInsteadOfCharge('Fire_UBS_Beam', 1);
	//MakeCooldownInsteadOfCharge('Fire_UBGL_Conv', 1);
	//MakeCooldownInsteadOfCharge('Fire_UBGL_Mag', 1);
	//MakeCooldownInsteadOfCharge('Fire_UBGL_Beam', 1);
	//MakeCooldownInsteadOfCharge('Fire_UBFlame_Conv', 1);
	//MakeCooldownInsteadOfCharge('Fire_UBFlame_Mag', 1);
	//MakeCooldownInsteadOfCharge('Fire_UBFlame_Beam', 1);
}

static event OnPreMission(XComGameState StartGameState, XComGameState_MissionSite MissionState)
{
	class'XComGameState_Turns'.static.resetNumberOfTurns(StartGameState);
}

function EventListenerReturn BeginTurn(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData) {
    class'XComGameState_Turns'.static.addNewTurnNumber();
	return ELR_NoInterrupt;
}

static function MakeCooldownInsteadOfCharge(name AbilityName, float CooldownMultiplier) {
	local X2AbilityTemplateManager			AbilityManager;
	local array<X2AbilityTemplate>			TemplateAllDifficulties;
	local X2AbilityTemplate					Template;
	local X2AbilityCost_Ammo                AmmoCost;

	local X2AbilityCost						AbilityCost;
	local X2AbilityCooldownGrenades					Cooldown;
	local int i;

	// Find the ability templates
	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
	AbilityManager.FindAbilityTemplateAllDifficulties(AbilityName, TemplateAllDifficulties);
	
	// Edit the templates
	foreach TemplateAllDifficulties(Template)
	{
		`log("Replacing " @ AbilityName $ "'s cost.");

		// Remove all charge costs
		foreach Template.AbilityCosts(AbilityCost) {
			if (X2AbilityCost_Ammo(AbilityCost) != none) {
				Template.AbilityCosts.RemoveItem(AbilityCost);
			}
		}

		// Set the cooldown cost
		Cooldown = new class'X2AbilityCooldownGrenades';
		Cooldown.CooldownMultiplier = CooldownMultiplier;
		Cooldown.currentQuantity = -1;
		Template.AbilityCooldown = Cooldown;
	}
}

