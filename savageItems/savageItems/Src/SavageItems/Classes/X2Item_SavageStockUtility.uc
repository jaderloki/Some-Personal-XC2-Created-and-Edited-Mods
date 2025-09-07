class X2Item_SavageStockUtility extends X2Item config(SavageStockItems);

var config string SYSTEMINFILTRATIONON1;
var config string SYSTEMINFILTRATIONON2;

var config int SUPPLY_COST_ALLOYWEAVE;
var config int ALLOY_COST_ALLOYWEAVE;

var config int SUPPLY_COST_HEAVYVEST;
var config int TPV_HEAVYVEST;
var config int SUPPLY_COST_LIGHTWEIGHTVEST;
var config int TPV_LIGHTWEIGHTVEST;

var config int SUPPLY_COST_WEBBINGAMOD;
var config int TPV_WEBBINGAMOD;
var config int SUPPLY_COST_CERAMICPLATEAMOD;
var config int TPV_CERAMICPLATEAMOD;

var config int SUPPLY_COST_LIGHTAMOD;
var config int SUPPLY_COST_MAGCARRIERAMOD;
var config int SUPPLY_COST_GRENADEAMOD;
var config int SUPPLY_COST_ASSAULTAMOD;
var config int SUPPLY_COST_MEDICALAMOD;
var config int SUPPLY_COST_HAZMATAMOD;
var config int PURIFIER_COST_HAZMATAMOD;
var config int SUPPLY_COST_ENGENEERINGAMOD;

var config int SUPPLY_COST_ALLOYOVERLAY;
var config int ALLOY_COST_ALLOYOVERLAY;

var config int SUPPLY_COST_POWEREDOVERLAY;
var config int ELERIUM_COST_POWEREDOVERLAY;
var config int ALLOY_COST_POWEREDOVERLAY;

var config int MEDIPACK_COST_SUPPLIES;
var config int MEDIPACK_TPV;
var config int MEDIPACK_CHARGES;
var config int MEDIPACK_RANGE_TILES;
var name MedikitCat;

var config int PROXSCANNER_RADIUS;
var config int PROXSCANNER_CHARGES;
var config int FIELDSCANNER_RADIUS;
var config int FIELDSCANNER_RANGE;
var config int SUPPLY_COST_PROXSCANNER;
var config int SUPPLY_COST_FIELDSCANNER;

var config int SUPPLY_COST_PASSIVESENSORS;
var config int PASSIVESENSORS_COST_CORPSETROOPER;
var config int SUPPLY_COST_ADVSENSORS;
var config int ADVSENSORS_COST_CORPSEMEC;
var config int ADVSENSORS_COST_CORPSEOFFICER;
var config int ADVSENSORS_RADIUS;

var config int ADVHACKTOOL_RANGE;
var config int SUPPLY_COST_ADVHACKTOOL;

var config int NANOHACKTOOL_RANGE;

var config int DECOYBEACON_RANGE;

var config int REPAIRKIT_CHARGES;
var config int REPAIRKIT_RANGE_TILES;

var config int REPAIRKIT2_CHARGES;
var config int REPAIRKIT2_RANGE_TILES;

var config int SUPPLY_COST_PARTISANAMOD;
var config int SUPPLY_COST_ANIMASHIELD;
var config int SECTOID_COST_ANIMASHIELD;
var config int PRIEST_COST_ANIMASHIELD;

var config int SUPPLY_COST_DECOYBEACON;
var config int TROOPER_COST_DECOYBEACON;

var config int SUPPLY_COST_REPAIRKIT;
var config int SUPPLY_COST_REPAIRKIT2;
var config int SUPPLY_COST_PLATINGKIT;
var config int SUPPLY_COST_COVERKIT;

var config int ALLOYWEAVE_TPV;

var config int LIGHTWEIGHT_AMOD_TPV;
var config int GBANDOLIER_AMOD_TPV;
var config int MAGCARRIER_AMOD_TPV;
var config int ASSAULT_AMOD_TPV;
var config int MEDICAL_AMOD_TPV;
var config int HAZMAT_AMOD_TPV;
var config int ENGENEERING_AMOD_TPV;
var config int PARTISAN_AMOD_TPV;
var config int ALLOYPLATE_AMOD_TPV;

var config int PLATED_AMODS_TPV;
var config int POWEREDPLATE_AMOD_TPV;
var config int POWERED_AMODS_TPV;

var config int ANIMASHIELD_TPV;
var config int NANOREACTIVE_AMOD_TPV;
var config int WRAITH_AMOD_TPV;
var config int SOLICE_AMOD_TPV;
var config int SHIELD_AMOD_TPV;
var config int PROXIMITYSCANNER_TPV;
var config int FIELDSCANNER_TPV;
var config int PASSIVESENSORS_TPV;
var config int ADVANCEDSENSORS_TPV;
var config int ADVANCEDHACKTOOL_TPV;
var config int NANOHACKTOOL_TPV;
var config int DECOYBEACON_TPV;
var config int REPAIRKIT_TPV;
var config int REPAIRKIT2_TPV;

