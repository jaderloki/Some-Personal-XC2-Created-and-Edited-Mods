class X2Item_SavageUniqueWeapons extends X2Item config(GameData_SavitemsWeaponData);

var config WeaponDamageValue LILRIPPER_BASEDAMAGE;
var config WeaponDamageValue LILRIPPER2_BASEDAMAGE;
var config WeaponDamageValue LILRIPPER3_BASEDAMAGE;
var config int LILRIPPER_TPV;
var config int LILRIPPER2_TPV;
var config int LILRIPPER3_TPV;
var config int SUPPLY_COST_LILRIPPER2;
var config int ALLOY_COST_LILRIPPER2;
var config int SUPPLY_COST_LILRIPPER3;
var config int ALLOY_COST_LILRIPPER3;
var config array<name> LilRipperUpgrades;
var config array<name> LilRipper3Upgrades;

var config WeaponDamageValue PROTOTYPELASERRIFLE_BASEDAMAGE;
var config WeaponDamageValue PROTOTYPELASERRIFLE3_BASEDAMAGE;
var config int PROTOTYPELASERRIFLE_TPV;
var config int PROTOTYPELASERRIFLE3_TPV;
var config int SUPPLY_COST_PROTOTYPELASERRIFLE3;
var config int ELERIUM_COST_PROTOTYPELASERRIFLE3;
var config array<name> PrototypeLaserRifleUpgrades;
var config array<name> PrototypeLaserRifle3Upgrades;

var config WeaponDamageValue HARPOONGUN_BASEDAMAGE;
var config WeaponDamageValue HARPOONGUN2_BASEDAMAGE;
var config WeaponDamageValue HARPOONGUN3_BASEDAMAGE;
var config int HARPOONGUN_CRITCHANCE;
var config int HARPOONGUN2_CRITCHANCE;
var config int HARPOONGUN3_CRITCHANCE;
var config int HARPOONGUN_TPV;
var config int HARPOONGUN2_TPV;
var config int HARPOONGUN3_TPV;
var config int SUPPLY_COST_HARPOONGUN2;
var config int ALLOY_COST_HARPOONGUN2;
var config int SUPPLY_COST_HARPOONGUN3;
var config int ECORE_COST_HARPOONGUN3;
var config int HARPOONGUN_BLEEDING_NUM_TURNS;
var config int HARPOONGUN_BLEEDING_TICK_DMG;
var config int HARPOONGUN_BLEEDING2_TICK_DMG;
var config int HARPOONGUN_BLEEDING3_TICK_DMG;

var config WeaponDamageValue QUICKSILVER_BASEDAMAGE;
var config int QUICKSILVER_TPV;
var config WeaponDamageValue QUICKSILVER_IMPROVED_BASEDAMAGE;
var config int QUICKSILVER_IMPROVED_TPV;
var config WeaponDamageValue QUICKSILVER_PERFECTED_BASEDAMAGE;
var config int QUICKSILVER_PERFECTED_TPV;
var config int ENHANCE_QUICKSILVER_SUPPLIES;
var config int ENHANCE_QUICKSILVER_ALLOYS;
var config int PERFECT_QUICKSILVER_SUPPLIES;
var config int PERFECT_QUICKSILVER_ELERIUM;

var config WeaponDamageValue OPPRESSORSEND_DAMAGE;
var config int OPPRESSORSEND_TPV;
var config WeaponDamageValue OPPRESSORSEND_IMPROVED_DAMAGE;
var config int OPPRESSORSEND_IMPROVED_TPV;
var config WeaponDamageValue OPPRESSORSEND_PERFECTED_DAMAGE;
var config int OPPRESSORSEND_PERFECTED_TPV;
var config array<name> OppressorsEndUpgrades;
var config array<name> OppressorsEndPerfectedUpgrades;
var config int ENHANCE_OPPRESSORSEND_SUPPLIES;
var config int ENHANCE_OPPRESSORSEND_ALLOYS;
var config int PERFECT_OPPRESSORSEND_SUPPLIES;
var config int PERFECT_OPPRESSORSEND_ELERIUM;

var config WeaponDamageValue ABSOLUTEZERO_BASEDAMAGE;
var config int ABSOLUTEZERO_ENVDAMAGE;
var config int ABSOLUTEZERO_TPV;
var config WeaponDamageValue ABSOLUTEZERO2_BASEDAMAGE;
var config int ABSOLUTEZERO2_TPV;
var config array<name> AbsoluteZeroUpgrades;
var config array<name> AbsoluteZero2Upgrades;
var config int PERFECT_ABSOLUTEZERO2_SUPPLIES;
var config int PERFECT_ABSOLUTEZERO2_ELERIUM;

var config WeaponDamageValue PROTOLASERSNIPER_BASEDAMAGE;
var config int PROTOLASERSNIPER_TPV;
var config WeaponDamageValue PROTOLASERSNIPER_PERFECTED_BASEDAMAGE;
var config int PROTOLASERSNIPER_PERFECTED_TPV;
var config array<name> ProtoLaserSniperUpgrades;
var config array<name> ProtoLaserSniperPerfectedUpgrades;
var config int PERFECT_PROTOLASERSNIPER_SUPPLIES;
var config int PERFECT_PROTOLASERSNIPER_ELERIUM;

