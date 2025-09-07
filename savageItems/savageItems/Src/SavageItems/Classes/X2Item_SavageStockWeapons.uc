class X2Item_SavageStockWeapons extends X2Item config(GameData_SavitemsWeaponData);

var localized array<string> COREBlackMarketTexts;

var config WeaponDamageValue STUNSPRAY_BASEDAMAGE;
var config WeaponDamageValue HANDFLAMER_BASEDAMAGE;
var config WeaponDamageValue SKUNKSPRAY_BASEDAMAGE;
var config WeaponDamageValue ACIDJET_BASEDAMAGE;
var config WeaponDamageValue TACTICALSCANNER_BASEDAMAGE;
var config WeaponDamageValue COMMANDDESIGNATOR_CONVENTIONAL_BASEDAMAGE;
var config WeaponDamageValue COMMANDDESIGNATOR_MAGNETIC_BASEDAMAGE;
var config WeaponDamageValue HUNTERKILLERI_BASEDAMAGE;
var config WeaponDamageValue HUNTERKILLERII_BASEDAMAGE;
var config WeaponDamageValue POWEREDMELEEAMOD_BASEDAMAGE;
var config WeaponDamageValue HIDDENBLADES_CONVENTIONAL_BASEDAMAGE;
var config WeaponDamageValue HIDDENBLADES_MAGNETIC_BASEDAMAGE;
var config WeaponDamageValue HIDDENBLADES_BEAM_BASEDAMAGE;
var config WeaponDamageValue HIDDENBLADES_REAPER_BASEDAMAGE;
var config WeaponDamageValue SAVSTIM_BASEDAMAGE;
var config WeaponDamageValue SAVSTIM2_BASEDAMAGE;
var config WeaponDamageValue SAVSERUMBLUE_BASEDAMAGE;
var config WeaponDamageValue SAVSERUMRED_BASEDAMAGE;
var config WeaponDamageValue SAVSERUMYELLOW_BASEDAMAGE;
var config WeaponDamageValue SAVSERUMORANGE_BASEDAMAGE;
var config WeaponDamageValue SAVSERUMVIOLET_BASEDAMAGE;
var config WeaponDamageValue SAVSERUMGREEN_BASEDAMAGE;
var config WeaponDamageValue SAVTURBO_BASEDAMAGE;
var config WeaponDamageValue SAVKLARITY_BASEDAMAGE;
var config WeaponDamageValue LISTON_BASEDAMAGE;
var config WeaponDamageValue PSIKO_BASEDAMAGE;
var config WeaponDamageValue NANOCLONER_BASEDAMAGE;
var config WeaponDamageValue NANOCLONE_MELEEATTACK_BASEDAMAGE;
var config WeaponDamageValue BUNKERMODULEWEAPON_BASEDAMAGE;
var config WeaponDamageValue COVERPACKWEAPON_BASEDAMAGE;
var config WeaponDamageValue BREACHINGGUN_BASEDAMAGE;
var config WeaponDamageValue REAPER_REMOTEDETONATOR_BASEDAMAGE;
var config WeaponDamageValue SKIRMISHERMAGBLASTER_BASEDAMAGE;
var config WeaponDamageValue AUTOSTIGMATA_BASEDAMAGE;

//Trading post values for various things
var config int SAVNANOSKULLJACK_TPV;
var config int TACTICALUPLINKSCANNER_TPV;
var config int COMDESIGNATOR_CV_TPV;
var config int COMDESIGNATOR_MG_TPV;
var config int SAVREGEN1_TPV;
var config int SAVREGEN2_TPV;
var config int SAVNANOREGEN_TPV;
var config int SAVSTIMULATOR_TPV;
var config int SAVGRAPPLE_AMOD_TPV;
var config int SAVPOWEREDMELEE_AMOD_TPV;
var config int HIDDENBLADES_TPV;
var config int HIDDENBLADES_MG_TPV;
var config int HIDDENBLADES_BM_TPV;

var config int COMMANDDESIGNATOR_CONVENTIONAL_AIM;
var config int COMMANDDESIGNATOR_CONVENTIONAL_CRITCHANCE;
var config int COMMANDDESIGNATOR_CONVENTIONAL_ICLIPSIZE;
var config int COMMANDDESIGNATOR_CONVENTIONAL_ISOUNDRANGE;
var config int COMMANDDESIGNATOR_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int COMMANDDESIGNATOR_CV_RANGE;
var config int COMMANDDESIGNATOR_CV_COST_SUPPLIES;

var config int COMMANDDESIGNATOR_MAGNETIC_AIM;
var config int COMMANDDESIGNATOR_MAGNETIC_CRITCHANCE;
var config int COMMANDDESIGNATOR_MAGNETIC_ICLIPSIZE;
var config int COMMANDDESIGNATOR_MAGNETIC_ISOUNDRANGE;
var config int COMMANDDESIGNATOR_MAGNETIC_IENVIRONMENTDAMAGE;
var config int COMMANDDESIGNATOR_MG_RANGE;
var config int COMMANDDESIGNATOR_MG_COST_SUPPLIES;
var config int COMMANDDESIGNATOR_MG_COST_OFFICER;

var config int STUNSPRAY_ISOUNDRANGE;
var config int STUNSPRAY_IENVIRONMENTDAMAGE;
var config int STUNSPRAY_ICLIPSIZE;
var config int STUNSPRAY_RANGE;
var config int STUNSPRAY_RADIUS;
var config int TRADINGPOST_STUNSPRAY;
var config int SUPPLY_COST_STUNSPRAY;
var config int STUNLANCER_COST_STUNSPRAY;

var config int HANDFLAMER_ISOUNDRANGE;
var config int HANDFLAMER_IENVIRONMENTDAMAGE;
var config int HANDFLAMER_ICLIPSIZE;
var config int HANDFLAMER_RANGE;
var config int HANDFLAMER_RADIUS;
var config int TRADINGPOST_HANDFLAMER;
var config int SUPPLY_COST_HANDFLAMER;

var config int SKUNKSPRAY_ISOUNDRANGE;
var config int SKUNKSPRAY_IENVIRONMENTDAMAGE;
var config int SKUNKSPRAY_ICLIPSIZE;
var config int SKUNKSPRAY_RANGE;
var config int SKUNKSPRAY_RADIUS;
var config int TRADINGPOST_SKUNKSPRAY;
var config int SUPPLY_COST_SKUNKSPRAY;
var config int VIPER_COST_STUNSPRAY;

var config int ACIDJET_ISOUNDRANGE;
var config int ACIDJET_IENVIRONMENTDAMAGE;
var config int ACIDJET_ICLIPSIZE;
var config int ACIDJET_RANGE;
var config int ACIDJET_RADIUS;
var config int TRADINGPOST_ACIDJET;
var config int SUPPLY_COST_ACIDJET;
var config int ANDROMEDON_COST_STUNSPRAY;

var config int	SAVSTIM_ISOUNDRANGE;
var config int	SAVSTIM_IENVIRONMENTDAMAGE;
var config int	SAVSTIM_ICLIPSIZE;
var config int	SAVSTIM_RANGE;
var config int	TRADINGPOST_SAVSTIM;
var config int	SUPPLY_COST_SAVSTIM;

var config int	SAVSTIM2_ISOUNDRANGE;
var config int	SAVSTIM2_IENVIRONMENTDAMAGE;
var config int	SAVSTIM2_ICLIPSIZE;
var config int	SAVSTIM2_RANGE;
var config int	TRADINGPOST_SAVSTIM2;
var config int	SUPPLY_COST_SAVSTIM2;
var config int	VIPER_COST_SAVSTIM2;

var config int	SAVSERUMBLUE_ISOUNDRANGE;
var config int	SAVSERUMBLUE_IENVIRONMENTDAMAGE;
var config int	SAVSERUMBLUE_ICLIPSIZE;
var config int	SAVSERUMBLUE_RANGE;
var config int	TRADINGPOST_SAVSERUMBLUE;
var config int	SUPPLY_COST_SAVSERUMBLUE;
var config int	SECTOID_COST_SAVSERUMBLUE;
var config int	VIPER_COST_SAVSERUMBLUE;
var config int	BIOSAMPLE_COST_SAVSERUMBLUE;

var config int	TRADINGPOST_SAVSERUMRED;
var config int	SUPPLY_COST_SAVSERUMRED;
var config int	CHRYSSALID_COST_SAVSERUMRED;
var config int	STUNLANCER_COST_SAVSERUMRED;
var config int	BIOSAMPLE_COST_SAVSERUMRED;

var config int	TRADINGPOST_SAVSERUMYELLOW;
var config int	SUPPLY_COST_SAVSERUMYELLOW;
var config int	SHIELDBEARER_COST_SAVSERUMYELLOW;
var config int	FACELESS_COST_SAVSERUMYELLOW;
var config int	BIOSAMPLE_COST_SAVSERUMYELLOW;

var config int	TRADINGPOST_SAVSERUMORANGE;
var config int	SUPPLY_COST_SAVSERUMORANGE;
var config int	CORPSE1_COST_SAVSERUMORANGE;
var config int	CORPSE2_COST_SAVSERUMORANGE;
var config int	BIOSAMPLE_COST_SAVSERUMORANGE;

var config int	TRADINGPOST_SAVSERUMVIOLET;
var config int	SUPPLY_COST_SAVSERUMVIOLET;
var config int	CORPSE1_COST_SAVSERUMVIOLET;
var config int	CORPSE2_COST_SAVSERUMVIOLET;
var config int	BIOSAMPLE_COST_SAVSERUMVIOLET;

var config int TRADINGPOST_SAVSERUMGREEN;
var config int SUPPLY_COST_SAVSERUMGREEN;
var config int CORPSE1_COST_SAVSERUMGREEN;
var config int CORPSE2_COST_SAVSERUMGREEN;
var config int BIOSAMPLE_COST_SAVSERUMGREEN;
var config int SAVSERUMGREEN_RANGE;

var config int TACTICALSCANNER_ISOUNDRANGE;
var config int TACTICALSCANNER_IENVIRONMENTDAMAGE;
var config int TACTICALSCANNER_ICLIPSIZE;
var config int TACTICALSCANNER_RADIUS;
var config int TACTICALSCANNER_RANGE;
var config int TACTICALSCANNER_COST_SUPPLIES;
var config int TACTICALSCANNER_COST_OFFICER;

var config int	HUNTERKILLERI_ISOUNDRANGE;
var config int	HUNTERKILLERI_IENVIRONMENTDAMAGE;
var config int	HUNTERKILLERI_ICLIPSIZE;
var config int	HUNTERKILLERI_RANGE;
var config int	HUNTERKILLERI_RADIUS;
var config int	HUNTERKILLERI_IPOINTS;
var config int	HUNTERKILLERI_TRADINGPOSTVALUE;
var config int	HUNTERKILLERI_COST_SUPPLIES;

