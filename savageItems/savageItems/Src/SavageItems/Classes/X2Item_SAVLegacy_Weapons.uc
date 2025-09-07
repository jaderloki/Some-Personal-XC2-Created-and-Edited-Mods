class X2Item_SAVLegacy_Weapons extends X2Item config(GameData_SavitemsWeaponData);

var config array<name> LEG1AssaultRifleUpgrades;
var config array<name> LEG2AssaultRifleUpgrades;
var config array<name> LEG1CannonUpgrades;
var config array<name> LEG2CannonUpgrades;
var config array<name> LEG1ShotgunUpgrades;
var config array<name> LEG2ShotgunUpgrades;
var config array<name> LEG1SniperRifleUpgrades;
var config array<name> LEG2SniperRifleUpgrades;

var config int LEG_AR_CV_TPV;
var config int LEG_AR_MG_TPV;
var config int LEG_CANNON_CV_TPV;
var config int LEG_CANNON_MG_TPV;
var config int LEG_PISTOL_CV_TPV;
var config int LEG_PISTOL_MG_TPV;
var config int LEG_SHOTGUN_CV_TPV;
var config int LEG_SHOTGUN_MG_TPV;
var config int LEG_SNIPERRIFLE_CV_TPV;
var config int LEG_SNIPERRIFLE_MG_TPV;
var config int LEG_SWORD_CV_TPV;
var config int LEG_SWORD_MG_TPV;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	Weapons.AddItem( SAV_LEG_AssaultRifle_CV() );
	Weapons.AddItem( SAV_LEG_AssaultRifle_MG() );

	Weapons.AddItem( SAV_LEG_Cannon_CV() );
	Weapons.AddItem( SAV_LEG_Cannon_MG() );
	
	Weapons.AddItem( SAV_LEG_Pistol_CV() );
	Weapons.AddItem( SAV_LEG_Pistol_MG() );

	Weapons.AddItem( SAV_LEG_Shotgun_CV() );
	Weapons.AddItem( SAV_LEG_Shotgun_MG() );
	
	Weapons.AddItem( SAV_LEG_SniperRifle_CV() );
	Weapons.AddItem( SAV_LEG_SniperRifle_MG() );
	
	Weapons.AddItem( SAV_LEG_Sword_CV() );
	Weapons.AddItem( SAV_LEG_Sword_MG() );

	return Weapons;
}

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

static function bool OnLEG1AssaultRifleAcquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades( ItemState, default.LEG1AssaultRifleUpgrades);
	}

	return false;
}

static function bool OnLEG2AssaultRifleAcquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades(ItemState, default.LEG2AssaultRifleUpgrades);
	}

	return false;
}

static function bool OnLEG1CannonAcquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades(ItemState, default.LEG1CannonUpgrades);
	}

	return false;
}

static function bool OnLEG2CannonAcquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades(ItemState, default.LEG2CannonUpgrades);
	}

	return false;
}

static function bool OnLEG1ShotgunAcquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades(ItemState, default.LEG1ShotgunUpgrades);
	}

	return false;
}

static function bool OnLEG2ShotgunAcquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades(ItemState, default.LEG2ShotgunUpgrades);
	}

	return false;
}

static function bool OnLEG1SniperRifleAcquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades(ItemState, default.LEG1SniperRifleUpgrades);
	}

	return false;
}

static function bool OnLEG2SniperRifleAcquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	if (ItemState.GetMyWeaponUpgradeTemplateNames().Length == 0)
	{
		return ApplyWeaponUpgrades(ItemState, default.LEG2SniperRifleUpgrades);
	}

	return false;
}