var config WeaponDamageValue VIPERFANG_BASEDAMAGE;
var config WeaponDamageValue VIPERFANG3_BASEDAMAGE;
var config int VIPERFANG_TPV;
var config int VIPERFANG3_TPV;
var config int SUPPLY_COST_VIPERFANG3;
var config int ALLOY_COST_VIPERFANG3;

var config WeaponDamageValue JAGGED_AXE_BASEDAMAGE;
var config WeaponDamageValue JAGGED_AXE2_BASEDAMAGE;
var config WeaponDamageValue JAGGED_AXE3_BASEDAMAGE;
var config int JAGGED_AXE_TPV;
var config int JAGGED_AXE2_TPV;
var config int JAGGED_AXE3_TPV;
var config int SUPPLY_COST_JAGGED_AXE2;
var config int ALLOY_COST_JAGGED_AXE2;
var config int ALLOY_COST_JAGGED_AXE3;
var config int ELERIUM_COST_JAGGED_AXE3;

var config WeaponDamageValue ENDLESSVENGEANCE_BASEDAMAGE;
var config WeaponDamageValue ENDLESSVENGEANCE2_BASEDAMAGE;
var config WeaponDamageValue ENDLESSVENGEANCE3_BASEDAMAGE;
var config int ENDLESSVENGEANCE_TPV;
var config int ENDLESSVENGEANCE2_TPV;
var config int ENDLESSVENGEANCE3_TPV;
var config int SUPPLY_COST_ENDLESSVENGEANCE2;
var config int ALLOY_COST_ENDLESSVENGEANCE2;
var config int SUPPLY_COST_ENDLESSVENGEANCE3;
var config int ALLOY_COST_ENDLESSVENGEANCE3;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
//////Rifles////////////////////////////////////////////////////////
	Weapons.AddItem(CreateSAV_Unique_LilRipper());
	Weapons.AddItem(CreateSAV_Unique_LilRipper_Enhanced());
	Weapons.AddItem(CreateSAV_Unique_LilRipper_Perfected());
//==================================================================
	Weapons.AddItem(CreateSAV_Unique_PrototypeLaserRifle());
	Weapons.AddItem(CreateSAV_Unique_PrototypeLaserRifle_Perfected());
//==================================================================
	Weapons.AddItem(CreateSAV_Unique_HarpoonGun());
	Weapons.AddItem(CreateSAV_Unique_HarpoonGun_Enhanced());
	Weapons.AddItem(CreateSAV_Unique_HarpoonGun_Perfected());
//////Pistols///////////////////////////////////////////////////////
	Weapons.AddItem(CreateSAV_Unique_Quicksilver());
	Weapons.AddItem(CreateSAV_Unique_Quicksilver_Improved());
	Weapons.AddItem(CreateSAV_Unique_Quicksilver_Perfected());
//////Shotguns//////////////////////////////////////////////////////
	Weapons.AddItem(CreateSAV_Unique_AbsoluteZero());
	Weapons.AddItem(CreateSAV_Unique_AbsoluteZero_Perfected());
//////Cannons///////////////////////////////////////////////////////
	Weapons.AddItem(CreateSAV_Unique_OppressorsEnd());
	Weapons.AddItem(CreateSAV_Unique_OppressorsEnd_Improved());
	Weapons.AddItem(CreateSAV_Unique_OppressorsEnd_Perfected());
//////SniperRifles//////////////////////////////////////////////////
	Weapons.AddItem(CreateSAV_Unique_PrototypeSniperRifle());
	Weapons.AddItem(CreateSAV_Unique_PrototypeSniperRifle_Perfected());
//////Swords////////////////////////////////////////////////////////
	Weapons.AddItem(CreateSAV_Unique_Viperfang());
	Weapons.AddItem(CreateSAV_Unique_Viperfang_Perfected());
//==================================================================
	Weapons.AddItem(CreateSAV_Unique_JaggedAxe());
	Weapons.AddItem(CreateSAV_Unique_JaggedAxeThrown());
	Weapons.AddItem(CreateSAV_Unique_JaggedAxe_Enhanced());
	Weapons.AddItem(CreateSAV_Unique_JaggedAxeThrown_Enhanced());
	Weapons.AddItem(CreateSAV_Unique_JaggedAxe_Perfected());
	Weapons.AddItem(CreateSAV_Unique_JaggedAxeThrown_Perfected());
//==================================================================
	Weapons.AddItem(CreateSAV_Legendary_EndlessVengeance());
	Weapons.AddItem(CreateSAV_Legendary_EndlessVengeance_Enhanced());
	Weapons.AddItem(CreateSAV_Legendary_EndlessVengeance_Perfected());
	return Weapons;
}

//////Rifles////////////////////////////////////////////////////////
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//Lil' Ripper

static function X2DataTemplate CreateSAV_Unique_LilRipper()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_LilRipper');
	Template.WeaponPanelImage = "_ConventionalRifle";
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_LilRipper";
	Template.Tier = 0;
	Template.OnAcquiredFn = OnSAV_Unique_LilRipperAcquired;
	Template.NumUpgradeSlots = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.LILRIPPER_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;

	Template.TradingPostValue = Default.LILRIPPER_TPV;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('SAVLetErRip');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "XComWeapon'SAV_UniqueWeapons.WP_LilRipper'";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;

	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	Template.RewardDecks.AddItem('SAVUniqueWeaponsRewards');

	return Template;
}

