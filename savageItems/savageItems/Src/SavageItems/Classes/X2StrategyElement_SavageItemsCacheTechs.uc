class X2StrategyElement_SavageItemsCacheTechs extends X2StrategyElement_XpackTechs config(SAVItemsCacheTechs);

//Caches
//var config array<name> SAVBlackMarketCacheUnlock_REWARD_CRATES;

//ResourceCrates
var config array<int>  MaxDataChitIntel;
var config array<int>  MinDataChitIntel;
var config array<int>  MinSAVResistanceSupply;
var config array<int>  MaxSAVResistanceSupply;
var config array<int>  MinSAVAdventSupply;
var config array<int>  MaxSAVAdventSupply;
var config array<int>  MinSAVADVENTAlloy;
var config array<int>  MaxSAVADVENTAlloy;
var config array<int>  MinSAVAlienAlloy;
var config array<int>  MaxSAVAlienAlloy;
var config array<int>  MinSAVEleriumDust;
var config array<int>  MaxSAVEleriumDust;
var config array<int>  MinSAVAbilityPoints;
var config array<int>  MaxSAVAbilityPoints;

var config float SAVWATCH_LIST_CONTACT_COST_MOD;
var config float SAVSATELLITE_DATA_SCAN_RATE_MOD;
var config int SAVSATELLITE_DATA_SCAN_RATE_DURATION_HOURS;
var config int SAVRESISTANCE_BROADCAST_INCOME_BONUS;
var config int SAVPRIORITY_DATA_DARK_EVENT_EXTENSION_HOURS;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;
//Caches
Techs.AddItem(CreateSAVAlienCacheUnlock());
Techs.AddItem(CreateSAVADVENTCacheUnlock());
Techs.AddItem(CreateSAVResistanceCacheUnlock());
Techs.AddItem(CreateSAVResistanceUtilityCacheUnlock());
Techs.AddItem(CreateSAVResistanceWeaponsCacheUnlock());
Techs.AddItem(CreateSAVSkirmisherCacheUnlock());
Techs.AddItem(CreateSAVTemplarCacheUnlock());
Techs.AddItem(CreateSAVReaperCacheUnlock());
Techs.AddItem(CreateSAVResistanceDataCacheUnlock());
Techs.AddItem(CreateSAVBlackMarketCacheUnlock());
Techs.AddItem(CreateSAVBlackMarketBONUSCacheUnlock());
//ItemCrates
Techs.AddItem(CreateSAVAlienCrateUnlock());
Techs.AddItem(CreateSAVAlienCrate_AYTechUnlock());
Techs.AddItem(CreateSAVAdventCrateUnlock());
Techs.AddItem(CreateSAVAdventHeavyCrateUnlock());
Techs.AddItem(CreateSAVResistanceCrateUnlock());
Techs.AddItem(CreateSAVResistanceUtilityCrateUnlock());
Techs.AddItem(CreateSAVResistanceExplosivesCrateUnlock());
Techs.AddItem(CreateSAVResistanceAmmoCrateUnlock());
Techs.AddItem(CreateSAVLegacyWeaponsCrateUnlock());
Techs.AddItem(CreateSAVHunterWeaponsCrateUnlock());
Techs.AddItem(CreateSAVUniqueWeaponsCrateUnlock());
Techs.AddItem(CreateSAVSkirmisherCrateUnlock());
Techs.AddItem(CreateSAVTemplarCrateUnlock());
Techs.AddItem(CreateSAVReaperCrateUnlock());
Techs.AddItem(CreateSAVBlackMarketCrateUnlock());
Techs.AddItem(CreateSAVDrugPacksUnlock());
Techs.AddItem(CreateSAVCommonBoxesUnlock());
//ResourceCrates
Techs.AddItem(CreateSAVUnlock_ResistanceSupplyCrate());
Techs.AddItem(CreateSAVUnlock_ADVENTSupplyCrate());
Techs.AddItem(CreateSAVUnlock_ADVENTAlloyCrate());
Techs.AddItem(CreateSAVUnlock_AlienAlloyCrate());
Techs.AddItem(CreateSAVUnlock_AlienEleriumCrate());
Techs.AddItem(CreateSAVUnlock_DataChit());
Techs.AddItem(CreateSAVUnlock_WatchList());
Techs.AddItem(CreateSAVUnlock_SateliteData());
Techs.AddItem(CreateSAVUnlock_ResistanceNetworkData());
Techs.AddItem(CreateSAVUnlock_PriorityData());
Techs.AddItem(CreateSAVUnlock_TacticalData());
//Techs.AddItem(CreateSAVUnlock_DoomReduction());
//Techs.AddItem(CreateSAVUnlock_ResistanceFactionData());
//UniqueWeaponUpgrades
Techs.AddItem(CreateSAVEnhance_LilRipper());
Techs.AddItem(CreateSAVPerfect_LilRipper());
Techs.AddItem(CreateSAVPerfect_PrototypeLaserRifle());
Techs.AddItem(CreateSAVEnhance_HarpoonGun());
Techs.AddItem(CreateSAVPerfect_HarpoonGun());
Techs.AddItem(CreateSAVPerfect_Viperfang());
Techs.AddItem(CreateSAVEnhance_JaggedAxe());
Techs.AddItem(CreateSAVPerfect_JaggedAxe());
Techs.AddItem(CreateSAVEnhance_EndlessVengeance());
Techs.AddItem(CreateSAVPerfect_EndlessVengeance());
Techs.AddItem(CreateSAVEnhance_Quicksilver());
Techs.AddItem(CreateSAVPerfect_Quicksilver());
Techs.AddItem(CreateSAVEnhance_OpressorsEnd());
Techs.AddItem(CreateSAVPerfect_OpressorsEnd());
Techs.AddItem(CreateSAVPerfect_PrototypeLaserSniper());
Techs.AddItem(CreateSAVPerfect_AbsoluteZero());

	return Techs;

}

/*
======================================================================
=========================CACHES AND CRATES============================
======================================================================
//////////////////////////////
//Cache Contents

////ResourceCrates
SAV_ResistanceSupplyCrate
SAV_ADVENTSupplyCrate
SAV_ADVENTAlloyCrate
SAV_AlienAlloyCrate
SAV_AlienEleriumCrate

////ItemCrates
SAVAlienCrate
SAVAdventCrate
SAVResistanceCrate
SAVBlackMarketCrate
SAVDrugPacks
SAVCommonBoxes

//////////////////////////////
//Crate Contents

//UTILITY
SavComDrug_Turbo
SavComDrug_Raptor
SavComDrug_Klarity
SavComDrug_RedHaze
SavComDrug_Liston
SavComDrug_Psiko
BattleScanner
Medikit
SavStimGun
SavStimulator
ProxScanner
AdvancedHackTool
DecoyBeacon
RepairKit
SavCOREBar
SustainingSphere
RefractionField
UltrasonicLure
PassiveSensors
RepairKitPlating

//WEAPON ATTACHMENTS
DONT USE WEAPON ATTACHMENTS-IT CAUSES BUGS

//VEST and AMOD
NanoScaleVest
PlatedVest
HazmatVest
AlloyweveVest
LightweightOverlay
GBandolierOverlay
AssaultOverlay
MedicalOverlay
HazmatAmod
EngeneeringAmod
PartisanAmod

//AMMO
APRounds
IncendiaryRounds
VenomRounds
HighCalRounds
ExplosiveRounds
SAVButcherRounds
SAVBreachBusters
SAVSkullSplitters
SAVMilspecRounds
SAVAlienPowerPack

//WEAPONS
HiddenBladesCV
Flamethrower
PlasmaBlaster
BlasterLauncher
//GRENADES
HECharge
PlasmaCharge
FlashbangGrenade
SmokeGrenade
ProximityMine

//PCS
CommonPCSSpeed
CommonPCSConditioning
CommonPCSFocus
CommonPCSPerception
CommonPCSAgility
SAVDrugsPES
SAVPornPES
SAVPrewarPES
SAV_MedicalPCS
SAV_OverwhelmedPCS
SAV_StealthPCS
SAV_SurvivalPCS
SAV_CQBPCS

//RESOURCES
AlienDatapad	
AdventDatapad
SAV_DataChit	
EleriumCore

//MISSIONS
FacilityLeadItem
	Template.ItemRewards.AddItem('SAV_MissionIntel_UFO');
	Template.ItemRewards.AddItem('SAV_MissionIntel_SupplyRaid');
	Template.ItemRewards.AddItem('SAV_MissionIntel_GuerillaOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_CouncilOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_ResistanceOps');

//JUNK
SavRecDrugs
SavBoozePile
SAVTrashbags
SAVResistanceJunk1
SAVResistanceJunk2
SAVADVENTJunk1
SAVADVENTJunk2
SAVAlienJunk1
SAVAlienJunk2
*/
///////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////CACHES////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////

static function X2DataTemplate CreateSAVAlienCacheUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resource;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVAlienCacheUnlock');
	Template.PointsToComplete = StafferXHours(1, 32);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UnlockCache_Alein";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVAlienCache');

	Template.ResearchCompletedFn = SAVItemsGiveRandomItemRewardx3;

	Template.ItemRewards.AddItem('SAVAlienCrate');
	Template.ItemRewards.AddItem('SAVAlienCrate');
	Template.ItemRewards.AddItem('SAVAlienCrate');
	Template.ItemRewards.AddItem('SAVAlienCrate');
	Template.ItemRewards.AddItem('SAVAlienCrate');
	Template.ItemRewards.AddItem('SAVAlienCrate');
	Template.ItemRewards.AddItem('SAVAlienCrate');
	Template.ItemRewards.AddItem('SAVAlienCrate');
	Template.ItemRewards.AddItem('SAVAlienCrate_AYTech');
	Template.ItemRewards.AddItem('SAV_AlienAlloyCrate');
	Template.ItemRewards.AddItem('SAV_AlienAlloyCrate');
	Template.ItemRewards.AddItem('SAV_AlienEleriumCrate');

	// Cost
	Artifacts.ItemTemplateName = 'SAVAlienCache';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Resource.ItemTemplateName = 'Intel';
	Resource.Quantity = 16;
	Template.Cost.ResourceCosts.AddItem(Resource);
	return Template;
}

static function X2DataTemplate CreateSAVADVENTCacheUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resource;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVADVENTCacheUnlock');
	Template.PointsToComplete = StafferXHours(1, 20);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UnlockCache_Advent";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVADVENTCache');

	Template.ResearchCompletedFn = SAVItemsGiveRandomItemRewardx3;

	Template.ItemRewards.AddItem('SAVAlienCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventHeavyCrate');
	Template.ItemRewards.AddItem('SAVAdventHeavyCrate');
	Template.ItemRewards.AddItem('SAV_ADVENTAlloyCrate');
	Template.ItemRewards.AddItem('SAV_ADVENTSupplyCrate');
	Template.ItemRewards.AddItem('SAV_ADVENTSupplyCrate');

	// Cost
	Artifacts.ItemTemplateName = 'SAVADVENTCache';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Resource.ItemTemplateName = 'Intel';
	Resource.Quantity = 8;
	Template.Cost.ResourceCosts.AddItem(Resource);

	return Template;
}

