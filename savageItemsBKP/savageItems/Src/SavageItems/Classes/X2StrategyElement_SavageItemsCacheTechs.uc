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

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;
//Caches
Techs.AddItem(CreateSAVAlienCacheUnlock());
Techs.AddItem(CreateSAVADVENTCacheUnlock());
Techs.AddItem(CreateSAVResistanceCacheUnlock());
Techs.AddItem(CreateSAVResistanceUtilityCacheUnlock());
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
//Techs.AddItem(CreateSAVUnlock_TacticalData());
//Techs.AddItem(CreateSAVUnlock_DoomReduction());

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
	Template.ItemRewards.AddItem('SAVResistanceAmmoCrate');
	Template.ItemRewards.AddItem('SAVResistanceAmmoCrate');
	Template.ItemRewards.AddItem('SAVResistanceExplosivesCrate');
	Template.ItemRewards.AddItem('SAVResistanceExplosivesCrate');
	Template.ItemRewards.AddItem('SAVResistanceUtilityCrate');
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
	Template.ItemRewards.AddItem('SavCOREBar');

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
//	Template.ItemRewards.AddItem('SAV_TacticalDataPad');
//	Template.ItemRewards.AddItem('SAV_TacticalDataPad');
//	Template.ItemRewards.AddItem('SAV_TacticalDataPad');
//	Template.ItemRewards.AddItem('SAV_TacticalDataPad');
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
//	Template.ItemRewards.AddItem('SAV_TacticalDataPad');
//	Template.ItemRewards.AddItem('SAV_TacticalDataPad');
//	Template.ItemRewards.AddItem('SAV_TacticalDataPad');
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
//	Template.ItemRewards.AddItem('SAV_CQBPCS');//=========================================DISABLED UNTIL WORKING
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
	Template.ItemRewards.AddItem('SAVTrashbags');
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
	Template.PointsToComplete = 400;
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
/*
static function X2DataTemplate CreateSAVUnlock_TacticalData()
{
	local X2TechTemplate Template;
//	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVUnlock_TacticalData');
	Template.PointsToComplete = 400;
	Template.RepeatPointsIncrease = 50;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_Unlock_TacticalDataPad";
	Template.SortingTier = 1;
	Template.IsPriorityFn = AlwaysPriority;

	Template.ResearchCompletedFn = SAVAbilityPointTechCompleted;

	// Requirements
//	Template.Requirements.RequiredItems.AddItem('SAV_TacticalDataPad');

	// Cost
	Artifacts.ItemTemplateName = 'SAV_TacticalDataPad';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

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
	
	if(TechState.GetMyTemplateName() == 'SAVUnlock_DataChit')
	{
		APAmount = 15 + `SYNC_RAND_STATIC(40 - 15 + 1);
	}
	
	// Check for Spy Ring Continent Bonus
	ResistanceHQ = XComGameState_HeadquartersResistance(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersResistance'));
	APAmount += Round(float(APAmount) * (float(ResistanceHQ.IntelRewardPercentIncrease) / 100.0));

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