static function X2DataTemplate CreateSAV_Unique_LilRipper_Enhanced()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_LilRipper_Enhanced');
	Template.WeaponPanelImage = "_ConventionalRifle";
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_LilRipper";
	Template.Tier = 0;
	Template.OnAcquiredFn = OnSAV_Unique_LilRipperAcquired;
	Template.NumUpgradeSlots = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.LILRIPPER2_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;

	Template.TradingPostValue = Default.LILRIPPER2_TPV;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('SAVLetErRip');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "XComWeapon'SAV_UniqueWeapons.WP_LilRipper'";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function X2DataTemplate CreateSAV_Unique_LilRipper_Perfected()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_LilRipper_Perfected');
	Template.WeaponPanelImage = "_ConventionalRifle";
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_LilRipper";
	Template.Tier = 0;
	Template.OnAcquiredFn = OnSAV_Unique_LilRipper3Acquired;
	Template.NumUpgradeSlots = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.LILRIPPER3_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;

	Template.TradingPostValue = Default.LILRIPPER3_TPV;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('SAVLetErRip');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "XComWeapon'SAV_UniqueWeapons.WP_LilRipper'";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function bool OnSAV_Unique_LilRipperAcquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades( ItemState, default.LilRipperUpgrades);
	}

	return false;
}

static function bool OnSAV_Unique_LilRipper3Acquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades( ItemState, default.LilRipper3Upgrades);
	}

	return false;
}

//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//Prototype Laser Rifle

static function X2DataTemplate CreateSAV_Unique_PrototypeLaserRifle()
{
	local X2WeaponTemplate Template;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_PrototypeLaserRifle');
	Template.WeaponPanelImage = "_MagneticRifle";
	
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'magnetic';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_PrototypeLaserRifle";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 3;
	Template.OnAcquiredFn = OnSAV_Unique_PrototypeLaserRifleAcquired;
	Template.NumUpgradeSlots = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_MAGNETIC_RANGE;
	Template.BaseDamage = default.PROTOTYPELASERRIFLE_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;

	Template.TradingPostValue = Default.PROTOTYPELASERRIFLE_TPV;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('SAVPrototypePowerFluctuation');
	Template.Abilities.AddItem('SAVDefectivePowerSupply');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_PrototypeLaserRifle";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	Template.RewardDecks.AddItem('SAVUniqueWeaponsRewards');

	return Template;
}

static function X2DataTemplate CreateSAV_Unique_PrototypeLaserRifle_Perfected()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_PrototypeLaserRifle_Perfected');
	Template.WeaponPanelImage = "_MagneticRifle";
	
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'magnetic';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_PrototypeLaserRifle";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 3;
	Template.OnAcquiredFn = OnSAV_Unique_PrototypeLaserRifle3Acquired;
	Template.NumUpgradeSlots = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_MAGNETIC_RANGE;
	Template.BaseDamage = default.PROTOTYPELASERRIFLE3_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;

	Template.TradingPostValue = Default.PROTOTYPELASERRIFLE3_TPV;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('SAVPrototypePowerFluctuation');
	Template.Abilities.AddItem('SAVDefectivePowerSupply2');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_PrototypeLaserRifle";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function bool OnSAV_Unique_PrototypeLaserRifleAcquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades( ItemState, default.PrototypeLaserRifleUpgrades);
	}

	return false;
}

static function bool OnSAV_Unique_PrototypeLaserRifle3Acquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades( ItemState, default.PrototypeLaserRifle3Upgrades);
	}

	return false;
}

//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//Harpoon Gun

static function X2DataTemplate CreateSAV_Unique_HarpoonGun()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_HarpoonGun');
	Template.WeaponPanelImage = "_ConventionalRifle";
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Unique_HarpoonGun";
	Template.Tier = 0;

	Template.bCanBeDodged = false;
	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.HARPOONGUN_BASEDAMAGE;
	Template.Aim = class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_CONVENTIONAL_AIM;
	Template.CritChance = default.HARPOONGUN_CRITCHANCE;
	Template.iClipSize = class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.HARPOONGUN_TPV;

	Template.NumUpgradeSlots = 0;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_HarpoonGun";
	
	Template.BonusWeaponEffects.AddItem(HarpoonGunStunEffect());
	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBleedingStatusEffect(default.HARPOONGUN_BLEEDING_NUM_TURNS, default.HARPOONGUN_BLEEDING_TICK_DMG));
	Template.BonusWeaponEffects.AddItem(class'X2Effect_Harpooned'.static.CreateSavHarpoonedEffect());
	Template.iPhysicsImpulse = 15;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	
	Template.fKnockbackDamageAmount = 10.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_STUN_CHANCE, , , "%");

	Template.RewardDecks.AddItem('SAVUniqueWeaponsRewards');

	return Template;
}