static function X2DataTemplate CreateSAVResistanceCacheUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVResistanceCacheUnlock');
	Template.PointsToComplete = StafferXHours(1, 6);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UnlockCache_Resistance";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVResistanceCache');

	Template.ResearchCompletedFn = SAVItemsGiveRandomItemRewardx3;

	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVLegacyWeaponsCrate');
	Template.ItemRewards.AddItem('SAVResistanceAmmoCrate');
	Template.ItemRewards.AddItem('SAVResistanceAmmoCrate');
	Template.ItemRewards.AddItem('SAVResistanceExplosivesCrate');
	Template.ItemRewards.AddItem('SAVResistanceExplosivesCrate');
	Template.ItemRewards.AddItem('SAVResistanceUtilityCrate');
	Template.ItemRewards.AddItem('SAVLegacyWeaponsCrate');
	Template.ItemRewards.AddItem('SAVLegacyWeaponsCrate');
	Template.ItemRewards.AddItem('SAVHunterWeaponsCrate');
	Template.ItemRewards.AddItem('SAVUniqueWeaponsCrate');
	Template.ItemRewards.AddItem('SAV_ResistanceSupplyCrate');
	Template.ItemRewards.AddItem('SAV_ResistanceSupplyCrate');
	Template.ItemRewards.AddItem('SAV_ResistanceSupplyCrate');
	Template.ItemRewards.AddItem('SAV_ResistanceSupplyCrate');
	Template.ItemRewards.AddItem('SAV_ResistanceSupplyCrate');
	Template.ItemRewards.AddItem('SAV_ResistanceSupplyCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVCommonBoxes');

	// Cost
	Artifacts.ItemTemplateName = 'SAVResistanceCache';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSAVResistanceUtilityCacheUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	
	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVResistanceUtilityCacheUnlock');
	Template.PointsToComplete = StafferXHours(1, 6);
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PG_UnlockCache_ResistanceUtility";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVResistanceUtilityCache');

	Template.ResearchCompletedFn = SAVItemsGiveRandomItemRewardx3;

	Template.ItemRewards.AddItem('SAVResistanceUtilityCrate');
	Template.ItemRewards.AddItem('SAVResistanceUtilityCrate');
	Template.ItemRewards.AddItem('SAVResistanceUtilityCrate');
	Template.ItemRewards.AddItem('SAVResistanceUtilityCrate');
	Template.ItemRewards.AddItem('SAVResistanceUtilityCrate');
	Template.ItemRewards.AddItem('SAVResistanceUtilityCrate');
	Template.ItemRewards.AddItem('SAVResistanceUtilityCrate');
	Template.ItemRewards.AddItem('SAVResistanceUtilityCrate');
	Template.ItemRewards.AddItem('SAVResistanceUtilityCrate');
	Template.ItemRewards.AddItem('SAVCommonBoxes');

	// Cost
	Artifacts.ItemTemplateName = 'SAVResistanceUtilityCache';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSAVResistanceWeaponsCacheUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	
	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVResistanceWeaponsCacheUnlock');
	Template.PointsToComplete = StafferXHours(1, 8);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UnlockCache_ResistanceWeapons";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVResistanceWeaponsCache');

	Template.ResearchCompletedFn = SAVItemsGiveRandomItemRewardx3;

	Template.ItemRewards.AddItem('SAVLegacyWeaponsCrate');
	Template.ItemRewards.AddItem('SAVLegacyWeaponsCrate');
	Template.ItemRewards.AddItem('SAVLegacyWeaponsCrate');
	Template.ItemRewards.AddItem('SAVLegacyWeaponsCrate');
	Template.ItemRewards.AddItem('SAVLegacyWeaponsCrate');
	Template.ItemRewards.AddItem('SAVLegacyWeaponsCrate');
	Template.ItemRewards.AddItem('SAVLegacyWeaponsCrate');//=== 7/13
	Template.ItemRewards.AddItem('SAVHunterWeaponsCrate');
	Template.ItemRewards.AddItem('SAVHunterWeaponsCrate');//===2/13
	Template.ItemRewards.AddItem('SAVUniqueWeaponsCrate');//===1/13
	Template.ItemRewards.AddItem('SAVResistanceExplosivesCrate');//===1/13
	Template.ItemRewards.AddItem('SAVResistanceAmmoCrate');//===1/13
	Template.ItemRewards.AddItem('SAVCommonBoxes');//===1/13

	// Cost
	Artifacts.ItemTemplateName = 'SAVResistanceWeaponsCache';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSAVSkirmisherCacheUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	
	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVSkirmisherCacheUnlock');
	Template.PointsToComplete = StafferXHours(1, 6);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UnlockCache_Skirmisher";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVSkirmisherCache');

	Template.ResearchCompletedFn = SAVItemsGiveRandomItemRewardx3;

	Template.ItemRewards.AddItem('SAVSkirmisherCrate');
	Template.ItemRewards.AddItem('SAVSkirmisherCrate');
	Template.ItemRewards.AddItem('SAVSkirmisherCrate');
	Template.ItemRewards.AddItem('SAVSkirmisherCrate');
	Template.ItemRewards.AddItem('SAVSkirmisherCrate');
	Template.ItemRewards.AddItem('SAVSkirmisherCrate');
	Template.ItemRewards.AddItem('SAVSkirmisherCrate');
	Template.ItemRewards.AddItem('SAVSkirmisherCrate');
	Template.ItemRewards.AddItem('SAVSkirmisherCrate');
	Template.ItemRewards.AddItem('SAVSkirmisherCrate');
	Template.ItemRewards.AddItem('SAVUniqueWeaponsCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVCommonBoxes');
	Template.ItemRewards.AddItem('SAVCommonBoxes');

	// Cost
	Artifacts.ItemTemplateName = 'SAVSkirmisherCache';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSAVTemplarCacheUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	
	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVTemplarCacheUnlock');
	Template.PointsToComplete = StafferXHours(1, 6);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UnlockCache_Templar";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVTemplarCache');

	Template.ResearchCompletedFn = SAVItemsGiveRandomItemRewardx3;

	Template.ItemRewards.AddItem('SAVTemplarCrate');
	Template.ItemRewards.AddItem('SAVTemplarCrate');
	Template.ItemRewards.AddItem('SAVTemplarCrate');
	Template.ItemRewards.AddItem('SAVTemplarCrate');
	Template.ItemRewards.AddItem('SAVTemplarCrate');
	Template.ItemRewards.AddItem('SAVTemplarCrate');
	Template.ItemRewards.AddItem('SAVTemplarCrate');
	Template.ItemRewards.AddItem('SAVTemplarCrate');
	Template.ItemRewards.AddItem('SAVTemplarCrate');
	Template.ItemRewards.AddItem('SAVAlienCrate');
	Template.ItemRewards.AddItem('SAV_ResistanceSupplyCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVCommonBoxes');

	// Cost
	Artifacts.ItemTemplateName = 'SAVTemplarCache';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSAVReaperCacheUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	
	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVReaperCacheUnlock');
	Template.PointsToComplete = StafferXHours(1, 6);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UnlockCache_Reaper";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVReaperCache');

	Template.ResearchCompletedFn = SAVItemsGiveRandomItemRewardx3;

	Template.ItemRewards.AddItem('SAVReaperCrate');
	Template.ItemRewards.AddItem('SAVReaperCrate');
	Template.ItemRewards.AddItem('SAVReaperCrate');
	Template.ItemRewards.AddItem('SAVReaperCrate');
	Template.ItemRewards.AddItem('SAVReaperCrate');
	Template.ItemRewards.AddItem('SAVReaperCrate');
	Template.ItemRewards.AddItem('SAVReaperCrate');
	Template.ItemRewards.AddItem('SAVReaperCrate');
	Template.ItemRewards.AddItem('SAVReaperCrate');
	Template.ItemRewards.AddItem('SAVHunterWeaponsCrate');
	Template.ItemRewards.AddItem('SAV_ResistanceSupplyCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVCommonBoxes');

	// Cost
	Artifacts.ItemTemplateName = 'SAVReaperCache';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSAVResistanceDataCacheUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	
	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVResistanceDataCacheUnlock');
	Template.PointsToComplete = StafferXHours(1, 24);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_Unlock_ResistanceDataCache";
	Template.bProvingGround = false;
	Template.bRepeatable = true;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVResistanceDataCache');

	Template.ResearchCompletedFn = SAVItemsGiveRandomItemRewardx3;

	Template.ItemRewards.AddItem('FacilityLeadItem');
	Template.ItemRewards.AddItem('SAV_MissionIntel_UFO');
	Template.ItemRewards.AddItem('AlienDatapad');
	Template.ItemRewards.AddItem('AlienDatapad');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('SAV_MissionIntel_SupplyRaid');
	Template.ItemRewards.AddItem('SAV_MissionIntel_SupplyRaid');
	Template.ItemRewards.AddItem('SAV_MissionIntel_GuerillaOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_GuerillaOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_GuerillaOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_GuerillaOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_CouncilOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_CouncilOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_ResistanceOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_ResistanceOps');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_TacticalDataPad');
	Template.ItemRewards.AddItem('SAV_TacticalDataPad');
	Template.ItemRewards.AddItem('SAV_ADVENTWatchList');
	Template.ItemRewards.AddItem('SAV_ADVENTWatchList');
	Template.ItemRewards.AddItem('SAV_SateliteData');
	Template.ItemRewards.AddItem('SAV_SateliteData');
	Template.ItemRewards.AddItem('SAV_ResistanceNetworkData');
	Template.ItemRewards.AddItem('SAV_ResistanceNetworkData');
	Template.ItemRewards.AddItem('SAV_ADVENTProjectData');
	Template.ItemRewards.AddItem('SAV_ADVENTProjectData');

	// Cost
	Artifacts.ItemTemplateName = 'SAVResistanceDataCache';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSAVBlackMarketCacheUnlock()
{
	local X2TechTemplate Template;
//	local name ItemName;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVBlackMarketCacheUnlock');
	Template.PointsToComplete = StafferXHours(1, 6);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_BlackMarketCache";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVBlackMarketCache');

	Template.ResearchCompletedFn = SAVItemsGiveRandomItemRewardx3;

	Template.ItemRewards.AddItem('SAVAlienCrate');
	Template.ItemRewards.AddItem('SAV_AlienAlloyCrate');
	Template.ItemRewards.AddItem('SAV_AlienEleriumCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAV_ADVENTAlloyCrate');
	Template.ItemRewards.AddItem('SAV_ADVENTSupplyCrate');
	Template.ItemRewards.AddItem('SAV_ADVENTSupplyCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceAmmoCrate');
	Template.ItemRewards.AddItem('SAVResistanceExplosivesCrate');
	Template.ItemRewards.AddItem('SAVLegacyWeaponsCrate');
	Template.ItemRewards.AddItem('SAVLegacyWeaponsCrate');
	Template.ItemRewards.AddItem('SAVHunterWeaponsCrate');
	Template.ItemRewards.AddItem('SAV_ResistanceSupplyCrate');
	Template.ItemRewards.AddItem('SAV_ResistanceSupplyCrate');
	Template.ItemRewards.AddItem('SAV_ResistanceSupplyCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVDrugPacks');
	Template.ItemRewards.AddItem('SAVDrugPacks');
	Template.ItemRewards.AddItem('SAVDrugPacks');
	Template.ItemRewards.AddItem('SAVDrugPacks');
	Template.ItemRewards.AddItem('SAVDrugPacks');
	Template.ItemRewards.AddItem('SAVDrugPacks');
	Template.ItemRewards.AddItem('SAVDrugPacks');
	Template.ItemRewards.AddItem('SAVDrugPacks');
	Template.ItemRewards.AddItem('SAVDrugPacks');
	Template.ItemRewards.AddItem('SAVCommonBoxes');
	Template.ItemRewards.AddItem('SAVCommonBoxes');
	Template.ItemRewards.AddItem('SAVCommonBoxes');
	Template.ItemRewards.AddItem('SAVCommonBoxes');
	Template.ItemRewards.AddItem('SAVCommonBoxes');
	Template.ItemRewards.AddItem('SAVCommonBoxes');
	Template.ItemRewards.AddItem('SAVCommonBoxes');
	Template.ItemRewards.AddItem('SAVCommonBoxes');

/* HEY, so it doesnt seem to work on a every entry shifts the probablility basis if you do it through the array, but this is good for other aplications
	Leaving the code in as reference in future

	foreach default.SAVBlackMarketCacheUnlock_REWARD_CRATES(ItemName)
	{
		Template.ItemRewards.AddItem(ItemName);
	}
*/
	// Cost
	Artifacts.ItemTemplateName = 'SAVBlackMarketCache';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSAVBlackMarketBONUSCacheUnlock()
{
	local X2TechTemplate Template;
//	local name ItemName;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVBlackMarketBONUSCacheUnlock');
	Template.PointsToComplete = StafferXHours(1, 16);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_BlackMarketBONUSCache";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVBlackMarketBONUSCache');

	Template.ResearchCompletedFn = SAVItemsGiveRandomItemRewardx3;
	Template.ItemRewards.AddItem('SAVAlienCrate_AYTech');
	Template.ItemRewards.AddItem('SAVAlienCrate');
	Template.ItemRewards.AddItem('SAV_AlienAlloyCrate');
	Template.ItemRewards.AddItem('SAV_AlienEleriumCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAVAdventCrate');
	Template.ItemRewards.AddItem('SAV_ADVENTAlloyCrate');
	Template.ItemRewards.AddItem('SAV_ADVENTAlloyCrate');
	Template.ItemRewards.AddItem('SAV_ADVENTSupplyCrate');
	Template.ItemRewards.AddItem('SAV_ADVENTSupplyCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAVResistanceCrate');
	Template.ItemRewards.AddItem('SAV_ResistanceSupplyCrate');
	Template.ItemRewards.AddItem('SAV_ResistanceSupplyCrate');
	Template.ItemRewards.AddItem('SAV_ResistanceSupplyCrate');
	Template.ItemRewards.AddItem('SAVResistanceAmmoCrate');
	Template.ItemRewards.AddItem('SAVResistanceExplosivesCrate');
	Template.ItemRewards.AddItem('SAVLegacyWeaponsCrate');
	Template.ItemRewards.AddItem('SAVUniqueWeaponsCrate');
	Template.ItemRewards.AddItem('SAVSkirmisherCrate');
	Template.ItemRewards.AddItem('SAVTemplarCrate');
	Template.ItemRewards.AddItem('SAVReaperCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVBlackMarketCrate');
	Template.ItemRewards.AddItem('SAVDrugPacks');
	Template.ItemRewards.AddItem('SAVDrugPacks');
	Template.ItemRewards.AddItem('SAVDrugPacks');
	Template.ItemRewards.AddItem('SAVDrugPacks');
	Template.ItemRewards.AddItem('SAVDrugPacks');
	Template.ItemRewards.AddItem('SAVDrugPacks');

	// Cost
	Artifacts.ItemTemplateName = 'SAVBlackMarketBONUSCache';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

///////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////CRATES////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
static function X2DataTemplate CreateSAVAlienCrateUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVAlienCrateUnlock');
	Template.PointsToComplete = StafferXHours(1, 6);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PGCrates_AlienCrate";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVAlienCrate');

	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.ItemRewards.AddItem('PlasmaCharge');
	Template.ItemRewards.AddItem('PlasmaCharge');
	Template.ItemRewards.AddItem('SustainingSphere');
	Template.ItemRewards.AddItem('SustainingSphere');
	Template.ItemRewards.AddItem('RefractionField');
	Template.ItemRewards.AddItem('RefractionField');
	Template.ItemRewards.AddItem('PlasmaBlaster');
	Template.ItemRewards.AddItem('BlasterLauncher');
	Template.ItemRewards.AddItem('SAVAlienPowerPack');
	Template.ItemRewards.AddItem('SAVAlienPowerPack');
	Template.ItemRewards.AddItem('SAVAlienPowerPack');
	Template.ItemRewards.AddItem('SAVAlienPowerPack');
	Template.ItemRewards.AddItem('SavBioSample');
	Template.ItemRewards.AddItem('SavBioSample');
	Template.ItemRewards.AddItem('SavBioSample');
	Template.ItemRewards.AddItem('SavBioSample');
	Template.ItemRewards.AddItem('SavBioSample');
	Template.ItemRewards.AddItem('SavBioSample');
	Template.ItemRewards.AddItem('EleriumCore');
	Template.ItemRewards.AddItem('EleriumCore');
	Template.ItemRewards.AddItem('EleriumCore');
	Template.ItemRewards.AddItem('EleriumCore');
	Template.ItemRewards.AddItem('EleriumCore');
	Template.ItemRewards.AddItem('EleriumCore');
	Template.ItemRewards.AddItem('EleriumCore');
	Template.ItemRewards.AddItem('AlienDatapad');
	Template.ItemRewards.AddItem('AlienDatapad');
	Template.ItemRewards.AddItem('AlienDatapad');
	Template.ItemRewards.AddItem('AlienDatapad');
	Template.ItemRewards.AddItem('AlienDatapad');
	Template.ItemRewards.AddItem('FacilityLeadItem');
	Template.ItemRewards.AddItem('FacilityLeadItem');
	Template.ItemRewards.AddItem('SAV_MissionIntel_UFO');
	Template.ItemRewards.AddItem('SAV_MissionIntel_UFO');
	Template.ItemRewards.AddItem('SAVAlienJunk1');
	Template.ItemRewards.AddItem('SAVAlienJunk1');
	Template.ItemRewards.AddItem('SAVAlienJunk1');
	Template.ItemRewards.AddItem('SAVAlienJunk1');
	Template.ItemRewards.AddItem('SAVAlienJunk2');
	Template.ItemRewards.AddItem('SAVAlienJunk2');
	Template.ItemRewards.AddItem('SAVAlienJunk2');
	Template.ItemRewards.AddItem('SAVAlienJunk2');
	Template.ItemRewards.AddItem('SAVAlienNanotech');
	Template.ItemRewards.AddItem('SAVAlienEnergytech');
	Template.ItemRewards.AddItem('SAVAlienBiotech');
	Template.ItemRewards.AddItem('SAVAlienCybertech');
	Template.ItemRewards.AddItem('SAVAlienPsionictech');

	// Cost
	Artifacts.ItemTemplateName = 'SAVAlienCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVAlienCrate_AYTechUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVAlienCrate_AYTechUnlock');
	Template.PointsToComplete = StafferXHours(1, 20);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PGCrates_AlienCrate_AYTech";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	
	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVAlienCrate_AYTech');

	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.ItemRewards.AddItem('SAVAlienNanotech');
	Template.ItemRewards.AddItem('SAVAlienEnergytech');
	Template.ItemRewards.AddItem('SAVAlienBiotech');
	Template.ItemRewards.AddItem('SAVAlienCybertech');
	Template.ItemRewards.AddItem('SAVAlienPsionictech');

	// Cost
	Artifacts.ItemTemplateName = 'SAVAlienCrate_AYTech';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}


