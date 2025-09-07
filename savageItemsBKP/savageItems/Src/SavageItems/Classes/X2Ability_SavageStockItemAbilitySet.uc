class X2Ability_SavageStockItemAbilitySet extends XMBAbility
	dependson (XComGameStateContext_Ability) config(SavageStockItems);

var localized string SAVBunkerModuleShieldPulseFlyover;

var config array<name> AllowedItemArray_GrenadeBandolier;
var config array<name> AllowedItemArray_AssaultAMod;
var config array<name> AllowedItemArray_MedicalAMod;
var config array<name> AllowedItemArray_EngineeringAModItems;
var config array<name> AllowedItemArray_EngineeringAModItems2;
//var config array<name> AllowedItemArray_EngineeringAModAbilities;
var config array<name> AllowedItemArray_MunitionsAModItems;
//var config array<name> AllowedItemArray_MunitionsAModAbilities;
var config array<name> AllowedItemArray_PartisanKnives;

var config float NANOUPLINK_HACK_SCALAR;
var config float NANOUPLINK_HACKDEFENCE_SCALAR;

var config int DEFFIELDOVERLAYCOOLDOWN;

var config int PROXSCAN_COOLDOWN;
var config int PROXSCAN_CHARGES;
var config int FIELDSCAN_COOLDOWN;
var config int FIELDSCAN_TILE_WIDTH;
var config int FIELDSCAN_TILE_LENGTH;
var config int FIELDSCAN_CHARGES;

var config int STUNSPRAYCHANCE;

var config name DECOY_BEACON_START_ANIM;

var config float BUNKERFIELD_DEPLOYAREA;
var float ExplosiveDamageReduction;
//DefaultEffectNames
var privatewrite name SAVBunkerMobReductionEffectName;

var config int BREACHING_GUN_TILE_WIDTH;
var config int BREACHING_GUN_TILE_LENGTH;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(AddReinforcedVestBonus());
	Templates.AddItem(SavLightVestBonus());
	Templates.AddItem(AddAlloyweveVestBonus());
	Templates.AddItem(AddHazmatAModBonus());
	Templates.AddItem(AddAModBonusSlotBlocker());
	Templates.AddItem(AddArmourModXheavy());
	Templates.AddItem(AddArmourModVheavy());
	Templates.AddItem(AddArmourModHeavy());
	Templates.AddItem(AddArmourModCumbersome());
	Templates.AddItem(AddArmourModLight());
	Templates.AddItem(AddAlloyOverlayBonus());
	Templates.AddItem(AddWalkerServoOverlayBonus());
	Templates.AddItem(AddWalkerServoOverdrive());
	Templates.AddItem(AddMagazineCarrierBonus());
	Templates.AddItem(AddDevistatorOverlayBonus());
	Templates.AddItem(AddMunitionsCarrierBonus());
	Templates.AddItem(MunitionsCarrierFreeload());
	Templates.AddItem(AddAssaultOverlayBonus());
	Templates.AddItem(MedicalOverlayBonus());
	Templates.AddItem(AddEngeneeringAModBonus());
	Templates.AddItem(EngineeringAmod_PlatingKit());
	Templates.AddItem(EngineeringAmod_CoverKit());
	Templates.AddItem(HiddenBladesItemBonusCharges());
	Templates.AddItem(KnifeFighterBonus());
	Templates.AddItem(AddPoweredOverlayBonus());
	Templates.AddItem(AddPoweredMeleeAModBonus());
	Templates.AddItem(PoweredMeleeAModAnimset());
	Templates.AddItem(SavSkullcrusher());
	Templates.AddItem(AddSkullCrushingStrength());
	Templates.AddItem(AddDreadnaughtOverlayBonus());
	Templates.AddItem(AddWraithOverlayBonus());
	Templates.AddItem(ShieldOverAnimset());
	Templates.AddItem(AddShieldOverShieldHP());
	Templates.AddItem(AddShieldOverlayBonus());
	Templates.AddItem(AddDefFieldOvelay());
	Templates.AddItem(ActiveCamoStealth());
	Templates.AddItem(ActiveOptiCam());
	Templates.AddItem(AddCeramicBolsterPlatingBonus());
	Templates.AddItem(ProximityScan());
	Templates.AddItem(ProximityScanPassive());
	Templates.AddItem(FieldScan());
	Templates.AddItem(EnhancedSenses());
	Templates.AddItem(AdvancedEnhancedSenses());
	Templates.AddItem(AdvHackTlUplink());
	Templates.AddItem(NanoHackTlUplink());
	Templates.AddItem(SAVNanoHackTlIceBreaker());
	Templates.AddItem(AddWebbingOverlayBonus());
	Templates.AddItem(AddGBandolierBonus());
	Templates.AddItem(StunSprayAbility());
	Templates.AddItem(SavHandFlamerAbility());
	Templates.AddItem(SavSkunkSprayAbility());
	Templates.AddItem(SavAcidJetAbility());
	Templates.AddItem(TacticalScanner());
	Templates.AddItem(DecoyBeacon());
	Templates.AddItem(CreateInitializeDBAbility());
	Templates.AddItem(CreateTacuplinkMark());
	Templates.AddItem(CreateTacUplinkCharges());
	Templates.AddItem(CommandDesignatorAnimset());
	Templates.AddItem(CreateComDesiTacuplinkMark());
	Templates.AddItem(CreateComDesiMoveIt());
	Templates.AddItem(CreateComDesiTakeCover());
	Templates.AddItem(CreateComDesiCoveringFire());
	Templates.AddItem(ImprovisedPlating());
	Templates.AddItem(AddImprovisedPlatingBonus());
	Templates.AddItem(AddSavAnimaShield());
	Templates.AddItem(DeployBunkerModule());
	Templates.AddItem(BunkerModulePassive());
	Templates.AddItem(BunkerModule_Shutdown());
	Templates.AddItem(BunkerFieldAbility());
	Templates.AddItem(CreateImprovisedCover());
	Templates.AddItem(AddCoverPackBonus());
	Templates.AddItem(ImprovisedCoverTurn());
	Templates.AddItem(ImprovisedCoverPassive());
	Templates.AddItem(SAVUnitPassTurn());
	Templates.AddItem(SAVUnitSelfDestruct());
	Templates.AddItem(ShieldAmplifierAbility());
	Templates.AddItem(BreachingGunAbility());
///////////////////RESISTANCE WEAPON ABILITIES///////////////////////
	Templates.AddItem(UniqueARMagneticUpgrade());
	Templates.AddItem(UniqueARBeamUpgrade());
	Templates.AddItem(UniqueSwordMagneticUpgrade());
	Templates.AddItem(UniqueSwordBeamUpgrade());
	Templates.AddItem(SAVViperfangAutopsyUpgrade());
	Templates.AddItem(SAVLetErRip());
	Templates.AddItem(CreateSAVPrototypePowerFluctuation());
	Templates.AddItem(CreateSAVDefectivePowerSupply());
	Templates.AddItem(SAVViperfangPoison());
	Templates.AddItem(SAVTheVipersBite());
	Templates.AddItem(SAVEndlessVengeance_ReactionBonus());
	Templates.AddItem(SAV_EndlessVengeance());
	Templates.AddItem(SAV_EndlessVengeance_Charges());
///////////////////GREMLIN ABILITIES///////////////////////
//For Medical AMOD
	Templates.AddItem(CreateSavMedicalProtocol());//Used to check if the medical abilities should be available
	Templates.AddItem(SAVGremlinHeal());
	Templates.AddItem(SAVGremlinStabilize());
	Templates.AddItem(SavRegenSprayGremlin());
	Templates.AddItem(SavRegen2SprayGremlin());
	Templates.AddItem(CreateSavNaniteRegenGremlin());
	Templates.AddItem(CreateSavStimulatorGremlin());
	Templates.AddItem(SAVGremlinAdministerStims());
	Templates.AddItem(SAVGremlinAdministerStims2());
//For Engineering AMOD
	Templates.AddItem(CreateEngineeringProtocol());//Used to check if the engineering abilities should be available
	Templates.AddItem(CreateRepairKitMarker());//Used to check if the user has a repair kit
	Templates.AddItem(CreateRepairKitGremlin());
	Templates.AddItem(CreateRepairKit2Gremlin());
	Templates.AddItem(CreatePlatingKitGremlin());
///////////////////TLM ARMOR UPGRADES///////////////////////
	Templates.AddItem(BundleofBladesBonusCharges());
	Templates.AddItem(CeramicPlatingUpgradeBonus());
	Templates.AddItem(AlloyPlatingUpgradeBonus());
	Templates.AddItem(MunitionsCarrierUpgradeBonus());
	Templates.AddItem(QuickLoadFreeload());
	Templates.AddItem(MediPackSatchel());
	Templates.AddItem(HEChargeSatchel());
	Templates.AddItem(FireRetardantLayerAbility());
	Templates.AddItem(PathogenBarrierLayerAbility());
	Templates.AddItem(ChemicalBarrierLayerAbility());
	Templates.AddItem(MuleUpgradeAbility());


	return Templates;
}

static function X2AbilityTemplate AddReinforcedVestBonus()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local XMBEffect_ConditionalBonus		Effect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ReinforcedVestBonus');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_nanofibervest";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to health stat Effect
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, 1);
	//PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, -1);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitAsTargetModifier(-10, eHit_Crit);
	Template.AddTargetEffect(Effect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate SavLightVestBonus()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local XMBEffect_ConditionalBonus		Effect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavLightVestBonus');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_nanofibervest";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, 2);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitAsTargetModifier(20, eHit_Crit);
	Template.AddTargetEffect(Effect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddHazmatAModBonus()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_DamageImmunity           DamageImmunity;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HazmatAModBonus');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_nanofibervest";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to health stat Effect
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, 2);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.ImmuneTypes.AddItem('Fire');
	DamageImmunity.ImmuneTypes.AddItem('Poison');
	DamageImmunity.ImmuneTypes.AddItem('Acid');
	DamageImmunity.ImmuneTypes.AddItem('EleriumPoisoning');
	DamageImmunity.ImmuneTypes.AddItem('Frost');
	DamageImmunity.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.ParthenogenicPoisonType);
	DamageImmunity.BuildPersistentEffect(1, true, false, false);
	DamageImmunity.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	Template.AddTargetEffect(DamageImmunity);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddAlloyweveVestBonus()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AlloyweveVestBonus');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_nanofibervest";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to health stat Effect
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, 2);

	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}
//==============================ENABLES the extra util slot==============================

static function X2AbilityTemplate AddAModBonusSlotBlocker()
{
	local X2AbilityTemplate                 Template;	
//	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AModBonusSlotBlocker');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
			
//	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
//	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
//	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
//	PersistentStatChangeEffect.AddPersistentStatChange(eStat_UtilityItems, 0);
//	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}
//========================================== Gear weight catagories ========================================================================
static function X2AbilityTemplate AddArmourModXheavy()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ArmourModXheavy');
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Weight_ExHeavy";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
			
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	//PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, -2);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, -5);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, -0.4f);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddArmourModVheavy()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ArmourModVheavy');
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Weight_VeryHeavy";
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to health stat Effect
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	//PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, -2);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, -10);
//	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.VHEAVYAMOD_MOB_SCALAR, MODOP_PostMultiplication);
//	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, default.VHEAVYAMOD_DODGE_SCALAR, MODOP_PostMultiplication);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, -0.3f);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddArmourModHeavy()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ArmourModHeavy');
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Weight_Heavy";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to health stat Effect
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	//PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, -1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, -5);
//	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.HEAVYAMOD_MOB_SCALAR, MODOP_PostMultiplication);
//	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, default.HEAVYAMOD_DODGE_SCALAR, MODOP_PostMultiplication);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, -0.2f);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddArmourModCumbersome()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ArmourModCumbersome');
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Weight_Cumbersome";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to health stat Effect
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, -20);
//	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, default.HEAVYAMOD_DODGE_SCALAR, MODOP_PostMultiplication);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, -0.1f);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddArmourModLight()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ArmourModLight');
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Weight_Light";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to health stat Effect
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, 2);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, 5);
//	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.LIGHTAMOD_MOB_SCALAR, MODOP_PostMultiplication);
//	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, default.LIGHTAMOD_DODGE_SCALAR, MODOP_PostMultiplication);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, 0.3f);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

//========================================== Armour mods ========================================================================

static function X2AbilityTemplate AddCeramicBolsterPlatingBonus()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'CeramicBolsterPlatingBonus');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to health stat Effect
	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, 0);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, 1);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddWebbingOverlayBonus()
{
	local X2AbilityTemplate                 Template;	

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WebbingOverlayBonus');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddMagazineCarrierBonus()
{
	local XMBEffect_AddItemCharges			BonusItemEffect, BonusItemEffect2, BonusItemEffect3, BonusItemEffect4;
	local X2AbilityTemplate					Template;

	// The effect isn't an X2Effect_Persistent, so we can't use it as the effect for Passive(). Let
	// Passive() create its own effect.
	Template = Passive('MagazineCarrierBonus', "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility", true);

	// Add the XMBEffect_AddItemCharges as an extra effect.
	BonusItemEffect = new class'XMBEffect_AddItemCharges';
	BonusItemEffect.PerItemBonus = 1;
	BonusItemEffect.ApplyToNames.AddItem('ExtraMagazineLL');

	BonusItemEffect2 = new class'XMBEffect_AddItemCharges';
	BonusItemEffect2.PerItemBonus = 2;
	BonusItemEffect2.ApplyToNames.AddItem('DoubleMagazineLL');

	BonusItemEffect3 = new class'XMBEffect_AddItemCharges';
	BonusItemEffect3.PerItemBonus = 3;
	BonusItemEffect3.ApplyToNames.AddItem('TripleMagazineLL');

	BonusItemEffect4 = new class'XMBEffect_AddItemCharges';
	BonusItemEffect4.PerItemBonus = 4;
	BonusItemEffect4.ApplyToNames.AddItem('QuadMagazineLL');
		
	Template.AddTargetEffect(BonusItemEffect);

	return Template;
}

static function X2AbilityTemplate AddGBandolierBonus()
{
	local XMBEffect_AddUtilityItem			ItemEffect;
	local XMBEffect_AddItemCharges			BonusItemEffect;
	local X2AbilityTemplate					Template;
	local name AllowedItemNames_GrenadeBandolier;

	// The effect isn't an X2Effect_Persistent, so we can't use it as the effect for Passive(). Let
	// Passive() create its own effect.
	Template = Passive('GBandolierBonus', "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility", true);

	// Add the XMBEffect_AddItemCharges as an extra effect.
	BonusItemEffect = new class'XMBEffect_AddItemCharges';
	BonusItemEffect.PerItemBonus = 1;
	foreach default.AllowedItemArray_GrenadeBandolier(AllowedItemNames_GrenadeBandolier)
	{
		BonusItemEffect.ApplyToNames.AddItem(AllowedItemNames_GrenadeBandolier);
	}

	//AddSecondaryEffect(Template, BonusItemEffect);
	Template.AddTargetEffect(BonusItemEffect);

	ItemEffect = new class 'XMBEffect_AddUtilityItem';
	ItemEffect.DataName = 'FragGrenade';
	ItemEffect.bUseHighestAvailableUpgrade = true;	
	AddSecondaryEffect(Template, ItemEffect);

	return Template;
}

static function X2AbilityTemplate AddAssaultOverlayBonus()
{
	local XMBEffect_AddItemCharges			BonusItemEffect;
	local X2AbilityTemplate					Template;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local XMBEffect_ConditionalBonus		Effect;
	local name AllowedItemNames_AssaultOverlay;

	// The effect isn't an X2Effect_Persistent, so we can't use it as the effect for Passive(). Let
	// Passive() create its own effect.
	Template = Passive('AssaultOverlayBonus', "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility", true);

	// Add the XMBEffect_AddItemCharges as an extra effect.
	BonusItemEffect = new class'XMBEffect_AddItemCharges';
	BonusItemEffect.PerItemBonus = 1;
	foreach default.AllowedItemArray_AssaultAMod(AllowedItemNames_AssaultOverlay)
	{
		BonusItemEffect.ApplyToNames.AddItem(AllowedItemNames_AssaultOverlay);
	}

	//AddSecondaryEffect(Template, BonusItemEffect);
	Template.AddTargetEffect(BonusItemEffect);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ShieldHP, 3);
	AddSecondaryEffect(Template, PersistentStatChangeEffect);

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitAsTargetModifier(-15, eHit_Crit);
	AddSecondaryEffect(Template, Effect);

	return Template;
}

static function X2AbilityTemplate MedicalOverlayBonus()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_AddItemCharges			BonusItemEffect;
	local XMBEffect_AddUtilityItem			ItemEffect;
	local name AllowedItemNames_MedicalOverlay;

	// The effect isn't an X2Effect_Persistent, so we can't use it as the effect for Passive(). Let
	// Passive() create its own effect.
	Template = Passive('MedicalOverlayBonus', "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility", true);

	// Add the XMBEffect_AddItemCharges as an extra effect.
	BonusItemEffect = new class'XMBEffect_AddItemCharges';
	BonusItemEffect.PerItemBonus = 1;
	foreach default.AllowedItemArray_MedicalAMod(AllowedItemNames_MedicalOverlay)
	{
		BonusItemEffect.ApplyToNames.AddItem(AllowedItemNames_MedicalOverlay);
	}
	BonusItemEffect.ApplyToSlots.AddItem(eInvSlot_Utility);
	BonusItemEffect.ApplyToSlots.AddItem(eInvSlot_AModMedical);
	Template.AddTargetEffect(BonusItemEffect);

	ItemEffect = new class 'XMBEffect_AddUtilityItem';
	ItemEffect.DataName = 'Medipack';
	ItemEffect.bUseHighestAvailableUpgrade = false;	
	AddSecondaryEffect(Template, ItemEffect);
	
	return Template;
}

static function X2AbilityTemplate AddEngeneeringAModBonus()
{
	local XMBEffect_AddItemCharges			BonusItemEffect, BonusItemEffectRKIT;
	local X2AbilityTemplate					Template;
	local XMBEffect_AddAbilityCharges       Effect, Effect2;
	local name AllowedItemNames_EngeneeringAModItems;
	local name AllowedItemNames_EngeneeringAModItems2;
//	local name AllowedItemNames_EngeneeringAModAbilities;

	// The effect isn't an X2Effect_Persistent, so we can't use it as the effect for Passive(). Let
	// Passive() create its own effect.
	Template = Passive('EngeneeringAModBonus', "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility", true);

	// Add the XMBEffect_AddItemCharges as an extra effect.
	BonusItemEffect = new class'XMBEffect_AddItemCharges';
	BonusItemEffect.PerItemBonus = 1;
	foreach default.AllowedItemArray_EngineeringAModItems(AllowedItemNames_EngeneeringAModItems)
	{
		BonusItemEffect.ApplyToNames.AddItem(AllowedItemNames_EngeneeringAModItems);
	}

	BonusItemEffectRKIT = new class'XMBEffect_AddItemCharges';
	BonusItemEffectRKIT.PerItemBonus = 2;
	foreach default.AllowedItemArray_EngineeringAModItems2(AllowedItemNames_EngeneeringAModItems2)
	{
		BonusItemEffectRKIT.ApplyToNames.AddItem(AllowedItemNames_EngeneeringAModItems2);
	}

	// Bonuses for items that use abilities.
	Effect = new class'XMBEffect_AddAbilityCharges';
	Effect.BonusCharges = 1;
	Effect.AbilityNames.AddItem('ThrowClaymore');
	Effect.AbilityNames.AddItem('ThrowShrapnel');
	Effect.AbilityNames.AddItem('ThrowPlasmaIED');

	Effect2 = new class'XMBEffect_AddAbilityCharges';
	Effect2.BonusCharges = 2;
	Effect2.AbilityNames.AddItem('SAVRepairKit2Gremlin');

/*	foreach default.AllowedItemArray_EngineeringAModAbilities(AllowedItemNames_EngeneeringAModAbilities)
	{
		Effect.AbilityNames.AddItem(AllowedItemNames_EngeneeringAModAbilities);
	}*/

	AddSecondaryEffect(Template, BonusItemEffect);
	AddSecondaryEffect(Template, BonusItemEffectRKIT);
	AddSecondaryEffect(Template, Effect);
	AddSecondaryEffect(Template, Effect2);

	AddSecondaryAbility(Template, EngineeringAmod_PlatingKit());
	AddSecondaryAbility(Template, EngineeringAmod_CoverKit());
		
	return Template;
}

static function X2AbilityTemplate EngineeringAmod_PlatingKit()
{
	local XMBEffect_AddAbilityCharges       Effect;
	local X2AbilityTemplate					Template;
	local X2Condition_AbilityProperty		AbilityCondition;

	Template = Passive('EngineeringAmod_PlatingKit', "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility", false);
	HidePerkIcon(Template);

	Effect = new class'XMBEffect_AddAbilityCharges';
	Effect.BonusCharges = 2;
	Effect.AbilityNames.AddItem('ImprovisedPlating');
	Effect.AbilityNames.AddItem('PlatingKitGremlin');
	AddSecondaryEffect(Template, Effect);

	//add item condition
	AbilityCondition = new class'X2Condition_AbilityProperty';
	AbilityCondition.OwnerHasSoldierAbilities.AddItem('ImprovisedPlatingBonus');
	Effect.TargetConditions.AddItem(AbilityCondition);

	return Template;
}

static function X2AbilityTemplate EngineeringAmod_CoverKit()
{
	local XMBEffect_AddAbilityCharges       Effect;
	local X2AbilityTemplate					Template;
	local X2Condition_AbilityProperty		AbilityCondition;

	Template = Passive('EngineeringAmod_CoverKit', "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility", false);
	HidePerkIcon(Template);

	Effect = new class'XMBEffect_AddAbilityCharges';
	Effect.BonusCharges = 2;
	Effect.AbilityNames.AddItem('ImprovisedCover');
	AddSecondaryEffect(Template, Effect);

	//add item condition
	AbilityCondition = new class'X2Condition_AbilityProperty';
	AbilityCondition.OwnerHasSoldierAbilities.AddItem('CoverPackBonus');
	Effect.TargetConditions.AddItem(AbilityCondition);

	return Template;
}

static function X2AbilityTemplate HiddenBladesItemBonusCharges()
{

	local X2AbilityTemplate					Template;
	local XMBEffect_AddAbilityCharges		Effect;

	Effect = new class'XMBEffect_AddAbilityCharges';
	Effect.AbilityNames.AddItem('SavHiddenBladeStab');
	Effect.BonusCharges = 1;
	
	// Create the template using a helper function
	Template = Passive('HiddenBladesItemBonusCharges', "img:///UILibrary_SavageItems.UIPerk_BundleOfKnives", true, Effect);

	return Template;
}