static function X2DataTemplate CreateSAV_Unique_HarpoonGun_Enhanced()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_HarpoonGun_Enhanced');
	Template.WeaponPanelImage = "_ConventionalRifle";
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Unique_HarpoonGun";
	Template.Tier = 0;

	Template.bCanBeDodged = false;
	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.HARPOONGUN2_BASEDAMAGE;
	Template.Aim = class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_CONVENTIONAL_AIM;
	Template.CritChance = default.HARPOONGUN2_CRITCHANCE;
	Template.iClipSize = class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.HARPOONGUN2_TPV;

	Template.NumUpgradeSlots = 0;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_HarpoonGun";
	
	Template.BonusWeaponEffects.AddItem(HarpoonGunStunEffect());
	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBleedingStatusEffect(default.HARPOONGUN_BLEEDING_NUM_TURNS, default.HARPOONGUN_BLEEDING2_TICK_DMG));
	Template.BonusWeaponEffects.AddItem(class'X2Effect_Harpooned'.static.CreateSavHarpoonedEffect());
	Template.iPhysicsImpulse = 15;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	
	Template.fKnockbackDamageAmount = 10.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_STUN_CHANCE, , , "%");

	return Template;
}

static function X2DataTemplate CreateSAV_Unique_HarpoonGun_Perfected()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_HarpoonGun_Perfected');
	Template.WeaponPanelImage = "_ConventionalRifle";
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Unique_HarpoonGun";
	Template.Tier = 0;

	Template.bCanBeDodged = false;
	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.HARPOONGUN3_BASEDAMAGE;
	Template.Aim = class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_CONVENTIONAL_AIM;
	Template.CritChance = default.HARPOONGUN3_CRITCHANCE;
	Template.iClipSize = class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.HARPOONGUN3_TPV;

	Template.NumUpgradeSlots = 0;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_HarpoonGun";
	
	Template.BonusWeaponEffects.AddItem(HarpoonGunStunEffect());
	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBleedingStatusEffect(default.HARPOONGUN_BLEEDING_NUM_TURNS, default.HARPOONGUN_BLEEDING3_TICK_DMG));
	Template.BonusWeaponEffects.AddItem(class'X2Effect_Harpooned'.static.CreateSavHarpoonedEffect());
	Template.iPhysicsImpulse = 15;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	
	Template.fKnockbackDamageAmount = 10.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_STUN_CHANCE, , , "%");

	return Template;
}

//////Pistols////////////////////////////////////////////////////////
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//Quicksilver
static function X2DataTemplate CreateSAV_Unique_Quicksilver()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_Quicksilver');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'pistol';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_Quicksilver";
	Template.EquipSound = "Secondary_Weapon_Equip_Conventional";
	Template.Tier = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.QUICKSILVER_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.QUICKSILVER_TPV;

	Template.InfiniteAmmo = true;
	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.Abilities.AddItem('PistolOverwatch');
	Template.Abilities.AddItem('PistolOverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('Quickdraw');
	Template.Abilities.AddItem('ReturnFire');
	Template.Abilities.AddItem('QuicksilverReactions');

	Template.SetAnimationNameForAbility('FanFire', 'FF_FireMultiShotConvA');	

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_Quicksilver";

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	Template.bHideClipSizeStat = true;

	Template.RewardDecks.AddItem('SAVUniqueWeaponsRewards');

	return Template;
}

static function X2DataTemplate CreateSAV_Unique_Quicksilver_Improved()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_Quicksilver_Improved');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'pistol';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_Quicksilver";
	Template.EquipSound = "Secondary_Weapon_Equip_Conventional";
	Template.Tier = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.QUICKSILVER_IMPROVED_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.QUICKSILVER_IMPROVED_TPV;

	Template.InfiniteAmmo = true;
	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.Abilities.AddItem('PistolOverwatch');
	Template.Abilities.AddItem('PistolOverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('Quickdraw');
	Template.Abilities.AddItem('ReturnFire');
	Template.Abilities.AddItem('QuicksilverReactions');

	Template.SetAnimationNameForAbility('FanFire', 'FF_FireMultiShotConvA');	

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_Quicksilver";

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	Template.bHideClipSizeStat = true;

	return Template;
}

static function X2DataTemplate CreateSAV_Unique_Quicksilver_Perfected()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_Quicksilver_Perfected');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'pistol';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_Quicksilver";
	Template.EquipSound = "Secondary_Weapon_Equip_Conventional";
	Template.Tier = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.QUICKSILVER_PERFECTED_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.QUICKSILVER_PERFECTED_TPV;

	Template.InfiniteAmmo = true;
	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.Abilities.AddItem('PistolOverwatch');
	Template.Abilities.AddItem('PistolOverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('Quickdraw');
	Template.Abilities.AddItem('ReturnFire');
	Template.Abilities.AddItem('SAVQuicksilverHands');
	Template.Abilities.AddItem('QuicksilverReactions');

	Template.SetAnimationNameForAbility('FanFire', 'FF_FireMultiShotConvA');	

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_Quicksilver";

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	Template.bHideClipSizeStat = true;

	return Template;
}