static function X2DataTemplate CreateSAVAdventCrateUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVAdventCrateUnlock');
	Template.PointsToComplete = StafferXHours(0, 0);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PGCrates_ADVENTCrate";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVAdventCrate');

	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.ItemRewards.AddItem('CommonPCSSpeed');
	Template.ItemRewards.AddItem('CommonPCSConditioning');
	Template.ItemRewards.AddItem('CommonPCSFocus');
	Template.ItemRewards.AddItem('CommonPCSPerception');
	Template.ItemRewards.AddItem('CommonPCSAgility');
	Template.ItemRewards.AddItem('SAV_ADVENTPCS_Security');
	Template.ItemRewards.AddItem('SAV_ADVENTPCS_Mark');
	Template.ItemRewards.AddItem('SAV_ADVENTPCS_Reflex');
	Template.ItemRewards.AddItem('IncendiaryRounds');
	Template.ItemRewards.AddItem('VenomRounds');
	Template.ItemRewards.AddItem('NanoScaleVest');
	Template.ItemRewards.AddItem('HazmatVest');
	Template.ItemRewards.AddItem('AlloyweveVest');
	Template.ItemRewards.AddItem('PassiveSensors');
	Template.ItemRewards.AddItem('ADVENTShieldAmp');
	Template.ItemRewards.AddItem('ADVENTShieldAmp');
	Template.ItemRewards.AddItem('SavCOREBar');
	Template.ItemRewards.AddItem('SavCOREBar');
	Template.ItemRewards.AddItem('SavCOREBar');
	Template.ItemRewards.AddItem('SavCOREBar');
	Template.ItemRewards.AddItem('SavCOREBar');
	Template.ItemRewards.AddItem('SavCOREBar');
	Template.ItemRewards.AddItem('SavCOREBar');
	Template.ItemRewards.AddItem('SAVAlienPowerPack');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('SAV_ADVENTWatchList');
	Template.ItemRewards.AddItem('SAV_ADVENTProjectData');
	Template.ItemRewards.AddItem('EleriumCore');
	Template.ItemRewards.AddItem('SavBioSample');
	Template.ItemRewards.AddItem('AlienDatapad');
	Template.ItemRewards.AddItem('FacilityLeadItem');
	Template.ItemRewards.AddItem('SAV_MissionIntel_SupplyRaid');
	Template.ItemRewards.AddItem('SAV_MissionIntel_SupplyRaid');
	Template.ItemRewards.AddItem('SAV_MissionIntel_CouncilOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_CouncilOps');
	Template.ItemRewards.AddItem('SAVADVENTJunk1');
	Template.ItemRewards.AddItem('SAVADVENTJunk1');
	Template.ItemRewards.AddItem('SAVADVENTJunk1');
	Template.ItemRewards.AddItem('SAVADVENTJunk1');
	Template.ItemRewards.AddItem('SAVADVENTJunk1');
	Template.ItemRewards.AddItem('SAVADVENTJunk1');
	Template.ItemRewards.AddItem('SAVADVENTJunk1');
	Template.ItemRewards.AddItem('SAVADVENTJunk2');
	Template.ItemRewards.AddItem('SAVADVENTJunk2');
	Template.ItemRewards.AddItem('SAVADVENTJunk2');
	Template.ItemRewards.AddItem('SAVADVENTJunk2');
	
	// Cost
	Artifacts.ItemTemplateName = 'SAVAdventCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVAdventHeavyCrateUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resource;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVAdventHeavyCrateUnlock');
	Template.PointsToComplete = StafferXHours(1, 8);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PGCrates_ADVENTHiSec";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

//	Requirements
	Template.Requirements.RequiredItems.AddItem('SAVAdventHeavyCrate');

	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.ItemRewards.AddItem('AlienDatapad');
	Template.ItemRewards.AddItem('AlienDatapad');
	Template.ItemRewards.AddItem('AlienDatapad');
	Template.ItemRewards.AddItem('FacilityLeadItem');
	Template.ItemRewards.AddItem('FacilityLeadItem');
	Template.ItemRewards.AddItem('DisruptorRounds');
	Template.ItemRewards.AddItem('AAJDERounds');
	Template.ItemRewards.AddItem('SAV_MissionIntel_UFO');
	Template.ItemRewards.AddItem('SAV_MissionIntel_UFO');
	Template.ItemRewards.AddItem('SAV_MissionIntel_SupplyRaid');
	Template.ItemRewards.AddItem('SAV_MissionIntel_SupplyRaid');
	Template.ItemRewards.AddItem('SAV_MissionIntel_SupplyRaid');
	Template.ItemRewards.AddItem('SAV_MissionIntel_CouncilOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_CouncilOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_CouncilOps');
	Template.ItemRewards.AddItem('SAV_ADVENTWatchList');
	Template.ItemRewards.AddItem('SAV_ADVENTWatchList');
	Template.ItemRewards.AddItem('SAV_ADVENTProjectData');
	Template.ItemRewards.AddItem('SAV_ADVENTProjectData');
	Template.ItemRewards.AddItem('EleriumCore');
	Template.ItemRewards.AddItem('EleriumCore');
	Template.ItemRewards.AddItem('EleriumCore');
	Template.ItemRewards.AddItem('EleriumCore');
	Template.ItemRewards.AddItem('SavBioSample');
	Template.ItemRewards.AddItem('SavBioSample');
	Template.ItemRewards.AddItem('RarePCSSpeed');
	Template.ItemRewards.AddItem('RarePCSConditioning');
	Template.ItemRewards.AddItem('RarePCSFocus');
	Template.ItemRewards.AddItem('RarePCSPerception');
	Template.ItemRewards.AddItem('RarePCSAgility');
	Template.ItemRewards.AddItem('ADVENTShieldAmp');
	Template.ItemRewards.AddItem('ADVENTShieldAmp');
	Template.ItemRewards.AddItem('SAV_ADVENTPCS_Security');
	Template.ItemRewards.AddItem('SAV_ADVENTPCS_Mark');
	Template.ItemRewards.AddItem('SAV_ADVENTPCS_Reflex');
	Template.ItemRewards.AddItem('SAV_ADVENTPCS_Security');
	Template.ItemRewards.AddItem('SAV_ADVENTPCS_Mark');
	Template.ItemRewards.AddItem('SAV_ADVENTPCS_Reflex');
	Template.ItemRewards.AddItem('SAVAlienPowerPack');
	Template.ItemRewards.AddItem('AAJRounds');
	Template.ItemRewards.AddItem('AAJRounds');
	Template.ItemRewards.AddItem('AAJRounds');
	Template.ItemRewards.AddItem('AlloyweveVest');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('SAVADVENTJunk2');
	Template.ItemRewards.AddItem('SAVADVENTJunk2');
	Template.ItemRewards.AddItem('SAVADVENTJunk2');

	// Cost
	Artifacts.ItemTemplateName = 'SAVAdventHeavyCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Resource.ItemTemplateName = 'Intel';
	Resource.Quantity = 8;
	Template.Cost.ResourceCosts.AddItem(Resource);

	return Template;
}

