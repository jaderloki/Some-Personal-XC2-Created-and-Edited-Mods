class X2StrategyElement_SavageItemsTechs extends X2StrategyElement_XpackTechs config(GameData);

//NEW TECHS//
var config int SPECTRE_COST_NANOTECHWAR;
var config int BIOSAMPLE_COST_XENOSERUMRESEARCH;

var config int SUPPLY_COST_NANOJACKMFG;
var config int ALLOY_COST_NANOJACKMFG;
var config int SPECTRE_COST_NANOJACKMFG;

var config int SUPPLY_COST_NANOHACKERMFG;
var config int ELERIUM_COST_NANOHACKERMFG;
var config int SPECTRE_COST_NANOHACKERMFG;

var config int SUPPLY_COST_NANOREGENMFG;
var config int SPECTRE_COST_NANOREGENMFG;

var config int SUPPLY_COST_NANOAMODMFG;
var config int SPECTRE_COST_NANOAMODMFG;
var config int ALLOY_COST_NANOAMODMFG;

var config int SUPPLY_COST_NANOSHREDROUNDSMFG;
var config int SPECTRE_COST_NANOSHREDROUNDSMFG;
var config int ECORE_COST_NANOSHREDROUNDSMFG;

var config int SUPPLY_COST_NANOSHREDGRENADEMFG;
var config int SPECTRE_COST_NANOSHREDGRENADEMFG;
var config int ECORE_COST_NANOSHREDGRENADEMFG;

var config int SUPPLY_COST_NANOCLONERMFG;
var config int SPECTRE_COST_NANOCLONERMFG;

//OLD TECHS//
var config int ECORE_COST_ALTHEAVYWEAPONS;
//AMMOS
var config int SUPPLY_COST_AAJMFG;
var config int ALLOY_COST_AAJMFG;
var config int ECORE_COST_AAJMFG;

var config int SUPPLY_COST_DEPELERIUMMFG;
var config int ALLOY_COST_DEPELERIUMMFG;
var config int ELERIUM_COST_DEPELERIUMMFG;
var config int ECORE_COST_DEPELERIUMMFG;

var config int SUPPLY_COST_DISRUPTORMFG;
var config int ECORE_COST_DISRUPTORMFG;

var config int SUPPLY_COST_SEEKERMFG;
var config int ALLOY_COST_SEEKERMFG;
var config int ELERIUM_COST_SEEKERMFG;
var config int ECORE_COST_SEEKERMFG;

var config int SUPPLY_COST_HOTSHOTMFG;
var config int ECORE_COST_HOTSHOTMFG;
var config int ANDROMEDON_COST_HOTSHOTMFG;

var config int SUPPLY_COST_PLASMABIRSTMFG;
var config int ALLOY_COST_PLASMABIRSTMFG;
var config int ELERIUM_COST_PLASMABIRSTMFG;
var config int ECORE_COST_PLASMABIRSTMFG;

//AMODS
var config int SUPPLY_COST_PLATEDAMODMFG;
var config int ALLOY_COST_PLATEDAMODMFG;
var config int ECORE_COST_PLATEDAMODMFG;

var config int SUPPLY_COST_POWEREDAMODMFG;
var config int ALLOY_COST_POWEREDAMODMFG;
var config int ELERIUM_COST_POWEREDAMODMFG;
var config int ECORE_COST_POWEREDAMODMFG;

var config int SUPPLY_COST_SOLICEAMODMFG;
var config int ALLOY_COST_SOLICEAMODMFG;
var config int ELERIUM_COST_SOLICEAMODMFG;
var config int ECORE_COST_SOLICEAMODMFG;

var config int SUPPLY_COST_DEFFIELDAMODMFG;
var config int ALLOY_COST_DEFFIELDAMODMFG;
var config int ELERIUM_COST_DEFFIELDAMODMFG;
var config int ECORE_COST_DEFFIELDAMODMFG;

var config int SUPPLY_COST_WRAITHAMODMFG;
var config int ALLOY_COST_WRAITHAMODMFG;
var config int ELERIUM_COST_WRAITHAMODMFG;
var config int ECORE_COST_WRAITHAMODMFG;

//MISC
var config int SUPPLY_COST_EXPLOSIVECHARGESMFG;
var config int ELERIUM_COST_EXPLOSIVECHARGESMFG;
var config int ECORE_COST_EXPLOSIVECHARGESMFG;

var config int SUPPLY_COST_REPAIRKIT_UPGRADE;
var config int ECORE_COST_REPAIRKIT_UPGRADE;
var config int ALLOY_COST_REPAIRKIT_UPGRADE;