static function X2DataTemplate SAV_LEG_AssaultRifle_CV()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_LEG_AssaultRifle_CV');
	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_TLE_Common.TLE_AR_Base";
	Template.Tier = 0;
	Template.OnAcquiredFn = OnLEG1AssaultRifleAcquired;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange =class'X2Item_DefaultWeapons'. default.ASSAULTRIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('SAVLegacyAssaultRifleUpgradeMG');
	Template.Abilities.AddItem('SAVLegacyAssaultRifleUpgradeBM');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "TLE1AssaultRifle.WP_TLE1AssaultRifle";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.TradingPostValue = Default.LEG_AR_CV_TPV;

	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function X2DataTemplate SAV_LEG_AssaultRifle_MG()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_LEG_AssaultRifle_MG');
	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.

	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'magnetic';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_TLE_Common.TLE_AR_Laser_Base";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 2;
	Template.OnAcquiredFn = OnLEG2AssaultRifleAcquired;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_MAGNETIC_RANGE;
	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('SAVLegacyAssaultRifleUpgradeBM');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "TLE2AssaultRifle.WP_TLE2AssaultRifle";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = false;
	Template.TradingPostValue = Default.LEG_AR_MG_TPV;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate SAV_LEG_Cannon_CV()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_LEG_Cannon_CV');
	Template.WeaponPanelImage = "_ConventionalCannon";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_TLE_Common.TLE_Cannon_Base";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;
	Template.OnAcquiredFn = OnLEG1CannonAcquired;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.LMG_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.bIsLargeWeapon = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('SAVLegacyCannonUpgradeMG');
	Template.Abilities.AddItem('SAVLegacyCannonUpgradeBM');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "TLE1Cannon.WP_TLE1Cannon";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.TradingPostValue = Default.LEG_CANNON_CV_TPV;
	Template.TradingPostValue = Default.LEG_CANNON_MG_TPV;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function X2DataTemplate SAV_LEG_Cannon_MG()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_LEG_Cannon_MG');
	Template.WeaponPanelImage = "_MagneticCannon";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_TLE_Common.TLE_Cannon_Laser_Base";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 3;
	Template.OnAcquiredFn = OnLEG2CannonAcquired;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_MAGNETIC_RANGE;
	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.LMG_MAGNETIC_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.LMG_MAGNETIC_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.LMG_MAGNETIC_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.LMG_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.LMG_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.LMG_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.bIsLargeWeapon = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('SAVLegacyCannonUpgradeBM');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "TLE2Cannon.WP_TLE2Cannon";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = false;

	Template.TradingPostValue = Default.LEG_CANNON_MG_TPV;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate SAV_LEG_Pistol_CV()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_LEG_Pistol_CV');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'pistol';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_TLE_Common.TLE_Pistol";
	Template.EquipSound = "Secondary_Weapon_Equip_Conventional";
	Template.Tier = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_CONVENTIONAL_RANGE;
	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.PISTOL_CONVENTIONAL_IENVIRONMENTDAMAGE;

	Template.InfiniteAmmo = true;
	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.Abilities.AddItem('PistolOverwatch');
	Template.Abilities.AddItem('PistolOverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('SAVLegacyPistolUpgradeMG');
	Template.Abilities.AddItem('SAVLegacyPistolUpgradeBM');

	Template.SetAnimationNameForAbility('FanFire', 'FF_FireMultiShotConvA');	

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "TLE1Pistol.WP_TLE1Pistol";

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.TradingPostValue = Default.LEG_PISTOL_CV_TPV;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	Template.bHideClipSizeStat = true;

	return Template;
}

static function X2DataTemplate SAV_LEG_Pistol_MG()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_LEG_Pistol_MG');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'pistol';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_TLE_Common.TLE_Pistol_Laser";
	Template.EquipSound = "Secondary_Weapon_Equip_Magnetic";
	Template.Tier = 2;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_MAGNETIC_RANGE;
	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.PISTOL_MAGNETIC_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.PISTOL_MAGNETIC_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.PISTOL_MAGNETIC_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.PISTOL_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.PISTOL_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.PISTOL_MAGNETIC_IENVIRONMENTDAMAGE;

	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;
	Template.InfiniteAmmo = true;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.Abilities.AddItem('PistolOverwatch');
	Template.Abilities.AddItem('PistolOverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('SAVLegacyPistolUpgradeBM');

	Template.SetAnimationNameForAbility('FanFire', 'FF_FireMultiShotMagA');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "TLE2Pistol.WP_TLE2Pistol";

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = false;
	Template.TradingPostValue = Default.LEG_PISTOL_MG_TPV;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	Template.bHideClipSizeStat = true;

	return Template;
}