//////Shotguns////////////////////////////////////////////////////////
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//AbsoluteZero
static function X2DataTemplate CreateSAV_Unique_AbsoluteZero()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_AbsoluteZero');
	Template.WeaponPanelImage = "_BeamShotgun";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'shotgun';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Unique_AbsoluteZero";
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 5;
	Template.OnAcquiredFn = OnSAV_Unique_AbsoluteZeroAcquired;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_BEAM_RANGE;
	Template.BaseDamage = default.ABSOLUTEZERO_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.SHOTGUN_BEAM_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.SHOTGUN_BEAM_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.SHOTGUN_BEAM_ICLIPSIZE;
	Template.iSoundRange = default.ABSOLUTEZERO_ENVDAMAGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.SHOTGUN_BEAM_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.ABSOLUTEZERO_TPV;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.BonusWeaponEffects.AddItem(class'X2Effect_DLC_Day60Freeze'.static.CreateFreezeEffect(1, 2));//For rulers. val 1 is minimum duration, 2nd max duration.
	Template.BonusWeaponEffects.AddItem(class'X2Effect_SAVBrittleEffect'.static.CreateSAVBrittleEffect());	
	
	Template.iPhysicsImpulse = 2;

	Template.fKnockbackDamageAmount = 10.0f;
	Template.fKnockbackDamageRadius = 16.0f;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_AbsoluteZero";

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';
	
	Template.RewardDecks.AddItem('SAVUniqueWeaponsRewards');

	return Template;
}

static function X2DataTemplate CreateSAV_Unique_AbsoluteZero_Perfected()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_AbsoluteZero_Perfected');
	Template.WeaponPanelImage = "_BeamShotgun";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'shotgun';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Unique_AbsoluteZero";
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 5;
	Template.OnAcquiredFn = OnSAV_Unique_AbsoluteZero2Acquired;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_BEAM_RANGE;
	Template.BaseDamage = default.ABSOLUTEZERO2_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.SHOTGUN_BEAM_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.SHOTGUN_BEAM_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.SHOTGUN_BEAM_ICLIPSIZE;
	Template.iSoundRange = default.ABSOLUTEZERO_ENVDAMAGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.SHOTGUN_BEAM_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.ABSOLUTEZERO2_TPV;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('SAVAbsoluteZeroUpgradeViperKing');

	Template.BonusWeaponEffects.AddItem(class'X2Effect_DLC_Day60Freeze'.static.CreateFreezeEffect(2, 3));//For rulers. val 1 is minimum duration, 2nd max duration.
	Template.BonusWeaponEffects.AddItem(class'X2Effect_SAVBrittleEffect'.static.CreateSAVBrittleEffect());	
	
	Template.iPhysicsImpulse = 2;

	Template.fKnockbackDamageAmount = 10.0f;
	Template.fKnockbackDamageRadius = 16.0f;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_AbsoluteZero";

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';

	return Template;
}

static function bool OnSAV_Unique_AbsoluteZeroAcquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades( ItemState, default.AbsoluteZeroUpgrades);
	}

	return false;
}

static function bool OnSAV_Unique_AbsoluteZero2Acquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades( ItemState, default.AbsoluteZero2Upgrades);
	}

	return false;
}

//////Cannons////////////////////////////////////////////////////////
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//Oppressors End
static function X2DataTemplate CreateSAV_Unique_OppressorsEnd()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_OppressorsEnd');
	Template.WeaponPanelImage = "_ConventionalCannon";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_OppressorsEnd";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;
	Template.OnAcquiredFn = OnSAV_Unique_OppressorsEndAcquired;

	Template.NumUpgradeSlots = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.OPPRESSORSEND_DAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.OPPRESSORSEND_TPV;
	Template.bIsLargeWeapon = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('SAV_OE_Demolition');

	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 33, false));
	Template.BonusWeaponEffects.AddItem(class'X2Effect_SAVHeadsDown'.static.CreateSAVHeadsDownEffect());

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_OppressorsEnd";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

//	Template.RewardDecks.AddItem('SAVUniqueWeaponsRewards');//=============================================== COmmented out for now so it doesn't drop - Fix in patch

	return Template;
}

static function X2DataTemplate CreateSAV_Unique_OppressorsEnd_Improved()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_OppressorsEnd_Improved');
	Template.WeaponPanelImage = "_ConventionalCannon";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_OppressorsEnd";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;
	Template.OnAcquiredFn = OnSAV_Unique_OppressorsEndAcquired;

	Template.NumUpgradeSlots = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.OPPRESSORSEND_IMPROVED_DAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.OPPRESSORSEND_IMPROVED_TPV;
	Template.bIsLargeWeapon = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('KillZone');
	Template.Abilities.AddItem('SAV_OE_Demolition');

	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 66, false));
	Template.BonusWeaponEffects.AddItem(class'X2Effect_SAVHeadsDown'.static.CreateSAVHeadsDownEffect());

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_OppressorsEnd";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function X2DataTemplate CreateSAV_Unique_OppressorsEnd_Perfected()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_OppressorsEnd_Perfected');
	Template.WeaponPanelImage = "_ConventionalCannon";

	Template.NumUpgradeSlots = 0;

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_OppressorsEnd";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;
	Template.OnAcquiredFn = OnSAV_Unique_OppressorsEndPerfectAcquired;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.OPPRESSORSEND_PERFECTED_DAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.OPPRESSORSEND_PERFECTED_TPV;
	Template.bIsLargeWeapon = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('KillZone');
	Template.Abilities.AddItem('SAV_OE_Demolition_Perfected');

	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 100, false));
	Template.BonusWeaponEffects.AddItem(class'X2Effect_SAVHeadsDown'.static.CreateSAVHeadsDownEffect());

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_OppressorsEnd";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function bool OnSAV_Unique_OppressorsEndAcquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades( ItemState, default.OppressorsEndUpgrades);
	}

	return false;
}