var config int SUPPLY_COST_COMMANDDESIGNATOR_UPGRADE;
var config int ALLOY_COST_COMMANDDESIGNATOR_UPGRADE;
var config int ELERIUM_COST_COMMANDDESIGNATOR_UPGRADE;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//New Techs
Techs.AddItem(CreateTechNanotechWarfare());//
Techs.AddItem(CreateSavTechXenoSerumSynthesis());//
//New Breakthroughs
Techs.AddItem(CreateBreakthroughThinkingMicroMachines());
Techs.AddItem(CreateBreakthroughNanotechRegeneration());
Techs.AddItem(CreateBreakthroughNanoReactiveAMod());
Techs.AddItem(CreateBreakthroughNanoShredderAmmo());
Techs.AddItem(CreateBreakthroughNanoShredderGrenade());
Techs.AddItem(CreateBreakthroughNanoCloner());
Techs.AddItem(CreateBreakthroughSerumVIOLET());
Techs.AddItem(CreateBreakthroughSerumORANGE());
Techs.AddItem(CreateBreakthroughSerumGREEN());
//New Proving Grounds Projects
Techs.AddItem(CreateNANOJACKMFG());
Techs.AddItem(CreateNanosynapticHackingDeviceMFG());
Techs.AddItem(CreateNanoRegenMFG());
Techs.AddItem(CreateNanoReactiveAModMFG());
Techs.AddItem(CreateNanoShredderAmmoMFG());
Techs.AddItem(CreateNanoShredderGrenadeMFG());
Techs.AddItem(CreateNanoClonerMFG());
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Techs
Techs.AddItem(CreateTechPsionicFieldTheory());
Techs.AddItem(CreateAdvancedExperimentalAmmunitionConcepts());
Techs.AddItem(CreateTechAlternativeHeavyWeaponsConcepts());
//AyTechs
Techs.AddItem(CreateTechStudySAVAlienNanotech());
Techs.AddItem(CreateTechStudySAVAlienEnergytech());
Techs.AddItem(CreateTechStudySAVAlienBiotech());
Techs.AddItem(CreateTechStudySAVAlienCybertech());
Techs.AddItem(CreateTechStudySAVAlienPsionictech());
//Breakthroughs
//Ammo
Techs.AddItem(CreateBreakthroughDepleatedEleriumTemplate());
Techs.AddItem(CreateBreakthroughDisruptionTemplate());
Techs.AddItem(CreateBreakthroughSmartSeekerTemplate());
Techs.AddItem(CreateBreakthroughHotShotTemplate());
Techs.AddItem(CreateBreakthroughPlasmaBurstTemplate());
//AMods
Techs.AddItem(CreateBreakthroughTranquilityGenTemplate());
Techs.AddItem(CreateBreakthroughDefenceFieldGenTemplate());
Techs.AddItem(CreateBreakthroughWraithGenTemplate());
//Misc
Techs.AddItem(CreateBreakthroughAdvancedHandScannersTemplate());
Techs.AddItem(CreateBreakthroughAdvancedSensorySystemsTemplate());

//Proving Grounds Projects
//Ammo
Techs.AddItem(CreateAlloyJacketedMFG());
Techs.AddItem(CreateDepleatedEleriumMFG());
Techs.AddItem(CreateDisruptionMFG());
Techs.AddItem(CreateSmartSeekerMFG());
Techs.AddItem(CreateHotShotMFG());
Techs.AddItem(CreatePlasmaBurstMFG());
//AMods
Techs.AddItem(CreatePlatedAModMFG());
Techs.AddItem(CreatePoweredAModMFG());
Techs.AddItem(CreateTranquilityGenMFG());
Techs.AddItem(CreateDefenceFieldGenMFG());
Techs.AddItem(CreateWraithGenMFG());
//Misc
Techs.AddItem(CreateAdvancedExplosiveChargeMFG());
Techs.AddItem(CreateAdvancedRepairKitsUpgrade());
Techs.AddItem(CreateComDesiMK2Upgrade());

//Drones - Disabled for now.
//Techs.AddItem(CreateCombatDronesMFG());//Placeholder Image
//Techs.AddItem(CreateAdvancedDronesUpgrade());//Placeholder Image

//Dummy techs
Techs.AddItem(CreateAlienCacheRewardDeck());
Techs.AddItem(CreateADVENTCacheRewardDeck());
Techs.AddItem(CreateResistanceCacheRewardDeck());
Techs.AddItem(CreateMiscSavageItemsRewardDeck());

	return Techs;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//NANOTECH WARFARE
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////Tech////
static function X2DataTemplate CreateTechNanotechWarfare()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'TechNanotechWarfare');
	Template.PointsToComplete = 4000;
	Template.SortingTier = 1;
	Template.strImage = "img://UILibrary_SavageItems.TECH_NanotechWarfare";

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AutopsySpectre');
	Template.Requirements.RequiredTechs.AddItem('Skulljack');
	Template.Requirements.RequiredTechs.AddItem('StudySAVAlienNanotech');

	Template.Requirements.RequiredItems.AddItem('SAVAlienNanotech');
	Template.Requirements.bVisibleIfTechsNotMet = false;

	// Costs
	Artifacts.ItemTemplateName = 'SAVAlienNanotech';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Artifacts.ItemTemplateName = 'CorpseSpectre';
	Artifacts.Quantity = default.SPECTRE_COST_NANOTECHWAR;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSavTechXenoSerumSynthesis()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SavTechXenoSerumSynthesis');
	Template.PointsToComplete = 4000;
	Template.SortingTier = 1;
	Template.strImage = "img://UILibrary_SavageItems.TECH_XenoSerumSynthesis";

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AutopsyBerserker');
	Template.Requirements.RequiredTechs.AddItem('StudySAVAlienBiotech');

	Template.Requirements.RequiredItems.AddItem('SAVAlienBiotech');
	Template.Requirements.bVisibleIfTechsNotMet = false;

	Artifacts.ItemTemplateName = 'SAVAlienBiotech';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Artifacts.ItemTemplateName = 'SavBioSample';
	Artifacts.Quantity = default.BIOSAMPLE_COST_XENOSERUMRESEARCH;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

