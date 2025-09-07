class X2Character_SavageItemsCharacters extends X2Character config(GameData_CharacterStats);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(CreateTemplate_DecoyBeacon());
	Templates.AddItem(CreateTemplate_BunkerModule());
	Templates.AddItem(CreateTemplate_ImprovisedCover());
	Templates.AddItem(CreateTemplate_SAVNanoClone());
	Templates.AddItem(CreateTemplate_SAVNanoCloneHuman());	
	return Templates;
}


static function X2CharacterTemplate CreateTemplate_DecoyBeacon()
{
	local X2CharacterTemplate CharTemplate;

	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, 'DecoyBeacon');

	CharTemplate.strPawnArchetypes.AddItem("GameUnit_MimicBeacon.ARC_MimicBeacon_M");
	CharTemplate.strPawnArchetypes.AddItem("GameUnit_MimicBeacon.ARC_MimicBeacon_F");

	CharTemplate.UnitSize = 1;

	// Traversal Rules
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = true;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = true;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.bCanUse_eTraversal_BreakWindow = false;
	CharTemplate.bCanUse_eTraversal_KickDoor = false;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bAppearanceDefinesPawn = false;
	CharTemplate.bCanTakeCover = false;

	CharTemplate.bSkipDefaultAbilities = true;

	CharTemplate.bIsAlien = false;
	CharTemplate.bIsAdvent = false;
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = false;
	CharTemplate.bIsSoldier = false;
	CharTemplate.bIsMeleeOnly = false;

	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bIsAfraidOfFire = false;
	
	CharTemplate.bAllowSpawnFromATT = false;

	CharTemplate.bDisplayUIUnitFlag = false;
	CharTemplate.bNeverSelectable = true;

	CharTemplate.Abilities.AddItem('DecoyBeaconInitialize');
	CharTemplate.Abilities.AddItem('GuaranteedToHit');

	return CharTemplate;
}

static function X2CharacterTemplate CreateTemplate_BunkerModule()
{
	local X2CharacterTemplate CharTemplate;

	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, 'BunkerModule');
	CharTemplate.CharacterGroupName = 'SAVGadgets';
	CharTemplate.strPawnArchetypes.AddItem("SAV_BunkerModule2.ARC_GameUnit_BunkerModule");
	CharTemplate.UnitSize = 1;

	CharTemplate.DefaultLoadout='SAVBunkerModule_Loadout';

	// Traversal Rules
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = true;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = true;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.bCanUse_eTraversal_BreakWindow = false;
	CharTemplate.bCanUse_eTraversal_KickDoor = false;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bAppearanceDefinesPawn = false;
	CharTemplate.bCanTakeCover = false;

	CharTemplate.bSkipDefaultAbilities = true;

	CharTemplate.bIsAlien = false;
	CharTemplate.bIsAdvent = false;
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = true;
	CharTemplate.bIsSoldier = false;
	CharTemplate.bIsMeleeOnly = false;
	CharTemplate.bUsesWillSystem = false;

	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bIsAfraidOfFire = false;
	
	CharTemplate.bAllowSpawnFromATT = false;

	CharTemplate.bDisplayUIUnitFlag = true;
	CharTemplate.bNeverSelectable = false;

	CharTemplate.Abilities.AddItem('BunkerModulePassive');
	CharTemplate.Abilities.AddItem('BunkerModule_Shutdown');
//	CharTemplate.Abilities.AddItem('BunkerFieldAbility');// - Ability is on the Weapon now
	CharTemplate.Abilities.AddItem('SAVUnitPassTurn');

	return CharTemplate;
}

static function X2CharacterTemplate CreateTemplate_ImprovisedCover()
{
	local X2CharacterTemplate CharTemplate;

	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, 'ImprovisedCover');
	CharTemplate.CharacterGroupName = 'SAVGadgets';
	CharTemplate.strPawnArchetypes.AddItem("SAV_BunkerModule2.ARC_GameUnit_CoverPackBase");
	CharTemplate.UnitSize = 1;

	CharTemplate.DefaultLoadout='SAVCoverPack_Loadout';

	// Traversal Rules
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = true;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = true;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.bCanUse_eTraversal_BreakWindow = false;
	CharTemplate.bCanUse_eTraversal_KickDoor = false;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bAppearanceDefinesPawn = false;
	CharTemplate.bCanTakeCover = false;

	CharTemplate.bSkipDefaultAbilities = true;

	CharTemplate.bIsAlien = false;
	CharTemplate.bIsAdvent = false;
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = true;
	CharTemplate.bIsSoldier = false;
	CharTemplate.bIsMeleeOnly = false;
	CharTemplate.bUsesWillSystem = false;

	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bIsAfraidOfFire = false;
	
	CharTemplate.bAllowSpawnFromATT = false;

	CharTemplate.bDisplayUIUnitFlag = true;
	CharTemplate.bNeverSelectable = false;

	CharTemplate.Abilities.AddItem('ImprovisedCoverTurn');
	CharTemplate.Abilities.AddItem('ImprovisedCoverPassive');
	CharTemplate.Abilities.AddItem('SAVUnitPassTurn');
	//Self destruct on the weapon

	return CharTemplate;
}