static function bool OnSAV_Unique_OppressorsEndPerfectAcquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades( ItemState, default.OppressorsEndPerfectedUpgrades);
	}

	return false;
}

//////SniperRifles////////////////////////////////////////////////////////
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//PrototypeLaserSniper

static function X2DataTemplate CreateSAV_Unique_PrototypeSniperRifle()
{
	local X2WeaponTemplate Template;
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_PrototypeSniperRifle');
	Template.WeaponPanelImage = "_MagneticSniperRifle";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_PrototypeLaserSniper";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 3;
	Template.OnAcquiredFn = OnSAV_Unique_PrototypeSniperRifleAcquired;

	Template.NumUpgradeSlots = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.LONG_MAGNETIC_RANGE;
	Template.BaseDamage = default.PROTOLASERSNIPER_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_MAGNETIC_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_MAGNETIC_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.PROTOLASERSNIPER_TPV;

	Template.iTypicalActionCost = 2;
	Template.bIsLargeWeapon = true;
	Template.InfiniteAmmo = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('SniperStandardFire');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('LongWatch');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('EverVigilant');
	Template.Abilities.AddItem('CoveringFire');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_UniqueLaserSniper";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Sniper';

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.RewardDecks.AddItem('SAVUniqueWeaponsRewards');

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate CreateSAV_Unique_PrototypeSniperRifle_Perfected()
{
	local X2WeaponTemplate Template;
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_PrototypeSniperRifle_Perfected');
	Template.WeaponPanelImage = "_MagneticSniperRifle";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_PrototypeLaserSniper";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 3;
	Template.OnAcquiredFn = OnSAV_Unique_PrototypeSniperRifle_PerfectedAcquired;

	Template.NumUpgradeSlots = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.LONG_MAGNETIC_RANGE;
	Template.BaseDamage = default.PROTOLASERSNIPER_PERFECTED_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_MAGNETIC_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_MAGNETIC_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.PROTOLASERSNIPER_PERFECTED_TPV;

	Template.iTypicalActionCost = 2;
	Template.bIsLargeWeapon = true;
	Template.InfiniteAmmo = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('SniperStandardFire');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('LongWatch');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('EverVigilant');
	Template.Abilities.AddItem('CoveringFire');
	Template.Abilities.AddItem('Sentinel');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_UniqueLaserSniper";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Sniper';

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function bool OnSAV_Unique_PrototypeSniperRifleAcquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades( ItemState, default.ProtoLaserSniperUpgrades);
	}

	return false;
}

static function bool OnSAV_Unique_PrototypeSniperRifle_PerfectedAcquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades( ItemState, default.ProtoLaserSniperPerfectedUpgrades);
	}

	return false;
}

//////Swords////////////////////////////////////////////////////////
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//Viper Fang

static function X2DataTemplate CreateSAV_Unique_Viperfang()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_Viperfang');
	Template.WeaponPanelImage = "_Sword"; 

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_Viperfang";
	Template.EquipSound = "Sword_Equip_Magnetic";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_Viperfang";
	Template.AddDefaultAttachment('R_Back', "MagSword.Meshes.SM_MagSword_Sheath", false);
	Template.Tier = 3;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.iRange = 0;
	Template.BaseDamage = default.VIPERFANG_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_CRITCHANCE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.VIPERFANG_TPV;
	Template.BaseDamage.DamageType='Melee';

	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 50, false));
	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreatePoisonedStatusEffect());

	Template.Abilities.AddItem('SAVViperfangPoison');
	Template.Abilities.AddItem('SAVTheVipersBite');
	Template.Abilities.AddItem('SAVViperfangAutopsyUpgrade');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Melee';

	Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_STUNCHANCE, , , "%");

	Template.RewardDecks.AddItem('SAVUniqueWeaponsRewards');

	return Template;
}

static function X2DataTemplate CreateSAV_Unique_Viperfang_Perfected()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_Viperfang_Perfected');
	Template.WeaponPanelImage = "_Sword"; 

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_Viperfang";
	Template.EquipSound = "Sword_Equip_Magnetic";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_Viperfang";
	Template.AddDefaultAttachment('R_Back', "MagSword.Meshes.SM_MagSword_Sheath", false);
	Template.Tier = 3;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.iRange = 0;
	Template.BaseDamage = default.VIPERFANG3_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_CRITCHANCE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.VIPERFANG3_TPV;
	Template.BaseDamage.DamageType='Melee';

	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, 50, false));
	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreatePoisonedStatusEffect());

	Template.Abilities.AddItem('SAVViperfangPoison');
	Template.Abilities.AddItem('SAVTheVipersBite3');
	Template.Abilities.AddItem('SAVViperfangAutopsyUpgrade');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Melee';

	Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_STUNCHANCE, , , "%");

	return Template;
}