////BTs/////
static function X2DataTemplate CreateBreakthroughThinkingMicroMachines()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughThinkingMicroMachines');
	Template.strImage = "img:///UILibrary_SavageItems.UIBreakthroughNanotechWarfare";

	Template.Requirements.RequiredTechs.AddItem('TechNanotechWarfare');

	return Template;
}

static function X2DataTemplate CreateBreakthroughNanotechRegeneration()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughNanotechRegeneration');
	Template.strImage = "img:///UILibrary_SavageItems.UIBreakthroughNanotechWarfare";

	Template.ResearchCompletedFn = UpgradeItems;

	Template.Requirements.RequiredTechs.AddItem('TechNanotechWarfare');

	return Template;
}

static function X2DataTemplate CreateBreakthroughNanoReactiveAMod()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughNanoReactiveAMod');
	Template.strImage = "img:///UILibrary_SavageItems.UIBreakthroughNanotechWarfare";

	Template.ResearchCompletedFn = UpgradeItems;

	Template.Requirements.RequiredTechs.AddItem('TechNanotechWarfare');

	return Template;
}


static function X2DataTemplate CreateBreakthroughNanoShredderAmmo()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughNanoShredderAmmo');
	Template.strImage = "img:///UILibrary_SavageItems.UIBreakthroughNanotechWarfare";

	Template.ResearchCompletedFn = UpgradeItems;

	Template.Requirements.RequiredTechs.AddItem('TechNanotechWarfare');

	return Template;
}

static function X2DataTemplate CreateBreakthroughNanoShredderGrenade()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughNanoShredderGrenade');
	Template.strImage = "img:///UILibrary_SavageItems.UIBreakthroughNanotechWarfare";

	Template.ResearchCompletedFn = UpgradeItems;

	Template.Requirements.RequiredTechs.AddItem('TechNanotechWarfare');

	return Template;
}

static function X2DataTemplate CreateBreakthroughNanoCloner()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughNanoCloner');
	Template.strImage = "img:///UILibrary_SavageItems.UIBreakthroughNanotechWarfare";

	Template.ResearchCompletedFn = UpgradeItems;

	Template.Requirements.RequiredTechs.AddItem('TechNanotechWarfare');
	Template.Requirements.RequiredTechs.AddItem('BreakthroughNanoCloner');// This is a temporary blocker since the item isn't ready as of 0.5
	return Template;
}

static function X2DataTemplate CreateBreakthroughSerumVIOLET()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughSerumVIOLET');
	Template.strImage = "img:///UILibrary_SavageItems.UIBreakthroughSerums";

	Template.ResearchCompletedFn = UpgradeItems;

	Template.Requirements.RequiredTechs.AddItem('SavTechXenoSerumSynthesis');
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventPriest');
	Template.Requirements.RequiredTechs.AddItem('AutopsySectoid');
	

	return Template;
}

static function X2DataTemplate CreateBreakthroughSerumORANGE()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughSerumORANGE');
	Template.strImage = "img:///UILibrary_SavageItems.UIBreakthroughSerums";

	Template.ResearchCompletedFn = UpgradeItems;

	Template.Requirements.RequiredTechs.AddItem('SavTechXenoSerumSynthesis');
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventShieldbearer');
	Template.Requirements.RequiredTechs.AddItem('AutopsyBerserker');

	return Template;
}

static function X2DataTemplate CreateBreakthroughSerumGREEN()
{
	local X2TechTemplate Template;
	
	Template = CreateBreakthroughTechTemplate('BreakthroughSerumGREEN');
	Template.strImage = "img:///UILibrary_SavageItems.UIBreakthroughSerums";

	Template.ResearchCompletedFn = UpgradeItems;

	Template.Requirements.RequiredTechs.AddItem('SavTechXenoSerumSynthesis');
	Template.Requirements.RequiredTechs.AddItem('AutopsyAndromedon');
	Template.Requirements.RequiredTechs.AddItem('AutopsyViper');

	return Template;
}