static function X2DataTemplate CreateSAVResistanceCrateUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVResistanceCrateUnlock');
	Template.PointsToComplete = StafferXHours(0, 0);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PGCrates_ResistanceCrate";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVResistanceCrate');

	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAVResistanceIED');
	Template.ItemRewards.AddItem('SAVResistanceIED');
	Template.ItemRewards.AddItem('SAVMilspecRounds');
	Template.ItemRewards.AddItem('SAVMilspecRounds');
	Template.ItemRewards.AddItem('SAVMilspecRounds');
	Template.ItemRewards.AddItem('SAVMilspecRounds');
	Template.ItemRewards.AddItem('SAVMilspecRounds');
	Template.ItemRewards.AddItem('APRounds');
	Template.ItemRewards.AddItem('IncendiaryRounds');
	Template.ItemRewards.AddItem('HighCalRounds');
	Template.ItemRewards.AddItem('ExplosiveRounds');
	Template.ItemRewards.AddItem('SAV_MedicalPCS');
	Template.ItemRewards.AddItem('SAV_StealthPCS');
	Template.ItemRewards.AddItem('SAV_SurvivalPCS');
	Template.ItemRewards.AddItem('SAV_CQBPCS');
	Template.ItemRewards.AddItem('HiddenBladesCV');
	Template.ItemRewards.AddItem('Flamethrower');
	Template.ItemRewards.AddItem('HECharge');
	Template.ItemRewards.AddItem('FlashbangGrenade');
	Template.ItemRewards.AddItem('SmokeGrenade');
	Template.ItemRewards.AddItem('LightweightOverlay');
	Template.ItemRewards.AddItem('GBandolierOverlay');
	Template.ItemRewards.AddItem('AssaultOverlay');
	Template.ItemRewards.AddItem('MedicalOverlay');
	Template.ItemRewards.AddItem('HazmatAmod');
	Template.ItemRewards.AddItem('EngeneeringAmod');
	Template.ItemRewards.AddItem('PartisanAmod');
	Template.ItemRewards.AddItem('Medikit');
	Template.ItemRewards.AddItem('SavStimulator');
	Template.ItemRewards.AddItem('ProxScanner');
	Template.ItemRewards.AddItem('AdvancedHackTool');
	Template.ItemRewards.AddItem('DecoyBeacon');
	Template.ItemRewards.AddItem('UltrasonicLure');
	Template.ItemRewards.AddItem('RepairKit');
	Template.ItemRewards.AddItem('RepairKitPlating');
	Template.ItemRewards.AddItem('SAV_MissionIntel_SupplyRaid');
	Template.ItemRewards.AddItem('SAV_MissionIntel_GuerillaOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_GuerillaOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_GuerillaOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_ResistanceOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_ResistanceOps');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_TacticalDataPad');
	Template.ItemRewards.AddItem('SAV_TacticalDataPad');
	Template.ItemRewards.AddItem('SAV_SateliteData');
	Template.ItemRewards.AddItem('SAV_ResistanceNetworkData');
	Template.ItemRewards.AddItem('SAV_ResistanceNetworkData');
	Template.ItemRewards.AddItem('SAVResistanceJunk1');
	Template.ItemRewards.AddItem('SAVResistanceJunk1');
	Template.ItemRewards.AddItem('SAVResistanceJunk1');
	Template.ItemRewards.AddItem('SAVResistanceJunk1');
	Template.ItemRewards.AddItem('SAVResistanceJunk2');
	Template.ItemRewards.AddItem('SAVResistanceJunk2');
	Template.ItemRewards.AddItem('SAVResistanceJunk2');
	Template.ItemRewards.AddItem('SAVResistanceJunk2');
	Template.ItemRewards.AddItem('SavBoozePile');
	Template.ItemRewards.AddItem('SavBoozePile');
	Template.ItemRewards.AddItem('SavBoozePile');
	Template.ItemRewards.AddItem('SavBoozePile');
	Template.ItemRewards.AddItem('SavRustyRifle');
	Template.ItemRewards.AddItem('SavRustyRifle');
	
	// Cost
	Artifacts.ItemTemplateName = 'SAVResistanceCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVResistanceUtilityCrateUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVResistanceUtilityCrateUnlock');
	Template.PointsToComplete = StafferXHours(0, 0);
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PGCrates_ResistanceUtilityCrate";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVResistanceUtilityCrate');

	Template.ResearchCompletedFn = GiveRandomItemReward;
	
	Template.ItemRewards.AddItem('UltrasonicLure');
	Template.ItemRewards.AddItem('Medikit');
	Template.ItemRewards.AddItem('SavStimulator');
	Template.ItemRewards.AddItem('ProxScanner');
	Template.ItemRewards.AddItem('AdvancedHackTool');
	Template.ItemRewards.AddItem('DecoyBeacon');
	Template.ItemRewards.AddItem('RepairKit');
	Template.ItemRewards.AddItem('RepairKitPlating');
	Template.ItemRewards.AddItem('PassiveSensors');
	Template.ItemRewards.AddItem('Stunspray');
	Template.ItemRewards.AddItem('SavHandFlamer');
	Template.ItemRewards.AddItem('SavStimGun');
	Template.ItemRewards.AddItem('TacticalUplinkScanner');
	Template.ItemRewards.AddItem('SavRegen');
	Template.ItemRewards.AddItem('ImprovisedCoverKit');
	Template.ItemRewards.AddItem('BreachingGun');
	Template.ItemRewards.AddItem('HiddenBladesCV');
	Template.ItemRewards.AddItem('SavRationBar');
	Template.ItemRewards.AddItem('ReinforcedVest');
	Template.ItemRewards.AddItem('CeramicBolsterPlating');
	Template.ItemRewards.AddItem('WebbingOverlay');
	Template.ItemRewards.AddItem('Medipack');
	Template.ItemRewards.AddItem('SAVResistanceJunk1');
	Template.ItemRewards.AddItem('SAVResistanceJunk2');

	// Cost
	Artifacts.ItemTemplateName = 'SAVResistanceUtilityCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVResistanceExplosivesCrateUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVResistanceExplosivesCrateUnlock');
	Template.PointsToComplete = StafferXHours(1, 4);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PGCrates_ResistanceExplosivesCrate";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVResistanceExplosivesCrate');

	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAVResistanceJunk1');
	Template.ItemRewards.AddItem('SAVResistanceJunk2');
	Template.ItemRewards.AddItem('SmokeGrenade');
	Template.ItemRewards.AddItem('SmokeGrenade');
	Template.ItemRewards.AddItem('SmokeGrenade');
	Template.ItemRewards.AddItem('FlashbangGrenade');
	Template.ItemRewards.AddItem('FlashbangGrenade');
	Template.ItemRewards.AddItem('FlashbangGrenade');
	Template.ItemRewards.AddItem('FlashbangGrenade');
	Template.ItemRewards.AddItem('Firebomb');
	Template.ItemRewards.AddItem('Firebomb');
	Template.ItemRewards.AddItem('Firebomb');
	Template.ItemRewards.AddItem('Firebomb');
	Template.ItemRewards.AddItem('GasGrenade');
	Template.ItemRewards.AddItem('GasGrenade');
	Template.ItemRewards.AddItem('GasGrenade');
	Template.ItemRewards.AddItem('GasGrenade');
	Template.ItemRewards.AddItem('AcidGrenade');
	Template.ItemRewards.AddItem('AcidGrenade');	
	Template.ItemRewards.AddItem('AcidGrenade');
	Template.ItemRewards.AddItem('EMPGrenade');
	Template.ItemRewards.AddItem('ProximityMine');
	Template.ItemRewards.AddItem('HECharge');
	Template.ItemRewards.AddItem('HECharge');
	Template.ItemRewards.AddItem('HECharge');	
	Template.ItemRewards.AddItem('HECharge');
	Template.ItemRewards.AddItem('GBandolierOverlay');
	Template.ItemRewards.AddItem('GBandolierOverlay');
	Template.ItemRewards.AddItem('MunitionsCarrierOverlay');
	Template.ItemRewards.AddItem('IncendaryCharge');
	Template.ItemRewards.AddItem('ToxinCharge');
	Template.ItemRewards.AddItem('SAVResistanceIED');
	Template.ItemRewards.AddItem('SAVResistanceIED');
	Template.ItemRewards.AddItem('SAVResistanceIED');
	Template.ItemRewards.AddItem('SAVResistanceIED');
	Template.ItemRewards.AddItem('SAVResistanceIED');

	// Cost
	Artifacts.ItemTemplateName = 'SAVResistanceExplosivesCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVResistanceAmmoCrateUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVResistanceAmmoCrateUnlock');
	Template.PointsToComplete = StafferXHours(0, 0);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PGCrates_ResistanceAmmoCrate";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVResistanceAmmoCrate');

	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAVResistanceJunk1');
	Template.ItemRewards.AddItem('SAVResistanceJunk2');
	Template.ItemRewards.AddItem('SAVMilspecRounds');
	Template.ItemRewards.AddItem('SAVMilspecRounds');
	Template.ItemRewards.AddItem('SAVMilspecRounds');
	Template.ItemRewards.AddItem('SAVMilspecRounds');
	Template.ItemRewards.AddItem('SAVMilspecRounds');
	Template.ItemRewards.AddItem('SAVMilspecRounds');
	Template.ItemRewards.AddItem('SAVButcherRounds');
	Template.ItemRewards.AddItem('SAVButcherRounds');
	Template.ItemRewards.AddItem('SAVBreachBusters');
	Template.ItemRewards.AddItem('SAVBreachBusters');
	Template.ItemRewards.AddItem('SAVSkullSplitters');
	Template.ItemRewards.AddItem('SAVSkullSplitters');
	Template.ItemRewards.AddItem('HighCalRounds');
	Template.ItemRewards.AddItem('HighCalRounds');
	Template.ItemRewards.AddItem('HighCalRounds');
	Template.ItemRewards.AddItem('ExplosiveRounds');
	Template.ItemRewards.AddItem('ExplosiveRounds');
	Template.ItemRewards.AddItem('ExplosiveRounds');
	Template.ItemRewards.AddItem('SavStunRounds');
	Template.ItemRewards.AddItem('SavStunRounds');
	Template.ItemRewards.AddItem('SavStunRounds');
	Template.ItemRewards.AddItem('SAVHollowPointRounds');
	Template.ItemRewards.AddItem('SAVHollowPointRounds');
	Template.ItemRewards.AddItem('DumbTracerRounds');
	Template.ItemRewards.AddItem('DumbTracerRounds');
	Template.ItemRewards.AddItem('HighVelocityAP');
	Template.ItemRewards.AddItem('HighVelocityAP');
	Template.ItemRewards.AddItem('APRounds');
	Template.ItemRewards.AddItem('APRounds');
	Template.ItemRewards.AddItem('APRounds');
	Template.ItemRewards.AddItem('TracerRounds');
	Template.ItemRewards.AddItem('TracerRounds');
	Template.ItemRewards.AddItem('TracerRounds');
	Template.ItemRewards.AddItem('IncendiaryRounds');
	Template.ItemRewards.AddItem('IncendiaryRounds');
	Template.ItemRewards.AddItem('IncendiaryRounds');
	Template.ItemRewards.AddItem('TalonRounds');
	Template.ItemRewards.AddItem('TalonRounds');
	Template.ItemRewards.AddItem('TalonRounds');
	Template.ItemRewards.AddItem('VenomRounds');
	Template.ItemRewards.AddItem('VenomRounds');
	Template.ItemRewards.AddItem('VenomRounds');

	// Cost
	Artifacts.ItemTemplateName = 'SAVResistanceAmmoCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVLegacyWeaponsCrateUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVLegacyWeaponsCrateUnlock');
	Template.PointsToComplete = StafferXHours(0, 0);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UnlockCrate_LegacyWeapons";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVLegacyWeaponsCrate');

	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.ItemRewards.AddItem('SavRustyRifle');
	Template.ItemRewards.AddItem('SavRustyRifle');
	Template.ItemRewards.AddItem('SavRustyRifle');
	Template.ItemRewards.AddItem('SavRustyRifle');
	Template.ItemRewards.AddItem('SavRustyRifle');
	Template.ItemRewards.AddItem('SavRustyRifle');
	Template.ItemRewards.AddItem('SavRustyRifle');
	Template.ItemRewards.AddItem('SAV_LEG_AssaultRifle_CV');
	Template.ItemRewards.AddItem('SAV_LEG_AssaultRifle_CV');
	Template.ItemRewards.AddItem('SAV_LEG_AssaultRifle_CV');
	Template.ItemRewards.AddItem('SAV_LEG_AssaultRifle_CV');
	Template.ItemRewards.AddItem('SAV_LEG_AssaultRifle_CV');
	Template.ItemRewards.AddItem('SAV_LEG_AssaultRifle_CV');
	Template.ItemRewards.AddItem('SAV_LEG_AssaultRifle_MG');
	Template.ItemRewards.AddItem('SAV_LEG_AssaultRifle_MG');
	Template.ItemRewards.AddItem('SAV_LEG_Pistol_CV');
	Template.ItemRewards.AddItem('SAV_LEG_Pistol_CV');
	Template.ItemRewards.AddItem('SAV_LEG_Pistol_CV');
	Template.ItemRewards.AddItem('SAV_LEG_Pistol_CV');
	Template.ItemRewards.AddItem('SAV_LEG_Pistol_CV');
	Template.ItemRewards.AddItem('SAV_LEG_Pistol_CV');
	Template.ItemRewards.AddItem('SAV_LEG_Pistol_MG');
	Template.ItemRewards.AddItem('SAV_LEG_Pistol_MG');
	Template.ItemRewards.AddItem('SAV_LEG_Cannon_CV');
	Template.ItemRewards.AddItem('SAV_LEG_Cannon_CV');
	Template.ItemRewards.AddItem('SAV_LEG_Cannon_CV');
	Template.ItemRewards.AddItem('SAV_LEG_Cannon_MG');
	Template.ItemRewards.AddItem('SAV_LEG_Shotgun_CV');
	Template.ItemRewards.AddItem('SAV_LEG_Shotgun_CV');
	Template.ItemRewards.AddItem('SAV_LEG_Shotgun_CV');
	Template.ItemRewards.AddItem('SAV_LEG_Shotgun_MG');
	Template.ItemRewards.AddItem('SAV_LEG_SniperRifle_CV');
	Template.ItemRewards.AddItem('SAV_LEG_SniperRifle_CV');
	Template.ItemRewards.AddItem('SAV_LEG_SniperRifle_CV');
	Template.ItemRewards.AddItem('SAV_LEG_SniperRifle_MG');
	Template.ItemRewards.AddItem('SAV_LEG_Sword_CV');
	Template.ItemRewards.AddItem('SAV_LEG_Sword_CV');
	Template.ItemRewards.AddItem('SAV_LEG_Sword_CV');
	Template.ItemRewards.AddItem('SAV_LEG_Sword_MG');

	// Cost
	Artifacts.ItemTemplateName = 'SAVLegacyWeaponsCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVHunterWeaponsCrateUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVHunterWeaponsCrateUnlock');
	Template.PointsToComplete = StafferXHours(1, 2);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UnlockCrate_HunterWeapons";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVHunterWeaponsCrate');

	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.ItemRewards.AddItem('AlienHunterRifle_CV');
	Template.ItemRewards.AddItem('AlienHunterRifle_CV');
	Template.ItemRewards.AddItem('AlienHunterRifle_MG');
	Template.ItemRewards.AddItem('AlienHunterPistol_CV');
	Template.ItemRewards.AddItem('AlienHunterPistol_CV');
	Template.ItemRewards.AddItem('AlienHunterPistol_MG');
	Template.ItemRewards.AddItem('AlienHunterAxe_CV');
	Template.ItemRewards.AddItem('AlienHunterAxe_CV');
	Template.ItemRewards.AddItem('AlienHunterAxe_MG');
	Template.ItemRewards.AddItem('Frostbomb');
	Template.ItemRewards.AddItem('SAV_LEG_Sword_CV');
	Template.ItemRewards.AddItem('SAV_LEG_AssaultRifle_CV');
	Template.ItemRewards.AddItem('SavRustyRifle');
	Template.ItemRewards.AddItem('SavRustyRifle');
	Template.ItemRewards.AddItem('SavRustyRifle');

	// Cost
	Artifacts.ItemTemplateName = 'SAVHunterWeaponsCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVUniqueWeaponsCrateUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVUniqueWeaponsCrateUnlock');
	Template.PointsToComplete = StafferXHours(1, 4);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UnlockCrate_UniqueWeapons";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVUniqueWeaponsCrate');

    Template.ResearchCompletedFn = GiveDeckedItemReward;
    Template.RewardDeck = 'SAVUniqueWeaponsRewards';

	// Cost
	Artifacts.ItemTemplateName = 'SAVUniqueWeaponsCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSAVSkirmisherCrateUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVSkirmisherCrateUnlock');
	Template.PointsToComplete = StafferXHours(0, 0);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UnlockCrate_Skirmisher";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVSkirmisherCrate');

	Template.ResearchCompletedFn = GiveRandomItemReward;
