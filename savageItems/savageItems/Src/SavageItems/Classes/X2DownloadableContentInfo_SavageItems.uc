//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_SavageItems.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_SavageItems extends X2DownloadableContentInfo config(SavageStockItems);

var config array<LootTable> LootTables, LootEntry;

var config array<name> UtilityItemCatagories;
var config array<name> HealItemCatagories;
var config array<name> AModHeavyCategories;
var config array<name> DaemonItemCatagories;

var config array<name> AbilityUnlocksAModUtilitySlot;
var config array<name> AbilityUnlocksAModWebbingSlot;
var config array<name> AbilityUnlocksLightVestSlot;
var config array<name> AbilityUnlocksAModHeavySlot;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
//CODE NABBED FROM IRIDAR AS USUAL!
static event OnLoadedSavedGame()
{
	if (!IsResearchInHistory('SavTechXenoSerumSynthesis')) AddSAVItemsTech('SavTechXenoSerumSynthesis');
	if (!IsResearchInHistory('BreakthroughSerumVIOLET')) AddSAVItemsTech('BreakthroughSerumVIOLET');
	if (!IsResearchInHistory('BreakthroughSerumORANGE')) AddSAVItemsTech('BreakthroughSerumORANGE');
	if (!IsResearchInHistory('BreakthroughSerumGREEN')) AddSAVItemsTech('BreakthroughSerumGREEN');
	if (!IsResearchInHistory('SAVAlienCacheUnlock')) AddSAVItemsTech('SAVAlienCacheUnlock');
	if (!IsResearchInHistory('SAVADVENTCacheUnlock')) AddSAVItemsTech('SAVADVENTCacheUnlock');
	if (!IsResearchInHistory('SAVResistanceCacheUnlock')) AddSAVItemsTech('SAVResistanceCacheUnlock');
	if (!IsResearchInHistory('SAVBlackMarketCacheUnlock')) AddSAVItemsTech('SAVBlackMarketCacheUnlock');
	if (!IsResearchInHistory('SAVBlackMarketBONUSCacheUnlock')) AddSAVItemsTech('SAVBlackMarketBONUSCacheUnlock');
	if (!IsResearchInHistory('SAVAlienCrateUnlock')) AddSAVItemsTech('SAVAlienCrateUnlock');
	if (!IsResearchInHistory('SAVAdventCrateUnlock')) AddSAVItemsTech('SAVAdventCrateUnlock');
	if (!IsResearchInHistory('SAVResistanceCrateUnlock')) AddSAVItemsTech('SAVResistanceCrateUnlock');
	if (!IsResearchInHistory('SAVBlackMarketCrateUnlock')) AddSAVItemsTech('SAVBlackMarketCrateUnlock');
	if (!IsResearchInHistory('SAVDrugPacksUnlock')) AddSAVItemsTech('SAVDrugPacksUnlock');
	if (!IsResearchInHistory('SAVCommonBoxesUnlock')) AddSAVItemsTech('SAVCommonBoxesUnlock');
	if (!IsResearchInHistory('SAVUnlock_ResistanceSupplyCrate')) AddSAVItemsTech('SAVUnlock_ResistanceSupplyCrate');
	if (!IsResearchInHistory('SAVUnlock_ADVENTSupplyCrate')) AddSAVItemsTech('SAVUnlock_ADVENTSupplyCrate');
	if (!IsResearchInHistory('SAVUnlock_ADVENTAlloyCrate')) AddSAVItemsTech('SAVUnlock_ADVENTAlloyCrate');
	if (!IsResearchInHistory('SAVUnlock_AlienAlloyCrate')) AddSAVItemsTech('SAVUnlock_AlienAlloyCrate');
	if (!IsResearchInHistory('SAVUnlock_AlienEleriumCrate')) AddSAVItemsTech('SAVUnlock_AlienEleriumCrate');
	if (!IsResearchInHistory('SAVUnlock_DataChit')) AddSAVItemsTech('SAVUnlock_DataChit');
	if (!IsResearchInHistory('SAVTech_PrepareGuerillaOp')) AddSAVItemsTech('SAVTech_PrepareGuerillaOp');
	if (!IsResearchInHistory('SAVTech_PrepareSupplyRaid')) AddSAVItemsTech('SAVTech_PrepareSupplyRaid');
	if (!IsResearchInHistory('SAVTech_PrepareCityCenterOP')) AddSAVItemsTech('SAVTech_PrepareCityCenterOP');
	if (!IsResearchInHistory('SAVTech_PrepareResistanceOperation')) AddSAVItemsTech('SAVTech_PrepareResistanceOperation');
	if (!IsResearchInHistory('SAVTech_PrepareUFOShootdown')) AddSAVItemsTech('SAVTech_PrepareUFOShootdown');
	if (!IsResearchInHistory('AlienCacheRewardDeck')) AddSAVItemsTech('AlienCacheRewardDeck');
	if (!IsResearchInHistory('ADVENTCacheRewardDeck')) AddSAVItemsTech('ADVENTCacheRewardDeck');
	if (!IsResearchInHistory('ResistanceCacheRewardDeck')) AddSAVItemsTech('ResistanceCacheRewardDeck');
	if (!IsResearchInHistory('MiscSavageItemsRewardDeck')) AddSAVItemsTech('MiscSavageItemsRewardDeck');
	if (!IsResearchInHistory('AlienTechItemRewardDeck')) AddSAVItemsTech('AlienTechItemRewardDeck');
	if (!IsResearchInHistory('SAVWeaponsRewardDeck')) AddSAVItemsTech('SAVWeaponsRewardDeck');
	if (!IsResearchInHistory('SAVSkirmisherCacheRewardDeck')) AddSAVItemsTech('SAVSkirmisherCacheRewardDeck');
	if (!IsResearchInHistory('SAVTemplarCacheRewardDeck')) AddSAVItemsTech('SAVTemplarCacheRewardDeck');
	if (!IsResearchInHistory('SAVReaperCacheRewardDeck')) AddSAVItemsTech('SAVReaperCacheRewardDeck');
	if (!IsResearchInHistory('SAVDataCacheRewardDeck')) AddSAVItemsTech('SAVDataCacheRewardDeck');
	if (!IsResearchInHistory('SAVResistanceUtilityCacheUnlock')) AddSAVItemsTech('SAVResistanceUtilityCacheUnlock');
	if (!IsResearchInHistory('SAVResistanceUtilityCrateUnlock')) AddSAVItemsTech('SAVResistanceUtilityCrateUnlock');
	if (!IsResearchInHistory('SAVResistanceAmmoCrateUnlock')) AddSAVItemsTech('SAVResistanceAmmoCrateUnlock');
	if (!IsResearchInHistory('SAVResistanceExplosivesCrateUnlock')) AddSAVItemsTech('SAVResistanceExplosivesCrateUnlock');
	if (!IsResearchInHistory('SAVAdventHeavyCrateUnlock')) AddSAVItemsTech('SAVAdventHeavyCrateUnlock');
	if (!IsResearchInHistory('BreakthroughNanoShredderAmmo')) AddSAVItemsTech('BreakthroughNanoShredderAmmo');
	if (!IsResearchInHistory('BreakthroughNanoShredderGrenade')) AddSAVItemsTech('BreakthroughNanoShredderGrenade');
	if (!IsResearchInHistory('BreakthroughNanoCloner')) AddSAVItemsTech('BreakthroughNanoCloner');
	if (!IsResearchInHistory('NanoShredderAmmoMFG')) AddSAVItemsTech('NanoShredderAmmoMFG');
	if (!IsResearchInHistory('NanoShredderGrenadeMFG')) AddSAVItemsTech('NanoShredderGrenadeMFG');
	if (!IsResearchInHistory('NanoClonerMFG')) AddSAVItemsTech('NanoClonerMFG');
	if (!IsResearchInHistory('StudySAVAlienNanotech')) AddSAVItemsTech('StudySAVAlienNanotech');
	if (!IsResearchInHistory('StudySAVAlienEnergytech')) AddSAVItemsTech('StudySAVAlienEnergytech');
	if (!IsResearchInHistory('StudySAVAlienBiotech')) AddSAVItemsTech('StudySAVAlienBiotech');
	if (!IsResearchInHistory('StudySAVAlienCybertech')) AddSAVItemsTech('StudySAVAlienCybertech');
	if (!IsResearchInHistory('StudySAVAlienPsionictech')) AddSAVItemsTech('StudySAVAlienPsionictech');
	if (!IsResearchInHistory('SAVAlienCrate_AYTechUnlock')) AddSAVItemsTech('SAVAlienCrate_AYTechUnlock');
	if (!IsResearchInHistory('AlternativeHeavyWeaponsConcepts')) AddSAVItemsTech('AlternativeHeavyWeaponsConcepts');
	if (!IsResearchInHistory('SAVResistanceWeaponsCacheUnlock')) AddSAVItemsTech('SAVResistanceWeaponsCacheUnlock');
	if (!IsResearchInHistory('SAVLegacyWeaponsCrateUnlock')) AddSAVItemsTech('SAVLegacyWeaponsCrateUnlock');
	if (!IsResearchInHistory('SAVHunterWeaponsCrateUnlock')) AddSAVItemsTech('SAVHunterWeaponsCrateUnlock');
	if (!IsResearchInHistory('SAVUniqueWeaponsCrateUnlock')) AddSAVItemsTech('SAVUniqueWeaponsCrateUnlock');
	if (!IsResearchInHistory('SAVSkirmisherCacheUnlock')) AddSAVItemsTech('SAVSkirmisherCacheUnlock');
	if (!IsResearchInHistory('SAVTemplarCacheUnlock')) AddSAVItemsTech('SAVTemplarCacheUnlock');
	if (!IsResearchInHistory('SAVReaperCacheUnlock')) AddSAVItemsTech('SAVReaperCacheUnlock');
	if (!IsResearchInHistory('SAVSkirmisherCrateUnlock')) AddSAVItemsTech('SAVSkirmisherCrateUnlock');
	if (!IsResearchInHistory('SAVTemplarCrateUnlock')) AddSAVItemsTech('SAVTemplarCrateUnlock');
	if (!IsResearchInHistory('SAVReaperCrateUnlock')) AddSAVItemsTech('SAVReaperCrateUnlock');
	if (!IsResearchInHistory('SAVResistanceDataCacheUnlock')) AddSAVItemsTech('SAVResistanceDataCacheUnlock');
	if (!IsResearchInHistory('SAVUnlock_WatchList')) AddSAVItemsTech('SAVUnlock_WatchList');
	if (!IsResearchInHistory('SAVUnlock_SateliteData')) AddSAVItemsTech('SAVUnlock_SateliteData');
	if (!IsResearchInHistory('SAVUnlock_ResistanceNetworkData')) AddSAVItemsTech('SAVUnlock_ResistanceNetworkData');
	if (!IsResearchInHistory('SAVUnlock_PriorityData')) AddSAVItemsTech('SAVUnlock_PriorityData');
	if (!IsResearchInHistory('SAVUnlock_TacticalData')) AddSAVItemsTech('SAVUnlock_TacticalData');
	if (!IsResearchInHistory('StudySAVXenotechnology')) AddSAVItemsTech('StudySAVXenotechnology');
//UniqueUpgradeTechs
	if (!IsResearchInHistory('SAVEnhance_LilRipper')) AddSAVItemsTech('SAVEnhance_LilRipper');
	if (!IsResearchInHistory('SAVPerfect_LilRipper')) AddSAVItemsTech('SAVPerfect_LilRipper');
	if (!IsResearchInHistory('SAVPerfect_PrototypeLaserRifle')) AddSAVItemsTech('SAVPerfect_PrototypeLaserRifle');
	if (!IsResearchInHistory('SAVEnhance_HarpoonGun')) AddSAVItemsTech('SAVEnhance_HarpoonGun');
	if (!IsResearchInHistory('SAVPerfect_HarpoonGun')) AddSAVItemsTech('SAVPerfect_HarpoonGun');
	if (!IsResearchInHistory('SAVPerfect_Viperfang')) AddSAVItemsTech('SAVPerfect_Viperfang');
	if (!IsResearchInHistory('SAVEnhance_JaggedAxe')) AddSAVItemsTech('SAVEnhance_JaggedAxe');
	if (!IsResearchInHistory('SAVPerfect_JaggedAxe')) AddSAVItemsTech('SAVPerfect_JaggedAxe');
	if (!IsResearchInHistory('SAVEnhance_EndlessVengeance')) AddSAVItemsTech('SAVEnhance_EndlessVengeance');
	if (!IsResearchInHistory('SAVPerfect_EndlessVengeance')) AddSAVItemsTech('SAVPerfect_EndlessVengeance');
	if (!IsResearchInHistory('SAVEnhance_Quicksilver')) AddSAVItemsTech('SAVEnhance_Quicksilver');
	if (!IsResearchInHistory('SAVPerfect_Quicksilver')) AddSAVItemsTech('SAVPerfect_Quicksilver');
	if (!IsResearchInHistory('SAVEnhance_OpressorsEnd')) AddSAVItemsTech('SAVEnhance_OpressorsEnd');
	if (!IsResearchInHistory('SAVPerfect_OpressorsEnd')) AddSAVItemsTech('SAVPerfect_OpressorsEnd');
	if (!IsResearchInHistory('SAVPerfect_PrototypeLaserSniper')) AddSAVItemsTech('SAVPerfect_PrototypeLaserSniper');
}