var config int	HUNTERKILLERII_ISOUNDRANGE;
var config int	HUNTERKILLERII_IENVIRONMENTDAMAGE;
var config int	HUNTERKILLERII_ICLIPSIZE;
var config int	HUNTERKILLERII_RANGE;
var config int	HUNTERKILLERII_RADIUS;
var config int	HUNTERKILLERII_IPOINTS;
var config int	HUNTERKILLERII_TRADINGPOSTVALUE;
var config int	HUNTERKILLERII_COST_SUPPLIES;

var config int SAV_REGEN_CHARGES;
var config int SAV_REGEN_RANGE_TILES;
var config int SAV_REGEN_COST_SUPPLIES;

var config int SAV_REGEN2_CHARGES;
var config int SAV_REGEN2_RANGE_TILES;
var config int SAV_REGEN2_COST_SUPPLIES;

var config int SAV_NANOREGEN_CHARGES;
var config int SAV_NANOREGEN_RANGE_TILES;
var config int SAV_NANOREGEN_COST_SUPPLIES;
var config int SAV_NANOREGEN_COST_SPECTRE;

var config int SAV_STIMULATOR_CHARGES;
var config int SAV_STIMULATOR_RANGE_TILES;
var config int SAV_STIMULATOR_COST_SUPPLIES;

var config int	HIDDENBLADES_CONVENTIONAL_ICLIPSIZE;
var config int	HIDDENBLADES_CONVENTIONAL_AIM;
var config int	HIDDENBLADES_CONVENTIONAL_CRITCHANCE;
var config int	HIDDENBLADES_CONVENTIONAL_ISOUNDRANGE;
var config int	HIDDENBLADES_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int	SUPPLY_COST_HIDDENBLADE;

var config int	HIDDENBLADES_MAGNETIC_ICLIPSIZE;
var config int	HIDDENBLADES_MAGNETIC_AIM;
var config int	HIDDENBLADES_MAGNETIC_CRITCHANCE;
var config int	HIDDENBLADES_MAGNETIC_ISOUNDRANGE;
var config int	HIDDENBLADES_MAGNETIC_IENVIRONMENTDAMAGE;
var config int	SUPPLY_COST_HIDDENBLADE_MG;
var config int	ALLOY_COST_HIDDENBLADE_MG;

var config int	HIDDENBLADES_BEAM_ICLIPSIZE;
var config int	HIDDENBLADES_BEAM_AIM;
var config int	HIDDENBLADES_BEAM_CRITCHANCE;
var config int	HIDDENBLADES_BEAM_ISOUNDRANGE;
var config int	HIDDENBLADES_BEAM_IENVIRONMENTDAMAGE;
var config int	SUPPLY_COST_HIDDENBLADE_BM;
var config int	ALLOY_COST_HIDDENBLADE_BM;
var config int	ELERIUM_COST_HIDDENBLADE_BM;

var config int	HIDDENBLADES_REAPER_ICLIPSIZE;
var config int	HIDDENBLADES_REAPER_AIM;
var config int	HIDDENBLADES_REAPER_CRITCHANCE;
var config int	HIDDENBLADES_REAPER_ISOUNDRANGE;
var config int	HIDDENBLADES_REAPER_IENVIRONMENTDAMAGE;
var config int	HIDDENBLADES_REAPER_TPV;

var config int TPV_RATIONS;
var config int SUPPLY_COST_RATIONS;
var config int RATIONBARS_ICLIPSIZE;
var config int SUPPLY_COST_SAVCOREBAR;
var config int COREBARS_TRADEVAL;

var config int REAPERMEAT_TRADEVAL;
var config int REAPERMEAT_ICLIPSIZE;

var config int SAVRAPTOR_TRADEVAL;
var config int SAVTURBO_TRADEVAL;
var config int SAVKLARITY_TRADEVAL;
var config int SAVREDHAZE_TRADEVAL;
var config int REDHAZE_ICLIPSIZE;
var config int PSIKO_TRADEVAL;
var config int PSIKO_ICLIPSIZE;
var config int PSIKO_IIENVIRONMENTDAMAGE;
var config int PSIKO_IRADIUS;
var config int PSIKO_RANGE;
var config int LISTON_TRADEVAL;
var config int LISTON_ICLIPSIZE;

var config int PLASMAIED_IRADIUS;
var config int PLASMAIED_RANGE;
var config int RESISTANCEIED_TRADEVAL;

var config int NANOCLONER_AIM;
var config int NANOCLONER_CRITCHANCE;
var config int NANOCLONER_ISOUNDRANGE;
var config int NANOCLONER_IENVIRONMENTDAMAGE;
var config array<int> SHORT_NANOCLONER_RANGE;
var config int NANOCLONER_ICLIPSIZE;
var config int NANOCLONER_TRADEVAL;

var config int BREACHINGGUN_ISOUNDRANGE;
var config int BREACHINGGUN_IENVIRONMENTDAMAGE;
var config int BREACHINGGUN_ICLIPSIZE;
var config int BREACHINGGUN_RANGE;
var config int BREACHINGGUN_RADIUS;
var config int SUPPLY_COST_BREACHINGGUN;
var config int BREACHINGGUN_TRADINGPOSTVALUE;

var config int REAPER_TRADINGPOST_REMOTEDETONATOR;
var config int REAPER_REMOTEDETONATOR_ISOUNDRANGE;
var config int REAPER_REMOTEDETONATOR_IENVIRONMENTDAMAGE;
var config int REAPER_REMOTEDETONATOR_ICLIPSIZE;
var config int REAPER_REMOTEDETONATOR_RANGE;
var config int REAPER_REMOTEDETONATOR_RADIUS;

var config int SAVSKIRMISHER_AMOD_TPV;
var config int SKIRMISHERCHAINBREAKER_RANGE;
var config int SKIRMISHERCHAINBREAKER_RADIUS;
var config int SKIRMISHERCHAINBREAKER_TPV;
var config int ADRENALAMP_TRADEVAL;

var config int SKIRMISHERMAGBLASTER_ISOUNDRANGE;
var config int SKIRMISHERMAGBLASTER_IENVIRONMENTDAMAGE;
var config int SKIRMISHERMAGBLASTER_ICLIPSIZE;
var config int SKIRMISHERMAGBLASTER_RANGE;
var config int SKIRMISHERMAGBLASTER_RADIUS;
var config int SKIRMISHERMAGBLASTER_TRADINGPOSTVALUE;

var config int AUTOSTIGMATA_ISOUNDRANGE;
var config int AUTOSTIGMATA_IENVIRONMENTDAMAGE;
var config int AUTOSTIGMATA_ICLIPSIZE;
var config int AUTOSTIGMATA_RANGE;
var config int AUTOSTIGMATA_TRADEVAL;

var config int MINDRAZOR_TRADEVAL;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Items;

	Items.AddItem(SAVNanoSKULLJACK());
	Items.AddItem(CreateStunspray());
	Items.AddItem(CreateSavHandFlamer());
	Items.AddItem(CreateSavSkunkSpray());
	Items.AddItem(CreateSavAcidJet());	
	Items.AddItem(CreateSavStimGun());
	Items.AddItem(CreateSavStimGun2());
	Items.AddItem(CreateTacticalUplinkScanner());
	Items.AddItem(Create_CommandDesignator_CV());
	Items.AddItem(Create_CommandDesignator_MG());
	Items.AddItem(CreateHunterKillerItem());
	Items.AddItem(CreateHunterKiller2Item());
	Items.AddItem(CreateSavRegen());
	Items.AddItem(CreateSavRegen2());
	Items.AddItem(CreateSavNaniteRegen());
	Items.AddItem(CreateSavStimulator());
	Items.AddItem(CreateGrappleAMod());
	Items.AddItem(CreatePoweredMeleeAMod());
	Items.AddItem(CreateHiddenBladesCV());	
	Items.AddItem(CreateHiddenBladesMG());
	Items.AddItem(CreateHiddenBladesBM());
	Items.AddItem(SAVReaperHiddenBlades());
	Items.AddItem(CreateSavSerumBlue());
	Items.AddItem(CreateSavSerumRed());	
	Items.AddItem(CreateSavSerumYellow());
	Items.AddItem(CreateSavSerumOrange());
	Items.AddItem(CreateSavSerumViolet());	
	Items.AddItem(CreateSavSerumGreen());
	Items.AddItem(CreateSavRationBar());
	Items.AddItem(CreateSavCOREBar());
	Items.AddItem(CreateSavReaperBushMeat());
	Items.AddItem(CreateSavComDrug_Raptor());
	Items.AddItem(CreateSavComDrug_Turbo());
	Items.AddItem(CreateSavComDrug_Klarity());
	Items.AddItem(CreateSavComDrug_RedHaze());
	Items.AddItem(CreateSavComDrug_Psiko());
	Items.AddItem(CreateSavComDrug_Liston());
	Items.AddItem(CreateSAVResistanceIED());
	Items.AddItem(CreateNanoCloner());
	Items.AddItem(CreateTemplate_SAVNanoCloneWeapon());
	Items.AddItem(BreachingGun());
	Items.AddItem(CreateTemplate_SAVBunkerModuleWeapon());
	Items.AddItem(CreateTemplate_SAVCoverPackWeapon());
	Items.AddItem(CreateSAV_ReaperRemoteDetonator());
	Items.AddItem(CreateSavSkirmisherAMod());
	Items.AddItem(SAVChainBreakerTool());
	Items.AddItem(SAVSkirmisherMagBlaster());
	Items.AddItem(SAVSkirmisherAdrenalAmp());
	Items.AddItem(SAVAutoStigmata());
	Items.AddItem(SAVMindrazor());

	return Items;
}

static function X2DataTemplate SAVNanoSKULLJACK()
{
	local X2WeaponTemplate Template;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVNanoSKULLJACK');
	Template.InventorySlot = eInvSlot_Utility;

	Template.Abilities.AddItem('SAVNanoIntruderHackBonus');

	Template.CanBeBuilt = false;
	Template.PointsToComplete = 0;
	Template.TradingPostValue = Default.SAVNANOSKULLJACK_TPV;
	Template.Tier = 1;

	Template.WeaponTech = 'conventional';
	Template.ItemCat = 'utility';
	Template.WeaponCat = 'utility';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_NANOJACK";
	Template.EquipSound = "StrategyUI_Skulljack_Equip";

	return Template;
}