//	Template.ItemRewards.AddItem('SkirmisherInfoPad');
	Template.ItemRewards.AddItem('SAVSkirmisherControlChip');
	Template.ItemRewards.AddItem('SavSkirmisherAMod');
	Template.ItemRewards.AddItem('SavSkirmisherAMod');
	Template.ItemRewards.AddItem('SAVSkirmisherAdrenalAmp');
	Template.ItemRewards.AddItem('SAVSkirmisherAdrenalAmp');
	Template.ItemRewards.AddItem('SAVChainBreakerTool');
	Template.ItemRewards.AddItem('SAVChainBreakerTool');
	Template.ItemRewards.AddItem('SAVSkirmisherMagBlaster');
	Template.ItemRewards.AddItem('SAVSkirmisherMagBlaster');
	Template.ItemRewards.AddItem('SAV_ADVENTPCS_Security');
	Template.ItemRewards.AddItem('SAV_ADVENTPCS_Mark');
	Template.ItemRewards.AddItem('SavComDrug_RedHaze');
	Template.ItemRewards.AddItem('SavCOREBar');
	Template.ItemRewards.AddItem('ExplosiveRounds');
	Template.ItemRewards.AddItem('SavStimGun');
	Template.ItemRewards.AddItem('SAV_MissionIntel_ResistanceOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_SupplyRaid');
	Template.ItemRewards.AddItem('SAVResistanceJunk2');
	Template.ItemRewards.AddItem('SAVDrugsPES');

	// Cost
	Artifacts.ItemTemplateName = 'SAVSkirmisherCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVTemplarCrateUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVTemplarCrateUnlock');
	Template.PointsToComplete = StafferXHours(0, 0);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UnlockCrate_Templar";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVTemplarCrate');

	Template.ResearchCompletedFn = GiveRandomItemReward;

//	Template.ItemRewards.AddItem('TemplarInfoPad');
	Template.ItemRewards.AddItem('SAVTemplarAMod');
	Template.ItemRewards.AddItem('SAVTemplarAMod');
	Template.ItemRewards.AddItem('SAVAutoStigmata');
	Template.ItemRewards.AddItem('SAVAutoStigmata');
	Template.ItemRewards.AddItem('SAVMindrazor');
	Template.ItemRewards.AddItem('SAVMindrazor');
	Template.ItemRewards.AddItem('SAVTranslocator');
	Template.ItemRewards.AddItem('SAVTranslocator');
	Template.ItemRewards.AddItem('SavComDrug_Psiko');
	Template.ItemRewards.AddItem('SavComDrug_Psiko');
	Template.ItemRewards.AddItem('SavStimulator');
	Template.ItemRewards.AddItem('SavRegen');
	Template.ItemRewards.AddItem('SAV_MissionIntel_ResistanceOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_UFO');
	Template.ItemRewards.AddItem('EleriumCore');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAVResistanceJunk2');
	Template.ItemRewards.AddItem('SavRecDrugs');

	// Cost
	Artifacts.ItemTemplateName = 'SAVTemplarCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVReaperCrateUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVReaperCrateUnlock');
	Template.PointsToComplete = StafferXHours(0, 0);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UnlockCrate_Reaper";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVReaperCrate');

	Template.ResearchCompletedFn = GiveRandomItemReward;