////PGs/////
static function X2DataTemplate CreateNANOJACKMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'NANOJACKMFG');
	Template.PointsToComplete = StafferXDays(1, 10);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_NANOJACK";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.Requirements.RequiredTechs.AddItem('TechNanotechWarfare');

	// Item Reward
	Template.ItemRewards.AddItem('SAVNanoSKULLJACK');

	// Cost
	 Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_NANOJACKMFG;
 	Template.Cost.ResourceCosts.AddItem(Resources);
 
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.ALLOY_COST_NANOJACKMFG;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'CorpseSpectre';
	Artifacts.Quantity = default.SPECTRE_COST_NANOJACKMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateNanosynapticHackingDeviceMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'NanosynapticHackingDeviceMFG');
	Template.PointsToComplete = StafferXDays(1, 12);
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PG_NanotechHackTool";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughThinkingMicroMachines');

	// Item Reward
	Template.ItemRewards.AddItem('NanoHackTool');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_NANOHACKERMFG;
 	Template.Cost.ResourceCosts.AddItem(Resources);

	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = default.SUPPLY_COST_NANOHACKERMFG;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'CorpseSpectre';
	Artifacts.Quantity = default.SPECTRE_COST_NANOHACKERMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateNanoRegenMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'NanoRegenMFG');
	Template.PointsToComplete = StafferXDays(1, 12);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_Nanoregen";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughNanotechRegeneration');

	// Item Reward
	Template.ItemRewards.AddItem('SavNaniteRegen');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_NANOREGENMFG;
 	Template.Cost.ResourceCosts.AddItem(Resources);
 
	Artifacts.ItemTemplateName = 'CorpseSpectre';
	Artifacts.Quantity = default.SPECTRE_COST_NANOREGENMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateNanoReactiveAModMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'NanoReactiveAModMFG');
	Template.PointsToComplete = StafferXDays(1, 10);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_NanoPlatingAmod";
	Template.bProvingGround = true;
	Template.bArmor = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughNanoReactiveAMod');

	// Item Reward
	Template.ItemRewards.AddItem('SAVReactiveNanoArmor');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_NANOAMODMFG;
 	Template.Cost.ResourceCosts.AddItem(Resources);
 
	Artifacts.ItemTemplateName = 'CorpseSpectre';
	Artifacts.Quantity = default.SPECTRE_COST_NANOAMODMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.ALLOY_COST_NANOAMODMFG;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateNanoShredderAmmoMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'NanoShredderAmmoMFG');
	Template.PointsToComplete = StafferXDays(1, 10);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_NanoShredderAmmo";
	Template.bProvingGround = true;
	Template.bRandomAmmo = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughNanoShredderAmmo');

	// Item Reward
	Template.ItemRewards.AddItem('SAVNanoShredderRounds');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_NANOSHREDROUNDSMFG;
 	Template.Cost.ResourceCosts.AddItem(Resources);
 
	Artifacts.ItemTemplateName = 'CorpseSpectre';
	Artifacts.Quantity = default.SPECTRE_COST_NANOSHREDROUNDSMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ECORE_COST_NANOSHREDROUNDSMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateNanoShredderGrenadeMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'NanoShredderGrenadeMFG');
	Template.PointsToComplete = StafferXDays(1, 10);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_NanoShredderGrenade";
	Template.bProvingGround = true;
	Template.bRandomGrenade = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughNanoShredderGrenade');
	
	// Item Reward
	Template.ItemRewards.AddItem('SAVNanoShredderGrenade');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_NANOSHREDGRENADEMFG;
 	Template.Cost.ResourceCosts.AddItem(Resources);
 
	Artifacts.ItemTemplateName = 'CorpseSpectre';
	Artifacts.Quantity = default.SPECTRE_COST_NANOSHREDGRENADEMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ECORE_COST_NANOSHREDGRENADEMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateNanoClonerMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'NanoClonerMFG');
	Template.PointsToComplete = StafferXDays(1, 12);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_NanoPlatingAmod";//=============================================NEEDS ICON
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughNanoCloner');

	// Item Reward
	Template.ItemRewards.AddItem('SAVNanoCloner');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_NANOCLONERMFG;
 	Template.Cost.ResourceCosts.AddItem(Resources);
 
	Artifacts.ItemTemplateName = 'CorpseSpectre';
	Artifacts.Quantity = default.SPECTRE_COST_NANOCLONERMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//TECHNOLOGIES
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