static function X2DataTemplate CreateStunspray()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Stunspray');
	Template.ItemCat = 'Spraycan';
	Template.WeaponCat = 'utility';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SavStunSpray";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.BaseDamage = default.STUNSPRAY_BASEDAMAGE;
	Template.iSoundRange = default.STUNSPRAY_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.STUNSPRAY_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.STUNSPRAY_ICLIPSIZE;
	Template.iRange = default.STUNSPRAY_RANGE;
	Template.iRadius = default.STUNSPRAY_RADIUS;

	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, 80, false));

	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('StunSprayAbility');

	Template.GameArchetype = "SavItems_Art.Anims.WP_SavStunSprayer";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.TRADINGPOST_STUNSPRAY;

	Template.bShouldCreateDifficultyVariants = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.STUNSPRAY_ICLIPSIZE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.STUNSPRAY_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.STUNSPRAY_RADIUS);
	
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventStunLancer');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_STUNSPRAY;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'CorpseAdventStunLancer';
	Artifacts.Quantity = default.STUNLANCER_COST_STUNSPRAY;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSavHandFlamer()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavHandFlamer');
	Template.ItemCat = 'Spraycan';
	Template.WeaponCat = 'Spraycan';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SprayHandFlamer";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.BaseDamage = default.HANDFLAMER_BASEDAMAGE;
	Template.iSoundRange = default.HANDFLAMER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.HANDFLAMER_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.HANDFLAMER_ICLIPSIZE;
	Template.iRange = default.HANDFLAMER_RANGE;
	Template.iRadius = default.HANDFLAMER_RADIUS;

	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('SavHandFlamerAbility');

	Template.GameArchetype = "SavItems_Art.HandFlamer.WP_HandFlamer";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.TRADINGPOST_HANDFLAMER;

	Template.bShouldCreateDifficultyVariants = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.HANDFLAMER_ICLIPSIZE);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.HANDFLAMER_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.HANDFLAMER_RADIUS);
	
	Template.Requirements.RequiredTechs.AddItem('AutopsyTheLost');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_HANDFLAMER;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateSavSkunkSpray()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavSkunkSpray');
	Template.ItemCat = 'Spraycan';
	Template.WeaponCat = 'Spraycan';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SpraySkunkSpray";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.BaseDamage = default.SKUNKSPRAY_BASEDAMAGE;
	Template.iSoundRange = default.SKUNKSPRAY_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SKUNKSPRAY_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.SKUNKSPRAY_ICLIPSIZE;
	Template.iRange = default.SKUNKSPRAY_RANGE;
	Template.iRadius = default.SKUNKSPRAY_RADIUS;

	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('SavSkunkSprayAbility');

	Template.GameArchetype = "SavItems_Art.SkunkSpray.WP_SkunkSpray";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.TRADINGPOST_SKUNKSPRAY;

	Template.bShouldCreateDifficultyVariants = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.SKUNKSPRAY_ICLIPSIZE);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.SKUNKSPRAY_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.SKUNKSPRAY_RADIUS);
	
	Template.Requirements.RequiredTechs.AddItem('AutopsyViper');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_SKUNKSPRAY;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'CorpseViper';
	Artifacts.Quantity = default.VIPER_COST_STUNSPRAY;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSavAcidJet()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavAcidJet');
	Template.ItemCat = 'Spraycan';
	Template.WeaponCat = 'Spraycan';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SprayAcidSpray";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.BaseDamage = default.ACIDJET_BASEDAMAGE;
	Template.iSoundRange = default.ACIDJET_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.ACIDJET_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.ACIDJET_ICLIPSIZE;
	Template.iRange = default.ACIDJET_RANGE;
	Template.iRadius = default.ACIDJET_RADIUS;

	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('SavAcidJetAbility');

	Template.GameArchetype = "SavItems_Art.AcidSpray.WP_AcidSpray";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.TRADINGPOST_ACIDJET;

	Template.bShouldCreateDifficultyVariants = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.ACIDJET_ICLIPSIZE);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.ACIDJET_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.ACIDJET_RADIUS);
	
	Template.Requirements.RequiredTechs.AddItem('AutopsyAndromedon');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_ACIDJET;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'CorpseAndromedon';
	Artifacts.Quantity = default.ANDROMEDON_COST_STUNSPRAY;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateSavStimGun()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavStimGun');
	Template.ItemCat = 'heal';
	Template.WeaponCat = 'UtilityCatHeal';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_CombatStims1";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.BaseDamage = default.SAVSTIM_BASEDAMAGE;
	Template.iSoundRange = default.SAVSTIM_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SAVSTIM_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.SAVSTIM_ICLIPSIZE;
	Template.iRange = default.SAVSTIM_RANGE;

	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('SavAdministerStims');
	Template.Abilities.AddItem('MEDAmod_CombatStimsBonusUses');

	Template.GameArchetype = "Sav_CombatStims.CombatStims1.WP_SavCombatStims1";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.TRADINGPOST_SAVSTIM;

	Template.bShouldCreateDifficultyVariants = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.SAVSTIM_ICLIPSIZE);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.SAVSTIM_RANGE);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_SAVSTIM;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateSavStimGun2()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavStimGun2');
	Template.ItemCat = 'heal';
	Template.WeaponCat = 'UtilityCatHeal';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_CombatStims2";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.BaseDamage = default.SAVSTIM2_BASEDAMAGE;
	Template.iSoundRange = default.SAVSTIM2_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SAVSTIM2_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.SAVSTIM2_ICLIPSIZE;
	Template.iRange = default.SAVSTIM2_RANGE;

	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('SavAdministerAdvStims');
	Template.Abilities.AddItem('MEDAmod_CombatStims2BonusUses');

	Template.GameArchetype = "Sav_CombatStims.CombatStims2.WP_SavCombatStims2";

	Template.Tier = 1;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.TRADINGPOST_SAVSTIM2;

	Template.Requirements.RequiredTechs.AddItem('BattlefieldMedicine');
	Template.Requirements.RequiredTechs.AddItem('AutopsyBerserker');
	
	Template.bShouldCreateDifficultyVariants = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.SAVSTIM2_ICLIPSIZE);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.SAVSTIM2_RANGE);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_SAVSTIM2;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'CorpseViper';
	Artifacts.Quantity = default.VIPER_COST_SAVSTIM2;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2WeaponTemplate CreateTacticalUplinkScanner()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'TacticalUplinkScanner');

	Template.strImage = "img:///UILibrary_SavageItems.Inv_Tactical_Uplink_Scanner";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	Template.GameArchetype = "SAV_TacScanner.WP_Grenade_TacScanner";
	Template.Abilities.AddItem('TacticalScanner');
	Template.ItemCat = 'utility';
	Template.WeaponCat = 'utility';
	Template.WeaponTech = 'conventional';
	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_LowerBack;
//	Template.StowedLocation = eSlot_BeltHolster;
	Template.bMergeAmmo = true;
	Template.iClipSize = 1;
	Template.Tier = 1;

	Template.BaseDamage = default.TACTICALSCANNER_BASEDAMAGE;
	Template.iSoundRange = default.TACTICALSCANNER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.TACTICALSCANNER_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.TACTICALSCANNER_ICLIPSIZE;
	Template.iRadius = default.TACTICALSCANNER_RADIUS;
	Template.iRange = default.TACTICALSCANNER_RANGE;

	Template.CanBeBuilt = true;
	Template.PointsToComplete = 0;
	Template.TradingPostValue = Default.TACTICALUPLINKSCANNER_TPV;

	Template.bShouldCreateDifficultyVariants = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.TACTICALSCANNER_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.TACTICALSCANNER_RADIUS);

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventOfficer');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.TACTICALSCANNER_COST_SUPPLIES;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'CorpseAdventOfficer';
	Artifacts.Quantity = default.TACTICALSCANNER_COST_OFFICER;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	
	return Template;
}

static function X2DataTemplate Create_CommandDesignator_CV()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'CommandDesignator_CV');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'commanddesignator';
	Template.WeaponCat = 'commanddesignator';
	Template.InventorySlot = eInvSlot_Utility;
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ComDesignator_CV";
	Template.EquipSound = "Secondary_Weapon_Equip_Conventional";
	Template.Tier = 0;

	Template.BaseDamage = default.COMMANDDESIGNATOR_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.COMMANDDESIGNATOR_CONVENTIONAL_AIM;
	Template.CritChance = default.COMMANDDESIGNATOR_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.COMMANDDESIGNATOR_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.COMMANDDESIGNATOR_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.COMMANDDESIGNATOR_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.iRange = default.COMMANDDESIGNATOR_CV_RANGE;

	Template.TradingPostValue = Default.COMDESIGNATOR_CV_TPV;

	Template.NumUpgradeSlots = 1;

	Template.InfiniteAmmo = true;
	
	Template.Abilities.AddItem('CommandDesignatorAnimset');
	Template.Abilities.AddItem('ComDesiTacuplinkMark');
	Template.Abilities.AddItem('ComDesiMoveIt');
	Template.Abilities.AddItem('ComDesiTakeCover');

//	Template.SetAnimationNameForAbility('FanFire', 'FF_FireMultiShotConvA');	
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_CommandDesignator.Anims.WP_CommandDesignator_CV";

	Template.iPhysicsImpulse = 5;
	
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	Template.HideIfResearched  = 'ComDesiMK2Upgrade';

	Template.bHideClipSizeStat = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.COMMANDDESIGNATOR_CV_COST_SUPPLIES;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate Create_CommandDesignator_MG()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'CommandDesignator_MG');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'commanddesignator';
	Template.WeaponCat = 'commanddesignator';
	Template.InventorySlot = eInvSlot_Utility;
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ComDesignator_MG";
	Template.EquipSound = "Secondary_Weapon_Equip_Magnetic";
	Template.Tier = 1;

	Template.BaseDamage = default.COMMANDDESIGNATOR_MAGNETIC_BASEDAMAGE;
	Template.Aim = default.COMMANDDESIGNATOR_MAGNETIC_AIM;
	Template.CritChance = default.COMMANDDESIGNATOR_MAGNETIC_CRITCHANCE;
	Template.iClipSize = default.COMMANDDESIGNATOR_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = default.COMMANDDESIGNATOR_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.COMMANDDESIGNATOR_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.iRange = default.COMMANDDESIGNATOR_MG_RANGE;

	Template.TradingPostValue = Default.COMDESIGNATOR_MG_TPV;

	Template.NumUpgradeSlots = 1;

	Template.InfiniteAmmo = true;
	
	Template.Abilities.AddItem('CommandDesignatorAnimset');
	Template.Abilities.AddItem('ComDesiTacuplinkMark');
	Template.Abilities.AddItem('ComDesiMoveIt');
	Template.Abilities.AddItem('ComDesiTakeCover');
	Template.Abilities.AddItem('ComDesiCoveringFire');	
	
