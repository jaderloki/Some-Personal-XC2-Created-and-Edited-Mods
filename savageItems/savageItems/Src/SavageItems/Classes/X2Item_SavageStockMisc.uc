class X2Item_SavageStockMisc extends X2Item config(SavageStockItems);

	//Caches
var localized array<string> SAVBlackMarketCacheBlackMarketTexts;

	//Crates
var localized array<string> SAVAlienCrateBlackMarketTexts;
var localized array<string> SAVAdventCrateBlackMarketTexts;
var localized array<string> SAVResistanceCrateBlackMarketTexts;
var localized array<string> SAVBlackMarketCrateBlackMarketTexts;
var localized array<string> SAVBlackMarketDrugsPackBlackMarketTexts;

var config int RESISTANCEJUNK1_TRADEVAL;
var config int RESISTANCEJUNK2_TRADEVAL;
var config int ADVENTJUNK1_TRADEVAL;
var config int ADVENTJUNK2_TRADEVAL;
var config int ALIENJUNK1_TRADEVAL;
var config int ALIENJUNK2_TRADEVAL;
var config int RECDRUGS_TRADEVAL;
var config int BIOSAMPLE_TRADEVAL;
var config int MISSIONINTEL_UFO_TPV;
var config int MISSIONINTEL_SUPPLYRAID_TPV;
var config int MISSIONINTEL_GUERILLA_TPV;
var config int MISSIONINTEL_COUNCIL_TPV;
var config int MISSIONINTEL_RESOPS_TPV;
var config int AYTECH_TRADEVAL;

	//Contents
var localized array<string> SAVPCSBlackMarketTexts;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Resources;
	//Caches
	Resources.AddItem(CreateSAVAlienCache());
	Resources.AddItem(CreateSAVADVENTCache());
	Resources.AddItem(CreateSAVResistanceCache());
	Resources.AddItem(CreateSAVResistanceUtilityCache());
	Resources.AddItem(CreateSAVResistanceWeaponsCache());
	Resources.AddItem(CreateSAVResistanceDataCache());
	Resources.AddItem(CreateSAVSkirmisherCache());
	Resources.AddItem(CreateSAVTemplarCache());
	Resources.AddItem(CreateSAVReaperCache());
	Resources.AddItem(CreateSAVBlackMarketCache());
	Resources.AddItem(CreateSAVBlackMarketBONUSCache());

	//Crates
	Resources.AddItem(CreateSAVAlienCrate());
	Resources.AddItem(CreateSAVAlienCrate_AYTech());
	Resources.AddItem(CreateSAVAdventCrate());
	Resources.AddItem(CreateSAVAdventHeavyCrate());
	Resources.AddItem(CreateSAVResistanceCrate());
	Resources.AddItem(CreateSAVResistanceUtilityCrate());
	Resources.AddItem(CreateSAVResistanceExplosivesCrate());
	Resources.AddItem(CreateSAVResistanceAmmoCrate());
	Resources.AddItem(CreateSAVLegacyWeaponsCrate());
	Resources.AddItem(CreateSAVHunterWeaponsCrate());
	Resources.AddItem(CreateSAVUniqueWeaponsCrate());
	Resources.AddItem(CreateSAVSkirmisherCrate());
	Resources.AddItem(CreateSAVTemplarCrate());
	Resources.AddItem(CreateSAVReaperCrate());
	Resources.AddItem(CreateSAVBlackMarketCrate());
	Resources.AddItem(CreateSAVDrugPacks());
	Resources.AddItem(CreateSAVCommonBoxes());
	
	//Crate Content
	Resources.AddItem(CreateSAVDrugsPES());
	Resources.AddItem(CreateSAVPornPES());
	Resources.AddItem(CreateSAVPrewarPES());
	Resources.AddItem(CreateSAV_MedicalPCS());
	Resources.AddItem(CreateSAV_OverwhelmedPCS());
	Resources.AddItem(CreateSAV_StealthPCS());
	Resources.AddItem(CreateSAV_SurvivalPCS());
	Resources.AddItem(CreateSAV_CQBPCS());
	Resources.AddItem(CreateSAV_ADVENTPCS_Security());
	Resources.AddItem(CreateSAV_ADVENTPCS_Mark());
	Resources.AddItem(CreateSAV_ADVENTPCS_Reflex());

	Resources.AddItem(CreateSAV_ResistanceSupplyCrate());
	Resources.AddItem(CreateSAV_ADVENTSupplyCrate());
	Resources.AddItem(CreateSAV_ADVENTAlloyCrate());
	Resources.AddItem(CreateSAV_AlienAlloyCrate());
	Resources.AddItem(CreateSAV_AlienEleriumCrate());
	Resources.AddItem(CreateSAV_DataChit());
	Resources.AddItem(CreateSAV_TacticalDataPad());
	Resources.AddItem(CreateSAV_ADVENTWatchList());
	Resources.AddItem(CreateSAV_SateliteData());
	Resources.AddItem(CreateSAV_ResistanceNetworkData());
	Resources.AddItem(CreateSAV_ADVENTProjectData());
