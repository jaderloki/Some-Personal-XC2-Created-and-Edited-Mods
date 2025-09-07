class AHarderWar_Weapons_ChosenWarlock extends X2Item config(GameData_WeaponData);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	Weapons.AddItem(CreateTemplate_AHWWarlock_PsiWeaponM1());
	Weapons.AddItem(CreateTemplate_AHWWarlock_PsiWeaponM2());
	Weapons.AddItem(CreateTemplate_AHWWarlock_PsiWeaponM3());
	Weapons.AddItem(CreateTemplate_AHWWarlock_PsiWeaponM4());

	return Weapons;
}


// **************************************************************************
// ***                      Warlock Psi Weapon							  ***
// **************************************************************************
static function X2DataTemplate CreateTemplate_AHWWarlock_PsiWeaponM1()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWWarlock_PsiWeaponM1');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'psiamp';
	Template.WeaponTech = 'alien';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Psi_Amp";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer); //invalidates multiplayer availability

	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Psi';

	Template.Abilities.AddItem('TeleportAlly');
	Template.Abilities.AddItem('PsiMindControl');
	Template.Abilities.AddItem('MindScorch');
	Template.Abilities.AddItem('SpectralArmy');
	Template.Abilities.AddItem('Corress');

	return Template;
}

static function X2DataTemplate CreateTemplate_AHWWarlock_PsiWeaponM2()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWWarlock_PsiWeaponM2');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'psiamp';
	Template.WeaponTech = 'alien';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Psi_Amp";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer); //invalidates multiplayer availability

	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Psi';

	Template.Abilities.AddItem('TeleportAlly');
	Template.Abilities.AddItem('PsiMindControl');
	Template.Abilities.AddItem('MindScorch');
	Template.Abilities.AddItem('SpectralArmyM2');
	Template.Abilities.AddItem('CorressM2');

	return Template;
}

static function X2DataTemplate CreateTemplate_AHWWarlock_PsiWeaponM3()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWWarlock_PsiWeaponM3');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'psiamp';
	Template.WeaponTech = 'alien';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Psi_Amp";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer); //invalidates multiplayer availability

	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Psi';

	Template.Abilities.AddItem('TeleportAlly');
	Template.Abilities.AddItem('PsiMindControl');
	Template.Abilities.AddItem('MindScorch');
	Template.Abilities.AddItem('SpectralArmyM3');
	Template.Abilities.AddItem('CorressM3');
	Template.Abilities.AddItem('NullLance');

	Template.ExtraDamage = class'X2Item_DefaultWeapons'.default.AVATAR_AI_PSIAMP_ABILITYDAMAGE;

	Template.SetAnimationNameForAbility('NullLance', 'HL_ChosenWarlock_NullLance');	

	return Template;
}

static function X2DataTemplate CreateTemplate_AHWWarlock_PsiWeaponM4()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWWarlock_PsiWeaponM4');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'psiamp';
	Template.WeaponTech = 'alien';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Psi_Amp";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer); //invalidates multiplayer availability

	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Psi';

	Template.Abilities.AddItem('TeleportAlly');
	Template.Abilities.AddItem('PsiMindControl');
	Template.Abilities.AddItem('MindScorch');
	Template.Abilities.AddItem('SpectralArmyM4');
	Template.Abilities.AddItem('CorressM4');
	Template.Abilities.AddItem('PsiDimensionalRiftStage1');
	Template.Abilities.AddItem('PsiDimensionalRiftStage2');
	Template.Abilities.AddItem('NullLance');

	Template.ExtraDamage = class'X2Item_DefaultWeapons'.default.AVATAR_PLAYER_PSIAMP_ABILITYDAMAGE;

	Template.SetAnimationNameForAbility('NullLance', 'HL_ChosenWarlock_NullLance');	
	Template.SetAnimationNameForAbility('PsiDimensionalRiftStage1', 'HL_ChosenWarlock_PsiRift');	

	return Template;
}