var config int BUNKERMODULE_RANGE;
var config int SUPPLY_COST_BUNKERMODULE;
var config int SHIELDBEARER_COST_BUNKERMODULE;
var config int BUNKERMODULE_TPV;
var config array<Name> AbilitiesBUNKERMODULECantHave;
var config array<Name> AbilitiesBUNKERMODULECanHave;

var config int ADVENTSHIELDAMP_TPV;
var config int REAPERGOGGLES_TPV;
var config int REAPER_AMOD_TPV;
var config int SKIRMISHERCONTROLCHIP_TPV;
var config int TEMPLARTRANSLOCATOR_TPV;
var config int TEMPLARAMOD_TPV;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Items;

	Items.AddItem(CreateReinforcedVest());
	Items.AddItem(CreateSavLightVest());
	Items.AddItem(CreateAlloyweveVest());
	Items.AddItem(CreateStandardIssueAMod());
	Items.AddItem(CreateCeramicBolsterPlating());
	Items.AddItem(CreateWebbingOverlay());
	Items.AddItem(CreateMagazineCarrierOverlay());
	Items.AddItem(CreateLightweightOverlay());
	Items.AddItem(CreateGBandolierOverlay());
 	Items.AddItem(CreateAssaultOverlay());
 	Items.AddItem(CreateMedicalOverlay());
 	Items.AddItem(CreateHazmatAmod());
 	Items.AddItem(CreateEngeneeringAmod());
	Items.AddItem(CreatePartisanAmod());
	Items.AddItem(CreateAlloyOverlay());
	Items.AddItem(CreateWalkerServosOverlay());
	Items.AddItem(CreateRocketLauncherOverlay());
	Items.AddItem(CreateTacUplinkOverlay());
	Items.AddItem(CreateMunitionsCarrierOverlay());
	Items.AddItem(CreatePoweredOverlay());
	Items.AddItem(CreateReflexAMod());
	Items.AddItem(CreateTeleportOverlay());
	Items.AddItem(CreateSavAnimaShield());
	Items.AddItem(CreateWraithOverlay());
	Items.AddItem(CreateSoliceAMod());
	Items.AddItem(CreateShieldOverlay());
	Items.AddItem(CreateSAVReactiveNanoArmor());
	Items.AddItem(CreateDreadnaughtOverlay());
	Items.AddItem(CreateActiveCamoAMod());
											  
	Items.AddItem(CreateMedipack());
	Items.AddItem(CreateProxScanner());
	Items.AddItem(CreateFieldScanner());
	Items.AddItem(CreatePassiveSensors());
	Items.AddItem(CreateAdvancedSensors());
	Items.AddItem(CreateAdvancedHackTool());
	Items.AddItem(CreateNanoHackTool());
	Items.AddItem(CreateDecoyBeacon());
	Items.AddItem(CreateRepairKit());
	Items.AddItem(CreateRepairKit2());
	Items.AddItem(CreateRepairKitPlating());
	Items.AddItem(CreateImprovisedCoverKit());
	Items.AddItem(CreateBunkerModule());
	Items.AddItem(CreateADVENTShieldAmp());
	Items.AddItem(CreateSAVReaperGoggles());
	Items.AddItem(CreateSAVReaperAMod());
	Items.AddItem(SAVSkirmisherControlChip());
	Items.AddItem(SAVTemplarAMod());
	Items.AddItem(SAVTranslocator());
		
	return Items;
}

static function X2DataTemplate CreateReinforcedVest()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'ReinforcedVest');
	Template.ItemCat = 'defense';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Reinforced_Vest";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Abilities.AddItem('ReinforcedVestBonus');

	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.Tier = 0;

	Template.bShouldCreateDifficultyVariants = false;

	Template.TradingPostValue = Default.TPV_HEAVYVEST;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_HEAVYVEST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, 1);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, -1);

	return Template;
}

static function X2DataTemplate CreateSavLightVest()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SavLightVest');
	Template.ItemCat = 'defense';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SavLightVest";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Abilities.AddItem('SavLightVestBonus');

	Template.Requirements.RequiredTechs.AddItem('HybridMaterials');

	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.Tier = 0;

	Template.TradingPostValue = Default.TPV_LIGHTWEIGHTVEST;
	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, 2);
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_LIGHTWEIGHTVEST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Template.bShouldCreateDifficultyVariants = true;

	return Template;
}

static function X2DataTemplate CreateAlloyweveVest()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'AlloyweveVest');
	Template.ItemCat = 'defense';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Alloyweave_Vest";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Abilities.AddItem('AlloyweveVestBonus');
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.Tier = 0;

	Template.bShouldCreateDifficultyVariants = false;

	Template.Requirements.RequiredTechs.AddItem('PlatedArmor');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, 2);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_ALLOYWEAVE;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
    Artifacts.Quantity = default.ALLOY_COST_ALLOYWEAVE;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Template.TradingPostValue = Default.ALLOYWEAVE_TPV;

	return Template;
}

static function X2DataTemplate CreateStandardIssueAMod()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'StandardIssueAMod');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_StandardAMod";// Needs a better image for equip.
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Abilities.AddItem('AModBonusSlotBlocker');

	Template.Tier = 4;
	Template.StartingItem = true; // Put the code in to the relevant file that gives players this gear when they load in to the game.
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
		
	return Template;
}