//	Template.ItemRewards.AddItem('ReaperInfoPad');
	Template.ItemRewards.AddItem('SAVReaperAMod');
	Template.ItemRewards.AddItem('SAVReaperAMod');
	Template.ItemRewards.AddItem('SavReaperBushMeat');
	Template.ItemRewards.AddItem('SavReaperBushMeat');
	Template.ItemRewards.AddItem('SavReaperBushMeat');
	Template.ItemRewards.AddItem('SAVReaperGoggles');
	Template.ItemRewards.AddItem('SAVReaperGoggles');
	Template.ItemRewards.AddItem('SAV_ReaperRemoteDetonator');
	Template.ItemRewards.AddItem('SAV_ReaperRemoteDetonator');
	Template.ItemRewards.AddItem('SAVReaperHiddenBlades');
	Template.ItemRewards.AddItem('SAVReaperHiddenBlades');
	Template.ItemRewards.AddItem('SavComDrug_Raptor');
	Template.ItemRewards.AddItem('SAVSkullSplitters');
	Template.ItemRewards.AddItem('SAVResistanceIED');
	Template.ItemRewards.AddItem('HECharge');
	Template.ItemRewards.AddItem('UltrasonicLure');
	Template.ItemRewards.AddItem('SAV_MissionIntel_ResistanceOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_GuerillaOps');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAVResistanceJunk2');
	Template.ItemRewards.AddItem('SavBoozePile');

	// Cost
	Artifacts.ItemTemplateName = 'SAVReaperCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVBlackMarketCrateUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVBlackMarketCrateUnlock');
	Template.PointsToComplete = StafferXHours(0, 0);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PGCrates_BlackMarketCrate";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVBlackMarketCrate');

	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.ItemRewards.AddItem('SavComDrug_Turbo');
	Template.ItemRewards.AddItem('SavComDrug_Turbo');
	Template.ItemRewards.AddItem('SavComDrug_Turbo');
	Template.ItemRewards.AddItem('SavComDrug_Turbo');
	Template.ItemRewards.AddItem('SavComDrug_Turbo');
	Template.ItemRewards.AddItem('SavComDrug_Klarity');
	Template.ItemRewards.AddItem('SavComDrug_Klarity');
	Template.ItemRewards.AddItem('SavComDrug_Klarity');
	Template.ItemRewards.AddItem('SavComDrug_Klarity');
	Template.ItemRewards.AddItem('SavComDrug_Klarity');
	Template.ItemRewards.AddItem('SavComDrug_Raptor');
	Template.ItemRewards.AddItem('SavComDrug_Raptor');
	Template.ItemRewards.AddItem('SavComDrug_Raptor');
	Template.ItemRewards.AddItem('SavComDrug_Raptor');
	Template.ItemRewards.AddItem('SavComDrug_RedHaze');
	Template.ItemRewards.AddItem('SavComDrug_RedHaze');
	Template.ItemRewards.AddItem('SavComDrug_RedHaze');
	Template.ItemRewards.AddItem('SavComDrug_Liston');
	Template.ItemRewards.AddItem('SavComDrug_Liston');
	Template.ItemRewards.AddItem('SavComDrug_Liston');
	Template.ItemRewards.AddItem('SavComDrug_Psiko');
	Template.ItemRewards.AddItem('SavComDrug_Psiko');
	Template.ItemRewards.AddItem('SavComDrug_Psiko');
	Template.ItemRewards.AddItem('SavCOREBar');
	Template.ItemRewards.AddItem('SavCOREBar');
	Template.ItemRewards.AddItem('SavCOREBar');
	Template.ItemRewards.AddItem('SavCOREBar');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_TacticalDataPad');
	Template.ItemRewards.AddItem('SAV_SateliteData');
	Template.ItemRewards.AddItem('SAV_ADVENTWatchList');
	Template.ItemRewards.AddItem('SAV_ResistanceNetworkData');
	Template.ItemRewards.AddItem('SAV_ADVENTProjectData');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('AlienDatapad');
	Template.ItemRewards.AddItem('FacilityLeadItem');
	Template.ItemRewards.AddItem('SAV_MissionIntel_SupplyRaid');
	Template.ItemRewards.AddItem('SAV_MissionIntel_CouncilOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_GuerillaOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_GuerillaOps');
	Template.ItemRewards.AddItem('SAV_MissionIntel_ResistanceOps');
	Template.ItemRewards.AddItem('EleriumCore');
	Template.ItemRewards.AddItem('SAVDrugsPES');
	Template.ItemRewards.AddItem('SAVPornPES');
	Template.ItemRewards.AddItem('SAVPrewarPES');
	Template.ItemRewards.AddItem('SAV_MedicalPCS');
	Template.ItemRewards.AddItem('SAV_OverwhelmedPCS');
	Template.ItemRewards.AddItem('SAV_StealthPCS');
	Template.ItemRewards.AddItem('SAV_SurvivalPCS');
	Template.ItemRewards.AddItem('SAV_CQBPCS');
	Template.ItemRewards.AddItem('CommonPCSSpeed');
	Template.ItemRewards.AddItem('CommonPCSConditioning');
	Template.ItemRewards.AddItem('CommonPCSAgility');
	Template.ItemRewards.AddItem('HiddenBladesCV');
	Template.ItemRewards.AddItem('HiddenBladesCV');
	Template.ItemRewards.AddItem('SAVResistanceIED');
	Template.ItemRewards.AddItem('SAVResistanceIED');
	Template.ItemRewards.AddItem('SavStimGun');
	Template.ItemRewards.AddItem('SavStimGun');
	Template.ItemRewards.AddItem('AdvancedHackTool');
	Template.ItemRewards.AddItem('SAVButcherRounds');
	Template.ItemRewards.AddItem('SAVBreachBusters');
	Template.ItemRewards.AddItem('SAVSkullSplitters');
	Template.ItemRewards.AddItem('SAVButcherRounds');
	Template.ItemRewards.AddItem('SAVBreachBusters');
	Template.ItemRewards.AddItem('SAVSkullSplitters');
	Template.ItemRewards.AddItem('SmokeGrenade');
	Template.ItemRewards.AddItem('SmokeGrenade');
	Template.ItemRewards.AddItem('SavRecDrugs');
	Template.ItemRewards.AddItem('SavRecDrugs');
	Template.ItemRewards.AddItem('SavRecDrugs');
	Template.ItemRewards.AddItem('SavRecDrugs');
	Template.ItemRewards.AddItem('SavRecDrugs');
	Template.ItemRewards.AddItem('SavBoozePile');
	Template.ItemRewards.AddItem('SavBoozePile');
	Template.ItemRewards.AddItem('SavBoozePile');
	Template.ItemRewards.AddItem('SavBoozePile');
	Template.ItemRewards.AddItem('SavBoozePile');
	Template.ItemRewards.AddItem('SavBoozePile');
	Template.ItemRewards.AddItem('SavRustyRifle');
	Template.ItemRewards.AddItem('SAVTrashbags');
	Template.ItemRewards.AddItem('SAVTrashbags');
	Template.ItemRewards.AddItem('SAVTrashbags');
	Template.ItemRewards.AddItem('SAVTrashbags');
	Template.ItemRewards.AddItem('SAVTrashbags');

	// Cost
	Artifacts.ItemTemplateName = 'SAVBlackMarketCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVDrugPacksUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVDrugPacksUnlock');
	Template.PointsToComplete = StafferXHours(0, 0);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PGCrates_DrugPacks";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVDrugPacks');

	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.ItemRewards.AddItem('SavComDrug_Turbo');
	Template.ItemRewards.AddItem('SavComDrug_Turbo');
	Template.ItemRewards.AddItem('SavComDrug_Turbo');
	Template.ItemRewards.AddItem('SavComDrug_Turbo');
	Template.ItemRewards.AddItem('SavComDrug_Turbo');
	Template.ItemRewards.AddItem('SavComDrug_Turbo');
	Template.ItemRewards.AddItem('SavComDrug_Turbo');
	Template.ItemRewards.AddItem('SavComDrug_Klarity');
	Template.ItemRewards.AddItem('SavComDrug_Klarity');
	Template.ItemRewards.AddItem('SavComDrug_Klarity');
	Template.ItemRewards.AddItem('SavComDrug_Klarity');
	Template.ItemRewards.AddItem('SavComDrug_Klarity');
	Template.ItemRewards.AddItem('SavComDrug_Klarity');
	Template.ItemRewards.AddItem('SavComDrug_Raptor');
	Template.ItemRewards.AddItem('SavComDrug_Raptor');
	Template.ItemRewards.AddItem('SavComDrug_Raptor');
	Template.ItemRewards.AddItem('SavComDrug_Raptor');
	Template.ItemRewards.AddItem('SavComDrug_Raptor');
	Template.ItemRewards.AddItem('SavComDrug_RedHaze');
	Template.ItemRewards.AddItem('SavComDrug_RedHaze');
	Template.ItemRewards.AddItem('SavComDrug_RedHaze');
	Template.ItemRewards.AddItem('SavComDrug_RedHaze');
	Template.ItemRewards.AddItem('SavComDrug_Liston');
	Template.ItemRewards.AddItem('SavComDrug_Liston');
	Template.ItemRewards.AddItem('SavComDrug_Liston');
	Template.ItemRewards.AddItem('SavComDrug_Liston');
	Template.ItemRewards.AddItem('SavComDrug_Psiko');
	Template.ItemRewards.AddItem('SavComDrug_Psiko');
	Template.ItemRewards.AddItem('SavComDrug_Psiko');
	Template.ItemRewards.AddItem('SAVDrugsPES');
	Template.ItemRewards.AddItem('SAVDrugsPES');
	Template.ItemRewards.AddItem('SavRecDrugs');
	Template.ItemRewards.AddItem('SavRecDrugs');
	Template.ItemRewards.AddItem('SavRecDrugs');
	Template.ItemRewards.AddItem('SavRecDrugs');
	Template.ItemRewards.AddItem('SavRecDrugs');
	Template.ItemRewards.AddItem('SavRecDrugs');
	Template.ItemRewards.AddItem('SAVTrashbags');
	Template.ItemRewards.AddItem('SAVTrashbags');

	// Cost
	Artifacts.ItemTemplateName = 'SAVDrugPacks';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVCommonBoxesUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVCommonBoxesUnlock');
	Template.PointsToComplete = StafferXHours(0, 0);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PGCrates_WoodenCrate";
	Template.bProvingGround = true;
	Template.bRepeatable = true;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;
	
	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVCommonBoxes');

	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.ItemRewards.AddItem('FacilityLeadItem');
	Template.ItemRewards.AddItem('SAV_MissionIntel_GuerillaOps');
	Template.ItemRewards.AddItem('EleriumCore');
	Template.ItemRewards.AddItem('AdventDatapad');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SAV_DataChit');
	Template.ItemRewards.AddItem('SavComDrug_Turbo');
	Template.ItemRewards.AddItem('SavComDrug_Klarity');
	Template.ItemRewards.AddItem('SavComDrug_Raptor');
	Template.ItemRewards.AddItem('SavComDrug_RedHaze');
	Template.ItemRewards.AddItem('SavComDrug_Liston');
	Template.ItemRewards.AddItem('SavComDrug_Psiko');
	Template.ItemRewards.AddItem('SavCOREBar');
	Template.ItemRewards.AddItem('UltrasonicLure');
	Template.ItemRewards.AddItem('SAVMilspecRounds');
	Template.ItemRewards.AddItem('SAVResistanceJunk1');
	Template.ItemRewards.AddItem('SAVResistanceJunk1');
	Template.ItemRewards.AddItem('SAVResistanceJunk1');
	Template.ItemRewards.AddItem('SAVResistanceJunk2');
	Template.ItemRewards.AddItem('SAVResistanceJunk2');
	Template.ItemRewards.AddItem('SAVADVENTJunk1');
	Template.ItemRewards.AddItem('SAVADVENTJunk1');
	Template.ItemRewards.AddItem('SAVADVENTJunk2');
	Template.ItemRewards.AddItem('SAVDrugsPES');
	Template.ItemRewards.AddItem('SAVPornPES');
	Template.ItemRewards.AddItem('SAVPrewarPES');
	Template.ItemRewards.AddItem('SavRecDrugs');
	Template.ItemRewards.AddItem('SavRecDrugs');
	Template.ItemRewards.AddItem('SavRecDrugs');
	Template.ItemRewards.AddItem('SavBoozePile');
	Template.ItemRewards.AddItem('SavBoozePile');
	Template.ItemRewards.AddItem('SavBoozePile');
	Template.ItemRewards.AddItem('SavBoozePile');
	Template.ItemRewards.AddItem('SavBoozePile');
	Template.ItemRewards.AddItem('SavRustyRifle');
	Template.ItemRewards.AddItem('SAVTrashbags');
	Template.ItemRewards.AddItem('SAVTrashbags');
	Template.ItemRewards.AddItem('SAVTrashbags');
	Template.ItemRewards.AddItem('SAVTrashbags');
	Template.ItemRewards.AddItem('SAVTrashbags');

	// Cost
	Artifacts.ItemTemplateName = 'SAVCommonBoxes';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}


///////////////////////////
//CONTENT UNLOCK PROJECTS//
///////////////////////////

static function X2DataTemplate CreateSAVUnlock_ResistanceSupplyCrate()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVUnlock_ResistanceSupplyCrate');
	Template.PointsToComplete = StafferXHours(0, 0);
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PGResourceUnlocks_ResistanceSupplies";
	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	Template.ResearchCompletedFn = SAVSupplyTechCompleted;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_ResistanceSupplyCrate');

	// Cost
	Artifacts.ItemTemplateName = 'SAV_ResistanceSupplyCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSAVUnlock_ADVENTSupplyCrate()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVUnlock_ADVENTSupplyCrate');
	Template.PointsToComplete = StafferXHours(1, 2);
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PGResourceUnlocks_ADVENTSupplies";
	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	Template.ResearchCompletedFn = SAVSupplyTechCompleted;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_ADVENTSupplyCrate');

	// Cost
	Artifacts.ItemTemplateName = 'SAV_ADVENTSupplyCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSAVUnlock_ADVENTAlloyCrate()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVUnlock_ADVENTAlloyCrate');
	Template.PointsToComplete = StafferXHours(1, 4);
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PGResourceUnlocks_ADVENTAlloys";
	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	Template.ResearchCompletedFn = SAVAlloyTechCompleted;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_ADVENTAlloyCrate');

	// Cost
	Artifacts.ItemTemplateName = 'SAV_ADVENTAlloyCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSAVUnlock_AlienAlloyCrate()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVUnlock_AlienAlloyCrate');
	Template.PointsToComplete = StafferXHours(1, 12);
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PGResourceUnlocks_AlienAlloys";
	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	Template.ResearchCompletedFn = SAVAlloyTechCompleted;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_AlienAlloyCrate');

	// Cost
	Artifacts.ItemTemplateName = 'SAV_AlienAlloyCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSAVUnlock_AlienEleriumCrate()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVUnlock_AlienEleriumCrate');
	Template.PointsToComplete = StafferXHours(1, 12);
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PGResourceUnlocks_AlienElerium";
	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	Template.ResearchCompletedFn = SAVEleriumTechCompleted;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_AlienEleriumCrate');

	// Cost
	Artifacts.ItemTemplateName = 'SAV_AlienEleriumCrate';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSAVUnlock_DataChit()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVUnlock_DataChit');
	Template.PointsToComplete = 200;
	Template.RepeatPointsIncrease = 50;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_UnlockDataChit";
	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	Template.ResearchCompletedFn = SAVIntelTechCompleted;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_DataChit');

	// Cost
	Artifacts.ItemTemplateName = 'SAV_DataChit';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSAVUnlock_TacticalData()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVUnlock_TacticalData');
	Template.PointsToComplete = 400;
	Template.RepeatPointsIncrease = 50;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_Unlock_TacticalDataPad";
	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	Template.ResearchCompletedFn = SAVAbilityPointTechCompleted;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_TacticalDataPad');

	// Cost
	Artifacts.ItemTemplateName = 'SAV_TacticalDataPad';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}
/*
static function X2DataTemplate CreateSAVUnlock_DoomReduction()
{
	local X2TechTemplate Template;
//	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVUnlock_DoomReduction');
	Template.PointsToComplete = 400;
	Template.RepeatPointsIncrease = 50;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_Unlock_TacticalDataPad";
	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	Template.ResearchCompletedFn = SAVDoomReductionTechCompleted;

	// Requirements
//	Template.Requirements.RequiredItems.AddItem('SAV_TacticalDataPad');

	// Cost
	Artifacts.ItemTemplateName = 'SAV_TacticalDataPad';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}
*/

static function X2DataTemplate CreateSAVUnlock_WatchList()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVUnlock_WatchList');
	Template.PointsToComplete = 400;
	Template.RepeatPointsIncrease = 50;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_Unlock_WatchlistData";
	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	Template.ResearchCompletedFn = ApplySAVWatchList;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_ADVENTWatchList');

	// Cost
	Artifacts.ItemTemplateName = 'SAV_ADVENTWatchList';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

function ApplySAVWatchList(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameState_WorldRegion RegionState;
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local array<XComGameState_WorldRegion> PossibleContactRegions;

	History = `XCOMHISTORY;

	// choose a region with available contact
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	PossibleContactRegions = XComHQ.GetContactRegions();
	RegionState = PossibleContactRegions[`SYNC_RAND(PossibleContactRegions.Length)];

	// modify the contact cost
	RegionState = XComGameState_WorldRegion(NewGameState.ModifyStateObject(class'XComGameState_WorldRegion', RegionState.ObjectID));

	RegionState.ModifyContactCost(SAVWATCH_LIST_CONTACT_COST_MOD);
}

static function X2DataTemplate CreateSAVUnlock_SateliteData()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVUnlock_SateliteData');
	Template.PointsToComplete = 400;
	Template.RepeatPointsIncrease = 50;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_Unlock_SateliteData";
	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	Template.ResearchCompletedFn = ApplySAVSatelliteData;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_SateliteData');

	// Cost
	Artifacts.ItemTemplateName = 'SAV_SateliteData';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