//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//Jagged Axe

	static function X2DataTemplate CreateSAV_Unique_JaggedAxe()
{
	local X2PairedWeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2PairedWeaponTemplate', Template, 'SAV_Unique_JaggedAxe');
	Template.PairedSlot = eInvSlot_TertiaryWeapon;
	Template.PairedTemplateName = 'SAV_Unique_JaggedAxeThrown';

	Template.WeaponPanelImage = "_Sword";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_JaggedAxe";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	Template.GameArchetype = "SAV_UniqueWeapons.WP_JaggedAxe";
	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.Abilities.AddItem('SAVJaggedEdge');

	Template.iRange = 0;
	Template.BaseDamage = default.JAGGED_AXE_BASEDAMAGE;
	Template.Aim =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_AIM;
	Template.CritChance =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_CRITCHANCE;
	Template.iSoundRange =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.JAGGED_AXE_TPV;	
	Template.BaseDamage.DamageType = 'Melee';

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Melee';

	Template.RewardDecks.AddItem('SAVUniqueWeaponsRewards');

	return Template;
}

static function X2DataTemplate CreateSAV_Unique_JaggedAxeThrown()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_JaggedAxeThrown');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_JaggedAxe";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_TertiaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_JaggedAxe_Thrown";
	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = false;
	Template.iClipSize = 1;
	Template.iPhysicsImpulse = 5;
	Template.bHideWithNoAmmo = true;

	Template.iRange = 0;
	Template.BaseDamage = default.JAGGED_AXE_BASEDAMAGE;
	Template.Aim = class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_AIM;
	Template.CritChance =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_CRITCHANCE;
	Template.iSoundRange =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.JAGGED_AXE_TPV;	
	Template.BaseDamage.DamageType = 'Melee';

	Template.WeaponPrecomputedPathData.InitialPathTime = 0.5;
	Template.WeaponPrecomputedPathData.MaxPathTime = 1.0;
	Template.WeaponPrecomputedPathData.MaxNumberOfBounces = 0;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Melee';
	Template.Abilities.AddItem('ThrowAxe');

	return Template;
}

static function X2DataTemplate CreateSAV_Unique_JaggedAxe_Enhanced()
{
	local X2PairedWeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2PairedWeaponTemplate', Template, 'SAV_Unique_JaggedAxe_Enhanced');
	Template.PairedSlot = eInvSlot_TertiaryWeapon;
	Template.PairedTemplateName = 'SAV_Unique_JaggedAxeThrown_Enhanced';

	Template.WeaponPanelImage = "_Sword";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_JaggedAxe";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	Template.GameArchetype = "SAV_UniqueWeapons.WP_JaggedAxe";
	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.Abilities.AddItem('SAVJaggedEdge');

	Template.iRange = 0;
	Template.BaseDamage = default.JAGGED_AXE2_BASEDAMAGE;
	Template.Aim =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_AIM;
	Template.CritChance =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_CRITCHANCE;
	Template.iSoundRange =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.JAGGED_AXE2_TPV;	
	Template.BaseDamage.DamageType = 'Melee';

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Melee';

	return Template;
}

static function X2DataTemplate CreateSAV_Unique_JaggedAxeThrown_Enhanced()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_JaggedAxeThrown_Enhanced');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_JaggedAxe";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_TertiaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_JaggedAxe_Thrown";
	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = false;
	Template.iClipSize = 1;
	Template.iPhysicsImpulse = 5;
	Template.bHideWithNoAmmo = true;

	Template.iRange = 0;
	Template.BaseDamage = default.JAGGED_AXE2_BASEDAMAGE;
	Template.Aim = class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_AIM;
	Template.CritChance =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_CRITCHANCE;
	Template.iSoundRange =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.JAGGED_AXE2_TPV;	
	Template.BaseDamage.DamageType = 'Melee';

	Template.WeaponPrecomputedPathData.InitialPathTime = 0.5;
	Template.WeaponPrecomputedPathData.MaxPathTime = 1.0;
	Template.WeaponPrecomputedPathData.MaxNumberOfBounces = 0;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Melee';

	Template.Abilities.AddItem('ThrowAxe');

	return Template;
}


static function X2DataTemplate CreateSAV_Unique_JaggedAxe_Perfected()
{
	local X2PairedWeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2PairedWeaponTemplate', Template, 'SAV_Unique_JaggedAxe_Perfected');
	Template.PairedSlot = eInvSlot_TertiaryWeapon;
	Template.PairedTemplateName = 'SAV_Unique_JaggedAxeThrown_Perfected';

	Template.WeaponPanelImage = "_Sword";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_JaggedAxe";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	Template.GameArchetype = "SAV_UniqueWeapons.WP_JaggedAxe";
	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.Abilities.AddItem('SAVJaggedEdge3');

	Template.iRange = 0;
	Template.BaseDamage = default.JAGGED_AXE3_BASEDAMAGE;
	Template.Aim =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_AIM;
	Template.CritChance =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_CRITCHANCE;
	Template.iSoundRange =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.JAGGED_AXE3_TPV;	
	Template.BaseDamage.DamageType = 'Melee';

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Melee';

	return Template;
}

static function X2DataTemplate CreateSAV_Unique_JaggedAxeThrown_Perfected()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Unique_JaggedAxeThrown_Perfected');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_JaggedAxe";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_TertiaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_JaggedAxe_Thrown";
	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = false;
	Template.iClipSize = 1;
	Template.iPhysicsImpulse = 5;
	Template.bHideWithNoAmmo = true;

	Template.iRange = 0;
	Template.BaseDamage = default.JAGGED_AXE3_BASEDAMAGE;
	Template.Aim = class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_AIM;
	Template.CritChance =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_CRITCHANCE;
	Template.iSoundRange =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage =  class'X2Item_DLC_Day60Weapons'.default.HUNTERAXE_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.JAGGED_AXE3_TPV;	
	Template.BaseDamage.DamageType = 'Melee';

	Template.WeaponPrecomputedPathData.InitialPathTime = 0.5;
	Template.WeaponPrecomputedPathData.MaxPathTime = 1.0;
	Template.WeaponPrecomputedPathData.MaxNumberOfBounces = 0;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Melee';

	Template.Abilities.AddItem('ThrowAxe');

	return Template;
}