static function X2DataTemplate CreateLightweightOverlay()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'LightweightOverlay');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_LightweightOverlay";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Requirements.RequiredTechs.AddItem('HybridMaterials');

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('ArmourModLight');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Offense, 5);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, 3);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, 10);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_LIGHTAMOD;
	Template.Cost.ResourceCosts.AddItem(Resources);
		
	Template.TradingPostValue = Default.LIGHTWEIGHT_AMOD_TPV;

	return Template;
}

static function X2DataTemplate CreateWebbingOverlay()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'WebbingOverlay');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_WebbingOverlay";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('WebbingOverlayBonus');
	Template.Abilities.AddItem('ArmourModCumbersome');
	Template.Abilities.AddItem('AModBonusSlotBlocker');
	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -20);
	Template.TradingPostValue = Default.TPV_WEBBINGAMOD;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_WEBBINGAMOD;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateCeramicBolsterPlating()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'CeramicBolsterPlating');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Ceramic_Overlay";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('CeramicBolsterPlatingBonus');
	Template.Abilities.AddItem('ArmourModXheavy');
	Template.Abilities.AddItem('AModBonusSlotBlocker');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, 1);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, 2);
	//Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, -2);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -5);

	Template.TradingPostValue = Default.TPV_CERAMICPLATEAMOD;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_CERAMICPLATEAMOD;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateGBandolierOverlay()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'GBandolierOverlay');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_GrenadeBandolier";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('HybridMaterials');

	Template.Abilities.AddItem('GBandolierBonus');
	Template.Abilities.AddItem('ArmourModVheavy');
	Template.Abilities.AddItem('AModBonusSlotBlocker');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, -1);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -10);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_GRENADEAMOD;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Template.TradingPostValue = Default.GBANDOLIER_AMOD_TPV;

	return Template;
}

static function X2DataTemplate CreateMagazineCarrierOverlay()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'MagazineCarrierOverlay');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_MagazineOverlay";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('HybridMaterials');

	Template.Abilities.AddItem('ExtraMagsPerkLL');
	Template.Abilities.AddItem('MagazineCarrierBonus');
	Template.Abilities.AddItem('MunitionsCarrierFreeload');
	Template.Abilities.AddItem('ArmourModHeavy');
	Template.Abilities.AddItem('AModBonusSlotBlocker');

	//Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, -1);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -5);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_MAGCARRIERAMOD;
	Template.Cost.ResourceCosts.AddItem(Resources);
		
	Template.TradingPostValue = Default.MAGCARRIER_AMOD_TPV;

	return Template;
}

static function X2DataTemplate CreateAssaultOverlay()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'AssaultOverlay');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_AssaultGearOverlay";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	
	Template.Requirements.RequiredTechs.AddItem('HybridMaterials');

	Template.Abilities.AddItem('AssaultOverlayBonus');
	Template.Abilities.AddItem('SAVBreachBangClear');
	Template.Abilities.AddItem('ArmourModCumbersome');
	Template.Abilities.AddItem('AModBonusSlotBlocker');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Offense, 3);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -5);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ShieldHP, 3);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_ASSAULTAMOD;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Template.TradingPostValue = Default.ASSAULT_AMOD_TPV;

	return Template;
}

static function X2DataTemplate CreateMedicalOverlay()
{
	local ArtifactCost Resources;
	local X2EquipmentTemplate Template;
	
	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'MedicalOverlay');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_MedicalGearOverlay";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('MedicalOverlayBonus');
	Template.Abilities.AddItem('SAVMedicalProtocol');
	Template.Abilities.AddItem('ArmourModHeavy');
	Template.Abilities.AddItem('AModBonusSlotBlocker');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, -1);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -10);
	
	Template.Requirements.RequiredTechs.AddItem('HybridMaterials');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_MEDICALAMOD;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Template.TradingPostValue = Default.MEDICAL_AMOD_TPV;

	return Template;
}

static function X2DataTemplate CreateHazmatAmod()
{
	local ArtifactCost Resources;
	local ArtifactCost Artifacts;
	local X2EquipmentTemplate Template;
	
	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'HazmatAmod');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_HazmatAMod";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('ArmourModCumbersome');
	Template.Abilities.AddItem('AModBonusSlotBlocker');
	Template.Abilities.AddItem('HazmatAModBonus');
	
	Template.Requirements.RequiredTechs.AddItem('AlienBiotech');
	Template.Requirements.RequiredItems.AddItem('CorpseAdventPurifier');
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventOfficer');
	Template.Requirements.RequiredTechs.AddItem('HybridMaterials');
	
	//WILL BE AVALIABLE FROM PURIFIER AND REQUIRE CORPSES
	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, 2);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -5);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_HAZMATAMOD;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'CorpseAdventPurifier';
	Artifacts.Quantity = default.PURIFIER_COST_HAZMATAMOD;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	Template.TradingPostValue = Default.HAZMAT_AMOD_TPV;

	return Template;
}