//	Resources.AddItem(CreateSAV_ResistanceFactionData());

	Resources.AddItem(CreateSAV_MissionIntel_UFO());
	Resources.AddItem(CreateSAV_MissionIntel_SupplyRaid());
	Resources.AddItem(CreateSAV_MissionIntel_GuerillaOps());
	Resources.AddItem(CreateSAV_MissionIntel_ResistanceOps());
	Resources.AddItem(CreateSAV_MissionIntel_CouncilOps());
	//Misc
	Resources.AddItem(CreateSAVResistanceJunk1());
	Resources.AddItem(CreateSAVResistanceJunk2());
	Resources.AddItem(CreateSAVADVENTJunk1());
	Resources.AddItem(CreateSAVADVENTJunk2());
	Resources.AddItem(CreateSAVAlienJunk1());
	Resources.AddItem(CreateSAVAlienJunk2());
	Resources.AddItem(CreateSAVTrashbags());
	Resources.AddItem(CreateSavRecDrugs());
	Resources.AddItem(CreateSavBoozePile());
	Resources.AddItem(CreateSavRustyRifle());
	//ALIEN TECH ITEMS
	Resources.AddItem(CreateSAVAlienNanotech());
	Resources.AddItem(CreateSAVAlienEnergytech());
	Resources.AddItem(CreateSAVAlienBiotech());
	Resources.AddItem(CreateSAVAlienCybertech());
	Resources.AddItem(CreateSAVAlienPsionictech());

	Resources.AddItem(CreateSavBioSample());
	
	return Resources;

}

//Caches
static function X2DataTemplate CreateSAVAlienCache()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVAlienCache');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_AlienCache";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_AlienCache";
	Template.ItemCat = 'resource';

	Template.RewardDecks.AddItem('AlienCacheRewards');
	
	Template.BlackMarketTexts = default.SAVBlackMarketCacheBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVADVENTCache()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVADVENTCache');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ADVENTCache";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ADVENTCache";
	Template.ItemCat = 'resource';

	Template.RewardDecks.AddItem('ADVENTCacheRewards');	
	
	Template.BlackMarketTexts = default.SAVBlackMarketCacheBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVResistanceCache()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVResistanceCache');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ResistanceCache";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ResistanceCache";
	Template.ItemCat = 'resource';

	Template.RewardDecks.AddItem('ResistanceCacheRewards');	
	
	Template.BlackMarketTexts = default.SAVBlackMarketCacheBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVResistanceUtilityCache()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVResistanceUtilityCache');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ResistanceUtilityCache";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ResistanceUtilityCache";
	Template.ItemCat = 'resource';

	Template.RewardDecks.AddItem('SAVItemsUtilityRewards');	
	
	Template.BlackMarketTexts = default.SAVBlackMarketCacheBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVResistanceWeaponsCache()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVResistanceWeaponsCache');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ResistanceWeaponsCache";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ResistanceWeaponsCache";
	Template.ItemCat = 'resource';

	Template.RewardDecks.AddItem('SAVWeaponsRewards');
	
	Template.BlackMarketTexts = default.SAVBlackMarketCacheBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVResistanceDataCache()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVResistanceDataCache');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ResistanceDataCache";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ResistanceDataCache";
	Template.ItemCat = 'resource';

	Template.RewardDecks.AddItem('SAVDataCacheRewards');
	
	Template.BlackMarketTexts = default.SAVBlackMarketCacheBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVSkirmisherCache()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVSkirmisherCache');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SkirmisherCache";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_SkirmisherCache";
	Template.ItemCat = 'resource';

	Template.RewardDecks.AddItem('SAVSkirmisherCacheRewards');
	
	Template.BlackMarketTexts = default.SAVBlackMarketCacheBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVTemplarCache()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVTemplarCache');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_TemplarCache";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_TemplarCache";
	Template.ItemCat = 'resource';

	Template.RewardDecks.AddItem('SAVTemplarCacheRewards');
	
	Template.BlackMarketTexts = default.SAVBlackMarketCacheBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVReaperCache()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVReaperCache');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ReaperCache";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ReaperCache";
	Template.ItemCat = 'resource';
	
	Template.RewardDecks.AddItem('SAVReaperCacheRewards');

	Template.BlackMarketTexts = default.SAVBlackMarketCacheBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVBlackMarketCache()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVBlackMarketCache');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SavBlackMarketCache";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_BlackMarketCache";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVBlackMarketCacheBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVBlackMarketBONUSCache()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVBlackMarketBONUSCache');

	Template.strImage = "img:///UILibrary_SavageItems.Inv_BlackMarketBONUSCache";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_BlackMarketBONUSCache";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVBlackMarketCacheBlackMarketTexts;

	return Template;
}