//	if (!IsResearchInHistory('SAVUnlock_DoomReduction')) AddSAVItemsTech('SAVUnlock_DoomReduction');
//	if (!IsResearchInHistory('SAVUnlock_ResistanceFactionData')) AddSAVItemsTech('SAVUnlock_ResistanceFactionData');

//CODE NABBED FROM IRIDAR AS USUAL!
static event OnLoadedSavedGameToStrategy() 
{
	if (!IsResearchInHistory('SavTechXenoSerumSynthesis')) AddSAVItemsTech('SavTechXenoSerumSynthesis');
	if (!IsResearchInHistory('BreakthroughSerumVIOLET')) AddSAVItemsTech('BreakthroughSerumVIOLET');
	if (!IsResearchInHistory('BreakthroughSerumORANGE')) AddSAVItemsTech('BreakthroughSerumORANGE');
	if (!IsResearchInHistory('BreakthroughSerumGREEN')) AddSAVItemsTech('BreakthroughSerumGREEN');
	if (!IsResearchInHistory('SAVAlienCacheUnlock')) AddSAVItemsTech('SAVAlienCacheUnlock');
	if (!IsResearchInHistory('SAVADVENTCacheUnlock')) AddSAVItemsTech('SAVADVENTCacheUnlock');
	if (!IsResearchInHistory('SAVResistanceCacheUnlock')) AddSAVItemsTech('SAVResistanceCacheUnlock');
	if (!IsResearchInHistory('SAVBlackMarketCacheUnlock')) AddSAVItemsTech('SAVBlackMarketCacheUnlock');
	if (!IsResearchInHistory('SAVBlackMarketBONUSCacheUnlock')) AddSAVItemsTech('SAVBlackMarketBONUSCacheUnlock');
	if (!IsResearchInHistory('SAVAlienCrateUnlock')) AddSAVItemsTech('SAVAlienCrateUnlock');
	if (!IsResearchInHistory('SAVAdventCrateUnlock')) AddSAVItemsTech('SAVAdventCrateUnlock');
	if (!IsResearchInHistory('SAVResistanceCrateUnlock')) AddSAVItemsTech('SAVResistanceCrateUnlock');
	if (!IsResearchInHistory('SAVBlackMarketCrateUnlock')) AddSAVItemsTech('SAVBlackMarketCrateUnlock');
	if (!IsResearchInHistory('SAVDrugPacksUnlock')) AddSAVItemsTech('SAVDrugPacksUnlock');
	if (!IsResearchInHistory('SAVCommonBoxesUnlock')) AddSAVItemsTech('SAVCommonBoxesUnlock');
	if (!IsResearchInHistory('SAVUnlock_ResistanceSupplyCrate')) AddSAVItemsTech('SAVUnlock_ResistanceSupplyCrate');
	if (!IsResearchInHistory('SAVUnlock_ADVENTSupplyCrate')) AddSAVItemsTech('SAVUnlock_ADVENTSupplyCrate');
	if (!IsResearchInHistory('SAVUnlock_ADVENTAlloyCrate')) AddSAVItemsTech('SAVUnlock_ADVENTAlloyCrate');
	if (!IsResearchInHistory('SAVUnlock_AlienAlloyCrate')) AddSAVItemsTech('SAVUnlock_AlienAlloyCrate');
	if (!IsResearchInHistory('SAVUnlock_AlienEleriumCrate')) AddSAVItemsTech('SAVUnlock_AlienEleriumCrate');
	if (!IsResearchInHistory('SAVUnlock_DataChit')) AddSAVItemsTech('SAVUnlock_DataChit');
	if (!IsResearchInHistory('SAVTech_PrepareGuerillaOp')) AddSAVItemsTech('SAVTech_PrepareGuerillaOp');
	if (!IsResearchInHistory('SAVTech_PrepareSupplyRaid')) AddSAVItemsTech('SAVTech_PrepareSupplyRaid');
	if (!IsResearchInHistory('SAVTech_PrepareCityCenterOP')) AddSAVItemsTech('SAVTech_PrepareCityCenterOP');
	if (!IsResearchInHistory('SAVTech_PrepareResistanceOperation')) AddSAVItemsTech('SAVTech_PrepareResistanceOperation');
	if (!IsResearchInHistory('SAVTech_PrepareUFOShootdown')) AddSAVItemsTech('SAVTech_PrepareUFOShootdown');
	if (!IsResearchInHistory('AlienCacheRewardDeck')) AddSAVItemsTech('AlienCacheRewardDeck');
	if (!IsResearchInHistory('ADVENTCacheRewardDeck')) AddSAVItemsTech('ADVENTCacheRewardDeck');
	if (!IsResearchInHistory('ResistanceCacheRewardDeck')) AddSAVItemsTech('ResistanceCacheRewardDeck');
	if (!IsResearchInHistory('MiscSavageItemsRewardDeck')) AddSAVItemsTech('MiscSavageItemsRewardDeck');
	if (!IsResearchInHistory('AlienTechItemRewardDeck')) AddSAVItemsTech('AlienTechItemRewardDeck');
	if (!IsResearchInHistory('SAVWeaponsRewardDeck')) AddSAVItemsTech('SAVWeaponsRewardDeck');
	if (!IsResearchInHistory('SAVSkirmisherCacheRewardDeck')) AddSAVItemsTech('SAVSkirmisherCacheRewardDeck');
	if (!IsResearchInHistory('SAVTemplarCacheRewardDeck')) AddSAVItemsTech('SAVTemplarCacheRewardDeck');
	if (!IsResearchInHistory('SAVReaperCacheRewardDeck')) AddSAVItemsTech('SAVReaperCacheRewardDeck');
	if (!IsResearchInHistory('SAVDataCacheRewardDeck')) AddSAVItemsTech('SAVDataCacheRewardDeck');
	if (!IsResearchInHistory('SAVResistanceUtilityCacheUnlock')) AddSAVItemsTech('SAVResistanceUtilityCacheUnlock');
	if (!IsResearchInHistory('SAVResistanceUtilityCrateUnlock')) AddSAVItemsTech('SAVResistanceUtilityCrateUnlock');
	if (!IsResearchInHistory('SAVResistanceAmmoCrateUnlock')) AddSAVItemsTech('SAVResistanceAmmoCrateUnlock');
	if (!IsResearchInHistory('SAVResistanceExplosivesCrateUnlock')) AddSAVItemsTech('SAVResistanceExplosivesCrateUnlock');
	if (!IsResearchInHistory('SAVAdventHeavyCrateUnlock')) AddSAVItemsTech('SAVAdventHeavyCrateUnlock');
	if (!IsResearchInHistory('BreakthroughNanoShredderAmmo')) AddSAVItemsTech('BreakthroughNanoShredderAmmo');
	if (!IsResearchInHistory('BreakthroughNanoShredderGrenade')) AddSAVItemsTech('BreakthroughNanoShredderGrenade');
	if (!IsResearchInHistory('BreakthroughNanoCloner')) AddSAVItemsTech('BreakthroughNanoCloner');
	if (!IsResearchInHistory('NanoShredderAmmoMFG')) AddSAVItemsTech('NanoShredderAmmoMFG');
	if (!IsResearchInHistory('NanoShredderGrenadeMFG')) AddSAVItemsTech('NanoShredderGrenadeMFG');
	if (!IsResearchInHistory('NanoClonerMFG')) AddSAVItemsTech('NanoClonerMFG');
	if (!IsResearchInHistory('StudySAVAlienNanotech')) AddSAVItemsTech('StudySAVAlienNanotech');
	if (!IsResearchInHistory('StudySAVAlienEnergytech')) AddSAVItemsTech('StudySAVAlienEnergytech');
	if (!IsResearchInHistory('StudySAVAlienBiotech')) AddSAVItemsTech('StudySAVAlienBiotech');
	if (!IsResearchInHistory('StudySAVAlienCybertech')) AddSAVItemsTech('StudySAVAlienCybertech');
	if (!IsResearchInHistory('StudySAVAlienPsionictech')) AddSAVItemsTech('StudySAVAlienPsionictech');
	if (!IsResearchInHistory('SAVAlienCrate_AYTechUnlock')) AddSAVItemsTech('SAVAlienCrate_AYTechUnlock');
	if (!IsResearchInHistory('AlternativeHeavyWeaponsConcepts')) AddSAVItemsTech('AlternativeHeavyWeaponsConcepts');
	if (!IsResearchInHistory('SAVResistanceWeaponsCacheUnlock')) AddSAVItemsTech('SAVResistanceWeaponsCacheUnlock');
	if (!IsResearchInHistory('SAVLegacyWeaponsCrateUnlock')) AddSAVItemsTech('SAVLegacyWeaponsCrateUnlock');
	if (!IsResearchInHistory('SAVHunterWeaponsCrateUnlock')) AddSAVItemsTech('SAVHunterWeaponsCrateUnlock');
	if (!IsResearchInHistory('SAVUniqueWeaponsCrateUnlock')) AddSAVItemsTech('SAVUniqueWeaponsCrateUnlock');
	if (!IsResearchInHistory('SAVSkirmisherCacheUnlock')) AddSAVItemsTech('SAVSkirmisherCacheUnlock');
	if (!IsResearchInHistory('SAVTemplarCacheUnlock')) AddSAVItemsTech('SAVTemplarCacheUnlock');
	if (!IsResearchInHistory('SAVReaperCacheUnlock')) AddSAVItemsTech('SAVReaperCacheUnlock');
	if (!IsResearchInHistory('SAVSkirmisherCrateUnlock')) AddSAVItemsTech('SAVSkirmisherCrateUnlock');
	if (!IsResearchInHistory('SAVTemplarCrateUnlock')) AddSAVItemsTech('SAVTemplarCrateUnlock');
	if (!IsResearchInHistory('SAVReaperCrateUnlock')) AddSAVItemsTech('SAVReaperCrateUnlock');
	if (!IsResearchInHistory('SAVResistanceDataCacheUnlock')) AddSAVItemsTech('SAVResistanceDataCacheUnlock');
	if (!IsResearchInHistory('SAVUnlock_WatchList')) AddSAVItemsTech('SAVUnlock_WatchList');
	if (!IsResearchInHistory('SAVUnlock_SateliteData')) AddSAVItemsTech('SAVUnlock_SateliteData');
	if (!IsResearchInHistory('SAVUnlock_ResistanceNetworkData')) AddSAVItemsTech('SAVUnlock_ResistanceNetworkData');
	if (!IsResearchInHistory('SAVUnlock_PriorityData')) AddSAVItemsTech('SAVUnlock_PriorityData');
	if (!IsResearchInHistory('SAVUnlock_TacticalData')) AddSAVItemsTech('SAVUnlock_TacticalData');
	if (!IsResearchInHistory('StudySAVXenotechnology')) AddSAVItemsTech('StudySAVXenotechnology');
//UniqueUpgradeTechs
	if (!IsResearchInHistory('SAVEnhance_LilRipper')) AddSAVItemsTech('SAVEnhance_LilRipper');
	if (!IsResearchInHistory('SAVPerfect_LilRipper')) AddSAVItemsTech('SAVPerfect_LilRipper');
	if (!IsResearchInHistory('SAVPerfect_PrototypeLaserRifle')) AddSAVItemsTech('SAVPerfect_PrototypeLaserRifle');
	if (!IsResearchInHistory('SAVEnhance_HarpoonGun')) AddSAVItemsTech('SAVEnhance_HarpoonGun');
	if (!IsResearchInHistory('SAVPerfect_HarpoonGun')) AddSAVItemsTech('SAVPerfect_HarpoonGun');
	if (!IsResearchInHistory('SAVPerfect_Viperfang')) AddSAVItemsTech('SAVPerfect_Viperfang');
	if (!IsResearchInHistory('SAVEnhance_JaggedAxe')) AddSAVItemsTech('SAVEnhance_JaggedAxe');
	if (!IsResearchInHistory('SAVPerfect_JaggedAxe')) AddSAVItemsTech('SAVPerfect_JaggedAxe');
	if (!IsResearchInHistory('SAVEnhance_EndlessVengeance')) AddSAVItemsTech('SAVEnhance_EndlessVengeance');
	if (!IsResearchInHistory('SAVPerfect_EndlessVengeance')) AddSAVItemsTech('SAVPerfect_EndlessVengeance');
	if (!IsResearchInHistory('SAVEnhance_Quicksilver')) AddSAVItemsTech('SAVEnhance_Quicksilver');
	if (!IsResearchInHistory('SAVPerfect_Quicksilver')) AddSAVItemsTech('SAVPerfect_Quicksilver');
	if (!IsResearchInHistory('SAVEnhance_OpressorsEnd')) AddSAVItemsTech('SAVEnhance_OpressorsEnd');
	if (!IsResearchInHistory('SAVPerfect_OpressorsEnd')) AddSAVItemsTech('SAVPerfect_OpressorsEnd');
	if (!IsResearchInHistory('SAVPerfect_PrototypeLaserSniper')) AddSAVItemsTech('SAVPerfect_PrototypeLaserSniper');
}