static function X2DataTemplate CreateEngeneeringAmod()
{
	local ArtifactCost Resources;
	local X2EquipmentTemplate Template;
	
	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'EngeneeringAmod');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_EngeneeringAMod";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	
	Template.Requirements.RequiredTechs.AddItem('HybridMaterials');

	Template.Abilities.AddItem('ArmourModVheavy');
	Template.Abilities.AddItem('AModBonusSlotBlocker');
	Template.Abilities.AddItem('EngeneeringAModBonus');
	Template.Abilities.AddItem('BlastPadding');
	Template.Abilities.AddItem('SAVEngineeringProtocol');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, 1);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -5);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ShieldHP, 2);
			
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_ENGENEERINGAMOD;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Template.TradingPostValue = Default.ENGENEERING_AMOD_TPV;

	return Template;
}

static function X2DataTemplate CreatePartisanAmod()
{
	local ArtifactCost Resources;
	local X2EquipmentTemplate Template;
	
	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'PartisanAmod');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_PartisanAMod";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('AModBonusSlotBlocker');
	Template.Abilities.AddItem('HiddenBladesItemBonusCharges');
	Template.Abilities.AddItem('KnifeFighterBonus');

	Template.Requirements.RequiredTechs.AddItem('HybridMaterials');
		
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_PARTISANAMOD;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Template.TradingPostValue = Default.PARTISAN_AMOD_TPV;

	return Template;
}

static function X2DataTemplate CreateAlloyOverlay()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'AlloyOverlay');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_AlloyOverlay";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 1;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('AlloyOverlayBonus');
	Template.Abilities.AddItem('ArmourModHeavy');
	Template.Abilities.AddItem('AModBonusSlotBlocker');
	
	Template.Requirements.RequiredTechs.AddItem('PlatedArmor');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, 3);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, 3);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, -2);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -10);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_ALLOYOVERLAY;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
    Artifacts.Quantity = default.ALLOY_COST_ALLOYOVERLAY;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Template.TradingPostValue = Default.ALLOYPLATE_AMOD_TPV;

	return Template;
}

static function X2DataTemplate CreateWalkerServosOverlay()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'WalkerServosOverlay');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_LegServos";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 1;
//	Template.RewardDecks.AddItem('PlatedAModRewards');
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, 2);

	Template.Abilities.AddItem('WalkerServoOverlayBonus');
	Template.Abilities.AddItem('WalkerServoOverdrive');
	Template.Abilities.AddItem('AModBonusSlotBlocker');
	Template.Abilities.AddItem('SyntheticLegMuscles');

	Template.TradingPostValue = Default.PLATED_AMODS_TPV;

	return Template;
}

static function X2DataTemplate CreateRocketLauncherOverlay()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'RocketLauncherOverlay');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ConvRocketOverlay";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 1;
//	Template.RewardDecks.AddItem('PlatedAModRewards');
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	//Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, -2);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -10);

	Template.Abilities.AddItem('ArmourModVHeavy');
	Template.Abilities.AddItem('DevistatorOverlayBonus');
	Template.Abilities.AddItem('SyntheticLegMuscles');

	Template.TradingPostValue = Default.PLATED_AMODS_TPV;

	return Template;
}

//Get Locs and graphics, seperate configs out from the Walker servos
static function X2DataTemplate CreateTacUplinkOverlay()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'TacUplinkOverlay');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_TacUplinkAMod";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 1;
//	Template.RewardDecks.AddItem('PlatedAModRewards');
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;


	//Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, -1);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -5);

	Template.Abilities.AddItem('ArmourModHeavy');
	Template.Abilities.AddItem('TacuplinkMark');
	Template.Abilities.AddItem('TacUplinkCharges');
	Template.Abilities.AddItem('AModBonusSlotBlocker');

	Template.TradingPostValue = Default.PLATED_AMODS_TPV;

	return Template;
}

static function X2DataTemplate CreateMunitionsCarrierOverlay()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'MunitionsCarrierOverlay');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_MunitionsCarrierMod";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 1;
//	Template.RewardDecks.AddItem('PlatedAModRewards');
	Template.StartingItem = false;
	Template.CanBeBuilt =false;
	Template.bInfiniteItem = false;

	//Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, -2);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -20);

	Template.Abilities.AddItem('MunitionsCarrierBonus');
	Template.Abilities.AddItem('ArmourModXheavy');
	Template.Abilities.AddItem('MunitionsCarrierFreeload');
	Template.Abilities.AddItem('AModBonusSlotBlocker');

	Template.TradingPostValue = Default.PLATED_AMODS_TPV;

	return Template;
}

static function X2DataTemplate CreatePoweredOverlay()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'PoweredOverlay');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_PoweredPlateOverlay";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 2;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('ArmourModCumbersome');
	Template.Abilities.AddItem('PoweredOverlayBonus');
	Template.Abilities.AddItem('AModBonusSlotBlocker');

	Template.Requirements.RequiredTechs.AddItem('PoweredArmor');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, 3);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, 2);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -5);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_POWEREDOVERLAY;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
    Artifacts.Quantity = default.ALLOY_COST_POWEREDOVERLAY;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Artifacts.ItemTemplateName = 'EleriumDust';
    Artifacts.Quantity = default.ELERIUM_COST_POWEREDOVERLAY;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Template.TradingPostValue = Default.POWEREDPLATE_AMOD_TPV;

	return Template;
}