//Crates
static function X2DataTemplate CreateSAVAlienCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVAlienCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_AlienCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_AlienCrate";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVAlienCrateBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVAlienCrate_AYTech()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVAlienCrate_AYTech');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_AlienCrate_AYTech";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_AlienCrate_AYTech";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVAlienCrateBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVAdventCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVAdventCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ADVENTCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ADVENTCrate";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVAdventCrateBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVAdventHeavyCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVAdventHeavyCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ADVENTHiSecCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ADVENTHiSecCrate";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVAdventCrateBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVResistanceCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVResistanceCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ResistanceCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ResistanceMarketCrate";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVResistanceCrateBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVResistanceUtilityCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVResistanceUtilityCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ResistanceUtilityCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ResistanceUtilityCrate";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVResistanceCrateBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVResistanceExplosivesCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVResistanceExplosivesCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ResistanceExplosivesCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ResistanceExplosivesCrate";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVResistanceCrateBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVResistanceAmmoCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVResistanceAmmoCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ResistanceAmmoCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ResistanceAmmoCrate";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVResistanceCrateBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVLegacyWeaponsCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVLegacyWeaponsCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ResistanceWeaponsCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ResistanceWeaponsCrate";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVResistanceCrateBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVHunterWeaponsCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVHunterWeaponsCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ResistanceHunterWeaponsCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ResistanceHunterWeaponsCrate";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVResistanceCrateBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVUniqueWeaponsCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVUniqueWeaponsCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ResistanceUniqueWeaponsCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ResistanceUniqueWeaponsCrate";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVResistanceCrateBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVSkirmisherCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVSkirmisherCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SkirmisherCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_SkirmisherCrate";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVResistanceCrateBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVTemplarCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVTemplarCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_TemplarCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_TemplarCrate";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVResistanceCrateBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVReaperCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVReaperCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ReaperCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ReaperCrate";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVResistanceCrateBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVBlackMarketCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVBlackMarketCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_BlackMarketCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_BlackMarketCrate";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVBlackMarketCrateBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVDrugPacks()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVDrugPacks');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_DrugPacks";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_DrugPacks";
	Template.ItemCat = 'resource';
	
	Template.BlackMarketTexts = default.SAVBlackMarketDrugsPackBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAVCommonBoxes()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVCommonBoxes');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_WoodenCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_WoodenCrate";
	Template.ItemCat = 'resource';
	
	return Template;
}

//Content
//Good PCSs
//chance to refund ap on uses of medical items
static function X2DataTemplate CreateSAV_MedicalPCS()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SAV_MedicalPCS');

	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.AdventPCS';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_PCS_Medical";
    Template.strInventoryImage = "img:///UILibrary_SavageItems.0_4_Perks.PCS_Medical";
	Template.ItemCat = 'combatsim';
	Template.TradingPostValue = 25;
	Template.bAlwaysUnique = false;
	Template.Tier = 4;

	Template.Abilities.AddItem('SAV_MedicalPCSAbility');
	Template.Abilities.AddItem('SAVTraumaticExperience');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, -5);
    Template.InventorySlot = eInvSlot_CombatSim;
	Template.BlackMarketTexts = default.SAVPCSBlackMarketTexts;

	return Template;
}