static function X2AbilityTemplate KnifeFighterBonus()
{
	local XMBEffect_ConditionalBonus	Effect, Effect2;
	local X2AbilityTemplate				Template;
	local XMBCondition_WeaponName		WeaponCondition;
	local XMBCondition_AbilityProperty	Condition;
	local name AllowedItemNames_PartisanKnives;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddArmorPiercingModifier(1);
	Effect.AddDamageModifier(1, eHit_Crit);
	Effect.AddToHitModifier(15, eHit_Crit);

	// Create the template using a helper function
	Template = Passive('KnifeFighterBonus', "img:///UILibrary_SavageItems.UIPerk_KnifeFighter", true, Effect);

	Effect2 = new class'XMBEffect_ConditionalBonus';
	Effect2.AddToHitAsTargetModifier(25, eHit_Graze);

	WeaponCondition = new class'XMBCondition_WeaponName';
	foreach default.AllowedItemArray_PartisanKnives(AllowedItemNames_PartisanKnives)
	{
		WeaponCondition.IncludeWeaponNames.AddItem(AllowedItemNames_PartisanKnives);
	}

	Effect.AbilityTargetConditions.AddItem(WeaponCondition);

	Condition = new class'XMBCondition_AbilityProperty';
	Condition.bRequireMelee = true;
	Effect2.AbilityTargetConditions.AddItem(Condition);

	AddSecondaryEffect(Template, Effect2);

	return Template;
}

static function X2AbilityTemplate AddAlloyOverlayBonus()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AlloyOverlayBonus');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to health stat Effect
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, 0);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, 2);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddWalkerServoOverlayBonus()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WalkerServoOverlayBonus');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, 2);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddWalkerServoOverdrive()
{
	local X2AbilityTemplate				Template;
	local X2AbilityCooldown				Cooldown;
	local X2AbilityCost_ActionPoints    ActionPointCost;
	local X2Effect_GrantActionPoints    ActionPointEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WalkerServoOverdrive');

	// Icon Properties
	Template.DisplayTargetHitChance = false;
	Template.AbilitySourceName = 'eAbilitySource_Item';                                       // color of the icon
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_SavServoOvercharge";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_LIEUTENANT_PRIORITY;
	Template.Hostility = eHostility_Neutral;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.AbilityConfirmSound = "TacticalUI_Activate_Ability_Run_N_Gun";

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 3;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityTargetStyle = default.SelfTarget;	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityToHitCalc = default.DeadEye;

	Template.bShowActivation = true;
	Template.bSkipFireAction = true;

//	Template.ActivationSpeech = 'RunAndGun';
		
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	ActionPointEffect = new class'X2Effect_GrantActionPoints';
	ActionPointEffect.NumActionPoints = 1;
	ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.MoveActionPoint;
	Template.AddTargetEffect(ActionPointEffect);

	Template.bCrossClassEligible = false;

	return Template;
}