//	Template.SetAnimationNameForAbility('FanFire', 'FF_FireMultiShotConvA');	
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "SAV_CommandDesignator.Anims.WP_CommandDesignator_MG";

	Template.iPhysicsImpulse = 5;
	
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	Template.bHideClipSizeStat = true;

	Template.Requirements.RequiredTechs.AddItem('ComDesiMK2Upgrade');
	Template.CreatorTemplateName = 'ComDesiMK2Upgrade'; // The schematic which creates this item
	Template.BaseItem = 'CommandDesignator_CV'; // Which item this will be upgraded from

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.COMMANDDESIGNATOR_MG_COST_SUPPLIES;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2WeaponTemplate CreateHunterKillerItem()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'HunterKillerItem');
	Template.ItemCat = 'CombatDrone';
	Template.WeaponCat = 'CombatDrone';
	Template.WeaponTech = 'conventional';
	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_BeltHolster;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_HKMK1";
	Template.EquipSound = "Gremlin_Equip";

	Template.BaseDamage = default.HUNTERKILLERI_BASEDAMAGE;
	Template.iSoundRange = default.HUNTERKILLERI_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.HUNTERKILLERI_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.HUNTERKILLERI_ICLIPSIZE;
	Template.iRange = default.HUNTERKILLERI_RANGE;
	Template.iRadius = default.HUNTERKILLERI_RADIUS;
	Template.PointsToComplete = default.HUNTERKILLERI_IPOINTS;
	Template.TradingPostValue = default.HUNTERKILLERI_TRADINGPOSTVALUE;

	Template.GameArchetype = "SAV_Hunterkillers.WP_Grenade_HKDroneMK1";

	Template.bMergeAmmo = true;
	Template.DamageTypeTemplateName = 'Explosion';

	Template.Abilities.AddItem('ThrowHunterKillerDrone');//This will be changed to deploy a small drone which can be moved about

//	Template.RewardDecks.AddItem('CombatDroneRewards');

	Template.CanBeBuilt = false;

	Template.WeaponPrecomputedPathData.InitialPathTime = 0.75;
	Template.WeaponPrecomputedPathData.MaxPathTime = 1.5;
	Template.WeaponPrecomputedPathData.MaxNumberOfBounces = 0;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.HUNTERKILLERI_RANGE);

	return Template;
}

static function X2WeaponTemplate CreateHunterKiller2Item()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'HunterKiller2Item');
	Template.ItemCat = 'CombatDrone';
	Template.WeaponCat = 'CombatDrone';
	Template.WeaponTech = 'conventional';
	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_BeltHolster;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_HKMK2";
	Template.EquipSound = "Gremlin_Equip";

	Template.BaseDamage = default.HUNTERKILLERII_BASEDAMAGE;
	Template.iSoundRange = default.HUNTERKILLERII_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.HUNTERKILLERII_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.HUNTERKILLERII_ICLIPSIZE;
	Template.iRange = default.HUNTERKILLERII_RANGE;
	Template.iRadius = default.HUNTERKILLERII_RADIUS;
	Template.PointsToComplete = default.HUNTERKILLERII_IPOINTS;
	Template.TradingPostValue = default.HUNTERKILLERII_TRADINGPOSTVALUE;

	Template.GameArchetype = "SAV_Hunterkillers.WP_Grenade_HKDroneMK2";

	Template.bMergeAmmo = true;
	Template.DamageTypeTemplateName = 'Explosion';

	Template.Abilities.AddItem('ThrowHunterKillerDrone');//This will be changed to deploy a small drone which can be moved about

	Template.CanBeBuilt = false;
	
	Template.CreatorTemplateName = 'AdvancedDrones'; // The schematic which creates this item
	Template.BaseItem = 'HunterKillerItem'; // Which item this will be upgraded from

	Template.WeaponPrecomputedPathData.InitialPathTime = 0.75;
	Template.WeaponPrecomputedPathData.MaxPathTime = 1.5;
	Template.WeaponPrecomputedPathData.MaxNumberOfBounces = 0;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.HUNTERKILLERII_RANGE);

	return Template;
}

static function X2DataTemplate CreateSavRegen()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavRegen');
	Template.ItemCat = 'heal';
	Template.WeaponCat = 'UtilityCatHeal';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_RegenSprayer";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.iClipSize = default.SAV_REGEN_CHARGES;
	Template.iRange = default.SAV_REGEN_RANGE_TILES;
	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('SavRegenSpray');
	Template.Abilities.AddItem('MEDAmod_RegenBonusUses');
//	Template.Abilities.AddItem('MedipackStabilize');

	Template.Requirements.RequiredTechs.AddItem('AlienBiotech');

	Template.TradingPostValue = Default.SAVREGEN1_TPV;
	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.SAV_REGEN_CHARGES);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.SAV_REGEN_RANGE_TILES);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RegenLabel, , class'X2Ability_SavItemAbilities_Core'.default.SAVREGEN_REGEN_AMOUNT);

	Template.GameArchetype = "SavItems_Art.RegenSpray.WP_SavRegenSprayer";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.HideIfResearched  = 'BattlefieldMedicine';

	Template.bShouldCreateDifficultyVariants = true;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SAV_REGEN_COST_SUPPLIES;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateSavRegen2()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavRegen2');
	Template.ItemCat = 'heal';
	Template.WeaponCat = 'UtilityCatHeal';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_RegenSprayer2";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.iClipSize = default.SAV_REGEN2_CHARGES;
	Template.iRange = default.SAV_REGEN2_RANGE_TILES;
	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('SavRegenSpray2');
	Template.Abilities.AddItem('MEDAmod_Regen2BonusUses');
//	Template.Abilities.AddItem('MedipackStabilize');

	Template.TradingPostValue = Default.SAVREGEN2_TPV;

	Template.Requirements.RequiredTechs.AddItem('BattlefieldMedicine');
	Template.CreatorTemplateName = 'BattlefieldMedicine'; // The schematic which creates this item
	Template.BaseItem = 'SavRegen'; // Which item this will be upgraded from

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.SAV_REGEN2_CHARGES);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.SAV_REGEN2_RANGE_TILES);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RegenLabel, , class'X2Ability_SavItemAbilities_Core'.default.SAVREGEN2_REGEN_AMOUNT);

	Template.GameArchetype = "SavItems_Art.RegenSpray.WP_SavRegenSprayer";

	Template.Tier = 1;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.bShouldCreateDifficultyVariants = true;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SAV_REGEN2_COST_SUPPLIES;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateSavNaniteRegen()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavNaniteRegen');
	Template.ItemCat = 'heal';
	Template.WeaponCat = 'UtilityCatHeal';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_NanoRegen";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.iClipSize = default.SAV_NANOREGEN_CHARGES;
	Template.iRange = default.SAV_NANOREGEN_RANGE_TILES;
	Template.bMergeAmmo = true;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughNanotechRegeneration');

	Template.Abilities.AddItem('SavNanoRegenSpray');
	Template.Abilities.AddItem('MEDAmod_NanoRegenBonusUses');

	Template.TradingPostValue = Default.SAVNANOREGEN_TPV;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.SAV_NANOREGEN_CHARGES);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.SAV_NANOREGEN_RANGE_TILES);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RegenLabel, , class'X2Ability_SavItemAbilities_Core'.default.SAVREGEN_NANOREGEN_AMOUNT);

	Template.GameArchetype = "SavItems_Art.NaniteRegenSpray.WP_SavNaniteRegenSprayer";

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SAV_NANOREGEN_COST_SUPPLIES;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Artifacts.ItemTemplateName = 'CorpseSpectre';
	Artifacts.Quantity = default.SAV_NANOREGEN_COST_SPECTRE;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Template.bShouldCreateDifficultyVariants = true;

	return Template;
}

static function X2DataTemplate CreateSavStimulator()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavStimulator');
	Template.ItemCat = 'heal';
	Template.WeaponCat = 'UtilityCatHeal';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SavStimulator";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.iClipSize = default.SAV_STIMULATOR_CHARGES;
	Template.iRange = default.SAV_STIMULATOR_RANGE_TILES;
	Template.bMergeAmmo = true;

	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventStunLancer');

	Template.Abilities.AddItem('SavStimulate');
	Template.Abilities.AddItem('MEDAmod_StimulatorBonusUses');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.SAV_STIMULATOR_CHARGES);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.SAV_STIMULATOR_RANGE_TILES);

	Template.GameArchetype = "SAV_CommandDesignator.Stimulator.WP_Stimulator";

	Template.TradingPostValue = Default.SAVSTIMULATOR_TPV;

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.bShouldCreateDifficultyVariants = true;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SAV_STIMULATOR_COST_SUPPLIES;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateGrappleAMod()
 {

	local X2WeaponTemplate	Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'GrappleAMod');

	Template.strImage = "img:///UILibrary_SavageItems.Inv_GrappleAMod";
	Template.EquipSound = "StrategyUI_Vest_Equip";
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.ItemCat = 'bplating';
	Template.WeaponCat = 'utility';
	Template.Tier = 1;

	Template.TradingPostValue = Default.SAVGRAPPLE_AMOD_TPV;

	// Abilities:
//	Template.Abilities.AddItem('AModGrapple');
	Template.Abilities.AddItem('Grapple');
	Template.Abilities.AddItem('AModBonusSlotBlocker');

	// Build:
//	Template.RewardDecks.AddItem('PlatedAModRewards');
	Template.CanBeBuilt = false;
	Template.StartingItem = false;
	Template.bInfiniteItem = false;

	return Template;

}

static function X2DataTemplate CreatePoweredMeleeAMod()
 {

	local X2WeaponTemplate	Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PoweredMeleeAMod');

	Template.strImage = "img:///UILibrary_SavageItems.Inv_PoweredAModMelee";
	Template.EquipSound = "StrategyUI_Vest_Equip";
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.ItemCat = 'bplating';
	Template.WeaponCat = 'utility';
	Template.Tier = 2;

	Template.BaseDamage = default.POWEREDMELEEAMOD_BASEDAMAGE;

	// Abilities:
	Template.Abilities.AddItem('AModBonusSlotBlocker');
	Template.Abilities.AddItem('SavSkullcrusher');
	Template.Abilities.AddItem('PoweredMeleeAModBonus');
	Template.Abilities.AddItem('PoweredMeleeAModAnimset');
	Template.Abilities.AddItem('Bulky');
	Template.Abilities.AddItem('SkullCrushingStrength');
	
	Template.TradingPostValue = Default.SAVPOWEREDMELEE_AMOD_TPV;

	// Build:
//	Template.RewardDecks.AddItem('PoweredAModRewards');
	Template.CanBeBuilt = false;
	Template.StartingItem = false;
	Template.bInfiniteItem = false;

	return Template;

}