function ApplySAVSatelliteData(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;

	History = `XCOMHISTORY;

	// increase the scan rate for the avenger
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	XComHQ.SetScanRateForDuration(NewGameState, SAVSATELLITE_DATA_SCAN_RATE_MOD, SAVSATELLITE_DATA_SCAN_RATE_DURATION_HOURS);
}

static function X2DataTemplate CreateSAVUnlock_ResistanceNetworkData()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVUnlock_ResistanceNetworkData');
	Template.PointsToComplete = 400;
	Template.RepeatPointsIncrease = 50;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_Unlock_ResistanceNetworkData";
	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	Template.ResearchCompletedFn = ApplySAVResistanceBroadcast;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_ResistanceNetworkData');

	// Cost
	Artifacts.ItemTemplateName = 'SAV_ResistanceNetworkData';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

function ApplySAVResistanceBroadcast(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameState_WorldRegion RegionState;
//	local XComGameStateHistory History;
//	local XComGameState_HeadquartersXCom XComHQ;

//	History = `XCOMHISTORY;

	// Modify the supply drop value for the current region
//	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));

	RegionState = GetCacheTechsRandomContactedRegion();
	RegionState.ModifyBaseSupplyDrop(SAVRESISTANCE_BROADCAST_INCOME_BONUS);
}

static function X2DataTemplate CreateSAVUnlock_PriorityData()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVUnlock_PriorityData');
	Template.PointsToComplete = 400;
	Template.RepeatPointsIncrease = 50;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_Unlock_DarkEventData";
	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	Template.ResearchCompletedFn = ApplySAVPriorityData;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_ADVENTProjectData');

	// Cost
	Artifacts.ItemTemplateName = 'SAV_ADVENTProjectData';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

function ApplySAVPriorityData(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersAlien AlienHQ;
	local StateObjectReference DarkEventRef;
	local XComGameState_DarkEvent DarkEventState;

	History = `XCOMHISTORY;

	// extend the activation timer on all currently chosen Dark Events
	AlienHQ = XComGameState_HeadquartersAlien(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersAlien'));

	foreach AlienHQ.ChosenDarkEvents(DarkEventRef)
	{
		DarkEventState = XComGameState_DarkEvent(NewGameState.ModifyStateObject(class'XComGameState_DarkEvent', DarkEventRef.ObjectID));

		DarkEventState.ExtendActivationTimer(SAVPRIORITY_DATA_DARK_EVENT_EXTENSION_HOURS);
	}
}
/*
static function X2DataTemplate CreateSAVUnlock_ResistanceFactionData()
{
	local X2TechTemplate Template;
//	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVUnlock_ResistanceFactionData');
	Template.PointsToComplete = 400;
	Template.RepeatPointsIncrease = 50;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_UnlockDataChit";
	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

//	Template.ResearchCompletedFn = class'X2StrategyElement_XpackRewards'Reward_ResistanceCard;
	Template.RewardName = 'Reward_SAVResistanceCard';

	// Requirements
//	Template.Requirements.RequiredItems.AddItem('SAV_ResistanceFactionData');

	// Cost
	Artifacts.ItemTemplateName = 'SAV_ResistanceFactionData';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}
*/
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Unique Upgrade Techs

static function X2DataTemplate CreateSAVEnhance_LilRipper()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVEnhance_LilRipper');
	Template.PointsToComplete = StafferXHours(1, 48);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UniqueUpgrade_LilRipper_1";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_Unique_LilRipper');
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');

	// Rewards
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAV_Unique_LilRipper_Enhanced');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.SUPPLY_COST_LILRIPPER2;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.ALLOY_COST_LILRIPPER2;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'SAV_Unique_LilRipper';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVPerfect_LilRipper()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVPerfect_LilRipper');
	Template.PointsToComplete = StafferXHours(1, 72);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UniqueUpgrade_LilRipper_2";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_Unique_LilRipper_Enhanced');
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');

	// Rewards
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAV_Unique_LilRipper_Perfected');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.SUPPLY_COST_LILRIPPER3;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.ALLOY_COST_LILRIPPER3;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'SAV_Unique_LilRipper_Enhanced';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVPerfect_PrototypeLaserRifle()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVPerfect_PrototypeLaserRifle');
	Template.PointsToComplete = StafferXHours(1, 72);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UniqueUpgrade_ProtoLaserAR_1";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_Unique_PrototypeLaserRifle');
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');

	// Rewards
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAV_Unique_PrototypeLaserRifle_Perfected');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.SUPPLY_COST_PROTOTYPELASERRIFLE3;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.ELERIUM_COST_PROTOTYPELASERRIFLE3;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'SAV_Unique_PrototypeLaserRifle';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVEnhance_HarpoonGun()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVEnhance_HarpoonGun');
	Template.PointsToComplete = StafferXHours(1, 60);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UniqueUpgrade_HarpoonGun_1";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_Unique_HarpoonGun');
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');

	// Rewards
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAV_Unique_HarpoonGun_Enhanced');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.SUPPLY_COST_HARPOONGUN2;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.ALLOY_COST_HARPOONGUN2;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'SAV_Unique_HarpoonGun';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVPerfect_HarpoonGun()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVPerfect_HarpoonGun');
	Template.PointsToComplete = StafferXHours(1, 84);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UniqueUpgrade_HarpoonGun_2";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_Unique_HarpoonGun_Enhanced');
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');

	// Rewards
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAV_Unique_HarpoonGun_Perfected');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.SUPPLY_COST_HARPOONGUN3;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = class'X2Item_SavageUniqueWeapons'.default.ECORE_COST_HARPOONGUN3;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Artifacts.ItemTemplateName = 'SAV_Unique_HarpoonGun_Enhanced';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVPerfect_Viperfang()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVPerfect_Viperfang');
	Template.PointsToComplete = StafferXHours(1, 72);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UniqueUpgrade_ViperFang_1";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_Unique_Viperfang');
	Template.Requirements.RequiredTechs.AddItem('AutopsyArchon');

	// Rewards
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAV_Unique_Viperfang_Perfected');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.SUPPLY_COST_VIPERFANG3;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.ALLOY_COST_VIPERFANG3;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'SAV_Unique_Viperfang';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVEnhance_JaggedAxe()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVEnhance_JaggedAxe');
	Template.PointsToComplete = StafferXHours(1, 48);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UniqueUpgrade_JaggedAxes_1";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_Unique_JaggedAxe');
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventStunLancer');

	// Rewards
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAV_Unique_JaggedAxe_Enhanced');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.SUPPLY_COST_JAGGED_AXE2;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.ALLOY_COST_JAGGED_AXE2;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'SAV_Unique_JaggedAxe';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVPerfect_JaggedAxe()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVPerfect_JaggedAxe');
	Template.PointsToComplete = StafferXHours(1, 72);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UniqueUpgrade_JaggedAxes_2";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_Unique_JaggedAxe_Enhanced');
	Template.Requirements.RequiredTechs.AddItem('AutopsyArchon');

	// Rewards
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAV_Unique_JaggedAxe_Perfected');

	// Cost
	Resources.ItemTemplateName = 'EleriumDust';
 	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.ELERIUM_COST_JAGGED_AXE3;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.ALLOY_COST_JAGGED_AXE3;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'SAV_Unique_JaggedAxe_Enhanced';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVEnhance_EndlessVengeance()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVEnhance_EndlessVengeance');
	Template.PointsToComplete = StafferXHours(1, 60);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UniqueUpgrade_EndlessVenganceSword_1";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_Legendary_EndlessVengeance');
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventStunLancer');

	// Rewards
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAV_Legendary_EndlessVengeance_Enhanced');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.SUPPLY_COST_ENDLESSVENGEANCE2;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.ALLOY_COST_ENDLESSVENGEANCE2;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'SAV_Legendary_EndlessVengeance';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVPerfect_EndlessVengeance()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVPerfect_EndlessVengeance');
	Template.PointsToComplete = StafferXHours(1, 84);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UniqueUpgrade_EndlessVenganceSword_2";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_Legendary_EndlessVengeance_Enhanced');
	Template.Requirements.RequiredTechs.AddItem('AutopsyArchon');

	// Rewards
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAV_Legendary_EndlessVengeance_Perfected');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.SUPPLY_COST_ENDLESSVENGEANCE3;
 	Template.Cost.ResourceCosts.AddItem(Resources);

	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.ALLOY_COST_ENDLESSVENGEANCE3;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'SAV_Legendary_EndlessVengeance_Enhanced';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVEnhance_Quicksilver()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVEnhance_Quicksilver');
	Template.PointsToComplete = StafferXHours(1, 48);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UniqueUpgrade_Quicksilver_1";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_Unique_Quicksilver');
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');

	// Rewards
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAV_Unique_Quicksilver_Improved');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.ENHANCE_QUICKSILVER_SUPPLIES;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.ENHANCE_QUICKSILVER_ALLOYS;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'SAV_Unique_Quicksilver';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVPerfect_Quicksilver()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVPerfect_Quicksilver');
	Template.PointsToComplete = StafferXHours(1, 72);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UniqueUpgrade_Quicksilver_2";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_Unique_Quicksilver_Improved');
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');

	// Rewards
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAV_Unique_Quicksilver_Perfected');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.PERFECT_QUICKSILVER_SUPPLIES;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.PERFECT_QUICKSILVER_ELERIUM;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'SAV_Unique_Quicksilver_Improved';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVEnhance_OpressorsEnd()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVEnhance_OpressorsEnd');
	Template.PointsToComplete = StafferXHours(1, 58);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UniqueUpgrade_OppressorsEnd_1";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_Unique_OppressorsEnd');
	Template.Requirements.RequiredTechs.AddItem('GaussWeapons');

	// Rewards
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAV_Unique_OppressorsEnd_Improved');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.ENHANCE_OPPRESSORSEND_SUPPLIES;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.ENHANCE_OPPRESSORSEND_ALLOYS;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'SAV_Unique_OppressorsEnd';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVPerfect_OpressorsEnd()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVPerfect_OpressorsEnd');
	Template.PointsToComplete = StafferXHours(1, 82);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UniqueUpgrade_OppressorsEnd_2";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_Unique_OppressorsEnd_Improved');
	Template.Requirements.RequiredTechs.AddItem('HeavyPlasma');

	// Rewards
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAV_Unique_OppressorsEnd_Perfected');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.PERFECT_OPPRESSORSEND_SUPPLIES;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.PERFECT_OPPRESSORSEND_ELERIUM;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'SAV_Unique_OppressorsEnd_Improved';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVPerfect_PrototypeLaserSniper()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVPerfect_PrototypeLaserSniper');
	Template.PointsToComplete = StafferXHours(1, 82);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UniqueUpgrade_EndlessVengance_1";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_Unique_PrototypeSniperRifle');
	Template.Requirements.RequiredTechs.AddItem('PlasmaSniper');

	// Rewards
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAV_Unique_PrototypeSniperRifle_Perfected');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.PERFECT_PROTOLASERSNIPER_SUPPLIES;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.PERFECT_PROTOLASERSNIPER_ELERIUM;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'SAV_Unique_PrototypeSniperRifle';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateSAVPerfect_AbsoluteZero()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVPerfect_AbsoluteZero');
	Template.PointsToComplete = StafferXHours(1, 72);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_UniqueUpgrade_AbsoluteZero_1";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.bArmor = false;
	Template.bRandomAmmo = false;
	Template.bRandomGrenade = false;
	Template.bRandomHeavyWeapon = false;

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAV_Unique_AbsoluteZero');
	Template.Requirements.RequiredTechs.AddItem('AlloyCannon');

	// Rewards
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('SAV_Unique_AbsoluteZero_Perfected');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.PERFECT_ABSOLUTEZERO2_SUPPLIES;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = class'X2Item_SavageUniqueWeapons'.default.PERFECT_ABSOLUTEZERO2_ELERIUM;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'SAV_Unique_AbsoluteZero';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Helper function for calculating project time - works in hours as opposed to days
static function int StafferXHours(int iNumScientists, int iNumHours)
{
	return (iNumScientists * 5) * (1 * iNumHours); // Scientists at base skill level
}

static function SAVItemsGiveRandomItemRewardx3(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local X2ItemTemplateManager ItemTemplateManager;
	local X2ItemTemplate ItemTemplate;
	local array<name> ItemRewards1, ItemRewards2, ItemRewards3;
	local int iRandIndex;
	
	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	
	ItemRewards1 = TechState.GetMyTemplate().ItemRewards;
	iRandIndex = `SYNC_RAND_STATIC(ItemRewards1.Length);
	ItemTemplate = ItemTemplateManager.FindItemTemplate(ItemRewards1[iRandIndex]);

	SAVItemsGiveItemRewardx1(NewGameState, TechState, ItemTemplate);

	ItemRewards2 = TechState.GetMyTemplate().ItemRewards;
	iRandIndex = `SYNC_RAND_STATIC(ItemRewards2.Length);
	ItemTemplate = ItemTemplateManager.FindItemTemplate(ItemRewards2[iRandIndex]);

	SAVItemsGiveItemRewardx2(NewGameState, TechState, ItemTemplate);

	ItemRewards3 = TechState.GetMyTemplate().ItemRewards;
	iRandIndex = `SYNC_RAND_STATIC(ItemRewards3.Length);
	ItemTemplate = ItemTemplateManager.FindItemTemplate(ItemRewards3[iRandIndex]);

	SAVItemsGiveItemRewardx3(NewGameState, TechState, ItemTemplate);
}