static function X2DataTemplate CreateTechPsionicFieldTheory()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'TechPsionicFieldTheory');
	Template.PointsToComplete = 4000;
	Template.SortingTier = 1;
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PsionicFieldTheory";

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('Psionics');
	Template.Requirements.RequiredTechs.AddItem('StudySAVAlienPsionictech');

	Template.Requirements.RequiredItems.AddItem('SAVAlienPsionictech');
	Template.Requirements.bVisibleIfTechsNotMet = false;

	Artifacts.ItemTemplateName = 'SAVAlienPsionictech';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateAdvancedExperimentalAmmunitionConcepts()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AdvancedExperimentalAmmunitionConcepts');
	Template.PointsToComplete = 4000;
	Template.SortingTier = 1;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_AdvExperimentalAmmo";

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('Tech_Elerium');
	Template.Requirements.RequiredTechs.AddItem('StudySAVAlienEnergytech');

	Template.Requirements.RequiredItems.AddItem('SAVAlienEnergytech');
	Template.Requirements.bVisibleIfTechsNotMet = false;

	Artifacts.ItemTemplateName = 'SAVAlienEnergytech';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateTechAlternativeHeavyWeaponsConcepts()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AlternativeHeavyWeaponsConcepts');
	Template.PointsToComplete = 2500;
	Template.SortingTier = 2;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_AlternativeHeavyWeapons";

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('ModularWeapons');
	Template.Requirements.RequiredTechs.AddItem('AlternativeHeavyWeaponsConcepts');//===================REMOVEREMOVEREMOVE
	Template.Requirements.bVisibleIfTechsNotMet = false;
	Template.Requirements.RequiredFacilities.AddItem('ProvingGround');

	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ECORE_COST_ALTHEAVYWEAPONS;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

/////////////////////////////////
//AyTechs
/////////////////////////////////
static function X2DataTemplate CreateTechStudySAVAlienNanotech()
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'StudySAVAlienNanotech');
	Template.PointsToComplete = 4500;
	Template.SortingTier = 1;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_Ay_Nanotech";

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVAlienNanotech');
	Template.Requirements.bVisibleIfTechsNotMet = false;

	return Template;
}

static function X2DataTemplate CreateTechStudySAVAlienEnergytech()
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'StudySAVAlienEnergytech');
	Template.PointsToComplete = 4500;
	Template.SortingTier = 1;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_Ay_Power";

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVAlienEnergytech');
	Template.Requirements.bVisibleIfTechsNotMet = false;

	return Template;
}

static function X2DataTemplate CreateTechStudySAVAlienBiotech()
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'StudySAVAlienBiotech');
	Template.PointsToComplete = 4500;
	Template.SortingTier = 1;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_Ay_Biotech";

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVAlienBiotech');
	Template.Requirements.bVisibleIfTechsNotMet = false;

	return Template;
}

static function X2DataTemplate CreateTechStudySAVAlienCybertech()
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'StudySAVAlienCybertech');
	Template.PointsToComplete = 4500;
	Template.SortingTier = 1;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_Ay_Cybernetics";

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVAlienCybertech');
	Template.Requirements.bVisibleIfTechsNotMet = false;

	return Template;
}

static function X2DataTemplate CreateTechStudySAVAlienPsionictech()
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'StudySAVAlienPsionictech');
	Template.PointsToComplete = 4500;
	Template.SortingTier = 1;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_Ay_Psionic";

	// Requirements
	Template.Requirements.RequiredItems.AddItem('SAVAlienPsionictech');
	Template.Requirements.bVisibleIfTechsNotMet = false;

	return Template;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//BREAKTHROUGHS
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


static function X2DataTemplate CreateBreakthroughDepleatedEleriumTemplate()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughDepleatedElerium');
	Template.strImage = "img:///UILibrary_SavageItems.Techs.UIBreakthroughAmmo";

	Template.Requirements.RequiredTechs.AddItem('AdvancedExperimentalAmmunitionConcepts');

	return Template;
}

static function X2DataTemplate CreateBreakthroughDisruptionTemplate()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughDisruption');
	Template.strImage = "img:///UILibrary_SavageItems.Techs.UIBreakthroughAmmo";

	Template.Requirements.RequiredTechs.AddItem('AdvancedExperimentalAmmunitionConcepts');
	Template.Requirements.RequiredTechs.AddItem('TechPsionicFieldTheory');

	return Template;
}

static function X2DataTemplate CreateBreakthroughSmartSeekerTemplate()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughSmartSeeker');
	Template.strImage = "img:///UILibrary_SavageItems.Techs.UIBreakthroughAmmo";

	Template.Requirements.RequiredTechs.AddItem('AdvancedExperimentalAmmunitionConcepts');
	Template.Requirements.RequiredTechs.AddItem('AutopsySpectre');

	return Template;
}

static function X2DataTemplate CreateBreakthroughHotShotTemplate()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughHotShot');
	Template.strImage = "img:///UILibrary_SavageItems.Techs.UIBreakthroughAmmo";

	Template.Requirements.RequiredTechs.AddItem('AdvancedExperimentalAmmunitionConcepts');

	return Template;
}

static function X2DataTemplate CreateBreakthroughPlasmaBurstTemplate()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughPlasmaBurst');
	Template.strImage = "img:///UILibrary_SavageItems.Techs.UIBreakthroughAmmo";

	Template.Requirements.RequiredTechs.AddItem('AdvancedExperimentalAmmunitionConcepts');

	return Template;
}