static function X2DataTemplate CreateReflexAMod()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'ReflexAMod');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_PoweredAModReflex";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 2;
//	Template.RewardDecks.AddItem('PoweredAModRewards');
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('AModBonusSlotBlocker');
	Template.Abilities.AddItem('SavReflexAccuracy');
	Template.Abilities.AddItem('SavReflexInterrupt');
	Template.Abilities.AddItem('SavReflexiveAction');
	Template.Abilities.AddItem('SavReflexCharges');

	Template.TradingPostValue = Default.POWERED_AMODS_TPV;

	return Template;
}

static function X2DataTemplate CreateTeleportOverlay()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'TeleportOverlay');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_TeleportAMod";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 2;
//	Template.RewardDecks.AddItem('PoweredAModRewards');
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	
	Template.Abilities.AddItem('ArmourModHeavy');
	Template.Abilities.AddItem('AModBonusSlotBlocker');
	Template.Abilities.AddItem('SavTeleportCharges');
	Template.Abilities.AddItem('SavTeleportAbility');
	Template.Abilities.AddItem('SavTeleportAModAnimset');
	Template.Abilities.AddItem('TeleportWillLoss');

	//Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, -1);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -5);
	
	Template.TradingPostValue = Default.POWERED_AMODS_TPV;

	return Template;
}

static function X2DataTemplate CreateDreadnaughtOverlay()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'DreadnaughtOverlay');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_DreadnaughtPlate";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 2;
//	Template.RewardDecks.AddItem('PoweredAModRewards');
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('DreadnaughtOverlayBonus');
	Template.Abilities.AddItem('ArmourModXheavy');
	Template.Abilities.AddItem('AModBonusSlotBlocker');
	Template.Abilities.AddItem('Bulky');	
	Template.Abilities.AddItem('IRI_RagingBall');
	
	//Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, -2);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -20);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, 6);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, 4);

	Template.TradingPostValue = Default.POWERED_AMODS_TPV;

	return Template;
}

static function X2DataTemplate CreateActiveCamoAMod()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'ActiveCamoAMod');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ActiveCamo";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 2;
//	Template.RewardDecks.AddItem('PoweredAModRewards');
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('ActiveCamoStealth');
	Template.Abilities.AddItem('ActiveOptiCam');
	Template.Abilities.AddItem('Phantom');

	Template.TradingPostValue = Default.POWERED_AMODS_TPV;

	return Template;
}

static function X2DataTemplate CreateSavAnimaShield()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SavAnimaShield');
	Template.ItemCat = 'psidefense';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_AnimaShield";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";

	Template.Abilities.AddItem('MindShield');
	Template.Abilities.AddItem('SavAnimaShield');

	Template.Requirements.RequiredTechs.AddItem('TechPsionicFieldTheory');

	Template.CanBeBuilt = true;
	Template.TradingPostValue = Default.ANIMASHIELD_TPV;
	Template.PointsToComplete = 0;
	Template.Tier = 2;

	Template.bShouldCreateDifficultyVariants = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ShieldHP, 3);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PsiOffenseBonusLabel, eStat_PsiOffense, 20);

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_ANIMASHIELD;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'CorpseSectoid';
	Artifacts.Quantity = default.SECTOID_COST_ANIMASHIELD;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Artifacts.ItemTemplateName = 'CorpseAdventPriest';
	Artifacts.Quantity = default.PRIEST_COST_ANIMASHIELD;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);


	
	return Template;
}

static function X2DataTemplate CreateSAVReactiveNanoArmor()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SAVReactiveNanoArmor');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_NanoPlatingAmod";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 2;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
		
	Template.Abilities.AddItem('AModBonusSlotBlocker');
	Template.Abilities.AddItem('SAVNanomachineCoating');
	Template.Abilities.AddItem('SAVReactiveNanoArmor');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, 1);

	Template.TradingPostValue = Default.NANOREACTIVE_AMOD_TPV;

	return Template;
}

static function X2DataTemplate CreateWraithOverlay()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'WraithOverlay');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_WraithOverlay";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 2;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('WraithOverlayBonus');
	Template.Abilities.AddItem('WallPhasing');
	Template.Abilities.AddItem('ArmourModHeavy');
	Template.Abilities.AddItem('AModBonusSlotBlocker');

	//Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, -1);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -5);

	Template.TradingPostValue = Default.WRAITH_AMOD_TPV;

	return Template;
}

static function X2DataTemplate CreateSoliceAMod()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SoliceAMod');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_PoweredAModSolice";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 2;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	//Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, -1);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -5);

	Template.Abilities.AddItem('ArmourModHeavy');
	Template.Abilities.AddItem('AModBonusSlotBlocker');
//	Template.Abilities.AddItem('SavTranquility');
	Template.Abilities.AddItem('SavTranquilityClense');
	Template.Abilities.AddItem('SavTranquilityPsiDrain');

	Template.TradingPostValue = Default.SOLICE_AMOD_TPV;

	return Template;
}