static function X2AbilityTemplate AddDevistatorOverlayBonus()
{
	local X2AbilityTemplate                 Template;	

	`CREATE_X2ABILITY_TEMPLATE(Template, 'DevistatorOverlayBonus');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddMunitionsCarrierBonus()
{
	local XMBEffect_AddItemCharges			BonusItemEffect;
	local X2AbilityTemplate					Template;
	local XMBEffect_AddAbilityCharges       Effect;
	local name AllowedItemNames_MunitionsAModItems;
//	local name AllowedItemNames_MunitionsAModAbilities;

	// The effect isn't an X2Effect_Persistent, so we can't use it as the effect for Passive(). Let
	// Passive() create its own effect.
	Template = Passive('MunitionsCarrierBonus', "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility", true);

	// Add the XMBEffect_AddItemCharges as an extra effect.
	BonusItemEffect = new class'XMBEffect_AddItemCharges';
	BonusItemEffect.PerItemBonus = 1;
	foreach default.AllowedItemArray_MunitionsAModItems(AllowedItemNames_MunitionsAModItems)
	{
		BonusItemEffect.ApplyToNames.AddItem(AllowedItemNames_MunitionsAModItems);
	}

	// Create an effect that will add a bonus charge to the Inspire Agility ability
	Effect = new class'XMBEffect_AddAbilityCharges';
	Effect.BonusCharges = 1;
	Effect.AbilityNames.AddItem('ThrowClaymore');
	Effect.AbilityNames.AddItem('ThrowShrapnel');
	Effect.AbilityNames.AddItem('ThrowPlasmaIED');
/*	foreach default.AllowedItemArray_MunitionsAModAbilities(AllowedItemNames_MunitionsAModAbilities)
	{
		Effect.AbilityNames.AddItem(AllowedItemNames_MunitionsAModAbilities);
	}
*/
	AddSecondaryEffect(Template, BonusItemEffect);
	AddSecondaryEffect(Template, Effect);

	return Template;
}

static function X2AbilityTemplate MunitionsCarrierFreeload()
{
	local X2AbilityTemplate                 Template;
	local array<name>                       SkipExclusions;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2Effect_ImmediateAbilityActivation ReloadEffect;
	local X2Effect_GrantActionPoints		ActionPointEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MunitionsCarrierFreeload');

	// Activated by a button press; additionally, tells the AI this is an activatable
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	Template.AddShooterEffectExclusions(SkipExclusions);
//	WeaponCondition = new class'X2Condition_AbilitySourceWeapon';
//	WeaponCondition.WantsReload = true;
//	Template.AbilityShooterConditions.AddItem(WeaponCondition);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 1;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);
	
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = true;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	// Reload requires an action point, so grant one if the unit is out of action points
	ActionPointEffect = new class'X2Effect_GrantActionPoints';
	ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
	ActionPointEffect.NumActionPoints = 1;
	ActionPointEffect.bApplyOnlyWhenOut = false;
	AddSecondaryEffect(Template, ActionPointEffect);

	// Activate the default Reload ability
	ReloadEffect = new class'X2Effect_ImmediateAbilityActivation';
	ReloadEffect.EffectName = 'ImmediateFreeReload';
	ReloadEffect.AbilityName = 'Reload';
	ReloadEffect.AbilityName = 'ReloadLL';
	ReloadEffect.BuildPersistentEffect(1, false, true, , eGameRule_PlayerTurnBegin);
	AddSecondaryEffect(Template, ReloadEffect);

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_reload";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.RELOAD_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.bNoConfirmationWithHotKey = true;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;
	Template.DisplayTargetHitChance = false;

    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = MunitionsCarrierFreeload_BuildVisualization;

	return Template;
}

simulated function MunitionsCarrierFreeload_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  Context;
	local StateObjectReference InteractingUnitRef;
	local VisualizationActionMetadata EmptyTrack;
	local VisualizationActionMetadata ActionMetadata;
//	local X2Action_PlayAnimation PlayAnimationAction;
	local X2Action_PlaySoundAndFlyOver SoundAndFlyover;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;

	//Configure the visualization track for the shooter
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, "", 'MunitionsCarrierFreeload', eColor_Good);

//	PlayAnimationAction = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
//	PlayAnimationAction.Params.AnimName = 'HL_Reload';

}

static function X2AbilityTemplate AddPoweredOverlayBonus()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PoweredOverlayBonus');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to health stat Effect
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, 2);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, 3);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate AddPoweredMeleeAModBonus()
{
	local XMBEffect_ConditionalBonus Effect;
	local X2AbilityTemplate Template;
	local XMBCondition_AbilityProperty Condition;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddArmorPiercingModifier(1);
	Effect.AddDamageModifier(2, eHit_Crit);
	Effect.AddToHitModifier(30, eHit_Crit);
	Effect.AddToHitModifier(-30, eHit_Graze);
	Effect.AddToHitAsTargetModifier(30, eHit_Graze);
	Effect.AddToHitAsTargetModifier(-30, eHit_Crit);

	// Create the template using a helper function
	Template = Passive('PoweredMeleeAModBonus', "img:///UILibrary_SavageItems.NewPerks.UIPerk_SynthMuscles", true, Effect);

	Condition = new class'XMBCondition_AbilityProperty';
	Condition.bRequireMelee = true;
	Effect.AbilityTargetConditions.AddItem(Condition);

	return Template;
}

static function X2AbilityTemplate AddSkullCrushingStrength()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SkullCrushingStrength');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_SynthMuscles";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to health stat Effect
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Strength, 2.0f);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate PoweredMeleeAModAnimset()
{
    local X2AbilityTemplate                 Template;
    local X2Effect_AdditionalAnimSets        AnimSets;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'PoweredMeleeAModAnimset');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_SynthMuscles";

    Template.AbilitySourceName = 'eAbilitySource_Item';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.Hostility = eHostility_Neutral;
    Template.bDisplayInUITacticalText = false;
    
    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
    AnimSets = new class'X2Effect_AdditionalAnimSets';
    AnimSets.EffectName = 'PoweredMeleeAModAnimset';
	AnimSets.AddAnimSetWithPath("AnimSet'DLC_60_Soldier_RageArmor_ANIM.Anims.AS_RageArmor'");
    AnimSets.BuildPersistentEffect(1, true, false, false, eGameRule_TacticalGameStart);
    AnimSets.DuplicateResponse = eDupe_Ignore;
    Template.AddTargetEffect(AnimSets);
    
    Template.bSkipFireAction = true;
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    return Template;
}

static function X2AbilityTemplate SavSkullcrusher()
{
	local X2AbilityTemplate Template;
	local X2Effect_ApplyWeaponDamage DamageEffect;
	local X2AbilityToHitCalc_StandardMelee ToHitCalc;

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.DamageTypes.AddItem('Melee');
	
	Template = MeleeAttack('SavSkullcrusher', "img:///UILibrary_SavageItems.NewPerks.UIPerk_SkullCrusher", true, , class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY, eCost_Free);
//	Template = MeleeAttack('SavSkullcrusher', "img:///UILibrary_SavageItems.NewPerks.UIPerk_SkullCrusher", true, DamageEffect, class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY, eCost_Free);	
	AddCooldown(Template, 3);

	ToHitCalc = new class'X2AbilityToHitCalc_StandardMelee';
	ToHitCalc.BuiltInHitMod = 20;
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AddTargetEffect(DamageEffect);
	Template.CustomFireAnim = 'FF_RageStrikeA';

	return Template;
}

static function X2AbilityTemplate AddDreadnaughtOverlayBonus()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local XMBEffect_ConditionalBonus		Effect, Effect2, Effect3;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'DreadnaughtOverlayBonus');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to health stat Effect
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, 1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, 6);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitAsTargetModifier(-50, eHit_Crit);

	Effect2 = new class'XMBEffect_ConditionalBonus';
	Effect2.AbilityTargetConditions.AddItem(default.HalfCoverCondition);
	Effect2.AddToHitAsTargetModifier(15);

	Effect3 = new class'XMBEffect_ConditionalBonus';
	Effect2.AbilityTargetConditions.AddItem(default.FullCoverCondition);
	Effect2.AddToHitAsTargetModifier(30);
	
	AddSecondaryEffect(Template, Effect);
	AddSecondaryEffect(Template, Effect2);
	AddSecondaryEffect(Template, Effect3);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddWraithOverlayBonus()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalStatChange	Effect;
	local XMBCondition_AbilityName			Condition;
	local X2Effect_SavWillLoss				SavWillLossEffect;

	Effect = new class'XMBEffect_ConditionalStatChange';
	Template = SelfTargetTrigger('WraithOverlayBonus', "img:///UILibrary_SavageItems.UIPerk_item_wraithoverlaybonus", false, Effect, 'AbilityActivated');

	Effect.AddPersistentStatChange(eStat_Mobility, 2);
	Effect.AddPersistentStatChange(eStat_Dodge, 40);
	Effect.AddPersistentStatChange(eStat_DetectionModifier, 0.5f);
	Effect.Conditions.AddItem(new class'XMBCondition_AbilityName');
	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	Effect.BuildPersistentEffect(2, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.DuplicateResponse = eDupe_Refresh;
	Effect.VisualizationFn = EffectFlyOver_Visualization;
	
	SavWillLossEffect = new class'X2Effect_SavWillLoss';
//	SavWillLossEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	SavWillLossEffect.WillMod = -5;

	Effect.VisualizationFn = EffectFlyOver_Visualization;
	AddIconPassive(Template);

	Condition = new class'XMBCondition_AbilityName';
	Condition.IncludeAbilityNames.AddItem('WallPhasing');

	AddTriggerTargetCondition(Template, Condition);

	AddSecondaryEffect(Template, SavWillLossEffect);

	return Template;
}

//Adds the animations used by the Shield Overlay
static function X2AbilityTemplate ShieldOverAnimset()
{
    local X2AbilityTemplate                 Template;
    local X2Effect_AdditionalAnimSets        AnimSets;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'ShieldOverAnimset');

    Template.AbilitySourceName = 'eAbilitySource_Item';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.Hostility = eHostility_Neutral;
    Template.bDisplayInUITacticalText = false;
    
    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
    AnimSets = new class'X2Effect_AdditionalAnimSets';
    AnimSets.EffectName = 'ShieldOverAnimset';
	AnimSets.AddAnimSetWithPath("AnimSet'SavItems_Anim.Anims.AS_Soldier'");
    AnimSets.BuildPersistentEffect(1, true, false, false, eGameRule_TacticalGameStart);
    AnimSets.DuplicateResponse = eDupe_Ignore;
    Template.AddTargetEffect(AnimSets);
    
    Template.bSkipFireAction = true;
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    return Template;
}

// Generates 3 shield points when ShieldWall or High Cover Generator are used
static function X2AbilityTemplate AddShieldOverShieldHP()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalStatChange	Effect;
	local XMBCondition_AbilityName			Condition;

	Effect = new class'XMBEffect_ConditionalStatChange';
	Template = SelfTargetTrigger('ShieldOverShieldHP', "img:///UILibrary_PerkIcons.UIPerk_adventshieldbearer_energyshield", false, Effect, 'AbilityActivated');

	Effect.AddPersistentStatChange(eStat_ShieldHP, 3);
	Effect.Conditions.AddItem(new class'XMBCondition_AbilityName');
	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	Effect.BuildPersistentEffect(0, false, true, false, eGameRule_PlayerTurnBegin);
	Effect.DuplicateResponse = eDupe_Refresh;
	Effect.VisualizationFn = EffectFlyOver_Visualization;
	
	AddIconPassive(Template);

	Condition = new class'XMBCondition_AbilityName';
	Condition.IncludeAbilityNames.AddItem('HighCoverGenerator');
	Condition.IncludeAbilityNames.AddItem('ShieldWall');

	AddTriggerTargetCondition(Template, Condition);

	return Template;
}

//A triggerabile ability with a cooldown that makes the unit easier to hit, counteracting the below buff, but also much harder to crit for a turn. Triggering costs 2 will and also triggers AddDefFieldOvelay
static function X2AbilityTemplate AddShieldOverlayBonus()
{
	local X2AbilityTemplate				Template;
	local X2AbilityCooldown				Cooldown;
	local XMBEffect_ConditionalBonus	Effect;
	local X2Effect_SavWillLoss			SavWillLossEffect;
	local X2AbilityCost_ActionPoints	ActionPointCost;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ShieldOverlayBonus');

	Template.DisplayTargetHitChance = false;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_adventshieldbearer_energyshield";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;
	Template.Hostility = eHostility_Neutral;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.DEFFIELDOVERLAYCOOLDOWN;
	Template.AbilityCooldown = Cooldown;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'ShieldwallBoost';
	Effect.IconImage = "img:///UILibrary_SavageItems.UIPerk_SavServoOvercharge";
	Effect.AddToHitAsTargetModifier(30);
	Effect.AddToHitAsTargetModifier(-50, eHit_Crit);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	Effect.BuildPersistentEffect(0, false, true, false, eGameRule_PlayerTurnBegin);
	Effect.DuplicateResponse = eDupe_Refresh;
	Effect.VisualizationFn = EffectFlyOver_Visualization;
	Template.AddTargetEffect(Effect);

	SavWillLossEffect = new class'X2Effect_SavWillLoss';
//	SavWillLossEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	SavWillLossEffect.WillMod = -4;
	AddSecondaryEffect(Template, SavWillLossEffect);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.bShowActivation = true;
	Template.bSkipFireAction = false;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
//	Template.ActivationSpeech = 'AttemptingHack';
	AddSecondaryAbility(Template, AddDefFieldOvelay());
	
	Template.BuildVisualizationFn = DefField_BuildVisualization;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

// Makes units within 8 tiles of the activating unit much less likely to be hit and reduces incomming damage by 3 for a turn.
static function X2AbilityTemplate AddDefFieldOvelay()
{
	local XMBEffect_ConditionalBonus		Effect;
	local X2AbilityTemplate					Template;
	local X2AbilityMultiTarget_Radius		RadiusMultiTarget;
	local XMBCondition_AbilityName			Condition;

	Effect = class'X2Effect_AModDefField'.static.CreateAModDefFieldEffect();
		
	Template = SelfTargetTrigger('FieldOvelay', "UILibrary_SavageItems.UIPerk_DefOverlayBuff", false, , 'AbilityActivated');
	
	Template.AddTargetEffect(Effect);
	
	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = 8;
	RadiusMultiTarget.bIgnoreBlockingCover = true;

	Condition = new class'XMBCondition_AbilityName';
	Condition.IncludeAbilityNames.AddItem('ShieldOverlayBonus');
	Effect.AbilityTargetConditions.AddItem(Condition);

	AddTriggerTargetCondition(Template, Condition);

	Template.AbilityMultiTargetStyle = RadiusMultiTarget;
	Template.AddMultiTargetEffect(Effect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	return Template;
}

simulated function DefField_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  Context;
	local StateObjectReference InteractingUnitRef;
	local VisualizationActionMetadata EmptyTrack;
	local VisualizationActionMetadata ActionMetadata;
	local X2Action_PlayAnimation PlayAnimationAction;
	local X2Action_PlaySoundAndFlyOver SoundAndFlyover;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;

	//Configure the visualization track for the shooter
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, "", 'DefenceField', eColor_Good);

	PlayAnimationAction = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	PlayAnimationAction.Params.AnimName = 'HL_ShieldOverlayActivation';

}

static function X2AbilityTemplate ActiveCamoStealth(name AbilityName = 'ActiveCamoStealth')
{
	local X2AbilityTemplate						Template;
	local X2Effect_RangerStealth                StealthEffect;
	local X2AbilityCharges                      Charges;
	local XMBValue_Visibility					Value;
	local X2Condition_UnitValue					ValueCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, AbilityName);

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_stealth";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityCosts.AddItem(new class'X2AbilityCost_Charges');
	Template.AbilityCosts.AddItem(default.FreeActionCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 1;
	Template.AbilityCharges = Charges;

	Value = new class'XMBValue_Visibility';
	Value.bCountEnemies = true;

	ValueCondition = new class'X2Condition_UnitValue';
	ValueCondition.AddCheckValue('Value', 1, eCheck_LessThan);
	Template.AbilityTargetConditions.AddItem(ValueCondition);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityShooterConditions.AddItem(new class'X2Condition_Stealth');
	Template.AddShooterEffectExclusions();

	StealthEffect = new class'X2Effect_RangerStealth';
	StealthEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	StealthEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, true);
	StealthEffect.bRemoveWhenTargetConcealmentBroken = true;
	Template.AddTargetEffect(StealthEffect);

	Template.AddTargetEffect(class'X2Effect_Spotted'.static.CreateUnspottedEffect());

	Template.ActivationSpeech = 'ActivateConcealment';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate ActiveOptiCam()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalBonus		Effect;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	// The effect isn't an X2Effect_Persistent, so we can't use it as the effect for Passive(). Let
	// Passive() create its own effect.
	Template = Passive('ActiveOptiCam', "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility", true);

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitAsTargetModifier(-20);
	Template.AddTargetEffect(Effect);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, 0.2f);
	AddSecondaryEffect(Template, PersistentStatChangeEffect);

	return Template;
}

static function X2AbilityTemplate ProximityScan()
{
	local X2AbilityTemplate				Template;
	local X2AbilityCost_ActionPoints	ActionPointCost;
	local X2AbilityCost_Charges			ChargeCost;
	local X2AbilityCharges				Charges;
	local X2AbilityCooldown             Cooldown;
	local X2AbilityMultiTarget_Radius	RadiusMultiTarget;
	local XMBEffect_ConditionalBonus	ScanningEffect;
	local X2Effect_TargetDefinition		Effect;
	local X2Effect_SavRevealUnit		TrackingEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ProximityScan');

	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Proxscan";
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
//	Template.bHideWeaponDuringFire = false;
//	Template.bUseAmmoAsChargesForHUD = false;

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PROXSCAN_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = default.PROXSCAN_CHARGES;
	Template.AbilityCharges = Charges;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.bFreeCost = true; 
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.AbilityTargetStyle = default.SelfTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = true;
	RadiusMultiTarget.bIgnoreBlockingCover = true; 
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	ScanningEffect = class'X2Effect_SavScanPing'.static.CreateScanPingEffect();
	Template.AddMultiTargetEffect(ScanningEffect);// Add our effect to the multitarget

	TrackingEffect = new class'X2Effect_SavRevealUnit';
	TrackingEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
	Template.AddMultiTargetEffect(TrackingEffect);

	Effect = new class'X2Effect_TargetDefinition';
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin);
	Effect.TargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);
	Template.AddMultiTargetEffect(Effect);

	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
		
	return Template;
}

static function X2AbilityTemplate ProximityScanPassive()
{
	local X2AbilityTemplate					Template;
	local X2AbilityMultiTarget_Radius		RadiusMultiTarget;
	local XMBEffect_ConditionalBonus		ScanningEffect;
	local X2Effect_TargetDefinition			Effect;
	local X2AbilityTrigger_EventListener    Trigger;
	local X2Effect_SavRevealUnit			TrackingEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ProximityScanPassive');

	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Proxscan";
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.EventID = 'PlayerTurnBegun';
	Trigger.ListenerData.Filter = eFilter_Player;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AbilityTargetStyle = default.SelfTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = true;
	RadiusMultiTarget.bIgnoreBlockingCover = true; 
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	ScanningEffect = class'X2Effect_SavScanPing'.static.CreateScanPingEffect();
	Template.AddMultiTargetEffect(ScanningEffect);// Add our effect to the multitarget

	Effect = new class'X2Effect_TargetDefinition';
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin);
	Effect.TargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);
	Template.AddMultiTargetEffect(Effect);

	TrackingEffect = new class'X2Effect_SavRevealUnit';
	TrackingEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
	Template.AddMultiTargetEffect(TrackingEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
		
	return Template;
}

static function X2AbilityTemplate FieldScan()
{
	local X2AbilityTemplate				 Template;
	local X2AbilityCost_ActionPoints	 ActionPointCost;
	local X2AbilityCost_Charges			ChargeCost;
	local X2AbilityCharges				Charges;
	local X2AbilityCooldown              Cooldown;
	local X2AbilityTarget_Cursor         CursorTarget;
	local X2AbilityMultiTarget_Cone      ConeMultiTarget;
	local X2Effect_SavRevealUnit		 TrackingEffect;
	local XMBEffect_ConditionalBonus	 ScanningEffect;
	local X2Effect_TargetDefinition		 Effect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'FieldScan');

	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Fieldscan";
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
//	Template.bHideWeaponDuringFire = false;
//	Template.bUseAmmoAsChargesForHUD = false;

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.FIELDSCAN_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = default.FIELDSCAN_CHARGES;
	Template.AbilityCharges = Charges;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	ConeMultiTarget = new class'X2AbilityMultiTarget_Cone';
	ConeMultiTarget.bExcludeSelfAsTargetIfWithinRadius = true;
	ConeMultiTarget.bUseWeaponRadius = true;
	ConeMultiTarget.ConeEndDiameter = default.FIELDSCAN_TILE_WIDTH * class'XComWorldData'.const.WORLD_StepSize;
	ConeMultiTarget.ConeLength = default.FIELDSCAN_TILE_LENGTH * class'XComWorldData'.const.WORLD_StepSize;
	ConeMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = ConeMultiTarget;

	Template.TargetingMethod = class'X2TargetingMethod_Cone';

	Effect = new class'X2Effect_TargetDefinition';
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin);
	Effect.TargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);
	Template.AddMultiTargetEffect(Effect);

	ScanningEffect = class'X2Effect_SavScanPing'.static.CreateScanPingEffect();
	Template.AddMultiTargetEffect(ScanningEffect);// Add our effect to the multitarget
	
	TrackingEffect = new class'X2Effect_SavRevealUnit';
	TrackingEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
	Template.AddMultiTargetEffect(TrackingEffect);

	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
		
	return Template;
}

static function X2AbilityTemplate EnhancedSenses()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'EnhancedSenses');
	Template.IconImage = "UILibrary_SavageItems.UIPerk_PassiveSensors";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_SightRadius, 4);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionRadius, 1.5f, MODOP_PostMultiplication);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AdvancedEnhancedSenses()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_Squadsight				Squadsight;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AdvancedEnhancedSenses');
	Template.IconImage = "UILibrary_SavageItems.UIPerk_PassiveSensors";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_SightRadius, 8);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionRadius, 2.0f, MODOP_PostMultiplication);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HearingRadius, 2.0f, MODOP_PostMultiplication);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Squadsight = new class'X2Effect_Squadsight';// This could be moved to a triggerable
	Template.AddTargetEffect(Squadsight);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

/*
function name ApplyChance_SensorBoost(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState)
{
//	local XComGameStateHistory History;
//	local XComGameState_Unit UnitState;

//	History = `XCOMHISTORY;

//	UnitState = XComGameState_Unit(History.GetGameStateForObjectID(ApplyEffectParameters.SourceStateObjectRef.ObjectID, eReturnType_Reference, NewGameState.HistoryIndex));

	if( `SYNC_RAND(100) >= 70)
	{
		return 'AA_EffectChanceFailed';
	}

	return 'AA_Success';
}
*/

static function X2AbilityTemplate AdvHackTlUplink()
{
	local X2AbilityTemplate				Template;
	local X2AbilityCooldown				Cooldown;
	local X2AbilityCost_ActionPoints    ActionPointCost;
	local X2Condition_UnitProperty      TargetProperty;
	local X2Effect_PersistentStatChange	StatEffect;
	local X2AbilityTarget_Single		SingleTarget;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AdvHackTlUplink');

	Template.DisplayTargetHitChance = false;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_AdvUplink";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;
	Template.Hostility = eHostility_Neutral;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 2;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.bIncludeSelf = true;
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	Template.AbilityTargetStyle = SingleTarget;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.bShowActivation = true;
	Template.bSkipFireAction = false;

	TargetProperty = new class'X2Condition_UnitProperty';
	TargetProperty.ExcludeDead = true;
	TargetProperty.ExcludeHostileToSource = true;
	TargetProperty.ExcludeFriendlyToSource = false;
	TargetProperty.RequireSquadmates = true;
	Template.AbilityTargetConditions.AddItem(TargetProperty);
		
	StatEffect = class'X2Effect_SavUplink'.static.CreateSavUplink();
	Template.AddTargetEffect(StatEffect);

	Template.bLimitTargetIcons = true;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.ActivationSpeech = 'AttemptingHack';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
//	Template.BuildVisualizationFn = AdvHackTlUplink_BuildVisualization;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CustomFireAnim = 'HL_CallReinforcementsA';
	
	return Template;
}

static function X2AbilityTemplate NanoHackTlUplink()
{
	local X2AbilityTemplate				Template;
	local X2AbilityCooldown				Cooldown;
	local X2AbilityCost_ActionPoints    ActionPointCost;
	local X2Condition_UnitProperty      TargetProperty;
	local X2Effect_PersistentStatChange StatEffect, StatEffect2;
	local X2AbilityTarget_Single		SingleTarget;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'NanoHackTlUplink');

	Template.DisplayTargetHitChance = false;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_NanoUplink";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;
	Template.Hostility = eHostility_Neutral;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.bIncludeSelf = true;
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	Template.AbilityTargetStyle = SingleTarget;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.bShowActivation = true;
	Template.bSkipFireAction = false;

	TargetProperty = new class'X2Condition_UnitProperty';
	TargetProperty.ExcludeDead = true;
	TargetProperty.ExcludeHostileToSource = true;
	TargetProperty.ExcludeFriendlyToSource = false;
	TargetProperty.RequireSquadmates = true;
	Template.AbilityTargetConditions.AddItem(TargetProperty);
		
	StatEffect = new class'X2Effect_PersistentStatChange';
	StatEffect.EffectName = 'AdvToolUplink';
	StatEffect.DuplicateResponse = eDupe_Allow;
	StatEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd);
//	StatEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, true,,Template.AbilitySourceName);
	StatEffect.AddPersistentStatChange(eStat_Hacking, default.NANOUPLINK_HACK_SCALAR, MODOP_PostMultiplication);

	StatEffect2 = class'X2Effect_SavUplink'.static.CreateSavUplink();
	AddSecondaryEffect(Template, StatEffect2);
	
	Template.AddTargetEffect(StatEffect);
	Template.bLimitTargetIcons = true;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.ActivationSpeech = 'AttemptingHack';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CustomFireAnim = 'HL_CallReinforcementsA';

	return Template;
}

static function X2AbilityTemplate SAVNanoHackTlIceBreaker()
{
	local X2AbilityTemplate				Template;
	local X2AbilityCooldown				Cooldown;
	local X2AbilityCost_ActionPoints    ActionPointCost;
	local X2Condition_UnitProperty      TargetProperty;
	local X2Effect_PersistentStatChange StatEffect, StatEffect2;
	local X2AbilityTarget_Single		SingleTarget;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVNanoHackTlIceBreaker');

	Template.DisplayTargetHitChance = false;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_IceBreaker";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;
	Template.Hostility = eHostility_Neutral;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 3;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.bIncludeSelf = false;
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	Template.AbilityTargetStyle = SingleTarget;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.bShowActivation = true;
	Template.bSkipFireAction = false;

	TargetProperty = new class'X2Condition_UnitProperty';
	TargetProperty.ExcludeOrganic = true;
	TargetProperty.ExcludeDead = true;
	TargetProperty.ExcludeFriendlyToSource = true;
	TargetProperty.ExcludeHostileToSource = false;
	Template.AbilityTargetConditions.AddItem(TargetProperty);
		
	StatEffect = new class'X2Effect_PersistentStatChange';
	StatEffect.EffectName = 'NANOToolICEBREAKER';
	StatEffect.DuplicateResponse = eDupe_Allow;
	StatEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd);
//	StatEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, true,,Template.AbilitySourceName);
	StatEffect.AddPersistentStatChange(eStat_HackDefense, default.NANOUPLINK_HACKDEFENCE_SCALAR, MODOP_PostMultiplication);

	StatEffect2 = class'X2Effect_SavUplink'.static.CreateSavIceBreaker();
	AddSecondaryEffect(Template, StatEffect2);
	
	Template.AddTargetEffect(StatEffect);
	Template.bLimitTargetIcons = true;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.ActivationSpeech = 'AttemptingHack';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CustomFireAnim = 'HL_CallReinforcementsA';

	return Template;
}

static function X2AbilityTemplate StunSprayAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Cone         ConeMultiTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityToHitCalc_StandardAim    StandardAim;
	local X2Effect_Stunned					StunnedEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'StunSprayAbility');
	
	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);
	
	ActionPointCost = new class'X2AbilityCost_HeavyWeaponActionPoints';
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bGuaranteedHit = true;
	Template.AbilityToHitCalc = StandardAim;
	
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = false;
	Template.AddMultiTargetEffect(WeaponDamageEffect);

	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.STUNSPRAYCHANCE, false);
	StunnedEffect.bRemoveWhenSourceDies = false;
	Template.AddMultiTargetEffect(StunnedEffect);

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY;

	ConeMultiTarget = new class'X2AbilityMultiTarget_Cone';
	ConeMultiTarget.bUseWeaponRadius = true;
	ConeMultiTarget.ConeEndDiameter = 5 * class'XComWorldData'.const.WORLD_StepSize;
	ConeMultiTarget.ConeLength = 3 * class'XComWorldData'.const.WORLD_StepSize;
	Template.AbilityMultiTargetStyle = ConeMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.ExcludeNoCoverToSource = false;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	Template.AddShooterEffectExclusions();

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);
	
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.HideErrors.AddItem('AA_WrongSoldierClass');
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_SavStunAbility";
	Template.bUseAmmoAsChargesForHUD = true;

	Template.bCheckCollision = true;
	Template.bAffectNeighboringTiles = true;
	Template.bFragileDamageOnly = true;

//	Template.ActionFireClass = class'X2Action_Fire_Flamethrower';

	Template.TargetingMethod = class'X2TargetingMethod_Cone';

	Template.ActivationSpeech = 'Flamethrower';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;

	Template.bFrameEvenWhenUnitIsHidden = true;	

	return Template;	
}

static function X2AbilityTemplate SavHandFlamerAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Cone         ConeMultiTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2Effect_ApplyFireToWorld         FireToWorldEffect;
	local X2AbilityToHitCalc_StandardAim    StandardAim;
	local X2Effect_Burning                  BurningEffect;
	local X2Condition_AbilitySourceWeapon   WeaponCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavHandFlamerAbility');
	
	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);
	
	ActionPointCost = new class'X2AbilityCost_HeavyWeaponActionPoints';
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bGuaranteedHit = true;
	Template.AbilityToHitCalc = StandardAim;
	
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = false;
	Template.AddMultiTargetEffect(WeaponDamageEffect);

	BurningEffect = class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 1);
	BurningEffect.ApplyChance = 80;
	WeaponCondition = new class'X2Condition_AbilitySourceWeapon';
	WeaponCondition.MatchWeaponTemplate = 'SavHandFlamer';
	BurningEffect.TargetConditions.AddItem(WeaponCondition);
	Template.AddMultiTargetEffect(BurningEffect);

	FireToWorldEffect = new class'X2Effect_ApplyFireToWorld';
	FireToWorldEffect.bUseFireChanceLevel = true;
	FireToWorldEffect.bDamageFragileOnly = true;
	FireToWorldEffect.bCheckForLOSFromTargetLocation = true;
	FireToWorldEffect.FireChance_Level1 = 0.0f;
	FireToWorldEffect.FireChance_Level2 = 0.60f;
	FireToWorldEffect.FireChance_Level3 = 0.4f;
	Template.AddMultiTargetEffect(FireToWorldEffect);
	
	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY;

	ConeMultiTarget = new class'X2AbilityMultiTarget_Cone';
	ConeMultiTarget.bUseWeaponRadius = true;
	ConeMultiTarget.ConeEndDiameter = 4 * class'XComWorldData'.const.WORLD_StepSize;
	ConeMultiTarget.ConeLength = 5 * class'XComWorldData'.const.WORLD_StepSize;
	Template.AbilityMultiTargetStyle = ConeMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.ExcludeNoCoverToSource = false;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	Template.AddShooterEffectExclusions();

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);
	
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.HideErrors.AddItem('AA_WrongSoldierClass');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_flamethrower";
	Template.bUseAmmoAsChargesForHUD = true;

	Template.bCheckCollision = true;
	Template.bAffectNeighboringTiles = true;
	Template.bFragileDamageOnly = true;

//	Template.ActionFireClass = class'X2Action_Fire_Flamethrower';

	Template.TargetingMethod = class'X2TargetingMethod_Cone';

	Template.ActivationSpeech = 'Flamethrower';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;

	Template.bFrameEvenWhenUnitIsHidden = true;	

	return Template;	
}

static function X2AbilityTemplate SavSkunkSprayAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Cone         ConeMultiTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityToHitCalc_StandardAim    StandardAim;
	local X2Effect_PersistentStatChange		DisorientedEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavSkunkSprayAbility');
	
	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);
	
	ActionPointCost = new class'X2AbilityCost_HeavyWeaponActionPoints';
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bGuaranteedHit = true;
	Template.AbilityToHitCalc = StandardAim;
	
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = false;
	Template.AddMultiTargetEffect(WeaponDamageEffect);

	Template.AddMultiTargetEffect(class'X2StatusEffects'.static.CreatePoisonedStatusEffect());
	Template.AddMultiTargetEffect(new class'X2Effect_ApplyPoisonToWorld');

	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect(, , false);
	DisorientedEffect.ApplyChance = 40;
	Template.AddMultiTargetEffect(DisorientedEffect);

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY;

	ConeMultiTarget = new class'X2AbilityMultiTarget_Cone';
	ConeMultiTarget.bUseWeaponRadius = true;
	ConeMultiTarget.ConeEndDiameter = 6 * class'XComWorldData'.const.WORLD_StepSize;
	ConeMultiTarget.ConeLength = 6 * class'XComWorldData'.const.WORLD_StepSize;
	Template.AbilityMultiTargetStyle = ConeMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.ExcludeNoCoverToSource = false;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	Template.AddShooterEffectExclusions();

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);
	
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.HideErrors.AddItem('AA_WrongSoldierClass');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_poisonspit";
	Template.bUseAmmoAsChargesForHUD = true;
	
	Template.bCheckCollision = true;
	Template.bAffectNeighboringTiles = true;
	Template.bFragileDamageOnly = true;

//	Template.ActionFireClass = class'X2Action_Fire_Flamethrower';

	Template.TargetingMethod = class'X2TargetingMethod_Cone';

	Template.ActivationSpeech = 'Flamethrower';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;

	Template.bFrameEvenWhenUnitIsHidden = true;	

	return Template;	
}

static function X2AbilityTemplate SavAcidJetAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Cone         ConeMultiTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityToHitCalc_StandardAim    StandardAim;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavAcidJetAbility');
	
	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);
	
	ActionPointCost = new class'X2AbilityCost_HeavyWeaponActionPoints';
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bGuaranteedHit = true;
	Template.AbilityToHitCalc = StandardAim;
	
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = false;
	Template.AddMultiTargetEffect(WeaponDamageEffect);

	Template.AddMultiTargetEffect(class'X2StatusEffects'.static.CreateAcidBurningStatusEffect(2, 0));
//	Template.AddMultiTargetEffect(new class'X2Effect_ApplyAcidToWorld');

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY;

	ConeMultiTarget = new class'X2AbilityMultiTarget_Cone';
	ConeMultiTarget.bUseWeaponRadius = true;
	ConeMultiTarget.ConeEndDiameter = 3 * class'XComWorldData'.const.WORLD_StepSize;
	ConeMultiTarget.ConeLength = 6 * class'XComWorldData'.const.WORLD_StepSize;
	Template.AbilityMultiTargetStyle = ConeMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.ExcludeNoCoverToSource = false;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	Template.AddShooterEffectExclusions();

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);
	
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.HideErrors.AddItem('AA_WrongSoldierClass');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_andromedon_acidblob";
	Template.bUseAmmoAsChargesForHUD = true;

	Template.bCheckCollision = true;
	Template.bAffectNeighboringTiles = true;
	Template.bFragileDamageOnly = true;

//	Template.ActionFireClass = class'X2Action_Fire_Flamethrower';

	Template.TargetingMethod = class'X2TargetingMethod_Cone';

	Template.ActivationSpeech = 'Flamethrower';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;

	Template.bFrameEvenWhenUnitIsHidden = true;	

	return Template;	
}

// New version of the Tac scanner ability with the seperate effects (can the conditionals be externalised also?)
// Needs a new IconImage
static function X2AbilityTemplate TacticalScanner()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2AbilityTarget_Cursor				CursorTarget;
	local X2AbilityMultiTarget_Radius			RadiusMultiTarget;
	local X2Effect_ApplyWeaponDamage			WeaponDamageEffect;
	local XMBEffect_ConditionalBonus			TacScanFriendlyEffect, TacScanEnemyEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'TacticalScanner');

	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_ThrowTacscan";
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	Template.bHideWeaponDuringFire = true;

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	Template.bUseAmmoAsChargesForHUD = true;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.STANDARD_GRENADE_PRIORITY;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TacScanFriendlyEffect = class'X2Effect_TacScanFriendlyEffect'.static.CreateTacScanFriendlyEffect();
	TacScanEnemyEffect = class'X2Effect_TacScanFriendlyEffect'.static.CreateTacScanEnemyEffect();

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddMultiTargetEffect(WeaponDamageEffect);
	Template.AddMultiTargetEffect(TacScanFriendlyEffect);
	Template.AddMultiTargetEffect(TacScanEnemyEffect);
	Template.bAllowBonusWeaponEffects = false;

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = true;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	Template.TargetingMethod = class'X2TargetingMethod_Grenade';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
		
	return Template; 
}

//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv!!!DECOY BEACON STUFF!!!vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

static function X2AbilityTemplate DecoyBeacon()
{
	local X2AbilityTemplate             Template;
	local X2AbilityCost_ActionPoints    ActionPointCost;
	local X2AbilityCost_Ammo            AmmoCost;
	local X2AbilityTarget_Cursor        CursorTarget;
	local X2AbilityMultiTarget_Radius   RadiusMultiTarget;
	local X2Effect_SpawnDecoyBeacon     SpawnMimicBeacon;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'DecoyBeaconThrow');

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_mimicbeacon";
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	Template.bHideWeaponDuringFire = true;

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	Template.bUseAmmoAsChargesForHUD = true;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.STANDARD_GRENADE_PRIORITY;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.DoNotConsumeAllSoldierAbilities.AddItem('TotalCombat');
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = true;
	RadiusMultiTarget.bIgnoreBlockingCover = true; // we don't need this, the squad viewer will do the appropriate things once thrown
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	Template.TargetingMethod = class'X2TargetingMethod_MimicBeacon';
	Template.SkipRenderOfTargetingTemplate = true;

	Template.bUseThrownGrenadeEffects = true;

	SpawnMimicBeacon = new class'X2Effect_SpawnDecoyBeacon';
	SpawnMimicBeacon.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	Template.AddShooterEffect(SpawnMimicBeacon);
	Template.AddShooterEffect(new class'X2Effect_BreakUnitConcealment');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = DecoyBeacon_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
		
	return Template;
}

simulated function DecoyBeacon_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability Context;
	local StateObjectReference InteractingUnitRef;
	local VisualizationActionMetadata EmptyTrack;
	local VisualizationActionMetadata SourceTrack, MimicBeaconTrack;
	local XComGameState_Unit MimicSourceUnit, SpawnedUnit;
	local UnitValue SpawnedUnitValue;
	local X2Effect_SpawnDecoyBeacon SpawnMimicBeaconEffect;
	local X2Action_MimicBeaconThrow FireAction;
	local X2Action_PlayAnimation AnimationAction;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;

	//Configure the visualization track for the shooter
	//****************************************************************************************
	SourceTrack = EmptyTrack;
	SourceTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	SourceTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	SourceTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	class'X2Action_ExitCover'.static.AddToVisualizationTree(SourceTrack, Context);
	FireAction = X2Action_MimicBeaconThrow(class'X2Action_MimicBeaconThrow'.static.AddToVisualizationTree(SourceTrack, Context));
	class'X2Action_EnterCover'.static.AddToVisualizationTree(SourceTrack, Context);

	// Configure the visualization track for the mimic beacon
	//******************************************************************************************
	MimicSourceUnit = XComGameState_Unit(VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID));
	`assert(MimicSourceUnit != none);
	MimicSourceUnit.GetUnitValue(class'X2Effect_SpawnUnit'.default.SpawnedUnitValueName, SpawnedUnitValue);

	MimicBeaconTrack = EmptyTrack;
	MimicBeaconTrack.StateObject_OldState = History.GetGameStateForObjectID(SpawnedUnitValue.fValue, eReturnType_Reference, VisualizeGameState.HistoryIndex);
	MimicBeaconTrack.StateObject_NewState = MimicBeaconTrack.StateObject_OldState;
	SpawnedUnit = XComGameState_Unit(MimicBeaconTrack.StateObject_NewState);
	`assert(SpawnedUnit != none);
	MimicBeaconTrack.VisualizeActor = History.GetVisualizer(SpawnedUnit.ObjectID);

	// Set the Throwing Unit's FireAction to reference the spawned unit
	FireAction.MimicBeaconUnitReference = SpawnedUnit.GetReference();
	// Set the Throwing Unit's FireAction to reference the spawned unit
	class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(MimicBeaconTrack, Context);

	// Only one target effect and it is X2Effect_SpawnDecoyBeacon
	SpawnMimicBeaconEffect = X2Effect_SpawnDecoyBeacon(Context.ResultContext.ShooterEffectResults.Effects[0]);
	
	if( SpawnMimicBeaconEffect == none )
	{
		`RedScreenOnce("MimicBeacon_BuildVisualization: Missing X2Effect_SpawnDecoyBeacon -dslonneger @gameplay");
		return;
	}

	SpawnMimicBeaconEffect.AddSpawnVisualizationsToTracks(Context, SpawnedUnit, MimicBeaconTrack, MimicSourceUnit, SourceTrack);

	class'X2Action_SyncVisualizer'.static.AddToVisualizationTree(MimicBeaconTrack, Context);

	AnimationAction = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(MimicBeaconTrack, Context));
	AnimationAction.Params.AnimName = default.DECOY_BEACON_START_ANIM;
	AnimationAction.Params.BlendTime = 0.0f;
}

static function X2AbilityTemplate CreateInitializeDBAbility()
{
	local X2AbilityTemplate Template;
	local X2Effect_MimicBeacon MimicBeaconEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'DecoyBeaconInitialize');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	// Build the immunities
	MimicBeaconEffect = new class'X2Effect_MimicBeacon';
	MimicBeaconEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	Template.AddShooterEffect(MimicBeaconEffect);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
