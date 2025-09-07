class AHarderWar_Weapons_ChosenHunter extends X2Item config(GameData_WeaponData);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	Weapons.AddItem(CreateTemplate_AHWChosenSniperRifle_Conventional());
	Weapons.AddItem(CreateTemplate_AHWChosenSniperRifle_Magnetic());
	Weapons.AddItem(CreateTemplate_AHWChosenSniperRifle_Beam());
	Weapons.AddItem(CreateTemplate_AHWChosenSniperRifle_T4());

	Weapons.AddItem(CreateTemplate_AHWChosenSniperPistol_Conventional());
	Weapons.AddItem(CreateTemplate_AHWChosenSniperPistol_Magnetic());
	Weapons.AddItem(CreateTemplate_AHWChosenSniperPistol_Beam());
	Weapons.AddItem(CreateTemplate_AHWChosenSniperPistol_T4());
		
	return Weapons;
}

// **************************************************************************
// ***                      Chosen Sniper Rifle							  ***
// **************************************************************************
static function X2DataTemplate CreateTemplate_AHWChosenSniperRifle_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWChosenSniperRifle_CV');
	Template.WeaponPanelImage = "_ConventionalSniperRifle";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.ConvSniper.ConvSniper_Base";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 1;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.LONG_CONVENTIONAL_RANGE;
	Template.BaseDamage = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = 0;
	Template.iTypicalActionCost = 2;

	Template.bIsLargeWeapon = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('HunterRifleShot');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('TrackingShot');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_ChosenSniperRifle.WP_ChosenSniperRifle_T1";

	Template.iPhysicsImpulse = 5;
	Template.DamageTypeTemplateName = 'Projectile_MagAdvent';

	return Template;
}

static function X2DataTemplate CreateTemplate_AHWChosenSniperRifle_Magnetic()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWChosenSniperRifle_MG');
	Template.WeaponPanelImage = "_MagneticSniperRifle";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_Common.UI_MagSniper.MagSniper_Base";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 3;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.LONG_MAGNETIC_RANGE;
	Template.BaseDamage = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_MAGNETIC_BASEDAMAGE;
	Template.Aim = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_MAGNETIC_AIM;
	Template.CritChance = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_MAGNETIC_CRITCHANCE;
	Template.iClipSize = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = 0;
	Template.iTypicalActionCost = 2;

	Template.bIsLargeWeapon = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('HunterRifleShot');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('TrackingShot');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_ChosenSniperRifle.WP_ChosenSniperRifle_T2";

	Template.iPhysicsImpulse = 5;
	Template.DamageTypeTemplateName = 'Projectile_MagAdvent';

	return Template;
}

static function X2DataTemplate CreateTemplate_AHWChosenSniperRifle_Beam()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWChosenSniperRifle_BM');
	Template.WeaponPanelImage = "_BeamSniperRifle";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_Common.UI_BeamSniper.BeamSniper_Base";
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 5;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.LONG_BEAM_RANGE;
	Template.BaseDamage = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_BEAM_BASEDAMAGE;
	Template.Aim = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_BEAM_AIM;
	Template.CritChance = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_BEAM_CRITCHANCE;
	Template.iClipSize = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_BEAM_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_BEAM_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = 0;
	Template.iTypicalActionCost = 2;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('HunterRifleShot');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('TrackingShot');
	Template.Abilities.AddItem('HunterAbility_Heartseeker');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_ChosenSniperRifle.WP_ChosenSniperRifle_T3";

	Template.iPhysicsImpulse = 5;
	Template.DamageTypeTemplateName = 'Projectile_MagAdvent';

	return Template;
}

static function X2DataTemplate CreateTemplate_AHWChosenSniperRifle_T4()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWChosenSniperRifle_T4');
	Template.WeaponPanelImage = "_BeamSniperRifle";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_Common.UI_BeamSniper.BeamSniper_Base";
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 5;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.LONG_BEAM_RANGE;
	Template.BaseDamage = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_T4_BASEDAMAGE;
	Template.Aim = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_T4_AIM;
	Template.CritChance = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_T4_CRITCHANCE;
	Template.iClipSize = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_T4_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_T4_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_XpackWeapons'.default.CHOSENSNIPERRIFLE_T4_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = 0;
	Template.iTypicalActionCost = 2;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('HunterRifleShot');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('TrackingShot');
	Template.Abilities.AddItem('HunterAbility_Showdown');
	Template.Abilities.AddItem('HunterAbility_Heartseeker');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_ChosenSniperRifle.WP_ChosenSniperRifle_T4";

	Template.iPhysicsImpulse = 5;
	Template.DamageTypeTemplateName = 'Projectile_MagAdvent';

	return Template;
}

