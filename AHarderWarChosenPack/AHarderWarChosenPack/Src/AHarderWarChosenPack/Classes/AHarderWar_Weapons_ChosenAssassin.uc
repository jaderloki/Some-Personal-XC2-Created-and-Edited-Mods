class AHarderWar_Weapons_ChosenAssassin extends X2Item config(GameData_WeaponData);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	Weapons.AddItem(CreateTemplate_AHWChosenShotgun_Conventional());
	Weapons.AddItem(CreateTemplate_AHWChosenShotgun_Magnetic());
	Weapons.AddItem(CreateTemplate_AHWChosenShotgun_Beam());
	Weapons.AddItem(CreateTemplate_AHWChosenShotgun_T4());

	return Weapons;
}

// **************************************************************************
// ***                       Chosen Shotgun                               ***
// **************************************************************************

static function X2DataTemplate CreateTemplate_AHWChosenShotgun_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWChosenShotgun_CV');
	Template.WeaponPanelImage = "_ConventionalShotgun";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'shotgun';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.ConvShotgun.ConvShotgun_Base";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 1;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_CONVENTIONAL_RANGE;
	Template.BaseDamage = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_CONVENTIONAL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = 0;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('AssassinAbility_DancingShadows');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_ChosenShotgun.WP_ChosenShotgun_T1";

	Template.iPhysicsImpulse = 5;
	Template.fKnockbackDamageAmount = 10.0f;
	Template.fKnockbackDamageRadius = 16.0f;
	Template.DamageTypeTemplateName = 'Projectile_MagAdvent';

	return Template;
}

static function X2DataTemplate CreateTemplate_AHWChosenShotgun_Magnetic()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWChosenShotgun_MG');
	Template.WeaponPanelImage = "_MagneticShotgun";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'shotgun';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_Common.UI_MagShotgun.MagShotgun_Base";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 3;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_MAGNETIC_RANGE;
	Template.BaseDamage = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_MAGNETIC_BASEDAMAGE;
	Template.Aim = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_MAGNETIC_AIM;
	Template.CritChance = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_MAGNETIC_CRITCHANCE;
	Template.iClipSize = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = 0;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('AssassinAbility_DancingShadows');
	Template.Abilities.AddItem('AssassinAbility_Expose');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_ChosenShotgun.WP_ChosenShotgun_T2";

	Template.iPhysicsImpulse = 5;
	Template.fKnockbackDamageAmount = 10.0f;
	Template.fKnockbackDamageRadius = 16.0f;	
	Template.DamageTypeTemplateName = 'Projectile_MagAdvent';

	return Template;
}

static function X2DataTemplate CreateTemplate_AHWChosenShotgun_Beam()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWChosenShotgun_BM');
	Template.WeaponPanelImage = "_BeamShotgun";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'shotgun';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_Common.UI_BeamShotgun.BeamShotgun_Base";
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 5;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_BEAM_RANGE;
	Template.BaseDamage = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_BEAM_BASEDAMAGE;
	Template.Aim = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_BEAM_AIM;
	Template.CritChance = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_BEAM_CRITCHANCE;
	Template.iClipSize = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_BEAM_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_BEAM_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = 0;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('AssassinAbility_DancingShadows');
	Template.Abilities.AddItem('AssassinAbility_Expose');
	Template.Abilities.AddItem('AssassinAbility_DeadlyCadence');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_ChosenShotgun.WP_ChosenShotgun_T3";

	Template.iPhysicsImpulse = 5;
	Template.fKnockbackDamageAmount = 10.0f;
	Template.fKnockbackDamageRadius = 16.0f;
	Template.DamageTypeTemplateName = 'Projectile_MagAdvent';

	return Template;
}

static function X2DataTemplate CreateTemplate_AHWChosenShotgun_T4()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWChosenShotgun_T4');
	Template.WeaponPanelImage = "_BeamShotgun";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'shotgun';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_Common.UI_BeamShotgun.BeamShotgun_Base";
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 5;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_BEAM_RANGE;
	Template.BaseDamage = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_T4_BASEDAMAGE;
	Template.Aim = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_T4_AIM;
	Template.CritChance = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_T4_CRITCHANCE;
	Template.iClipSize = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_T4_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_T4_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_XpackWeapons'.default.CHOSENSHOTGUN_T4_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = 0;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('AssassinAbility_DancingShadows');
	Template.Abilities.AddItem('AssassinAbility_Expose');
	Template.Abilities.AddItem('AssassinAbility_DeadlyCadence');
	Template.Abilities.AddItem('AssassinAbility_Decimate');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_ChosenShotgun.WP_ChosenShotgun_T4";

	Template.iPhysicsImpulse = 5;
	Template.fKnockbackDamageAmount = 10.0f;
	Template.fKnockbackDamageRadius = 16.0f;
	Template.DamageTypeTemplateName = 'Projectile_MagAdvent';

	return Template;
}