//	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildVisualizationFn = DecoyBeaconVFX_BuildVisualization;

	return Template;
}

simulated function DecoyBeaconVFX_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory			History;
	local XComGameStateContext_Ability	Context;
	local StateObjectReference			InteractingUnitRef;
	local XComGameState_Unit			UnitState;
	local VisualizationActionMetadata   BuildData;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;

	UnitState = XComGameState_Unit(History.GetGameStateForObjectID(InteractingUnitRef.ObjectID));
	BuildData.StateObject_OldState = UnitState;
	BuildData.StateObject_NewState = UnitState;
	BuildData.VisualizeActor = UnitState.GetVisualizer();
	class'X2Action_DecoyBeaconVFX'.static.AddToVisualizationTree(BuildData, VisualizeGameState.GetContext());
}

/////////////////////////////////!!!DECOY BEACON STUFF!!!//////////////////////////////////

static function X2AbilityTemplate CreateTacuplinkMark()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_Charges					ChargeCost;
	local X2AbilityCharges						Charges;
	local X2AbilityCost_ActionPoints            ActionPointCost;
	local X2Condition_UnitProperty              TargetProperty;
	local X2Condition_UnitEffects				EffectsCondition;
	local XMBEffect_ConditionalBonus			TacScanFriendlyEffect, TacScanEnemyEffect;
	local X2Condition_Visibility				TargetVisibilityCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'TacuplinkMark');
	
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_TacscanAMod";
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.Hostility = eHostility_Defensive;
	Template.bLimitTargetIcons = true;
	Template.DisplayTargetHitChance = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SingleTargetWithSelf;
	
	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 1;
	//Charges.AddBonusCharge('ShadowRising', default.ShadowRisingCharges); - That's interesting
	Template.AbilityCharges = Charges;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = true;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetProperty = new class'X2Condition_UnitProperty';
	TargetProperty.ExcludeCivilian = true;
	TargetProperty.ExcludeDead = true;
	TargetProperty.ExcludeHostileToSource = false;
	TargetProperty.ExcludeFriendlyToSource = false;
	TargetProperty.RequireSquadmates = false;
	Template.AbilityTargetConditions.AddItem(TargetProperty);

	// Target must be visible and may use squad sight
	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bAllowSquadsight = true;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

	EffectsCondition = new class'X2Condition_UnitEffects';
	EffectsCondition.AddExcludeEffect('MimicBeaconEffect', 'AA_UnitIsImmune');
	Template.AbilityTargetConditions.AddItem(EffectsCondition);
	
	TacScanFriendlyEffect = class'X2Effect_TacScanFriendlyEffect'.static.CreateTacScanFriendlyEffect();
	TacScanEnemyEffect = class'X2Effect_TacScanFriendlyEffect'.static.CreateTacScanEnemyEffect();

	Template.AddTargetEffect(TacScanFriendlyEffect);
	Template.AddTargetEffect(TacScanEnemyEffect);

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	//======================================================This should be some kind of aiming animation such as heavy weapon or pistol or a point.
	Template.ActivationSpeech = 'ScanningProtocol';
	Template.CustomFireAnim = 'HL_SignalPoint';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipPerkActivationActions = true;
	Template.CinescriptCameraType = "Mark_Target";
//	Template.bShowActivation = true;

//========================================================Needs its own self fire anim (holding arm up?)
//	Template.CustomSelfFireAnim = 'NO_DefenseProtocol';

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
//BEGIN AUTOGENERATED CODE: Template Overrides 'AidProtocol'
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
//END AUTOGENERATED CODE: Template Overrides 'AidProtocol'

	return Template;
}

static function X2AbilityTemplate CreateTacUplinkCharges()
{
	local XMBEffect_AddAbilityCharges Effect;

	// Create an effect that will add a bonus charge to the Inspire Agility ability
	Effect = new class'XMBEffect_AddAbilityCharges';
	Effect.AbilityNames.AddItem('TacuplinkMark');
	Effect.BonusCharges = 1;
	Effect.MaxCharges = 3;

	return SelfTargetTrigger('TacUplinkCharges', "img:///UILibrary_SavageItems.UIPerk_TacscanAMod", false, Effect, 'PlayerTurnEnded', eFilter_Player);
}

static function X2AbilityTemplate CommandDesignatorAnimset()
{
    local X2AbilityTemplate                 Template;
    local X2Effect_AdditionalAnimSets        AnimSets;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'CommandDesignatorAnimset');

    Template.AbilitySourceName = 'eAbilitySource_Item';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.Hostility = eHostility_Neutral;
    Template.bDisplayInUITacticalText = false;
    
    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
    AnimSets = new class'X2Effect_AdditionalAnimSets';
    AnimSets.EffectName = 'ShieldOverAnimset';
	AnimSets.AddAnimSetWithPath("AnimSet'SAV_CommandDesignator.Anims.AS_CommandDesignator'");
    AnimSets.BuildPersistentEffect(1, true, false, false, eGameRule_TacticalGameStart);
    AnimSets.DuplicateResponse = eDupe_Ignore;
    Template.AddTargetEffect(AnimSets);
    
    Template.bSkipFireAction = true;
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    return Template;
}

static function X2AbilityTemplate CreateComDesiTacuplinkMark()
{
	local X2AbilityTemplate							Template;
	local X2AbilityCooldown_PlayerLocalAndGlobal	Cooldown;
	local X2AbilityCost_ActionPoints				ActionPointCost;
	local X2Condition_UnitProperty					TargetProperty;
	local X2Condition_UnitEffects					EffectsCondition;
	local XMBEffect_ConditionalBonus				TacScanFriendlyEffect, TacScanEnemyEffect;
	local X2Condition_Visibility					TargetVisibilityCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ComDesiTacuplinkMark');
	
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_ComDesi_TacScan";
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.Hostility = eHostility_Defensive;
	Template.bLimitTargetIcons = true;
	Template.DisplayTargetHitChance = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = false;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown_PlayerLocalAndGlobal';
	Cooldown.iNumTurns = 1;
	Cooldown.NumGlobalTurns = 1;
	Template.AbilityCooldown = Cooldown;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetProperty = new class'X2Condition_UnitProperty';
	TargetProperty.ExcludeCivilian = true;
	TargetProperty.ExcludeDead = true;
	TargetProperty.ExcludeHostileToSource = false;
	TargetProperty.ExcludeFriendlyToSource = false;
	TargetProperty.RequireSquadmates = false;
	Template.AbilityTargetConditions.AddItem(TargetProperty);

	// Target must be visible and may use squad sight
	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bAllowSquadsight = false;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

	EffectsCondition = new class'X2Condition_UnitEffects';
	EffectsCondition.AddExcludeEffect('MimicBeaconEffect', 'AA_UnitIsImmune');
	Template.AbilityTargetConditions.AddItem(EffectsCondition);
	
	TacScanFriendlyEffect = class'X2Effect_TacScanFriendlyEffect'.static.CreateTacScanFriendlyEffect();
	TacScanEnemyEffect = class'X2Effect_TacScanFriendlyEffect'.static.CreateTacScanEnemyEffect();

	Template.AddTargetEffect(TacScanFriendlyEffect);
	Template.AddTargetEffect(TacScanEnemyEffect);

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.ActivationSpeech = 'ScanningProtocol';
//	Template.CustomFireAnim = 'FF_FireA';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Mark_Target";
//	Template.bShowActivation = true;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
//BEGIN AUTOGENERATED CODE: Template Overrides 'AidProtocol'
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
//END AUTOGENERATED CODE: Template Overrides 'AidProtocol'

	return Template;
}

static function X2AbilityTemplate CreateComDesiMoveIt()
{
	local X2AbilityTemplate							Template;
	local X2AbilityCooldown_PlayerLocalAndGlobal	Cooldown;
	local X2AbilityCost_ActionPoints				ActionPointCost;
	local X2Condition_UnitProperty					TargetProperty;
	local X2Condition_UnitEffects					EffectsCondition;
	local X2Effect_GrantActionPoints				ActionPointEffect;
	local X2Condition_Visibility					TargetVisibilityCondition;
	local X2Effect_Persistent						PersistantEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ComDesiMoveIt');
	
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_ComDesi_MoveIt";
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.Hostility = eHostility_Defensive;
	Template.bLimitTargetIcons = true;
	Template.DisplayTargetHitChance = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = false;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown_PlayerLocalAndGlobal';
	Cooldown.iNumTurns = 2;
	Cooldown.NumGlobalTurns = 2;
	Template.AbilityCooldown = Cooldown;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetProperty = new class'X2Condition_UnitProperty';
	TargetProperty.ExcludeDead = true;
	TargetProperty.ExcludeHostileToSource = true;
	TargetProperty.ExcludeFriendlyToSource = false;
	TargetProperty.RequireSquadmates = true;
	Template.AbilityTargetConditions.AddItem(TargetProperty);

	// Target must be visible and may use squad sight
	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bAllowSquadsight = false;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

	EffectsCondition = new class'X2Condition_UnitEffects';
	EffectsCondition.AddExcludeEffect('MimicBeaconEffect', 'AA_UnitIsImmune');
	EffectsCondition.AddExcludeEffect('HunkerDown', 'AA_UnitIsImmune');
	Template.AbilityTargetConditions.AddItem(EffectsCondition);
	
	ActionPointEffect = new class'X2Effect_GrantActionPoints';
	ActionPointEffect.NumActionPoints = 1;
	ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.MoveActionPoint;
	Template.AddTargetEffect(ActionPointEffect);

	PersistantEffect = class'X2Effect_CommandDesignatorEffects'.static.CreateCDMoveItEffect();
	Template.AddTargetEffect(PersistantEffect);
	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.ActivationSpeech = 'ScanningProtocol';
//	Template.CustomFireAnim = 'FF_FireA';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Mark_Target";
//	Template.bShowActivation = true;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
//BEGIN AUTOGENERATED CODE: Template Overrides 'AidProtocol'
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
//END AUTOGENERATED CODE: Template Overrides 'AidProtocol'

	return Template;
}

static function X2AbilityTemplate CreateComDesiTakeCover()
{
	local X2AbilityTemplate							Template;
	local X2AbilityCooldown_PlayerLocalAndGlobal	Cooldown;
	local X2AbilityCost_ActionPoints				ActionPointCost;
	local X2Condition_UnitProperty					TargetProperty;
	local X2Condition_UnitEffects					EffectsCondition;
	local X2Effect_GrantActionPoints				ActionPointEffect;
	local X2Effect_ImmediateAbilityActivation		HunkerDownEffect;
	local X2Condition_Visibility					TargetVisibilityCondition;
	local X2Effect_Persistent						PersistantEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ComDesiTakeCover');
	
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_ComDesi_TakeCover";
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.Hostility = eHostility_Defensive;
	Template.bLimitTargetIcons = true;
	Template.DisplayTargetHitChance = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = false;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown_PlayerLocalAndGlobal';
	Cooldown.iNumTurns = 2;
	Cooldown.NumGlobalTurns = 2;
	Template.AbilityCooldown = Cooldown;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetProperty = new class'X2Condition_UnitProperty';
	TargetProperty.ExcludeNoCover = true;
	TargetProperty.ExcludeDead = true;
	TargetProperty.ExcludeHostileToSource = true;
	TargetProperty.ExcludeFriendlyToSource = false;
	TargetProperty.RequireSquadmates = true;
	Template.AbilityTargetConditions.AddItem(TargetProperty);

	// Target must be visible and may use squad sight
	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bAllowSquadsight = false;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

	EffectsCondition = new class'X2Condition_UnitEffects';
	EffectsCondition.AddExcludeEffect('MimicBeaconEffect', 'AA_UnitIsImmune');
	EffectsCondition.AddExcludeEffect('HunkerDown', 'AA_UnitIsImmune');
	Template.AbilityTargetConditions.AddItem(EffectsCondition);
	
	ActionPointEffect = new class'X2Effect_GrantActionPoints';
	ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.DeepCoverActionPoint;
	ActionPointEffect.NumActionPoints = 1;
	ActionPointEffect.bApplyOnlyWhenOut = true;
	Template.AddTargetEffect(ActionPointEffect);

	HunkerDownEffect = new class'X2Effect_ImmediateAbilityActivation';
	HunkerDownEffect.EffectName = 'ImmediateHunkerDown';
	HunkerDownEffect.AbilityName = 'HunkerDown';
	HunkerDownEffect.BuildPersistentEffect(1, false, true, , eGameRule_PlayerTurnBegin);
	Template.AddTargetEffect(HunkerDownEffect);
	AddSecondaryEffect(Template, HunkerDownEffect);

	PersistantEffect = class'X2Effect_CommandDesignatorEffects'.static.CreateCDTakeCoverEffect();
	Template.AddTargetEffect(PersistantEffect);
	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.ActivationSpeech = 'ScanningProtocol';
//	Template.CustomFireAnim = 'FF_FireA';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Mark_Target";
//	Template.bShowActivation = true;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
//BEGIN AUTOGENERATED CODE: Template Overrides 'AidProtocol'
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
//END AUTOGENERATED CODE: Template Overrides 'AidProtocol'

	return Template;
}

static function X2AbilityTemplate CreateComDesiCoveringFire()
{
	local X2AbilityTemplate							Template;
	local X2AbilityCooldown_PlayerLocalAndGlobal	Cooldown;
	local X2AbilityCost_ActionPoints				ActionPointCost;
	local X2Condition_UnitProperty					TargetProperty;
	local X2Condition_UnitEffects					EffectsCondition;
	local XMBEffect_AddAbility						CoolUnderPressureEffect;
	local XMBEffect_GrantReserveActionPoint			ActionPointEffect;
	local X2Condition_Visibility					TargetVisibilityCondition;
	local X2Effect_Persistent						PersistantEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ComDesiCoveringFire');

	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_ComDesi_CoveringFire";
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.Hostility = eHostility_Defensive;
	Template.bLimitTargetIcons = true;
	Template.DisplayTargetHitChance = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = false;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown_PlayerLocalAndGlobal';
	Cooldown.iNumTurns = 2;
	Cooldown.NumGlobalTurns = 2;
	Template.AbilityCooldown = Cooldown;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetProperty = new class'X2Condition_UnitProperty';
	TargetProperty.ExcludeDead = true;
	TargetProperty.ExcludeHostileToSource = true;
	TargetProperty.ExcludeFriendlyToSource = false;
	TargetProperty.RequireSquadmates = true;
	Template.AbilityTargetConditions.AddItem(TargetProperty);

	// Target must be visible and may use squad sight
	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bAllowSquadsight = false;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

	EffectsCondition = new class'X2Condition_UnitEffects';
	EffectsCondition.AddExcludeEffect('MimicBeaconEffect', 'AA_UnitIsImmune');
	Template.AbilityTargetConditions.AddItem(EffectsCondition);
	
	CoolUnderPressureEffect = new class'XMBEffect_AddAbility';
	CoolUnderPressureEffect.AbilityName = 'CoolUnderPressure';
	CoolUnderPressureEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
	CoolUnderPressureEffect.VisualizationFn = EffectFlyOver_Visualization;
	Template.AddTargetEffect(CoolUnderPressureEffect);

	ActionPointEffect = new class'XMBEffect_GrantReserveActionPoint';
	ActionPointEffect.ImmediateActionPoint = class'X2CharacterTemplateManager'.default.OverwatchReserveActionPoint;
	Template.AddTargetEffect(ActionPointEffect);
		
	PersistantEffect = class'X2Effect_CommandDesignatorEffects'.static.CreateCDCoveringFireEffect();
	Template.AddTargetEffect(PersistantEffect);
	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.ActivationSpeech = 'ScanningProtocol';
//	Template.CustomFireAnim = 'FF_FireA';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Mark_Target";
//	Template.bShowActivation = true;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
//BEGIN AUTOGENERATED CODE: Template Overrides 'AidProtocol'
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
//END AUTOGENERATED CODE: Template Overrides 'AidProtocol'

	return Template;
}

static function X2AbilityTemplate ImprovisedPlating()
{
	local X2AbilityTemplate				Template;
	local X2AbilityCost_ActionPoints    ActionPointCost;
	local X2AbilityCharges				Charges;
	local X2AbilityCost_Charges			ChargeCost;
	local X2Condition_UnitProperty      TargetProperty;
	local X2Effect_PersistentStatChange StatEffect;
	local X2AbilityTarget_Single        SingleTarget;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ImprovisedPlating');

	Template.DisplayTargetHitChance = false;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_reinforcedarmor";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY;
	Template.Hostility = eHostility_Neutral;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 0;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	SingleTarget.bIncludeSelf = false;
	SingleTarget.bShowAOE = true;
	Template.AbilityTargetStyle = SingleTarget;

	Template.bShowActivation = true;
	Template.bSkipFireAction = false;

	TargetProperty = new class'X2Condition_UnitProperty';
	TargetProperty.ExcludeDead = true;
	TargetProperty.ExcludeHostileToSource = true;
	TargetProperty.ExcludeFriendlyToSource = false;
	TargetProperty.RequireSquadmates = true;
	Template.AbilityTargetConditions.AddItem(TargetProperty);
		
	StatEffect = new class'X2Effect_PersistentStatChange';
	StatEffect.EffectName = 'ImprovisedPlatingEffectName';
	StatEffect.DuplicateResponse = eDupe_Allow;
	StatEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	StatEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, true,,Template.AbilitySourceName);
	StatEffect.AddPersistentStatChange(eStat_ArmorMitigation, 1);
	StatEffect.AddPersistentStatChange(eStat_ShieldHP, 1);
	Template.AddTargetEffect(StatEffect);
	Template.bLimitTargetIcons = true;

	Template.ActivationSpeech = 'HealingAlly';

//	Template.CustomFireAnim = 'FF_FireA';
	Template.CustomSelfFireAnim = 'FF_FireMedkitSelf';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate AddImprovisedPlatingBonus()
{
	local XMBEffect_AddAbilityCharges       BonusItemEffect;
	local X2AbilityTemplate					Template;

	// The effect isn't an X2Effect_Persistent, so we can't use it as the effect for Passive(). Let
	// Passive() create its own effect.
	Template = Passive('ImprovisedPlatingBonus', "img:///UILibrary_PerkIcons.UIPerk_reinforcedarmor", true);

	// Add the XMBEffect_AddItemCharges as an extra effect.
	BonusItemEffect = new class'XMBEffect_AddAbilityCharges';
	BonusItemEffect.AbilityNames.AddItem('ImprovisedPlating');
	BonusItemEffect.AbilityNames.AddItem('PlatingKitGremlin');
	BonusItemEffect.BonusCharges = 2;
	
	Template.AddTargetEffect(BonusItemEffect);
	//AddSecondaryEffect(Template, BonusItemEffect);

	return Template;
}

static function X2AbilityTemplate AddSavAnimaShield()
{
	local X2AbilityTemplate					Template;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	// The effect isn't an X2Effect_Persistent, so we can't use it as the effect for Passive(). Let
	// Passive() create its own effect.
	Template = Passive('SavAnimaShield', "img:///UILibrary_PerkIcons.UIPerk_stasisshield", true);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ShieldHP, 3);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_PsiOffense, 20);
	AddSecondaryEffect(Template, PersistentStatChangeEffect);

	return Template;
}

static function X2AbilityTemplate DeployBunkerModule()
{
	local X2AbilityTemplate             Template;
	local X2AbilityCost_ActionPoints    ActionPointCost;
	local X2AbilityCost_Ammo            AmmoCost;
	local X2AbilityTarget_Cursor        CursorTarget;
	local X2AbilityMultiTarget_Radius   RadiusMultiTarget;
	local X2Effect_SpawnBunkerModule    SpawnBunkerModule;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'DeployBunkerModule');
	
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_BunkerModule";
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	Template.bHideWeaponDuringFire = true;

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	Template.bUseAmmoAsChargesForHUD = true;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.STANDARD_GRENADE_PRIORITY;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.DoNotConsumeAllSoldierAbilities.AddItem('TotalCombat');
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.BUNKERFIELD_DEPLOYAREA;
	RadiusMultiTarget.bIgnoreBlockingCover = true; // we don't need this, the squad viewer will do the appropriate things once thrown
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	Template.TargetingMethod = class'X2TargetingMethod_MimicBeacon';
	Template.SkipRenderOfTargetingTemplate = true;

	Template.bUseThrownGrenadeEffects = true;

	SpawnBunkerModule = new class'X2Effect_SpawnBunkerModule';
	SpawnBunkerModule.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	Template.AddShooterEffect(SpawnBunkerModule);

	Template.AddShooterEffect(new class'X2Effect_BreakUnitConcealment');
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = DeployBunkerModule_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
		
	return Template;
}

simulated function DeployBunkerModule_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability Context;
	local VisualizationActionMetadata EmptyTrack;
	local VisualizationActionMetadata BunkerModuleTrack, SourceTrack;
	local XComGameState_Unit SpawnedUnit, SourceUnit;
	local StateObjectReference InteractingUnitRef;
	local UnitValue SpawnedUnitValue;
	local X2Effect_SpawnBunkerModule SpawnBunkerModule;
	local X2Action_MimicBeaconThrow FireAction;
//	local X2Action_PlayAnimation AnimationAction;
	
	History = `XCOMHISTORY;
	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;

	//Configure the visualization track for the shooter
	//****************************************************************************************
	SourceTrack = EmptyTrack;
	SourceTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	SourceTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	SourceTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	class'X2Action_ExitCover'.static.AddToVisualizationTree(SourceTrack, Context);
	FireAction = X2Action_MimicBeaconThrow(class'X2Action_MimicBeaconThrow'.static.AddToVisualizationTree(SourceTrack, Context));
	class'X2Action_EnterCover'.static.AddToVisualizationTree(SourceTrack, Context);

	// Configure the visualization track for the turret
	//******************************************************************************************
	SourceUnit = XComGameState_Unit(VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID));
	`assert(SourceUnit != none);
	SourceUnit.GetUnitValue(class'X2Effect_SpawnUnit'.default.SpawnedUnitValueName, SpawnedUnitValue);

	BunkerModuleTrack = EmptyTrack;
	BunkerModuleTrack.StateObject_OldState = History.GetGameStateForObjectID(SpawnedUnitValue.fValue, eReturnType_Reference, VisualizeGameState.HistoryIndex);
	BunkerModuleTrack.StateObject_NewState = BunkerModuleTrack.StateObject_OldState;
	SpawnedUnit = XComGameState_Unit(BunkerModuleTrack.StateObject_NewState);
	`assert(SpawnedUnit != none);
	BunkerModuleTrack.VisualizeActor = History.GetVisualizer(SpawnedUnit.ObjectID);


	// Set the Throwing Unit's FireAction to reference the spawned unit
	FireAction.MimicBeaconUnitReference = SpawnedUnit.GetReference();
	// Set the Throwing Unit's FireAction to reference the spawned unit
	class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(BunkerModuleTrack, Context);
	

	// Only one target effect and it is X2Effect_SpawnBunkerModule
	SpawnBunkerModule = X2Effect_SpawnBunkerModule(Context.ResultContext.ShooterEffectResults.Effects[0]);
	
	if( SpawnBunkerModule == none )
	{
		`RedScreenOnce("BuildVisualization: Missing X2Effect_SpawnBunkerModule");
		return;
	}

	
	class'X2Action_SyncVisualizer'.static.AddToVisualizationTree(BunkerModuleTrack, Context);