//Chance to have non turn ending standard shots, reloads and bonus defence if can see more than 2 enemies
static function X2DataTemplate CreateSAV_OverwhelmedPCS()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SAV_OverwhelmedPCS');

	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.AdventPCS';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_PCS_Overwhelmed";
    Template.strInventoryImage = "img:///UILibrary_SavageItems.0_4_Perks.PCS_Overwhelmed";
	Template.ItemCat = 'combatsim';
	Template.TradingPostValue = 20;
	Template.bAlwaysUnique = false;
	Template.Tier = 4;

	Template.Abilities.AddItem('SAV_OverwhelmedPCSAbility');
	Template.Abilities.AddItem('SAV_OverwhelmedPassivePCSAbility');
	Template.Abilities.AddItem('SAVTraumaticExperience');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, -5);
    Template.InventorySlot = eInvSlot_CombatSim;		
	Template.BlackMarketTexts = default.SAVPCSBlackMarketTexts;

	return Template;
}

//reduced spotting range, concealed crit chance
static function X2DataTemplate CreateSAV_StealthPCS()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SAV_StealthPCS');

	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.AdventPCS';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_PCS_Partisan";
    Template.strInventoryImage = "img:///UILibrary_SavageItems.0_4_Perks.PCS_Partisan";
	Template.ItemCat = 'combatsim';
	Template.TradingPostValue = 20;
	Template.bAlwaysUnique = false;
	Template.Tier = 4;

	Template.Abilities.AddItem('SAV_StealthPCSAbility');
	Template.Abilities.AddItem('SAVTraumaticExperience');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, -5);
    Template.InventorySlot = eInvSlot_CombatSim;
	Template.BlackMarketTexts = default.SAVPCSBlackMarketTexts;

	return Template;
}

//Def, dodge bonus while in cover, limited slow regen
static function X2DataTemplate CreateSAV_SurvivalPCS()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SAV_SurvivalPCS');

	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.AdventPCS';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_PCS_Survivor";
    Template.strInventoryImage = "img:///UILibrary_SavageItems.0_4_Perks.PCS_Survivor";
	Template.ItemCat = 'combatsim';
	Template.TradingPostValue = 20;
	Template.bAlwaysUnique = false;
	Template.Tier = 4;

	Template.Abilities.AddItem('SAV_SurvivalPCSAbility');
	Template.Abilities.AddItem('SAVTraumaticExperience');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, -5);
    Template.InventorySlot = eInvSlot_CombatSim;
	Template.BlackMarketTexts = default.SAVPCSBlackMarketTexts;

	return Template;
}

//close range aim, crit and dodge piercing in dense urban environments
static function X2DataTemplate CreateSAV_CQBPCS()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SAV_CQBPCS');

	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.AdventPCS';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_PCS_UrbanWarfare";
    Template.strInventoryImage = "img:///UILibrary_SavageItems.0_4_Perks.PCS_UrbanWar";
	Template.ItemCat = 'combatsim';
	Template.TradingPostValue = 20;
	Template.bAlwaysUnique = false;
	Template.Tier = 4;

	Template.Abilities.AddItem('SAV_CQBPCSAbility');
	Template.Abilities.AddItem('SAVTraumaticExperience');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, -5);
    Template.InventorySlot = eInvSlot_CombatSim;
	Template.BlackMarketTexts = default.SAVPCSBlackMarketTexts;

	return Template;
}

//Negative PCSs
static function X2DataTemplate CreateSAVDrugsPES()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SAVDrugsPES');

	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.AdventPCS';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_PCS_Drugs";
    Template.strInventoryImage = "img:///UILibrary_SavageItems.0_4_Perks.PCS_Drugs";
	Template.ItemCat = 'combatsim';
	Template.TradingPostValue = 5;
	Template.bAlwaysUnique = false;
	Template.Tier = 4;

	Template.Abilities.AddItem('SAVAddledMind');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, -5);
    Template.InventorySlot = eInvSlot_CombatSim;
	Template.BlackMarketTexts = default.SAVPCSBlackMarketTexts;

	return Template;
}