static function X2DataTemplate CreateHiddenBladesCV()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'HiddenBladesCV');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'HiddenBlades';
	Template.WeaponCat = 'HiddenBlades';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_HiddenBlades_CV";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_Utility;

//	eSlot_RightForearm;
//	Template.StowedLocation = eSlot_RightBack;

// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "Sav_HiddenBlades.WP_HiddenBlades_CV";
//	Template.GameArchetype = "WP_Sword_CV.WP_Sword_CV";

//	Template.AddDefaultAttachment('R_Back', "MagSword.Meshes.SM_MagSword_Sheath", false);
	Template.Tier = 0;

	Template.Abilities.AddItem('SavHiddenBladeStab');
	Template.Abilities.AddItem('SavHiddenBladeKill');
	Template.Abilities.AddItem('SAVHiddenBladesConcealment');
	
	Template.iRadius = 1;
	Template.NumUpgradeSlots = 0;
	Template.iPhysicsImpulse = 1;

	Template.iRange = 0;
	Template.BaseDamage = default.HIDDENBLADES_CONVENTIONAL_BASEDAMAGE;
	Template.iClipSize = default.HIDDENBLADES_CONVENTIONAL_ICLIPSIZE;
	Template.Aim = default.HIDDENBLADES_CONVENTIONAL_AIM;
	Template.CritChance = default.HIDDENBLADES_CONVENTIONAL_CRITCHANCE;
	Template.iSoundRange = default.HIDDENBLADES_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.HIDDENBLADES_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.BaseDamage.DamageType = 'Melee';
	
	Template.TradingPostValue = Default.HIDDENBLADES_TPV;

	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.UpgradeItem = 'HiddenBladesMG'; // Which item this can be upgraded to
	Template.HideIfPurchased = 'Sword_MG_Schematic';// need this to hide the item once upgraded

	Template.DamageTypeTemplateName = 'Melee';

	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_HIDDENBLADE;
 	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateHiddenBladesMG()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'HiddenBladesMG');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'HiddenBlades';
	Template.WeaponCat = 'HiddenBlades';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_HiddenBlades_MG";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_Utility;

//	eSlot_RightForearm;
//	Template.StowedLocation = eSlot_RightBack;

// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "Sav_HiddenBlades.WP_HiddenBlades_MG";
//	Template.GameArchetype = "WP_Sword_CV.WP_Sword_CV";

//	Template.AddDefaultAttachment('R_Back', "MagSword.Meshes.SM_MagSword_Sheath", false);
	Template.Tier = 0;

	Template.Abilities.AddItem('SavHiddenBladeStab');
	Template.Abilities.AddItem('SavHiddenBladeKill');
	Template.Abilities.AddItem('SAVHiddenBladesConcealment');
	
	Template.iRadius = 1;
	Template.NumUpgradeSlots = 0;
	Template.iPhysicsImpulse = 2;

	Template.iRange = 0;
	Template.BaseDamage = default.HIDDENBLADES_MAGNETIC_BASEDAMAGE;
	Template.iClipSize = default.HIDDENBLADES_MAGNETIC_ICLIPSIZE;
	Template.Aim = default.HIDDENBLADES_MAGNETIC_AIM;
	Template.CritChance = default.HIDDENBLADES_MAGNETIC_CRITCHANCE;
	Template.iSoundRange = default.HIDDENBLADES_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.HIDDENBLADES_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.BaseDamage.DamageType = 'Melee';
	
	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, 33, false));

	Template.TradingPostValue = Default.HIDDENBLADES_MG_TPV;

	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventStunLancer');

	Template.CreatorTemplateName = 'Sword_MG_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'HiddenBladesCV'; // Which item this will be upgraded from

	Template.HideIfPurchased = 'Sword_BM_Schematic';// need this to hide the item once upgraded
	Template.UpgradeItem = 'HiddenBladesBM'; // Which item this can be upgraded to

	Template.DamageTypeTemplateName = 'Melee';

	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_HIDDENBLADE_MG;
 	Template.Cost.ResourceCosts.AddItem(Resources);

	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.ALLOY_COST_HIDDENBLADE_MG;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	return Template;
}

static function X2DataTemplate CreateHiddenBladesBM()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'HiddenBladesBM');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'HiddenBlades';
	Template.WeaponCat = 'HiddenBlades';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_HiddenBlades_BM";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_Utility;

//	eSlot_RightForearm;
//	Template.StowedLocation = eSlot_RightBack;

// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "Sav_HiddenBlades.WP_HiddenBlades_BM";
//	Template.GameArchetype = "WP_Sword_CV.WP_Sword_CV";

//	Template.AddDefaultAttachment('R_Back', "MagSword.Meshes.SM_MagSword_Sheath", false);
	Template.Tier = 1;

	Template.Abilities.AddItem('SavHiddenBladeStab');
	Template.Abilities.AddItem('SavHiddenBladeKill');
	Template.Abilities.AddItem('SAVHiddenBladesConcealment');
	
	Template.iRadius = 1;
	Template.NumUpgradeSlots = 0;
	Template.iPhysicsImpulse = 2;

	Template.iRange = 0;
	Template.BaseDamage = default.HIDDENBLADES_BEAM_BASEDAMAGE;
	Template.iClipSize = default.HIDDENBLADES_BEAM_ICLIPSIZE;
	Template.Aim = default.HIDDENBLADES_BEAM_AIM;
	Template.CritChance = default.HIDDENBLADES_BEAM_CRITCHANCE;
	Template.iSoundRange = default.HIDDENBLADES_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.HIDDENBLADES_BEAM_IENVIRONMENTDAMAGE;
	Template.BaseDamage.DamageType = 'Melee';

	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));
	
	Template.TradingPostValue = Default.HIDDENBLADES_BM_TPV;

	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('AutopsyArchon');

	Template.CreatorTemplateName = 'Sword_BM_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'HiddenBladesMG'; // Which item this will be upgraded from

	Template.DamageTypeTemplateName = 'Melee';

	Resources.ItemTemplateName = 'Supplies';
 	Resources.Quantity = default.SUPPLY_COST_HIDDENBLADE_BM;
 	Template.Cost.ResourceCosts.AddItem(Resources);

	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.ALLOY_COST_HIDDENBLADE_BM;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = default.ELERIUM_COST_HIDDENBLADE_BM;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate SAVReaperHiddenBlades()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVReaperHiddenBlades');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'HiddenBlades';
	Template.WeaponCat = 'HiddenBlades';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ReaperBlade";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_Utility;

//	eSlot_RightForearm;
//	Template.StowedLocation = eSlot_RightBack;

// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "Sav_HiddenBlades.WP_ReaperBlades";
//	Template.GameArchetype = "WP_Sword_CV.WP_Sword_CV";
	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBleedingStatusEffect(2, 1));
//	Template.AddDefaultAttachment('R_Back', "MagSword.Meshes.SM_MagSword_Sheath", false);
	Template.Tier = 1;

	Template.Abilities.AddItem('SavHiddenBladeStab');
	Template.Abilities.AddItem('SavHiddenBladeKill');
	Template.Abilities.AddItem('SAVHiddenBladesConcealment');
	
	Template.iRadius = 1;
	Template.NumUpgradeSlots = 0;
	Template.iPhysicsImpulse = 2;

	Template.iRange = 0;
	Template.BaseDamage = default.HIDDENBLADES_REAPER_BASEDAMAGE;
	Template.iClipSize = default.HIDDENBLADES_REAPER_ICLIPSIZE;
	Template.Aim = default.HIDDENBLADES_REAPER_AIM;
	Template.CritChance = default.HIDDENBLADES_REAPER_CRITCHANCE;
	Template.iSoundRange = default.HIDDENBLADES_REAPER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.HIDDENBLADES_REAPER_IENVIRONMENTDAMAGE;
	Template.BaseDamage.DamageType = 'Melee';
	
	Template.TradingPostValue = Default.HIDDENBLADES_REAPER_TPV;

	Template.StartingItem = false;
	Template.CanBeBuilt = False;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Melee';
	
	return Template;
}

static function X2DataTemplate CreateSavSerumBlue()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts, Artifacts2, Artifacts3;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavSerumBlue');
	Template.ItemCat = 'serums';
	Template.WeaponCat = 'utility';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SerumBlue";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.BaseDamage = default.SAVSERUMBLUE_BASEDAMAGE;
	Template.iSoundRange = default.SAVSERUMBLUE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SAVSERUMBLUE_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.SAVSERUMBLUE_ICLIPSIZE;
	Template.iRange = default.SAVSERUMBLUE_RANGE;

	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('SavSerumBlueExposure');
	Template.Abilities.AddItem('SavAdministerSerumBlue');
	Template.Abilities.AddItem('SavItemsPassiveConsumption2');//The chance to consume effect

	Template.GameArchetype = "Sav_CombatStims.SerumGuns.WP_BlueSerumGun";
	
	Template.Tier = 1;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.TRADINGPOST_SAVSERUMBLUE;

	Template.Requirements.RequiredTechs.AddItem('SavTechXenoSerumSynthesis');
	Template.Requirements.RequiredTechs.AddItem('AutopsySectoid');
	Template.Requirements.RequiredTechs.AddItem('AutopsyViper');

	Template.bShouldCreateDifficultyVariants = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.SAVSERUMBLUE_ICLIPSIZE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.SAVSERUMBLUE_RANGE);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_SAVSERUMBLUE;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'CorpseSectoid';
	Artifacts.Quantity = default.SECTOID_COST_SAVSERUMBLUE;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Artifacts2.ItemTemplateName = 'CorpseViper';
	Artifacts2.Quantity = default.VIPER_COST_SAVSERUMBLUE;
	Template.Cost.ArtifactCosts.AddItem(Artifacts2);

	Artifacts3.ItemTemplateName = 'SavBioSample';
	Artifacts3.Quantity = default.BIOSAMPLE_COST_SAVSERUMBLUE;
	Template.Cost.ArtifactCosts.AddItem(Artifacts3);

	return Template;
}