//	if (!IsResearchInHistory('SAVUnlock_DoomReduction')) AddSAVItemsTech('SAVUnlock_DoomReduction');
// 	if (!IsResearchInHistory('SAVUnlock_ResistanceFactionData')) AddSAVItemsTech('SAVUnlock_ResistanceFactionData');

////////Techs Code////////
//CODE NABBED FROM IRIDAR AS USUAL!
static function AddSAVItemsTech(name TechName)
{
	local XComGameStateHistory History;
	local XComGameState NewGameState;
	local X2StrategyElementTemplateManager StrategyElementTemplateManager;
	local XComGameState_Tech TechState;
	local X2TechTemplate TechTemplate;

	History = `XCOMHISTORY;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Savage Items Techs");
	StrategyElementTemplateManager = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

	TechTemplate = X2TechTemplate(StrategyElementTemplateManager.FindStrategyElementTemplate(TechName));

	TechState = XComGameState_Tech(NewGameState.CreateStateObject(class'XComGameState_Tech'));
	TechState.OnCreation(TechTemplate);
	NewGameState.AddStateObject(TechState);
	History.AddGameStateToHistory(NewGameState);
}
//CODE NABBED FROM IRIDAR AS USUAL!
static function bool IsResearchInHistory(name ResearchName)
{
	// Check if we've already injected the tech templates
	local XComGameState_Tech	TechState;
	
	foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_Tech', TechState)
	{
		if ( TechState.GetMyTemplateName() == ResearchName )
		{
			return true;
		}
	}
	return false;
}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{}

/// <summary>
/// Called from XComGameState_Unit:GatherUnitAbilitiesForInit after the game has built what it believes is the full list of
/// abilities for the unit based on character, class, equipment, et cetera. You can add or remove abilities in SetupData.
/// </summary>
static event OnPostTemplatesCreated()
{
	class'X2TemplateHelper_SavageItems'.static.PatchSAVGremlins();
	class'X2TemplateHelper_SavageItems'.static.PatchSAVAnimations();
	EditEVAC();
	EditCarryUnit();
	EditLoot();
	EditInteract_PlantBomb();
	EditInteract_TakeVial();
	EditInteract_StasisTube();
	EditInteract_ActivateAscensionGate();
	EditInteract_ActivateSpark();
	EditInteract_AtmosphereComputer();
	EditInteract_UseElevator();
	EditInteract_MarkSupplyCrate();
	EditInteract_OpenChest();
	EditHack();
	EditHack_Chest();
	EditHack_Workstation();
	EditHack_ObjectiveChest();
	EditHack_ElevatorControl();
	EditShadowbind();
	EditShadowbindM2();
	AddLootTables();
}

static function EditEVAC()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Evac');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}

static function EditCarryUnit()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('CarryUnit');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}

static function EditLoot()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Loot');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}

static function EditInteract_PlantBomb()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Interact_PlantBomb');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}

static function EditInteract_TakeVial()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Interact_TakeVial');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}

static function EditInteract_StasisTube()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Interact_StasisTube');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}

static function EditInteract_ActivateAscensionGate()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Interact_ActivateAscensionGate');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}

static function EditInteract_ActivateSpark()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Interact_ActivateSpark');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}

static function EditInteract_AtmosphereComputer()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Interact_AtmosphereComputer');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}

static function EditInteract_UseElevator()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Interact_UseElevator');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}

static function EditInteract_MarkSupplyCrate()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Interact_MarkSupplyCrate');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}

static function EditInteract_OpenChest()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Interact_OpenChest');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}

static function EditHack()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Hack');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}

static function EditHack_Chest()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Hack_Chest');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}

static function EditHack_Workstation()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Hack_Workstation');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}

static function EditHack_ObjectiveChest()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Hack_ObjectiveChest');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}

static function EditHack_ElevatorControl()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitType								SAVUnitExclusions;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Hack_ElevatorControl');

	SAVUnitExclusions = new class'X2Condition_UnitType';
	SAVUnitExclusions.ExcludeTypes.AddItem('SAVGadgets');
	SAVUnitExclusions.ExcludeTypes.AddItem('NanoClone');
	Template.AbilityShooterConditions.AddItem(SAVUnitExclusions);
}


static function EditShadowbind()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitEffects							EffectsCondition;
	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('Shadowbind');
	EffectsCondition = new class'X2Condition_UnitEffects';
	EffectsCondition.AddExcludeEffect('SAVNanomachineCoating', 'AA_UnitIsImmune');
	Template.AbilityTargetConditions.AddItem(EffectsCondition);

}

static function EditShadowbindM2()
{
	local X2AbilityTemplateManager							AbilityManager;
	local X2AbilityTemplate									Template;
	local X2Condition_UnitEffects							EffectsCondition;
	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityManager.FindAbilityTemplate('ShadowbindM2');
	EffectsCondition = new class'X2Condition_UnitEffects';
	EffectsCondition.AddExcludeEffect('SAVNanomachineCoating', 'AA_UnitIsImmune');
	Template.AbilityTargetConditions.AddItem(EffectsCondition);

}

//Add items to Loot Tables
static function AddLootTables()
{
	local X2LootTableManager	LootManager;
	local LootTable				LootBag;
	local LootTableEntry		Entry;
	
	LootManager = X2LootTableManager(class'Engine'.static.FindClassDefaultObject("X2LootTableManager"));

	Foreach default.LootEntry(LootBag)
	{
		if ( LootManager.default.LootTables.Find('TableName', LootBag.TableName) != INDEX_NONE )
		{
			foreach LootBag.Loots(Entry)
			{
				class'X2LootTableManager'.static.AddEntryStatic(LootBag.TableName, Entry, false);
			}
		}	
	}
}
//===========================================================================================================================================================!!!KEEP!!!
//===========================================================================================================================================================!!!KEEP!!!
//===========================================================================================================================================================!!!KEEP!!!
static function FinalizeUnitAbilitiesForInit(XComGameState_Unit UnitState, out array<AbilitySetupData> SetupData, optional XComGameState StartState, optional XComGameState_Player PlayerState, optional bool bMultiplayerDisplay)
{
	local AbilitySetupData AbilityData;
	local array<AbilitySetupData> RemoveAbilities;
	local XComGameState_Item ItemState;
	local array<name> Explosives;

	Explosives.AddItem('HECharge');
	Explosives.AddItem('PlasmaCharge');
	Explosives.AddItem('IncendaryCharge');
	Explosives.AddItem('ToxinCharge');
	Explosives.AddItem('KrakCharge');
	Explosives.AddItem('ImplosionCharge');

	foreach SetupData(AbilityData)
	{
		if (AbilityData.Template.DataName == 'LaunchGrenade')
		{
			ItemState = XComGameState_Item(`XCOMHISTORY.GetGameStateForObjectID(AbilityData.SourceAmmoRef.ObjectID));
			// `LOG(UnitState.GetSoldierClassTemplateName() @ "Found " @ AbilityData.Template.DataName @ ItemState.GetMyTemplateName(),, 'TacticalX4');
			if (Explosives.Find(ItemState.GetMyTemplateName()) != INDEX_NONE) {
				RemoveAbilities.AddItem(AbilityData);
			}
		}
	}
	foreach RemoveAbilities(AbilityData)
	{
		SetupData.RemoveItem(AbilityData);
		`LOG("Removing " @ AbilityData.Template.DataName,, 'ExplosiveChargesLaunch');
	}
}
//===========================================================================================================================================================!!!KEEP!!!
//===========================================================================================================================================================!!!KEEP!!!
//===========================================================================================================================================================!!!KEEP!!!




/* - DOESNT WORK
static function FinalizeUnitAbilitiesForInit(XComGameState_Unit UnitState, out array<AbilitySetupData> SetupData, optional XComGameState StartState, optional XComGameState_Player PlayerState, optional bool bMultiplayerDisplay)
{
	local AbilitySetupData AbilityData;
	local array<AbilitySetupData> RemoveAbilities;
	local X2CharacterTemplate CharacterTemplate;
	local array<name> RemoveDefaultAbility;

	RemoveDefaultAbility.AddItem('CarryUnit');
	RemoveDefaultAbility.AddItem('PutDownUnit');
	RemoveDefaultAbility.AddItem('Loot');
	RemoveDefaultAbility.AddItem('Interact_PlantBomb');
	RemoveDefaultAbility.AddItem('Interact_TakeVial');
	RemoveDefaultAbility.AddItem('Interact_StasisTube');
	RemoveDefaultAbility.AddItem('Interact_ActivateAscensionGate');
	RemoveDefaultAbility.AddItem('Interact_ActivateSpark');
	RemoveDefaultAbility.AddItem('Interact_AtmosphereComputer');
	RemoveDefaultAbility.AddItem('Interact_UseElevator');
	RemoveDefaultAbility.AddItem('Interact_MarkSupplyCrate');
	RemoveDefaultAbility.AddItem('Interact_OpenChest');
	RemoveDefaultAbility.AddItem('EVAC');
	RemoveDefaultAbility.AddItem('LiftOffAvenger');
	RemoveDefaultAbility.AddItem('KnockoutSelf');
	RemoveDefaultAbility.AddItem('Hack');
	RemoveDefaultAbility.AddItem('Hack_Chest');
	RemoveDefaultAbility.AddItem('Hack_Workstation');
	RemoveDefaultAbility.AddItem('Hack_ObjectiveChest');
	RemoveDefaultAbility.AddItem('Hack_ElevatorControl');
	RemoveDefaultAbility.AddItem('FinalizeHack');
	RemoveDefaultAbility.AddItem('CancelHack');
	RemoveDefaultAbility.AddItem('MediumPlatedArmorStats');
	RemoveDefaultAbility.AddItem('HeavyPlatedArmorStats');
	RemoveDefaultAbility.AddItem('LightPlatedArmorStats');
	RemoveDefaultAbility.AddItem('MediumPoweredArmorStats');
	RemoveDefaultAbility.AddItem('HeavyPoweredArmorStats');
	RemoveDefaultAbility.AddItem('LightPoweredArmorStats');
	RemoveDefaultAbility.AddItem('Sustain');
	RemoveDefaultAbility.AddItem('SustainingSphereAbility');
	RemoveDefaultAbility.AddItem('SustainingSphereTriggeredAbility');

	foreach SetupData(AbilityData)
	{
		if (CharacterTemplate.DataName == 'BunkerModule')
		{
			UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(AbilityData.SourceAmmoRef.ObjectID));
			if (RemoveDefaultAbility.Find(UnitState.GetMyTemplateName()) != INDEX_NONE) 
			{
			RemoveAbilities.AddItem(AbilityData);
			}
		}
	}
	foreach RemoveAbilities(AbilityData)
	{
		SetupData.RemoveItem(AbilityData);
		`LOG("Removing " @ AbilityData.Template.DataName,, 'RemovingBunkerModuleAbility');
	}
}