// **************************************************************************
// ***                      Chosen Pistol								  ***
// **************************************************************************
static function X2DataTemplate CreateTemplate_AHWChosenSniperPistol_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWChosenSniperPistol_CV');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'pistol';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.ConvSecondaryWeapons.ConvPistol";
	Template.EquipSound = "Secondary_Weapon_Equip_Conventional";
	Template.Tier = 1;

	Template.iRange = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_RANGE;
	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_MAGNETIC_RANGE;
	Template.BaseDamage = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_CONVENTIONAL_AIM;
	Template.CritChance = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_CONVENTIONAL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = 0;

	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;
	Template.InfiniteAmmo = true;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.Abilities.AddItem('PistolStandardShot');
	Template.Abilities.AddItem('PistolOverwatch');
	Template.Abilities.AddItem('PistolOverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('LethalDose');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('HunterAbility_LethalTempo');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_ChosenPistol.WP_ChosenPistol_T1";

	Template.iPhysicsImpulse = 5;
	Template.DamageTypeTemplateName = 'Projectile_MagAdvent';

	Template.bHideClipSizeStat = true;

	return Template;
}

static function X2DataTemplate CreateTemplate_AHWChosenSniperPistol_Magnetic()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWChosenSniperPistol_MG');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'pistol';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_Common.MagSecondaryWeapons.MagPistol";
	Template.EquipSound = "Secondary_Weapon_Equip_Magnetic";
	Template.Tier = 3;

	Template.iRange = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_RANGE;
	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_MAGNETIC_RANGE;
	Template.BaseDamage = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_MAGNETIC_BASEDAMAGE;
	Template.Aim = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_MAGNETIC_AIM;
	Template.CritChance = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_MAGNETIC_CRITCHANCE;
	Template.iClipSize = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_MAGNETIC_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = 0;

	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;
	Template.InfiniteAmmo = true;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.Abilities.AddItem('PistolStandardShot');
	Template.Abilities.AddItem('PistolOverwatch');
	Template.Abilities.AddItem('PistolOverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('LethalDose');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('HunterAbility_LethalTempo');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_ChosenPistol.WP_ChosenPistol_T2";

	Template.iPhysicsImpulse = 5;
	Template.DamageTypeTemplateName = 'Projectile_MagAdvent';

	Template.bHideClipSizeStat = true;

	return Template;
}

static function X2DataTemplate CreateTemplate_AHWChosenSniperPistol_Beam()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWChosenSniperPistol_BM');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'pistol';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_Common.BeamSecondaryWeapons.BeamPistol";
	Template.EquipSound = "Secondary_Weapon_Equip_Beam";
	Template.Tier = 3;

	Template.iRange = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_RANGE;
	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_MAGNETIC_RANGE;
	Template.BaseDamage = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_BEAM_BASEDAMAGE;
	Template.Aim = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_BEAM_AIM;
	Template.CritChance = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_BEAM_CRITCHANCE;
	Template.iClipSize = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_BEAM_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_BEAM_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = 0;

	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;
	Template.InfiniteAmmo = true;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.Abilities.AddItem('PistolStandardShot');
	Template.Abilities.AddItem('PistolOverwatch');
	Template.Abilities.AddItem('PistolOverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('LethalDose');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('HunterAbility_LethalTempo');
	Template.Abilities.AddItem('HunterAbility_Sadism');
	Template.Abilities.AddItem('HunterAbility_Sadism2');
	Template.Abilities.AddItem('HunterAbility_Sadism3');
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_ChosenPistol.WP_ChosenPistol_T4";

	Template.iPhysicsImpulse = 5;
	Template.DamageTypeTemplateName = 'Projectile_MagAdvent';

	Template.bHideClipSizeStat = true;

	return Template;
}

static function X2DataTemplate CreateTemplate_AHWChosenSniperPistol_T4()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWChosenSniperPistol_T4');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'pistol';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_Common.BeamSecondaryWeapons.BeamPistol";
	Template.EquipSound = "Secondary_Weapon_Equip_Beam";
	Template.Tier = 3;

	Template.iRange = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_RANGE;
	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_MAGNETIC_RANGE;
	Template.BaseDamage = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_T4_BASEDAMAGE;
	Template.Aim = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_T4_AIM;
	Template.CritChance = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_T4_CRITCHANCE;
	Template.iClipSize = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_T4_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_T4_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_XpackWeapons'.default.CHOSENSNIPERPISTOL_T4_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = 0;

	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;
	Template.InfiniteAmmo = true;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.Abilities.AddItem('PistolStandardShot');
	Template.Abilities.AddItem('PistolOverwatch');
	Template.Abilities.AddItem('PistolOverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('LethalDose');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('HunterAbility_LethalTempo');
	Template.Abilities.AddItem('HunterAbility_Sadism');
	Template.Abilities.AddItem('HunterAbility_Sadism2');
	Template.Abilities.AddItem('HunterAbility_Sadism3');
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_ChosenPistol.WP_ChosenPistol_T4";

	Template.iPhysicsImpulse = 5;
	Template.DamageTypeTemplateName = 'Projectile_MagAdvent';

	Template.bHideClipSizeStat = true;

	return Template;
}