//Porn
static function X2DataTemplate CreateSAVPornPES()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SAVPornPES');

	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.AdventPCS';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_PCS_Porn";
    Template.strInventoryImage = "img:///UILibrary_SavageItems.0_4_Perks.PCS_Sex";
	Template.ItemCat = 'combatsim';
	Template.TradingPostValue = 5;
	Template.bAlwaysUnique = false;
    Template.Tier = 4;

	Template.Abilities.AddItem('SAVAddledMind');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, -5);
    Template.InventorySlot = eInvSlot_CombatSim;
	Template.BlackMarketTexts = default.SAVPCSBlackMarketTexts;

	return Template;
}

//PrewarSim
static function X2DataTemplate CreateSAVPrewarPES()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SAVPrewarPES');

	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.AdventPCS';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_PCS_Prewar";
    Template.strInventoryImage = "img:///UILibrary_SavageItems.0_4_Perks.PCS_Prewar";
	Template.ItemCat = 'combatsim';
	Template.TradingPostValue = 5;
	Template.bAlwaysUnique = false;
    Template.Tier = 4;

	Template.Abilities.AddItem('SAVAddledMind');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, -5);
    Template.InventorySlot = eInvSlot_CombatSim;
	Template.BlackMarketTexts = default.SAVPCSBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAV_ADVENTPCS_Security()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SAV_ADVENTPCS_Security');

	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.AdventPCS';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ACS_Hacking";
    Template.strInventoryImage = "img:///UILibrary_SavageItems.PCS_ICON_ACS_Hacking";
	Template.ItemCat = 'combatsim';
	Template.TradingPostValue = 5;
	Template.bAlwaysUnique = false;
    Template.Tier = 4;

	Template.Abilities.AddItem('ADVPCSSuspectLoyalty');
	Template.Abilities.AddItem('SAVPCSAdventSecurityPass');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

    Template.InventorySlot = eInvSlot_CombatSim;
	Template.BlackMarketTexts = default.SAVPCSBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAV_ADVENTPCS_Mark()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SAV_ADVENTPCS_Mark');

	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.AdventPCS';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ACS_MarkTarget";
    Template.strInventoryImage = "img:///UILibrary_SavageItems.PCS_ICON_ACS_MarkTarget";
	Template.ItemCat = 'combatsim';
	Template.TradingPostValue = 5;
	Template.bAlwaysUnique = false;
    Template.Tier = 4;

	Template.Abilities.AddItem('ADVPCSSuspectLoyalty');
	Template.Abilities.AddItem('MarkTarget');
//	Template.Abilities.AddItem('SAVPCSMarkTarget');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

    Template.InventorySlot = eInvSlot_CombatSim;
	Template.BlackMarketTexts = default.SAVPCSBlackMarketTexts;

	return Template;
}

static function X2DataTemplate CreateSAV_ADVENTPCS_Reflex()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'SAV_ADVENTPCS_Reflex');

	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.AdventPCS';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ACS_Reflex";
    Template.strInventoryImage = "img:///UILibrary_SavageItems.PCS_ICON_ACS_Reflexes";
	Template.ItemCat = 'combatsim';
	Template.TradingPostValue = 5;
	Template.bAlwaysUnique = false;
    Template.Tier = 4;

	Template.Abilities.AddItem('ADVPCSSuspectLoyalty');
	Template.Abilities.AddItem('SAVPCSEnhancedReflexes');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

    Template.InventorySlot = eInvSlot_CombatSim;
	Template.BlackMarketTexts = default.SAVPCSBlackMarketTexts;

	return Template;
}

//Resources
static function X2DataTemplate CreateSAV_ResistanceSupplyCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_ResistanceSupplyCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ResistanceSupplyCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ResistanceSupplyCrate";
	Template.ItemCat = 'resource';
	
	return Template;
}

static function X2DataTemplate CreateSAV_ADVENTSupplyCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_ADVENTSupplyCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ADVENTSupplyCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ADVENTSupplyCrate";
	Template.ItemCat = 'resource';
	
	return Template;
}

static function X2DataTemplate CreateSAV_ADVENTAlloyCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_ADVENTAlloyCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ADVENTAlloyCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ADVENTAlloyCrate";
	Template.ItemCat = 'resource';
	
	return Template;
}

