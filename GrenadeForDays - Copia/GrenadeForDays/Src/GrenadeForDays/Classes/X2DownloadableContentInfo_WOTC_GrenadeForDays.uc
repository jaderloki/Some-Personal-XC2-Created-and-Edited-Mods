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

class X2DownloadableContentInfo_WOTC_GrenadeForDays extends X2DownloadableContentInfo
	config(CooldownsInsteadOfCharges);

var config int COMBAT_PROTOCOL_COOLDOWN;
var config int REVIVAL_PROTOCOL_COOLDOWN;
var config int SCANNING_PROTOCOL_COOLODOWN;
var config int RESTORATION_COOLDOWN;
var config int CAPACITATOR_DISCHARGE_COOLDOWN;

/// <summary>
/// Called after the Templates have been created (but before they are validated) while this DLC / Mod is installed.
/// </summary>
static event OnPostTemplatesCreated()
{
	MakeCooldownInsteadOfCharge('ThrowGrenade', default.CONCEAL_COOLDOWN);
}

static function MakeCooldownInsteadOfCharge(name AbilityName, int ConfigCooldown) {
	local X2AbilityTemplateManager			AbilityManager;
	local array<X2AbilityTemplate>			TemplateAllDifficulties;
	local X2AbilityTemplate					Template;

	local X2AbilityCost						AbilityCost;
	local X2AbilityCooldown					Cooldown;

	if (ConfigCooldown < 0)
		return;

	// Find the ability templates
	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
	AbilityManager.FindAbilityTemplateAllDifficulties(AbilityName, TemplateAllDifficulties);
	
	// Edit the templates
	foreach TemplateAllDifficulties(Template)
	{
		`log("Replacing " @ AbilityName $ "'s cost.");

		// Remove all charge costs
		foreach Template.AbilityCosts(AbilityCost) {
			if (X2AbilityCost_Charges(AbilityCost) != none) {
				Template.AbilityCosts.RemoveItem(AbilityCost);
			}
		}

		// Remove all charges
		Template.AbilityCharges = none;

		// Set the cooldown cost
		Cooldown = new class'X2AbilityCooldown';
		Cooldown.iNumTurns = ConfigCooldown;
		Template.AbilityCooldown = Cooldown;
	}
}