static function X2DataTemplate SAV_LEG_SniperRifle_CV()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_LEG_SniperRifle_CV');
	Template.WeaponPanelImage = "_ConventionalSniperRifle";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_TLE_Common.TLE_Sniper_Base";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;
	Template.OnAcquiredFn = OnLEG1SniperRifleAcquired;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.LONG_CONVENTIONAL_RANGE;
	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.iTypicalActionCost = 2;

	Template.bIsLargeWeapon = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('SniperStandardFire');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('SAVLegacySniperRifleUpgradeMG');
	Template.Abilities.AddItem('SAVLegacySniperRifleUpgradeBM');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "TLE1Sniper.WP_TLE1Sniper";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Sniper';

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.TradingPostValue = Default.LEG_SNIPERRIFLE_CV_TPV;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function X2DataTemplate SAV_LEG_SniperRifle_MG()
{
	local X2WeaponTemplate Template;
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_LEG_SniperRifle_MG');
	Template.WeaponPanelImage = "_MagneticSniperRifle";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_TLE_Common.TLE_Sniper_Laser_Base";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 3;
	Template.OnAcquiredFn = OnLEG2SniperRifleAcquired;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.LONG_MAGNETIC_RANGE;
	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_MAGNETIC_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_MAGNETIC_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_MAGNETIC_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.iTypicalActionCost = 2;

	Template.bIsLargeWeapon = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('SniperStandardFire');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('SAVLegacySniperRifleUpgradeBM');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "TLE2Sniper.WP_TLE2Sniper";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Sniper';

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = false;
	Template.TradingPostValue = Default.LEG_SNIPERRIFLE_MG_TPV;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate SAV_LEG_Shotgun_CV()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_LEG_Shotgun_CV');
	Template.WeaponPanelImage = "_ConventionalShotgun";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'shotgun';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_TLE_Common.TLE_Shotgun_Base";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;
	Template.OnAcquiredFn = OnLEG1ShotgunAcquired;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_CONVENTIONAL_RANGE;
	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.SHOTGUN_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.SHOTGUN_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.SHOTGUN_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.SHOTGUN_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.SHOTGUN_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.SHOTGUN_CONVENTIONAL_IENVIRONMENTDAMAGE;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('SAVLegacyShotgunUpgradeMG');
	Template.Abilities.AddItem('SAVLegacyShotgunUpgradeBM');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "TLE1Shotgun.WP_TLE1Shotgun";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Shotgun';

	Template.iPhysicsImpulse = 5;

	Template.fKnockbackDamageAmount = 10.0f;
	Template.fKnockbackDamageRadius = 16.0f;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.TradingPostValue = Default.LEG_SHOTGUN_CV_TPV;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function X2DataTemplate SAV_LEG_Shotgun_MG()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_LEG_Shotgun_MG');
	Template.WeaponPanelImage = "_MagneticShotgun";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'shotgun';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_TLE_Common.TLE_Shotgun_Laser_Base";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 3;
	Template.OnAcquiredFn = OnLEG2ShotgunAcquired;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_MAGNETIC_RANGE;
	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.SHOTGUN_MAGNETIC_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.SHOTGUN_MAGNETIC_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.SHOTGUN_MAGNETIC_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.SHOTGUN_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.SHOTGUN_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.SHOTGUN_MAGNETIC_IENVIRONMENTDAMAGE;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('SAVLegacyShotgunUpgradeBM');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "TLE2Shotgun.WP_TLE2Shotgun";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Shotgun';

	Template.iPhysicsImpulse = 5;

	Template.fKnockbackDamageAmount = 10.0f;
	Template.fKnockbackDamageRadius = 16.0f;

	Template.CanBeBuilt = false;
	Template.TradingPostValue = Default.LEG_SHOTGUN_MG_TPV;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate SAV_LEG_Sword_CV()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_LEG_Sword_CV');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_TLE_Common.TLE_Sword";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "TLE1Sword.WP_TLE1Sword";
	Template.AddDefaultAttachment('R_Back', "", false);
	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.iRange = 0;
	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_CRITCHANCE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.BaseDamage.DamageType = 'Melee';

	Template.Abilities.AddItem('SAVLegacySwordUpgradeMG');
	Template.Abilities.AddItem('SAVLegacySwordUpgradeBM');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.TradingPostValue = Default.LEG_SWORD_CV_TPV;

	Template.DamageTypeTemplateName = 'Melee';

	return Template;
}

static function X2DataTemplate SAV_LEG_Sword_MG()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_LEG_Sword_MG');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_TLE_Common.TLE_Sword_Laser";
	Template.EquipSound = "Sword_Equip_Magnetic";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "TLE2Sword.WP_TLE2Sword";
	Template.AddDefaultAttachment('R_Back', "MagSword.Meshes.SM_MagSword_Sheath", false);
	Template.Tier = 2;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.iRange = 0;
	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_CRITCHANCE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.BaseDamage.DamageType='Melee';

	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_STUNCHANCE, false));

	Template.Abilities.AddItem('SAVLegacySwordUpgradeBM');

	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Melee';
	Template.TradingPostValue = Default.LEG_SWORD_MG_TPV;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_STUNCHANCE, , , "%");

	return Template;
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}