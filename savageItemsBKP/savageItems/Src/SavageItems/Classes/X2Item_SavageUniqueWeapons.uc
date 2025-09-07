class X2Item_SavageUniqueWeapons extends X2Item config(GameData_SavitemsWeaponData);

var config WeaponDamageValue LILRIPPER_BASEDAMAGE;
var config int LILRIPPER_TPV;
var config array<name> LilRipperUpgrades;

var config WeaponDamageValue PROTOTYPELASERRIFLE_BASEDAMAGE;
var config int PROTOTYPELASERRIFLE_TPV;
var config array<name> PrototypeLaserRifleUpgrades;

var config WeaponDamageValue VIPERFANG_BASEDAMAGE;
var config int VIPERFANG_TPV;

var config WeaponDamageValue ENDLESSVENGEANCE_BASEDAMAGE;
var config int ENDLESSVENGEANCE_TPV;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
	//Rifles
	Weapons.AddItem(CreateSAV_Unique_LilRipper());
	Weapons.AddItem(CreateSAV_Unique_PrototypeLaserRifle());
	//Pistols
	//Shotguns
	//Cannons
	//SniperRifles
	//Swords
	Weapons.AddItem(CreateSAV_Unique_Viperfang());
	Weapons.AddItem(CreateSAV_Legendary_EndlessVengeance());

	return Weapons;
}

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
	Template.Abilities.AddItem('UniqueARMagneticUpgrade');//---------------Beam upgrade added automatically

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "XComWeapon'SAV_UniqueWeapons.WP_LilRipper'";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;

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
	Template.Tier = 2;
	Template.OnAcquiredFn = OnSAV_Unique_PrototypeLaserRifleAcquired;

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
	Template.Abilities.AddItem('UniqueARBeamUpgrade');
	Template.Abilities.AddItem('SAVPrototypePowerFluctuation');
	Template.Abilities.AddItem('SAVDefectivePowerSupply');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_UniqueWeapons.WP_PrototypeLaserRifle";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = false;

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
	Template.Tier = 2;

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
	Template.Abilities.AddItem('UniqueSwordBeamUpgrade');

	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Melee';

	Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_STUNCHANCE, , , "%");

	return Template;
}


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

	Template.Abilities.AddItem('UniqueSwordMagneticUpgrade');//---------------Beam upgrade added automatically
	Template.Abilities.AddItem('Reaper');
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