static function X2DataTemplate CreateSavSerumRed()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts, Artifacts2, Artifacts3;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavSerumRed');
	Template.ItemCat = 'serums';
	Template.WeaponCat = 'utility';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SerumRed";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.BaseDamage = default.SAVSERUMRED_BASEDAMAGE;
	Template.iSoundRange = default.SAVSERUMBLUE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SAVSERUMBLUE_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.SAVSERUMBLUE_ICLIPSIZE;
	Template.iRange = default.SAVSERUMBLUE_RANGE;

	Template.bMergeAmmo = true;
	
	Template.Abilities.AddItem('SavSerumRedExposure');
	Template.Abilities.AddItem('SavAdministerSerumRed');
	Template.Abilities.AddItem('SavItemsPassiveConsumption2');//The chance to consume effect

	Template.GameArchetype = "Sav_CombatStims.SerumGuns.WP_RedSerumGun";
	
	Template.Tier = 1;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.TRADINGPOST_SAVSERUMRED;

	Template.Requirements.RequiredTechs.AddItem('SavTechXenoSerumSynthesis');
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventStunLancer');
	Template.Requirements.RequiredTechs.AddItem('AutopsyChryssalid');

	Template.bShouldCreateDifficultyVariants = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.SAVSERUMBLUE_ICLIPSIZE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.SAVSERUMBLUE_RANGE);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_SAVSERUMRED;
	Template.Cost.ResourceCosts.AddItem(Resources);

	// Cost
	Artifacts.ItemTemplateName = 'CorpseChryssalid';
	Artifacts.Quantity = default.CHRYSSALID_COST_SAVSERUMRED;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Artifacts2.ItemTemplateName = 'CorpseAdventStunLancer';
	Artifacts2.Quantity = default.STUNLANCER_COST_SAVSERUMRED;
	Template.Cost.ArtifactCosts.AddItem(Artifacts2);

	Artifacts3.ItemTemplateName = 'SavBioSample';
	Artifacts3.Quantity = default.BIOSAMPLE_COST_SAVSERUMRED;
	Template.Cost.ArtifactCosts.AddItem(Artifacts3);

	return Template;
}

static function X2DataTemplate CreateSavSerumYellow()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts, Artifacts2, Artifacts3;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavSerumYellow');
	Template.ItemCat = 'serums';
	Template.WeaponCat = 'utility';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SerumYellow";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.BaseDamage = default.SAVSERUMYELLOW_BASEDAMAGE;
	Template.iSoundRange = default.SAVSERUMBLUE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SAVSERUMBLUE_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.SAVSERUMBLUE_ICLIPSIZE;
	Template.iRange = default.SAVSERUMBLUE_RANGE;

	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('SavSerumYellowExposure');
	Template.Abilities.AddItem('SavAdministerSerumYellow');
	Template.Abilities.AddItem('SavItemsPassiveConsumption2');//The chance to consume effect

	Template.GameArchetype = "Sav_CombatStims.SerumGuns.WP_YellowSerumGun";
	
	Template.Tier = 1;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.TRADINGPOST_SAVSERUMYELLOW;

	Template.Requirements.RequiredTechs.AddItem('SavTechXenoSerumSynthesis');
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventShieldbearer');
	Template.Requirements.RequiredTechs.AddItem('AutopsyFaceless');

	Template.bShouldCreateDifficultyVariants = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.SAVSERUMBLUE_ICLIPSIZE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.SAVSERUMBLUE_RANGE);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_SAVSERUMYELLOW;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'CorpseAdventShieldbearer';
	Artifacts.Quantity = default.SHIELDBEARER_COST_SAVSERUMYELLOW;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Artifacts2.ItemTemplateName = 'CorpseFaceless';
	Artifacts2.Quantity = default.FACELESS_COST_SAVSERUMYELLOW;
	Template.Cost.ArtifactCosts.AddItem(Artifacts2);

	Artifacts3.ItemTemplateName = 'SavBioSample';
	Artifacts3.Quantity = default.BIOSAMPLE_COST_SAVSERUMYELLOW;
	Template.Cost.ArtifactCosts.AddItem(Artifacts3);

	return Template;
}

static function X2DataTemplate CreateSavSerumOrange()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts, Artifacts2, Artifacts3;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavSerumOrange');
	Template.ItemCat = 'serums';
	Template.WeaponCat = 'utility';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SerumOrange";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.BaseDamage = default.SAVSERUMORANGE_BASEDAMAGE;
	Template.iSoundRange = default.SAVSERUMBLUE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SAVSERUMBLUE_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.SAVSERUMBLUE_ICLIPSIZE;
	Template.iRange = default.SAVSERUMBLUE_RANGE;

	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('SavSerumOrangeExposure');
	Template.Abilities.AddItem('SavAdministerSerumOrange');
	Template.Abilities.AddItem('SavItemsPassiveConsumption2');//The chance to consume effect

	Template.GameArchetype = "Sav_CombatStims.SerumGuns.WP_OrangeSerumGun";
	
	Template.Tier = 1;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.TRADINGPOST_SAVSERUMORANGE;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughSerumORANGE');
	Template.Requirements.RequiredTechs.AddItem('SavTechXenoSerumSynthesis');
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventShieldbearer');
	Template.Requirements.RequiredTechs.AddItem('AutopsyBerserker');

	Template.bShouldCreateDifficultyVariants = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.SAVSERUMBLUE_ICLIPSIZE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.SAVSERUMBLUE_RANGE);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_SAVSERUMORANGE;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'CorpseAdventShieldbearer';
	Artifacts.Quantity = default.CORPSE1_COST_SAVSERUMORANGE;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Artifacts2.ItemTemplateName = 'CorpseBerserker';
	Artifacts2.Quantity = default.CORPSE2_COST_SAVSERUMORANGE;
	Template.Cost.ArtifactCosts.AddItem(Artifacts2);

	Artifacts3.ItemTemplateName = 'SavBioSample';
	Artifacts3.Quantity = default.BIOSAMPLE_COST_SAVSERUMORANGE;
	Template.Cost.ArtifactCosts.AddItem(Artifacts3);

	return Template;
}

static function X2DataTemplate CreateSavSerumViolet()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts, Artifacts2, Artifacts3;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavSerumViolet');
	Template.ItemCat = 'serums';
	Template.WeaponCat = 'utility';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SerumViolet";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.BaseDamage = default.SAVSERUMVIOLET_BASEDAMAGE;
	Template.iSoundRange = default.SAVSERUMBLUE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SAVSERUMBLUE_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.SAVSERUMBLUE_ICLIPSIZE;
	Template.iRange = default.SAVSERUMBLUE_RANGE;

	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('SavSerumVioletExposure');
	Template.Abilities.AddItem('SavAdministerSerumViolet');
	Template.Abilities.AddItem('SAVMindCrush');
	Template.Abilities.AddItem('ShieldOverAnimset');//The MindCrush animation is in the same animset
	Template.Abilities.AddItem('SavItemsPassiveConsumption2');//The chance to consume effect

	Template.GameArchetype = "Sav_CombatStims.SerumGuns.WP_VioletSerumGun";
	
	Template.Tier = 1;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.TRADINGPOST_SAVSERUMVIOLET;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughSerumVIOLET');
	Template.Requirements.RequiredTechs.AddItem('SavTechXenoSerumSynthesis');
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventPriest');
	Template.Requirements.RequiredTechs.AddItem('AutopsySectoid');

	Template.bShouldCreateDifficultyVariants = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.SAVSERUMBLUE_ICLIPSIZE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.SAVSERUMBLUE_RANGE);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_SAVSERUMVIOLET;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'CorpseAdventPriest';
	Artifacts.Quantity = default.CORPSE1_COST_SAVSERUMVIOLET;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Artifacts2.ItemTemplateName = 'CorpseSectoid';
	Artifacts2.Quantity = default.CORPSE2_COST_SAVSERUMVIOLET;
	Template.Cost.ArtifactCosts.AddItem(Artifacts2);

	Artifacts3.ItemTemplateName = 'SavBioSample';
	Artifacts3.Quantity = default.BIOSAMPLE_COST_SAVSERUMVIOLET;
	Template.Cost.ArtifactCosts.AddItem(Artifacts3);

	return Template;
}

static function X2DataTemplate CreateSavSerumGreen()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local ArtifactCost Artifacts, Artifacts2, Artifacts3;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavSerumGreen');
	Template.ItemCat = 'serums';
	Template.WeaponCat = 'utility';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SerumGreen";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.BaseDamage = default.SAVSERUMGREEN_BASEDAMAGE;
	Template.iSoundRange = default.SAVSERUMBLUE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SAVSERUMBLUE_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.SAVSERUMBLUE_ICLIPSIZE;
	Template.iRange = default.SAVSERUMGREEN_RANGE;

	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('SavSerumGreenExposure');
	Template.Abilities.AddItem('SAVSerumGreenAcidBlood');
	Template.Abilities.AddItem('SavAdministerSerumGreen');
	Template.Abilities.AddItem('SAVSerumGreenPoisonSpit');
	Template.Abilities.AddItem('ShieldOverAnimset');//The HL_SAVPoisonSpit animation is in the same animset
	Template.Abilities.AddItem('SavItemsPassiveConsumption2');//The chance to consume effect
	
	Template.GameArchetype = "Sav_CombatStims.SerumGuns.WP_GreenSerumGun";
	
	Template.Tier = 1;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.TRADINGPOST_SAVSERUMGREEN;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughSerumGREEN');
	Template.Requirements.RequiredTechs.AddItem('SavTechXenoSerumSynthesis');
	Template.Requirements.RequiredTechs.AddItem('AutopsyAndromedon');
	Template.Requirements.RequiredTechs.AddItem('AutopsyViper');

	Template.bShouldCreateDifficultyVariants = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.SAVSERUMBLUE_ICLIPSIZE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.SAVSERUMBLUE_RANGE);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_SAVSERUMGREEN;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'CorpseAndromedon';
	Artifacts.Quantity = default.CORPSE1_COST_SAVSERUMGREEN;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Artifacts2.ItemTemplateName = 'CorpseViper';
	Artifacts2.Quantity = default.CORPSE2_COST_SAVSERUMGREEN;
	Template.Cost.ArtifactCosts.AddItem(Artifacts2);

	Artifacts3.ItemTemplateName = 'SavBioSample';
	Artifacts3.Quantity = default.BIOSAMPLE_COST_SAVSERUMGREEN;
	Template.Cost.ArtifactCosts.AddItem(Artifacts3);

	return Template;
}