/*
	AnimationAction = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(BunkerModuleTrack, Context));
	AnimationAction.Params.AnimName = 'LL_MimicStart';
	AnimationAction.Params.BlendTime = 0.0f;
*/
	SpawnBunkerModule.AddSpawnVisualizationsToTracks(Context, SpawnedUnit, BunkerModuleTrack, SourceUnit);
}

static function X2AbilityTemplate BunkerModulePassive()
{
    local X2AbilityTemplate						Template;
	local XMBEffect_ConditionalBonus			Effect1, Effect2;
	local X2Effect_DamageImmunity				DamageImmunity;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'BunkerModulePassive');

    Template.AbilitySourceName = 'eAbilitySource_Item';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.Hostility = eHostility_Neutral;
    Template.bDisplayInUITacticalText = true;
   	Template.bIsPassive = true; 

    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.BuildPersistentEffect(1, true, false, true);
	DamageImmunity.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.ParthenogenicPoisonType);
	DamageImmunity.ImmuneTypes.AddItem('Poison');
	DamageImmunity.ImmuneTypes.AddItem('unconscious');
	DamageImmunity.ImmuneTypes.AddItem('bleeding');
	DamageImmunity.ImmuneTypes.AddItem('Mental');
	DamageImmunity.ImmuneTypes.AddItem('Fire');	
	DamageImmunity.EffectName = 'MachineImmunity';
	Template.AddTargetEffect(DamageImmunity);

	Effect1 = class'X2Effect_BunkerModuleDummyEffect'.static.CreateSAVBunkerModuleDummyEffect();
	Template.AddTargetEffect(Effect1);// spawns in icon and description and some FX hooks, now handles both the bubble and the emiters

	Effect2 = class'X2Effect_BunkerModuleDummyEffect'.static.CreateSAVBunkerEmitterDummyEffect();
	Template.AddTargetEffect(Effect2);// spawns in icon and description and some FX hooks, now handles both the bubble and the emiters

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_BunkerModule";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.bSkipFireAction = true;
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    return Template;
}

static function X2AbilityTemplate BunkerModule_Shutdown()
{
	local X2AbilityTemplate				Template;
	local X2Effect_ApplyWeaponDamage	WeaponDamageEffect;

	Template = SelfTargetActivated('BunkerModule_Shutdown', "img:///UILibrary_SavageItems.UIPerk_SwitchOff", true,,, eCost_Free);	
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.EffectDamageValue.Damage = 100;
	WeaponDamageEffect.bIgnoreBaseDamage = true;
	WeaponDamageEffect.bBypassShields = true;
	WeaponDamageEffect.bIgnoreArmor = true;
	
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;

	Template.OverrideAbilities.AddItem('Evac');
	AddSecondaryEffect(Template, WeaponDamageEffect);

	return Template;
}

static function X2AbilityTemplate BunkerFieldAbility()
{
	local X2AbilityTemplate						Template;
	local X2AbilityMultiTarget_Radius			RadiusMultiTarget;
	local X2AbilityTrigger_EventListener    	Trigger, Trigger2;
	local X2Effect_ApplyWeaponDamage			WeaponDamageEffect;
	local X2Effect_PersistentStatChange			StatEffect;
	local X2Effect_BunkerModExplosiveResist		PaddingEffect;
	local XMBEffect_ConditionalBonus			FXEffect, PersonalVFX;
	local X2Condition_UnitProperty				UnitCondition;
	local X2Condition_UnitStatCheck				StatCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'BunkerFieldAbility');

	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_BunkerField";
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.EventID = 'PlayerTurnBegun';
	Trigger.ListenerData.Filter = eFilter_Player;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Trigger.ListenerData.Priority = 55;
	Template.AbilityTriggers.AddItem(Trigger);

	Trigger2 = new class'X2AbilityTrigger_EventListener';
	Trigger2.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger2.ListenerData.EventID = 'PlayerTurnEnded';
	Trigger2.ListenerData.Filter = eFilter_Player;
	Trigger2.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Trigger2.ListenerData.Priority = 55;
	Template.AbilityTriggers.AddItem(Trigger2);

	Template.AbilityTargetStyle = default.SelfTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = true;
	RadiusMultiTarget.bIgnoreBlockingCover = true; 
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

//Effects
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.EffectDamageValue.Damage = 1;
	WeaponDamageEffect.bIgnoreBaseDamage = true;
	WeaponDamageEffect.bBypassShields = true;
	WeaponDamageEffect.bIgnoreArmor = true;
	Template.AddShooterEffect(WeaponDamageEffect);

//Apply them again to units within range of a module...
	PaddingEffect = new class'X2Effect_BunkerModExplosiveResist';
	PaddingEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd);
	PaddingEffect.DuplicateResponse = eDupe_Refresh;
	Template.AddMultiTargetEffect(PaddingEffect);// Add our effect to the multitarget

	//While this does add the defence and crit resist bonus
	FXEffect = class'X2Effect_BunkerModuleDummyEffect'.static.CreateSAVBunkerPersonalDummyEffect();
	Template.AddMultiTargetEffect(FXEffect);

	StatEffect = new class'X2Effect_PersistentStatChange';
	StatEffect.EffectName = default.SAVBunkerMobReductionEffectName;
	StatEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd);
	StatEffect.AddPersistentStatChange(eStat_Mobility, -5);
	StatEffect.DuplicateResponse = eDupe_Refresh;
	Template.AddMultiTargetEffect(StatEffect);

	PersonalVFX = class'X2Effect_BunkerModPersonalShieldVFX'.static.CreateBunkerModPersonalShieldVFX();
	Template.AddMultiTargetEffect(PersonalVFX);// spawns in icon and description and some FX hooks	

	//Be All inclusive
	UnitCondition = new class'X2Condition_UnitProperty';
	UnitCondition.ExcludeFriendlyToSource = false;
	UnitCondition.ExcludeHostileToSource = false;
	Template.AbilityTargetConditions.AddItem(UnitCondition);
	//dont have a low mobility already (want to avoid negative mobility values.)	
	StatCondition = new class'X2Condition_UnitStatCheck';
	StatCondition.AddCheckStat(eStat_Mobility, 7, eCheck_GreaterThan);
	StatEffect.TargetConditions.AddItem(StatCondition);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = BunkerField_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
		
	return Template;
}

simulated function BunkerField_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory				History;
	local XComGameStateContext_Ability		Context;
	local StateObjectReference				ShootingUnitRef;	
	local X2Action_PlayAnimation			PlayAnimation;

	local VisualizationActionMetadata       EmptyTrack;
	local VisualizationActionMetadata       ActionMetadata;

	local XComGameState_Ability				Ability;
	local X2Action_PlaySoundAndFlyOver		SoundAndFlyover;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	ShootingUnitRef = Context.InputContext.SourceObject;

	//Configure the visualization track for the shooter
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(ShootingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(ShootingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(ShootingUnitRef.ObjectID);
				
	PlayAnimation = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	PlayAnimation.Params.AnimName = 'HL_DeathBunkerModule';

	Ability = XComGameState_Ability(History.GetGameStateForObjectID(Context.InputContext.AbilityRef.ObjectID));
	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, default.SAVBunkerModuleShieldPulseFlyover, Ability.GetMyTemplate().ActivationSpeech, eColor_Good);
	//****************************************************************************************
}

static function X2AbilityTemplate CreateImprovisedCover()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_ActionPoints   	 	ActionPointCost;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2AbilityTarget_Cursor			Cursor;
	local X2AbilityMultiTarget_Radius		RadiusMultiTarget;
	local X2Condition_UnblockedNeighborTile	UnblockedNeighborTileCondition;
	local X2Effect_SpawnImprovisedCover		SpawnImprovisedCover;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'ImprovisedCover');

	Template.DisplayTargetHitChance = false;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_CoverPack";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY;
	Template.Hostility = eHostility_Neutral;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.bShowActivation = true;
	Template.bSkipFireAction = false;
	
	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 0;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	//Targeting
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.TargetingMethod = class'X2TargetingMethod_Pillar';

	Cursor = new class'X2AbilityTarget_Cursor';
	Cursor.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = Cursor;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = 0.25; // small amount so it just grabs one tile
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	UnblockedNeighborTileCondition = new class'X2Condition_UnblockedNeighborTile';
	UnblockedNeighborTileCondition.RequireVisible = true;
	Template.AbilityShooterConditions.AddItem(UnblockedNeighborTileCondition);

	//Spawn the thing
	SpawnImprovisedCover = new class'X2Effect_SpawnImprovisedCover';
	SpawnImprovisedCover.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	Template.AddShooterEffect(SpawnImprovisedCover);
	
	//Generic stuff
//	Template.CustomFireAnim = 'FF_FireA';
//	Template.CustomSelfFireAnim = 'FF_FireMedkitSelf';
	Template.AddShooterEffect(new class'X2Effect_BreakUnitConcealment');
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = DeployImprovisedCover_BuildVisualization;

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

simulated function DeployImprovisedCover_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability Context;
	local VisualizationActionMetadata EmptyTrack;
	local VisualizationActionMetadata BuildCoverTrack, SourceTrack;
	local XComGameState_Unit SpawnedUnit, SourceUnit;
	local StateObjectReference InteractingUnitRef;
	local UnitValue SpawnedUnitValue;
	local X2Effect_SpawnImprovisedCover SpawnImprovCover;
	local X2Action_MimicBeaconThrow FireAction;
	local X2Action_PlayAnimation AnimationAction;
	
	History = `XCOMHISTORY;
	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;

	//Configure the visualization track for the shooter
	//****************************************************************************************
	SourceTrack = EmptyTrack;
	SourceTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	SourceTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	SourceTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	class'X2Action_ExitCover'.static.AddToVisualizationTree(SourceTrack, Context);
	FireAction = X2Action_MimicBeaconThrow(class'X2Action_MimicBeaconThrow'.static.AddToVisualizationTree(SourceTrack, Context));
	class'X2Action_EnterCover'.static.AddToVisualizationTree(SourceTrack, Context);

	// Configure the visualization track for the turret
	//******************************************************************************************
	SourceUnit = XComGameState_Unit(VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID));
	`assert(SourceUnit != none);
	SourceUnit.GetUnitValue(class'X2Effect_SpawnUnit'.default.SpawnedUnitValueName, SpawnedUnitValue);

	BuildCoverTrack = EmptyTrack;
	BuildCoverTrack.StateObject_OldState = History.GetGameStateForObjectID(SpawnedUnitValue.fValue, eReturnType_Reference, VisualizeGameState.HistoryIndex);
	BuildCoverTrack.StateObject_NewState = BuildCoverTrack.StateObject_OldState;
	SpawnedUnit = XComGameState_Unit(BuildCoverTrack.StateObject_NewState);
	`assert(SpawnedUnit != none);
	BuildCoverTrack.VisualizeActor = History.GetVisualizer(SpawnedUnit.ObjectID);


	// Set the Throwing Unit's FireAction to reference the spawned unit
	FireAction.MimicBeaconUnitReference = SpawnedUnit.GetReference();
	// Set the Throwing Unit's FireAction to reference the spawned unit
	class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(BuildCoverTrack, Context);
	

	// Only one target effect and it is X2Effect_SpawnImprovisedCover
	SpawnImprovCover = X2Effect_SpawnImprovisedCover(Context.ResultContext.ShooterEffectResults.Effects[0]);
	
	if( SpawnImprovCover == none )
	{
		`RedScreenOnce("BuildVisualization: Missing X2Effect_SpawnImprovisedCover");
		return;
	}
		
	class'X2Action_SyncVisualizer'.static.AddToVisualizationTree(BuildCoverTrack, Context);

	AnimationAction = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(BuildCoverTrack, Context));
	AnimationAction.Params.AnimName = 'HL_BuildCoverPack';
	AnimationAction.Params.BlendTime = 0.0f;

	SpawnImprovCover.AddSpawnVisualizationsToTracks(Context, SpawnedUnit, BuildCoverTrack, SourceUnit);
}

	//Ability the base item gives to grant charges to the ability on the repair kit
static function X2AbilityTemplate AddCoverPackBonus()
{
	local XMBEffect_AddAbilityCharges       BonusItemEffect;
	local X2AbilityTemplate					Template;

	// The effect isn't an X2Effect_Persistent, so we can't use it as the effect for Passive(). Let
	// Passive() create its own effect.
	Template = Passive('CoverPackBonus', "img:///UILibrary_SavageItems.UIPerk_CoverPack", true);

	// Add the XMBEffect_AddItemCharges as an extra effect.
	BonusItemEffect = new class'XMBEffect_AddAbilityCharges';
	BonusItemEffect.AbilityNames.AddItem('ImprovisedCover');
	BonusItemEffect.BonusCharges = 2;
	
	Template.AddTargetEffect(BonusItemEffect);
	//AddSecondaryEffect(Template, BonusItemEffect);

	return Template;
}

//IMPROVISED COVER ABILITIES
//Basic ability for the cover
static function X2AbilityTemplate ImprovisedCoverTurn()
{
	local X2AbilityTemplate				Template;
	local X2Effect_ApplyWeaponDamage	WeaponDamageEffect;
	local X2Effect_GenerateCover		CoverEffect;
	// Create a triggered ability that runs at the end of the player's turn
	Template = SelfTargetTrigger('ImprovisedCoverTurn', "img:///UILibrary_SavageItems.UIPerk_CoverPack", true, none, 'PlayerTurnEnded', eFilter_Player);
	
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.EffectDamageValue.Damage = 1;
	WeaponDamageEffect.bIgnoreBaseDamage = true;
	WeaponDamageEffect.bBypassShields = true;
	WeaponDamageEffect.bIgnoreArmor = true;

	CoverEffect = new class'X2Effect_GenerateCover';
	CoverEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnEnd);
	CoverEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage);
	CoverEffect.DuplicateResponse = eDupe_Refresh;
	Template.AddShooterEffect(CoverEffect);

	AddSecondaryEffect(Template, WeaponDamageEffect);
	AddSecondaryEffect(Template, CoverEffect);
	return Template;
}

//Pass Turn ability
static function X2AbilityTemplate SAVUnitPassTurn()
{
	local X2AbilityTemplate				Template;
	local X2AbilityCost_ActionPoints    ActionPointCost;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVUnitPassTurn');
	
	// Icon Properties
	Template.DisplayTargetHitChance = false;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_PassTurn";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;
	Template.Hostility = eHostility_Neutral;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	Template.AbilityTargetStyle = default.SelfTarget;	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.bShowActivation = false;
	Template.bSkipFireAction = true;
		
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	return Template;
}

//CoverPassive, provides immunities
static function X2AbilityTemplate ImprovisedCoverPassive()
{
    local X2AbilityTemplate						Template;
	local X2Effect_DamageImmunity				DamageImmunity;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'ImprovisedCoverPassive');

    Template.AbilitySourceName = 'eAbilitySource_Item';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.Hostility = eHostility_Neutral;
    Template.bDisplayInUITacticalText = true;
   	Template.bIsPassive = true; 

    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.BuildPersistentEffect(1, true, false, true);
	DamageImmunity.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.ParthenogenicPoisonType);
	DamageImmunity.ImmuneTypes.AddItem('Poison');
	DamageImmunity.ImmuneTypes.AddItem('unconscious');
	DamageImmunity.ImmuneTypes.AddItem('bleeding');
	DamageImmunity.ImmuneTypes.AddItem('Mental');
	DamageImmunity.ImmuneTypes.AddItem('Fire');	
	DamageImmunity.EffectName = 'MachineImmunity';
	Template.AddTargetEffect(DamageImmunity);

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_CoverPack";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.bSkipFireAction = true;
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    return Template;
}

//Self Detonate
static function X2AbilityTemplate SAVUnitSelfDestruct()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityMultiTarget_Radius			RadiusMultiTarget;
	local X2Effect_ApplyWeaponDamage			WeaponDamageEffect, WeaponDamageEffect2;
	local X2Effect_ApplyDirectionalWorldDamage	WorldDamage;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVUnitSelfDestruct');
	
	// Icon Properties
	Template.DisplayTargetHitChance = false;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_demolition";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;
	Template.Hostility = eHostility_Neutral;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	Template.AbilityTargetStyle = default.SelfTarget;	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = true;
	RadiusMultiTarget.bIgnoreBlockingCover = true; 
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

//Effects
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';

	WeaponDamageEffect.EffectDamageValue.Damage = 10;
	WeaponDamageEffect.bIgnoreBaseDamage = true;
	WeaponDamageEffect.bBypassShields = true;
	WeaponDamageEffect.bIgnoreArmor = true;
	Template.AddShooterEffect(WeaponDamageEffect);

	WorldDamage = new class'X2Effect_ApplyDirectionalWorldDamage';
	WorldDamage.bUseWeaponDamageType = true;
	WorldDamage.bUseWeaponEnvironmentalDamage = false;
	WorldDamage.EnvironmentalDamageAmount = 30;
	WorldDamage.bApplyOnHit = true;
	WorldDamage.bApplyOnMiss = true;
	WorldDamage.bApplyToWorldOnHit = true;
	WorldDamage.bApplyToWorldOnMiss = false;
	WorldDamage.bHitAdjacentDestructibles = true;
	WorldDamage.PlusNumZTiles = 1;
	WorldDamage.bHitTargetTile = true;
	Template.AddMultiTargetEffect(WorldDamage);
	
	WeaponDamageEffect2 = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect2.bExplosiveDamage = true;
	WeaponDamageEffect2.bApplyWorldEffectsForEachTargetLocation = true;
	Template.AddMultiTargetEffect(WeaponDamageEffect2);

	Template.bShowActivation = true;
	Template.bSkipFireAction = false;
		
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.CustomFireAnim = 'HL_DemolishCover';

	return Template;
}

static function X2AbilityTemplate ShieldAmplifierAbility()
{
    local X2AbilityTemplate					Template;
	local X2AbilityTrigger_EventListener	EventListener;
	local X2Effect_PersistentStatChange		ShieldStat_Effect1, ShieldStat_Effect2, ShieldStat_Effect3, ShieldStat_Effect4, ShieldStat_Effect5;
	local X2Condition_UnitStatCheck			Con_ShieldStatGrt2, Con_ShieldStatGrt7, Con_ShieldStatGrt10, Con_ShieldStatGrt13;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'ShieldAmplifierAbility');

	Template.AbilitySourceName = 'eAbilitySource_Item';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_ShieldAmp";
	Template.bIsPassive = true;
    Template.Hostility = eHostility_Neutral;
    Template.bDisplayInUITacticalText = true;
    
    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    
	EventListener = new class'X2AbilityTrigger_EventListener';
	EventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventListener.ListenerData.EventID = 'PlayerTurnBegun';
	EventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	EventListener.ListenerData.Filter = eFilter_Player;
	EventListener.ListenerData.Priority = 80;//Want it to be a little slow so other turn begin effects trigger first.
	Template.AbilityTriggers.AddItem(EventListener);

//ShieldT2
Con_ShieldStatGrt2= new class'X2Condition_UnitStatCheck';
Con_ShieldStatGrt2.AddCheckStat(eStat_ShieldHP, 2, eCheck_GreaterThan);
//ShieldT3
Con_ShieldStatGrt7= new class'X2Condition_UnitStatCheck';
Con_ShieldStatGrt7.AddCheckStat(eStat_ShieldHP, 7, eCheck_GreaterThan);
//ShieldT4
Con_ShieldStatGrt10= new class'X2Condition_UnitStatCheck';
Con_ShieldStatGrt10.AddCheckStat(eStat_ShieldHP, 10, eCheck_GreaterThan);
//ShieldT5
Con_ShieldStatGrt13= new class'X2Condition_UnitStatCheck';
Con_ShieldStatGrt13.AddCheckStat(eStat_ShieldHP, 13, eCheck_GreaterThan);

	//===This section covers the stat effects=== These are fixed from the start of the mission.
	ShieldStat_Effect1 = new class'X2Effect_PersistentStatChange';
	ShieldStat_Effect1.EffectName = 'ShieldAmp1';
	ShieldStat_Effect1.BuildPersistentEffect(1, true, false, false);
	ShieldStat_Effect1.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	ShieldStat_Effect1.AddPersistentStatChange(eStat_ShieldHP, 1);
	ShieldStat_Effect1.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(ShieldStat_Effect1);
	
	ShieldStat_Effect2 = new class'X2Effect_PersistentStatChange';
	ShieldStat_Effect2.EffectName = 'ShieldAmp2';
	ShieldStat_Effect2.BuildPersistentEffect(1, true, false, false);
	ShieldStat_Effect2.AddPersistentStatChange(eStat_ShieldHP, 1);
	ShieldStat_Effect2.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(ShieldStat_Effect2);
	ShieldStat_Effect2.TargetConditions.AddItem(Con_ShieldStatGrt2);
	
	ShieldStat_Effect3 = new class'X2Effect_PersistentStatChange';
	ShieldStat_Effect3.EffectName = 'ShieldAmp3';
	ShieldStat_Effect3.BuildPersistentEffect(1, true, false, false);
	ShieldStat_Effect3.AddPersistentStatChange(eStat_ShieldHP, 1);
	ShieldStat_Effect3.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(ShieldStat_Effect3);
	ShieldStat_Effect3.TargetConditions.AddItem(Con_ShieldStatGrt7);
	
	ShieldStat_Effect4 = new class'X2Effect_PersistentStatChange';
	ShieldStat_Effect4.EffectName = 'ShieldAmp4';
	ShieldStat_Effect4.BuildPersistentEffect(1, true, false, false);
	ShieldStat_Effect4.AddPersistentStatChange(eStat_ShieldHP, 1);
	ShieldStat_Effect4.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(ShieldStat_Effect4);
	ShieldStat_Effect4.TargetConditions.AddItem(Con_ShieldStatGrt10);

	ShieldStat_Effect5 = new class'X2Effect_PersistentStatChange';
	ShieldStat_Effect5.EffectName = 'ShieldAmp5';
	ShieldStat_Effect5.BuildPersistentEffect(1, true, false, false);
	ShieldStat_Effect5.AddPersistentStatChange(eStat_ShieldHP, 1);
	ShieldStat_Effect5.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(ShieldStat_Effect5);
	ShieldStat_Effect5.TargetConditions.AddItem(Con_ShieldStatGrt13);

  //Template stuff
    Template.bSkipFireAction = true;
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    return Template;
}