static function X2DataTemplate CreateBreakthroughTranquilityGenTemplate()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughTranquilityGen');
	Template.strImage = "img:///UILibrary_SavageItems.Techs.UIBreakthroughAMods";

	Template.Requirements.RequiredTechs.AddItem('TechPsionicFieldTheory');

	return Template;
}

static function X2DataTemplate CreateBreakthroughDefenceFieldGenTemplate()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughDefenceFieldGen');
	Template.strImage = "img:///UILibrary_SavageItems.Techs.UIBreakthroughAMods";

	Template.Requirements.RequiredTechs.AddItem('TechPsionicFieldTheory');

	return Template;
}

static function X2DataTemplate CreateBreakthroughWraithGenTemplate()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughWraithGen');
	Template.strImage = "img:///UILibrary_SavageItems.Techs.UIBreakthroughAMods";

	Template.Requirements.RequiredTechs.AddItem('TechPsionicFieldTheory');

	return Template;
}

static function X2DataTemplate CreateBreakthroughAdvancedHandScannersTemplate()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughAdvancedHandScanners');
	Template.strImage = "img:///UILibrary_SavageItems.Techs.UIBreakthroughAdvScanner";
	
	Template.ResearchCompletedFn = UpgradeItems;

	Template.Requirements.RequiredTechs.AddItem('AutopsyChryssalid');

	return Template;
}

static function X2DataTemplate CreateBreakthroughAdvancedSensorySystemsTemplate()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughAdvancedSensorySystems');
	Template.strImage = "img:///UILibrary_SavageItems.Techs.UIBreakthroughAdvSensors";

	Template.ResearchCompletedFn = UpgradeItems;

	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventOfficer');
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventMEC');

	return Template;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//PROVINGGROUNDS
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

static function X2DataTemplate CreateAlloyJacketedMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AlloyJacketedMFG');
	Template.PointsToComplete = StafferXDays(1, 10);
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PG_AlienAlloyJacketedRnds";
	Template.bProvingGround = true;
	Template.bRandomAmmo = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.Requirements.RequiredTechs.AddItem('AdvancedExperimentalAmmunitionConcepts');

	// Item Reward
	Template.ItemRewards.AddItem('AAJRounds');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_AAJMFG;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.ALLOY_COST_AAJMFG;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ECORE_COST_AAJMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateDepleatedEleriumMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'DepleatedEleriumMFG');
	Template.PointsToComplete = StafferXDays(1, 12);
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PG_DepletedEleriumRnds";
	Template.bProvingGround = true;
	Template.bRandomAmmo = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughDepleatedElerium');

	// Item Reward
	Template.ItemRewards.AddItem('AAJDERounds');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_DEPELERIUMMFG;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.ALLOY_COST_DEPELERIUMMFG;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = default.ELERIUM_COST_DEPELERIUMMFG;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ECORE_COST_DEPELERIUMMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateDisruptionMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'DisruptionMFG');
	Template.PointsToComplete = StafferXDays(1, 12);
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PG_DisruptorRnds";
	Template.bProvingGround = true;
	Template.bRandomAmmo = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughDisruption');

	// Item Reward
	Template.ItemRewards.AddItem('DisruptorRounds');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_DISRUPTORMFG;
 	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ECORE_COST_DISRUPTORMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSmartSeekerMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SmartSeekerMFG');
	Template.PointsToComplete = StafferXDays(1, 12);
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PG_SmartSeekerRnds";
	Template.bProvingGround = true;
	Template.bRandomAmmo = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughSmartSeeker');

	// Item Reward
	Template.ItemRewards.AddItem('SmartSeekerRounds');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_SEEKERMFG;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.ALLOY_COST_SEEKERMFG;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = default.ELERIUM_COST_SEEKERMFG;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ECORE_COST_SEEKERMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateHotShotMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'HotShotMFG');
	Template.PointsToComplete = StafferXDays(1, 12);
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PG_HotShotRnds";
	Template.bProvingGround = true;
	Template.bRandomAmmo = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughHotShot');
	Template.Requirements.RequiredTechs.AddItem('AutopsyAndromedon');

	// Item Reward
	Template.ItemRewards.AddItem('HotshotRounds');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_HOTSHOTMFG;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ECORE_COST_HOTSHOTMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	Artifacts.ItemTemplateName = 'CorpseAndromedon';
	Artifacts.Quantity = default.ANDROMEDON_COST_HOTSHOTMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreatePlasmaBurstMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'PlasmaBurstMFG');
	Template.PointsToComplete = StafferXDays(1, 12);
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PG_PlasmaBurstRnds";
	Template.bProvingGround = true;
	Template.bRandomAmmo = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughPlasmaBurst');

	// Item Reward
	Template.ItemRewards.AddItem('PlasmaBurstRounds');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_PLASMABIRSTMFG;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.ALLOY_COST_PLASMABIRSTMFG;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = default.ELERIUM_COST_PLASMABIRSTMFG;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ECORE_COST_PLASMABIRSTMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreatePlatedAModMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'PlatedAModMFG');
	Template.PointsToComplete = StafferXDays(1, 8);//1, 10
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PG_PlatedAmods";
	Template.bProvingGround = true;
	Template.bArmor = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.Requirements.RequiredTechs.AddItem('PlatedArmor');
	
	//RewardDeck