static function FinalizeUnitAbilitiesForInit(XComGameState_Unit UnitState, out array<AbilitySetupData> SetupData, optional XComGameState StartState, optional XComGameState_Player PlayerState, optional bool bMultiplayerDisplay)
{
    local X2CharacterTemplateManager CharacterTemplateManager;
    local X2CharacterTemplate CharTemplate;
	local AbilitySetupData AbilityData;
    local array<X2DataTemplate> DataTemplates;
    local Name TemplateName;
	local array<AbilitySetupData> RemoveAbilities;

    CharacterTemplateManager = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();

	`Log("SAVITEMS_RemovingAbility");
    foreach default.CharTempsToRemoveDefaultAbilities(TemplateName)
	`Log("Template " $ TemplateName);	

		if (CharTemplate != none) 
		{
			UnitState = XComGameState_Unit(GameState.ModifyStateObject(class'XComGameState_Unit', ObjectID));
			if (default.RemoveDefaultAbilityArray.Find(UnitState.GetMyTemplateName()) != INDEX_NONE) 
			{
				RemoveAbilities.AddItem(AbilityData);		
			}
		}
  
	foreach RemoveAbilities(AbilityData)
	{
		SetupData.RemoveItem(AbilityData);
		`LOG("Removing " @ AbilityData.Template.DataName,, 'RemovingBunkerModuleAbility');
	}
}

*/
static function GetNumUtilitySlotsOverride(out int NumUtilitySlots, XComGameState_Item EquippedArmor, XComGameState_Unit UnitState, XComGameState CheckGameState)
{
	local name Ability;
	local X2EquipmentTemplate EquipmentTemplate;
	local array<XComGameState_Item> CurrentInventory;
	local XComGameState_Item InventoryItem;

	CurrentInventory = UnitState.GetAllInventoryItems(CheckGameState);
	foreach CurrentInventory(InventoryItem)
	{
		EquipmentTemplate = X2EquipmentTemplate(InventoryItem.GetMyTemplate());
		if (EquipmentTemplate != none)
		{
			foreach EquipmentTemplate.Abilities(Ability)
			{
				if (default.AbilityUnlocksAModUtilitySlot.Find(Ability) != INDEX_NONE)
				{
					NumUtilitySlots++;
				}
				if (default.AbilityUnlocksAModWebbingSlot.Find(Ability) != INDEX_NONE)
				{
					NumUtilitySlots++;
				}
				if (default.AbilityUnlocksLightVestSlot.Find(Ability) != INDEX_NONE)
				{
					NumUtilitySlots++;
				}
			}
		}
	}
}

static function GetNumHeavyWeaponSlotsOverride(out int NumHeavySlots, XComGameState_Unit UnitState, XComGameState CheckGameState)
{
	local name Ability;
	local X2EquipmentTemplate EquipmentTemplate;
	local array<XComGameState_Item> CurrentInventory;
	local XComGameState_Item InventoryItem;

	CurrentInventory = UnitState.GetAllInventoryItems(CheckGameState);
	foreach CurrentInventory(InventoryItem)
	{
		EquipmentTemplate = X2EquipmentTemplate(InventoryItem.GetMyTemplate());
		if (EquipmentTemplate != none)
		{
			foreach EquipmentTemplate.Abilities(Ability)
			{
				if (default.AbilityUnlocksAModHeavySlot.Find(Ability) != INDEX_NONE)
				{
					NumHeavySlots++;
				}
			}
		}
	}
}

//static function GetNumUtilitySlotsOverride(out int NumUtilitySlots, XComGameState_Item EquippedArmor, XComGameState_Unit UnitState, XComGameState CheckGameState)
//{
//	if (default.Utility_DRL_Occupies_Two_Slots && NumUtilitySlots > 1 && UnitHasUtilityDRLEquipped(UnitState))
//	{
		// If you ever have some kind of inventory operation that fails to fix the stat, you can manually call ValidateLoadout (or just RealizeItemSlotsCount, CHL only) (c) robojumper
//		NumUtilitySlots--;
//	}
//}


////////////////////////////////////////////////////////////////////////////////////////////
//The section below is responable for managing what items are allowed in the AModUtilitySlot
////////////////////////////////////////////////////////////////////////////////////////////

static function bool CanAddItemToInventory_CH_ImprovedAModMedicalslot(out int bCanAddItem, const EInventorySlot Slot, const X2ItemTemplate ItemTemplate, int Quantity, XComGameState_Unit UnitState, optional XComGameState CheckGameState, optional out string DisabledReason, optional XComGameState_Item ItemState)
{
    local X2EquipmentTemplate EquipmentTemplate;

    EquipmentTemplate = X2EquipmentTemplate(ItemTemplate);

    if (EquipmentTemplate != none)
    {
        //if (Slot == eInvSlot_Pistol && default.PistolCategories.Find(ItemTemplate.WeaponCat) != INDEX_NONE)
		if (Slot == eInvSlot_AModMedical && TriggerIsItemValidForAModMedicalSlot(ItemTemplate))
        {
            //    Allow the weapon to be equipped.
            DisabledReason = "";
			//This has been modified from a simple bCanAddItem = 1; to avoid the dreaded duplicate ability icons bug
			if (CheckGameState != none && UnitState.GetItemInSlot(Slot, CheckGameState) == none)
			{
				bCanAddItem = 1;
			}
            
            //    Override normal behavior.
            return CheckGameState != none;
        }
    }
    //    Do not override normal behavior.
    return CheckGameState == none;
}

static function bool TriggerIsItemValidForAModMedicalSlot(X2ItemTemplate ItemTemplate)
{
	local XComLWTuple OverrideTuple;

	OverrideTuple = new class'XComLWTuple';
	OverrideTuple.Id = 'IsItemValidForAModMedicalSlot';
    OverrideTuple.Data.Add(1);

    // Default to 'true' if the weapon's category is in the ItemCategories array
	OverrideTuple.Data[0].Kind = XComLWTVBool;
	OverrideTuple.Data[0].b = default.HealItemCatagories.Find(ItemTemplate.ItemCat) != INDEX_NONE;

	`XEVENTMGR.TriggerEvent(OverrideTuple.Id, OverrideTuple, ItemTemplate);

	return OverrideTuple.Data[0].b;
}
/*
static function UpdateAnimations(out array<AnimSet> CustomAnimSets, XComGameState_Unit UnitState, XComUnitPawn Pawn)
{
	class'X2TemplateHelper_SavageItems'.static.UpdateAnimations(CustomAnimSets, UnitState, Pawn);
}
*/

static function bool AbilityTagExpandHandler(string InString, out string OutString)
{
    local name TagText;

    TagText = name(InString);

    switch (TagText)
    {
	case 'MEDIPACK_PERUSEHP':
			OutString = string(class'X2Ability_SavItemAbilities_Core'.default.MEDIPACK_PERUSEHP);
        return true;
	case 'SAVREGEN_REGEN_AMOUNT':
			OutString = string(class'X2Ability_SavItemAbilities_Core'.default.SAVREGEN_REGEN_AMOUNT);
        return true;
	case 'SAVREGEN2_REGEN_AMOUNT':
			OutString = string(class'X2Ability_SavItemAbilities_Core'.default.SAVREGEN2_REGEN_AMOUNT);
        return true;
	case 'SAVREGEN_NANOREGEN_AMOUNT':
			OutString = string(class'X2Ability_SavItemAbilities_Core'.default.SAVREGEN_NANOREGEN_AMOUNT);
        return true;
	case 'HPTAMMO_CRITCHANCE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HPTAMMO_CRITCHANCE);
        return true;
	case 'HPTAMMO_CRITDAMAGE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HPTAMMO_CRITDAMAGE);
        return true;
	case 'HPTAMMO_FULLCOVER_CRITCHANCE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HPTAMMO_FULLCOVER_CRITCHANCE);
        return true;
	case 'HPTAMMO_FULLCOVER_CRITDAMAGE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HPTAMMO_FULLCOVER_CRITDAMAGE);
        return true;
	case 'HPTAMMO_ARMORED_CRITCHANCE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HPTAMMO_ARMORED_CRITCHANCE);
        return true;
	case 'HPTAMMO_ARMORED_CRITDAMAGE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HPTAMMO_ARMORED_CRITDAMAGE);
        return true;
	case 'DUMBTRACER_AIM':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.DUMBTRACER_AIM);
        return true;
	case 'DUMBTRACER_AUTOMATICS_AIM':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.DUMBTRACER_AUTOMATICS_AIM);
        return true;
	case 'DUMBTRACER_AUTOMATICS_REACTIONAIM':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.DUMBTRACER_AUTOMATICS_REACTIONAIM);
        return true;
	case 'DUMBTRACER_FULLAUTO_AIM':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.DUMBTRACER_FULLAUTO_AIM);
        return true;
	case 'DUMBTRACER_SHOOTER_DEFENCEDEBUFF':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.DUMBTRACER_SHOOTER_DEFENCEDEBUFF);
        return true;
	case 'DUMBTRACER_TARGETED_DEFENCEDEBUFF':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.DUMBTRACER_TARGETED_DEFENCEDEBUFF);
        return true;
	case 'HVAP_NOCOVER_AP':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HVAP_NOCOVER_AP);
        return true;
	case 'HVAP_NOCOVER_CRITDAM':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HVAP_NOCOVER_CRITDAM);
        return true;
	case 'HVAP_NOCOVER_CRITCHANCE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HVAP_NOCOVER_CRITCHANCE);
        return true;
	case 'HVAP_HIGHACCURACYSINGLESHOT_AP':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HVAP_HIGHACCURACYSINGLESHOT_AP);
        return true;
	case 'IGNITIONROUNDS_DAMAGE':
			OutString = string(class'X2Item_SavageStockAmmo'.default.IGNITIONROUNDS_DAMAGE);
        return true;
	case 'IGNITIONROUNDS_CHANCE_PERCENT':
			OutString = string(class'X2Item_SavageStockAmmo'.default.IGNITIONROUNDS_CHANCE_PERCENT);
        return true;
	case 'HIGHCAL_SMLCALDAM_CV':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HIGHCAL_SMLCALDAM_CV);
        return true;
	case 'HIGHCAL_MEDCALDAM_CV':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HIGHCAL_MEDCALDAM_CV);
        return true;
	case 'HIGHCAL_HICALDAM_CV':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HIGHCAL_HICALDAM_CV);
        return true;
	case 'HIGHCAL_HICALAP_CV':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HIGHCAL_HICALAP_CV);
        return true;
	case 'HIGHCAL_RECOILAIM':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HIGHCAL_RECOILAIM);
        return true;
	case 'HIGHCAL_RECOILWILLLOSS':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HIGHCAL_RECOILWILLLOSS);
        return true;
	case 'HEROUNDS_CRITDAMAGE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HEROUNDS_CRITDAMAGE);
        return true;
	case 'HEROUNDS_CRITCHANCE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HEROUNDS_CRITCHANCE);
        return true;
	case 'HEROUNDS_HICAL_SHRED':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HEROUNDS_HICAL_SHRED);
        return true;
	case 'HEROUNDS_SMLCAL_DAMAGE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HEROUNDS_SMLCAL_DAMAGE);
        return true;
	case 'HEROUNDS_RUPTURE_DAMAGE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HEROUNDS_RUPTURE_DAMAGE);
        return true;
	case 'HEROUNDS_RUPTURE_DURATION':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HEROUNDS_RUPTURE_DURATION);
        return true;
	case 'XSTUN_DAMAGEMOD':
			OutString = string(class'X2Item_SavageStockAmmo'.default.XSTUN_DAMAGEMOD);
        return true;
	case 'XSTUNROUNDS_ROBOTBONUSDMAGE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.XSTUNROUNDS_ROBOTBONUSDMAGE);
        return true;
	case 'XSTUN_STUNVALUE':
			OutString = string(class'X2Item_SavageStockAmmo'.default.XSTUN_STUNVALUE);
        return true;
	case 'XSTUN_STUNCHANCE':
			OutString = string(class'X2Item_SavageStockAmmo'.default.XSTUN_STUNCHANCE);
        return true;
	case 'AAJ_CRIT':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.AAJ_CRIT);
        return true;
	case 'AAJ_CRITCHANCE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.AAJ_CRITCHANCE);
        return true;
	case 'AAJ_AP':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.AAJ_AP);
        return true;
	case 'COVERPIERCING_HIGHACCURACYSINGLE_AP':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.COVERPIERCING_HIGHACCURACYSINGLE_AP);
        return true;
	case 'AAJDE_AP':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.AAJDE_AP);
        return true;
	case 'AAJDE_SHRED':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.AAJDE_SHRED);
        return true;
	case 'AAJDE_HVYAP':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.AAJDE_HVYAP);
        return true;
	case 'AAJDE_HVYSHRED':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.AAJDE_HVYSHRED);
        return true;
	case 'PLASMABURSTROUNDS_RUPTURE_DAMAGE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.PLASMABURSTROUNDS_RUPTURE_DAMAGE);
        return true;
	case 'PLASMABURSTROUNDS_RUPTURE_DURTION':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.PLASMABURSTROUNDS_RUPTURE_DURTION);
        return true;
	case 'PLASMABURSTROUNDS_ALLSHOTS_SHRED':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.PLASMABURSTROUNDS_ALLSHOTS_SHRED);
        return true;
	case 'PLASMABURSTROUNDS_ALLSHOTS_CRITDAMAGE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.PLASMABURSTROUNDS_ALLSHOTS_CRITDAMAGE);
        return true;
	case 'PLASMABURSTROUNDS_ALLSHOTS_CRITCHANCE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.PLASMABURSTROUNDS_ALLSHOTS_CRITCHANCE);
        return true;
	case 'PLASMABURSTROUNDS_HICAL_SHRED':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.PLASMABURSTROUNDS_HICAL_SHRED);
        return true;
	case 'PLASMABURSTROUNDS_SMALLCAL_DAMAGE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.PLASMABURSTROUNDS_SMALLCAL_DAMAGE);
        return true;
	case 'PLASMABURSTROUNDS_SMALLCAL_CRITCHANCE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.PLASMABURSTROUNDS_SMALLCAL_CRITCHANCE);
        return true;
	case 'DISRUPTORROUNDS_STUNVALUE':
			OutString = string(class'X2Item_SavageStockAmmo'.default.DISRUPTORROUNDS_STUNVALUE);
        return true;
	case 'DISRUPTORROUNDS_STUNCHANCE':
			OutString = string(class'X2Item_SavageStockAmmo'.default.DISRUPTORROUNDS_STUNCHANCE);
        return true;
	case 'DISRUPTORROUNDS_MENTALDISRUPTION_DURATION':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.DISRUPTORROUNDS_MENTALDISRUPTION_DURATION);
        return true;
 	case 'SMARTROUNDS_AUTOPSY_CRITCHANCE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.SMARTROUNDS_AUTOPSY_CRITCHANCE);
        return true;
	case 'SMARTROUNDS_AUTOPSY_CRITDAMAGE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.SMARTROUNDS_AUTOPSY_CRITDAMAGE);
        return true;
	case 'HOTSHOTROUNDS_BURNING_BASEDAMAGE':
			OutString = string(class'X2Item_SavageStockAmmo'.default.HOTSHOTROUNDS_BURNING_BASEDAMAGE);
        return true;
	case 'HOTSHOTROUNDS_ACIDBURN_BASEDAMAGE':
			OutString = string(class'X2Item_SavageStockAmmo'.default.HOTSHOTROUNDS_ACIDBURN_BASEDAMAGE);
        return true;
	case 'HOTSHOTROUNDS_ALLSHOTS_AIM':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HOTSHOTROUNDS_ALLSHOTS_AIM);
        return true;
	case 'HOTSHOTROUNDS_ALLSHOTS_SHRED':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HOTSHOTROUNDS_ALLSHOTS_SHRED);
        return true;
	case 'BUTCHERROUNDS_BIOLOGICALTARGET_CRITCHANCE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.BUTCHERROUNDS_BIOLOGICALTARGET_CRITCHANCE);
        return true;
	case 'BUTCHERROUNDS_BIOLOGICALTARGET_CRITDAMAGE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.BUTCHERROUNDS_BIOLOGICALTARGET_CRITDAMAGE);
        return true;
	case 'BUTCHERROUNDS_AUTOPSYBONUS_DAMAGE_CV':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.BUTCHERROUNDS_AUTOPSYBONUS_DAMAGE_CV);
	    return true;
	case 'BREACHBUSTER_ALLPRIMARYWEAPONS_DAMAGE_CV':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.BREACHBUSTER_ALLPRIMARYWEAPONS_DAMAGE_CV);
        return true;
	case 'BREACHBUSTER_HIGHCALBONUS_AP_CV':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.BREACHBUSTER_HIGHCALBONUS_AP_CV);
        return true;
	case 'BREACHBUSTER_HIGHCALBONUS_DAMAGE_CV':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.BREACHBUSTER_HIGHCALBONUS_DAMAGE_CV);
        return true;
	case 'BREACHBUSTER_ALLPRIMARYWEAPONS_RECOIL_AIM':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.BREACHBUSTER_ALLPRIMARYWEAPONS_RECOIL_AIM);
        return true;
	case 'BREACHBUSTER_AUTOMATICWEAPONS_RECOIL_AIM':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.BREACHBUSTER_AUTOMATICWEAPONS_RECOIL_AIM);
        return true;
	case 'BREACHBUSTER_RECOIL_WILLDRAIN':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.BREACHBUSTER_RECOIL_WILLDRAIN);
        return true;
	case 'SKULLSPLITTER_PRIMARYWEAPONS_CRITCHANCE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.SKULLSPLITTER_PRIMARYWEAPONS_CRITCHANCE);
        return true;
	case 'SKULLSPLITTER_PRIMARYWEAPONS_CRITDAMAGE':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.SKULLSPLITTER_PRIMARYWEAPONS_CRITDAMAGE);
        return true;
	case 'MILSPECROUNDS_AIM_CV':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.MILSPECROUNDS_AIM_CV);
        return true;
	case 'MILSPECROUNDS_CRITCHANCE_CV':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.MILSPECROUNDS_CRITCHANCE_CV);
        return true;
	case 'MILSPECROUNDS_CRITDAMAGE_CV':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.MILSPECROUNDS_CRITDAMAGE_CV);
        return true;
	case 'MILSPECROUNDS_DAMAGE_CV':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.MILSPECROUNDS_DAMAGE_CV);
        return true;
	case 'ALIENPOWERPACK_AIM_BM':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.ALIENPOWERPACK_AIM_BM);
        return true;
	case 'ALIENPOWERPACK_CRITCHANCE_BM':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.ALIENPOWERPACK_CRITCHANCE_BM);
        return true;
	case 'ALIENPOWERPACK_CRITDAMAGE_BM':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.ALIENPOWERPACK_CRITDAMAGE_BM);
        return true;
	case 'ALIENPOWERPACK_DAMAGE_BM':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.ALIENPOWERPACK_DAMAGE_BM);
        return true;
	case 'ALIENPOWERPACK_AP_BM':
			OutString = string(class'X2Ability_SavageStockItemAmmoAbilitySet'.default.ALIENPOWERPACK_AP_BM);
        return true;
    default:
			return false;
    }  
}