static function X2DataTemplate CreateSAV_AlienAlloyCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_AlienAlloyCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_AlienAlloyCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_AlienAlloyCrate";
	Template.ItemCat = 'resource';
	
	return Template;
}

static function X2DataTemplate CreateSAV_AlienEleriumCrate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_AlienEleriumCrate');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_AlienEleriumCrate";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_AlienEleriumCrate";
	Template.ItemCat = 'resource';
	
	return Template;
}

static function X2DataTemplate CreateSAV_DataChit()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_DataChit');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_DataChit";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_DataChit";
	Template.ItemCat = 'resource';
	
	return Template;
}

static function X2DataTemplate CreateSAV_TacticalDataPad()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_TacticalDataPad');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_TacticalDataPad";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_TacticalDataPad";
	Template.ItemCat = 'resource';
	
	return Template;
}

static function X2DataTemplate CreateSAV_ADVENTWatchList()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_ADVENTWatchList');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_WatchListsData";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_WatchListsData";
	Template.ItemCat = 'resource';
	
	return Template;
}

static function X2DataTemplate CreateSAV_SateliteData()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_SateliteData');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SateliteData";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_SateliteData";
	Template.ItemCat = 'resource';
	
	return Template;
}

static function X2DataTemplate CreateSAV_ResistanceNetworkData()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_ResistanceNetworkData');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ResistanceNetworkData";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ResistanceNetworkData";
	Template.ItemCat = 'resource';
	
	return Template;
}

static function X2DataTemplate CreateSAV_ADVENTProjectData()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_ADVENTProjectData');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_DarkEventData";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_DarkEventData";
	Template.ItemCat = 'resource';
	
	return Template;
}
/*
static function X2DataTemplate CreateSAV_ResistanceFactionData()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_ResistanceFactionData');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_TacticalDataPad";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_TacticalDataPad";
	Template.ItemCat = 'resource';
	
	return Template;
}*/

static function X2DataTemplate CreateSAV_MissionIntel_UFO()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_MissionIntel_UFO');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_MissionDatapad_Alien";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_MissionDatapad_Alien";
	Template.ItemCat = 'resource';
	
	Template.TradingPostValue = default.MISSIONINTEL_UFO_TPV;

	return Template;
}

static function X2DataTemplate CreateSAV_MissionIntel_SupplyRaid()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_MissionIntel_SupplyRaid');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_MissionDatapad_ADVENT";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_MissionDatapad_ADVENT";
	Template.ItemCat = 'resource';

	Template.TradingPostValue = default.MISSIONINTEL_SUPPLYRAID_TPV;
	

	return Template;
}

static function X2DataTemplate CreateSAV_MissionIntel_GuerillaOps()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_MissionIntel_GuerillaOps');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_MissionDatapad_Resistance";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_MissionDatapad_Resistance";
	Template.ItemCat = 'resource';
	
	Template.TradingPostValue = default.MISSIONINTEL_GUERILLA_TPV;

	return Template;
}

static function X2DataTemplate CreateSAV_MissionIntel_CouncilOps()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_MissionIntel_CouncilOps');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_MissionDatapad_Resistance";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_MissionDatapad_Resistance";
	Template.ItemCat = 'resource';
	
	Template.TradingPostValue = default.MISSIONINTEL_COUNCIL_TPV;

	return Template;
}

static function X2DataTemplate CreateSAV_MissionIntel_ResistanceOps()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAV_MissionIntel_ResistanceOps');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_MissionDatapad_Resistance";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_MissionDatapad_Resistance";
	Template.ItemCat = 'resource';
	
	Template.TradingPostValue = default.MISSIONINTEL_RESOPS_TPV;

	return Template;
}

//Misc
static function X2DataTemplate CreateSAVResistanceJunk1()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVResistanceJunk1');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ResistanceJunk1";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Inv_ResistanceJunk1";
	Template.ItemCat = 'resource';

	Template.TradingPostValue = default.RESISTANCEJUNK1_TRADEVAL;
	
	return Template;
}

static function X2DataTemplate CreateSAVResistanceJunk2()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVResistanceJunk2');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ResistanceJunk2";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Inv_ResistanceJunk2";
	Template.ItemCat = 'resource';

	Template.TradingPostValue = default.RESISTANCEJUNK2_TRADEVAL;
	
	return Template;
}