static function X2AbilityTemplate BreachingGunAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints    ActionPointCost;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2Effect_Knockback				KnockbackEffect;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Cone         ConeMultiTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityToHitCalc_StandardAim    StandardAim;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'BreachingGunAbility');
	
	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);
	
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bGuaranteedHit = true;
	Template.AbilityToHitCalc = StandardAim;
	
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = true;
	Template.AddMultiTargetEffect(WeaponDamageEffect);

	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.KnockbackDistance = 3;
	KnockbackEffect.bKnockbackDestroysNonFragile = true;
	KnockbackEffect.OnlyOnDeath = false;
	Template.AddTargetEffect(KnockbackEffect);

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY;

	ConeMultiTarget = new class'X2AbilityMultiTarget_Cone';
	ConeMultiTarget.bUseWeaponRadius = true;
	ConeMultiTarget.ConeEndDiameter = default.BREACHING_GUN_TILE_WIDTH * class'XComWorldData'.const.WORLD_StepSize;
	ConeMultiTarget.ConeLength = default.BREACHING_GUN_TILE_LENGTH * class'XComWorldData'.const.WORLD_StepSize;
	Template.AbilityMultiTargetStyle = ConeMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	Template.AddShooterEffectExclusions();

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);
	
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.HideErrors.AddItem('AA_WrongSoldierClass');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_shreddergun";
	Template.bUseAmmoAsChargesForHUD = true;
	Template.TargetingMethod = class'X2TargetingMethod_Cone';

	Template.ActivationSpeech = 'ShredderGun';
	Template.CinescriptCameraType = "Soldier_HeavyWeapons";

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;

	return Template;	
}

///////////////////RESISTANCE WEAPON ABILITIES///////////////////////
// All the junk I'm adding to make the new Legacy, Unique and Legendary items goes here.
static function X2AbilityTemplate UniqueARMagneticUpgrade()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalBonus		Effect;
	local XMBCondition_AbilityProperty		Condition;
	local X2Condition_SavWeaponCategory	WeaponCondition;

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	WeaponCondition.IncludeWeaponCategories.AddItem('rifle');
	
	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bExcludeMelee = true;
	Condition.bRequireActivated = false;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'UniqueARMagneticUpgrade';
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin);
	Effect.AddDamageModifier(1);
	Effect.AddDamageModifier(1, eHit_Crit);
	Effect.AddToHitModifier(15);
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);
	
	Template = Passive('UniqueARMagneticUpgrade', "img:///UILibrary_SavageItems.UIPerk_Unique_MagRifleUpgrade", false, Effect);
	HidePerkIcon(Template);

	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	HidePerkIcon(Template);

	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);

	Template.AdditionalAbilities.AddItem('UniqueARBeamUpgrade');

	return Template;
}

static function X2AbilityTemplate UniqueARBeamUpgrade()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalBonus		Effect;
	local XMBCondition_AbilityProperty		Condition;
	local X2Condition_SavWeaponCategory	WeaponCondition;

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	WeaponCondition.IncludeWeaponCategories.AddItem('rifle');
	
	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bExcludeMelee = true;
	Condition.bRequireActivated = false;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'UniqueARBeamUpgrade';
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin);
	Effect.AddDamageModifier(1);
	Effect.AddDamageModifier(1, eHit_Crit);
	Effect.AddToHitModifier(15, eHit_Crit);
	Effect.AddArmorPiercingModifier(1);
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);
	
	Template = Passive('UniqueARBeamUpgrade', "img:///UILibrary_SavageItems.UIPerk_Unique_BeamRifleUpgrade", false, Effect);
	HidePerkIcon(Template);

	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');

	return Template;
}

static function X2AbilityTemplate UniqueSwordMagneticUpgrade()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalBonus		Effect;
	local XMBCondition_AbilityProperty		Condition;
	local X2Condition_SavWeaponCategory	WeaponCondition;

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	WeaponCondition.IncludeWeaponCategories.AddItem('sword');
	
	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bRequireMelee = true;
	Condition.bRequireActivated = false;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'UniqueSwordMagneticUpgrade';
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin);
	Effect.AddDamageModifier(1);
	Effect.AddToHitModifier(10, eHit_Crit);
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);
	Effect.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);
		
	Template = Passive('UniqueSwordMagneticUpgrade', "img:///UILibrary_SavageItems.UIPerk_Unique_MagSwordUpgrade", false, Effect);
	HidePerkIcon(Template);

	Template.AdditionalAbilities.AddItem('UniqueSwordBeamUpgrade');

	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);

	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventStunLancer');

	return Template;
}

static function X2AbilityTemplate UniqueSwordBeamUpgrade()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalBonus		Effect;
	local XMBCondition_AbilityProperty		Condition;
	local X2Condition_SavWeaponCategory	WeaponCondition;

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	WeaponCondition.IncludeWeaponCategories.AddItem('sword');
	
	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bRequireMelee = true;
	Condition.bRequireActivated = false;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'UniqueSwordBeamUpgrade';
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin);
	Effect.AddDamageModifier(1);
	Effect.AddDamageModifier(1, eHit_Crit);
	Effect.AddToHitModifier(10, eHit_Crit);
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);
	Effect.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);
	
	Template = Passive('UniqueSwordBeamUpgrade', "img:///UILibrary_SavageItems.UIPerk_Unique_BeamSwordUpgrade", false, Effect);
	HidePerkIcon(Template);
	
	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);

	Template.Requirements.RequiredTechs.AddItem('AutopsyArchon');

	return Template;
}
	
static function X2AbilityTemplate SAVLetErRip()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2AbilityCost_Ammo				AmmoCost;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVLetErRip');

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 0;
	ActionPointCost.bAddWeaponTypicalCost = true;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	//  require 2 ammo to be present so that both shots can be taken
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 2;
	AmmoCost.bFreeCost = true;
	Template.AbilityCosts.AddItem(AmmoCost);
	//  actually charge 1 ammo for this shot. the 2nd shot will charge the extra ammo.
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.BuiltInHitMod =  class'X2Ability_RangerAbilitySet'.default.RAPIDFIRE_AIM;
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AssociatedPassives.AddItem('HoloTargeting');
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());
	Template.bAllowAmmoEffects = true;
	Template.bAllowBonusWeaponEffects = true;

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_LetErRip";
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.AdditionalAbilities.AddItem('RapidFire2');
	Template.PostActivationEvents.AddItem('RapidFire2');

	Template.bCrossClassEligible = true;

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
//BEGIN AUTOGENERATED CODE: Template Overrides 'RapidFire'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'RapidFire'

	return Template;
}

static function X2AbilityTemplate CreateSAVPrototypePowerFluctuation()
{
	local X2AbilityTemplate 				Template;
	local X2Effect_RemoveEffects 			RemoveEffects;
	local X2Condition_SavWeaponCategory		WeaponCondition;
	local XMBCondition_AbilityProperty		Condition;
	local XMBEffect_ConditionalBonus		Effect1, Effect2, Effect3, Effect4, Effect5, Effect6;

	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem('DefectivePowerSupply_AimUpNM');
	RemoveEffects.EffectNamesToRemove.AddItem('DefectivePowerSupply_AimDnNM');
	RemoveEffects.EffectNamesToRemove.AddItem('DefectivePowerSupply_CritChanceUpNM');
	RemoveEffects.EffectNamesToRemove.AddItem('DefectivePowerSupply_DamDnNM');
	RemoveEffects.EffectNamesToRemove.AddItem('DefectivePowerSupply_CritDamUpNM');
	RemoveEffects.EffectNamesToRemove.AddItem('DefectivePowerSupply_PierceUpNM');
	RemoveEffects.bCheckSource = true;
	RemoveEffects.SetupEffectOnShotContextResult(true, true);

	// Create the template using a helper function
	Template = SelfTargetTrigger('SAVPrototypePowerFluctuation', "img:///UILibrary_SavageItems.UIPerk_Unique_UnreliablePowerSupply", false, RemoveEffects, 'AbilityActivated');

	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bExcludeMelee = true;
	Condition.bRequireActivated = false;
	AddTriggerTargetCondition(Template, Condition);

	//Primary weapon only firearms
	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	WeaponCondition.IncludeWeaponCategories.AddItem('rifle');
	AddTriggerTargetCondition(Template, WeaponCondition);

//Positive aim effect
	Effect1 = class'X2Effect_DefectivePowerSupply'.static.CreateDefectivePowerSupply_AimUp();
	Effect1.ApplyChance = 20;
	Effect1.TargetConditions.AddItem(default.LivingTargetUnitOnlyProperty);
	Effect1.AbilityShooterConditions.AddItem(WeaponCondition);
	Effect1.AbilityShooterConditions.AddItem(Condition);
//Negative aim effect
	Effect2 = class'X2Effect_DefectivePowerSupply'.static.CreateDefectivePowerSupply_AimDn();
	Effect2.ApplyChance = 15;
	Effect2.TargetConditions.AddItem(default.LivingTargetUnitOnlyProperty);
	Effect2.AbilityShooterConditions.AddItem(WeaponCondition);
	Effect2.AbilityShooterConditions.AddItem(Condition);
//Positive crit chance
	Effect3 = class'X2Effect_DefectivePowerSupply'.static.CreateDefectivePowerSupply_CritChanceUp();
	Effect3.ApplyChance = 20;
	Effect3.TargetConditions.AddItem(default.LivingTargetUnitOnlyProperty);
	Effect3.AbilityShooterConditions.AddItem(WeaponCondition);
	Effect3.AbilityShooterConditions.AddItem(Condition);
//Negative damage
	Effect4 = class'X2Effect_DefectivePowerSupply'.static.CreateDefectivePowerSupply_DamDn();
	Effect4.ApplyChance = 15;
	Effect4.TargetConditions.AddItem(default.LivingTargetUnitOnlyProperty);
	Effect4.AbilityShooterConditions.AddItem(WeaponCondition);
	Effect4.AbilityShooterConditions.AddItem(Condition);
//Positive crit damage
	Effect5 = class'X2Effect_DefectivePowerSupply'.static.CreateDefectivePowerSupply_CritDamUp();
	Effect5.ApplyChance = 15;
	Effect5.TargetConditions.AddItem(default.LivingTargetUnitOnlyProperty);
	Effect5.AbilityShooterConditions.AddItem(WeaponCondition);
	Effect5.AbilityShooterConditions.AddItem(Condition);
//Pierce bonus
	Effect6 = class'X2Effect_DefectivePowerSupply'.static.CreateDefectivePowerSupply_PierceUp();
	Effect6.ApplyChance = 15;
	Effect6.TargetConditions.AddItem(default.LivingTargetUnitOnlyProperty);
	Effect6.AbilityShooterConditions.AddItem(WeaponCondition);
	Effect6.AbilityShooterConditions.AddItem(Condition);
	
	Template.AddShooterEffect(Effect1);
	Template.AddShooterEffect(Effect2);
	Template.AddShooterEffect(Effect3);
	Template.AddShooterEffect(Effect4);
	Template.AddShooterEffect(Effect5);	
	Template.AddShooterEffect(Effect6);

	return Template;
}

static function X2AbilityTemplate CreateSAVDefectivePowerSupply()
{
	local X2AbilityTemplate 				Template;
	local X2Effect_DisableWeapon 			DisableWeaponEffect;
	local X2AbilityToHitCalc_PercentChance	ApplyChance;
	local X2Condition_SavWeaponCategory		WeaponCondition;
	local XMBCondition_AbilityProperty		Condition;

	DisableWeaponEffect = new class'X2Effect_DisableWeapon';
	DisableWeaponEffect.TargetConditions.AddItem(default.LivingTargetUnitOnlyProperty);

	// Create the template using a helper function
	Template = SelfTargetTrigger('SAVDefectivePowerSupply', "img:///UILibrary_SavageItems.0_4_Perks.UnreliableAmmo", false, DisableWeaponEffect, 'AbilityActivated');

	//Has a chance to trigger
	ApplyChance = new class'X2AbilityToHitCalc_PercentChance';
	ApplyChance.PercentToHit = 10;
	Template.AbilityToHitCalc = ApplyChance;
	
	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bExcludeMelee = true;
	Condition.bRequireActivated = false;
	AddTriggerTargetCondition(Template, Condition);

	//Primary weapon only firearms
	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	WeaponCondition.IncludeWeaponCategories.AddItem('rifle');
	AddTriggerTargetCondition(Template, WeaponCondition);

	// Show a flyover when the ability is activated
	Template.bShowActivation = true;

	return Template;
}

static function X2AbilityTemplate SAVViperfangPoison()
{
	local X2AbilityTemplate                 Template;
	local X2Effect_DamageImmunity           DamageImmunity;
	local XMBEffect_PermanentStatChange		MobilityNerfEffect, DodgeNerfEffect;
	local X2Condition_UnitStatCheck			MaxStatCondition1, MaxStatCondition2;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVViperfangPoison');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_andromedon_poisoncloud";
	AddIconPassive(Template);

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.ImmuneTypes.AddItem('Poison');
	DamageImmunity.BuildPersistentEffect(1, true, false, false);
	DamageImmunity.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	Template.AddTargetEffect(DamageImmunity);

	// Permenant Mobility reduction
	MobilityNerfEffect = new class'XMBEffect_PermanentStatChange';
	MobilityNerfEffect.AddStatChange(eStat_Mobility, -1);
	MobilityNerfEffect.ApplyChance = 15;
	MaxStatCondition1 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition1.AddCheckStat(eStat_Mobility, 8, eCheck_GreaterThan);
	MobilityNerfEffect.TargetConditions.AddItem(MaxStatCondition1);
	Template.AddTargetEffect(MobilityNerfEffect);

	// Permenant Crit Chance reduction
	DodgeNerfEffect = new class'XMBEffect_PermanentStatChange';
	DodgeNerfEffect.AddStatChange(eStat_Dodge, -2);
	DodgeNerfEffect.ApplyChance = 30;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_CritChance, -19, eCheck_GreaterThan);
	DodgeNerfEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(DodgeNerfEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate SAVViperfangAutopsyUpgrade()
{
	local XMBEffect_BonusDamageByDamageType Effect;
	local X2AbilityTemplate Template;

	// Create an effect that adds +1 damage to fire attacks and +1 damage to burn damage
	Effect = new class'XMBEffect_BonusDamageByDamageType';
	Effect.EffectName = 'ViperfangAutopsy';
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin);

	Effect.RequiredDamageTypes.AddItem('poison');
	Effect.DamageBonus = 1;

	// Create the template using a helper function
	Template = Passive('SAVViperfangAutopsyUpgrade', "img:///UILibrary_SavageItems.UIPerk_Unique_ViperfangUpgrade", true, Effect);
	AddIconPassive(Template);

	Effect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
		
	Template.Requirements.RequiredTechs.AddItem('AutopsyViper');

	return Template;
}

static function X2AbilityTemplate SAVTheVipersBite()
{
	local X2AbilityTemplate Template;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;
	local X2Condition_UnitProperty Condition;
	local XMBCondition_AbilityProperty	AbilityCondition;
	local XMBCondition_WeaponName	WeaponCondition;

	Template = SelfTargetTrigger('SAVTheVipersBite', "img:///UILibrary_PerkIcons.UIPerk_poisonclaws", false,, 'KillMail');

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(3, false, true, false, eGameRule_PlayerTurnBegin);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, 4);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, 35);
	PersistentStatChangeEffect.DuplicateResponse = eDupe_Refresh;
	AddSecondaryEffect(Template, PersistentStatChangeEffect);

	AddIconPassive(Template);

	Condition = new class'X2Condition_UnitProperty';
	Condition.ExcludeOrganic = false;
	Condition.ExcludeRobotic = true;
	Condition.ExcludeDead = false;
	Condition.ExcludeFriendlyToSource = true;
	Condition.ExcludeHostileToSource = false;
	AddTriggerTargetCondition(Template, Condition);

	AbilityCondition = new class'XMBCondition_AbilityProperty';
	AbilityCondition.IncludeHostility.AddItem(eHostility_Offensive);
	AbilityCondition.ExcludeHostility.AddItem(eHostility_Neutral);
	AbilityCondition.ExcludeHostility.AddItem(eHostility_Defensive);
	AbilityCondition.bRequireMelee = true;
	AbilityCondition.bRequireActivated = false;
	AddTriggerTargetCondition(Template, AbilityCondition);

	WeaponCondition = new class'XMBCondition_WeaponName';
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_Viperfang');
	AddTriggerTargetCondition(Template, WeaponCondition);

	return Template;
}

static function X2AbilityTemplate SAVEndlessVengeance_ReactionBonus()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalBonus		Effect;
	local XMBCondition_AbilityProperty		Condition;
	local XMBCondition_WeaponName			WeaponCondition;

	WeaponCondition = new class'XMBCondition_WeaponName';
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Legendary_EndlessVengeance');
	
	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bRequireMelee = true;
	Condition.bRequireActivated = false;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'UniqueSwordBeamUpgrade';
	Effect.AddToHitModifier(100);
	Effect.AddToHitModifier(-100, eHit_Graze);
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);
	Effect.AbilityTargetConditions.AddItem(default.ReactionFireCondition);

	Template = Passive('SAVEndlessVengeance_ReactionBonus', "img:///UILibrary_SavageItems.UIPerk_Unique_EndlessVenganceBonus", false, Effect);

	return Template;
}

static function X2AbilityTemplate SAV_EndlessVengeance()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges				ChargeCost;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAV_EndlessVengeance');

	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Unique_EndlessVengance";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 0;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 3;
	Template.AbilityCosts.AddItem(ChargeCost);

	Template.AbilityShooterConditions.AddItem(new class'X2Condition_ManualOverride');
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();	

	Template.AddTargetEffect(new class'X2Effect_ManualOverride');

	Template.bSkipFireAction = true;
	Template.bShowActivation = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
//BEGIN AUTOGENERATED CODE: Template Overrides 'ManualOverride'
	Template.AbilityConfirmSound = "Manual_Override_Activate";
	Template.ActivationSpeech = 'Reaper';
//END AUTOGENERATED CODE: Template Overrides 'ManualOverride'

	return Template;
}