static function X2DataTemplate CreateShieldOverlay()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'ShieldOverlay');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_DefenceOverlay";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 2;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	//Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, -1);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, -10);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ShieldHP, 3);

	Template.Abilities.AddItem('ShieldOverlayBonus');
	Template.Abilities.AddItem('ShieldOverShieldHP');
	Template.Abilities.AddItem('ShieldOverAnimset');
	Template.Abilities.AddItem('ArmourModHeavy');
	Template.Abilities.AddItem('AModBonusSlotBlocker');
	Template.Abilities.AddItem('HighCoverGenerator');

	Template.TradingPostValue = Default.SHIELD_AMOD_TPV;

	return Template;
}

static function X2DataTemplate CreateMedipack()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Medipack');
	Template.ItemCat = 'heal';
	Template.WeaponCat = 'UtilityCatHeal';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Medipack";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.iClipSize = default.MEDIPACK_CHARGES;
	Template.iRange = default.MEDIPACK_RANGE_TILES;
	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('MedipackHeal');
	Template.Abilities.AddItem('MedipackStabilize');
//	Template.Abilities.AddItem('MedikitBonus');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.MEDIPACK_CHARGES);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.MEDIPACK_RANGE_TILES);

	Template.GameArchetype = "SavItems_Art.Anims.WP_Medipack";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.bShouldCreateDifficultyVariants = true;

	Template.TradingPostValue = Default.MEDIPACK_TPV;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.MEDIPACK_COST_SUPPLIES;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateProxScanner()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'ProxScanner');
	Template.ItemCat = 'SavScanner';
	Template.WeaponCat = 'utility';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_FieldScanner";
	Template.EquipSound = "StrategyUI_Medkit_Equip";
	Template.iRadius = default.PROXSCANNER_RADIUS;
//	Template.iClipSize = default.PROXSCANNER_CHARGES;
	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('ProximityScan');
//	Template.Abilities.AddItem('ProximityScanPassive');// This is disabled temporarily to test an alternative balance
	
//	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.PROXSCANNER_RADIUS);

	Template.GameArchetype = "SavScanners.Anims.WP_FieldScanner";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.TradingPostValue = Default.PROXIMITYSCANNER_TPV;

	Template.bShouldCreateDifficultyVariants = true;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_PROXSCANNER;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateFieldScanner()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'FieldScanner');
	Template.ItemCat = 'SavScanner';
	Template.WeaponCat = 'utility';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_FieldScanner2";
	Template.EquipSound = "StrategyUI_Medkit_Equip";
	Template.iRadius = default.FIELDSCANNER_RADIUS;
	Template.iRange = default.FIELDSCANNER_RANGE;
	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('FieldScan');
	Template.Abilities.AddItem('ProximityScan');
//	Template.Abilities.AddItem('ProximityScanPassive');// This is disabled temporarily to test an alternative balance

//	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.PROXSCANNER_RADIUS);

	Template.GameArchetype = "SavScanners.Anims.WP_FieldScanner";
	
	Template.Requirements.RequiredTechs.AddItem('BreakthroughAdvancedHandScanners');
	Template.BaseItem = 'ProxScanner'; // Which item this will be upgraded from
	Template.Tier = 1;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.TradingPostValue = Default.FIELDSCANNER_TPV;

	Template.bShouldCreateDifficultyVariants = true;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_FIELDSCANNER;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreatePassiveSensors()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts;
		
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PassiveSensors');
	Template.ItemCat = 'SavSensors';
	Template.WeaponCat = 'SavSensors';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_PassiveSensors";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";

	Template.Abilities.AddItem('EnhancedSenses');

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.bShouldCreateDifficultyVariants = true;

	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventTrooper');
	
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_PASSIVESENSORS;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'CorpseAdventTrooper';
	Artifacts.Quantity = default.PASSIVESENSORS_COST_CORPSETROOPER;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Template.TradingPostValue = Default.PASSIVESENSORS_TPV;

	return Template;
}

static function X2DataTemplate CreateAdvancedSensors()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts;
		
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AdvancedSensors');
	Template.ItemCat = 'SavSensors';
	Template.WeaponCat = 'SavSensors';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_AdvancedSensors";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";
		
	Template.iRadius = default.ADVSENSORS_RADIUS;

	Template.Abilities.AddItem('AdvancedEnhancedSenses');
	Template.Abilities.AddItem('EnhancedSensorBoost');
	Template.Abilities.AddItem('AHWGoggles');
	
	Template.Tier = 1;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.bShouldCreateDifficultyVariants = true;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughAdvancedSensorySystems');
	
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_ADVSENSORS;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'CorpseAdventMEC';
	Artifacts.Quantity = default.ADVSENSORS_COST_CORPSEMEC;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Artifacts.ItemTemplateName = 'CorpseAdventOfficer';
	Artifacts.Quantity = default.ADVSENSORS_COST_CORPSEOFFICER;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	Template.TradingPostValue = Default.ADVANCEDSENSORS_TPV;

	return Template;
}

static function X2DataTemplate CreateAdvancedHackTool()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AdvancedHackTool');
	Template.ItemCat = 'SavHackTool';
	Template.WeaponCat = 'utility';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_LowerBack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_AdvHacktool";
	Template.EquipSound = "StrategyUI_Medkit_Equip";
	Template.iRange = default.ADVHACKTOOL_RANGE;
	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('AdvHackTlUplink');
	Template.Abilities.AddItem('Infiltration');