static function X2DataTemplate CreateSAVADVENTJunk1()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVADVENTJunk1');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ADVENTJunk1";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ADVENTJunk1";
	Template.ItemCat = 'resource';

	Template.TradingPostValue = default.ADVENTJUNK1_TRADEVAL;
	
	return Template;
}

static function X2DataTemplate CreateSAVADVENTJunk2()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVADVENTJunk2');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ADVENTJunk2";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_ADVENTJunk2";
	Template.ItemCat = 'resource';

	Template.TradingPostValue = default.ADVENTJUNK2_TRADEVAL;
	
	return Template;
}

static function X2DataTemplate CreateSAVAlienJunk1()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVAlienJunk1');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_AlienJunk1";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_AlienJunk1";
	Template.ItemCat = 'resource';

	Template.TradingPostValue = default.ALIENJUNK1_TRADEVAL;
	
	return Template;
}

static function X2DataTemplate CreateSAVAlienJunk2()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVAlienJunk2');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_AlienJunk2";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_AlienJunk2";
	Template.ItemCat = 'resource';

	Template.TradingPostValue = default.ALIENJUNK2_TRADEVAL;
	
	return Template;
}

static function X2DataTemplate CreateSAVTrashbags()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVTrashbags');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Trashbags";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_Trashbags";
	Template.ItemCat = 'resource';
	
	return Template;
}

static function X2DataTemplate CreateSavRecDrugs()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SavRecDrugs');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_DrugPile";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_DrugPile";
	Template.ItemCat = 'resource';
	Template.TradingPostValue = default.RECDRUGS_TRADEVAL;	

	return Template;
}

static function X2DataTemplate CreateSavBoozePile()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SavBoozePile');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_BoozePile";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_BoozePile";
	Template.ItemCat = 'resource';
	
	return Template;
}

static function X2DataTemplate CreateSavRustyRifle()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SavRustyRifle');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_RustyRifle";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_RustyRifle";
	Template.ItemCat = 'resource';
	
	return Template;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//ALIEN TECH ITEMS

static function X2DataTemplate CreateSAVAlienNanotech()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVAlienNanotech');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Aytech_Nanotech";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_Aytech_Nanotech";
	Template.ItemCat = 'resource';

	Template.RewardDecks.AddItem('AlienTechItemRewards');
	
	Template.TradingPostValue = default.AYTECH_TRADEVAL;

	return Template;
}

static function X2DataTemplate CreateSAVAlienEnergytech()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVAlienEnergytech');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Aytech_Power";
	Template.strInventoryImage = "UILibrary_SavageItems.Invx_Aytech_Power";
	Template.ItemCat = 'resource';
	
	Template.RewardDecks.AddItem('AlienTechItemRewards');

	Template.TradingPostValue = default.AYTECH_TRADEVAL;

	return Template;
}

static function X2DataTemplate CreateSAVAlienBiotech()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVAlienBiotech');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Aytech_Biotech";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_Aytech_Biotech";
	Template.ItemCat = 'resource';
	
	Template.RewardDecks.AddItem('AlienTechItemRewards');

	Template.TradingPostValue = default.AYTECH_TRADEVAL;

	return Template;
}

static function X2DataTemplate CreateSAVAlienCybertech()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVAlienCybertech');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Aytech_Cybernetics";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_Aytech_Cybernetics";
	Template.ItemCat = 'resource';
	
	Template.RewardDecks.AddItem('AlienTechItemRewards');

	Template.TradingPostValue = default.AYTECH_TRADEVAL;

	return Template;
}

static function X2DataTemplate CreateSAVAlienPsionictech()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SAVAlienPsionictech');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Aytech_Psionic";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_Aytech_Psionic";
	Template.ItemCat = 'resource';
	
	Template.RewardDecks.AddItem('AlienTechItemRewards');

	Template.TradingPostValue = default.AYTECH_TRADEVAL;

	return Template;
}

static function X2DataTemplate CreateSavBioSample()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'SavBioSample');
	
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Biosample";
	Template.strInventoryImage = "img:///UILibrary_SavageItems.Invx_Biosample";
	Template.ItemCat = 'resource';
	
	Template.TradingPostValue = default.BIOSAMPLE_TRADEVAL;

	return Template;
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}