static function X2DataTemplate CreateSavRationBar()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavRationBar');
	Template.ItemCat = 'rations';
	Template.WeaponCat = 'rations';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SavRationBar";
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.Abilities.AddItem('SavEatRations');

	Template.GameArchetype = "Sav_CombatStims.RationBars.WP_RationBars";
	
	Template.bMergeAmmo = true;

	Template.Tier = 0;

	Template.iClipSize = default.RATIONBARS_ICLIPSIZE;
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.RATIONBARS_ICLIPSIZE);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RegenLabel, , class'X2Ability_SavItemAbilities_Core'.default.RATIONBAR_REGEN_AMOUNT);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MaxRegenLabel, , class'X2Ability_SavItemAbilities_Core'.default.RATIONBAR_MAX_REGEN_AMOUNT);

	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.TradingPostValue = Default.TPV_RATIONS;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_RATIONS;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateSavCOREBar()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavCOREBar');
	Template.ItemCat = 'rations';
	Template.WeaponCat = 'rations';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_COREBar";
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.Abilities.AddItem('SavEatCOREBar');
	Template.Abilities.AddItem('SavItemsPassiveConsumption1');

	Template.GameArchetype = "Sav_CombatStims.RationBars.WP_RationBars";
	
	Template.bMergeAmmo = true;

	Template.Tier = 0;

	Template.TradingPostValue = default.COREBARS_TRADEVAL;

	Template.iClipSize = default.RATIONBARS_ICLIPSIZE;
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.RATIONBARS_ICLIPSIZE);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RegenLabel, , class'X2Ability_SavItemAbilities_Core'.default.RATIONBAR_REGEN_AMOUNT);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MaxRegenLabel, , class'X2Ability_SavItemAbilities_Core'.default.COREBAR_MAX_REGEN_AMOUNT);

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.BlackMarketTexts = default.COREBlackMarketTexts;
	Template.RewardDecks.AddItem('SAVSmallItems');
	Template.RewardDecks.AddItem('SAVBMSmallItems');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_SAVCOREBAR;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateSavReaperBushMeat()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavReaperBushMeat');
	Template.ItemCat = 'rations';
	Template.WeaponCat = 'rations';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ReaperBushMeat";
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.Abilities.AddItem('SavEatReaperBushMeat');
	Template.Abilities.AddItem('SavItemsBushMeatConsumption');

	Template.GameArchetype = "Sav_CombatStims.RationBars.WP_RationBars";
	
	Template.bMergeAmmo = true;

	Template.Tier = 0;

	Template.TradingPostValue = default.REAPERMEAT_TRADEVAL;

	Template.iClipSize = default.REAPERMEAT_ICLIPSIZE;
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ChargesLabel, , default.REAPERMEAT_ICLIPSIZE);

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	return Template;
}

static function X2DataTemplate CreateSavComDrug_Raptor()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavComDrug_Raptor');
	Template.ItemCat = 'utility';
	Template.WeaponCat = 'utility';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SavComDrug_Raptor";
	Template.EquipSound = "Conventional_Weapon_Equip";
	
	Template.Abilities.AddItem('SavCombatDrug_Raptor');//The Passive Effect
	Template.Abilities.AddItem('SAVRaptorSupply');//The chance to consume effect
	
	Template.bMergeAmmo = true;

	Template.Tier = 0;

	Template.TradingPostValue = default.SAVRAPTOR_TRADEVAL;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.AimLabel, eStat_Offense, 10);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CriticalChanceBonusLabel, eStat_CritChance, 15);

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.BlackMarketTexts = default.COREBlackMarketTexts;
	Template.RewardDecks.AddItem('SAVBMSmallItems');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 10;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateSavComDrug_Turbo()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavComDrug_Turbo');
	Template.ItemCat = 'utility';
	Template.WeaponCat = 'utility';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SavComDrug_Turbo";
	Template.EquipSound = "Conventional_Weapon_Equip";
	
	Template.Abilities.AddItem('SavCombatDrug_Turbo');//The Passive Effect
	Template.Abilities.AddItem('SAVTurboSupply');//The chance to consume effect
	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, 3);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, 20);

	Template.bMergeAmmo = true;

	Template.Tier = 0;
		
	Template.BaseDamage = default.SAVTURBO_BASEDAMAGE;
	Template.TradingPostValue = default.SAVTURBO_TRADEVAL;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.BlackMarketTexts = default.COREBlackMarketTexts;
	Template.RewardDecks.AddItem('SAVBMSmallItems');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 10;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateSavComDrug_Klarity()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavComDrug_Klarity');
	Template.ItemCat = 'utility';
	Template.WeaponCat = 'utility';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SavComDrug_Klarity";
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.Abilities.AddItem('SavCombatDrug_Klarity');//The Passive Effect
	Template.Abilities.AddItem('SavKlarityClense');//Clears negative mental effects on turn start
	Template.Abilities.AddItem('SAVKlaritySupply');//The chance to consume effect

	Template.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, 30);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.AimLabel, eStat_Offense, 5);
//	Template.SetUIStatMarkup(class'XLocalizedData'.default.DefenceLabel, eStat_Defence, 5);// - no such thing aparantly?

	Template.bMergeAmmo = true;

	Template.Tier = 0;
	Template.BaseDamage = default.SAVKLARITY_BASEDAMAGE;
	Template.TradingPostValue = default.SAVKLARITY_TRADEVAL;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.BlackMarketTexts = default.COREBlackMarketTexts;
	Template.RewardDecks.AddItem('SAVBMSmallItems');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 10;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateSavComDrug_RedHaze()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavComDrug_RedHaze');
	Template.ItemCat = 'utility';
	Template.WeaponCat = 'utility';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SavComDrug_RedHaze";
	Template.EquipSound = "Conventional_Weapon_Equip";
	
	Template.Abilities.AddItem('SAVInjectRedHaze');//	Activates the drug and all its effects
	Template.Abilities.AddItem('SAVRedHazeGetMad');//	Allows the user to go into a Red Haze
	Template.Abilities.AddItem('SAVRedHazeSupply');//	Consumes the Item on use on a chance

	Template.iClipSize = default.REDHAZE_ICLIPSIZE;
	Template.bMergeAmmo = true;

	Template.Tier = 0;

	Template.TradingPostValue = default.SAVREDHAZE_TRADEVAL;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.BlackMarketTexts = default.COREBlackMarketTexts;
	Template.RewardDecks.AddItem('SAVBMSmallItems');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 10;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateSavComDrug_Psiko()
{
	local X2WeaponTemplate Template;
	local X2Effect_Knockback	KnockbackEffect;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavComDrug_Psiko');
	Template.ItemCat = 'utility';
	Template.WeaponCat = 'utility';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SavComDrug_Psiko";
	Template.EquipSound = "Conventional_Weapon_Equip";
	
	Template.Abilities.AddItem('SAVInjectPsiko');//Grants base effects
	Template.Abilities.AddItem('SAVPsikotik');//triggers on the Inject and on the attack
	Template.Abilities.AddItem('SAVPsikotikScream');//Psionic attack
	Template.Abilities.AddItem('SAVPsikoSupply');//Consumes the item
	Template.Abilities.AddItem('ShieldOverAnimset');//The '' animation is in the same animset

	Template.BaseDamage = default.PSIKO_BASEDAMAGE;
	Template.iClipSize = default.PSIKO_ICLIPSIZE;
	Template.iEnvironmentDamage = default.PSIKO_IIENVIRONMENTDAMAGE;
	Template.iRange = default.PSIKO_RANGE;
	Template.iRadius = default.PSIKO_IRADIUS;

	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.KnockbackDistance = 3;

	Template.iPhysicsImpulse = 10;

	Template.bMergeAmmo = true;

	Template.Tier = 0;

	Template.TradingPostValue = default.PSIKO_TRADEVAL;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.BlackMarketTexts = default.COREBlackMarketTexts;
	Template.RewardDecks.AddItem('SAVBMSmallItems');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 10;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateSavComDrug_Liston()
{
	local X2WeaponTemplate Template;
	local X2Effect_Knockback	KnockbackEffect;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavComDrug_Liston');
	Template.ItemCat = 'utility';
	Template.WeaponCat = 'utility';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SavComDrug_Liston";
	Template.EquipSound = "Conventional_Weapon_Equip";
	
	Template.Abilities.AddItem('SAVInjectListon');// Grants the boost and charges for the attack
	Template.Abilities.AddItem('SavListonSmash');// The Melee attack
	Template.Abilities.AddItem('SAVListonSupply');// Consumes the item sometimes
	Template.Abilities.AddItem('PoweredMeleeAModAnimset');// Animations

	Template.BaseDamage = default.LISTON_BASEDAMAGE;

	Template.iClipSize = default.LISTON_ICLIPSIZE;
	Template.bMergeAmmo = true;

	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.KnockbackDistance = 5;

	Template.iPhysicsImpulse = 15;

	Template.Tier = 0;

	Template.TradingPostValue = default.LISTON_TRADEVAL;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.BlackMarketTexts = default.COREBlackMarketTexts;
	Template.RewardDecks.AddItem('SAVBMSmallItems');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 10;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateSAVResistanceIED()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVResistanceIED');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'utility';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_PlasmaIED";
	Template.InventorySlot = eInvSlot_Utility;
	Template.GameArchetype = "SAV_PlasmaIED.WP_PlasmaIED";

	Template.iRadius = default.PLASMAIED_IRADIUS;
	Template.iRange = default.PLASMAIED_RANGE;

	Template.Abilities.AddItem('ThrowPlasmaIED');
	Template.Abilities.AddItem('PlasmaIEDSupply');

	Template.TradingPostValue = default.RESISTANCEIED_TRADEVAL;

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	return Template;
}

static function X2DataTemplate CreateNanoCloner()
{
	local X2WeaponTemplate Template;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVNanoCloner');

	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'pistol';
	Template.WeaponTech = 'alien';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_NanoCloner";
	Template.EquipSound = "StrategyUI_Skulljack_Equip";
	Template.Tier = 2;

	Template.RangeAccuracy = default.SHORT_NANOCLONER_RANGE;
	Template.BaseDamage = default.NANOCLONER_BASEDAMAGE;
	Template.Aim = default.NANOCLONER_AIM;
	Template.CritChance = default.NANOCLONER_CRITCHANCE;
	Template.iClipSize = default.NANOCLONER_ICLIPSIZE;
	Template.iSoundRange = default.NANOCLONER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.NANOCLONER_IENVIRONMENTDAMAGE;
	Template.bMergeAmmo = true;
	Template.InfiniteAmmo = false;
	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;

	Template.NumUpgradeSlots = 0;

	Template.GameArchetype = "SavNanoWarfare.WP_SavNanoCloner";
	
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.Abilities.AddItem('FireNanoCloner');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.SetAnimationNameForAbility('FanFire', 'FF_FireMultiShotConvA');

	Template.StartingItem = false;
	Template.bInfiniteItem = false;
	Template.CanBeBuilt = false;

	Template.iPhysicsImpulse = 0;
	Template.DamageTypeTemplateName = 'NanoShred';

	Template.PointsToComplete = 0;
	Template.TradingPostValue = default.NANOCLONER_TRADEVAL;
	Template.Tier = 1;

	Template.bHideClipSizeStat = false;

	return Template;
}

static function X2DataTemplate CreateTemplate_SAVNanoCloneWeapon()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVNanoCloneWeapon');
	
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'melee';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_PerkIcons.UIPerk_muton_punch";
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.StowedLocation = eSlot_RightHand;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Zombiefist.WP_Zombiefist";
	Template.Aim = 75;
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer); //invalidates multiplayer availability

	Template.iRange = 2;
	Template.iRadius = 1;
	Template.NumUpgradeSlots = 0;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 3;
	Template.iIdealRange = 1;

	Template.BaseDamage = default.NANOCLONE_MELEEATTACK_BASEDAMAGE;
	Template.BaseDamage.DamageType='NanoShred';
	Template.iSoundRange = 2;
	Template.iEnvironmentDamage = 15;

	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects_SAVItems'.static.CreateNanoShredStatusEffect());

	//Build Data
	Template.StartingItem = false;
	Template.CanBeBuilt = false;

	Template.bDisplayWeaponAndAmmo = false;

	Template.Abilities.AddItem('NanophagePunch');

	return Template;
}