//	Template.RewardDeck = 'PlatedAModRewards';

	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('WalkerServosOverlay');
	Template.ItemRewards.AddItem('RocketLauncherOverlay');
	Template.ItemRewards.AddItem('TacUplinkOverlay');
	Template.ItemRewards.AddItem('MunitionsCarrierOverlay');
	Template.ItemRewards.AddItem('GrappleAMod');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_PLATEDAMODMFG;//30
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.ALLOY_COST_PLATEDAMODMFG;//5
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ECORE_COST_PLATEDAMODMFG;//1
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreatePoweredAModMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'PoweredAModMFG');
	Template.PointsToComplete = StafferXDays(1, 8);//1, 10
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PG_PoweredAmods";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.bArmor = true;

	Template.Requirements.RequiredTechs.AddItem('PoweredArmor');
	
	//RewardDeck
//	Template.RewardDeck = 'PoweredAModRewards';
	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('ReflexAMod');
	Template.ItemRewards.AddItem('TeleportOverlay');
	Template.ItemRewards.AddItem('DreadnaughtOverlay');
	Template.ItemRewards.AddItem('ActiveCamoAMod');
	Template.ItemRewards.AddItem('PoweredMeleeAMod');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_POWEREDAMODMFG;//45
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.ALLOY_COST_POWEREDAMODMFG;//10
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = default.ELERIUM_COST_POWEREDAMODMFG;//10
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ECORE_COST_POWEREDAMODMFG;//1
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateTranquilityGenMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'TranquilityGenMFG');
	Template.PointsToComplete = StafferXDays(1, 12);
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PG_SolaceFieldAmod";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.bArmor = true;
	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughTranquilityGen');
	Template.Requirements.RequiredTechs.AddItem('Tech_Elerium');

	// Item Reward
	Template.ItemRewards.AddItem('SoliceAMod');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_SOLICEAMODMFG;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.ALLOY_COST_SOLICEAMODMFG;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = default.ELERIUM_COST_SOLICEAMODMFG;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ECORE_COST_SOLICEAMODMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateDefenceFieldGenMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'DefenceFieldGenMFG');
	Template.PointsToComplete = StafferXDays(1, 12);
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PG_DefenceFieldAmod";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.bArmor = true;
	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughDefenceFieldGen');
	Template.Requirements.RequiredTechs.AddItem('Tech_Elerium');

	// Item Reward
	Template.ItemRewards.AddItem('ShieldOverlay');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_DEFFIELDAMODMFG;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.ALLOY_COST_DEFFIELDAMODMFG;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = default.ELERIUM_COST_DEFFIELDAMODMFG;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ECORE_COST_DEFFIELDAMODMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateWraithGenMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'WraithGenMFG');
	Template.PointsToComplete = StafferXDays(1, 12);
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PG_WraithFieldAmod";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.bArmor = true;
	Template.ResearchCompletedFn = GiveRandomItemReward;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughWraithGen');
	Template.Requirements.RequiredTechs.AddItem('Tech_Elerium');

	// Item Reward
	Template.ItemRewards.AddItem('WraithOverlay');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_WRAITHAMODMFG;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.ALLOY_COST_WRAITHAMODMFG;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = default.ELERIUM_COST_WRAITHAMODMFG;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ECORE_COST_WRAITHAMODMFG;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateAdvancedExplosiveChargeMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AdvancedExplosiveChargeMFG');
	Template.PointsToComplete = StafferXDays(1, 8);//1, 10
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PG_AdvancedCharges";
	Template.bRandomGrenade = true;
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	Template.Requirements.RequiredTechs.AddItem('PlasmaGrenade');
	
	//RewardDeck
//	Template.RewardDeck = 'AdvancedExplosiveChargeRewards';

	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('IncendaryCharge');
	Template.ItemRewards.AddItem('ToxinCharge');
	Template.ItemRewards.AddItem('KrakCharge');
	Template.ItemRewards.AddItem('ImplosionCharge');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_EXPLOSIVECHARGESMFG;//10
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = default.ELERIUM_COST_EXPLOSIVECHARGESMFG;//5
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ECORE_COST_EXPLOSIVECHARGESMFG;//1
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate CreateAdvancedRepairKitsUpgrade()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AdvancedRepairKitsUpgrade');
	Template.PointsToComplete = StafferXDays(1, 10);
	Template.strImage = "img:///UILibrary_SavageItems.Techs.TECH_PG_RepairKitUpgrade";
	Template.bProvingGround = true;
	Template.SortingTier = 1;
	Template.ResearchCompletedFn = UpgradeItems;
	
	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventMEC');

	// Cost
 	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_REPAIRKIT_UPGRADE;
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ECORE_COST_REPAIRKIT_UPGRADE;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.ALLOY_COST_REPAIRKIT_UPGRADE;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	return Template;
}