//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//Endless Vengeance

static function X2DataTemplate CreateSAV_Legendary_EndlessVengeance()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Legendary_EndlessVengeance');
	Template.WeaponPanelImage = "_Sword";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_EndlessVengeance";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_EndlessVengance";
	Template.AddDefaultAttachment('R_Back', "", false);
	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.Abilities.AddItem('Bladestorm');
	Template.Abilities.AddItem('SAVEndlessVengeance_ReactionBonus');
	Template.Abilities.AddItem('SAV_EndlessVengeance');
	Template.Abilities.AddItem('SAV_EndlessVengeance_Charges');

	Template.iRange = 0;
	Template.BaseDamage = default.ENDLESSVENGEANCE_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_CRITCHANCE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.ENDLESSVENGEANCE_TPV;
	Template.BaseDamage.DamageType = 'Melee';

	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Melee';

	Template.RewardDecks.AddItem('SAVUniqueWeaponsRewards');

	return Template;
}

static function X2DataTemplate CreateSAV_Legendary_EndlessVengeance_Enhanced()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Legendary_EndlessVengeance_Enhanced');
	Template.WeaponPanelImage = "_Sword";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_EndlessVengeance";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_EndlessVengance";
	Template.AddDefaultAttachment('R_Back', "", false);
	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.Abilities.AddItem('Bladestorm');
	Template.Abilities.AddItem('SAVEndlessVengeance_ReactionBonus');
	Template.Abilities.AddItem('SAV_EndlessVengeance');
	Template.Abilities.AddItem('SAV_EndlessVengeance_Charges');

	Template.iRange = 0;
	Template.BaseDamage = default.ENDLESSVENGEANCE2_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_CRITCHANCE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.ENDLESSVENGEANCE2_TPV;
	Template.BaseDamage.DamageType = 'Melee';

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Melee';

	return Template;
}

static function X2DataTemplate CreateSAV_Legendary_EndlessVengeance_Perfected()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_Legendary_EndlessVengeance_Perfected');
	Template.WeaponPanelImage = "_Sword";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Uniq_EndlessVengeance";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_EndlessVengance";
	Template.AddDefaultAttachment('R_Back', "", false);
	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.Abilities.AddItem('Bladestorm');
	Template.Abilities.AddItem('SAVEndlessVengeance_ReactionBonus');
	Template.Abilities.AddItem('SAV_EndlessVengeance3');
	Template.Abilities.AddItem('SAV_EndlessVengeance_Charges');

	Template.iRange = 0;
	Template.BaseDamage = default.ENDLESSVENGEANCE3_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_CRITCHANCE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = Default.ENDLESSVENGEANCE3_TPV;
	Template.BaseDamage.DamageType = 'Melee';

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Melee';

	return Template;
}

/////////////////////////////////////////////////Helper Functions

static function bool ApplyWeaponUpgrades(XComGameState_Item ItemState, array<name> WeaponUpgrades)
{
	local X2ItemTemplateManager ItemTemplateMgr;
	local X2WeaponUpgradeTemplate UpgradeTemplate;
	local name WeaponUpgradeName;

	ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	foreach WeaponUpgrades(WeaponUpgradeName)
	{
		UpgradeTemplate = X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate(WeaponUpgradeName));
		if (UpgradeTemplate != none)
		{
			ItemState.ApplyWeaponUpgradeTemplate(UpgradeTemplate);
		}
	}

	return true;
}

static function X2Effect_Stunned HarpoonGunStunEffect()
{
	local X2Effect_Stunned StunEffect;

	StunEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, 0, false);
	StunEffect.ApplyChanceFn = BoltCasterStunChance;
	return StunEffect;
}

static function X2Effect_Stunned HarpoonGunStunEffect3()
{
	local X2Effect_Stunned StunEffect;

	StunEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(3, 0, false);
	StunEffect.ApplyChanceFn = BoltCasterStunChance;
	return StunEffect;
}

function name BoltCasterStunChance(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState)
{
	local XComGameState_Unit TargetUnit;
	local int Chance;

	TargetUnit = XComGameState_Unit(kNewTargetState);
	if (TargetUnit != none)
	{
		if (class'X2Helpers_DLC_Day60'.static.IsUnitAlienRuler(TargetUnit))
		{
			// Get the Stun Chance modifier for individual Ruler and subtract it
			Chance = class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_RULER_STUN_CHANCE - class'X2Helpers_DLC_Day60'.static.GetRulerStunChanceModifier(TargetUnit);
		}
		else
		{
			Chance = class'X2Item_DLC_Day60Weapons'.default.HUNTERRIFLE_STUN_CHANCE;
		}
		if (`SYNC_RAND(100) < Chance)
		{
			return 'AA_Success';
		}
	}
	return 'AA_EffectChanceFailed';
}