static function X2AbilityTemplate SAV_EndlessVengeance_Charges()
{
	local X2AbilityTemplate				Template;
	local XMBCondition_AbilityProperty	Condition;
	local XMBEffect_AddAbilityCharges	Effect;

	Effect = new class'XMBEffect_AddAbilityCharges';
	Effect.AbilityNames.AddItem('SAV_EndlessVengeance');
	Effect.BonusCharges = 1;
	Effect.MaxCharges = 3;

	Template = SelfTargetTrigger('SAV_EndlessVengeance_Charges', "img:///UILibrary_SavageItems.UIPerk_Unique_EndlessVengance", false, Effect, 'KillMail', eFilter_Unit);

	Condition = new class'XMBCondition_AbilityProperty';
	Condition.bRequireMelee = true;
	Condition.bRequireActivated = false;

	AddTriggerTargetCondition(Template, Condition);

	return Template;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////GREMLIN ABILITIES//////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Usefull stuff

//	Found on GremlinHeal - Template.OverrideAbilities.AddItem('MedikitHeal'); - MedikitHeal is replaced by GremlinHeal  if available

//	Found on Overcharge - Template.PrerequisiteAbilities.AddItem('Rend'); - Overcharge requires Rend

/*	GremlinCondition = new class'XMBCondition_WeaponName';
	GremlinCondition.IncludeWeaponNames.AddItem('Gremlin_CV');
	GremlinCondition.IncludeWeaponNames.AddItem('Gremlin_MG');
	GremlinCondition.IncludeWeaponNames.AddItem('Gremlin_BM');
	GremlinCondition.bCheckAmmo = true;
	EffectNAME.AbilityTargetConditions.AddItem(Condition);
*/
/*
	AbilityCondition = new class'X2Condition_AbilityProperty';
	AbilityCondition.OwnerHasSoldierAbilities.AddItem('ABILITYNAME');

	EffectNAME.TargetConditions.AddItem(AbilityCondition);

	//HIDE ABILITY IF ANOTHER IS AVAILABLE
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideIfOtherAvailable;
	Template.HideIfAvailable.AddItem('LongWatch');

*/
//On the Medical AMod, one of the checks to enable the medical style gremlin abilities
static function X2AbilityTemplate CreateSavMedicalProtocol()
{
	local X2AbilityTemplate         Template;

	Template = PurePassive('SAVMedicalProtocol', "img:///UILibrary_SavageItems.UIPerk_GremlinIntegration_Medical");

	return Template;
}

//On the Engineering AMod, one of the checks to enable the engineering style gremlin abilities
static function X2AbilityTemplate CreateEngineeringProtocol()
{
	local X2AbilityTemplate         Template;

	Template = PurePassive('SAVEngineeringProtocol', "img:///UILibrary_SavageItems.UIPerk_GremlinIntegration_Engineering");

	return Template;
}

//On the Engineering AMod, one of the checks to enable the engineering style gremlin abilities
static function X2AbilityTemplate CreateRepairKitMarker()
{
	local X2AbilityTemplate         Template;

	Template = PurePassive('RepairKitMarker', "img:///gfxXComIcons.Repair");

	return Template;
}

//Abilities Start
static function X2AbilityTemplate SAVGremlinHeal()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityCost_Charges             ChargeCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_UnitStatCheck         UnitStatCheckCondition;
	local X2Condition_UnitEffects           UnitEffectsCondition;
	local X2Effect_ApplyMedikitHeal         MedikitHeal;
	local X2Condition_AbilityProperty		AbilityConditionMedical;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVGremlinHeal');

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;	
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityCharges = new class'X2AbilityCharges_GremlinHeal';

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	ChargeCost.SharedAbilityCharges.AddItem('SAVGremlinStabilize');
	Template.AbilityCosts.AddItem(ChargeCost);
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SingleTargetWithSelf;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = false; //Hack: See following comment.
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.ExcludeTurret = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//My Condition
	AbilityConditionMedical = new class'X2Condition_AbilityProperty';
	AbilityConditionMedical.OwnerHasSoldierAbilities.AddItem('SAVMedicalProtocol');
//	AbilityConditionMedical.OwnerHasSoldierAbilities.AddItem('MedicalProtocol');
	Template.AbilityTargetConditions.AddItem(AbilityConditionMedical);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//Hack: Do this instead of ExcludeDead, to only exclude properly-dead or bleeding-out units.
	UnitStatCheckCondition = new class'X2Condition_UnitStatCheck';
	UnitStatCheckCondition.AddCheckStat(eStat_HP, 0, eCheck_GreaterThan);
	Template.AbilityTargetConditions.AddItem(UnitStatCheckCondition);

	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2StatusEffects'.default.BleedingOutName, 'AA_UnitIsImpaired');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	MedikitHeal = new class'X2Effect_ApplyMedikitHeal';
	MedikitHeal.PerUseHP = class'X2Ability_DefaultAbilitySet'.default.MEDIKIT_PERUSEHP;
	MedikitHeal.IncreasedHealProject = 'BattlefieldMedicine';
	MedikitHeal.IncreasedPerUseHP = class'X2Ability_DefaultAbilitySet'.default.NANOMEDIKIT_PERUSEHP;
	Template.AddTargetEffect(MedikitHeal);

	Template.AddTargetEffect(RemoveAllEffectsByDamageType());

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_medicalprotocol";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CORPORAL_PRIORITY;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	Template.AbilitySourceName = 'eAbilitySource_Perk';

	Template.bStationaryWeapon = true;
	Template.PostActivationEvents.AddItem('ItemRecalled');
	Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.AttachGremlinToTarget_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinSingleTarget_BuildVisualization;

	Template.ActivationSpeech = 'MedicalProtocol';
////////////////////////////////////////////////////////////////////////////////////////
//Icon and override stuff
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
//	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideIfOtherAvailable;
	Template.HideIfAvailable.AddItem('GremlinHeal');
//	Template.OverrideAbilities.AddItem('MedikitHeal');
//	Template.OverrideAbilities.AddItem('NanoMedikitHeal');
//	Template.OverrideAbilities.AddItem('GremlinHeal');
////////////////////////////////////////////////////////////////////////////////////////
	Template.bOverrideWeapon = true;
	Template.CustomSelfFireAnim = 'NO_MedicalProtocol';

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate SAVGremlinStabilize()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityCost_Charges             ChargeCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Effect_RemoveEffects            RemoveEffects;
	local X2AbilityCharges_GremlinHeal      Charges;
	local X2Condition_AbilityProperty		AbilityConditionMedical;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVGremlinStabilize');

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Charges = new class'X2AbilityCharges_GremlinHeal';
	Charges.bStabilize = true;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	ChargeCost.SharedAbilityCharges.AddItem('SAVGremlinHeal');

	Template.AbilityCosts.AddItem(ChargeCost);
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SingleTargetWithSelf;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = false;
	UnitPropertyCondition.ExcludeAlive = false;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.IsBleedingOut = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//My Condition
	AbilityConditionMedical = new class'X2Condition_AbilityProperty';
	AbilityConditionMedical.OwnerHasSoldierAbilities.AddItem('SAVMedicalProtocol');
//	AbilityConditionMedical.OwnerHasSoldierAbilities.AddItem('MedicalProtocol');
	Template.AbilityTargetConditions.AddItem(AbilityConditionMedical);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2StatusEffects'.default.BleedingOutName);
	Template.AddTargetEffect(RemoveEffects);
	Template.AddTargetEffect(class'X2StatusEffects'.static.CreateUnconsciousStatusEffect(, true));

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_gremlinheal";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CORPORAL_PRIORITY;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	Template.AbilitySourceName = 'eAbilitySource_Perk';

	Template.bStationaryWeapon = true;
	Template.PostActivationEvents.AddItem('ItemRecalled');
	Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.AttachGremlinToTarget_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinSingleTarget_BuildVisualization;

	Template.ActivationSpeech = 'MedicalProtocol';
////////////////////////////////////////////////////////////////////////////////////////
//Icon and override stuff
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
//	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideIfOtherAvailable;
	Template.HideIfAvailable.AddItem('GremlinStabilize');
//	Template.OverrideAbilities.AddItem( 'MedikitStabilize' );
//	Template.OverrideAbilities.AddItem( 'GremlinStabilize' );
////////////////////////////////////////////////////////////////////////////////////////

	Template.bOverrideWeapon = true;
	Template.CustomSelfFireAnim = 'NO_MedicalProtocol';

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate SavRegenSprayGremlin()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCharges_GremlinRegen     Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_AbilityProperty		AbilityConditionMedical;
	local X2Effect_Regeneration				RegenerationEffect;
	local X2Effect_RemoveEffectsByDamageType RemoveEffects;
	local XMBEffect_ConditionalBonus		RegenDummyEffect;
	local X2Condition_UnitEffects			UnitEffectsCondition;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavRegenSprayGremlin');

//NEEDS to use charges from the item ability////////////////////////
	Charges = new class'X2AbilityCharges_GremlinRegen';
	Template.AbilityCharges = Charges;
////////////////////////////////////////////////////////////////////
	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SingleTargetWithSelf;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
		
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//My Conditions
	AbilityConditionMedical = new class'X2Condition_AbilityProperty';
	AbilityConditionMedical.OwnerHasSoldierAbilities.AddItem('SAVMedicalProtocol');
//	AbilityConditionMedical.OwnerHasSoldierAbilities.AddItem('MedicalProtocol');
	Template.AbilityTargetConditions.AddItem(AbilityConditionMedical);

	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);//Want this or you can target stuff way off in the fog
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2StatusEffects'.default.BleedingOutName, 'AA_UnitIsImpaired');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	RegenerationEffect = new class'X2Effect_Regeneration';
	RegenerationEffect.BuildPersistentEffect(5, false, true, false, eGameRule_PlayerTurnEnd);
	RegenerationEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	RegenerationEffect.HealAmount = class'X2Ability_SavItemAbilities_Core'.default.SAVREGEN_REGEN_AMOUNT;
//	RegenerationEffect.MaxHealAmount = default.SAVREGEN_MAX_REGEN_AMOUNT;//check this isn't changed on the latest version of the ability.
	RegenerationEffect.DuplicateResponse = eDupe_Allow;
	RegenerationEffect.HealthRegeneratedName = 'StasisVestHealthRegenerated';
	RegenerationEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(RegenerationEffect);

	RemoveEffects = new class'X2Effect_RemoveEffectsByDamageType';
	RemoveEffects.DamageTypesToRemove.AddItem('fire');
	RemoveEffects.DamageTypesToRemove.AddItem('poison');
	RemoveEffects.DamageTypesToRemove.AddItem(class'X2Effect_ParthenogenicPoison'.default.ParthenogenicPoisonType);
	RemoveEffects.DamageTypesToRemove.AddItem('acid');
	RemoveEffects.DamageTypesToRemove.AddItem('Bleeding');
	Template.AddTargetEffect( RemoveEffects );

	RegenDummyEffect = class'X2Effect_RegenDummy'.static.CreateRegenDummyEffect();
	Template.AddTargetEffect(RegenDummyEffect);// Just spawns in icon and description and some FX hooks
	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Ability_RegenSpray";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	
////////////////////////////////////////////////////////////////////////////////////////
//Icon and override stuff
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.OverrideAbilities.AddItem('SavRegenSpray');
////////////////////////////////////////////////////////////////////////////////////////
	
	//This block handles the gremlin specific stuff, because we are extending the Specialist skillset I'm hoping we can use the game state and visualisation from there
	Template.bStationaryWeapon = true;
	Template.PostActivationEvents.AddItem('ItemRecalled');
	Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.AttachGremlinToTarget_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinSingleTarget_BuildVisualization;

	Template.ActivationSpeech = 'MedicalProtocol';

	Template.bOverrideWeapon = true;
	Template.CustomSelfFireAnim = 'NO_Regen';

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate SavRegen2SprayGremlin()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCharges_GremlinRegen2     Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_AbilityProperty		AbilityConditionMedical;
	local X2Effect_Regeneration				RegenerationEffect;
	local X2Effect_RemoveEffectsByDamageType RemoveEffects;
	local X2Effect_ApplyRepairKitHeal		HealEffect;
	local XMBEffect_ConditionalBonus		RegenDummyEffect;
	local X2Condition_UnitEffects			UnitEffectsCondition;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavRegen2SprayGremlin');

//NEEDS to use charges from the item ability////////////////////////
	Charges = new class'X2AbilityCharges_GremlinRegen2';
	Template.AbilityCharges = Charges;
////////////////////////////////////////////////////////////////////
	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SingleTargetWithSelf;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
		
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//My Conditions
	AbilityConditionMedical = new class'X2Condition_AbilityProperty';
	AbilityConditionMedical.OwnerHasSoldierAbilities.AddItem('SAVMedicalProtocol');
//	AbilityConditionMedical.OwnerHasSoldierAbilities.AddItem('MedicalProtocol');
	Template.AbilityTargetConditions.AddItem(AbilityConditionMedical);

	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);//Want this or you can target stuff way off in the fog
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2StatusEffects'.default.BleedingOutName, 'AA_UnitIsImpaired');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	RegenerationEffect = new class'X2Effect_Regeneration';
	RegenerationEffect.BuildPersistentEffect(6, false, true, false, eGameRule_PlayerTurnEnd);
	RegenerationEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	RegenerationEffect.HealAmount = class'X2Ability_SavItemAbilities_Core'.default.SAVREGEN2_REGEN_AMOUNT;
//	RegenerationEffect.MaxHealAmount = default.SAVREGEN_MAX_REGEN_AMOUNT;
	RegenerationEffect.DuplicateResponse = eDupe_Allow;
	RegenerationEffect.HealthRegeneratedName = 'SavRegenHealthRegenerated';
	RegenerationEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(RegenerationEffect);

	RemoveEffects = new class'X2Effect_RemoveEffectsByDamageType';
	RemoveEffects.DamageTypesToRemove.AddItem('fire');
	RemoveEffects.DamageTypesToRemove.AddItem('poison');
	RemoveEffects.DamageTypesToRemove.AddItem(class'X2Effect_ParthenogenicPoison'.default.ParthenogenicPoisonType);
	RemoveEffects.DamageTypesToRemove.AddItem('acid');
	RemoveEffects.DamageTypesToRemove.AddItem('Bleeding');
	Template.AddTargetEffect( RemoveEffects );

	RegenDummyEffect = class'X2Effect_RegenDummy2'.static.CreateRegenDummy2Effect();
	Template.AddTargetEffect(RegenDummyEffect);// Just spawns in icon and description and some FX hooks
	
	HealEffect = new class'X2Effect_ApplyRepairKitHeal';
	HealEffect.PerUseHP = 2;
	Template.AddTargetEffect(HealEffect);
	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Ability_RegenSpray";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	
////////////////////////////////////////////////////////////////////////////////////////
//Icon and override stuff
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.OverrideAbilities.AddItem('SavRegenSpray2');
////////////////////////////////////////////////////////////////////////////////////////
	
	//This block handles the gremlin specific stuff, because we are extending the Specialist skillset I'm hoping we can use the game state and visualisation from there
	Template.bStationaryWeapon = true;
	Template.PostActivationEvents.AddItem('ItemRecalled');
	Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.AttachGremlinToTarget_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinSingleTarget_BuildVisualization;

	Template.ActivationSpeech = 'MedicalProtocol';

	Template.bOverrideWeapon = true;
	Template.CustomSelfFireAnim = 'NO_Regen';

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate CreateSavNaniteRegenGremlin()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCharges_GremlinNanoRegen Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_AbilityProperty		AbilityConditionMedical;
	local X2Effect_RKitRepairArmor			ArmorEffect;
	local X2Effect_Regeneration				RegenerationEffect;
	local X2Effect_RemoveEffectsByDamageType RemoveEffects;
	local X2Effect_ApplyRepairKitHeal		HealEffect;
	local XMBEffect_ConditionalBonus		RegenDummyEffect;
	local X2Condition_UnitEffects			UnitEffectsCondition;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavNaniteRegenGremlin');

//NEEDS to use charges from the item ability////////////////////////
	Charges = new class'X2AbilityCharges_GremlinNanoRegen';
	Template.AbilityCharges = Charges;
////////////////////////////////////////////////////////////////////
	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SingleTargetWithSelf;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
		
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//My Conditions
	AbilityConditionMedical = new class'X2Condition_AbilityProperty';
	AbilityConditionMedical.OwnerHasSoldierAbilities.AddItem('SAVMedicalProtocol');
//	AbilityConditionMedical.OwnerHasSoldierAbilities.AddItem('MedicalProtocol');
	Template.AbilityTargetConditions.AddItem(AbilityConditionMedical);

	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);//Want this or you can target stuff way off in the fog
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2StatusEffects'.default.BleedingOutName, 'AA_UnitIsImpaired');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	ArmorEffect = new class'X2Effect_RKitRepairArmor';
	Template.AddTargetEffect(ArmorEffect);

	RegenerationEffect = new class'X2Effect_Regeneration';
	RegenerationEffect.BuildPersistentEffect(5, false, true, false, eGameRule_PlayerTurnEnd);
	RegenerationEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	RegenerationEffect.HealAmount = class'X2Ability_SavItemAbilities_Core'.default.SAVREGEN_NANOREGEN_AMOUNT;
//	RegenerationEffect.MaxHealAmount = default.SAVREGEN_MAX_REGEN_AMOUNT;
	RegenerationEffect.DuplicateResponse = eDupe_Allow;
	RegenerationEffect.HealthRegeneratedName = 'SavNanoRegenHealthRegenerated';
	RegenerationEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(RegenerationEffect);

	RemoveEffects = new class'X2Effect_RemoveEffectsByDamageType';
	RemoveEffects.DamageTypesToRemove.AddItem('fire');
	RemoveEffects.DamageTypesToRemove.AddItem('poison');
	RemoveEffects.DamageTypesToRemove.AddItem(class'X2Effect_ParthenogenicPoison'.default.ParthenogenicPoisonType);
	RemoveEffects.DamageTypesToRemove.AddItem('acid');
	RemoveEffects.DamageTypesToRemove.AddItem('Bleeding');
	RemoveEffects.DamageTypesToRemove.AddItem('NanoShred');
	RemoveEffects.DamageTypesToRemove.AddItem('Frost');
	Template.AddTargetEffect(RemoveEffects);

	RegenDummyEffect = class'X2Effect_NaniteRegenDummy'.static.CreateNaniteRegenDummyEffect();
	Template.AddTargetEffect(RegenDummyEffect);// Just spawns in icon and description and some FX hooks
	
	HealEffect = new class'X2Effect_ApplyRepairKitHeal';
	HealEffect.PerUseHP = 4;
	Template.AddTargetEffect(HealEffect);
	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Ability_RegenSpray";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	
////////////////////////////////////////////////////////////////////////////////////////
//Icon and override stuff
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.OverrideAbilities.AddItem('SavNanoRegenSpray');
////////////////////////////////////////////////////////////////////////////////////////
	
	//This block handles the gremlin specific stuff, because we are extending the Specialist skillset I'm hoping we can use the game state and visualisation from there
	Template.bStationaryWeapon = true;
	Template.PostActivationEvents.AddItem('ItemRecalled');
	Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.AttachGremlinToTarget_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinSingleTarget_BuildVisualization;

	Template.ActivationSpeech = 'MedicalProtocol';

	Template.bOverrideWeapon = true;
	Template.CustomSelfFireAnim = 'NO_NanoRegen';

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate CreateSavStimulatorGremlin()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCharges_GremlinStimulator Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_AbilityProperty		AbilityConditionMedical;
	local X2Effect_RemoveEffectsByDamageType RemoveEffects;
	local X2Condition_UnitEffects			UnitEffectsCondition;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavStimulatorGremlin');

//NEEDS to use charges from the item ability////////////////////////
	Charges = new class'X2AbilityCharges_GremlinStimulator';
	Template.AbilityCharges = Charges;
////////////////////////////////////////////////////////////////////
	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SingleTargetWithSelf;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
		
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	Template.AbilityTargetConditions.AddItem(new class'X2Condition_RevivalProtocol');

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//My Conditions
	AbilityConditionMedical = new class'X2Condition_AbilityProperty';
	AbilityConditionMedical.OwnerHasSoldierAbilities.AddItem('SAVMedicalProtocol');
//	AbilityConditionMedical.OwnerHasSoldierAbilities.AddItem('MedicalProtocol');
	Template.AbilityTargetConditions.AddItem(AbilityConditionMedical);

	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);//Want this or you can target stuff way off in the fog
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2StatusEffects'.default.BleedingOutName, 'AA_UnitIsImpaired');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	RemoveEffects = new class'X2Effect_RemoveEffectsByDamageType';
	RemoveEffects.DamageTypesToRemove.AddItem('fire');
	RemoveEffects.DamageTypesToRemove.AddItem('poison');
	RemoveEffects.DamageTypesToRemove.AddItem(class'X2Effect_ParthenogenicPoison'.default.ParthenogenicPoisonType);
	RemoveEffects.DamageTypesToRemove.AddItem('acid');
	RemoveEffects.DamageTypesToRemove.AddItem('Bleeding');
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.PanickedName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2StatusEffects'.default.UnconsciousName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.DazedName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.ObsessedName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.BerserkName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.ShatteredName);
	Template.AddTargetEffect( RemoveEffects );
	
	Template.AddTargetEffect(new class'X2Effect_RestoreActionPoints');
 	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_revive";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	
////////////////////////////////////////////////////////////////////////////////////////
//Icon and override stuff
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.OverrideAbilities.AddItem('SavStimulate');
////////////////////////////////////////////////////////////////////////////////////////
	
	//This block handles the gremlin specific stuff, because we are extending the Specialist skillset I'm hoping we can use the game state and visualisation from there
	Template.bStationaryWeapon = true;
	Template.PostActivationEvents.AddItem('ItemRecalled');
	Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.AttachGremlinToTarget_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinSingleTarget_BuildVisualization;
//	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.ActivationSpeech = 'MedicalProtocol';

	Template.bOverrideWeapon = true;
	Template.CustomSelfFireAnim = 'NO_Stimulate';

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate SAVGremlinAdministerStims()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityCharges_SAVStims			Charges;
	local X2AbilityCost_Charges             ChargeCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_UnitStatCheck         UnitStatCheckCondition;
	local X2Condition_UnitEffects           UnitEffectsCondition;
	local X2Effect_PersistentStatChange			StatEffect;
	local X2Effect_ApplyMedikitHeal				HealEffect;	
	local XMBEffect_PermanentStatChange			PermenantWillEffect;
	local X2Effect_RemoveEffects				RemoveEffects;
	local X2Effect_RemoveEffects				MindControlRemovalEffect;
	local X2Effect_RemoveEffectsByDamageType	RemoveEffectsStatus;
	local X2Effect_ApplyWeaponDamage			WeaponDamageEffect;
	local XMBEffect_ConditionalBonus			StimmedDummyEffect;
	local X2Effect_SavWillLoss					SavWillGainEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition;
	local X2Condition_AbilityProperty		AbilityConditionMedical;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVGremlinAdministerStims');

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;	
	Template.AbilityCosts.AddItem(ActionPointCost);

//NEEDS to use charges from the item ability////////////////////////
	Charges = new class'X2AbilityCharges_SAVStims';
	Template.AbilityCharges = Charges;
////////////////////////////////////////////////////////////////////

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SingleTargetWithSelf;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//My Condition
	AbilityConditionMedical = new class'X2Condition_AbilityProperty';
	AbilityConditionMedical.OwnerHasSoldierAbilities.AddItem('SAVMedicalProtocol');
//	AbilityConditionMedical.OwnerHasSoldierAbilities.AddItem('MedicalProtocol');
	Template.AbilityTargetConditions.AddItem(AbilityConditionMedical);

	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);//Want this or you can target stuff way off in the fog
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//Hack: Do this instead of ExcludeDead, to only exclude properly-dead or bleeding-out units.
	UnitStatCheckCondition = new class'X2Condition_UnitStatCheck';
	UnitStatCheckCondition.AddCheckStat(eStat_HP, 0, eCheck_GreaterThan);
	Template.AbilityTargetConditions.AddItem(UnitStatCheckCondition);

	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2StatusEffects'.default.BleedingOutName, 'AA_UnitIsImpaired');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);
//////EFFECTS
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bIgnoreBaseDamage = true;
	WeaponDamageEffect.EffectDamageValue.Damage = 0;
	WeaponDamageEffect.EffectDamageValue.PlusOne = 80;
	WeaponDamageEffect.bBypassShields = true;
	WeaponDamageEffect.bIgnoreArmor = true;
	Template.AddTargetEffect(WeaponDamageEffect);

	RemoveEffects = class'X2StatusEffects'.static.CreateMindControlRemoveEffects();
	RemoveEffects.DamageTypes.Length = 0;		//	don't let an immunity to "mental" effects resist this cleanse
	MindControlRemovalEffect = new class'X2Effect_RemoveEffects';
	MindControlRemovalEffect.EffectNamesToRemove.AddItem(class'X2Effect_MindControl'.default.EffectName);
	Template.AddTargetEffect(RemoveEffects);
	Template.AddTargetEffect(MindControlRemovalEffect);

	RemoveEffectsStatus = new class'X2Effect_RemoveEffectsByDamageType';
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.PanickedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.DazedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.ObsessedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.BerserkName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.ShatteredName);
	Template.AddTargetEffect(RemoveEffectsStatus);

	// Permenant Will Reduction
	PermenantWillEffect = new class'XMBEffect_PermanentStatChange';
	PermenantWillEffect.AddStatChange(eStat_Will, class'X2Ability_SavItemAbilities_Core'.default.SAVSTIMSPERMENANTWILLOSS);
	// check if unit has more than 10 will
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_Will, 5, eCheck_GreaterThan);
	PermenantWillEffect.TargetConditions.AddItem(MaxStatCondition);	
	Template.AddTargetEffect(PermenantWillEffect);

	SavWillGainEffect = new class'X2Effect_SavWillLoss';
//	SavWillGainEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	SavWillGainEffect.WillMod = +15;
	Template.AddTargetEffect(SavWillGainEffect);

	HealEffect = new class'X2Effect_ApplyMedikitHeal';
	HealEffect.PerUseHP = 1;
	Template.AddTargetEffect(HealEffect);

	StimmedDummyEffect = class'X2Effect_SavStimmedEffect'.static.CreateSavComStimmedEffect();
	Template.AddTargetEffect(StimmedDummyEffect);// Just spawns in icon and description and some FX hooks

	StatEffect = new class'X2Effect_PersistentStatChange';
	StatEffect.EffectName = 'StimStats';
	StatEffect.DuplicateResponse = eDupe_Allow;
	StatEffect.BuildPersistentEffect(3, false, true, false, eGameRule_PlayerTurnEnd);
	StatEffect.SetDisplayInfo(ePerkBuff_Bonus, class'X2Ability_SavItemAbilities_Core'.default.SavCombatStimBonusName, class'X2Ability_SavItemAbilities_Core'.default.SavCombatStimBonusDesc, Template.IconImage, true);
	StatEffect.AddPersistentStatChange(eStat_Mobility, class'X2Ability_SavItemAbilities_Core'.default.SAVSTIMSMOBILITYBONUS);
	StatEffect.AddPersistentStatChange(eStat_CritChance, class'X2Ability_SavItemAbilities_Core'.default.SAVSTIMSCRITBONUS);
	StatEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(StatEffect);	