//	Template.GameArchetype = "SavScanners.Anims.WP_FieldScanner";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.TradingPostValue = Default.ADVANCEDHACKTOOL_TPV;

	Template.bShouldCreateDifficultyVariants = true;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_ADVHACKTOOL;
	Template.Cost.ResourceCosts.AddItem(Resources);
	 
	return Template;
}

static function X2DataTemplate CreateNanoHackTool()
{
	local X2WeaponTemplate Template;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'NanoHackTool');
	Template.ItemCat = 'SavHackTool';
	Template.WeaponCat = 'utility';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_LowerBack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_NanoHacktool";
	Template.EquipSound = "StrategyUI_Medkit_Equip";
	Template.iRange = default.NANOHACKTOOL_RANGE;
	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('NanoHackTlUplink');
	Template.Abilities.AddItem('SAVNanoHackTlIceBreaker');
	Template.Abilities.AddItem('Infiltration');

//	Template.GameArchetype = "SavScanners.Anims.WP_FieldScanner";

	Template.Tier = 2;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.TradingPostValue = Default.NANOHACKTOOL_TPV;

	Template.bShouldCreateDifficultyVariants = true;

	return Template;
}

static function X2WeaponTemplate CreateDecoyBeacon()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'DecoyBeacon');

	Template.strImage = "img:///UILibrary_SavageItems.Inv_DecoyBeacon";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	Template.GameArchetype = "SavDecoyBeacon.WP_Grenade_DecoyBeacon";
	Template.Abilities.AddItem('DecoyBeaconThrow');
	Template.ItemCat = 'utility';
	Template.WeaponCat = 'utility';
	Template.WeaponTech = 'conventional';
	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_BeltHolster;
	Template.bMergeAmmo = true;
	Template.iClipSize = 1;
	Template.Tier = 1;

	Template.iRadius = 1;
	Template.iRange = default.DECOYBEACON_RANGE;

	Template.CanBeBuilt = true;
	Template.PointsToComplete = 0;
	Template.TradingPostValue = Default.DECOYBEACON_TPV;

	Template.bShouldCreateDifficultyVariants = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.DECOYBEACON_RANGE);
		
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventTrooper');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_DECOYBEACON;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'CorpseAdventTrooper';
	Artifacts.Quantity = default.TROOPER_COST_DECOYBEACON;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateRepairKit()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'RepairKit');
	Template.ItemCat = 'utility';
	Template.WeaponCat = 'utility';
	Template.WeaponTech = 'conventional';
	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_BeltHolster;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_RepairKit";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.iClipSize = default.REPAIRKIT_CHARGES;
	Template.iRange = default.REPAIRKIT_RANGE_TILES;
	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('RepairKitRepair');
	Template.Abilities.AddItem('RepairKitRepairOrganic');
	Template.Abilities.AddItem('ImprovisedPlating');
	Template.Abilities.AddItem('ImprovisedCover');
	Template.Abilities.AddItem('RepairKitMarker');
	Template.Abilities.AddItem('EngAmod_RepairKitBonusUses');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.MEDIPACK_CHARGES);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.MEDIPACK_RANGE_TILES);

	Template.GameArchetype = "SavItems_Art.RepairKit.WP_RepairKit";

	Template.Tier = 0;

	Template.CanBeBuilt = true;

	Template.HideIfResearched  = 'AdvancedRepairKitsUpgrade';
	
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_REPAIRKIT;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Template.TradingPostValue = Default.REPAIRKIT_TPV;

	Template.bShouldCreateDifficultyVariants = true;

	return Template;
}

static function X2DataTemplate CreateRepairKit2()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'RepairKit2');
	Template.ItemCat = 'utility';
	Template.WeaponCat = 'utility';
	Template.WeaponTech = 'conventional';
	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_BeltHolster;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_RepairKit2";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.iClipSize = default.REPAIRKIT2_CHARGES;
	Template.iRange = default.REPAIRKIT2_RANGE_TILES;
	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('RepairKitRepair2');
	Template.Abilities.AddItem('RepairKitRepairOrganic');
	Template.Abilities.AddItem('ImprovisedPlating');
	Template.Abilities.AddItem('ImprovisedCover');
	Template.Abilities.AddItem('RepairKitMarker');
	Template.Abilities.AddItem('EngAmod_RepairKit2BonusUses');


	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.MEDIPACK_CHARGES);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.MEDIPACK_RANGE_TILES);

	Template.GameArchetype = "SavItems_Art.RepairKit.WP_RepairKit2";

	Template.Tier = 1;

	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	
	Template.Requirements.RequiredTechs.AddItem('AdvancedRepairKitsUpgrade');
	Template.CreatorTemplateName = 'AdvancedRepairKitsUpgrade'; // The schematic which creates this item
	Template.BaseItem = 'RepairKit'; // Which item this will be upgraded from
	
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_REPAIRKIT2;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Template.TradingPostValue = Default.REPAIRKIT2_TPV;

	Template.bShouldCreateDifficultyVariants = true;

	return Template;
}