static function X2DataTemplate CreateComDesiMK2Upgrade()
{
	local X2TechTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'ComDesiMK2Upgrade');
	Template.PointsToComplete = StafferXDays(1, 10);
	Template.strImage = "img:///UILibrary_SavageItems.TECH_PG_ComDesi2";
	Template.bProvingGround = true;
	Template.SortingTier = 1;
	Template.ResearchCompletedFn = UpgradeItems;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventMEC');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
    Resources.Quantity = default.SUPPLY_COST_COMMANDDESIGNATOR_UPGRADE;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.ALLOY_COST_COMMANDDESIGNATOR_UPGRADE;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = default.ELERIUM_COST_COMMANDDESIGNATOR_UPGRADE;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	return Template;
}
/*
//Disabled for now
static function X2DataTemplate CreateCombatDronesMFG()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'CombatDronesMFG');
	Template.PointsToComplete = StafferXDays(1, 8);//1, 10
	Template.strImage = "img:///UILibrary_StrategyImages.ScienceIcons.IC_AutopsyAdventTurret";
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;

	//RewardDeck
	Template.RewardDeck = 'CombatDroneRewards';

	Template.ResearchCompletedFn = GiveRandomItemReward;
	Template.ItemRewards.AddItem('HunterKillerItem');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = 50;//50
 	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = 1;//1
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateAdvancedDronesUpgrade()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AdvancedDronesUpgrade');
	Template.PointsToComplete = StafferXDays(1, 10);
	Template.strImage = "img:///UILibrary_StrategyImages.ResearchTech.TECH_Plasma_Grenade_Project";
	Template.bProvingGround = true;
	Template.SortingTier = 1;
	Template.ResearchCompletedFn = UpgradeItems;
	
	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventMEC');
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');

	// Cost
 	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = 50;
 	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = 5;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}
*/

////////////////////////////////////////
//DUMMY TECHS TO SET UP THE REWARD DECKS
static function X2DataTemplate CreateAlienCacheRewardDeck()
{
    local X2TechTemplate Template;

    `CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AlienCacheRewardDeck');

    Template.PointsToComplete = StafferXDays(1, 1);
	Template.strImage = "img://UILibrary_SavageItems.TECH_XenoSerumSynthesis";
    Template.SortingTier = 3;
    Template.bProvingGround = true;
    Template.bRepeatable = true;
    
	Template.Requirements.RequiredTechs.AddItem('AlienCacheRewardDeck');

    Template.ResearchCompletedFn = GiveDeckedItemReward;
    Template.RewardDeck = 'AlienCacheRewards';
    return Template;
}

static function X2DataTemplate CreateADVENTCacheRewardDeck()
{
    local X2TechTemplate Template;

    `CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'ADVENTCacheRewardDeck');

    Template.PointsToComplete = StafferXDays(1, 1);
	Template.strImage = "img://UILibrary_SavageItems.TECH_XenoSerumSynthesis";
    Template.SortingTier = 3;
    Template.bProvingGround = true;
    Template.bRepeatable = true;
    
	Template.Requirements.RequiredTechs.AddItem('ADVENTCacheRewardDeck');

    Template.ResearchCompletedFn = GiveDeckedItemReward;
    Template.RewardDeck = 'ADVENTCacheRewards';
    return Template;
}

static function X2DataTemplate CreateResistanceCacheRewardDeck()
{
    local X2TechTemplate Template;

    `CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'ResistanceCacheRewardDeck');

    Template.PointsToComplete = StafferXDays(1, 1);
	Template.strImage = "img://UILibrary_SavageItems.TECH_XenoSerumSynthesis";
    Template.SortingTier = 3;
    Template.bProvingGround = true;
    Template.bRepeatable = true;
    
	Template.Requirements.RequiredTechs.AddItem('ResistanceCacheRewardDeck');

    Template.ResearchCompletedFn = GiveDeckedItemReward;
    Template.RewardDeck = 'ResistanceCacheRewards';
    return Template;
}

static function X2DataTemplate CreateMiscSavageItemsRewardDeck()
{
    local X2TechTemplate Template;

    `CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'MiscSavageItemsRewardDeck');

    Template.PointsToComplete = StafferXDays(1, 1);
	Template.strImage = "img://UILibrary_SavageItems.TECH_XenoSerumSynthesis";
    Template.SortingTier = 3;
    Template.bProvingGround = true;
    Template.bRepeatable = true;
    
	Template.Requirements.RequiredTechs.AddItem('MiscSavageItemsRewardDeck');

    Template.ResearchCompletedFn = GiveDeckedItemReward;
    Template.RewardDeck = 'SAVItemsUtilityRewards';
    return Template;
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}