//////EFFECTS

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_combatstims";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	Template.AbilitySourceName = 'eAbilitySource_Perk';

	Template.bStationaryWeapon = true;
	Template.PostActivationEvents.AddItem('ItemRecalled');
	Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.AttachGremlinToTarget_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinSingleTarget_BuildVisualization;

	Template.ActivationSpeech = 'CombatStim';
////////////////////////////////////////////////////////////////////////////////////////
//Icon and override stuff
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
//	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideIfOtherAvailable;
//	Template.HideIfAvailable.AddItem('GremlinHeal');
//	Template.OverrideAbilities.AddItem('MedikitHeal');
//	Template.OverrideAbilities.AddItem('NanoMedikitHeal');
	Template.OverrideAbilities.AddItem('SavAdministerStims');
////////////////////////////////////////////////////////////////////////////////////////
	Template.bOverrideWeapon = true;
	Template.CustomSelfFireAnim = 'NO_CombatStims';

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate SAVGremlinAdministerStims2()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityCharges_SAVStims2		Charges;
	local X2AbilityCost_Charges             ChargeCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_UnitStatCheck         UnitStatCheckCondition;
	local X2Condition_UnitEffects           UnitEffectsCondition;
	local X2Effect_PersistentStatChange			StatEffect;
	local X2Effect_ApplyMedikitHeal				HealEffect;	
	local XMBEffect_PermanentStatChange			PermenantWillEffect;
	local X2Effect_RemoveEffects				RemoveEffects;
	local X2Effect_RemoveEffects				MindControlRemovalEffect;
	local X2Effect_RemoveEffectsByDamageType	RemoveEffectsStatus;
	local X2Effect_ApplyWeaponDamage			WeaponDamageEffect;
	local XMBEffect_ConditionalBonus			StimmedDummyEffect;
	local X2Effect_SavWillLoss					SavWillGainEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition;
	local X2Condition_AbilityProperty		AbilityConditionMedical;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVGremlinAdministerStims2');

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 0;	
	Template.AbilityCosts.AddItem(ActionPointCost);

//NEEDS to use charges from the item ability////////////////////////
	Charges = new class'X2AbilityCharges_SAVStims2';
	Template.AbilityCharges = Charges;
////////////////////////////////////////////////////////////////////

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SingleTargetWithSelf;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//My Condition
	AbilityConditionMedical = new class'X2Condition_AbilityProperty';
	AbilityConditionMedical.OwnerHasSoldierAbilities.AddItem('SAVMedicalProtocol');
//	AbilityConditionMedical.OwnerHasSoldierAbilities.AddItem('MedicalProtocol');
	Template.AbilityTargetConditions.AddItem(AbilityConditionMedical);

	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);//Want this or you can target stuff way off in the fog
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//Hack: Do this instead of ExcludeDead, to only exclude properly-dead or bleeding-out units.
	UnitStatCheckCondition = new class'X2Condition_UnitStatCheck';
	UnitStatCheckCondition.AddCheckStat(eStat_HP, 1, eCheck_GreaterThan);
	Template.AbilityTargetConditions.AddItem(UnitStatCheckCondition);

	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2StatusEffects'.default.BleedingOutName, 'AA_UnitIsImpaired');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);
//////EFFECTS
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bIgnoreBaseDamage = true;
	WeaponDamageEffect.EffectDamageValue.Damage = 0;
	WeaponDamageEffect.EffectDamageValue.PlusOne = 50;
	WeaponDamageEffect.bBypassShields = true;
	WeaponDamageEffect.bIgnoreArmor = true;
	Template.AddTargetEffect(WeaponDamageEffect);

	RemoveEffects = class'X2StatusEffects'.static.CreateMindControlRemoveEffects();
	RemoveEffects.DamageTypes.Length = 0;		//	don't let an immunity to "mental" effects resist this cleanse
	MindControlRemovalEffect = new class'X2Effect_RemoveEffects';
	MindControlRemovalEffect.EffectNamesToRemove.AddItem(class'X2Effect_MindControl'.default.EffectName);
	Template.AddTargetEffect(RemoveEffects);
	Template.AddTargetEffect(MindControlRemovalEffect);

	RemoveEffectsStatus = new class'X2Effect_RemoveEffectsByDamageType';
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.PanickedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.DazedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.ObsessedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.BerserkName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.ShatteredName);
	Template.AddTargetEffect(RemoveEffectsStatus);

	// Permenant Will Reduction
	PermenantWillEffect = new class'XMBEffect_PermanentStatChange';
	PermenantWillEffect.AddStatChange(eStat_Will, class'X2Ability_SavItemAbilities_Core'.default.SAVADVSTIMSPERMENANTWILLOSS);
	// check if unit has more than 10 will
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_Will, 5, eCheck_GreaterThan);
	PermenantWillEffect.TargetConditions.AddItem(MaxStatCondition);	
	Template.AddTargetEffect(PermenantWillEffect);

	SavWillGainEffect = new class'X2Effect_SavWillLoss';
//	SavWillGainEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	SavWillGainEffect.WillMod = +25;
	Template.AddTargetEffect(SavWillGainEffect);

	HealEffect = new class'X2Effect_ApplyMedikitHeal';
	HealEffect.PerUseHP = 1;
	Template.AddTargetEffect(HealEffect);

	StimmedDummyEffect = class'X2Effect_SavStimmedEffect'.static.CreateSavComStimmed2Effect();
	Template.AddTargetEffect(StimmedDummyEffect);// Just spawns in icon and description and some FX hooks

	StatEffect = new class'X2Effect_PersistentStatChange';
	StatEffect.EffectName = 'StimStats';
	StatEffect.DuplicateResponse = eDupe_Allow;
	StatEffect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	StatEffect.SetDisplayInfo(ePerkBuff_Bonus, class'X2Ability_SavItemAbilities_Core'.default.SavCombatStimBonusName, class'X2Ability_SavItemAbilities_Core'.default.SavCombatStimBonusDesc, Template.IconImage, true);
	StatEffect.AddPersistentStatChange(eStat_Mobility, class'X2Ability_SavItemAbilities_Core'.default.SAVADVSTIMSMOBILITYBONUS);
	StatEffect.AddPersistentStatChange(eStat_CritChance, class'X2Ability_SavItemAbilities_Core'.default.SAVADVSTIMSCRITBONUS);
	StatEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(StatEffect);	
//////EFFECTS

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_combatstims";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	Template.AbilitySourceName = 'eAbilitySource_Perk';

	Template.bStationaryWeapon = true;
	Template.PostActivationEvents.AddItem('ItemRecalled');
	Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.AttachGremlinToTarget_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinSingleTarget_BuildVisualization;

	Template.ActivationSpeech = 'CombatStim';
////////////////////////////////////////////////////////////////////////////////////////
//Icon and override stuff
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
//	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideIfOtherAvailable;
//	Template.HideIfAvailable.AddItem('GremlinHeal');
//	Template.OverrideAbilities.AddItem('MedikitHeal');
//	Template.OverrideAbilities.AddItem('NanoMedikitHeal');
	Template.OverrideAbilities.AddItem('SavAdministerAdvStims');
////////////////////////////////////////////////////////////////////////////////////////
	Template.bOverrideWeapon = true;
	Template.CustomSelfFireAnim = 'NO_CombatStims';

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate CreateRepairKitGremlin()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCharges_GremlinRepair    Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_AbilityProperty		AbilityConditionEngineering;
	local X2Effect_RKitRepairArmor			ArmorEffect;
	local X2Effect_ApplyRepairKitHeal		HealEffect;
	local X2Effect_ApplyRepairKitSHLD		RemoveEffects;
	local X2Condition_UnitEffects			UnitEffectsCondition;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVRepairKitGremlin');

//NEEDS to use charges from the item ability////////////////////////
	Charges = new class'X2AbilityCharges_GremlinRepair';
	Template.AbilityCharges = Charges;
////////////////////////////////////////////////////////////////////
	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SingleTargetWithSelf;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
		
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = false;
	UnitPropertyCondition.ExcludeOrganic = false;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2StatusEffects'.default.BleedingOutName, 'AA_UnitIsImpaired');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//My Conditions
	AbilityConditionEngineering = new class'X2Condition_AbilityProperty';
	AbilityConditionEngineering.OwnerHasSoldierAbilities.AddItem('SAVEngineeringProtocol');
	Template.AbilityTargetConditions.AddItem(AbilityConditionEngineering);

	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);//Want this or you can target stuff way off in the fog
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	HealEffect = new class'X2Effect_ApplyRepairKitHeal';
	HealEffect.PerUseHP = 4;
	Template.AddTargetEffect(HealEffect);

	ArmorEffect = new class'X2Effect_RKitRepairArmor';
	Template.AddTargetEffect(ArmorEffect);

	RemoveEffects = new class'X2Effect_ApplyRepairKitSHLD';
	RemoveEffects.DamageTypesToRemove.AddItem('Acid');
	RemoveEffects.DamageTypesToRemove.AddItem('Mental');
	RemoveEffects.DamageTypesToRemove.AddItem('Stun');
	RemoveEffects.DamageTypesToRemove.AddItem('Disorient');
	Template.AddTargetEffect(RemoveEffects);

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.IconImage = "img:///gfxXComIcons.Repair";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	
////////////////////////////////////////////////////////////////////////////////////////
//Icon and override stuff
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.OverrideAbilities.AddItem('RepairKitRepair');
////////////////////////////////////////////////////////////////////////////////////////
	
	//This block handles the gremlin specific stuff, because we are extending the Specialist skillset I'm hoping we can use the game state and visualisation from there
	Template.bStationaryWeapon = true;
	Template.PostActivationEvents.AddItem('ItemRecalled');
	Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.AttachGremlinToTarget_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinSingleTarget_BuildVisualization;

	Template.ActivationSpeech = 'MedicalProtocol';

	Template.bOverrideWeapon = true;
	Template.CustomSelfFireAnim = 'NO_Weld';

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate CreateRepairKit2Gremlin()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCharges_GremlinRepair    Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_AbilityProperty		AbilityConditionEngineering;
	local X2Effect_RKitRepairArmor			ArmorEffect;
	local X2Effect_ApplyRepairKitHeal		HealEffect;
	local X2Effect_ApplyRepairKitSHLD		RemoveEffects;
	local X2Condition_UnitEffects			UnitEffectsCondition;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVRepairKit2Gremlin');

//NEEDS to use charges from the item ability////////////////////////
	Charges = new class'X2AbilityCharges_GremlinRepair';
	Template.AbilityCharges = Charges;
////////////////////////////////////////////////////////////////////
	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SingleTargetWithSelf;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
		
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = false;
	UnitPropertyCondition.ExcludeOrganic = false;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2StatusEffects'.default.BleedingOutName, 'AA_UnitIsImpaired');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//My Conditions
	AbilityConditionEngineering = new class'X2Condition_AbilityProperty';
	AbilityConditionEngineering.OwnerHasSoldierAbilities.AddItem('SAVEngineeringProtocol');
	Template.AbilityTargetConditions.AddItem(AbilityConditionEngineering);

	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);//Want this or you can target stuff way off in the fog
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	HealEffect = new class'X2Effect_ApplyRepairKitHeal';
	HealEffect.PerUseHP = 8;
	Template.AddTargetEffect(HealEffect);

	ArmorEffect = new class'X2Effect_RKitRepairArmor';
	Template.AddTargetEffect(ArmorEffect);

	RemoveEffects = new class'X2Effect_ApplyRepairKitSHLD';
	RemoveEffects.DamageTypesToRemove.AddItem('Acid');
	RemoveEffects.DamageTypesToRemove.AddItem('Mental');
	RemoveEffects.DamageTypesToRemove.AddItem('Stun');
	RemoveEffects.DamageTypesToRemove.AddItem('Disorient');
	Template.AddTargetEffect(RemoveEffects);

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.IconImage = "img:///gfxXComIcons.Repair";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	
////////////////////////////////////////////////////////////////////////////////////////
//Icon and override stuff
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.OverrideAbilities.AddItem('SAVRepairKitGremlin');
	Template.OverrideAbilities.AddItem('RepairKitRepair');
	Template.OverrideAbilities.AddItem('RepairKitRepair2');
////////////////////////////////////////////////////////////////////////////////////////
	
	//This block handles the gremlin specific stuff, because we are extending the Specialist skillset I'm hoping we can use the game state and visualisation from there
	Template.bStationaryWeapon = true;
	Template.PostActivationEvents.AddItem('ItemRecalled');
	Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.AttachGremlinToTarget_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinSingleTarget_BuildVisualization;

	Template.ActivationSpeech = 'MedicalProtocol';

	Template.bOverrideWeapon = true;
	Template.CustomSelfFireAnim = 'NO_Weld';

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate CreatePlatingKitGremlin()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCharges				    Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty          UnitPropertyCondition, TargetProperty;
	local X2Condition_AbilityProperty		AbilityConditionEngineering;
	local X2Effect_PersistentStatChange		StatEffect;
	local X2Condition_UnitEffects			UnitEffectsCondition;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PlatingKitGremlin');

//NEEDS to use charges from the item ability////////////////////////
	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 0;
	Template.AbilityCharges = Charges;
////////////////////////////////////////////////////////////////////
	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SingleTargetWithSelf;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
		
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	TargetProperty = new class'X2Condition_UnitProperty';
	TargetProperty.ExcludeDead = true;
	TargetProperty.ExcludeHostileToSource = true;
	TargetProperty.ExcludeFriendlyToSource = false;
	TargetProperty.RequireSquadmates = true;
	Template.AbilityTargetConditions.AddItem(TargetProperty);

	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2StatusEffects'.default.BleedingOutName, 'AA_UnitIsImpaired');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//My Conditions
	AbilityConditionEngineering = new class'X2Condition_AbilityProperty';
	AbilityConditionEngineering.OwnerHasSoldierAbilities.AddItem('SAVEngineeringProtocol');
	AbilityConditionEngineering.OwnerHasSoldierAbilities.AddItem('RepairKitMarker');
	Template.AbilityTargetConditions.AddItem(AbilityConditionEngineering);

	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);//Want this or you can target stuff way off in the fog
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
	StatEffect = new class'X2Effect_PersistentStatChange';
	StatEffect.EffectName = 'ImprovisedPlatingEffectName';
	StatEffect.DuplicateResponse = eDupe_Allow;
	StatEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	StatEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, true,,Template.AbilitySourceName);
	StatEffect.AddPersistentStatChange(eStat_ArmorMitigation, 1);
	StatEffect.AddPersistentStatChange(eStat_ShieldHP, 1);
	Template.AddTargetEffect(StatEffect);

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_reinforcedarmor";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	
////////////////////////////////////////////////////////////////////////////////////////
//Icon and override stuff
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.OverrideAbilities.AddItem('ImprovisedPlating');
////////////////////////////////////////////////////////////////////////////////////////
	
	//This block handles the gremlin specific stuff, because we are extending the Specialist skillset I'm hoping we can use the game state and visualisation from there
	Template.bStationaryWeapon = true;
	Template.PostActivationEvents.AddItem('ItemRecalled');
	Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.AttachGremlinToTarget_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinSingleTarget_BuildVisualization;

	Template.ActivationSpeech = 'MedicalProtocol';

	Template.bOverrideWeapon = true;
	Template.CustomSelfFireAnim = 'NO_Weld';

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

//GREMLIN HELPER STUFF////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//GREMLIN HELPER STUFF////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//GREMLIN HELPER STUFF////////////////////////////////////////////////////////////////////////////////////////////////////////////////

static function X2Effect_RemoveEffectsByDamageType RemoveAllEffectsByDamageType()
{
	local X2Effect_RemoveEffectsByDamageType RemoveEffectTypes;
	local name HealType;

	RemoveEffectTypes = new class'X2Effect_RemoveEffectsByDamageType';
	foreach class'X2Ability_DefaultAbilitySet'.default.MedikitHealEffectTypes(HealType)
	{
		RemoveEffectTypes.DamageTypesToRemove.AddItem(HealType);
	}
	return RemoveEffectTypes;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////TLM ARMOR UPGRADES//////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
static function X2AbilityTemplate BundleofBladesBonusCharges()
{

	local X2AbilityTemplate					Template;
	local XMBEffect_AddAbilityCharges		Effect;

	Effect = new class'XMBEffect_AddAbilityCharges';
	Effect.AbilityNames.AddItem('SavHiddenBladeStab');
	Effect.BonusCharges = 3;
	
	// Create the template using a helper function
	Template = Passive('BundleofBladesBonusCharges', "img:///UILibrary_SavageItems.UIPerk_BundleOfKnives", true, Effect);

	return Template;
}

static function X2AbilityTemplate CeramicPlatingUpgradeBonus()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'CeramicPlatingUpgradeBonus');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to health stat Effect
	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, 1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, 1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, -1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, -10);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, -0.3f);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AlloyPlatingUpgradeBonus()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AlloyPlatingUpgradeBonus');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to health stat Effect
	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, 1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, 2);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, -1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, -5);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, -0.2f);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate MunitionsCarrierUpgradeBonus()
{
	local XMBEffect_AddItemCharges			BonusItemEffect;
	local X2AbilityTemplate					Template;
	local XMBEffect_AddAbilityCharges       Effect;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local name AllowedItemNames_MunitionsAModItems;
//	local name AllowedItemNames_MunitionsAModAbilities;
	// The effect isn't an X2Effect_Persistent, so we can't use it as the effect for Passive(). Let
	// Passive() create its own effect.
	Template = Passive('MunitionsCarrierUpgradeBonus', "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility", true);

	// Add the XMBEffect_AddItemCharges as an extra effect.
	BonusItemEffect = new class'XMBEffect_AddItemCharges';
	BonusItemEffect.PerItemBonus = 1;
	foreach default.AllowedItemArray_MunitionsAModItems(AllowedItemNames_MunitionsAModItems)
	{
		BonusItemEffect.ApplyToNames.AddItem(AllowedItemNames_MunitionsAModItems);
	}

	// Create an effect that will add a bonus charge to the Inspire Agility ability
	Effect = new class'XMBEffect_AddAbilityCharges';
	Effect.BonusCharges = 1;
	Effect.AbilityNames.AddItem('ThrowClaymore');
	Effect.AbilityNames.AddItem('ThrowShrapnel');
	Effect.AbilityNames.AddItem('ThrowPlasmaIED');
/*	foreach default.AllowedItemArray_MunitionsAModAbilities(AllowedItemNames_MunitionsAModAbilities)
	{
		Effect.AbilityNames.AddItem(AllowedItemNames_MunitionsAModAbilities);
	}*/

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, -1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, -10);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, -0.3f);

	AddSecondaryEffect(Template, PersistentStatChangeEffect);
	AddSecondaryEffect(Template, BonusItemEffect);
	AddSecondaryEffect(Template, Effect);

	return Template;
}

static function X2AbilityTemplate QuickLoadFreeload()
{
	local X2AbilityTemplate                 Template;
	local array<name>                       SkipExclusions;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2Effect_ImmediateAbilityActivation ReloadEffect;
	local X2Effect_GrantActionPoints		ActionPointEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'QuickLoadFreeload');

	// Activated by a button press; additionally, tells the AI this is an activatable
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	Template.AddShooterEffectExclusions(SkipExclusions);
//	WeaponCondition = new class'X2Condition_AbilitySourceWeapon';
//	WeaponCondition.WantsReload = true;
//	Template.AbilityShooterConditions.AddItem(WeaponCondition);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 3;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);
	
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = true;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	// Reload requires an action point, so grant one if the unit is out of action points
	ActionPointEffect = new class'X2Effect_GrantActionPoints';
	ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
	ActionPointEffect.NumActionPoints = 1;
	ActionPointEffect.bApplyOnlyWhenOut = false;
	AddSecondaryEffect(Template, ActionPointEffect);

	// Activate the default Reload ability
	ReloadEffect = new class'X2Effect_ImmediateAbilityActivation';
	ReloadEffect.EffectName = 'ImmediateFreeReload';
	ReloadEffect.AbilityName = 'Reload';
	ReloadEffect.AbilityName = 'ReloadLL';
	ReloadEffect.BuildPersistentEffect(1, false, true, , eGameRule_PlayerTurnBegin);
	AddSecondaryEffect(Template, ReloadEffect);

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_reload";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.RELOAD_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.bNoConfirmationWithHotKey = true;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;
	Template.DisplayTargetHitChance = false;

    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = MunitionsCarrierFreeload_BuildVisualization;

	return Template;
}

static function X2AbilityTemplate MediPackSatchel()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_AddUtilityItem			ItemEffect;

	Template = Passive('MediPackSatchel', "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility", true);
	
	ItemEffect = new class 'XMBEffect_AddUtilityItem';
	ItemEffect.DataName = 'Medipack';
	ItemEffect.bUseHighestAvailableUpgrade = false;	
	AddSecondaryEffect(Template, ItemEffect);
	
	return Template;
}

static function X2AbilityTemplate HEChargeSatchel()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_AddUtilityItem			ItemEffect;

	Template = Passive('HEChargeSatchel', "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility", true);
	
	ItemEffect = new class 'XMBEffect_AddUtilityItem';
	ItemEffect.DataName = 'HECharge';
	ItemEffect.bUseHighestAvailableUpgrade = false;	
	AddSecondaryEffect(Template, ItemEffect);
	
	return Template;
}

static function X2AbilityTemplate FireRetardantLayerAbility()
{
	local X2AbilityTemplate                 Template;
	local X2Effect_DamageImmunity           DamageImmunity;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'FireRetardantLayerAbility');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.ImmuneTypes.AddItem('Fire');
	DamageImmunity.BuildPersistentEffect(1, true, false, false);
	DamageImmunity.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	Template.AddTargetEffect(DamageImmunity);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate PathogenBarrierLayerAbility()
{
	local X2AbilityTemplate                 Template;
	local X2Effect_DamageImmunity           DamageImmunity;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PathogenBarrierLayerAbility');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.ImmuneTypes.AddItem('Poison');
	DamageImmunity.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.ParthenogenicPoisonType);
	DamageImmunity.BuildPersistentEffect(1, true, false, false);
	DamageImmunity.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	Template.AddTargetEffect(DamageImmunity);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate ChemicalBarrierLayerAbility()
{
	local X2AbilityTemplate                 Template;
	local X2Effect_DamageImmunity           DamageImmunity;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ChemicalBarrierLayerAbility');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.ImmuneTypes.AddItem('Acid');
	DamageImmunity.BuildPersistentEffect(1, true, false, false);
	DamageImmunity.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	Template.AddTargetEffect(DamageImmunity);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate MuleUpgradeAbility()
{
	local X2AbilityTemplate                 Template;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MuleUpgradeAbility');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	// Bonus to health stat Effect
	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	//PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, -1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, -5);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, -0.2f);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//DefaultEffectNames
defaultproperties
{
	SAVBunkerMobReductionEffectName="SAVBunkerMobReduction"
}