static function X2CharacterTemplate CreateTemplate_SAVNanoClone(Name TemplateName = 'SAVNanoClone')
{
	local X2CharacterTemplate CharTemplate;

	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, TemplateName);
	CharTemplate.CharacterGroupName = 'SAVNanoClone';
	CharTemplate.strPawnArchetypes.AddItem("SavNanoWarfare.Archetypes.ARC_GameUnit_NanoClone");
	CharTemplate.strPawnArchetypes.AddItem("SavNanoWarfare.Archetypes.ARC_GameUnit_NanoClone_F");
//	CharTemplate.strPawnArchetypes.AddItem("GameUnit_TheLost.ARC_GameUnit_TheLost_Wolf");
//	CharTemplate.strPawnArchetypes.AddItem("GameUnit_Zombie.ARC_GameUnit_Zombie");
//	CharTemplate.strPawnArchetypes.AddItem("GameUnit_Zombie.ARC_GameUnit_Zombie_F");
//	CharTemplate.strPawnArchetypes.AddItem("GameUnit_ShadowBind.ARC_ShadowBindUnit_M");
//	CharTemplate.strPawnArchetypes.AddItem("GameUnit_ShadowBind.ARC_ShadowBindUnit_F");

	CharTemplate.bNeverShowFirstSighted = true;

	CharTemplate.DefaultLoadout='SAVNanoClone_Loadout';

	CharTemplate.UnitSize = 1;

// Traversal Rules
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = true;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = true;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.bCanUse_eTraversal_BreakWindow = true;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bAppearanceDefinesPawn = false;    
	CharTemplate.bCanTakeCover = false;

	CharTemplate.bSkipDefaultAbilities = true;

	CharTemplate.bIsAlien = false;
	CharTemplate.bIsAdvent = false;
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = false;
	CharTemplate.bIsSoldier = false;
	CharTemplate.bIsMeleeOnly = true;

	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bIsAfraidOfFire = true;

	CharTemplate.Abilities.AddItem('StandardMove');
	CharTemplate.Abilities.AddItem('ZombieInitialization');
	CharTemplate.Abilities.AddItem('NanoClonerUnitInitialize');
	CharTemplate.Abilities.AddItem('BunkerModule_Shutdown');

	CharTemplate.ImmuneTypes.AddItem('Mental');
	CharTemplate.ImmuneTypes.AddItem('Poison');
	CharTemplate.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.ParthenogenicPoisonType);
	CharTemplate.ImmuneTypes.AddItem('NanoShred');

	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_TheLost;
	
	return CharTemplate;
}

	static function X2CharacterTemplate CreateTemplate_SAVNanoCloneHuman()
{
	local X2CharacterTemplate CharTemplate;
	CharTemplate = CreateTemplate_SAVNanoClone('SAVNanoCloneHuman');
	CharTemplate.strPawnArchetypes.Length = 0;

	CharTemplate.strPawnArchetypes.AddItem("SavNanoWarfare.Archetypes.ARC_GameUnit_NanoClone");
	CharTemplate.strPawnArchetypes.AddItem("SavNanoWarfare.Archetypes.ARC_GameUnit_NanoClone_F");
//	CharTemplate.strPawnArchetypes.AddItem("GameUnit_TheLost.ARC_GameUnit_TheLost_Wolf");
//	CharTemplate.strPawnArchetypes.AddItem("GameUnit_Zombie.ARC_GameUnit_Zombie_Human_M");
//	CharTemplate.strPawnArchetypes.AddItem("GameUnit_Zombie.ARC_GameUnit_Zombie_Human_F");
//	CharTemplate.strPawnArchetypes.AddItem("GameUnit_ShadowBind.ARC_ShadowBindUnit_M");
//	CharTemplate.strPawnArchetypes.AddItem("GameUnit_ShadowBind.ARC_ShadowBindUnit_F");

	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_TheLost;

	return CharTemplate;
}