static function X2DataTemplate CreateRepairKitPlating()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'RepairKitPlating');
	Template.ItemCat = 'utility';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_RepairPlates";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Abilities.AddItem('ImprovisedPlatingBonus');
	Template.Abilities.AddItem('EngAmod_PlatingKitGremlinBonusUses');
	
	Template.Tier = 0;

	Template.CanBeBuilt = true;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_PLATINGKIT;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateImprovisedCoverKit()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'ImprovisedCoverKit');
	Template.ItemCat = 'utility';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_CoverPack";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Abilities.AddItem('CoverPackBonus');

	Template.Tier = 0;

	Template.CanBeBuilt = true;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_COVERKIT;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2WeaponTemplate CreateBunkerModule()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BunkerModule');

	Template.strImage = "img:///UILibrary_SavageItems.Inv_BunkerModule";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	Template.GameArchetype = "SAV_BunkerModule2.WP_Grenade_BunkerModule";
	Template.Abilities.AddItem('DeployBunkerModule');
	Template.ItemCat = 'utility';
	Template.WeaponCat = 'utility';
	Template.WeaponTech = 'conventional';
	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_BeltHolster;
	Template.bMergeAmmo = true;
	Template.iClipSize = 1;
	Template.Tier = 1;

	Template.iRadius = 1;
	Template.iRange = default.BUNKERMODULE_RANGE;

	Template.CanBeBuilt = true;
	Template.PointsToComplete = 0;
	Template.TradingPostValue = Default.BUNKERMODULE_TPV;

	Template.bShouldCreateDifficultyVariants = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.BUNKERMODULE_RANGE);
		
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventShieldbearer');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_BUNKERMODULE;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'CorpseAdventShieldbearer';
	Artifacts.Quantity = default.SHIELDBEARER_COST_BUNKERMODULE;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateADVENTShieldAmp()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'ADVENTShieldAmp');
	Template.ItemCat = 'utility';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ADVENTShieldAmp";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.TradingPostValue = Default.ADVENTSHIELDAMP_TPV;

	Template.Abilities.AddItem('ShieldAmplifierAbility');

	Template.Tier = 0;

	Template.CanBeBuilt = false;

	return Template;
}

static function X2DataTemplate CreateSAVReaperGoggles()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVReaperGoggles');
	Template.ItemCat = 'SavSensors';
	Template.WeaponCat = 'SavSensors';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ReaperGoggles";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";

	Template.Abilities.AddItem('ReaperGogglesEnhancedSenses');
	Template.Abilities.AddItem('TargetDefinition');
	Template.Abilities.AddItem('TargetDefinitionPassive');
	Template.Abilities.AddItem('AHWGoggles');

	Template.Tier = 1;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.bShouldCreateDifficultyVariants = true;


	Template.TradingPostValue = Default.REAPERGOGGLES_TPV;

	return Template;
}

static function X2DataTemplate CreateSAVReaperAMod()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SAVReaperAMod');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ReaperAMod";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 1;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('SAVReaperAmod');
	Template.Abilities.AddItem('Phantom');
		
	Template.TradingPostValue = Default.REAPER_AMOD_TPV;

	return Template;
}

static function X2DataTemplate SAVSkirmisherControlChip()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SAVSkirmisherControlChip');
	Template.ItemCat = 'utility';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_DeactivatedControlChip";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.TradingPostValue = Default.SKIRMISHERCONTROLCHIP_TPV;

	Template.Abilities.AddItem('SavSymbolofResistance');
	Template.Abilities.AddItem('SavForeverFree');
	Template.Tier = 1;

	Template.CanBeBuilt = false;

	return Template;
}

static function X2WeaponTemplate SAVTemplarAMod()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVTemplarAMod');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SAVTemplarDynamoAmod";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";

	Template.TradingPostValue = Default.TEMPLARAMOD_TPV;

	Template.Abilities.AddItem('TemplarFocus');
	Template.Abilities.AddItem('SAVDynamoFocus');//Bonus Damage to volt
	Template.Abilities.AddItem('AModBonusSlotBlocker');
	Template.Abilities.AddItem('Volt');
	Template.Abilities.AddItem('Reverberation');
	Template.Abilities.AddItem('SAVPsionicDynamo');//Generates charges for 2 child abilities
	Template.Abilities.AddItem('VoltAnimset');// Attempting to fix the Templar Volt issue
	Template.Abilities.AddItem('ShieldOverAnimset');
		
	Template.Tier = 1;

	Template.CanBeBuilt = false;

	return Template;
}

static function X2DataTemplate SAVTranslocator()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SAVTranslocator');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SAVTemplarTranslocatorAmod";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";

	Template.TradingPostValue = Default.TEMPLARTRANSLOCATOR_TPV;

	Template.Abilities.AddItem('TemplarFocus');
	Template.Abilities.AddItem('SAVTranslocatorFocus');//Bonus Stats from using abilities
	Template.Abilities.AddItem('TemplarInvert');
	Template.Abilities.AddItem('TemplarExchange');
	Template.Abilities.AddItem('AModBonusSlotBlocker');
	Template.Abilities.AddItem('SAVPsionicTranslocator');//Generates charges for 2 child abilities
	Template.Abilities.AddItem('ShieldOverAnimset');
	Template.Tier = 1;

	Template.CanBeBuilt = false;

	return Template;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}