static function X2WeaponTemplate BreachingGun()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BreachingGun');

	Template.ItemCat = 'ArmMountedAux';
	Template.WeaponCat = 'ArmMountedAux';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_WallBreacher";
	Template.InventorySlot = eInvSlot_Utility;
	Template.EquipSound = "StrategyUI_Heavy_Weapon_Equip";

	Template.Tier = 0;
	
	Template.BaseDamage = default.BREACHINGGUN_BASEDAMAGE;
	Template.iSoundRange = default.BREACHINGGUN_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BREACHINGGUN_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.BREACHINGGUN_ICLIPSIZE;
	Template.iRange = default.BREACHINGGUN_RANGE;
	Template.iRadius = default.BREACHINGGUN_RADIUS;

	Template.TradingPostValue = default.BREACHINGGUN_TRADINGPOSTVALUE;
	
	Template.StowedLocation = eSlot_HeavyWeapon;
	Template.GameArchetype = "SAV_BunkerModule2.WP_BreachingGun";
	Template.iPhysicsImpulse = 16;
	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('BreachingGunAbility');
	
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.BREACHINGGUN_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.BREACHINGGUN_RADIUS);

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_BREACHINGGUN;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateTemplate_SAVBunkerModuleWeapon()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVBunkerModuleWeapon');
	
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'melee';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_PerkIcons.UIPerk_muton_punch";
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.StowedLocation = eSlot_RightHand;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Zombiefist.WP_Zombiefist";//================================Needs an archetype
	Template.Aim = 100;
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer); //invalidates multiplayer availability

	Template.iRange = 7;
	Template.iRadius = 7;
	Template.NumUpgradeSlots = 0;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 0;

	Template.BaseDamage = default.BUNKERMODULEWEAPON_BASEDAMAGE;
	Template.iSoundRange = 0;
	Template.iEnvironmentDamage = 0;

	//Build Data
	Template.StartingItem = false;
	Template.CanBeBuilt = false;

	Template.bDisplayWeaponAndAmmo = false;

	Template.Abilities.AddItem('BunkerFieldAbility');

	return Template;
}

static function X2DataTemplate CreateTemplate_SAVCoverPackWeapon()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVCoverPackWeapon');
	
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'utility';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_PerkIcons.UIPerk_muton_punch";
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.StowedLocation = eSlot_RightHand;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Grenade_Frag.WP_Grenade_Frag";
	Template.Aim = 100;
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer); //invalidates multiplayer availability

	Template.iRange = 3;
	Template.iRadius = 3;
	Template.NumUpgradeSlots = 0;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.BaseDamage = default.COVERPACKWEAPON_BASEDAMAGE;
	Template.iSoundRange = 35;
	Template.iEnvironmentDamage = 25;
	Template.DamageTypeTemplateName = 'Explosion';

	//Build Data
	Template.StartingItem = false;
	Template.CanBeBuilt = false;

	Template.bDisplayWeaponAndAmmo = false;

	Template.Abilities.AddItem('SAVUnitSelfDestruct');

	return Template;
}

static function X2DataTemplate CreateSAV_ReaperRemoteDetonator()
{
	local X2WeaponTemplate Template;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAV_ReaperRemoteDetonator');
	Template.ItemCat = 'utility';
	Template.WeaponCat = 'utility';

	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_ReaperRemoteDetonator";//Temporary item
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	Template.BaseDamage = default.REAPER_REMOTEDETONATOR_BASEDAMAGE;
	Template.iSoundRange = default.REAPER_REMOTEDETONATOR_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.REAPER_REMOTEDETONATOR_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.REAPER_REMOTEDETONATOR_ICLIPSIZE;
	Template.iRange = default.REAPER_REMOTEDETONATOR_RANGE;
	Template.iRadius = default.REAPER_REMOTEDETONATOR_RADIUS;

	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('SAVReaperRemoteDetonator');

//	Template.GameArchetype = "SavItems_Art.Anims.WP_SavStunSprayer";///NEW one needed

	Template.Tier = 0;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.REAPER_TRADINGPOST_REMOTEDETONATOR;

	Template.bShouldCreateDifficultyVariants = false;

	return Template;
}

static function X2DataTemplate CreateSavSkirmisherAMod()
 {
 	local X2WeaponTemplate	Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SavSkirmisherAMod');

	Template.strImage = "img:///UILibrary_SavageItems.Inv_Skirm_Amod";
	Template.EquipSound = "StrategyUI_Vest_Equip";
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.ItemCat = 'bplating';
	Template.WeaponCat = 'utility';
	Template.Tier = 1;

	Template.TradingPostValue = Default.SAVSKIRMISHER_AMOD_TPV;

	// Abilities:
	Template.Abilities.AddItem('Grapple');
	Template.Abilities.AddItem('AModBonusSlotBlocker');
	Template.Abilities.AddItem('WebbingOverlayBonus');
	Template.Abilities.AddItem('TotalCombat');

	// Build:
	Template.CanBeBuilt = false;
	Template.StartingItem = false;
	Template.bInfiniteItem = false;

	return Template;
}

static function X2DataTemplate SAVChainBreakerTool()
{
	local X2WeaponTemplate Template;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVChainBreakerTool');
	Template.ItemCat = 'SavHackTool';
	Template.WeaponCat = 'utility';

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_LowerBack;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Skirm_ChainBreaker";
	Template.EquipSound = "StrategyUI_Medkit_Equip";
	Template.iRange = default.SKIRMISHERCHAINBREAKER_RANGE;
	Template.iRadius = default.SKIRMISHERCHAINBREAKER_RADIUS;
	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('AdvHackTlUplink');
	Template.Abilities.AddItem('Infiltration');
	Template.Abilities.AddItem('SavUploadChainbreakerVirus');

	Template.Tier = 1;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.TradingPostValue = Default.SKIRMISHERCHAINBREAKER_TPV;

	Template.bShouldCreateDifficultyVariants = true;

	return Template;
}

static function X2WeaponTemplate SAVSkirmisherMagBlaster()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVSkirmisherMagBlaster');

	Template.ItemCat = 'ArmMountedAux';
	Template.WeaponCat = 'ArmMountedAux';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Skirm_MagBlaster";
	Template.InventorySlot = eInvSlot_Utility;
	Template.EquipSound = "StrategyUI_Heavy_Weapon_Equip";

	Template.Tier = 1;
	
	Template.BaseDamage = default.SKIRMISHERMAGBLASTER_BASEDAMAGE;
	Template.iSoundRange = default.SKIRMISHERMAGBLASTER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SKIRMISHERMAGBLASTER_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.SKIRMISHERMAGBLASTER_ICLIPSIZE;
	Template.iRange = default.SKIRMISHERMAGBLASTER_RANGE;
	Template.iRadius = default.SKIRMISHERMAGBLASTER_RADIUS;

	Template.TradingPostValue = default.SKIRMISHERMAGBLASTER_TRADINGPOSTVALUE;
	
	Template.StowedLocation = eSlot_HeavyWeapon;
	Template.GameArchetype = "SAV_BunkerModule2.WP_MagBlaster";
	Template.iPhysicsImpulse = 20;
	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('SkirmisherBreachingGunAbility');
	
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.SKIRMISHERMAGBLASTER_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.SKIRMISHERMAGBLASTER_RADIUS);

	return Template;
}

static function X2DataTemplate SAVSkirmisherAdrenalAmp()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVSkirmisherAdrenalAmp');
	Template.ItemCat = 'utility';
	Template.WeaponCat = 'utility';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Skirm_AdrenalAmp";
	Template.EquipSound = "Conventional_Weapon_Equip";
	
	Template.Abilities.AddItem('SavAdrenalAmp');

	Template.bMergeAmmo = true;

	Template.Tier = 1;

	Template.TradingPostValue = default.ADRENALAMP_TRADEVAL;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	return Template;
}

static function X2DataTemplate SAVAutoStigmata()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVAutoStigmata');
	Template.ItemCat = 'utility';
	Template.WeaponCat = 'utility';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_AutoStigmata";
	Template.EquipSound = "Conventional_Weapon_Equip";
	
	Template.Abilities.AddItem('SAVAutoStigmata');

	Template.bMergeAmmo = true;

	Template.Tier = 1;
	Template.BaseDamage = default.AUTOSTIGMATA_BASEDAMAGE;
	Template.iSoundRange = default.AUTOSTIGMATA_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.AUTOSTIGMATA_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.AUTOSTIGMATA_ICLIPSIZE;
	Template.iRange = default.AUTOSTIGMATA_RANGE;
	Template.TradingPostValue = default.AUTOSTIGMATA_TRADEVAL;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	return Template;
}

static function X2DataTemplate SAVMindrazor()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVMindrazor');
	Template.ItemCat = 'utility';
	Template.WeaponCat = 'utility';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Mindrazor";
	Template.EquipSound = "Conventional_Weapon_Equip";
	
	Template.Abilities.AddItem('SAVEngageMindrazor');
	Template.Abilities.AddItem('SAVMindrazorAmplify');
	Template.Abilities.AddItem('ShieldOverAnimset');//The animation is in the same animset
	Template.bMergeAmmo = true;

	Template.Tier = 1;

	Template.TradingPostValue = default.MINDRAZOR_TRADEVAL;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	return Template;
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}