static function SAVItemsGiveItemRewardx1(XComGameState NewGameState, XComGameState_Tech TechState, X2ItemTemplate ItemTemplate)
{	
	class'XComGameState_HeadquartersXCom'.static.GiveItem(NewGameState, ItemTemplate);

	TechState.ItemRewards.Length = 0; // Reset the item rewards array in case the tech is repeatable
	TechState.ItemRewards.AddItem(ItemTemplate); // Needed for UI Alert display info

	TechState.bSeenResearchCompleteScreen = false; // Reset the research report for techs that are repeatable
}

static function SAVItemsGiveItemRewardx2(XComGameState NewGameState, XComGameState_Tech TechState, X2ItemTemplate ItemTemplate)
{	
	class'XComGameState_HeadquartersXCom'.static.GiveItem(NewGameState, ItemTemplate);

	TechState.ItemRewards.Length = 0; // Reset the item rewards array in case the tech is repeatable
	TechState.ItemRewards.AddItem(ItemTemplate); // Needed for UI Alert display info

	TechState.bSeenResearchCompleteScreen = false; // Reset the research report for techs that are repeatable
}

static function SAVItemsGiveItemRewardx3(XComGameState NewGameState, XComGameState_Tech TechState, X2ItemTemplate ItemTemplate)
{	
	class'XComGameState_HeadquartersXCom'.static.GiveItem(NewGameState, ItemTemplate);

	TechState.ItemRewards.Length = 0; // Reset the item rewards array in case the tech is repeatable
	TechState.ItemRewards.AddItem(ItemTemplate); // Needed for UI Alert display info

	TechState.bSeenResearchCompleteScreen = false; // Reset the research report for techs that are repeatable
}


//A Bunch of support code for giving various non-item rewards from the unlock techs above.
//SUPPLIES

static function SAVSupplyTechCompleted(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local int SupplyAmount, TechID;

	History = `XCOMHISTORY;

	foreach NewGameState.IterateByClassType(class'XComGameState_HeadquartersXCom', XComHQ)
	{
		break;
	}

	if(XComHQ == none)
	{
		XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	}
	
	if(TechState.GetMyTemplateName() == 'SAVUnlock_ResistanceSupplyCrate')
	{
		SupplyAmount = GetMinSAVResistanceSupply() + `SYNC_RAND_STATIC(GetMaxSAVResistanceSupply() - GetMinSAVResistanceSupply() + 1);
	}
	else if(TechState.GetMyTemplateName() == 'SAVUnlock_ADVENTSupplyCrate')
	{
		SupplyAmount = GetMinSAVAdventSupply() + `SYNC_RAND_STATIC(GetMaxSAVAdventSupply() - GetMinSAVAdventSupply() + 1);
	}

	TechID = TechState.ObjectID;
	TechState = XComGameState_Tech(NewGameState.GetGameStateForObjectID(TechID));

	if(TechState == none)
	{
		TechState = XComGameState_Tech(NewGameState.ModifyStateObject(class'XComGameState_Tech', TechID));
	}

	TechState.IntelReward = SupplyAmount;
	XComHQ.AddResource(NewGameState, 'Supplies', SupplyAmount);
}

//ALLOYS
static function SAVAlloyTechCompleted(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local int AlloyAmount, TechID;

	History = `XCOMHISTORY;

	foreach NewGameState.IterateByClassType(class'XComGameState_HeadquartersXCom', XComHQ)
	{
		break;
	}

	if(XComHQ == none)
	{
		XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	}
	
	if(TechState.GetMyTemplateName() == 'SAVUnlock_ADVENTAlloyCrate')
	{
		AlloyAmount = GetSAVMinADVENTAlloy() + `SYNC_RAND_STATIC(GetSAVMaxADVENTAlloy() - GetSAVMinADVENTAlloy() + 1);
	}
	else if(TechState.GetMyTemplateName() == 'SAVUnlock_AlienAlloyCrate')
	{
		AlloyAmount = GetSAVMinAlienAlloy() + `SYNC_RAND_STATIC(GetSAVMaxAlienAlloy() - GetSAVMinAlienAlloy() + 1);
	}

	TechID = TechState.ObjectID;
	TechState = XComGameState_Tech(NewGameState.GetGameStateForObjectID(TechID));

	if(TechState == none)
	{
		TechState = XComGameState_Tech(NewGameState.ModifyStateObject(class'XComGameState_Tech', TechID));
	}

	TechState.IntelReward = AlloyAmount;
	XComHQ.AddResource(NewGameState, 'AlienAlloy', AlloyAmount);
}

//ELERIUM
static function SAVEleriumTechCompleted(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local int EleriumAmount, TechID;

	History = `XCOMHISTORY;

	foreach NewGameState.IterateByClassType(class'XComGameState_HeadquartersXCom', XComHQ)
	{
		break;
	}

	if(XComHQ == none)
	{
		XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	}
	
	if(TechState.GetMyTemplateName() == 'SAVUnlock_AlienEleriumCrate')
	{
		EleriumAmount = GetSAVMinEleriumDust() + `SYNC_RAND_STATIC(GetSAVMaxEleriumDust() - GetSAVMinEleriumDust() + 1);
	}

	TechID = TechState.ObjectID;
	TechState = XComGameState_Tech(NewGameState.GetGameStateForObjectID(TechID));

	if(TechState == none)
	{
		TechState = XComGameState_Tech(NewGameState.ModifyStateObject(class'XComGameState_Tech', TechID));
	}

	TechState.IntelReward = EleriumAmount;
	XComHQ.AddResource(NewGameState, 'EleriumDust', EleriumAmount);
}

//INTEL
static function SAVIntelTechCompleted(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_HeadquartersResistance ResistanceHQ;
	local int IntelAmount, TechID;

	History = `XCOMHISTORY;

	foreach NewGameState.IterateByClassType(class'XComGameState_HeadquartersXCom', XComHQ)
	{
		break;
	}

	if(XComHQ == none)
	{
		XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	}
	
	if(TechState.GetMyTemplateName() == 'SAVUnlock_DataChit')
	{
		IntelAmount = GetMinDataChitIntel() + `SYNC_RAND_STATIC(GetMaxDataChitIntel() - GetMinDataChitIntel() + 1);
	}
	
	// Check for Spy Ring Continent Bonus
	ResistanceHQ = XComGameState_HeadquartersResistance(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersResistance'));
	IntelAmount += Round(float(IntelAmount) * (float(ResistanceHQ.IntelRewardPercentIncrease) / 100.0));

	TechID = TechState.ObjectID;
	TechState = XComGameState_Tech(NewGameState.GetGameStateForObjectID(TechID));

	if(TechState == none)
	{
		TechState = XComGameState_Tech(NewGameState.ModifyStateObject(class'XComGameState_Tech', TechID));
	}

	TechState.IntelReward = IntelAmount;
	XComHQ.AddResource(NewGameState, 'Intel', IntelAmount);
}

//Ability Points
static function SAVAbilityPointTechCompleted(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_HeadquartersResistance ResistanceHQ;
	local int APAmount, TechID;

	History = `XCOMHISTORY;

	foreach NewGameState.IterateByClassType(class'XComGameState_HeadquartersXCom', XComHQ)
	{
		break;
	}

	if(XComHQ == none)
	{
		XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	}
	
	if(TechState.GetMyTemplateName() == 'SAVUnlock_TacticalData')
	{
		APAmount = 15 + `SYNC_RAND_STATIC(40 - 15 + 1);
	}
	
	// Check for Spy Ring Continent Bonus
	ResistanceHQ = XComGameState_HeadquartersResistance(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersResistance'));
	APAmount += Round(float(APAmount) * (float(ResistanceHQ.IntelRewardPercentIncrease) / 50.0));

	TechID = TechState.ObjectID;
	TechState = XComGameState_Tech(NewGameState.GetGameStateForObjectID(TechID));

	if(TechState == none)
	{
		TechState = XComGameState_Tech(NewGameState.ModifyStateObject(class'XComGameState_Tech', TechID));
	}

	TechState.IntelReward = APAmount;
	XComHQ.AddResource(NewGameState, 'AbilityPoint', APAmount);
}

static function SAVDoomReductionTechCompleted(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersAlien AlienHQ;
	local float Quantity;

	History = `XCOMHISTORY;
	
	foreach NewGameState.IterateByClassType(class'XComGameState_HeadquartersAlien', AlienHQ)
	{
		break;
	}

	if(AlienHQ == none)
	{
		AlienHQ = XComGameState_HeadquartersAlien(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersAlien'));
		AlienHQ = XComGameState_HeadquartersAlien(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersAlien', AlienHQ.ObjectID));
	}

	Quantity = 168.0;
	AlienHQ.ExtendDoomTimer(Quantity);

//return TechState.GetMyTemplate().DisplayName $ ":" @ class'UIUtilities_Text'.static.GetTimeRemainingString(RewardState.Quantity);
}

function XComGameState_WorldRegion GetCacheTechsRandomContactedRegion()
{
	local XComGameStateHistory History;
	local XComGameState_WorldRegion RegionState;
	local array<XComGameState_WorldRegion> ValidRegions, AllRegions;

	History = `XCOMHISTORY;

		foreach History.IterateByClassType(class'XComGameState_WorldRegion', RegionState)
	{
			AllRegions.AddItem(RegionState);

			if(RegionState.ResistanceLevel >= eResLevel_Contact)
			{
				ValidRegions.AddItem(RegionState);
			}
		}

	if(ValidRegions.Length > 0)
	{
		return ValidRegions[`SYNC_RAND(ValidRegions.Length)];
	}

	return AllRegions[`SYNC_RAND(AllRegions.Length)];
}

//#############################################################################################
//----------------   DIFFICULTY HELPERS   -----------------------------------------------------
//#############################################################################################
//Intel Helpers
static function int GetMinDataChitIntel()
{
	return `ScaleStrategyArrayInt(default.MinDataChitIntel);
}

static function int GetMaxDataChitIntel()
{
	return `ScaleStrategyArrayInt(default.MaxDataChitIntel);
}

static function int GetMinSAVResistanceSupply()
{
	return `ScaleStrategyArrayInt(default.MinSAVResistanceSupply);
}

static function int GetMaxSAVResistanceSupply()
{
	return `ScaleStrategyArrayInt(default.MaxSAVResistanceSupply);
}

static function int GetMinSAVAdventSupply()
{
	return `ScaleStrategyArrayInt(default.MinSAVAdventSupply);
}

static function int GetMaxSAVAdventSupply()
{
	return `ScaleStrategyArrayInt(default.MaxSAVAdventSupply);
}

static function int GetSAVMinADVENTAlloy()
{
	return `ScaleStrategyArrayInt(default.MinSAVADVENTAlloy);
}

static function int GetSAVMaxADVENTAlloy()
{
	return `ScaleStrategyArrayInt(default.MaxSAVADVENTAlloy);
}

static function int GetSAVMinAlienAlloy()
{
	return `ScaleStrategyArrayInt(default.MinSAVAlienAlloy);
}

static function int GetSAVMaxAlienAlloy()
{
	return `ScaleStrategyArrayInt(default.MaxSAVAlienAlloy);
}

static function int GetSAVMinEleriumDust()
{
	return `ScaleStrategyArrayInt(default.MinSAVEleriumDust);
}

static function int GetSAVMaxEleriumDust()
{
	return `ScaleStrategyArrayInt(default.MaxSAVEleriumDust);
}

static function int GetSAVMinAbilityPoint()
{
	return `ScaleStrategyArrayInt(default.MinSAVAbilityPoints);
}

static function int GetSAVMaxAbilityPoint()
{
	return `ScaleStrategyArrayInt(default.MaxSAVAbilityPoints);
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}