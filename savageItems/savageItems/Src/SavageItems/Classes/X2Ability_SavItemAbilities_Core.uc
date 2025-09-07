class X2Ability_SavItemAbilities_Core extends XMBAbility
	dependson (XComGameStateContext_Ability) config(GameCore);

var config array<name> AllowedAbilityArray_SerumOrange_NTE;
var config array<name> AllowedAbilityArray_SerumViolet_NTE;

var localized string SAVReactiveNanoArmorLocFriendlyName;
var localized string SAVReactiveNanoArmorLongDescription;

var localized string SavCombatStimBonusName;
var localized string SavCombatStimBonusDesc;

var config const int MEDIPACK_STABILIZE_AMMO;
var config const int MEDIPACK_PERUSEHP;
//var config array<name> MedipackHealEffectTypes;      //  Medikits and gremlin healing abilities use this array of damage types to remove persistent effects.

var config int SAVREGEN_REGEN_AMOUNT;
var config int SAVREGEN_MAX_REGEN_AMOUNT;
//var config array<name> SavSprayHealEffectTypes;

var config int SAVREGEN2_REGEN_AMOUNT;

var config int SAVREGEN_NANOREGEN_AMOUNT;

var config int REFLEXABILITY_INITIAL_CHARGES;
var config int REFLEXIVEACTION_INITIAL_CHARGES;

var config int SAVTELEPORT_WILL_MOD;

var config float TRANQUILITY_DISTANCE;
var config int SAVREGEN_TRANQUILITY_AMOUNT;
var config float TRANQUILITYPSIDRAIN_SCALAR;

var const config float SAVTELEPORT_IN_DELAY;

var config float REACTIVENANOAMOD_DODGE_SCALAR;
var config float REACTIVENANOAMOD_MOB_SCALAR;

var config int SAVSTIMSPERMENANTWILLOSS;
var config int SAVSTIMSMOBILITYBONUS;
var config int SAVSTIMSCRITBONUS;

var config int SAVADVSTIMSPERMENANTWILLOSS;
var config int SAVADVSTIMSMOBILITYBONUS;
var config int SAVADVSTIMSCRITBONUS;

var config int MINDCRUSH_RANGE;
var config int MINDCRUSH_RADIUS;

var config int RATIONBAR_REGEN_AMOUNT;
var config int RATIONBAR_MAX_REGEN_AMOUNT;
var config int RATIONBAR_EFFECTS_DURATION;

var config int COREBAR_EFFECTS_DURATION;
var config int COREBAR_MAX_REGEN_AMOUNT;

var config int BUSHMEAT_EFFECTS_DURATION;
var config int BUSHMEAT_MAX_REGEN_AMOUNT;

var config int PSIKOTICSCREAM_TILE_WIDTH;

var config int CHAINBREAKERLOCALANDGLOBALCOOLDOWN;

var config int PASSIVECONSUMPTION1_APPLY_CHANCE;
var config int PASSIVECONSUMPTION2_APPLY_CHANCE;

var config int PLASMAIEDCONSUMPTION_APPLY_CHANCE;
var config int PLASMAIEDABILITYRANGE;

var localized string NanoClonerUnconsciousFriendlyName;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(AddMedipackHeal('MedipackHeal', default.MEDIPACK_PERUSEHP));
	Templates.AddItem(AddMedipackStabilize());
	Templates.AddItem(AddRepairKitRepair('RepairKitRepair'));
	Templates.AddItem(AddRepairKitRepair2('RepairKitRepair2'));
	Templates.AddItem(SavRegenSpray());
	Templates.AddItem(SavRegenSpray2());
	Templates.AddItem(SavNanoRegenSpray());
	Templates.AddItem(SavStimulate());
	Templates.AddItem(CreateAModGrapple());
	Templates.AddItem(CreateSavTeleportCharges());
	Templates.AddItem(TeleportWillLoss());
	Templates.AddItem(SavTeleportAModAnimset());
	Templates.AddItem(CreateSavTeleportAbility());
	Templates.AddItem(SavReflexAccuracy());
	Templates.AddItem(SavReflexInterrupt());
	Templates.AddItem(SavReflexInterruptInput());
	Templates.AddItem(SavReflexiveAction());
	Templates.AddItem(SavReflexCharges());
	Templates.AddItem(SavTranquility());
	Templates.AddItem(SavTranquilityClense());
	Templates.AddItem(SavTranquilityPsiDrain());
	Templates.AddItem(CreateSavHiddenBladeStab());
	Templates.AddItem(CreateSavHiddenBladeKill());
	Templates.AddItem(SAVHiddenBladesConcealment());
	Templates.AddItem(SAVNanoIntruderHackBonus());
	Templates.AddItem(SAVNanoIntruderCharges());
	Templates.AddItem(SAVNanomachineCoating());
	Templates.AddItem(SAVReactiveNanoArmor());
	Templates.AddItem(SavAdministerStims());
	Templates.AddItem(SavAdministerAdvStims());
	Templates.AddItem(SavODSerumAdaptation());
	Templates.AddItem(SavSerumRedExposure());
	Templates.AddItem(SavAdministerSerumRed());
	Templates.AddItem(SavSerumBlueExposure());
	Templates.AddItem(SavAdministerSerumBlue());
	Templates.AddItem(SavSerumYellowExposure());
	Templates.AddItem(SavAdministerSerumYellow());
	Templates.AddItem(SavSerumVioletExposure());
	Templates.AddItem(SavAdministerSerumViolet());
	Templates.AddItem(SAVMindCrush());
	Templates.AddItem(SavSerumOrangeExposure());
	Templates.AddItem(SavAdministerSerumOrange());
	Templates.AddItem(SavSerumGreenExposure());
	Templates.AddItem(SAVSerumGreenAcidBlood());
	Templates.AddItem(SavAdministerSerumGreen());
	Templates.AddItem(SAVSerumGreenPoisonSpit());
	Templates.AddItem(SavEatRations());
	Templates.AddItem(SavEatCOREBar());
	Templates.AddItem(SavEatReaperBushMeat());
	Templates.AddItem(SavCombatDrug_Raptor());
	Templates.AddItem(SavCombatDrug_Turbo());
	Templates.AddItem(SavCombatDrug_Klarity());
	Templates.AddItem(SavKlarityClense());
	Templates.AddItem(CreateSAVInjectRedHaze());
	Templates.AddItem(CreateSAVRedHazeGetMad());
	Templates.AddItem(CreateSAVInjectPsiko());
	Templates.AddItem(CreateSAVPsikotik());
	Templates.AddItem(CreateSAVPsikotikScream());
	Templates.AddItem(CreateSAVInjectListon());
	Templates.AddItem(CreateSavListonSmash());
	Templates.AddItem(CreateSAVListonSupply());
	Templates.AddItem(CreateSAVRedHazeSupply());
	Templates.AddItem(CreateSAVPsikoSupply());
	Templates.AddItem(CreateSAVTurboSupply());
	Templates.AddItem(CreateSAVRaptorSupply());
	Templates.AddItem(CreateSAVKlaritySupply());
	Templates.AddItem(SavItemsPassiveConsumption1());
	Templates.AddItem(SavItemsPassiveConsumption2());
	Templates.AddItem(SavItemsBushMeatConsumption());
	Templates.AddItem(ThrowPlasmaIED('ThrowPlasmaIED'));
	Templates.AddItem(CreateSAVPlasmaIEDSupply());
	Templates.AddItem(SAVReaperRemoteDetonator());
	Templates.AddItem(CreateFireNanoCloner());
	Templates.AddItem(CreateNanoClonerUnitInitialize());
	Templates.AddItem(NanophagePunch());
	Templates.AddItem(SavAdrenalAmp());
	Templates.AddItem(SavSymbolofResistance());
	Templates.AddItem(SavForeverFree());
	Templates.AddItem(SavUploadChainbreakerVirus());
	Templates.AddItem(CreateSAVEngageMindrazor());
	Templates.AddItem(CreateSAVMindrazorAmplify());
	Templates.AddItem(SAVMindrazorAmpWillDrain());
	Templates.AddItem(SAVAutoStigmata());

	return Templates;
}

static function X2AbilityTemplate AddMedipackHeal(name AbilityName, int HealAmount)
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityPassiveAOE_SelfRadius	PassiveAOEStyle;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2Effect_ApplyMedikitHeal         MedikitHeal;
	local X2Effect_RemoveEffectsByDamageType RemoveEffects;
	local array<name>                       SkipExclusions;
//	local name                              HealType;

	`CREATE_X2ABILITY_TEMPLATE(Template, AbilityName);

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	SingleTarget.bIncludeSelf = true;
	SingleTarget.bShowAOE = true;
	Template.AbilityTargetStyle = SingleTarget;

	PassiveAOEStyle = new class'X2AbilityPassiveAOE_SelfRadius';
	PassiveAOEStyle.OnlyIncludeTargetsInsideWeaponRange = true;
	Template.AbilityPassiveAOEStyle = PassiveAOEStyle;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	MedikitHeal = new class'X2Effect_ApplyMedikitHeal';
	MedikitHeal.PerUseHP = HealAmount;
	Template.AddTargetEffect(MedikitHeal);

	RemoveEffects = new class'X2Effect_RemoveEffectsByDamageType';
	RemoveEffects.DamageTypesToRemove.AddItem('poison');
	RemoveEffects.DamageTypesToRemove.AddItem(class'X2Effect_ParthenogenicPoison'.default.ParthenogenicPoisonType);
	RemoveEffects.DamageTypesToRemove.AddItem('Bleeding');
	Template.AddTargetEffect( RemoveEffects );

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_medkit";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY;
	Template.bUseAmmoAsChargesForHUD = true;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	Template.ActivationSpeech = 'HealingAlly';

	Template.CustomSelfFireAnim = 'FF_FireMedkitSelf';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate AddMedipackStabilize()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2Effect_RemoveEffects            RemoveEffects;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MedipackStabilize');

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = default.MEDIPACK_STABILIZE_AMMO;
	AmmoCost.bReturnChargesError = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	Template.AbilityTargetStyle = SingleTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	Template.AddShooterEffectExclusions();

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = false;
	UnitPropertyCondition.ExcludeAlive = false;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.IsBleedingOut = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2StatusEffects'.default.BleedingOutName);
	Template.AddTargetEffect(RemoveEffects);
	Template.AddTargetEffect(class'X2StatusEffects'.static.CreateUnconsciousStatusEffect(, true));

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_stabilize";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.STABILIZE_PRIORITY;
	Template.bUseAmmoAsChargesForHUD = true;
	Template.iAmmoAsChargesDivisor = default.MEDIPACK_STABILIZE_AMMO;
	Template.Hostility = eHostility_Defensive;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;

	Template.ActivationSpeech = 'StabilizingAlly';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate AddRepairKitRepair (name AbilityName)
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityPassiveAOE_SelfRadius	PassiveAOEStyle;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2Effect_ApplyRepairKitHeal		HealEffect; //X2Effect_ApplyRepairKitHeal
	local X2Effect_ApplyRepairKitSHLD		RemoveEffects;
//	local X2Effect_RemoveEffectsByDamageType RemoveEffects;
	local array<name>                       SkipExclusions;
//	local name                              HealType;
	local X2Effect_RKitRepairArmor			ArmorEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, AbilityName);

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	SingleTarget.bIncludeSelf = false;
	SingleTarget.bShowAOE = true;
	Template.AbilityTargetStyle = SingleTarget;

	PassiveAOEStyle = new class'X2AbilityPassiveAOE_SelfRadius';
	PassiveAOEStyle.OnlyIncludeTargetsInsideWeaponRange = true;
	Template.AbilityPassiveAOEStyle = PassiveAOEStyle;

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

	HealEffect = new class'X2Effect_ApplyRepairKitHeal';
	HealEffect.PerUseHP = 4;
//	HealEffect.IncreasedHealAbility = 'HeavyRepair';
//	HealEffect.IncreasedPerUseHP = default.HEAVYDUTY_EXTRAHEAL;
	Template.AddTargetEffect(HealEffect);

	ArmorEffect = new class'X2Effect_RKitRepairArmor';
	Template.AddTargetEffect(ArmorEffect);

	RemoveEffects = new class'X2Effect_ApplyRepairKitSHLD';
	RemoveEffects.DamageTypesToRemove.AddItem('Acid');
	RemoveEffects.DamageTypesToRemove.AddItem('Mental');
	RemoveEffects.DamageTypesToRemove.AddItem('Stun');
	RemoveEffects.DamageTypesToRemove.AddItem('Disorient');
	Template.AddTargetEffect(RemoveEffects);
	
	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.IconImage = "img:///gfxXComIcons.Repair";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY;
	Template.bUseAmmoAsChargesForHUD = true;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	Template.ActivationSpeech = 'HealingAlly';

	Template.CustomSelfFireAnim = 'FF_FireMedkitSelf';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate AddRepairKitRepair2 (name AbilityName)
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityPassiveAOE_SelfRadius	PassiveAOEStyle;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2Effect_ApplyRepairKitHeal		HealEffect; //X2Effect_ApplyRepairKitHeal
	local X2Effect_ApplyRepairKitSHLD		RemoveEffects;
//	local X2Effect_RemoveEffectsByDamageType RemoveEffects;
	local array<name>                       SkipExclusions;
//	local name                              HealType;
	local X2Effect_RKitRepairArmor			ArmorEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, AbilityName);

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	SingleTarget.bIncludeSelf = false;
	SingleTarget.bShowAOE = true;
	Template.AbilityTargetStyle = SingleTarget;

	PassiveAOEStyle = new class'X2AbilityPassiveAOE_SelfRadius';
	PassiveAOEStyle.OnlyIncludeTargetsInsideWeaponRange = true;
	Template.AbilityPassiveAOEStyle = PassiveAOEStyle;

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
	
	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.IconImage = "img:///gfxXComIcons.Repair";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY;
	Template.bUseAmmoAsChargesForHUD = true;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	Template.ActivationSpeech = 'HealingAlly';

	Template.CustomSelfFireAnim = 'FF_FireMedkitSelf';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate SavRegenSpray()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityPassiveAOE_SelfRadius	PassiveAOEStyle;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Effect_Regeneration				RegenerationEffect;
	local X2Effect_RemoveEffectsByDamageType RemoveEffects;
	local XMBEffect_ConditionalBonus		RegenDummyEffect;
	local array<name>                       SkipExclusions;
//	local name                              HealType;


	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavRegenSpray');

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	SingleTarget.bIncludeSelf = true;
	SingleTarget.bShowAOE = true;
	Template.AbilityTargetStyle = SingleTarget;

	PassiveAOEStyle = new class'X2AbilityPassiveAOE_SelfRadius';
	PassiveAOEStyle.OnlyIncludeTargetsInsideWeaponRange = true;
	Template.AbilityPassiveAOEStyle = PassiveAOEStyle;

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

	RegenerationEffect = new class'X2Effect_Regeneration';
	RegenerationEffect.BuildPersistentEffect(5, false, true, false, eGameRule_PlayerTurnEnd);
	RegenerationEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	RegenerationEffect.HealAmount = default.SAVREGEN_REGEN_AMOUNT;
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

	RegenDummyEffect = class'X2Effect_RegenDummy'.static.CreateRegenDummyEffect();
	Template.AddTargetEffect(RegenDummyEffect);// Just spawns in icon and description and some FX hooks
	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Ability_RegenSpray";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY;
	Template.bUseAmmoAsChargesForHUD = true;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	Template.ActivationSpeech = 'HealingAlly';

	Template.CustomSelfFireAnim = 'FF_FireMedkitSelf';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate SavRegenSpray2()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityPassiveAOE_SelfRadius	PassiveAOEStyle;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Effect_Regeneration				RegenerationEffect;
	local X2Effect_RemoveEffectsByDamageType RemoveEffects;
	local XMBEffect_ConditionalBonus		RegenDummyEffect;
	local X2Effect_ApplyRepairKitHeal		HealEffect; 
	local array<name>                       SkipExclusions;
//	local name                              HealType;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavRegenSpray2');

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	SingleTarget.bIncludeSelf = true;
	SingleTarget.bShowAOE = true;
	Template.AbilityTargetStyle = SingleTarget;

	PassiveAOEStyle = new class'X2AbilityPassiveAOE_SelfRadius';
	PassiveAOEStyle.OnlyIncludeTargetsInsideWeaponRange = true;
	Template.AbilityPassiveAOEStyle = PassiveAOEStyle;

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

	RegenerationEffect = new class'X2Effect_Regeneration';
	RegenerationEffect.BuildPersistentEffect(6, false, true, false, eGameRule_PlayerTurnEnd);
	RegenerationEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	RegenerationEffect.HealAmount = default.SAVREGEN2_REGEN_AMOUNT;
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
	Template.bUseAmmoAsChargesForHUD = true;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	Template.ActivationSpeech = 'HealingAlly';

	Template.CustomSelfFireAnim = 'FF_FireMedkitSelf';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate SavNanoRegenSpray()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityPassiveAOE_SelfRadius	PassiveAOEStyle;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Effect_Regeneration				RegenerationEffect;
	local X2Effect_RemoveEffectsByDamageType RemoveEffects;
	local XMBEffect_ConditionalBonus		RegenDummyEffect;
	local X2Effect_ApplyRepairKitHeal		HealEffect; 
	local array<name>                       SkipExclusions;
//	local name                              HealType;
	local X2Effect_RKitRepairArmor			ArmorEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavNanoRegenSpray');

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	SingleTarget.bIncludeSelf = true;
	SingleTarget.bShowAOE = true;
	Template.AbilityTargetStyle = SingleTarget;

	PassiveAOEStyle = new class'X2AbilityPassiveAOE_SelfRadius';
	PassiveAOEStyle.OnlyIncludeTargetsInsideWeaponRange = true;
	Template.AbilityPassiveAOEStyle = PassiveAOEStyle;

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
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	ArmorEffect = new class'X2Effect_RKitRepairArmor';
	Template.AddTargetEffect(ArmorEffect);

	RegenerationEffect = new class'X2Effect_Regeneration';
	RegenerationEffect.BuildPersistentEffect(5, false, true, false, eGameRule_PlayerTurnEnd);
	RegenerationEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	RegenerationEffect.HealAmount = default.SAVREGEN_NANOREGEN_AMOUNT;
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
	Template.AddTargetEffect( RemoveEffects );

	RegenDummyEffect = class'X2Effect_NaniteRegenDummy'.static.CreateNaniteRegenDummyEffect();
	Template.AddTargetEffect(RegenDummyEffect);// Just spawns in icon and description and some FX hooks
	
	HealEffect = new class'X2Effect_ApplyRepairKitHeal';
	HealEffect.PerUseHP = 4;
	Template.AddTargetEffect(HealEffect);

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Ability_RegenSpray";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY;
	Template.bUseAmmoAsChargesForHUD = true;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	Template.ActivationSpeech = 'HealingAlly';

	Template.CustomSelfFireAnim = 'FF_FireMedkitSelf';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate SavStimulate()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityTarget_Single				SingleTarget;
	local X2AbilityPassiveAOE_SelfRadius		PassiveAOEStyle;
	local X2Effect_RemoveEffectsByDamageType	RemoveEffects;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavStimulate');

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	SingleTarget.bIncludeSelf = true;
	SingleTarget.bShowAOE = true;
	Template.AbilityTargetStyle = SingleTarget;

	PassiveAOEStyle = new class'X2AbilityPassiveAOE_SelfRadius';
	PassiveAOEStyle.OnlyIncludeTargetsInsideWeaponRange = true;
	Template.AbilityPassiveAOEStyle = PassiveAOEStyle;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	// Targeting Details
	// Can only shoot visible enemies
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	// Can't target dead; Can't target friendlies -- must be enemy organic
	Template.AbilityTargetConditions.AddItem(new class'X2Condition_RevivalProtocol');

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
	Template.bUseAmmoAsChargesForHUD = true;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	Template.ActivationSpeech = 'HealingAlly';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate CreateAModGrapple()
{
	local X2AbilityTemplate Template;
	local X2AbilityCooldown Cooldown;

	Template = class'X2Ability_DefaultAbilitySet'.static.AddGrapple('AModGrapple');

	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_grapple";
	Template.AbilityCosts.Length = 0;

	// Action Point
	Template.AbilityCosts.AddItem(default.FreeActionCost);

	// Cooldown
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 2;
	Template.AbilityCooldown = Cooldown;

	Template.bShowActivation = true;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate CreateSavTeleportCharges()
{
	local XMBEffect_AddAbilityCharges Effect;

	// Create an effect that will add a bonus charge to the Inspire Agility ability
	Effect = new class'XMBEffect_AddAbilityCharges';
	Effect.AbilityNames.AddItem('SavTeleportAbility');
	Effect.BonusCharges = 1;
	Effect.MaxCharges = 4;

	// Create a triggered ability that activates when the unit gets a kill
	return SelfTargetTrigger('SavTeleportCharges', "img:///UILibrary_PerkIcons.UIPerk_codex_teleport", false, Effect, 'PlayerTurnEnded', eFilter_Player);
}

static function X2AbilityTemplate SavTeleportAModAnimset()
{
    local X2AbilityTemplate                 Template;
    local X2Effect_AdditionalAnimSets        AnimSets;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'SavTeleportAModAnimset');

    Template.AbilitySourceName = 'eAbilitySource_Item';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.Hostility = eHostility_Neutral;
    Template.bDisplayInUITacticalText = false;
    
    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
    AnimSets = new class'X2Effect_AdditionalAnimSets';
    AnimSets.EffectName = 'PoweredMeleeAModAnimset';
	AnimSets.AddAnimSetWithPath("AnimSet'SavTeleport_ANIM.Anims.AS_SoldierTeleport'");
    AnimSets.BuildPersistentEffect(1, true, false, false, eGameRule_TacticalGameStart);
    AnimSets.DuplicateResponse = eDupe_Ignore;
    Template.AddTargetEffect(AnimSets);
    
    Template.bSkipFireAction = true;
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    return Template;
}

static function X2AbilityTemplate TeleportWillLoss()
{
//	local X2Effect_Persistent	Effect;
//	local X2Effect_SavWillLoss  Effect;
	local X2AbilityTemplate Template;
	local XMBCondition_AbilityName AbilityNameCondition;
//	local XMBCondition_AbilityProperty Condition;

//	Effect = new class'X2Effect_Persistent';	
//	Effect = new class'X2Effect_SavWillLoss';
//	Effect.EffectName = 'TeleportSickness';
//	Effect.WillMod = default.SAVTELEPORT_WILL_MOD;
//	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin);
//	Effect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, , , Template.AbilitySourceName);
//	Effect.DuplicateResponse = eDupe_Allow;
	
	Template = SelfTargetTrigger('TeleportWillLoss', "img:///UILibrary_XPACK_Common.PerkIcons.str_taxing", false, , 'AbilityActivated');//Effect , eFilter_Unit

	AbilityNameCondition = new class'XMBCondition_AbilityName';
	AbilityNameCondition.IncludeAbilityNames.AddItem('SavTeleportAbility');

//	Condition = new class'XMBCondition_AbilityProperty';
//	Condition.bRequireActivated = true;
	
//	AddTriggerTargetCondition(Template, Condition);
	AddTriggerTargetCondition(Template, AbilityNameCondition);
//	Template.AbilityTargetConditions.AddItem(AbilityNameCondition);

//	Template.PostActivationEvents.AddItem('ReflexActionActivated');// NOTE THIS IS WHAT THE WILL LOSS EVENT TRIGGERS ARE LISTENING FOR
	Template.PostActivationEvents.AddItem('SavTeleportEvent');// NOTE THIS IS WHAT THE WILL LOSS EVENT TRIGGERS ARE LISTENING FOR
	return Template;
}

static function X2DataTemplate CreateSavTeleportAbility()
{
	local X2AbilityTemplate 			Template;
	local X2AbilityCost_Charges 		ChargeCost;
	local X2AbilityCost_ActionPoints 	ActionPointCost;
	local X2AbilityTarget_Cursor 		CursorTarget;
	local X2AbilityMultiTarget_Radius 	RadiusMultiTarget;
	local X2AbilityTrigger_PlayerInput 	InputTrigger;
	local X2Condition_UnitStatCheck		UnitStatCheckCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavTeleportAbility');

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_codex_teleport";

	Template.AbilityCosts.AddItem(default.FreeActionCost);

	Template.AbilityCharges = new class'X2AbilityCharges';
	Template.AbilityCharges.InitialCharges = 1;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 2;
	Template.AbilityCosts.AddItem(ChargeCost);

	ActionPointCost = new class 'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = true;
	Template.Hostility = eHostility_Neutral;

	Template.TargetingMethod = class'X2TargetingMethod_Teleport';

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.AbilityToHitCalc = default.DeadEye;

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToSquadsightRange = true;
	CursorTarget.FixedAbilityRange = 26;//39 if its in meters (test it)
	Template.AbilityTargetStyle = CursorTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = 0.25; // small amount so it just grabs one tile
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	UnitStatCheckCondition = new class'X2Condition_UnitStatCheck';
	UnitStatCheckCondition.AddCheckStat(eStat_Will, 6, eCheck_GreaterThan);
	Template.AbilityShooterConditions.AddItem(UnitStatCheckCondition);

	// Shooter Conditions
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	//// Damage Effect
	Template.AbilityMultiTargetConditions.AddItem(default.LivingTargetUnitOnlyProperty);
	//TeleportDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	//TeleportDamageEffect.EffectDamageValue = class'X2Item_DefaultWeapons'.default.CYBERUS_TELEPORT_BASEDAMAGE;
	//TeleportDamageEffect.EnvironmentalDamageAmount = default.TELEPORT_ENVIRONMENT_DAMAGE_AMOUNT;
	//TeleportDamageEffect.EffectDamageValue.DamageType = 'Melee';
	//Template.AddMultiTargetEffect(TeleportDamageEffect);
	Template.PostActivationEvents.AddItem('SavTeleportEvent');
	
	Template.ModifyNewContextFn = Teleport_ModifyActivatedAbilityContext;
	Template.BuildNewGameStateFn = Teleport_BuildGameState;
	Template.BuildVisualizationFn = Teleport_BuildVisualization;
	Template.CinescriptCameraType = "Cyberus_Teleport";
	Template.bShowActivation = true;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	return Template;
}

static simulated function Teleport_ModifyActivatedAbilityContext(XComGameStateContext Context)
{
	local XComGameState_Unit UnitState;
	local XComGameStateContext_Ability AbilityContext;
	local XComGameStateHistory History;
	local PathPoint NextPoint, EmptyPoint;
	local PathingInputData InputData;
	local XComWorldData World;
	local vector NewLocation;
	local TTile NewTileLocation;

	History = `XCOMHISTORY;
	World = `XWORLD;

	AbilityContext = XComGameStateContext_Ability(Context);
	`assert(AbilityContext.InputContext.TargetLocations.Length > 0);
	
	UnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));

	// Build the MovementData for the path
	// First posiiton is the current location
	InputData.MovementTiles.AddItem(UnitState.TileLocation);

	NextPoint.Position = World.GetPositionFromTileCoordinates(UnitState.TileLocation);
	NextPoint.Traversal = eTraversal_Teleport;
	NextPoint.PathTileIndex = 0;
	InputData.MovementData.AddItem(NextPoint);

	// Second posiiton is the cursor position
	`assert(AbilityContext.InputContext.TargetLocations.Length == 1);

	NewLocation = AbilityContext.InputContext.TargetLocations[0];
	NewTileLocation = World.GetTileCoordinatesFromPosition(NewLocation);
	NewLocation = World.GetPositionFromTileCoordinates(NewTileLocation);

	NextPoint = EmptyPoint;
	NextPoint.Position = NewLocation;
	NextPoint.Traversal = eTraversal_Landing;
	NextPoint.PathTileIndex = 1;
	InputData.MovementData.AddItem(NextPoint);
	InputData.MovementTiles.AddItem(NewTileLocation);

    //Now add the path to the input context
	InputData.MovingUnitRef = UnitState.GetReference();
	AbilityContext.InputContext.MovementPaths.AddItem(InputData);
}

static simulated function XComGameState Teleport_BuildGameState(XComGameStateContext Context)
{
	local XComGameState NewGameState;
	local XComGameState_Unit UnitState;
	local XComGameStateContext_Ability AbilityContext;
	local vector NewLocation;
	local TTile NewTileLocation;
	local XComWorldData World;
	local X2EventManager EventManager;
	local int LastElementIndex;

	World = `XWORLD;
	EventManager = `XEVENTMGR;

	//Build the new game state frame
	NewGameState = TypicalAbility_BuildGameState(Context);

	AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());	
	UnitState = XComGameState_Unit(NewGameState.CreateStateObject(class'XComGameState_Unit', AbilityContext.InputContext.SourceObject.ObjectID));

	LastElementIndex = AbilityContext.InputContext.MovementPaths[0].MovementData.Length - 1;

	// Set the unit's new location
	// The last position in MovementData will be the end location
	`assert(LastElementIndex > 0);
	NewLocation = AbilityContext.InputContext.MovementPaths[0].MovementData[LastElementIndex].Position;
	NewTileLocation = World.GetTileCoordinatesFromPosition(NewLocation);
	UnitState.SetVisibilityLocation(NewTileLocation);

	NewGameState.AddStateObject(UnitState);

	AbilityContext.ResultContext.bPathCausesDestruction = MoveAbility_StepCausesDestruction(UnitState, AbilityContext.InputContext, 0, AbilityContext.InputContext.MovementPaths[0].MovementTiles.Length - 1);
	MoveAbility_AddTileStateObjects(NewGameState, UnitState, AbilityContext.InputContext, 0, AbilityContext.InputContext.MovementPaths[0].MovementTiles.Length - 1);

	EventManager.TriggerEvent('ObjectMoved', UnitState, UnitState, NewGameState);
	EventManager.TriggerEvent('UnitMoveFinished', UnitState, UnitState, NewGameState);

	//Return the game state we have created
	return NewGameState;
}

simulated function Teleport_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  AbilityContext;
	local StateObjectReference InteractingUnitRef;
	local X2AbilityTemplate AbilityTemplate;
	local VisualizationActionMetadata EmptyTrack, BuildTrack;
	local X2Action_PlaySoundAndFlyOver SoundAndFlyover;
	local int i, j;
	local XComGameState_WorldEffectTileData WorldDataUpdate;
	local X2Action_MoveTurn MoveTurnAction;
	local X2VisualizerInterface TargetVisualizerInterface;
	local X2Action_PlayAnimation PlayAnimationAction, PlayAnimationAction2;
	local X2Action_Delay DelayAction;

	History = `XCOMHISTORY;
	AbilityContext = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = AbilityContext.InputContext.SourceObject;

	AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(AbilityContext.InputContext.AbilityTemplateName);

	//****************************************************************************************
	//Configure the visualization track for the source
	//****************************************************************************************
	BuildTrack = EmptyTrack;
	BuildTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	BuildTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	BuildTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyover'.static.AddToVisualizationTree(BuildTrack, AbilityContext));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, AbilityTemplate.LocFlyOverText, '', eColor_Good);

	// Turn to face the target action. The target location is the center of the ability's radius, stored in the 0 index of the TargetLocations
	MoveTurnAction = X2Action_MoveTurn(class'X2Action_MoveTurn'.static.AddToVisualizationTree(BuildTrack, AbilityContext));
	MoveTurnAction.m_vFacePoint = AbilityContext.InputContext.TargetLocations[0];

	PlayAnimationAction = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(BuildTrack, AbilityContext, false, BuildTrack.LastActionAdded));
	PlayAnimationAction.Params.AnimName = 'HL_SavTeleport_Start';

	DelayAction = X2Action_Delay(class'X2Action_Delay'.static.AddToVisualizationTree(BuildTrack, AbilityContext, false, BuildTrack.LastActionAdded));
	DelayAction.Duration = 0.2; // short pause to see the flyover

	// move action
	class'X2VisualizerHelpers'.static.ParsePath(AbilityContext, BuildTrack);

	PlayAnimationAction2 = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(BuildTrack, AbilityContext, false, BuildTrack.LastActionAdded));
	PlayAnimationAction2.Params.AnimName = 'LL_SavTeleport_End';
		
	//****************************************************************************************

	foreach VisualizeGameState.IterateByClassType(class'XComGameState_WorldEffectTileData', WorldDataUpdate)
	{
		BuildTrack = EmptyTrack;
		BuildTrack.VisualizeActor = none;
		BuildTrack.StateObject_NewState = WorldDataUpdate;
		BuildTrack.StateObject_OldState = WorldDataUpdate;

		for (i = 0; i < AbilityTemplate.AbilityTargetEffects.Length; ++i)
		{
			AbilityTemplate.AbilityTargetEffects[i].AddX2ActionsForVisualization(VisualizeGameState, BuildTrack, AbilityContext.FindTargetEffectApplyResult(AbilityTemplate.AbilityTargetEffects[i]));
		}

		//OutVisualizationTracks.AddItem(BuildTrack);
	}

	//****************************************************************************************
	//Configure the visualization track for the targets
	//****************************************************************************************
	for( i = 0; i < AbilityContext.InputContext.MultiTargets.Length; ++i )
	{
		InteractingUnitRef = AbilityContext.InputContext.MultiTargets[i];
		BuildTrack = EmptyTrack;
		BuildTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
		BuildTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
		BuildTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

		class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(BuildTrack, AbilityContext);
		for( j = 0; j < AbilityContext.ResultContext.MultiTargetEffectResults[i].Effects.Length; ++j )
		{
			AbilityContext.ResultContext.MultiTargetEffectResults[i].Effects[j].AddX2ActionsForVisualization(VisualizeGameState, BuildTrack, AbilityContext.ResultContext.MultiTargetEffectResults[i].ApplyResults[j]);
		}

		TargetVisualizerInterface = X2VisualizerInterface(BuildTrack.VisualizeActor);
		if( TargetVisualizerInterface != none )
		{
			//Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
			TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, BuildTrack);
		}

		//if (BuildTrack.TrackActions.Length > 0)
		//{
			//OutVisualizationTracks.AddItem(BuildTrack);
		//}
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ReflexAmod abilities

static function X2AbilityTemplate SavReflexAccuracy()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalBonus		Effect;
	local XMBCondition_AbilityProperty		Condition;

	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.bExcludeMelee = false;
	Condition.bRequireActivated = false;

//	Reaction fire aim bonus for automatic weapons
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitModifier(20, eHit_Success);
	Effect.AbilityTargetConditions.AddItem(default.ReactionFireCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);
			
	Template = Passive('SavReflexAccuracy', "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility", true, Effect);

	return Template;
}

static function X2AbilityTemplate SavReflexInterrupt()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ReserveActionPoints ReserveActionPointCost;
	local X2Condition_UnitProperty          ShooterCondition;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityTrigger_EventListener	Trigger;
	local X2Condition_Visibility			TargetVisibilityCondition;
	local array<name>                       SkipExclusions;
	local X2Effect_SkirmisherInterrupt		InterruptEffect;
	local X2Condition_UnitEffects			EffectCondition;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavReflexInterrupt');

	Template.AdditionalAbilities.AddItem('SavReflexInterruptInput');
	Template.bUniqueSource = true;

	ReserveActionPointCost = new class'X2AbilityCost_ReserveActionPoints';
	ReserveActionPointCost.iNumPoints = 1;
	ReserveActionPointCost.AllowedTypes.AddItem('ReserveInterrupt');
	Template.AbilityCosts.AddItem(ReserveActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);

	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bRequireBasicVisibility = true;
	TargetVisibilityCondition.bDisablePeeksOnMovement = true; //Don't use peek tiles for over watch shots	
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

	Template.AbilityTargetConditions.AddItem(new class'X2Condition_EverVigilant');
	Template.AbilityTargetConditions.AddItem(class'X2Ability_DefaultAbilitySet'.static.OverwatchTargetEffectsCondition());

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	ShooterCondition = new class'X2Condition_UnitProperty';
	ShooterCondition.ExcludeConcealed = true;
	Template.AbilityShooterConditions.AddItem(ShooterCondition);

	EffectCondition = new class'X2Condition_UnitEffects';
	EffectCondition.AddExcludeEffect(class'X2Effect_SkirmisherInterrupt'.default.EffectName, 'AA_UnitIsImmune');
	Template.AbilityShooterConditions.AddItem(EffectCondition);

	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	Template.AbilityTargetStyle = SingleTarget;

	//Trigger on movement - interrupt the move
	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.EventID = 'ObjectMoved';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.Filter = eFilter_None;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.SkirmisherInterruptListener;
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Interrupt";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.OVERWATCH_PRIORITY;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;
	Template.DisplayTargetHitChance = false;

	InterruptEffect = new class'X2Effect_SkirmisherInterrupt';
	InterruptEffect.BuildPersistentEffect(1, false, , , eGameRule_PlayerTurnBegin);
	Template.AddShooterEffect(InterruptEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;
	Template.bShowActivation = true;
//BEGIN AUTOGENERATED CODE: Template Overrides 'SkirmisherInterrupt'
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.ActivationSpeech = 'Interrupt';
//END AUTOGENERATED CODE: Template Overrides 'SkirmisherInterrupt'

	return Template;
}

static function X2AbilityTemplate SavReflexInterruptInput()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Effect_ReserveOverwatchPoints   ReserveActionPointsEffect;
	local array<name>                       SkipExclusions;
	local X2Condition_UnitProperty          ConcealedCondition;
	local X2Effect_SetUnitValue             UnitValueEffect;
	local X2Condition_UnitEffects           SuppressedCondition;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2Condition_UnitStatCheck			UnitStatCheckCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavReflexInterruptInput');

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = default.REFLEXABILITY_INITIAL_CHARGES;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 2;
	ChargeCost.SharedAbilityCharges.AddItem('SavReflexiveAction');
	Template.AbilityCosts.AddItem(ChargeCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.bConsumeAllPoints = true;   //  this will guarantee the unit has at least 1 action point
	ActionPointCost.bFreeCost = true;           //  ReserveActionPoints effect will take all action points away
	ActionPointCost.DoNotConsumeAllEffects.Length = 0;
	ActionPointCost.DoNotConsumeAllSoldierAbilities.Length = 0;
	ActionPointCost.AllowedTypes.RemoveItem(class'X2CharacterTemplateManager'.default.SkirmisherInterruptActionPoint);
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	SuppressedCondition = new class'X2Condition_UnitEffects';
	SuppressedCondition.AddExcludeEffect(class'X2Effect_Suppression'.default.EffectName, 'AA_UnitIsSuppressed');
	SuppressedCondition.AddExcludeEffect(class'X2Effect_SkirmisherInterrupt'.default.EffectName, 'AA_AbilityUnavailable');
	Template.AbilityShooterConditions.AddItem(SuppressedCondition);

	ReserveActionPointsEffect = new class'X2Effect_ReserveOverwatchPoints';
	ReserveActionPointsEffect.UseAllPointsWithAbilities.Length = 0;
	ReserveActionPointsEffect.ReserveType = 'ReserveInterrupt';
	Template.AddTargetEffect(ReserveActionPointsEffect);

	ConcealedCondition = new class'X2Condition_UnitProperty';
	ConcealedCondition.ExcludeFriendlyToSource = false;
	ConcealedCondition.IsConcealed = true;
	UnitValueEffect = new class'X2Effect_SetUnitValue';
	UnitValueEffect.UnitName = class'X2Ability_DefaultAbilitySet'.default.ConcealedOverwatchTurn;
	UnitValueEffect.CleanupType = eCleanup_BeginTurn;
	UnitValueEffect.NewValueToSet = 1;
	UnitValueEffect.TargetConditions.AddItem(ConcealedCondition);
	Template.AddTargetEffect(UnitValueEffect);

	UnitStatCheckCondition = new class'X2Condition_UnitStatCheck';
	UnitStatCheckCondition.AddCheckStat(eStat_Will, 10, eCheck_GreaterThan);
	Template.AbilityShooterConditions.AddItem(UnitStatCheckCondition);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Interrupt";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.OVERWATCH_PRIORITY;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;
	Template.AbilityConfirmSound = "Unreal2DSounds_OverWatch";

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;
	Template.bShowActivation = true;
	Template.CinescriptCameraType = "Overwatch";

	Template.Hostility = eHostility_Defensive;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate SavReflexiveAction()
{
	local X2AbilityTemplate				Template;
	local X2AbilityCooldown				Cooldown;
	local X2Effect_GrantActionPoints    ActionPointEffect;
	local X2AbilityCost_ActionPoints    ActionPointCost;
	local X2AbilityCharges				Charges;
	local X2AbilityCost_Charges			ChargeCost;
	local X2Condition_UnitStatCheck		UnitStatCheckCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavReflexiveAction');

	// Icon Properties
	Template.DisplayTargetHitChance = false;
	Template.AbilitySourceName = 'eAbilitySource_Perk';                                       // color of the icon
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_runandgun";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_LIEUTENANT_PRIORITY;
	Template.Hostility = eHostility_Neutral;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.AbilityConfirmSound = "TacticalUI_Activate_Ability_Run_N_Gun";

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = default.REFLEXIVEACTION_INITIAL_CHARGES;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 3;
	ChargeCost.SharedAbilityCharges.AddItem('SavReflexInterruptInput');
	Template.AbilityCosts.AddItem(ChargeCost);

	UnitStatCheckCondition = new class'X2Condition_UnitStatCheck';
	UnitStatCheckCondition.AddCheckStat(eStat_Will, 8, eCheck_GreaterThan);
	Template.AbilityShooterConditions.AddItem(UnitStatCheckCondition);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	ActionPointEffect = new class'X2Effect_GrantActionPoints';
	ActionPointEffect.NumActionPoints = 1;
	ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.RunAndGunActionPoint;
	Template.AddTargetEffect(ActionPointEffect);

	Template.AbilityTargetStyle = default.SelfTarget;	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.PostActivationEvents.AddItem('ReflexActionActivated');// NOTE THIS IS WHAT THE WILL LOSS EVENT TRIGGERS ARE LISTENING FOR

	Template.bShowActivation = true;
	Template.bSkipFireAction = true;

	Template.ActivationSpeech = 'RunAndGun';
		
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.bCrossClassEligible = true;

	return Template;
}

static function X2AbilityTemplate SavReflexCharges()
{
	local XMBEffect_AddAbilityCharges Effect;

	// Create an effect that will add a bonus charge to the Inspire Agility ability
	Effect = new class'XMBEffect_AddAbilityCharges';
	Effect.AbilityNames.AddItem('SavReflexInterruptInput');
	Effect.AbilityNames.AddItem('SavReflexiveAction');
	Effect.BonusCharges = 1;
	Effect.MaxCharges = 3;

	return SelfTargetTrigger('SavReflexCharges', "img:///UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility", false, Effect, 'PlayerTurnEnded', eFilter_Player);
}

static function X2AbilityTemplate SavTranquility()
{
	local X2AbilityTemplate             Template;
	local X2Effect_SavTranquility		Effect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavTranquility');

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_solace";
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	Effect = new class'X2Effect_SavTranquility';
	Effect.BuildPersistentEffect(1, true, false);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,, Template.AbilitySourceName);
	Effect.DuplicateResponse = eDupe_Refresh;
	Effect.bRemoveWhenTargetDies = true;
	Template.AddMultiTargetEffect(Effect);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	return Template;
}

static function X2AbilityTemplate SavTranquilityClense()
{
	local X2AbilityTemplate						Template;
	local X2AbilityMultiTarget_Radius			RadiusMultiTarget;
	local X2Effect_SavWillLoss					SavWillLossEffect;	
	local X2Effect_RemoveEffects                RemoveEffects;
	local X2Effect_RemoveEffectsByDamageType	RemoveEffectsStatus;
	local X2Effect_RemoveEffects                MindControlRemovalEffect;
	local X2Effect_Regeneration					RegenerationEffect;
	local XMBEffect_ConditionalBonus			RegenDummyEffect;	
	
	// Create a triggered ability that runs at the end of the player's turn
	Template = SelfTargetTrigger('SavTranquilityClense', "img:///UILibrary_PerkIcons.UIPerk_solace", true, none, 'PlayerTurnEnded', eFilter_Player);

	// Trigger abilities don't appear as passives. Add a passive ability icon.
	Template.Hostility = eHostility_Neutral;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.TRANQUILITY_DISTANCE;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	RadiusMultiTarget.bExcludeSelfAsTargetIfWithinRadius=false;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	SavWillLossEffect = new class'X2Effect_SavWillLoss';
//	SavWillLossEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	SavWillLossEffect.WillMod = -1;
	
	RemoveEffectsStatus = new class'X2Effect_RemoveEffectsByDamageType';
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.PanickedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.StunnedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.DazedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.ObsessedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.BerserkName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.ShatteredName);
	Template.AddTargetEffect(RemoveEffectsStatus);
			
	RemoveEffects = class'X2StatusEffects'.static.CreateMindControlRemoveEffects();
	RemoveEffects.DamageTypes.Length = 0;		//	don't let an immunity to "mental" effects resist this cleanse

	MindControlRemovalEffect = new class'X2Effect_RemoveEffects';
	MindControlRemovalEffect.EffectNamesToRemove.AddItem(class'X2Effect_MindControl'.default.EffectName);
	
	RegenerationEffect = new class'X2Effect_Regeneration';
	RegenerationEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd);
	RegenerationEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	RegenerationEffect.HealAmount = default.SAVREGEN_TRANQUILITY_AMOUNT;
	RegenerationEffect.DuplicateResponse = eDupe_Allow;
	RegenerationEffect.HealthRegeneratedName = 'SavTranquilityHealthRegenerated';
	RegenerationEffect.bRemoveWhenTargetDies = true;

	RegenDummyEffect = class'X2Effect_TranquilityRegenDummy'.static.CreateTranquilityRegenDummyEffect();

	AddSecondaryEffect(Template, SavWillLossEffect);
	AddSecondaryEffect(Template, RegenerationEffect);
	AddSecondaryEffect(Template, RegenDummyEffect);
	AddSecondaryEffect(Template, RemoveEffectsStatus);

	Template.AddMultiTargetEffect(RemoveEffects);
	Template.AddMultiTargetEffect(MindControlRemovalEffect);
	Template.AddMultiTargetEffect(RegenerationEffect);
	Template.AddMultiTargetEffect(RegenDummyEffect);
	Template.AddMultiTargetEffect(RemoveEffectsStatus);

	return Template;
}

static function X2AbilityTemplate SavTranquilityPsiDrain()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavTranquilityPsiDrain');
	Template.IconImage = "UILibrary_XPACK_Common.PerkIcons.UIPerk_mindshield";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_PsiOffense, default.TRANQUILITYPSIDRAIN_SCALAR, MODOP_PostMultiplication);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate CreateSavHiddenBladeStab()
{
	local X2AbilityTemplate					Template;
	local X2Effect_ApplyWeaponDamage		DamageEffect;
	local X2AbilityToHitCalc_StandardMelee	ToHitCalc;
	local X2Condition_UnitProperty			TargetCondition;
	local X2AbilityCost_Charges				ChargeCost;
	local X2AbilityCharges					Charges;
	
	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 2;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.RequireWithinRange = true;

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.DamageTypes.AddItem('Melee');
	
	Template = MeleeAttack('SavHiddenBladeStab', "img:///UILibrary_SavageItems.UIPerk_HiddenBladeStab", true, DamageEffect, class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY, eCost_Free);

	AddCooldown(Template, 1);
	Template.AbilityCharges = Charges;
	Template.AbilityCosts.AddItem(ChargeCost);

	ToHitCalc = new class'X2AbilityToHitCalc_StandardMelee';

	Template.AbilityToHitCalc = ToHitCalc;
	Template.ConcealmentRule = eConceal_KillShot;
	Template.AbilityTargetConditions.AddItem(TargetWithinTiles(3));//1-2 tried
	Template.CustomFireAnim = 'FF_SavHiddenStabA';

	return Template;
}

static function X2AbilityTemplate CreateSavHiddenBladeKill()
{
	local X2AbilityTemplate				Template;
	local X2Effect_PersistentStatChange	Effect;
	local XMBCondition_AbilityName		AbilityNameCondition;
		
	AbilityNameCondition = new class'XMBCondition_AbilityName';
	AbilityNameCondition.IncludeAbilityNames.AddItem('SavHiddenBladeStab');

	Effect = new class'X2Effect_PersistentStatChange';
	Effect.EffectName = 'HiddenBladeKill';
	Effect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
	Effect.DuplicateResponse = eDupe_Refresh;
	Effect.AddPersistentStatChange(eStat_DetectionModifier, 0.5f);

	Template = SelfTargetTrigger('SavHiddenBladeKill', "img:///UILibrary_SavageItems.UIPerk_HiddenBlades", false, Effect, 'AbilityActivated');//AbilityActivated

	// Require that the activated ability use the weapon associated with this ability
	AddTriggerTargetCondition(Template, AbilityNameCondition);
	AddTriggerTargetCondition(Template, default.DeadCondition);
	
	// Have the unit say it's entering concealment
	Template.ActivationSpeech = 'ActivateConcealment';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate SAVHiddenBladesConcealment()
{
	local X2AbilityTemplate						Template;
	local X2Effect_HiddenBladeKillConceal       ConcealEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVHiddenBladesConcealment');
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_HiddenBlades";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	ConcealEffect = new class'X2Effect_HiddenBladeKillConceal';
	ConcealEffect.BuildPersistentEffect(1, true, false, false);
	Template.AddTargetEffect(ConcealEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

static function X2AbilityTemplate SAVNanoIntruderHackBonus()
{
	local X2AbilityTemplate Template;
	local XMBEffect_ConditionalStatChange Effect;

	Effect = new class'XMBEffect_ConditionalStatChange';
	Effect.AddPersistentStatChange(eStat_Hacking, 25);
	Effect.DuplicateResponse = eDupe_Ignore;
	Effect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
	
	// Create the template using a helper function
	Template = Passive('SAVNanoIntruderHackBonus', "img:///UILibrary_PerkIcons.UIPerk_mindblast", false, Effect);
	
	AddIconPassive(Template);

	AddSecondaryAbility(Template, SAVNanoIntruderCharges());

	return Template;
}

//straight up copy from someone else!!! (A Better Barracks Perk Pack)
static function X2AbilityTemplate SAVNanoIntruderCharges()
{
	local X2AbilityTemplate Template;
	local XMBEffect_AddAbilityCharges BonusItemEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVNanoIntruderCharges');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_mindblast";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	Template.bIsPassive = true;
	BonusItemEffect = new class'XMBEffect_AddAbilityCharges';
	BonusItemEffect.BonusCharges = 2;
	BonusItemEffect.AbilityNames.AddItem('SKULLMINEAbility');
	Template.AddTargetEffect (BonusItemEffect);
	Template.bCrossClassEligible = false;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.bDisplayInUITooltip = true;
	Template.bDisplayInUITacticalText = true;

	return Template;
}

static function X2AbilityTemplate SAVNanomachineCoating()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_DamageImmunity			DamageImmunity;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVNanomachineCoating');
	Template.IconImage = "UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to health stat Effect
		// Build the immunities
	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.BuildPersistentEffect(1, true, false, true);
	DamageImmunity.ImmuneTypes.AddItem('fire');
	DamageImmunity.ImmuneTypes.AddItem('Frost');
	DamageImmunity.ImmuneTypes.AddItem('Bleeding');
	DamageImmunity.ImmuneTypes.AddItem('NanoShred');
	Template.AddTargetEffect(DamageImmunity);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = 'SAVNanomachineCoating';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, 1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, 0.3f);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	AddIconPassive(Template);

	return Template;
}

static function X2AbilityTemplate SAVReactiveNanoArmor()
{
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(3, false, true, false, eGameRule_PlayerTurnBegin);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, default.SAVReactiveNanoArmorLocFriendlyName, default.SAVReactiveNanoArmorLongDescription, "img:///UILibrary_SavageItems.UIPerk_Effect_Regen", true);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, 1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ShieldHP, 1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, -0.1f);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, default.REACTIVENANOAMOD_DODGE_SCALAR, MODOP_PostMultiplication);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.REACTIVENANOAMOD_MOB_SCALAR, MODOP_PostMultiplication);
	PersistentStatChangeEffect.DuplicateResponse = eDupe_Allow;

	// Create a triggered ability that activates when the unit takes damage
	return SelfTargetTrigger('SAVReactiveNanoArmor', "UILibrary_SavageItems.NewPerks.UIPerk_GenericAMODAbility", false, PersistentStatChangeEffect, 'UnitTakeEffectDamage');
}

static function X2AbilityTemplate SavAdministerStims()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2AbilityTarget_Single				SingleTarget;
	local X2AbilityPassiveAOE_SelfRadius		PassiveAOEStyle;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local X2Effect_PersistentStatChange			StatEffect;
	local X2Effect_ApplyMedikitHeal				HealEffect;
	local X2Effect_SavWillLoss					SavWillGainEffect;
	local XMBEffect_PermanentStatChange			PermenantWillEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition;
	local X2Effect_RemoveEffects				RemoveEffects;
	local X2Effect_RemoveEffects				MindControlRemovalEffect;
	local X2Effect_RemoveEffectsByDamageType	RemoveEffectsStatus;
	local X2Effect_ApplyWeaponDamage			WeaponDamageEffect;
	local XMBEffect_ConditionalBonus			StimmedDummyEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavAdministerStims');
		
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	Template.AbilityToHitCalc = default.DeadEye;

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	SingleTarget.bIncludeSelf = true;
	SingleTarget.bShowAOE = true;
	Template.AbilityTargetStyle = SingleTarget;

	PassiveAOEStyle = new class'X2AbilityPassiveAOE_SelfRadius';
	PassiveAOEStyle.OnlyIncludeTargetsInsideWeaponRange = true;
	Template.AbilityPassiveAOEStyle = PassiveAOEStyle;

//	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bBypassShields = true;
	WeaponDamageEffect.bIgnoreArmor = true;
	Template.AddTargetEffect(WeaponDamageEffect);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

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
	PermenantWillEffect.AddStatChange(eStat_Will, default.SAVSTIMSPERMENANTWILLOSS);
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
	StatEffect.SetDisplayInfo(ePerkBuff_Bonus, default.SavCombatStimBonusName, default.SavCombatStimBonusDesc, Template.IconImage, true);
	StatEffect.AddPersistentStatChange(eStat_Mobility, default.SAVSTIMSMOBILITYBONUS);
	StatEffect.AddPersistentStatChange(eStat_CritChance, default.SAVSTIMSCRITBONUS);
	StatEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(StatEffect);
	
	Template.Hostility = eHostility_Defensive;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_combatstims";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.ActivationSpeech = 'CombatStim';
	Template.bShowActivation = true;
	Template.bUseAmmoAsChargesForHUD = true;
	Template.CustomSelfFireAnim = 'FF_FireStimgunSelfA';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

static function X2AbilityTemplate SavAdministerAdvStims()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2AbilityTarget_Single				SingleTarget;
	local X2AbilityPassiveAOE_SelfRadius		PassiveAOEStyle;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local X2Effect_PersistentStatChange			StatEffect;
	local X2Effect_ApplyMedikitHeal				HealEffect;
	local X2Effect_SavWillLoss					SavWillGainEffect;
	local XMBEffect_PermanentStatChange			PermenantWillEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition;
	local X2Effect_RemoveEffects				RemoveEffects;
	local X2Effect_RemoveEffects				MindControlRemovalEffect;
	local X2Effect_RemoveEffectsByDamageType	RemoveEffectsStatus;
	local X2Effect_ApplyWeaponDamage			WeaponDamageEffect;
	local XMBEffect_ConditionalBonus			StimmedDummyEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavAdministerAdvStims');
		
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	Template.AbilityToHitCalc = default.DeadEye;

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	SingleTarget.bIncludeSelf = true;
	SingleTarget.bShowAOE = true;
	Template.AbilityTargetStyle = SingleTarget;

	PassiveAOEStyle = new class'X2AbilityPassiveAOE_SelfRadius';
	PassiveAOEStyle.OnlyIncludeTargetsInsideWeaponRange = true;
	Template.AbilityPassiveAOEStyle = PassiveAOEStyle;

//	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bBypassShields = true;
	WeaponDamageEffect.bIgnoreArmor = true;
	Template.AddTargetEffect(WeaponDamageEffect);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

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
	PermenantWillEffect.AddStatChange(eStat_Will, default.SAVADVSTIMSPERMENANTWILLOSS);
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
	StatEffect.SetDisplayInfo(ePerkBuff_Bonus, default.SavCombatStimBonusName, default.SavCombatStimBonusDesc, Template.IconImage, true);
	StatEffect.AddPersistentStatChange(eStat_Mobility, default.SAVADVSTIMSMOBILITYBONUS);
	StatEffect.AddPersistentStatChange(eStat_CritChance, default.SAVADVSTIMSCRITBONUS);
	StatEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(StatEffect);
	
	Template.Hostility = eHostility_Defensive;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_combatstims";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.ActivationSpeech = 'CombatStim';
	Template.bShowActivation = true;
	Template.bUseAmmoAsChargesForHUD = true;
	Template.CustomSelfFireAnim = 'FF_FireStimgunSelfA';
//	Template.CustomSelfFireAnim = 'FF_FireMedkitSelf';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

static function X2AbilityTemplate SavODSerumAdaptation()
{
	local X2AbilityTemplate						Template;
	local XMBEffect_PermanentStatChange			PermenantMainBoostEffect, PermenantMinorBoostEffect, PermenantMinorNerfEffect, PermenantMajorNerfEffect, PermenantStrengthEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition, MaxStatCondition2, MaxStatCondition3, MaxStatCondition4, MaxStrengthCondition;
	local XMBCondition_AbilityName				Condition;
	local X2Effect_Panicked						BerserkEffect;
	local X2Effect_SavWillLoss					SavWillGainEffect;

	PermenantMainBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMainBoostEffect.AddStatChange(eStat_Mobility, 1);
	PermenantMainBoostEffect.ApplyChance = 55;	
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_Mobility, 20, eCheck_LessThan);
	PermenantMainBoostEffect.TargetConditions.AddItem(MaxStatCondition);

	// Create the template using a helper function
	Template = SelfTargetTrigger('SavODSerumAdaptation', "img:///UILibrary_SavageItems.UIPerk_Serums", false, PermenantMainBoostEffect, 'AbilityActivated');
	
	PermenantMinorBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorBoostEffect.AddStatChange(eStat_HP, 1);
	PermenantMinorBoostEffect.ApplyChance = 55;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_HP, 25, eCheck_LessThan);
	PermenantMinorBoostEffect.TargetConditions.AddItem(MaxStatCondition2);

	PermenantMinorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorNerfEffect.AddStatChange(eStat_HP, -1);
	PermenantMinorNerfEffect.ApplyChance = 25;
	MaxStatCondition3 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition3.AddCheckStat(eStat_HP, 5, eCheck_GreaterThan);
	PermenantMinorNerfEffect.TargetConditions.AddItem(MaxStatCondition3);

	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Mobility, -1);
	PermenantMajorNerfEffect.ApplyChance = 25;
	MaxStatCondition4 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition4.AddCheckStat(eStat_Mobility, 8, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition4);

	PermenantStrengthEffect = new class'XMBEffect_PermanentStatChange';
	PermenantStrengthEffect.AddStatChange(eStat_Strength, 5);
	PermenantStrengthEffect.ApplyChance = 55;
	MaxStrengthCondition = new class'X2Condition_UnitStatCheck';
	MaxStrengthCondition.AddCheckStat(eStat_Strength, 120, eCheck_LessThan);
	PermenantStrengthEffect.TargetConditions.AddItem(MaxStrengthCondition);

	Condition = new class'XMBCondition_AbilityName';
	Condition.IncludeAbilityNames.AddItem('CombatStims');
	AddTriggerTargetCondition(Template, Condition);
	
	SavWillGainEffect = new class'X2Effect_SavWillLoss';
	SavWillGainEffect.WillMod = -5;
	
	BerserkEffect = class'X2StatusEffects'.static.CreateBerserkStatusEffect();
	BerserkEffect.ApplyChance = 15;
	
	AddSecondaryEffect(Template, BerserkEffect);
	AddSecondaryEffect(Template, SavWillGainEffect);

	AddSecondaryEffect(Template, PermenantMinorBoostEffect);
	AddSecondaryEffect(Template, PermenantMinorNerfEffect);
	AddSecondaryEffect(Template, PermenantMajorNerfEffect);
	AddSecondaryEffect(Template, PermenantStrengthEffect);

	return Template;
}

static function X2AbilityTemplate SavSerumRedExposure()
{
    local X2AbilityTemplate						Template;
	local XMBEffect_ConditionalBonus			CritEffect;
	local XMBEffect_PermanentStatChange			PermenantMainBoostEffect, PermenantMinorBoostEffect, PermenantMinorNerfEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition, MaxStatCondition2, MaxStatCondition3, MaxStatCondition4;
	local X2Effect_SavWillLoss					SavWillossEffect;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'SavSerumRedExposure');

    Template.AbilitySourceName = 'eAbilitySource_Item';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.bIsPassive = true;
    Template.Hostility = eHostility_Neutral;
    Template.bDisplayInUITacticalText = true;
    
    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	//===This section covers the non-permenent effects===
	CritEffect = new class'XMBEffect_ConditionalBonus';
	CritEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	CritEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), "img:///UILibrary_SavageItems.UIPerk_Serums", , , Template.AbilitySourceName);
	CritEffect.AddToHitModifier(5, eHit_Crit);
	CritEffect.AbilityTargetConditions.AddItem(TargetWithinTiles(8));
	Template.AddTargetEffect(CritEffect);

		//===This section covers the permenent stat effects===
	// Permenant crit
	PermenantMainBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMainBoostEffect.AddStatChange(eStat_CritChance, 2);
	PermenantMainBoostEffect.ApplyChance = 55;	
	// check if unit has less than 60 inate crit
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_CritChance, 30, eCheck_LessThan);
	PermenantMainBoostEffect.TargetConditions.AddItem(MaxStatCondition);
	Template.AddTargetEffect(PermenantMainBoostEffect);

	// Permenant Mobility
	PermenantMinorBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorBoostEffect.AddStatChange(eStat_Mobility, 1);
	PermenantMinorBoostEffect.ApplyChance = 30;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_Mobility, 16, eCheck_LessThan);
	PermenantMinorBoostEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMinorBoostEffect);

	// Permenant Will reduction
	PermenantMinorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorNerfEffect.AddStatChange(eStat_Will, -1);
	PermenantMinorNerfEffect.ApplyChance = 30;
	MaxStatCondition3 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition3.AddCheckStat(eStat_Will, 20, eCheck_GreaterThan);
	PermenantMinorNerfEffect.TargetConditions.AddItem(MaxStatCondition3);
	Template.AddTargetEffect(PermenantMinorNerfEffect);

	// Permenant Defence reduction
	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Defense, -2);
	PermenantMajorNerfEffect.ApplyChance = 45;
	MaxStatCondition4 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition4.AddCheckStat(eStat_Defense, -15, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition4);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

	//===This section covers the miscellaneous effects===
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeSerum';
	ConsumeItemTrigger.ApplyChance = 10;
	Template.AddTargetEffect(ConsumeItemTrigger);

	SavWillossEffect = new class'X2Effect_SavWillLoss';
	SavWillossEffect.WillMod = -2;
	Template.AddTargetEffect(SavWillossEffect);
    
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Serums";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.bSkipFireAction = true;
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    return Template;
}

static function X2AbilityTemplate SavAdministerSerumRed()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local X2Effect_GrantActionPoints			ActionPointEffect;
	local XMBEffect_ConditionalBonus			CritEffect;
	local XMBEffect_PermanentStatChange			PermenantMainBoostEffect, PermenantMinorBoostEffect, PermenantMinorNerfEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition, MaxStatCondition2, MaxStatCondition3, MaxStatCondition4;
	local X2Effect_SavWillLoss					SavWillossEffect;
	local X2Effect_Panicked						BerserkEffect;
	local XMBEffect_ConditionalBonus			SerumRedDummyEffect;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavAdministerSerumRed');
		
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.bFreeCost = true; 
	ActionPointCost.iNumPoints = 1;
	
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;

	Template.AbilityCosts.AddItem(ActionPointCost);	
	Template.AbilityCosts.AddItem(AmmoCost);

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	//===This section covers the non-permenent effects===
	ActionPointEffect = new class'X2Effect_GrantActionPoints';
	ActionPointEffect.NumActionPoints = 2;
	ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
	Template.AddTargetEffect(ActionPointEffect);

	CritEffect = new class'XMBEffect_ConditionalBonus';
	CritEffect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	CritEffect.AddDamageModifier(2, eHit_Crit);
	CritEffect.AddToHitModifier(10, eHit_Crit);
	CritEffect.AbilityTargetConditions.AddItem(TargetWithinTiles(8));
	Template.AddTargetEffect(CritEffect);
	
	//===This section covers the permenent stat effects===
	// Permenant crit
	PermenantMainBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMainBoostEffect.AddStatChange(eStat_CritChance, 6);
	PermenantMainBoostEffect.ApplyChance = 90;	
	// check if unit has less than 60 inate crit
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_CritChance, 60, eCheck_LessThan);
	PermenantMainBoostEffect.TargetConditions.AddItem(MaxStatCondition);
	Template.AddTargetEffect(PermenantMainBoostEffect);

	// Permenant Mobility
	PermenantMinorBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorBoostEffect.AddStatChange(eStat_Mobility, 1);
	PermenantMinorBoostEffect.ApplyChance = 55;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_Mobility, 19, eCheck_LessThan);
	PermenantMinorBoostEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMinorBoostEffect);

	// Permenant Will reduction
	PermenantMinorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorNerfEffect.AddStatChange(eStat_Will, -2);
	PermenantMinorNerfEffect.ApplyChance = 55;
	MaxStatCondition3 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition3.AddCheckStat(eStat_Will, 10, eCheck_GreaterThan);
	PermenantMinorNerfEffect.TargetConditions.AddItem(MaxStatCondition3);
	Template.AddTargetEffect(PermenantMinorNerfEffect);

	// Permenant Defence reduction
	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Defense, -4);
	PermenantMajorNerfEffect.ApplyChance = 80;
	MaxStatCondition4 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition4.AddCheckStat(eStat_Defense, -30, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition4);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

//===This section covers the miscellaneous effects===
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeSerum';
	ConsumeItemTrigger.ApplyChance = 70;
	Template.AddTargetEffect(ConsumeItemTrigger);

	SavWillossEffect = new class'X2Effect_SavWillLoss';
	SavWillossEffect.WillMod = -4;
	Template.AddTargetEffect(SavWillossEffect);

	BerserkEffect = class'X2StatusEffects'.static.CreateBerserkStatusEffect();
	BerserkEffect.ApplyChance = 20;
	Template.AddTargetEffect(BerserkEffect);

	SerumRedDummyEffect = class'X2Effect_SavStimmedEffect'.static.CreateSavSerumRedActiveEffect();
	Template.AddTargetEffect(SerumRedDummyEffect);// Grants the Crit bonuses and spawns in icon and description and some FX hooks
	
	Template.Hostility = eHostility_Defensive;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Serums";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.ActivationSpeech = 'CombatStim';
	Template.bShowActivation = true;
	Template.CustomSelfFireAnim = 'FF_FireMedkitSelf';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

static function X2AbilityTemplate SavSerumBlueExposure()
{
    local X2AbilityTemplate						Template;
	local XMBEffect_ConditionalBonus			AimEffect, ArmorPierceEffect;
	local XMBEffect_PermanentStatChange			PermenantMainBoostEffect, PermenantMinorBoostEffect, PermenantMinorNerfEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition, MaxStatCondition2, MaxStatCondition3, MaxStatCondition4;
	local X2Effect_SavWillLoss					SavWillossEffect;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'SavSerumBlueExposure');

    Template.AbilitySourceName = 'eAbilitySource_Item';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.Hostility = eHostility_Neutral;
    Template.bDisplayInUITacticalText = true;
    Template.bIsPassive = true;

    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	//===This section covers the non-permenent effects===
	AimEffect = new class'XMBEffect_ConditionalBonus';
	AimEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	AimEffect.AddToHitModifier(5, eHit_Success);
	Template.AddTargetEffect(AimEffect);

	ArmorPierceEffect = new class'XMBEffect_ConditionalBonus';
	ArmorPierceEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	ArmorPierceEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), "img:///UILibrary_SavageItems.UIPerk_Serums", , , Template.AbilitySourceName);
	ArmorPierceEffect.AddArmorPiercingModifier(1);
	AddSecondaryEffect(Template, ArmorPierceEffect);

	//===This section covers the permenent stat effects===
	// Permenant Offence
	PermenantMainBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMainBoostEffect.AddStatChange(eStat_Offense, 2);
	PermenantMainBoostEffect.ApplyChance = 55;	
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_Offense, 90, eCheck_LessThan);
	PermenantMainBoostEffect.TargetConditions.AddItem(MaxStatCondition);
	Template.AddTargetEffect(PermenantMainBoostEffect);

	// Permenant Sight
	PermenantMinorBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorBoostEffect.AddStatChange(eStat_SightRadius, 1);
	PermenantMinorBoostEffect.ApplyChance = 30;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_SightRadius, 32, eCheck_LessThan);
	PermenantMinorBoostEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMinorBoostEffect);

	// Permenant HP reduction
	PermenantMinorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorNerfEffect.AddStatChange(eStat_HP, -1);
	PermenantMinorNerfEffect.ApplyChance = 20;
	MaxStatCondition3 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition3.AddCheckStat(eStat_HP, 4, eCheck_GreaterThan);
	PermenantMinorNerfEffect.TargetConditions.AddItem(MaxStatCondition3);
	Template.AddTargetEffect(PermenantMinorNerfEffect);

	// Permenant Will reduction
	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Will, -2);
	PermenantMajorNerfEffect.ApplyChance = 45;
	MaxStatCondition4 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition4.AddCheckStat(eStat_Will, 18, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition4);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

	//===This section covers the miscellaneous effects===
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeSerum';
	ConsumeItemTrigger.ApplyChance = 10;
	Template.AddTargetEffect(ConsumeItemTrigger);

	SavWillossEffect = new class'X2Effect_SavWillLoss';
	SavWillossEffect.WillMod = -2;
	Template.AddTargetEffect(SavWillossEffect);
    
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Serums";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.bSkipFireAction = true;
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    return Template;
}

static function X2AbilityTemplate SavAdministerSerumBlue()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local X2Effect_GrantActionPoints			ActionPointEffect;
	local XMBEffect_ConditionalBonus			OverwatchEffect, ArmorPierceEffect;
	local XMBEffect_PermanentStatChange			PermenantMainBoostEffect, PermenantMinorBoostEffect, PermenantMinorNerfEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition, MaxStatCondition2, MaxStatCondition3, MaxStatCondition4;
	local X2Effect_SavWillLoss					SavWillossEffect;
	local X2Effect_Panicked						ObsessedEffect;
	local XMBEffect_ConditionalBonus			SerumBlueDummyEffect;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavAdministerSerumBlue');
		
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.bFreeCost = true; 
	ActionPointCost.iNumPoints = 1;
	
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;

	Template.AbilityCosts.AddItem(ActionPointCost);	
	Template.AbilityCosts.AddItem(AmmoCost);

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	//===This section covers the non-permenent effects===
	ActionPointEffect = new class'X2Effect_GrantActionPoints';
	ActionPointEffect.NumActionPoints = 1;
	ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
	Template.AddTargetEffect(ActionPointEffect);

	OverwatchEffect = new class'XMBEffect_ConditionalBonus';
	OverwatchEffect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	OverwatchEffect.AddToHitModifier(15, eHit_Success);
	Template.AddTargetEffect(OverwatchEffect);

	ArmorPierceEffect = new class'XMBEffect_ConditionalBonus';
	ArmorPierceEffect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	ArmorPierceEffect.AddArmorPiercingModifier(3);
	AddSecondaryEffect(Template, ArmorPierceEffect);
	
	//===This section covers the permenent stat effects===
	// Permenant Offence
	PermenantMainBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMainBoostEffect.AddStatChange(eStat_Offense, 4);
	PermenantMainBoostEffect.ApplyChance = 90;	
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_Offense, 110, eCheck_LessThan);
	PermenantMainBoostEffect.TargetConditions.AddItem(MaxStatCondition);
	Template.AddTargetEffect(PermenantMainBoostEffect);

	// Permenant Sight
	PermenantMinorBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorBoostEffect.AddStatChange(eStat_SightRadius, 1);
	PermenantMinorBoostEffect.ApplyChance = 55;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_SightRadius, 36, eCheck_LessThan);
	PermenantMinorBoostEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMinorBoostEffect);

	// Permenant HP reduction
	PermenantMinorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorNerfEffect.AddStatChange(eStat_HP, -1);
	PermenantMinorNerfEffect.ApplyChance = 45;
	MaxStatCondition3 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition3.AddCheckStat(eStat_HP, 2, eCheck_GreaterThan);
	PermenantMinorNerfEffect.TargetConditions.AddItem(MaxStatCondition3);
	Template.AddTargetEffect(PermenantMinorNerfEffect);

	// Permenant Will reduction
	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Will, -4);
	PermenantMajorNerfEffect.ApplyChance = 80;
	MaxStatCondition4 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition4.AddCheckStat(eStat_Will, 14, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition4);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

//===This section covers the miscellaneous effects===
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeSerum';
	ConsumeItemTrigger.ApplyChance = 70;
	Template.AddTargetEffect(ConsumeItemTrigger);

	SavWillossEffect = new class'X2Effect_SavWillLoss';
	SavWillossEffect.WillMod = -4;
	Template.AddTargetEffect(SavWillossEffect);

	ObsessedEffect = class'X2StatusEffects'.static.CreateObsessedStatusEffect();
	ObsessedEffect.ApplyChance = 20;
	Template.AddTargetEffect(ObsessedEffect);

	SerumBlueDummyEffect = class'X2Effect_SavStimmedEffect'.static.CreateSavSerumBlueActiveEffect();
	Template.AddTargetEffect(SerumBlueDummyEffect);// Spawns in icon and description and some FX hooks
	
	Template.Hostility = eHostility_Defensive;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Serums";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.ActivationSpeech = 'CombatStim';
	Template.bShowActivation = true;
	Template.CustomSelfFireAnim = 'FF_FireMedkitSelf';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

static function X2AbilityTemplate SavSerumYellowExposure()
{
    local X2AbilityTemplate						Template;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local XMBEffect_PermanentStatChange			PermenantMainBoostEffect, PermenantMinorBoostEffect, PermenantMinorNerfEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition, MaxStatCondition2, MaxStatCondition3, MaxStatCondition4;
	local X2Effect_SavWillLoss					SavWillossEffect;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'SavSerumYellowExposure');

    Template.AbilitySourceName = 'eAbilitySource_Item';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.Hostility = eHostility_Neutral;
    Template.bDisplayInUITacticalText = true;
    Template.bIsPassive = true;

    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	//===This section covers the non-permenent effects===
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), "img:///UILibrary_SavageItems.UIPerk_Serums", , , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, 1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, 1);
	Template.AddTargetEffect(PersistentStatChangeEffect);

		//===This section covers the permenent stat effects===
	// Permenant HP
	PermenantMainBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMainBoostEffect.AddStatChange(eStat_HP, 1);
	PermenantMainBoostEffect.ApplyChance = 45;	
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_HP, 12, eCheck_LessThan);
	PermenantMainBoostEffect.TargetConditions.AddItem(MaxStatCondition);
	Template.AddTargetEffect(PermenantMainBoostEffect);

	// Permenant Armor
	PermenantMinorBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorBoostEffect.AddStatChange(eStat_ArmorMitigation, 1);
	PermenantMinorBoostEffect.ApplyChance = 25;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_ArmorMitigation, 2, eCheck_LessThan);
	PermenantMinorBoostEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMinorBoostEffect);

	// Permenant Mobility reduction
	PermenantMinorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorNerfEffect.AddStatChange(eStat_Mobility, -1);
	PermenantMinorNerfEffect.ApplyChance = 15;
	MaxStatCondition3 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition3.AddCheckStat(eStat_Mobility, 9, eCheck_GreaterThan);
	PermenantMinorNerfEffect.TargetConditions.AddItem(MaxStatCondition3);
	Template.AddTargetEffect(PermenantMinorNerfEffect);

	// Permenant Will reduction
	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Will, -2);
	PermenantMajorNerfEffect.ApplyChance = 45;
	MaxStatCondition4 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition4.AddCheckStat(eStat_Will, 16, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition4);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

	//===This section covers the miscellaneous effects===
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeSerum';
	ConsumeItemTrigger.ApplyChance = 10;
	Template.AddTargetEffect(ConsumeItemTrigger);

	SavWillossEffect = new class'X2Effect_SavWillLoss';
	SavWillossEffect.WillMod = -3;
	Template.AddTargetEffect(SavWillossEffect);
    
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Serums";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.bSkipFireAction = true;
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    return Template;
}

static function X2AbilityTemplate SavAdministerSerumYellow()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local X2Effect_GrantActionPoints			ActionPointEffect;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local X2Effect_Regeneration					RegenerationEffect;
	local XMBEffect_PermanentStatChange			PermenantMainBoostEffect, PermenantMinorBoostEffect, PermenantMinorNerfEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition, MaxStatCondition2, MaxStatCondition3, MaxStatCondition4;
	local X2Effect_SavWillLoss					SavWillossEffect;
	local X2Effect_PersistentStatChange			DisorientedEffect;
	local XMBEffect_ConditionalBonus			SerumYellowDummyEffect;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavAdministerSerumYellow');
		
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.bFreeCost = true; 
	ActionPointCost.iNumPoints = 1;
	
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;

	Template.AbilityCosts.AddItem(ActionPointCost);	
	Template.AbilityCosts.AddItem(AmmoCost);

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	//===This section covers the non-permenent effects===
	ActionPointEffect = new class'X2Effect_GrantActionPoints';
	ActionPointEffect.NumActionPoints = 1;
	ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
	Template.AddTargetEffect(ActionPointEffect);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, 2);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Defense, -10);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ShieldHP, 3);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	RegenerationEffect = new class'X2Effect_Regeneration';
	RegenerationEffect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	RegenerationEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	RegenerationEffect.HealAmount = default.SAVREGEN2_REGEN_AMOUNT;
	RegenerationEffect.DuplicateResponse = eDupe_Allow;
	RegenerationEffect.HealthRegeneratedName = 'SerumYellowHealthRegenerated';
	RegenerationEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(RegenerationEffect);

	//===This section covers the permenent stat effects===
	// Permenant HP
	PermenantMainBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMainBoostEffect.AddStatChange(eStat_HP, 1);
	PermenantMainBoostEffect.ApplyChance = 90;	
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_HP, 18, eCheck_LessThan);
	PermenantMainBoostEffect.TargetConditions.AddItem(MaxStatCondition);
	Template.AddTargetEffect(PermenantMainBoostEffect);

	// Permenant Armor
	PermenantMinorBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorBoostEffect.AddStatChange(eStat_ArmorMitigation, 1);
	PermenantMinorBoostEffect.ApplyChance = 55;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_ArmorMitigation, 4, eCheck_LessThan);
	PermenantMinorBoostEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMinorBoostEffect);

	// Permenant Mobility reduction
	PermenantMinorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorNerfEffect.AddStatChange(eStat_Mobility, -1);
	PermenantMinorNerfEffect.ApplyChance = 45;
	MaxStatCondition3 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition3.AddCheckStat(eStat_Mobility, 7, eCheck_GreaterThan);
	PermenantMinorNerfEffect.TargetConditions.AddItem(MaxStatCondition3);
	Template.AddTargetEffect(PermenantMinorNerfEffect);

	// Permenant Will reduction
	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Will, -4);
	PermenantMajorNerfEffect.ApplyChance = 80;
	MaxStatCondition4 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition4.AddCheckStat(eStat_Will, 14, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition4);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

//===This section covers the miscellaneous effects===
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeSerum';
	ConsumeItemTrigger.ApplyChance = 70;
	Template.AddTargetEffect(ConsumeItemTrigger);

	SavWillossEffect = new class'X2Effect_SavWillLoss';
	SavWillossEffect.WillMod = -6;
	Template.AddTargetEffect(SavWillossEffect);

	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect(, , false);
	DisorientedEffect.ApplyChance = 30;
	Template.AddTargetEffect(DisorientedEffect);

	SerumYellowDummyEffect = class'X2Effect_SavStimmedEffect'.static.CreateSavSerumYellowActiveEffect();
	Template.AddTargetEffect(SerumYellowDummyEffect);// spawns in icon and description and some FX hooks
	
	Template.Hostility = eHostility_Defensive;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Serums";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.ActivationSpeech = 'CombatStim';
	Template.bShowActivation = true;
	Template.CustomSelfFireAnim = 'FF_FireMedkitSelf';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

static function X2AbilityTemplate SavSerumVioletExposure()
{
    local X2AbilityTemplate						Template;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local XMBEffect_PermanentStatChange			PermenantMainBoostEffect, PermenantMinorBoostEffect, PermenantMinorNerfEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition, MaxStatCondition2, MaxStatCondition3, MaxStatCondition4;
	local X2Effect_SavWillLoss					SavWillossEffect;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'SavSerumVioletExposure');

    Template.AbilitySourceName = 'eAbilitySource_Item';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.Hostility = eHostility_Neutral;
    Template.bDisplayInUITacticalText = true;
    Template.bIsPassive = true;

    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	//===This section covers the non-permenent effects===
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), "img:///UILibrary_SavageItems.UIPerk_Serums", , , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_PsiOffense, 10);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Will, -5);
	Template.AddTargetEffect(PersistentStatChangeEffect);

		//===This section covers the permenent stat effects===
	// Permenant Psi Offence
	PermenantMainBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMainBoostEffect.AddStatChange(eStat_PsiOffense, 4);
	PermenantMainBoostEffect.ApplyChance = 55;	
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_PsiOffense, 130, eCheck_LessThan);
	PermenantMainBoostEffect.TargetConditions.AddItem(MaxStatCondition);
	Template.AddTargetEffect(PermenantMainBoostEffect);

	// Permenant Will
	PermenantMinorBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorBoostEffect.AddStatChange(eStat_Will, 2);
	PermenantMinorBoostEffect.ApplyChance = 40;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_Will, 70, eCheck_LessThan);
	PermenantMinorBoostEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMinorBoostEffect);

	// Permenant HP reduction
	PermenantMinorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorNerfEffect.AddStatChange(eStat_HP, -1);
	PermenantMinorNerfEffect.ApplyChance = 15;
	MaxStatCondition3 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition3.AddCheckStat(eStat_HP, 5, eCheck_GreaterThan);
	PermenantMinorNerfEffect.TargetConditions.AddItem(MaxStatCondition3);
	Template.AddTargetEffect(PermenantMinorNerfEffect);

	// Permenant Defence reduction
	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Defense, -2);
	PermenantMajorNerfEffect.ApplyChance = 40;
	MaxStatCondition4 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition4.AddCheckStat(eStat_Defense, -20, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition4);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

	//===This section covers the miscellaneous effects===
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeSerum';
	ConsumeItemTrigger.ApplyChance = 10;
	Template.AddTargetEffect(ConsumeItemTrigger);

	SavWillossEffect = new class'X2Effect_SavWillLoss';
	SavWillossEffect.WillMod = -3;
	Template.AddTargetEffect(SavWillossEffect);

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Serums";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.bSkipFireAction = true;
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    return Template;
}

static function X2AbilityTemplate SavAdministerSerumViolet()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local XMBEffect_AddAbilityCharges			ChargesEffect;
	local XMBEffect_DoNotConsumeAllPoints		NTEPsiEffect;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local XMBEffect_PermanentStatChange			PermenantMainBoostEffect, PermenantMinorBoostEffect, PermenantMinorNerfEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition, MaxStatCondition2, MaxStatCondition3, MaxStatCondition4;
	local X2Effect_SavWillLoss					SavWillossEffect;
	local X2Effect_Persistent					BleedingEffect;
	local X2Effect								StunnedEffect;
	local XMBEffect_ConditionalBonus			SerumVioletDummyEffect;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;
	local name AllowedAbilityNames_SerumViolet_NTE;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavAdministerSerumViolet');
		
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.bFreeCost = true; 
	ActionPointCost.iNumPoints = 1;
	
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;

	Template.AbilityCosts.AddItem(ActionPointCost);	
	Template.AbilityCosts.AddItem(AmmoCost);

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	//===This section covers the non-permenent effects===

	ChargesEffect = new class'XMBEffect_AddAbilityCharges';
	ChargesEffect.AbilityNames.AddItem('SAVMindCrush');
	ChargesEffect.BonusCharges = 3;
	ChargesEffect.MaxCharges = 3;
	Template.AddTargetEffect(ChargesEffect);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_PsiOffense, 20);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Will, -10);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	NTEPsiEffect = new class'XMBEffect_DoNotConsumeAllPoints';
	NTEPsiEffect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	NTEPsiEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
		foreach default.AllowedAbilityArray_SerumViolet_NTE(AllowedAbilityNames_SerumViolet_NTE)
	{
		NTEPsiEffect.AbilityNames.AddItem(AllowedAbilityNames_SerumViolet_NTE);
	}
	Template.AddTargetEffect(NTEPsiEffect);

	//===This section covers the permenent stat effects===
	// Permenant Psi Offence
	PermenantMainBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMainBoostEffect.AddStatChange(eStat_PsiOffense, 12);
	PermenantMainBoostEffect.ApplyChance = 90;	
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_PsiOffense, 150, eCheck_LessThan);
	PermenantMainBoostEffect.TargetConditions.AddItem(MaxStatCondition);
	Template.AddTargetEffect(PermenantMainBoostEffect);

	// Permenant Will
	PermenantMinorBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorBoostEffect.AddStatChange(eStat_Will, 4);
	PermenantMinorBoostEffect.ApplyChance = 60;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_Will, 80, eCheck_LessThan);
	PermenantMinorBoostEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMinorBoostEffect);

	// Permenant HP reduction
	PermenantMinorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorNerfEffect.AddStatChange(eStat_HP, -1);
	PermenantMinorNerfEffect.ApplyChance = 40;
	MaxStatCondition3 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition3.AddCheckStat(eStat_HP, 4, eCheck_GreaterThan);
	PermenantMinorNerfEffect.TargetConditions.AddItem(MaxStatCondition3);
	Template.AddTargetEffect(PermenantMinorNerfEffect);

	// Permenant Defence reduction
	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Defense, -5);
	PermenantMajorNerfEffect.ApplyChance = 75;
	MaxStatCondition4 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition4.AddCheckStat(eStat_Defense, -30, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition4);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

//===This section covers the miscellaneous effects===
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeSerum';
	ConsumeItemTrigger.ApplyChance = 70;
	Template.AddTargetEffect(ConsumeItemTrigger);

	SavWillossEffect = new class'X2Effect_SavWillLoss';
	SavWillossEffect.WillMod = -6;
	Template.AddTargetEffect(SavWillossEffect);
		
	BleedingEffect = class'X2StatusEffects'.static.CreateBleedingStatusEffect(4, 1);
	BleedingEffect.ApplyChance = 20;
	Template.AddTargetEffect(BleedingEffect);

	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 20, false);
	AddSecondaryEffect(Template, StunnedEffect);

	SerumVioletDummyEffect = class'X2Effect_SavStimmedEffect'.static.CreateSavSerumVioletActiveEffect();
	Template.AddTargetEffect(SerumVioletDummyEffect);// spawns in icon and description and some FX hooks

	Template.Hostility = eHostility_Defensive;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Serums";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.ActivationSpeech = 'CombatStim';
	Template.bShowActivation = true;
	Template.CustomSelfFireAnim = 'FF_FireMedkitSelf';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

static function X2AbilityTemplate SAVMindCrush()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityCost_Charges				ChargeCost;
	local X2AbilityCharges					Charges;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Radius       RadiusMultiTarget;
	local X2AbilityCooldown                 Cooldown;
	local X2Effect_ApplyWeaponDamage        DamageEffect;
	local X2Condition_UnitProperty			UnitPropertyCondition;
	local X2Condition_UnitImmunities		UnitImmunityCondition;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatCheck;
	local X2Effect_PersistentStatChange		DisorientedEffect, MindCrushed;
	local X2Effect_Panicked					PanicEffect;


	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVMindCrush');

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.bFreeCost = true; 
	Template.AbilityCosts.AddItem(ActionPointCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 0;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;

	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.BaseValue = 100;
	Template.AbilityToHitCalc = StatCheck;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToSquadsightRange = true;
	CursorTarget.FixedAbilityRange = default.MINDCRUSH_RANGE;
	Template.AbilityTargetStyle = CursorTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.MINDCRUSH_RADIUS;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.FailOnNonUnits = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);	

	UnitImmunityCondition = new class'X2Condition_UnitImmunities';
	UnitImmunityCondition.AddExcludeDamageType('Mental');
	UnitImmunityCondition.bOnlyOnCharacterTemplate = true;
	Template.AbilityTargetConditions.AddItem(UnitImmunityCondition);

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
//	DamageEffect.bIgnoreBaseDamage = true;
	DamageEffect.MinStatContestResult = 1;
	DamageEffect.MaxStatContestResult = 0;  
	DamageEffect.bBypassShields = true;
	DamageEffect.bIgnoreArmor = true;
	DamageEffect.DamageTypes.AddItem('Psi');
	Template.AddMultiTargetEffect(DamageEffect);

	MindCrushed = class'X2Effect_SavStimmedEffect'.static.CreateSavMindCrushedActiveEffect();
	MindCrushed.MinStatContestResult = 1;
	MindCrushed.MaxStatContestResult = 0; 
	MindCrushed.DamageTypes.AddItem('Psi');
	Template.AddMultiTargetEffect(MindCrushed);
	
	//  Disorient effect for 1 unblocked psi hit
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	DisorientedEffect.iNumTurns = 2;
	DisorientedEffect.MinStatContestResult = 1;
	DisorientedEffect.MaxStatContestResult = 0;     
	DisorientedEffect.DamageTypes.AddItem('Psi');
	Template.AddTargetEffect(DisorientedEffect);
	
	//  Panic effect for 3-4 unblocked psi hits
	PanicEffect = class'X2StatusEffects'.static.CreatePanickedStatusEffect();
	PanicEffect.MinStatContestResult = 1;
	PanicEffect.MaxStatContestResult = 0;
	PanicEffect.DamageTypes.AddItem('Psi');
	Template.AddTargetEffect(PanicEffect);
	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_voidrift";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.bShowActivation = true;

	Template.TargetingMethod = class'X2TargetingMethod_VoidRift';

	Template.ActivationSpeech = 'VoidRift';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Psionic_FireAtLocation";

	Template.CustomFireAnim = 'HL_SAVMindCrush';

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	return Template;
}

static function X2AbilityTemplate SavSerumOrangeExposure()
{
    local X2AbilityTemplate						Template;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local XMBEffect_PermanentStatChange			PermenantMainBoostEffect, PermenantMinorBoostEffect, PermenantMinorNerfEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition, MaxStatCondition2, MaxStatCondition3, MaxStatCondition4;
	local X2Effect_SavWillLoss					SavWillossEffect;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'SavSerumOrangeExposure');

    Template.AbilitySourceName = 'eAbilitySource_Item';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.Hostility = eHostility_Neutral;
    Template.bDisplayInUITacticalText = true;
   	Template.bIsPassive = true; 

    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	//===This section covers the non-permenent effects===
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), "img:///UILibrary_SavageItems.UIPerk_Serums", , , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, 2);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, 10);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ShieldHP, 2);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	//===This section covers the permenent stat effects===
	// Permenant HP Offence
	PermenantMainBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMainBoostEffect.AddStatChange(eStat_HP, 1);
	PermenantMainBoostEffect.ApplyChance = 50;	
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_HP, 20, eCheck_LessThan);
	PermenantMainBoostEffect.TargetConditions.AddItem(MaxStatCondition);
	Template.AddTargetEffect(PermenantMainBoostEffect);

	// Permenant Mobility
	PermenantMinorBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorBoostEffect.AddStatChange(eStat_Mobility, 1);
	PermenantMinorBoostEffect.ApplyChance = 30;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_Mobility, 18, eCheck_LessThan);
	PermenantMinorBoostEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMinorBoostEffect);

	// Permenant Sight reduction
	PermenantMinorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorNerfEffect.AddStatChange(eStat_SightRadius, -1);
	PermenantMinorNerfEffect.ApplyChance = 15;
	MaxStatCondition3 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition3.AddCheckStat(eStat_SightRadius, 20, eCheck_GreaterThan);
	PermenantMinorNerfEffect.TargetConditions.AddItem(MaxStatCondition3);
	Template.AddTargetEffect(PermenantMinorNerfEffect);

	// Permenant Will reduction
	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Will, -2);
	PermenantMajorNerfEffect.ApplyChance = 40;
	MaxStatCondition4 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition4.AddCheckStat(eStat_Will, 20, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition4);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

	//===This section covers the miscellaneous effects===
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeSerum';
	ConsumeItemTrigger.ApplyChance = 10;
	Template.AddTargetEffect(ConsumeItemTrigger);

	SavWillossEffect = new class'X2Effect_SavWillLoss';
	SavWillossEffect.WillMod = -3;
	Template.AddTargetEffect(SavWillossEffect);

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Serums";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.bSkipFireAction = true;
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    return Template;
}

static function X2AbilityTemplate SavAdministerSerumOrange()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local XMBEffect_DoNotConsumeAllPoints		NTEEffect;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local X2Effect_GrantActionPoints			ActionPointEffect;
	local XMBEffect_PermanentStatChange			PermenantMainBoostEffect, PermenantMinorBoostEffect, PermenantMinorNerfEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition, MaxStatCondition2, MaxStatCondition3, MaxStatCondition4;
	local X2Effect_SavWillLoss					SavWillossEffect;
	local X2Effect_Panicked						BerserkEffect;
	local XMBEffect_ConditionalBonus			SerumOrangeDummyEffect;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;
	local name AllowedAbilityNames_SerumOrangeNTE;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavAdministerSerumOrange');
		
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.bFreeCost = true; 
	ActionPointCost.iNumPoints = 1;
	
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;

	Template.AbilityCosts.AddItem(ActionPointCost);	
	Template.AbilityCosts.AddItem(AmmoCost);

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	//===This section covers the non-permenent effects===

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, 3);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, 20);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ShieldHP, 3);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	NTEEffect = new class'XMBEffect_DoNotConsumeAllPoints';
	NTEEffect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	NTEEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
		foreach default.AllowedAbilityArray_SerumOrange_NTE(AllowedAbilityNames_SerumOrangeNTE)
	{
		NTEEffect.AbilityNames.AddItem(AllowedAbilityNames_SerumOrangeNTE);
	}
	Template.AddTargetEffect(NTEEffect);

	ActionPointEffect = new class'X2Effect_GrantActionPoints';
	ActionPointEffect.NumActionPoints = 2;
	ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
	Template.AddTargetEffect(ActionPointEffect);

	//===This section covers the permenent stat effects===
	// Permenant HP Offence
	PermenantMainBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMainBoostEffect.AddStatChange(eStat_HP, 1);
	PermenantMainBoostEffect.ApplyChance = 90;	
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_HP, 24, eCheck_LessThan);
	PermenantMainBoostEffect.TargetConditions.AddItem(MaxStatCondition);
	Template.AddTargetEffect(PermenantMainBoostEffect);

	// Permenant Mobility
	PermenantMinorBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorBoostEffect.AddStatChange(eStat_Mobility, 1);
	PermenantMinorBoostEffect.ApplyChance = 60;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_Mobility, 24, eCheck_LessThan);
	PermenantMinorBoostEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMinorBoostEffect);

	// Permenant Sight reduction
	PermenantMinorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorNerfEffect.AddStatChange(eStat_SightRadius, -1);
	PermenantMinorNerfEffect.ApplyChance = 40;
	MaxStatCondition3 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition3.AddCheckStat(eStat_SightRadius, 15, eCheck_GreaterThan);
	PermenantMinorNerfEffect.TargetConditions.AddItem(MaxStatCondition3);
	Template.AddTargetEffect(PermenantMinorNerfEffect);

	// Permenant Will reduction
	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Will, -4);
	PermenantMajorNerfEffect.ApplyChance = 75;
	MaxStatCondition4 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition4.AddCheckStat(eStat_Will, 14, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition4);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

//===This section covers the miscellaneous effects===
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeSerum';
	ConsumeItemTrigger.ApplyChance = 70;
	Template.AddTargetEffect(ConsumeItemTrigger);

	SavWillossEffect = new class'X2Effect_SavWillLoss';
	SavWillossEffect.WillMod = -6;
	Template.AddTargetEffect(SavWillossEffect);

	BerserkEffect = class'X2StatusEffects'.static.CreateBerserkStatusEffect();
	BerserkEffect.ApplyChance = 20;
	Template.AddTargetEffect(BerserkEffect);

	SerumOrangeDummyEffect = class'X2Effect_SavStimmedEffect'.static.CreateSavSerumOrangeActiveEffect();
	Template.AddTargetEffect(SerumOrangeDummyEffect);// spawns in icon and description and some FX hooks

	Template.Hostility = eHostility_Defensive;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Serums";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.ActivationSpeech = 'CombatStim';
	Template.bShowActivation = true;
	Template.CustomSelfFireAnim = 'FF_FireMedkitSelf';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

static function X2AbilityTemplate SavSerumGreenExposure()
{
    local X2AbilityTemplate						Template;
	local X2Effect_DamageImmunity				DamageImmunity;
	local X2Effect_Regeneration					RegenerationEffect;
	local XMBEffect_PermanentStatChange			PermenantMainBoostEffect, PermenantMinorBoostEffect, PermenantMinorNerfEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition, MaxStatCondition2, MaxStatCondition3, MaxStatCondition4;
	local X2Effect_SavWillLoss					SavWillossEffect;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'SavSerumGreenExposure');

    Template.AbilitySourceName = 'eAbilitySource_Item';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.Hostility = eHostility_Neutral;
    Template.bDisplayInUITacticalText = true;
	Template.bIsPassive = true;    

    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	//===This section covers the non-permenent effects===

	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.ImmuneTypes.AddItem('Poison');
	DamageImmunity.ImmuneTypes.AddItem('Acid');
	DamageImmunity.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.ParthenogenicPoisonType);
	DamageImmunity.BuildPersistentEffect(1, true, false, false);
	DamageImmunity.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), "img:///UILibrary_SavageItems.UIPerk_Serums", , , Template.AbilitySourceName);
	Template.AddTargetEffect(DamageImmunity);

	RegenerationEffect = new class'X2Effect_Regeneration';
	RegenerationEffect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	RegenerationEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	RegenerationEffect.HealAmount = 1;
	RegenerationEffect.MaxHealAmount = 6;
	RegenerationEffect.DuplicateResponse = eDupe_Allow;
	RegenerationEffect.HealthRegeneratedName = 'SerumGreenExposureHealthRegenerated';
	RegenerationEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(RegenerationEffect);

	//===This section covers the permenent stat effects===
	// Permenant Dodge
	PermenantMainBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMainBoostEffect.AddStatChange(eStat_Dodge, 2);
	PermenantMainBoostEffect.ApplyChance = 60;	
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_Dodge, 55, eCheck_LessThan);
	PermenantMainBoostEffect.TargetConditions.AddItem(MaxStatCondition);
	Template.AddTargetEffect(PermenantMainBoostEffect);

	// Permenant Offence
	PermenantMinorBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorBoostEffect.AddStatChange(eStat_Offense, 1);
	PermenantMinorBoostEffect.ApplyChance = 40;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_Offense, 85, eCheck_LessThan);
	PermenantMinorBoostEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMinorBoostEffect);

	// Permenant Mobility reduction
	PermenantMinorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorNerfEffect.AddStatChange(eStat_Mobility, -1);
	PermenantMinorNerfEffect.ApplyChance = 15;
	MaxStatCondition3 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition3.AddCheckStat(eStat_Mobility, 8, eCheck_GreaterThan);
	PermenantMinorNerfEffect.TargetConditions.AddItem(MaxStatCondition3);
	Template.AddTargetEffect(PermenantMinorNerfEffect);

	// Permenant Crit Chance reduction
	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_CritChance, -2);
	PermenantMajorNerfEffect.ApplyChance = 40;
	MaxStatCondition4 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition4.AddCheckStat(eStat_CritChance, -19, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition4);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

	//===This section covers the miscellaneous effects===
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeSerum';
	ConsumeItemTrigger.ApplyChance = 10;
	Template.AddTargetEffect(ConsumeItemTrigger);

	SavWillossEffect = new class'X2Effect_SavWillLoss';
	SavWillossEffect.WillMod = -2;
	Template.AddTargetEffect(SavWillossEffect);

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Serums";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.bSkipFireAction = true;
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    return Template;
}

static function X2AbilityTemplate SAVSerumGreenAcidBlood()
{
	local X2AbilityTemplate						Template;
	local X2Effect_ApplyWeaponDamage            DamageEffect;
	local X2AbilityTrigger_EventListener        EventTrigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVSerumGreenAcidBlood');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Defensive;
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Serums";//NEEDS ICONS!
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.EffectDamageValue.Damage = 1;
	DamageEffect.EffectDamageValue.Spread = 1;
	DamageEffect.EffectDamageValue.Shred = 1;
	DamageEffect.DamageTypes.AddItem('Acid');
	Template.AddTargetEffect(DamageEffect);

	Template.AddTargetEffect(class'X2StatusEffects'.static.CreateAcidBurningStatusEffect(2, 1));

	EventTrigger = new class'X2AbilityTrigger_EventListener';
	EventTrigger.ListenerData.EventID = 'AbilityActivated';
	EventTrigger.ListenerData.Filter = eFilter_None;
	EventTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.ScorchCircuits_AbilityActivated;
	Template.AbilityTriggers.AddItem(EventTrigger);

	Template.bSkipFireAction = true;
	Template.bShowActivation = true;
	Template.FrameAbilityCameraType = eCameraFraming_Never;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	//Template.MergeVisualizationFn = ScorchCircuits_VisualizationMerge;

	return Template;
}

static function X2AbilityTemplate SavAdministerSerumGreen()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local X2Effect_GrantActionPoints			ActionPointEffect;
	local XMBEffect_AddAbilityCharges			ChargesEffect;
	local X2Effect_RemoveEffectsByDamageType	RemoveEffects;
	local X2Effect_Regeneration					RegenerationEffect;
	local X2Effect_ApplyMedikitHeal				HealEffect;
	local XMBEffect_PermanentStatChange			PermenantMainBoostEffect, PermenantMinorBoostEffect, PermenantMinorNerfEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition, MaxStatCondition2, MaxStatCondition3, MaxStatCondition4;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local X2Effect_SavWillLoss					SavWillossEffect;
	local X2Effect_Panicked						ObsessedEffect;
	local XMBEffect_ConditionalBonus			SerumGreenDummyEffect;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavAdministerSerumGreen');
		
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.bFreeCost = true; 
	ActionPointCost.iNumPoints = 1;
	
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;

	Template.AbilityCosts.AddItem(ActionPointCost);	
	Template.AbilityCosts.AddItem(AmmoCost);

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	//===This section covers the non-permenent effects===
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, 25);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	RegenerationEffect = new class'X2Effect_Regeneration';
	RegenerationEffect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	RegenerationEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	RegenerationEffect.HealAmount = 2;
	RegenerationEffect.DuplicateResponse = eDupe_Allow;
	RegenerationEffect.HealthRegeneratedName = 'SavSerumGreenHealthRegenerated';
	RegenerationEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(RegenerationEffect);

	RemoveEffects = new class'X2Effect_RemoveEffectsByDamageType';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.StunnedName);
	RemoveEffects.DamageTypesToRemove.AddItem('Bleeding');
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.BlindedName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	Template.AddTargetEffect(RemoveEffects);

	HealEffect = new class'X2Effect_ApplyMedikitHeal';
	HealEffect.PerUseHP = 6;
	Template.AddTargetEffect(HealEffect);

	ActionPointEffect = new class'X2Effect_GrantActionPoints';
	ActionPointEffect.NumActionPoints = 1;
	ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
	Template.AddTargetEffect(ActionPointEffect);

	ChargesEffect = new class'XMBEffect_AddAbilityCharges';
	ChargesEffect.AbilityNames.AddItem('SAVSerumGreenPoisonSpit');
	ChargesEffect.BonusCharges = 3;
	ChargesEffect.MaxCharges = 3;
	Template.AddTargetEffect(ChargesEffect);

	//===This section covers the permenent stat effects===
	// Permenant Dodge
	PermenantMainBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMainBoostEffect.AddStatChange(eStat_Dodge, 5);
	PermenantMainBoostEffect.ApplyChance = 90;	
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_Dodge, 90, eCheck_LessThan);
	PermenantMainBoostEffect.TargetConditions.AddItem(MaxStatCondition);
	Template.AddTargetEffect(PermenantMainBoostEffect);

	// Permenant Offence
	PermenantMinorBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorBoostEffect.AddStatChange(eStat_Offense, 3);
	PermenantMinorBoostEffect.ApplyChance = 60;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_Offense, 95, eCheck_LessThan);
	PermenantMinorBoostEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMinorBoostEffect);

	// Permenant Mobility reduction
	PermenantMinorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorNerfEffect.AddStatChange(eStat_Mobility, -1);
	PermenantMinorNerfEffect.ApplyChance = 40;
	MaxStatCondition3 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition3.AddCheckStat(eStat_Mobility, 7, eCheck_GreaterThan);
	PermenantMinorNerfEffect.TargetConditions.AddItem(MaxStatCondition3);
	Template.AddTargetEffect(PermenantMinorNerfEffect);

	// Permenant Crit Chance reduction
	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_CritChance, -5);
	PermenantMajorNerfEffect.ApplyChance = 75;
	MaxStatCondition4 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition4.AddCheckStat(eStat_CritChance, -30, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition4);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

//===This section covers the miscellaneous effects===
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeSerum';
	ConsumeItemTrigger.ApplyChance = 70;
	Template.AddTargetEffect(ConsumeItemTrigger);

	SavWillossEffect = new class'X2Effect_SavWillLoss';
	SavWillossEffect.WillMod = -4;
	Template.AddTargetEffect(SavWillossEffect);

	ObsessedEffect = class'X2StatusEffects'.static.CreateObsessedStatusEffect();
	ObsessedEffect.ApplyChance = 20;
	Template.AddTargetEffect(ObsessedEffect);

	SerumGreenDummyEffect = class'X2Effect_SavStimmedEffect'.static.CreateSavSerumGreenActiveEffect();
	Template.AddTargetEffect(SerumGreenDummyEffect);// spawns in icon and description and some FX hooks

	Template.Hostility = eHostility_Defensive;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Serums";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.ActivationSpeech = 'CombatStim';
	Template.bShowActivation = true;
	Template.CustomSelfFireAnim = 'FF_FireMedkitSelf';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

static function X2AbilityTemplate SAVSerumGreenPoisonSpit()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Cylinder     CylinderMultiTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2Effect_ApplyWeaponDamage		DamageEffect;
	local X2AbilityCooldown					Cooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVSerumGreenPoisonSpit');
	Template.bDontDisplayInAbilitySummary = false;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_poisonspit";

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.bFreeCost = true; 
	Template.AbilityCosts.AddItem(ActionPointCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 0;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;
	
	Template.AbilityToHitCalc = default.DeadEye;
	
	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.bIgnoreBaseDamage = false;
	DamageEffect.bBypassShields = false;
	DamageEffect.bIgnoreArmor = false;

	Template.AddMultiTargetEffect(DamageEffect);
	Template.AddMultiTargetEffect(class'X2StatusEffects'.static.CreatePoisonedStatusEffect());
	Template.AddMultiTargetEffect(new class'X2Effect_ApplyPoisonToWorld');

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	CylinderMultiTarget = new class'X2AbilityMultiTarget_Cylinder';
	CylinderMultiTarget.bUseWeaponRadius = false;
	CylinderMultiTarget.bIgnoreBlockingCover = true;
	CylinderMultiTarget.fTargetRadius = 5; 
	CylinderMultiTarget.fTargetHeight = 3;
	CylinderMultiTarget.bUseOnlyGroundTiles = true;
	Template.AbilityMultiTargetStyle = CylinderMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition); 
	Template.AddShooterEffectExclusions();

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);
	
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_poisonspit";
	Template.bUseAmmoAsChargesForHUD = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "GenericAccentCam";
	Template.TargetingMethod = class'X2TargetingMethod_ViperSpit';
	Template.CustomFireAnim = 'HL_SAVPoisonSpit';

	// This action is considered 'hostile' and can be interrupted!
	Template.Hostility = eHostility_Offensive;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	Template.bFrameEvenWhenUnitIsHidden = true;
	
	return Template;
}

static function X2AbilityTemplate SavEatRations()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2AbilityCooldown						Cooldown;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local X2Effect_Regeneration					RegenerationEffect;
	local X2Effect_SavWillLoss					SavWillGainEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavEatRations');
		
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.bFreeCost = true; 
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);	

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 2;
	Template.AbilityCooldown = Cooldown;

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	//===This section covers the non-permenent effects===
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(default.RATIONBAR_EFFECTS_DURATION, false, true, false, eGameRule_PlayerTurnEnd);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), "img:///UILibrary_SavageItems.UIPerk_EatRationBar", true, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, 1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Will, 10);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, 5);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	RegenerationEffect = new class'X2Effect_Regeneration';
	RegenerationEffect.BuildPersistentEffect(default.RATIONBAR_EFFECTS_DURATION, false, true, false, eGameRule_PlayerTurnEnd);
	RegenerationEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	RegenerationEffect.HealAmount = default.RATIONBAR_REGEN_AMOUNT;
	RegenerationEffect.MaxHealAmount = default.RATIONBAR_MAX_REGEN_AMOUNT;
	RegenerationEffect.DuplicateResponse = eDupe_Allow;
	RegenerationEffect.HealthRegeneratedName = 'FoodHealthRegenerated';
	RegenerationEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(RegenerationEffect);

//===This section covers the miscellaneous effects===
	SavWillGainEffect = new class'X2Effect_SavWillLoss';
	SavWillGainEffect.WillMod = +3;
	Template.AddTargetEffect(SavWillGainEffect);
	
	Template.bUseAmmoAsChargesForHUD = true;
	Template.Hostility = eHostility_Defensive;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_EatRationBar";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.bShowActivation = true;
	Template.CustomSelfFireAnim = 'HL_CallReinforcementsA';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

static function X2AbilityTemplate SavEatCOREBar()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2AbilityCooldown						Cooldown;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect, SkirmisherEffect;
	local X2Effect_Regeneration					RegenerationEffect;
	local X2Effect_SavWillLoss					SavWillGainEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition4;
	local XMBEffect_PermanentStatChange			PermenantMajorNerfEffect;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;
	local X2Condition_UnitProperty				SkirmCondition, ReaperCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavEatCOREBar');
		
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.bFreeCost = true; 
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);	

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 2;
	Template.AbilityCooldown = Cooldown;

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	SkirmCondition = new class'X2Condition_UnitProperty';
	SkirmCondition.ExcludeHostileToSource = true;
	SkirmCondition.ExcludeFriendlyToSource = false;
	SkirmCondition.RequireSoldierClasses.AddItem('Skirmisher');

	ReaperCondition = new class'X2Condition_UnitProperty';
	ReaperCondition.ExcludeHostileToSource = true;
	ReaperCondition.ExcludeFriendlyToSource = false;
	ReaperCondition.ExcludeSoldierClasses.AddItem('Reaper');
	Template.AbilityTargetConditions.AddItem(ReaperCondition);

	//===This section covers the non-permenent effects===
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(default.COREBAR_EFFECTS_DURATION, false, true, false, eGameRule_PlayerTurnEnd);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), "img:///UILibrary_SavageItems.UIPerk_EatRationBar", true, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, 1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, 1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Will, 10);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, 15);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	SkirmisherEffect = new class'X2Effect_PersistentStatChange';
	SkirmisherEffect.BuildPersistentEffect(default.COREBAR_EFFECTS_DURATION, false, true, false, eGameRule_PlayerTurnEnd);
	SkirmisherEffect.AddPersistentStatChange(eStat_Mobility, 1);
	SkirmisherEffect.AddPersistentStatChange(eStat_Will, 10);
	SkirmisherEffect.AddPersistentStatChange(eStat_Dodge, 10);
	SkirmisherEffect.TargetConditions.AddItem(SkirmCondition);
	Template.AddTargetEffect(SkirmisherEffect);

	RegenerationEffect = new class'X2Effect_Regeneration';
	RegenerationEffect.BuildPersistentEffect(default.COREBAR_EFFECTS_DURATION, false, true, false, eGameRule_PlayerTurnEnd);
	RegenerationEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	RegenerationEffect.HealAmount = default.RATIONBAR_REGEN_AMOUNT;
	RegenerationEffect.MaxHealAmount = default.COREBAR_MAX_REGEN_AMOUNT;
	RegenerationEffect.DuplicateResponse = eDupe_Allow;
	RegenerationEffect.HealthRegeneratedName = 'FoodHealthRegenerated';
	RegenerationEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(RegenerationEffect);

	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Will, -1);
	PermenantMajorNerfEffect.ApplyChance = 60;
	MaxStatCondition4 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition4.AddCheckStat(eStat_Will, 21, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition4);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

//===This section covers the miscellaneous effects===
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeCOREBar';
	ConsumeItemTrigger.ApplyChance = 12;
	Template.AddTargetEffect(ConsumeItemTrigger);

	SavWillGainEffect = new class'X2Effect_SavWillLoss';
	SavWillGainEffect.WillMod = +5;
	Template.AddTargetEffect(SavWillGainEffect);
	
	Template.bUseAmmoAsChargesForHUD = true;
	Template.Hostility = eHostility_Defensive;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_EatRationBar";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.bShowActivation = true;
	Template.CustomSelfFireAnim = 'HL_CallReinforcementsA';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

static function X2AbilityTemplate SavEatReaperBushMeat()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2AbilityCooldown						Cooldown;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect, ReaperEffect;
	local X2Effect_Regeneration					RegenerationEffect;
	local X2Effect_SavWillLoss					SavWillGainEffect;
	local X2Condition_UnitStatCheck				StatCon1, StatCon2, StatCon3, StatCon4;
	local XMBEffect_PermanentStatChange			PermenantStat_Psiup, PermenantStat_Aimup, PermenantStat_WillDn, PermenantStat_DefDn;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;
	local X2Condition_UnitProperty				SkirmCondition, ReaperCondition, ReaperImmunityCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavEatReaperBushMeat');
		
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.bFreeCost = true; 
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);	

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 3;
	Template.AbilityCooldown = Cooldown;

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	ReaperCondition = new class'X2Condition_UnitProperty';
	ReaperCondition.ExcludeHostileToSource = true;
	ReaperCondition.ExcludeFriendlyToSource = false;
	ReaperCondition.RequireSoldierClasses.AddItem('Reaper');

	SkirmCondition = new class'X2Condition_UnitProperty';
	SkirmCondition.ExcludeHostileToSource = true;
	SkirmCondition.ExcludeFriendlyToSource = false;
	SkirmCondition.ExcludeSoldierClasses.AddItem('Skirmisher');
	Template.AbilityTargetConditions.AddItem(SkirmCondition);

	ReaperImmunityCondition = new class'X2Condition_UnitProperty';
	ReaperImmunityCondition.ExcludeHostileToSource = true;
	ReaperImmunityCondition.ExcludeFriendlyToSource = false;
	ReaperImmunityCondition.ExcludeSoldierClasses.AddItem('Reaper');

	//===This section covers the non-permenent effects===
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(default.BUSHMEAT_EFFECTS_DURATION, false, true, false, eGameRule_PlayerTurnEnd);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), "img:///UILibrary_SavageItems.UIPerk_Reaper_BushMeat", true, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, 1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Offense, 3);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Will, -5);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, 15);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	ReaperEffect = new class'X2Effect_PersistentStatChange';
	ReaperEffect.BuildPersistentEffect(default.BUSHMEAT_EFFECTS_DURATION, false, true, false, eGameRule_PlayerTurnEnd);
	ReaperEffect.AddPersistentStatChange(eStat_Mobility, 1);
	ReaperEffect.AddPersistentStatChange(eStat_Offense, 5);
	ReaperEffect.AddPersistentStatChange(eStat_Will, 10);
	ReaperEffect.AddPersistentStatChange(eStat_Dodge, 15);
	ReaperEffect.TargetConditions.AddItem(ReaperCondition);
	Template.AddTargetEffect(ReaperEffect);

	RegenerationEffect = new class'X2Effect_Regeneration';
	RegenerationEffect.BuildPersistentEffect(default.BUSHMEAT_EFFECTS_DURATION, false, true, false, eGameRule_PlayerTurnEnd);
	RegenerationEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	RegenerationEffect.HealAmount = default.RATIONBAR_REGEN_AMOUNT;
	RegenerationEffect.MaxHealAmount = default.BUSHMEAT_MAX_REGEN_AMOUNT;
	RegenerationEffect.DuplicateResponse = eDupe_Allow;
	RegenerationEffect.HealthRegeneratedName = 'FoodHealthRegenerated';
	RegenerationEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(RegenerationEffect);

	PermenantStat_Psiup = new class'XMBEffect_PermanentStatChange';
	PermenantStat_Psiup.AddStatChange(eStat_PsiOffense, 3);
	PermenantStat_Psiup.ApplyChance = 25;
	StatCon1 = new class'X2Condition_UnitStatCheck';
	StatCon1.AddCheckStat(eStat_PsiOffense, 60, eCheck_LessThan);
	PermenantStat_Psiup.TargetConditions.AddItem(StatCon1);
	Template.AddTargetEffect(PermenantStat_Psiup);

	PermenantStat_Aimup = new class'XMBEffect_PermanentStatChange';
	PermenantStat_Aimup.AddStatChange(eStat_Offense, 3);
	PermenantStat_Aimup.ApplyChance = 25;
	StatCon2 = new class'X2Condition_UnitStatCheck';
	StatCon2.AddCheckStat(eStat_Offense, 95, eCheck_LessThan);
	PermenantStat_Aimup.TargetConditions.AddItem(StatCon2);
	Template.AddTargetEffect(PermenantStat_Aimup);

	PermenantStat_WillDn = new class'XMBEffect_PermanentStatChange';
	PermenantStat_WillDn.AddStatChange(eStat_Will, -1);
	PermenantStat_WillDn.ApplyChance = 20;
	StatCon3 = new class'X2Condition_UnitStatCheck';
	StatCon3.AddCheckStat(eStat_Will, 31, eCheck_GreaterThan);
	PermenantStat_WillDn.TargetConditions.AddItem(StatCon3);
	Template.AddTargetEffect(PermenantStat_WillDn);

	PermenantStat_DefDn = new class'XMBEffect_PermanentStatChange';
	PermenantStat_DefDn.AddStatChange(eStat_Defense, -2);
	PermenantStat_DefDn.AddStatChange(eStat_Dodge, 2);
	PermenantStat_DefDn.ApplyChance = 20;
	StatCon4 = new class'X2Condition_UnitStatCheck';
	StatCon4.AddCheckStat(eStat_Defense, -10, eCheck_GreaterThan);
	StatCon4.AddCheckStat(eStat_Dodge, 90, eCheck_LessThan);
	PermenantStat_DefDn.TargetConditions.AddItem(StatCon4);
	Template.AddTargetEffect(PermenantStat_DefDn);

//===This section covers the miscellaneous effects===
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeBushMeat';
	ConsumeItemTrigger.ApplyChance = 15;
	Template.AddTargetEffect(ConsumeItemTrigger);

	SavWillGainEffect = new class'X2Effect_SavWillLoss';
	SavWillGainEffect.WillMod = +10;
	SavWillGainEffect.TargetConditions.AddItem(ReaperCondition);
	Template.AddTargetEffect(SavWillGainEffect);
	
	Template.bUseAmmoAsChargesForHUD = true;
	Template.Hostility = eHostility_Defensive;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Reaper_BushMeat";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.bShowActivation = true;
	Template.CustomSelfFireAnim = 'HL_CallReinforcementsA';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

static function X2AbilityTemplate SavCombatDrug_Raptor()
{
    local X2AbilityTemplate						Template;
	local XMBEffect_ConditionalBonus			BonusEffect;
	local XMBEffect_PermanentStatChange			PermenantMinorNerfEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition1, MaxStatCondition2;
	local X2Effect_SavWillLoss					SavWillossEffect;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'SavCombatDrug_Raptor');

    Template.AbilitySourceName = 'eAbilitySource_Item';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.Hostility = eHostility_Neutral;
    Template.bDisplayInUITacticalText = true;
 	Template.bIsPassive = true;
    
    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	//===This section covers the non-permenent effects===
	BonusEffect = new class'XMBEffect_ConditionalBonus';
	BonusEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	BonusEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), "img:///UILibrary_SavageItems.UIPerk_SAVCombatDrugs_Pills", , , Template.AbilitySourceName);
	BonusEffect.AddToHitModifier(10);	
	BonusEffect.AddToHitModifier(15, eHit_Crit);
	Template.AddTargetEffect(BonusEffect);

	//===This section covers the permenent stat effects===
	// Permenant Aim reduction
	PermenantMinorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorNerfEffect.AddStatChange(eStat_Offense, -1);
	PermenantMinorNerfEffect.ApplyChance = 25;
	MaxStatCondition1 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition1.AddCheckStat(eStat_Offense, 35, eCheck_GreaterThan);
	PermenantMinorNerfEffect.TargetConditions.AddItem(MaxStatCondition1);
	Template.AddTargetEffect(PermenantMinorNerfEffect);

	// Permenant Will reduction
	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Will, -2);
	PermenantMajorNerfEffect.ApplyChance = 55;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_Will, 12, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

	//===This section covers the miscellaneous effects===
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeRaptor';
	ConsumeItemTrigger.ApplyChance = 15;
	Template.AddTargetEffect(ConsumeItemTrigger);

	SavWillossEffect = new class'X2Effect_SavWillLoss';
	SavWillossEffect.WillMod = -5;
	Template.AddTargetEffect(SavWillossEffect);

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_SAVCombatDrugs_Pills";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.bSkipFireAction = true;
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    return Template;
}

static function X2AbilityTemplate SavCombatDrug_Turbo()
{
    local X2AbilityTemplate						Template;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local XMBEffect_PermanentStatChange			PermenantMinorNerfEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition1, MaxStatCondition2;
	local X2Effect_ApplyWeaponDamage			WeaponDamageEffect;
	local X2Effect_ApplyMedikitHeal				HealEffect;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'SavCombatDrug_Turbo');

    Template.AbilitySourceName = 'eAbilitySource_Item';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.Hostility = eHostility_Neutral;
    Template.bDisplayInUITacticalText = true;
 	Template.bIsPassive = true;
    
    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	//===This section covers the non-permenent effects===
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), "img:///UILibrary_SavageItems.UIPerk_SAVCombatDrugs_Pills", , , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, 3);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, 20);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	//===This section covers the permenent stat effects===
	// Permenant Dodge reduction
	PermenantMinorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorNerfEffect.AddStatChange(eStat_Dodge, -2);
	PermenantMinorNerfEffect.ApplyChance = 25;
	MaxStatCondition1 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition1.AddCheckStat(eStat_Dodge, -25, eCheck_GreaterThan);
	PermenantMinorNerfEffect.TargetConditions.AddItem(MaxStatCondition1);
	Template.AddTargetEffect(PermenantMinorNerfEffect);

	// Permenant Will reduction
	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Will, -1);
	PermenantMajorNerfEffect.ApplyChance = 75;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_Will, 12, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

	//===This section covers the miscellaneous effects===

	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeTurbo';
	ConsumeItemTrigger.ApplyChance = 13;
	Template.AddTargetEffect(ConsumeItemTrigger);

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bBypassShields = true;
	WeaponDamageEffect.bIgnoreArmor = true;
	Template.AddTargetEffect(WeaponDamageEffect);

	HealEffect = new class'X2Effect_ApplyMedikitHeal';
	HealEffect.PerUseHP = 2;
	Template.AddTargetEffect(HealEffect);

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_SAVCombatDrugs_Pills";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.bSkipFireAction = true;
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    return Template;
}

static function X2AbilityTemplate SavCombatDrug_Klarity()
{
    local X2AbilityTemplate						Template;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local XMBEffect_PermanentStatChange			PermenantMinorNerfEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition1, MaxStatCondition2;
	local X2Effect_ApplyWeaponDamage			WeaponDamageEffect;
	local X2Effect_ApplyMedikitHeal				HealEffect;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'SavCombatDrug_Klarity');

    Template.AbilitySourceName = 'eAbilitySource_Item';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.Hostility = eHostility_Neutral;
    Template.bDisplayInUITacticalText = true;
	Template.bIsPassive = true; 
    
    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	//===This section covers the non-permenent effects===
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), "img:///UILibrary_SavageItems.UIPerk_SAVCombatDrugs_Pills", , , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Will, 30);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Defense, 5);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Offense, 5);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	//===This section covers the permenent stat effects===
	// Permenant Aim reduction
	PermenantMinorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMinorNerfEffect.AddStatChange(eStat_Offense, -1);
	PermenantMinorNerfEffect.AddStatChange(eStat_Defense, -1);
	PermenantMinorNerfEffect.ApplyChance = 20;
	MaxStatCondition1 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition1.AddCheckStat(eStat_Offense, 30, eCheck_GreaterThan);
	MaxStatCondition1.AddCheckStat(eStat_Defense, -10, eCheck_GreaterThan);
	PermenantMinorNerfEffect.TargetConditions.AddItem(MaxStatCondition1);
	Template.AddTargetEffect(PermenantMinorNerfEffect);

	// Permenant Will reduction
	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Will, -2);
	PermenantMajorNerfEffect.ApplyChance = 85;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_Will, 6, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

	//===This section covers the miscellaneous effects===
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeKlarity';
	ConsumeItemTrigger.ApplyChance = 10;
	Template.AddTargetEffect(ConsumeItemTrigger);

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bBypassShields = true;
	WeaponDamageEffect.bIgnoreArmor = true;
	Template.AddTargetEffect(WeaponDamageEffect);

	HealEffect = new class'X2Effect_ApplyMedikitHeal';
	HealEffect.PerUseHP = 1;
	Template.AddTargetEffect(HealEffect);

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_SAVCombatDrugs_Pills";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.bSkipFireAction = true;
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    return Template;
}

static function X2AbilityTemplate SavKlarityClense()
{
	local X2AbilityTemplate						Template;
	local X2Effect_RemoveEffectsByDamageType	RemoveEffectsStatus;
	
	// Create a triggered ability that runs at the end of the player's turn
	Template = SelfTargetTrigger('SavKlarityClense', "img:///UILibrary_SavageItems.UIPerk_SAVCombatDrugs_Pills", true, none, 'PlayerTurnEnded', eFilter_Player);

	// Trigger abilities don't appear as passives. Add a passive ability icon.
	Template.Hostility = eHostility_Neutral;
	
	RemoveEffectsStatus = new class'X2Effect_RemoveEffectsByDamageType';
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.PanickedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.StunnedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.DazedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.ObsessedName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.BerserkName);
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.ShatteredName);
	Template.AddTargetEffect(RemoveEffectsStatus);

	return Template;
}

////SAVInjectRedHaze - The activate drug ability
//Gives X2Effect_RedHaze a permenent (rest of tactical) effect that indicates the drug was taken.
static function X2AbilityTemplate CreateSAVInjectRedHaze()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local XMBEffect_PermanentStatChange			PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition;
	local X2Effect_SavWillLoss					SavWillLossEffect;
	local X2Effect_Persistent					BleedingEffect;
	local X2Effect_Panicked						RedMistBerserkEffect;
	local XMBEffect_AddAbilityCharges			ChargesEffect;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVInjectRedHaze');
		
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	//===This section covers the non-permenent effects===
	// Permenant Will reduction
	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Will, -3);
	PermenantMajorNerfEffect.ApplyChance = 75;
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_Will, 12, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

	//===This section covers the miscellaneous effects===
	SavWillLossEffect = new class'X2Effect_SavWillLoss';
	SavWillLossEffect.WillMod = -6;
	Template.AddTargetEffect(SavWillLossEffect);
		
	BleedingEffect = class'X2StatusEffects'.static.CreateBleedingStatusEffect(4, 1);
	BleedingEffect.ApplyChance = 10;
	Template.AddTargetEffect(BleedingEffect);

	Template.AddTargetEffect(class'X2StatusEffects'.static.CreateDoNotConsumeStatusEffect());

	RedMistBerserkEffect = class'X2StatusEffects_SAVItems'.static.CreateSAVRedMistBerserkStatusEffect();
	RedMistBerserkEffect.ApplyChance = 100;
	Template.AddTargetEffect(RedMistBerserkEffect);

	//triggers the consume ability
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeRedHaze';
	ConsumeItemTrigger.ApplyChance = 15;
	Template.AddTargetEffect(ConsumeItemTrigger);

	ChargesEffect = new class'XMBEffect_AddAbilityCharges';
	ChargesEffect.AbilityNames.AddItem('SAVRedHazeGetMad');
	ChargesEffect.BonusCharges = 2;
	Template.AddTargetEffect(ChargesEffect);

	Template.bUseAmmoAsChargesForHUD = true;
	Template.Hostility = eHostility_Defensive;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_combatstims";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.AbilityConfirmSound = "Panic_Check_Start";
	Template.ActivationSpeech = 'PanicScream';
	Template.bShowActivation = true;
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = SavInjectCombatDrug_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

////SAVRedHazeGetMad - Causes Berserk
static function X2AbilityTemplate CreateSAVRedHazeGetMad()
{
	local X2AbilityTemplate                		Template;	
	local X2AbilityCost_ActionPoints        	ActionPointCost;
	local X2AbilityCharges						Charges;
	local X2AbilityCost_Charges					ChargeCost;
	local X2AbilityCooldown						Cooldown;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local X2Effect_Panicked						RedMistBerserkEffect;
	local X2Effect_SavWillLoss					SavWillLossEffect;
	local X2Effect_Persistent					BleedingEffect;
//	local XMBEffect_DoNotConsumeAllPoints		NTEEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVRedHazeGetMad');
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
		
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 0;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	SavWillLossEffect = new class'X2Effect_SavWillLoss';
	SavWillLossEffect.WillMod = -2;
	Template.AddTargetEffect(SavWillLossEffect);
		
	BleedingEffect = class'X2StatusEffects'.static.CreateBleedingStatusEffect(4, 1);
	BleedingEffect.ApplyChance = 15;
	Template.AddTargetEffect(BleedingEffect);

	Template.AddTargetEffect(class'X2StatusEffects'.static.CreateDoNotConsumeStatusEffect());

	RedMistBerserkEffect = class'X2StatusEffects_SAVItems'.static.CreateSAVRedMistBerserkStatusEffect();
	RedMistBerserkEffect.ApplyChance = 100;
	Template.AddTargetEffect(RedMistBerserkEffect);

	Template.Hostility = eHostility_Offensive;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.0_4_Perks.RedHazeGetMad";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.AbilityConfirmSound = "Panic_Check_Start";
	Template.bShowActivation = true;
	Template.ActivationSpeech = 'PanicScream';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = SavInjectCombatDrug_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

static function X2AbilityTemplate CreateSAVInjectListon()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local XMBEffect_PermanentStatChange			PermenantMajorBuffEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition, MaxStatCondition2;
	local X2Effect_SavWillLoss					SavWillLossEffect;
	local X2Effect								StunnedEffect;
	local XMBEffect_AddAbilityCharges			ChargesEffect;
	local XMBEffect_ConditionalBonus			MeleeEffect;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local XMBCondition_AbilityProperty			Condition;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVInjectListon');
		
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	//===This section covers the non-permenent effects===
	// Permenant Will reduction
	PermenantMajorBuffEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorBuffEffect.AddStatChange(eStat_Strength, 2);
	PermenantMajorBuffEffect.ApplyChance = 70;
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_Strength, 125, eCheck_LessThan);
	PermenantMajorBuffEffect.TargetConditions.AddItem(MaxStatCondition);
	Template.AddTargetEffect(PermenantMajorBuffEffect);

	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Will, -3);
	PermenantMajorNerfEffect.ApplyChance = 85;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_Will, 13, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

	//===This section covers the miscellaneous effects===
	MeleeEffect = new class'XMBEffect_ConditionalBonus';
	MeleeEffect.BuildPersistentEffect(3, false, true, false, eGameRule_PlayerTurnBegin);
	MeleeEffect.AddToHitModifier(20);
	MeleeEffect.AddToHitModifier(30, eHit_Crit);
	MeleeEffect.AddDamageModifier(2, eHit_Crit);
	Condition = new class'XMBCondition_AbilityProperty';
	Condition.bRequireMelee = true;
	MeleeEffect.AbilityTargetConditions.AddItem(Condition);
	Template.AddTargetEffect(MeleeEffect);

	//triggers the consume ability
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumeListon';
	ConsumeItemTrigger.ApplyChance = 13;
	Template.AddTargetEffect(ConsumeItemTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = 'ListonStatBoost';
	PersistentStatChangeEffect.BuildPersistentEffect(3, false, true, false, eGameRule_PlayerTurnBegin);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Strength, 20);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, 2);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	SavWillLossEffect = new class'X2Effect_SavWillLoss';
	SavWillLossEffect.WillMod = -5;
	Template.AddTargetEffect(SavWillLossEffect);
		
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 20, false);
	Template.AddTargetEffect(StunnedEffect);

	ChargesEffect = new class'XMBEffect_AddAbilityCharges';
	ChargesEffect.AbilityNames.AddItem('SavListonSmash');
	ChargesEffect.BonusCharges = 3;
	Template.AddTargetEffect(ChargesEffect);

	Template.bUseAmmoAsChargesForHUD = true;
	Template.Hostility = eHostility_Defensive;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_combatstims";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.ActivationSpeech = 'CombatStim';
	Template.bShowActivation = true;
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = SavInjectCombatDrug_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

//The Melee Attack granted by the Drug
static function X2AbilityTemplate CreateSavListonSmash()
{
	local X2AbilityTemplate							Template;
	local X2AbilityCharges							Charges;
	local X2AbilityCost_Charges						ChargeCost;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit   StatContest;
	local X2Effect_SavWillLoss						SavWillLossEffect;
	local X2Effect_ApplyWeaponDamage				WeaponDamageEffect;
	local X2Effect_Persistent						DisorientedEffect;
	local X2Effect_Stunned							StunnedEffect, StunnedEffect2, StunnedEffect3;
	
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.DamageTypes.AddItem('Melee');
	
	Template = MeleeAttack('SavListonSmash', "img:///UILibrary_SavageItems.0_4_Perks.ListonPunch", true, , class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY, eCost_Free);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 0;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	AddCooldown(Template, 1);

	SavWillLossEffect = new class'X2Effect_SavWillLoss';
	SavWillLossEffect.WillMod = -2;
	Template.AddTargetEffect(SavWillLossEffect);

	// This will be a stat contest
	StatContest = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatContest.AttackerStat = eStat_Strength;
	StatContest.DefenderStat = eStat_Strength;
	StatContest.BaseValue = 90;
	Template.AbilityToHitCalc = StatContest;

	// On hit effects
	//  Stunned effect for 1 or 2 unblocked hit
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect(, , false);
	DisorientedEffect.MinStatContestResult = 1;
	DisorientedEffect.MaxStatContestResult = 0;
	DisorientedEffect.bRemoveWhenSourceDies = false;
	Template.AddTargetEffect(DisorientedEffect);

	//  Stunned effect for 3 or 4 unblocked hit
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 100, false);
	StunnedEffect.MinStatContestResult = 2;
	StunnedEffect.MaxStatContestResult = 3;
	StunnedEffect.bRemoveWhenSourceDies = false;
	Template.AddTargetEffect(StunnedEffect);

	//  Stunned effect for 3 or 4 unblocked hit
	StunnedEffect2 = class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, 100, false);
	StunnedEffect2.MinStatContestResult = 4;
	StunnedEffect2.MaxStatContestResult = 4;
	StunnedEffect2.bRemoveWhenSourceDies = false;
	Template.AddTargetEffect(StunnedEffect2);

	//  Stunned effect for 3 or 4 unblocked hit
	StunnedEffect3 = class'X2StatusEffects'.static.CreateStunnedStatusEffect(4, 100, false);
	StunnedEffect3.MinStatContestResult = 5;
	StunnedEffect3.MaxStatContestResult = 0;
	StunnedEffect3.bRemoveWhenSourceDies = false;
	Template.AddTargetEffect(StunnedEffect3);

	Template.CustomFireAnim = 'FF_RageStrikeA';

	return Template;
}

// The base ability which triggers all the other effects
static function X2AbilityTemplate CreateSAVInjectPsiko()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local XMBEffect_PermanentStatChange			PermenantMajorBuffEffect, PermenantMajorNerfEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition, MaxStatCondition2;
	local X2Effect_Panicked						PanicEffect;
	local XMBEffect_AddAbilityCharges			ChargesEffect;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVInjectPsiko');
		
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bReturnChargesError = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	//===This section covers the non-permenent effects===
	// Permenant PsiBoost
	PermenantMajorBuffEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorBuffEffect.AddStatChange(eStat_PsiOffense, 5);
	PermenantMajorBuffEffect.ApplyChance = 80;	
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_PsiOffense, 96, eCheck_LessThan);
	PermenantMajorBuffEffect.TargetConditions.AddItem(MaxStatCondition);
	Template.AddTargetEffect(PermenantMajorBuffEffect);

	PermenantMajorNerfEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMajorNerfEffect.AddStatChange(eStat_Will, -3);
	PermenantMajorNerfEffect.ApplyChance = 70;
	MaxStatCondition2 = new class'X2Condition_UnitStatCheck';
	MaxStatCondition2.AddCheckStat(eStat_Will, 6, eCheck_GreaterThan);
	PermenantMajorNerfEffect.TargetConditions.AddItem(MaxStatCondition2);
	Template.AddTargetEffect(PermenantMajorNerfEffect);

	//===This section covers the miscellaneous effects===
	PanicEffect = class'X2StatusEffects'.static.CreatePanickedStatusEffect();
	PanicEffect.ApplyChance = 20;
	Template.AddTargetEffect(PanicEffect);

	ChargesEffect = new class'XMBEffect_AddAbilityCharges';
	ChargesEffect.AbilityNames.AddItem('SAVPsikotikScream');
	ChargesEffect.BonusCharges = 4;
	Template.AddTargetEffect(ChargesEffect);

	//triggers the consume ability
	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ActivateSAVConsumePsiko';
	ConsumeItemTrigger.ApplyChance = 18;
	Template.AddTargetEffect(ConsumeItemTrigger);

	//Activates the passive
	Template.PostActivationEvents.AddItem('ActivateInjectPsikoEventName');

	Template.bUseAmmoAsChargesForHUD = true;
	Template.Hostility = eHostility_Defensive;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_combatstims";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.ActivationSpeech = 'CombatStim';
	Template.bShowActivation = true;
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = SavInjectCombatDrug_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

static function X2AbilityTemplate CreateSAVPsikotik()
{
	local X2AbilityTemplate 					Template;
	local X2Effect_SavWillLoss					SavWillLossEffect;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local XMBCondition_AbilityName				AbilityNameCondition;

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = 'Psikotik';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_PsiOffense, 20);
	PersistentStatChangeEffect.DuplicateResponse = eDupe_Allow;

	// Create the template using a helper function
	Template = SelfTargetTrigger('SAVPsikotik', "img:///UILibrary_SavageItems.0_4_Perks.PsikoEffect", false, PersistentStatChangeEffect, 'AbilityActivated');

	// Trigger abilities don't appear as passives. Add a passive ability icon.
	AddIconPassive(Template);
	Template.AbilitySourceName = 'eAbilitySource_Psionic';

	SavWillLossEffect = new class'X2Effect_SavWillLoss';
	SavWillLossEffect.WillMod = -5;
	AddSecondaryEffect(Template, SavWillLossEffect);

	// The bonus only applies to standard shots
	AbilityNameCondition = new class'XMBCondition_AbilityName';
	AbilityNameCondition.IncludeAbilityNames.AddItem('SAVInjectPsiko');
	AbilityNameCondition.IncludeAbilityNames.AddItem('SAVPsikotikScream');
	AddTriggerTargetCondition(Template, AbilityNameCondition);

	return Template;
}

//The Attack
static function X2AbilityTemplate CreateSAVPsikotikScream()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityCost_Charges				ChargeCost;
	local X2AbilityCharges					Charges;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Cone         ConeMultiTarget;
	local X2AbilityCooldown                 Cooldown;
	local X2Effect_ApplyWeaponDamage        DamageEffect, DamageEffect2;
	local X2Condition_UnitProperty			UnitPropertyCondition;
	local X2Condition_UnitImmunities		UnitImmunityCondition;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatCheck;
	local X2Effect_PersistentStatChange		DisorientedEffect;
	local X2Effect_Panicked					PanicEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVPsikotikScream');

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	ActionPointCost.bFreeCost = false; 
	Template.AbilityCosts.AddItem(ActionPointCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 0;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	ConeMultiTarget = new class'X2AbilityMultiTarget_Cone';
	ConeMultiTarget.bUseWeaponRadius = true;//PSIKO_IRADIUS=3
	ConeMultiTarget.bUseWeaponRangeForLength = true;//PSIKO_RANGE=15
	ConeMultiTarget.ConeEndDiameter = default.PSIKOTICSCREAM_TILE_WIDTH * class'XComWorldData'.const.WORLD_StepSize;//PSIKOTICSCREAM_TILE_WIDTH=6
	Template.AbilityMultiTargetStyle = ConeMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeRobotic = false;
	UnitPropertyCondition.FailOnNonUnits = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);	

	UnitImmunityCondition = new class'X2Condition_UnitImmunities';
	UnitImmunityCondition.AddExcludeDamageType('Mental');
	UnitImmunityCondition.bOnlyOnCharacterTemplate = true;
	Template.AbilityTargetConditions.AddItem(UnitImmunityCondition);

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.bIgnoreBaseDamage = true;
	DamageEffect.EnvironmentalDamageAmount = 20;
	DamageEffect.EffectDamageValue.Damage = 0;
	DamageEffect.EffectDamageValue.Spread = 0;
	DamageEffect.EffectDamageValue.PlusOne = 0;
	DamageEffect.EffectDamageValue.Pierce = 0;
	DamageEffect.DamageTypes.AddItem('Explosion');
	Template.AddMultiTargetEffect(DamageEffect);

	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.BaseValue = 75;
	Template.AbilityToHitCalc = StatCheck;

	DamageEffect2 = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect2.MinStatContestResult = 1;
	DamageEffect2.MaxStatContestResult = 0;
	DamageEffect2.bBypassShields = true;
	DamageEffect2.bIgnoreArmor = true;
	DamageEffect2.DamageTypes.AddItem('Psi');
	Template.AddMultiTargetEffect(DamageEffect2);
	
	//  Disorient effect for 1 unblocked psi hit
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	DisorientedEffect.iNumTurns = 2;
	DisorientedEffect.MinStatContestResult = 2;
	DisorientedEffect.MaxStatContestResult = 0;     
	DisorientedEffect.DamageTypes.AddItem('Mental');
	Template.AddTargetEffect(DisorientedEffect);
	
	//  Panic effect for 3-4 unblocked psi hits
	PanicEffect = class'X2StatusEffects'.static.CreatePanickedStatusEffect();
	PanicEffect.MinStatContestResult = 3;
	PanicEffect.MaxStatContestResult = 0;
	PanicEffect.DamageTypes.AddItem('Mental');
	Template.AddTargetEffect(PanicEffect);
	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;
	Template.IconImage = "img:///UILibrary_SavageItems.0_4_Perks.PsikoShout";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.bShowActivation = true;

	//Activates the passive
	Template.PostActivationEvents.AddItem('ActivatePsikotikScreamEventName');

	Template.TargetingMethod = class'X2TargetingMethod_Cone';

	Template.ActivationSpeech = 'VoidRift';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Psionic_FireAtLocation";

	Template.CustomFireAnim = 'HL_SAVPsikoticScream';

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	return Template;
}

simulated function SavInjectCombatDrug_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  Context;
	local StateObjectReference InteractingUnitRef;
	local VisualizationActionMetadata EmptyTrack;
	local VisualizationActionMetadata ActionMetadata;
	local X2Action_PlayAnimation PlayAnimationAction1, PlayAnimationAction2;
	local X2Action_PlaySoundAndFlyOver CharSpeechAction;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;

	//Configure the visualization track for the shooter
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	PlayAnimationAction1 = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	PlayAnimationAction1.Params.AnimName = 'HL_DazedStartA';

	CharSpeechAction = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(ActionMetadata, Context));
	CharSpeechAction.SetSoundAndFlyOverParameters(None, "", 'PanickedBreathing', eColor_Good);

	PlayAnimationAction2 = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	PlayAnimationAction2.Params.AnimName = 'HL_DazedStopA';
}

////SAVRedHazeSupply - Consumes the Item
static function X2AbilityTemplate CreateSAVRedHazeSupply()
{
	local X2AbilityTemplate						Template;
//	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger_EventListener		AbilityTrigger;
//	local XMBCondition_AbilityName 				AbilityNameCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVRedHazeSupply');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_SavageItems.0_4_Perks.LimitedSupplyNeedle";

	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityTargetStyle = default.SelfTarget;
//	TargetStyle = new class'X2AbilityTarget_Self';
//	Template.AbilityTargetStyle = TargetStyle;

//	Template.AbilityTriggers.Length = 0;

	AbilityTrigger = new class'X2AbilityTrigger_EventListener';
	AbilityTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	AbilityTrigger.ListenerData.EventID = 'ActivateSAVConsumeRedHaze';
	AbilityTrigger.ListenerData.Filter = eFilter_Unit;
	AbilityTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
	Template.AbilityTriggers.AddItem(AbilityTrigger);

	// The The main ability needs to trigger first though
/*	AbilityNameCondition = new class'XMBCondition_AbilityName';
	AbilityNameCondition.IncludeAbilityNames.AddItem('SAVInjectRedHaze');
	AddTriggerTargetCondition(Template, AbilityNameCondition);
*/
	Template.AbilityCosts.AddItem(new class'X2AbilityCost_ConsumeItem');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

////PsikoSupply - Consumes the Item
static function X2AbilityTemplate CreateSAVPsikoSupply()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTrigger_EventListener		AbilityTrigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVPsikoSupply');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_SavageItems.0_4_Perks.LimitedSupplyNeedle";

	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityTargetStyle = default.SelfTarget;

	AbilityTrigger = new class'X2AbilityTrigger_EventListener';
	AbilityTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	AbilityTrigger.ListenerData.EventID = 'ActivateSAVConsumePsiko';
	AbilityTrigger.ListenerData.Filter = eFilter_Unit;
	AbilityTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
	Template.AbilityTriggers.AddItem(AbilityTrigger);

	Template.AbilityCosts.AddItem(new class'X2AbilityCost_ConsumeItem');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

////ListonSupply - Consumes the Item
static function X2AbilityTemplate CreateSAVListonSupply()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTrigger_EventListener		AbilityTrigger;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVListonSupply');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_SavageItems.0_4_Perks.LimitedSupplyNeedle";

	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityTargetStyle = default.SelfTarget;

	AbilityTrigger = new class'X2AbilityTrigger_EventListener';
	AbilityTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	AbilityTrigger.ListenerData.EventID = 'ActivateSAVConsumeListon';
	AbilityTrigger.ListenerData.Filter = eFilter_Unit;
	AbilityTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
	Template.AbilityTriggers.AddItem(AbilityTrigger);

	Template.AbilityCosts.AddItem(new class'X2AbilityCost_ConsumeItem');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

//CONSUMPTION NEEDED - CORE BARS1x, Serums1x - Adjusted Ammo consumption 1x

//TURBO comdrugs
static function X2AbilityTemplate CreateSAVTurboSupply()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTrigger_EventListener		AbilityTrigger;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVTurboSupply');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_SAVCombatDrugs_Pills";

	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityTargetStyle = default.SelfTarget;

	AbilityTrigger = new class'X2AbilityTrigger_EventListener';
	AbilityTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	AbilityTrigger.ListenerData.EventID = 'ActivateSAVConsumeTurbo';
	AbilityTrigger.ListenerData.Filter = eFilter_Unit;
	AbilityTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
	Template.AbilityTriggers.AddItem(AbilityTrigger);

	Template.AbilityCosts.AddItem(new class'X2AbilityCost_ConsumeItem');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

//Raptor comdrugs
static function X2AbilityTemplate CreateSAVRaptorSupply()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTrigger_EventListener		AbilityTrigger;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVRaptorSupply');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_SAVCombatDrugs_Pills";

	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityTargetStyle = default.SelfTarget;

	AbilityTrigger = new class'X2AbilityTrigger_EventListener';
	AbilityTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	AbilityTrigger.ListenerData.EventID = 'ActivateSAVConsumeRaptor';
	AbilityTrigger.ListenerData.Filter = eFilter_Unit;
	AbilityTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
	Template.AbilityTriggers.AddItem(AbilityTrigger);

	Template.AbilityCosts.AddItem(new class'X2AbilityCost_ConsumeItem');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

//Klarity comdrugs
static function X2AbilityTemplate CreateSAVKlaritySupply()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTrigger_EventListener		AbilityTrigger;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVKlaritySupply');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_SAVCombatDrugs_Pills";

	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityTargetStyle = default.SelfTarget;

	AbilityTrigger = new class'X2AbilityTrigger_EventListener';
	AbilityTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	AbilityTrigger.ListenerData.EventID = 'ActivateSAVConsumeKlarity';
	AbilityTrigger.ListenerData.Filter = eFilter_Unit;
	AbilityTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
	Template.AbilityTriggers.AddItem(AbilityTrigger);

	Template.AbilityCosts.AddItem(new class'X2AbilityCost_ConsumeItem');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

//Use this for Core Bars
static function X2AbilityTemplate SavItemsPassiveConsumption1()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTrigger_EventListener		AbilityTrigger;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavItemsPassiveConsumption1');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_EatRationBar";

	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityTargetStyle = default.SelfTarget;

	AbilityTrigger = new class'X2AbilityTrigger_EventListener';
	AbilityTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	AbilityTrigger.ListenerData.EventID = 'ActivateSAVConsumeCOREBar';
	AbilityTrigger.ListenerData.Filter = eFilter_Unit;
	AbilityTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
	Template.AbilityTriggers.AddItem(AbilityTrigger);

	Template.AbilityCosts.AddItem(new class'X2AbilityCost_ConsumeItem');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

//Use this for Core Bars
static function X2AbilityTemplate SavItemsBushMeatConsumption()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTrigger_EventListener		AbilityTrigger;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavItemsBushMeatConsumption');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Reaper_BushMeat";

	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityTargetStyle = default.SelfTarget;

	AbilityTrigger = new class'X2AbilityTrigger_EventListener';
	AbilityTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	AbilityTrigger.ListenerData.EventID = 'ActivateSAVConsumeBushMeat';
	AbilityTrigger.ListenerData.Filter = eFilter_Unit;
	AbilityTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
	Template.AbilityTriggers.AddItem(AbilityTrigger);

	Template.AbilityCosts.AddItem(new class'X2AbilityCost_ConsumeItem');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

//Use this for Serums
static function X2AbilityTemplate SavItemsPassiveConsumption2()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTrigger_EventListener		AbilityTrigger;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavItemsPassiveConsumption2');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_combatstims";

	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityTargetStyle = default.SelfTarget;

	AbilityTrigger = new class'X2AbilityTrigger_EventListener';
	AbilityTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	AbilityTrigger.ListenerData.EventID = 'ActivateSAVConsumeSerum';
	AbilityTrigger.ListenerData.Filter = eFilter_Unit;
	AbilityTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
	Template.AbilityTriggers.AddItem(AbilityTrigger);

	Template.AbilityCosts.AddItem(new class'X2AbilityCost_ConsumeItem');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate ThrowPlasmaIED(name TemplateName)
{
	local X2AbilityTemplate						Template;	
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityTarget_Cursor				CursorTarget;
	local X2AbilityMultiTarget_Radius			RadiusMultiTarget;
//	local X2AbilityMultiTarget_ClaymoreRadius	RadiusMultiTarget;
	local X2Effect_PlasmaIED					PlasmaIEDEffect;
	local X2AbilityCharges						Charges;
	local X2AbilityCost_Charges					ChargeCost;
	local X2Effect_TriggerEvent					ConsumeItemTrigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);	
	
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 1;
	Template.AbilityCharges = Charges;
	
	Template.AbilityToHitCalc = default.DeadEye;
	
	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.FixedAbilityRange = default.PLASMAIEDABILITYRANGE;
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

//	RadiusMultiTarget = new class'X2AbilityMultiTarget_ClaymoreRadius';
	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	PlasmaIEDEffect = new class'X2Effect_PlasmaIED';
	PlasmaIEDEffect.BuildPersistentEffect(1, true, false, false);
	PlasmaIEDEffect.DestructibleArchetype = "SAV_PlasmaIED.ARC_PlasmaIED";
	Template.AddShooterEffect(PlasmaIEDEffect);

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.STANDARD_GRENADE_PRIORITY;
	
	Template.HideErrors.AddItem('AA_CannotAfford_Charges');

	Template.ConcealmentRule = eConceal_Always;

	Template.bShowActivation = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = ThrowPlasmaIED_BuildVisualization;
	Template.TargetingMethod = class'X2TargetingMethod_Grenade';
	Template.CinescriptCameraType = "StandardGrenadeFiring";
	Template.bAllowUnderhandAnim = true;

	Template.Hostility = eHostility_Neutral;
	Template.bFrameEvenWhenUnitIsHidden = true;

	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_ThrowPlasmaIED";
	Template.ActivationSpeech = 'claymore';
	Template.CustomFireAnim = 'FF_Grenade';
	Template.BuildAppliedVisualizationSyncFn = PlasmaIEDVisualizationSync;
	Template.DamagePreviewFn = PlasmaIEDDamagePreview;

	ConsumeItemTrigger = new class'X2Effect_TriggerEvent';
	ConsumeItemTrigger.TriggerEventName = 'ThrowPlasmaIEDEventName';
	ConsumeItemTrigger.ApplyChance = default.PLASMAIEDCONSUMPTION_APPLY_CHANCE;
	Template.AddTargetEffect(ConsumeItemTrigger);

	return Template;	
}

function bool PlasmaIEDDamagePreview(XComGameState_Ability AbilityState, StateObjectReference TargetRef, out WeaponDamageValue MinDamagePreview, out WeaponDamageValue MaxDamagePreview, out int AllowsShield)
{
	//	Conveniently, the homing mine damage is exactly the same as the claymore damage, so we'll just use those easily grabbed values.
/*	if (AbilityState.GetMyTemplateName() == 'ThrowShrapnel')
	{
		MinDamagePreview = default.HomingShrapnelDamage;
	}
	else
	{
		MinDamagePreview = default.HomingMineDamage;
	}*/
	MaxDamagePreview = MinDamagePreview;
	return true;
}

function PlasmaIEDVisualizationSync(name EffectName, XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata)
{
	local XComGameState_Effect EffectState;
	local XComGameStateHistory History;
	local XComGameState_Destructible DestructibleState;
	local XComDestructibleActor DestructibleInstance;
	local X2Effect_Claymore		PlasmaIEDEffect;

	History = `XCOMHISTORY;
	foreach History.IterateByClassType(class'XComGameState_Effect', EffectState)
	{
		PlasmaIEDEffect = X2Effect_Claymore(EffectState.GetX2Effect());
		if (PlasmaIEDEffect != none)
		{
			DestructibleState = XComGameState_Destructible(History.GetGameStateForObjectID(EffectState.CreatedObjectReference.ObjectID));
			DestructibleInstance = XComDestructibleActor(DestructibleState.FindOrCreateVisualizer());
			if (DestructibleInstance != none)
			{
				DestructibleInstance.TargetingIcon = PlasmaIEDEffect.TargetingIcon;
			}
		}
	}
}

function ThrowPlasmaIED_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameState_Destructible DestructibleState;
	local VisualizationActionMetadata ActionMetadata;

	TypicalAbility_BuildVisualization(VisualizeGameState);

	foreach VisualizeGameState.IterateByClassType(class'XComGameState_Destructible', DestructibleState)
	{
		break;
	}
	`assert(DestructibleState != none);

	ActionMetadata.StateObject_NewState = DestructibleState;
	ActionMetadata.StateObject_OldState = DestructibleState;
	ActionMetadata.VisualizeActor = `XCOMHISTORY.GetVisualizer(DestructibleState.ObjectID);

	class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, VisualizeGameState.GetContext(), false, ActionMetadata.LastActionAdded);
	class'X2Action_ShowSpawnedDestructible'.static.AddToVisualizationTree(ActionMetadata, VisualizeGameState.GetContext(), false, ActionMetadata.LastActionAdded);
}


static function X2AbilityTemplate CreateSAVPlasmaIEDSupply()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTrigger_EventListener		AbilityTrigger;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'PlasmaIEDSupply');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_ThrowPlasmaIED";
	
	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityTargetStyle = default.SelfTarget;

	AbilityTrigger = new class'X2AbilityTrigger_EventListener';
	AbilityTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	AbilityTrigger.ListenerData.EventID = 'ThrowPlasmaIEDEventName';
	AbilityTrigger.ListenerData.Filter = eFilter_Unit;
	AbilityTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
	Template.AbilityTriggers.AddItem(AbilityTrigger);

	Template.AbilityCosts.AddItem(new class'X2AbilityCost_ConsumeItem');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate SAVReaperRemoteDetonator()
{
	local X2AbilityTemplate				Template;
	local X2AbilityCost_ActionPoints	ActionPointCost;
	local X2Effect_RemoteStart			RemoteStartEffect;
	local X2AbilityCost_Ammo			AmmoCost;
	local X2AbilityCooldown				Cooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVReaperRemoteDetonator');
		
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Offensive;

	Template.SuperConcealmentLoss = 0;
	Template.ConcealmentRule = eConceal_Always;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityTargetStyle = new class'X2AbilityTarget_RemoteStart';
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	Template.AddShooterEffectExclusions();

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 5;
	Template.AbilityCooldown = Cooldown;

	RemoteStartEffect = new class'X2Effect_RemoteStart';
	RemoteStartEffect.UnitDamageMultiplier = 2.0f;
	RemoteStartEffect.DamageRadiusMultiplier = 2.0f;
	Template.AddTargetEffect(RemoteStartEffect);

	Template.bUseAmmoAsChargesForHUD = true;
	Template.bLimitTargetIcons = true;
	Template.DamagePreviewFn = SAVRemoteStartDamagePreview;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.TargetingMethod = class'X2TargetingMethod_RemoteStart';
	
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
//BEGIN AUTOGENERATED CODE: Template Overrides 'RemoteStart'
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Reaper_RemoteDetonate";
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.ActivationSpeech = 'Explosion';
	Template.CustomFireAnim = 'HL_CallReinforcementsA';
//END AUTOGENERATED CODE: Template Overrides 'RemoteStart'

	return Template;
}

function bool SAVRemoteStartDamagePreview(XComGameState_Ability AbilityState, StateObjectReference TargetRef, out WeaponDamageValue MinDamagePreview, out WeaponDamageValue MaxDamagePreview, out int AllowsShield)
{
	local XComDestructibleActor DestructibleActor;
	local XComDestructibleActor_Action_RadialDamage DamageAction;
	local int i;

	DestructibleActor = XComDestructibleActor(`XCOMHISTORY.GetVisualizer(TargetRef.ObjectID));
	if (DestructibleActor != none)
	{
		for (i = 0; i < DestructibleActor.DestroyedEvents.Length; ++i)
		{
			if (DestructibleActor.DestroyedEvents[i].Action != None)
			{
				DamageAction = XComDestructibleActor_Action_RadialDamage(DestructibleActor.DestroyedEvents[i].Action);
				if (DamageAction != none)
				{
					MinDamagePreview.Damage += DamageAction.UnitDamage * 2.0f;
					MaxDamagePreview.Damage += DamageAction.UnitDamage * 2.0f;
				}
			}
		}
	}

	return true;
}

/////////////////////////////////////////////////////////////////////////////////////////NanoClonerStuff :(
static function X2AbilityTemplate CreateFireNanoCloner()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2Condition_UnitProperty			TargetPropertyCondition;
	local X2Effect_SpawnNanoCloneUnit		SpawnNanoCloneEffect;
	local X2Condition_UnitValue				UnitValue;	
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'FireNanoCloner');
	// Icon Properties
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_lightninghands";//================================NEEDS NEW ICON
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_MAJOR_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.DisplayTargetHitChance = true;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	// Activated by a button press; additionally, tells the AI this is an activatable
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
// Targeting Method
	Template.TargetingMethod = class'X2TargetingMethod_OverTheShoulder';
	Template.bUsesFiringCamera = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.MergeVisualizationFn = NanoClone_MergeVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.CinescriptCameraType = "StandardGunFiring";
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.ActivationSpeech = 'LightningHands';

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 5;
	Template.AbilityCharges = Charges;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.bAllowAmmoEffects = true; // 	
	Template.bAllowBonusWeaponEffects = true;

	// Hit Calculation (Different weapons now have different calculations for range)
	Template.AbilityToHitCalc = default.SimpleStandardAim;
	Template.AbilityToHitOwnerOnMissCalc = default.SimpleStandardAim;

	// *** VALIDITY CHECKS *** //
	//  Normal effect restrictions (except disoriented)
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	Template.AddShooterEffectExclusions(SkipExclusions);
	// Targeting Details
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	// Damage Effect
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddTargetEffect(WeaponDamageEffect);

	SpawnNanoCloneEffect = new class'X2Effect_SpawnNanoCloneUnit';
	SpawnNanoCloneEffect.BuildPersistentEffect(1);
	SpawnNanoCloneEffect.DamageTypes.AddItem('NanoShred');

	TargetPropertyCondition = new class'X2Condition_UnitProperty';
	TargetPropertyCondition.ExcludeDead = false;
	TargetPropertyCondition.ExcludeAlive = true;
	TargetPropertyCondition.ExcludeRobotic = true;
	TargetPropertyCondition.ExcludeOrganic = false;
	TargetPropertyCondition.ExcludeAlien = true;
	TargetPropertyCondition.ExcludeCivilian = false;
	TargetPropertyCondition.ExcludeCosmetic = true;
	TargetPropertyCondition.ExcludeFriendlyToSource = true;
	TargetPropertyCondition.ExcludeHostileToSource = false;
	TargetPropertyCondition.FailOnNonUnits = true;
	SpawnNanoCloneEffect.TargetConditions.AddItem(TargetPropertyCondition);

	UnitValue = new class'X2Condition_UnitValue';
	UnitValue.AddCheckValue(class'X2Effect_SpawnNanoCloneUnit'.default.NanocloneTurned, 1, eCheck_LessThan);
	SpawnNanoCloneEffect.TargetConditions.AddItem(UnitValue);
	
	Template.AddTargetEffect(SpawnNanoCloneEffect);
	// DO NOT CHANGE THE ORDER OF THE DAMAGE AND THIS EFFECT
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = NanoClone_BuildVisualization;

	// MAKE IT LIVE!
	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	return Template;
}

simulated function NanoClone_MergeVisualization(X2Action BuildTree, out X2Action VisualizationTree)
{
	local XComGameStateContext_Ability MyAbilityContext;
	local XComGameStateContext_Ability TestAbilityContext;
	local XComGameStateVisualizationMgr VisMgr;
	local X2Action_ExitCover MyExitCover;
	local X2Action_Fire MyFireAction;
	local Array<X2Action> TestActions;
	local X2Action_ExitCover DrivingExitCover;
	local X2Action_Fire DrivingFireAction;
	local int ActionIndex;
	local bool bMergedAlready;
	local XComGameState_Unit TargetGameState;
	local int DamageResultIndex;
	local X2Action_ApplyWeaponDamageToUnit DrivingApplyWeaponDamageToUnit;
	local X2Action TestMarkerAction;
	local X2Action_MarkerNamed CameraReplaceAction;

	VisMgr = `XCOMVISUALIZATIONMGR;

	MyAbilityContext = XComGameStateContext_Ability(BuildTree.StateChangeContext);
	if( MyAbilityContext.bSkipAdditionalVisualizationSteps )
	{
		// we only need one LookAt, so replace all the others with filler
		if( VisualizationTree != None )
		{
			VisMgr.GetNodesOfType(BuildTree, class'X2Action_CameraLookAt', TestActions);
			foreach TestActions(TestMarkerAction)
			{
				CameraReplaceAction = X2Action_MarkerNamed(class'X2Action_MarkerNamed'.static.CreateVisualizationAction(MyAbilityContext));
				CameraReplaceAction.SetName("LostAttackCameraLookAtReplacement");
				VisMgr.ReplaceNode(CameraReplaceAction, TestMarkerAction);
			}
		}

		MyExitCover = X2Action_ExitCover(VisMgr.GetNodeOfType(BuildTree, class'X2Action_ExitCover', , MyAbilityContext.InputContext.SourceObject.ObjectID));
		MyFireAction = X2Action_Fire(VisMgr.GetNodeOfType(BuildTree, class'X2Action_Fire', , MyAbilityContext.InputContext.SourceObject.ObjectID));
		
		// Jwats: Line up the Exit Covers
		VisMgr.GetNodesOfType(VisualizationTree, class'X2Action_ExitCover', TestActions);
		for( ActionIndex = 0; ActionIndex < TestActions.Length; ++ActionIndex )
		{
			TestAbilityContext = XComGameStateContext_Ability(TestActions[ActionIndex].StateChangeContext);
			if( TestAbilityContext != None && !TestAbilityContext.bSkipAdditionalVisualizationSteps )
			{
				DrivingExitCover = X2Action_ExitCover(TestActions[ActionIndex]);
				VisMgr.DisconnectAction(MyExitCover);
				VisMgr.ConnectAction(MyExitCover, VisualizationTree, false, None, TestActions[ActionIndex].ParentActions);
				bMergedAlready = true;
				break;
			}
		}

		// Jwats: Find the driving fire action
		VisMgr.GetNodesOfType(VisualizationTree, class'X2Action_Fire', TestActions);
		for( ActionIndex = 0; ActionIndex < TestActions.Length; ++ActionIndex )
		{
			TestAbilityContext = XComGameStateContext_Ability(TestActions[ActionIndex].StateChangeContext);
			if( TestAbilityContext != None && !TestAbilityContext.bSkipAdditionalVisualizationSteps )
			{
				DrivingFireAction = X2Action_Fire(TestActions[ActionIndex]);
				break;
			}
		}

		// Jwats: Now Make sure both fires wait for both exit covers
		TestActions.Length = 0;
		TestActions.AddItem(MyExitCover);
		TestActions.AddItem(DrivingExitCover);
		VisMgr.ConnectAction(MyFireAction, VisualizationTree, false, , TestActions);
		VisMgr.ConnectAction(DrivingFireAction, VisualizationTree, false, , TestActions);

		// bsg-blittrell: Find the driving "X2Action_ApplyWeaponDamageToUnit", and add our damage to it
		VisMgr.GetNodesOfType(VisualizationTree, class'X2Action_ApplyWeaponDamageToUnit', TestActions);
		TargetGameState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(MyAbilityContext.InputContext.PrimaryTarget.ObjectID));
		for( ActionIndex = 0; ActionIndex < TestActions.Length; ++ActionIndex )
		{
			TestAbilityContext = XComGameStateContext_Ability(TestActions[ActionIndex].StateChangeContext);
			if( TestAbilityContext != None && !TestAbilityContext.bSkipAdditionalVisualizationSteps )
			{
				DrivingApplyWeaponDamageToUnit = X2Action_ApplyWeaponDamageToUnit(TestActions[ActionIndex]);				

				for(DamageResultIndex = 0; DamageResultIndex < TargetGameState.DamageResults.Length; ++DamageResultIndex)
				{
					if( TargetGameState.DamageResults[DamageResultIndex].Context != MyAbilityContext )
					{
						// wasn't damaged by this ability usage, so not the record we're looking for
						continue;
					}

					DrivingApplyWeaponDamageToUnit.HitResults.AddItem(MyAbilityContext.ResultContext.HitResult);
					DrivingApplyWeaponDamageToUnit.DamageResults.AddItem(TargetGameState.DamageResults[DamageResultIndex]);
				}
				break;
			}
		}
	}
	
	if ( !bMergedAlready )
	{
		MyAbilityContext.SuperMergeIntoVisualizationTree(BuildTree, VisualizationTree);
	}
}
simulated function NanoClone_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateVisualizationMgr VisMgr;
	local XComGameStateHistory History;
	local XComGameStateContext_Ability Context;
	local VisualizationActionMetadata ShadowMetaData, CosmeticUnitMetaData;
	local XComGameState_Unit ShadowUnit, ShadowbindTargetUnit, TargetUnitState, CosmeticUnit;
	local UnitValue ShadowUnitValue;
	local X2Effect_SpawnNanoCloneUnit SpawnShadowEffect;
	local int j;
	local name SpawnShadowEffectResult;
	local X2Action_Fire SourceFire;
	local X2Action_MoveBegin SourceMoveBegin;
	local Actor SourceUnit;
	local array<X2Action> TransformStopParents;
	local VisualizationActionMetadata SourceMetaData, TargetMetaData;
	local X2Action_MoveTurn MoveTurnAction;
	local X2Action_PlayAnimation AddAnimAction, AnimAction;
	local X2Action_NanoCloneTarget TargetShadowbind;
	local XComGameState_Item ItemState;
	local X2GremlinTemplate GremlinTemplate;
	local Array<X2Action> FoundNodes;
	local int ScanNodes;
	local X2Action_MarkerNamed JoinAction;

	TypicalAbility_BuildVisualization(VisualizeGameState);

	VisMgr = `XCOMVISUALIZATIONMGR;
	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());

	TargetMetaData.StateObject_OldState = History.GetGameStateForObjectID(Context.InputContext.PrimaryTarget.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	TargetMetaData.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(Context.InputContext.PrimaryTarget.ObjectID);
	TargetMetaData.VisualizeActor = History.GetVisualizer(Context.InputContext.PrimaryTarget.ObjectID);
	TargetUnitState = XComGameState_Unit(TargetMetaData.StateObject_OldState);

	VisMgr.GetNodesOfType(VisMgr.BuildVisTree, class'X2Action_MarkerNamed', FoundNodes);
	for( ScanNodes = 0; ScanNodes < FoundNodes.Length; ++ScanNodes )
	{
		JoinAction = X2Action_MarkerNamed(FoundNodes[ScanNodes]);
		if( JoinAction.MarkerName == 'Join' )
		{
			break;
		}
	}

	// Find the Fire and MoveBegin for the Source
	SourceFire = X2Action_Fire(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_Fire', , Context.InputContext.SourceObject.ObjectID));
	SourceUnit = SourceFire.Metadata.VisualizeActor;

	SourceMoveBegin = X2Action_MoveBegin(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_MoveBegin', SourceUnit));

	// Find the Target's Shadowbind
	TargetShadowbind = X2Action_NanoCloneTarget(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_NanoCloneTarget', , Context.InputContext.PrimaryTarget.ObjectID));

	SourceMetaData.StateObject_OldState = SourceFire.Metadata.StateObject_OldState;
	SourceMetaData.StateObject_NewState = SourceFire.Metadata.StateObject_NewState;
	SourceMetaData.VisualizeActor = SourceFire.Metadata.VisualizeActor;

	if (Context.InputContext.MovementPaths.Length > 0)
	{
		// If moving, need to set the facing and pre/post transforms
		MoveTurnAction = X2Action_MoveTurn(class'X2Action_MoveTurn'.static.AddToVisualizationTree(SourceMetaData, Context, true, , SourceFire.ParentActions));
		MoveTurnAction.m_vFacePoint = `XWORLD.GetPositionFromTileCoordinates(TargetUnitState.TileLocation);
		MoveTurnAction.ForceSetPawnRotation = true;

		VisMgr.ConnectAction(JoinAction, VisMgr.BuildVisTree, false, MoveTurnAction);

		TransformStopParents.AddItem(MoveTurnAction);

		NanoCloneMoveInsertTransform(VisualizeGameState, SourceMetaData, SourceMoveBegin.ParentActions, TransformStopParents);
	}

	// Line up the Source's Fire, Target's React, and Shadow's anim
	if( TargetShadowbind != None && TargetShadowbind.ParentActions.Length != 0 )
	{
		VisMgr.ConnectAction(JoinAction, VisMgr.BuildVisTree, false, , TargetShadowbind.ParentActions);
	}
	
	VisMgr.DisconnectAction(TargetShadowbind);
	VisMgr.ConnectAction(TargetShadowbind, VisMgr.BuildVisTree, false, , SourceFire.ParentActions);

	SpawnShadowEffectResult = 'AA_UnknownError';
	for (j = 0; j < Context.ResultContext.TargetEffectResults.Effects.Length; ++j)
	{
		SpawnShadowEffect = X2Effect_SpawnNanoCloneUnit(Context.ResultContext.TargetEffectResults.Effects[j]);

		if (SpawnShadowEffect != none)
		{
			SpawnShadowEffectResult = Context.ResultContext.TargetEffectResults.ApplyResults[j];
			break;
		}
	}

	if (SpawnShadowEffectResult == 'AA_Success')
	{
		ShadowbindTargetUnit = XComGameState_Unit(VisualizeGameState.GetGameStateForObjectID(Context.InputContext.PrimaryTarget.ObjectID));
		`assert(ShadowbindTargetUnit != none);
		ShadowbindTargetUnit.GetUnitValue(class'X2Effect_SpawnUnit'.default.SpawnedUnitValueName, ShadowUnitValue);

		ShadowMetaData.StateObject_OldState = History.GetGameStateForObjectID(ShadowUnitValue.fValue, eReturnType_Reference, VisualizeGameState.HistoryIndex);
		ShadowMetaData.StateObject_NewState = ShadowMetaData.StateObject_OldState;
		ShadowUnit = XComGameState_Unit(ShadowMetaData.StateObject_NewState);
		`assert(ShadowUnit != none);
		ShadowMetaData.VisualizeActor = History.GetVisualizer(ShadowUnit.ObjectID);
		
		SpawnShadowEffect.AddSpawnVisualizationsToTracks(Context, ShadowUnit, ShadowMetaData, ShadowbindTargetUnit);

		AnimAction = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ShadowMetaData, Context, true, TargetShadowbind));
		AnimAction.Params.AnimName = 'HL_GetUpA';
		AnimAction.Params.BlendTime = 0.0f;

		VisMgr.ConnectAction(JoinAction, VisMgr.BuildVisTree, false, AnimAction);

		AddAnimAction = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ShadowMetaData, Context, false, TargetShadowbind));
		AddAnimAction.bFinishAnimationWait = false;
		AddAnimAction.Params.AnimName = 'ADD_HL_Shadowbind_FadeIn';
		AddAnimAction.Params.Additive = true;
		AddAnimAction.Params.BlendTime = 0.0f;

		VisMgr.ConnectAction(JoinAction, VisMgr.BuildVisTree, false, AddAnimAction);

		// Look for a gremlin that got copied
		ItemState = ShadowUnit.GetSecondaryWeapon();
		
		GremlinTemplate = X2GremlinTemplate(ItemState.GetMyTemplate());
		if( GremlinTemplate != none )
		{
			// This is a newly spawned unit so it should have its own gremlin
			CosmeticUnit = XComGameState_Unit(History.GetGameStateForObjectID(ItemState.CosmeticUnitRef.ObjectID));

			History.GetCurrentAndPreviousGameStatesForObjectID(CosmeticUnit.ObjectID, CosmeticUnitMetaData.StateObject_OldState, CosmeticUnitMetaData.StateObject_NewState, , VisualizeGameState.HistoryIndex);
			CosmeticUnitMetaData.VisualizeActor = CosmeticUnit.GetVisualizer();

			AddAnimAction = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(CosmeticUnitMetaData, Context, false, TargetShadowbind));
			AddAnimAction.bFinishAnimationWait = false;
			AddAnimAction.Params.AnimName = 'ADD_HL_Shadowbind_FadeIn';
			AddAnimAction.Params.Additive = true;
			AddAnimAction.Params.BlendTime = 0.0f;

			VisMgr.ConnectAction(JoinAction, VisMgr.BuildVisTree, false, AddAnimAction);
		}
	}
}

private function NanoCloneMoveInsertTransform(XComGameState VisualizeGameState, VisualizationActionMetadata ActionMetaData, array<X2Action> TransformStartParents, array<X2Action> TransformStopParents)
{
/*	local X2Action_PlayAnimation AnimAction;

	AnimAction = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetaData, VisualizeGameState.GetContext(), true, , TransformStartParents));
	AnimAction.Params.AnimName = 'HL_Transform_Start';

	AnimAction = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetaData, VisualizeGameState.GetContext(), true, , TransformStopParents));
	AnimAction.Params.AnimName = 'HL_Transform_Stop';*/
}

static function X2AbilityTemplate CreateNanoClonerUnitInitialize()
{
	local X2AbilityTemplate Template;
	local X2Effect_SpectralArmyUnit SpectralArmyUnitEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'NanoClonerUnitInitialize');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	SpectralArmyUnitEffect = new class'X2Effect_NanoCloneUnit';
	SpectralArmyUnitEffect.BuildPersistentEffect(1, true, true, true);
	SpectralArmyUnitEffect.bRemoveWhenTargetDies = true;
	Template.AddShooterEffect(SpectralArmyUnitEffect);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = NanoCloneVFX_BuildVisualization;

	return Template;
}

simulated function NanoCloneVFX_BuildVisualization(XComGameState VisualizeGameState)
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
	class'X2Action_NanoCloneVFX'.static.AddToVisualizationTree(BuildData, VisualizeGameState.GetContext());
}

static function X2AbilityTemplate NanophagePunch()
{
	local X2AbilityTemplate Template;
	local X2Effect_ApplyWeaponDamage DamageEffect;
	local X2AbilityToHitCalc_StandardMelee ToHitCalc;

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';

	Template = MeleeAttack('NanophagePunch', "img:///UILibrary_PerkIcons.UIPerk_command", true, DamageEffect, class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY, eCost_SingleConsumeAll);

	ToHitCalc = new class'X2AbilityToHitCalc_StandardMelee';
	Template.AbilityToHitCalc = ToHitCalc;

	Template.CustomFireAnim = 'FF_Melee';

	return Template;
}

//Adrenal Amp
static function X2AbilityTemplate SavAdrenalAmp()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCooldown				Cooldown;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local X2Effect_PersistentStatChange			StatEffect;
	local X2Effect_SavWillLoss					SavWillGainEffect;
	local XMBEffect_PermanentStatChange			PermenantWillEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition;
	local X2Effect_RemoveEffectsByDamageType	RemoveEffectsStatus;
	local X2Effect_StunRecover			StunRecoverEffect;
	local XMBEffect_AddAbilityCharges Effect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavAdrenalAmp');
		
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 6;
	Template.AbilityCooldown = Cooldown;

	Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;
    
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.ExcludeImpaired = false;
	UnitPropertyCondition.ImpairedIgnoresStuns = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	RemoveEffectsStatus = new class'X2Effect_RemoveEffectsByDamageType';
	RemoveEffectsStatus.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	Template.AddTargetEffect(RemoveEffectsStatus);
	
    StunRecoverEffect = class'X2StatusEffects'.static.CreateStunRecoverEffect();
	Template.AddTargetEffect(StunRecoverEffect);
	
	// Permenant Will Reduction
	PermenantWillEffect = new class'XMBEffect_PermanentStatChange';
	PermenantWillEffect.AddStatChange(eStat_Will, -2);
	PermenantWillEffect.ApplyChance = 50;
	// check if unit has more than 10 will
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_Will, 10, eCheck_GreaterThan);
	PermenantWillEffect.TargetConditions.AddItem(MaxStatCondition);	
	Template.AddTargetEffect(PermenantWillEffect);

	SavWillGainEffect = new class'X2Effect_SavWillLoss';
//	SavWillGainEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	SavWillGainEffect.WillMod = -5;
	Template.AddTargetEffect(SavWillGainEffect);

	StatEffect = new class'X2Effect_PersistentStatChange';
	StatEffect.EffectName = 'StimStats';
	StatEffect.DuplicateResponse = eDupe_Allow;
	StatEffect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	StatEffect.SetDisplayInfo(ePerkBuff_Bonus, default.SavCombatStimBonusName, default.SavCombatStimBonusDesc, Template.IconImage, true);
	StatEffect.AddPersistentStatChange(eStat_Mobility, 3);
	StatEffect.AddPersistentStatChange(eStat_CritChance, 20);
	StatEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(StatEffect);
	
	Effect = new class'XMBEffect_AddAbilityCharges';
	Effect.AbilityNames.AddItem('Battlelord');
	Effect.AbilityNames.AddItem('SkirmisherInterrupt');
	Effect.BonusCharges = 1;
	Template.AddTargetEffect(Effect);
	
	Template.AddTargetEffect(new class'X2Effect_ManualOverride');

	Template.Hostility = eHostility_Defensive;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Skirm_AdrenalAmp";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.COMBAT_STIMS_PRIORITY;
	Template.AbilityConfirmSound = "Panic_Check_Start";
	Template.ActivationSpeech = 'PanicScream';
	Template.bShowActivation = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = SavAdrenalAmp_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

simulated function SavAdrenalAmp_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  Context;
	local StateObjectReference InteractingUnitRef;
	local VisualizationActionMetadata EmptyTrack;
	local VisualizationActionMetadata ActionMetadata;
	local X2Action_PlayAnimation PlayAnimationAction1, PlayAnimationAction2;
	local X2Action_PlaySoundAndFlyOver CharSpeechAction;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;

	//Configure the visualization track for the shooter
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	PlayAnimationAction1 = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	PlayAnimationAction1.Params.AnimName = 'HL_DazedStartA';

	CharSpeechAction = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(ActionMetadata, Context));
	CharSpeechAction.SetSoundAndFlyOverParameters(None, "", 'PanickedBreathing', eColor_Good);

	PlayAnimationAction2 = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	PlayAnimationAction2.Params.AnimName = 'HL_DazedStopA';
}

//Deactivated Control Chip
//SavSymbolofResistance
static function X2AbilityTemplate SavSymbolofResistance()
{
	local XMBEffect_ConditionalStatChange Effect;
	local X2Condition_UnitStatCheck Condition;

	Condition = new class'X2Condition_UnitStatCheck';
	Condition.AddCheckStat(eStat_HP, 100, eCheck_LessThan,,, true);

	Effect = new class'XMBEffect_ConditionalStatChange';
	Effect.AddPersistentStatChange(eStat_Will, 15);
	Effect.AddPersistentStatChange(eStat_Offense, 5);
	Effect.AddPersistentStatChange(eStat_Defense, 5);
	Effect.Conditions.AddItem(Condition);

	return Passive('SavSymbolofResistance', "img:///UILibrary_SavageItems.UIPerk_SymbolofResistance", true, Effect);
}

//SavForeverFree
static function X2AbilityTemplate SavForeverFree()
{
	local X2AbilityTemplate Template;
	local X2Effect_GrantActionPoints Effect;
    local X2Effect_SavWillLoss					SavWillGainEffect;
    local X2Condition_UnitProperty              UnitCondition;
 
	Effect = new class'X2Effect_GrantActionPoints';
	Effect.bApplyOnMiss = true;
	Effect.NumActionPoints = 1;
	Effect.PointType = 'Momentum';

	// Create the template using a helper function. This ability triggers when we kill another unit.
	Template = SelfTargetTrigger('SavForeverFree', "img:///UILibrary_SavageItems.UIPerk_ForeverFree", true, Effect, 'KillMail');

    SavWillGainEffect = new class'X2Effect_SavWillLoss';
//	SavWillGainEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	SavWillGainEffect.WillMod = +5;
	AddSecondaryEffect(Template, SavWillGainEffect);
	
	UnitCondition = new class'X2Condition_UnitProperty';
	UnitCondition.ExcludeHostileToSource = true;
	UnitCondition.ExcludeFriendlyToSource = false;
	UnitCondition.RequireSoldierClasses.AddItem('Skirmisher');
	Effect.TargetConditions.AddItem(UnitCondition);
	SavWillGainEffect.TargetConditions.AddItem(UnitCondition);
	
	AddCooldown(Template, 3);

	// Trigger abilities don't appear as passives. Add a passive ability icon.
	AddIconPassive(Template);

	// Show a flyover when Hit and Run is activated
	Template.bShowActivation = true;

	return Template;
}

//Chainbreaker
//SavUploadChainbreakerVirus
static function X2AbilityTemplate SavUploadChainbreakerVirus()
{
	local X2AbilityTemplate				Template;
	local X2AbilityCooldown_PlayerLocalAndGlobal				Cooldown;
	local X2AbilityCost_ActionPoints    ActionPointCost;
	local X2Condition_UnitProperty      TargetProperty;
	local X2Effect_MindControl          MindControlEffect;
	local X2AbilityMultiTarget_Radius RadiusMultiTarget;
	local X2Condition_UnitEffects       EffectCondition;
	local X2Condition_UnitImmunities	UnitImmunityCondition;
	local X2Effect_StunRecover			StunRecoverEffect;
	local X2AbilityTarget_Cursor		CursorTarget;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SavUploadChainbreakerVirus');

	Template.DisplayTargetHitChance = false;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Skirm_ChainBreaker";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;
	Template.Hostility = eHostility_Neutral;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;

	Cooldown = new class'X2AbilityCooldown_PlayerLocalAndGlobal';
	Cooldown.iNumTurns = default.CHAINBREAKERLOCALANDGLOBALCOOLDOWN;
	Cooldown.NumGlobalTurns = default.CHAINBREAKERLOCALANDGLOBALCOOLDOWN;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.TargetingMethod = class'X2TargetingMethod_VoidRift';
	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.bShowActivation = true;
	Template.bSkipFireAction = false;
	
    Template.AbilityToHitCalc = new class'X2AbilityToHitCalc_Hacking';
	
	TargetProperty = new class'X2Condition_UnitProperty';
	TargetProperty.ExcludeCivilian = true;
	TargetProperty.ExcludeCosmetic = true;
	TargetProperty.ExcludeRobotic = true;
	TargetProperty.ExcludeAlien = true;
	TargetProperty.ExcludeDead = true;
	TargetProperty.ExcludeHostileToSource = false;
	TargetProperty.ExcludeFriendlyToSource = true;
	TargetProperty.RequireSquadmates = false;
	Template.AbilityTargetConditions.AddItem(TargetProperty);

    EffectCondition = new class'X2Condition_UnitEffects';
	EffectCondition.AddExcludeEffect(class'X2Effect_MindControl'.default.EffectName, 'AA_UnitIsMindControlled');
	Template.AbilityTargetConditions.AddItem(EffectCondition);

    UnitImmunityCondition = new class'X2Condition_UnitImmunities';
	UnitImmunityCondition.AddExcludeDamageType('Mental');
	UnitImmunityCondition.bOnlyOnCharacterTemplate = true;
	Template.AbilityTargetConditions.AddItem(UnitImmunityCondition);

//  mind control target
	MindControlEffect = class'X2StatusEffects'.static.CreateMindControlStatusEffect(1, false, true);
	MindControlEffect.ApplyChance = 80;
	Template.AddTargetEffect(MindControlEffect);

    StunRecoverEffect = class'X2StatusEffects'.static.CreateStunRecoverEffect();
	Template.AddTargetEffect(StunRecoverEffect);

	Template.AddTargetEffect(class'X2StatusEffects'.static.CreateMindControlRemoveEffects());

// The ability targets the unit that has it, but also effects all nearby units that meet
	// the conditions on the multitarget effect.
	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = true;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	Template.AddMultiTargetEffect(MindControlEffect);
	Template.AddMultiTargetEffect(StunRecoverEffect);
	Template.AddMultiTargetEffect(class'X2StatusEffects'.static.CreateMindControlRemoveEffects());

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.ActivationSpeech = 'AttemptingHack';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CustomFireAnim = 'HL_CallReinforcementsA';
	
	return Template;
}

static function X2DataTemplate CreateSAVEngageMindrazor()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCooldown					Cooldown;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2AbilityToHitCalc_RollStatTiers	StatContestTiers;
	local X2Condition_UnitStatCheck			MaxStatConditionWill70, MaxStatConditionWill90;
	local XMBEffect_BonusDamageByDamageType MindrazorEffect1, MindrazorEffect2, MindrazorEffect3, MindrazorEffect4;
	local XMBEffect_PermanentStatChange		PermenantWillEffect1, PermenantWillEffect2;
	local X2Effect_SavWillLoss				SavWillLossEffect1, SavWillLossEffect2, SavWillLossEffect3;
	local XMBEffect_AddAbilityCharges		ChargesEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVEngageMindrazor');

	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.bShowActivation = true;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_Mindrazor";
	Template.CustomFireAnim = 'HL_SAVMindCrush';//===============================================Change
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Defensive;

	// Cooldown
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 3;
	Template.AbilityCooldown = Cooldown;
	
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = false;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	// This will be a stat contest
	StatContestTiers = new class'X2AbilityToHitCalc_RollStatTiers';
	StatContestTiers.StatToRoll = eStat_PsiOffense;
	StatContestTiers.AddNextStatContestTier(70, true);
	StatContestTiers.AddNextStatContestTier(120, true);
	StatContestTiers.AddNextStatContestTier(170, true);
	StatContestTiers.AddNextStatContestTier(220, true);
	Template.AbilityToHitCalc = StatContestTiers;

	// Shooter Conditions
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	
	MindrazorEffect1 = class'X2Effect_MindrazorDamage'.static.CreateMindrazorDamageLvl1Effect();
	MindrazorEffect1.MinStatContestResult = 1;
	MindrazorEffect1.MaxStatContestResult = 1;
	MindrazorEffect1.bRemoveWhenSourceDies = true;
	Template.AddTargetEffect(MindrazorEffect1);

	MindrazorEffect2 = class'X2Effect_MindrazorDamage'.static.CreateMindrazorDamageLvl2Effect();
	MindrazorEffect2.MinStatContestResult = 2;
	MindrazorEffect2.MaxStatContestResult = 2;
	MindrazorEffect2.bRemoveWhenSourceDies = true;
	Template.AddTargetEffect(MindrazorEffect2);

	MindrazorEffect3 = class'X2Effect_MindrazorDamage'.static.CreateMindrazorDamageLvl3Effect();
	MindrazorEffect3.MinStatContestResult = 3;
	MindrazorEffect3.MaxStatContestResult = 3;
	MindrazorEffect3.bRemoveWhenSourceDies = true;
	Template.AddTargetEffect(MindrazorEffect3);

	MindrazorEffect4 = class'X2Effect_MindrazorDamage'.static.CreateMindrazorDamageLvl4Effect();
	MindrazorEffect4.MinStatContestResult = 4;
	MindrazorEffect4.MaxStatContestResult = 99;
	MindrazorEffect4.bRemoveWhenSourceDies = true;
	Template.AddTargetEffect(MindrazorEffect4);

	PermenantWillEffect1 = new class'XMBEffect_PermanentStatChange';
	PermenantWillEffect1.AddStatChange(eStat_Will, 2);
	PermenantWillEffect1.ApplyChance = 50;
	PermenantWillEffect1.MinStatContestResult = 2;
	PermenantWillEffect1.MaxStatContestResult = 3;
	MaxStatConditionWill70 = new class'X2Condition_UnitStatCheck';
	MaxStatConditionWill70.AddCheckStat(eStat_Will, 70, eCheck_LessThan);
	PermenantWillEffect1.TargetConditions.AddItem(MaxStatConditionWill70);
	Template.AddTargetEffect(PermenantWillEffect1);

	PermenantWillEffect2 = new class'XMBEffect_PermanentStatChange';
	PermenantWillEffect2.AddStatChange(eStat_Will, 3);
	PermenantWillEffect2.ApplyChance = 50;
	PermenantWillEffect2.MinStatContestResult = 4;
	PermenantWillEffect2.MaxStatContestResult = 99;
	MaxStatConditionWill90 = new class'X2Condition_UnitStatCheck';
	MaxStatConditionWill90.AddCheckStat(eStat_Will, 90, eCheck_LessThan);
	PermenantWillEffect2.TargetConditions.AddItem(MaxStatConditionWill90);
	Template.AddTargetEffect(PermenantWillEffect2);

	SavWillLossEffect1 = new class'X2Effect_SavWillLoss';
	SavWillLossEffect1.MinStatContestResult = 1;
	SavWillLossEffect1.MaxStatContestResult = 1;
	SavWillLossEffect1.WillMod = -5;
	AddSecondaryEffect(Template, SavWillLossEffect1);

	SavWillLossEffect2 = new class'X2Effect_SavWillLoss';
	SavWillLossEffect2.MinStatContestResult = 2;
	SavWillLossEffect2.MaxStatContestResult = 3;
	SavWillLossEffect2.WillMod = -10;
	AddSecondaryEffect(Template, SavWillLossEffect2);

	SavWillLossEffect3 = new class'X2Effect_SavWillLoss';
	SavWillLossEffect3.MinStatContestResult = 4;
	SavWillLossEffect3.MaxStatContestResult = 99;
	SavWillLossEffect3.WillMod = -15;
	AddSecondaryEffect(Template, SavWillLossEffect3);

	ChargesEffect = new class'XMBEffect_AddAbilityCharges';
	ChargesEffect.AbilityNames.AddItem('SAVMindrazorAmplify');
	ChargesEffect.BonusCharges = 1;
	ChargesEffect.MaxCharges = 3;
	AddSecondaryEffect(Template, ChargesEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	return Template;
}

static function X2AbilityTemplate CreateSAVMindrazorAmplify()
{
	local X2AbilityTemplate				Template;
	local X2Effect_Amplify				AmplifyEffect;
	local X2AbilityCost_ActionPoints	ActionPointCost;
	local X2AbilityCharges				Charges;
	local X2AbilityCost_Charges			ChargeCost;
	local X2AbilityTag					AbilityTag;
	local X2Condition_UnitEffects		EffectsCondition;
	local XMBEffect_ConditionalBonus	MindrazorMarkEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVMindrazorAmplify');

//BEGIN AUTOGENERATED CODE: Template Overrides 'Amplify'
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.CustomFireAnim = 'HL_SAVMindrazor';
	Template.ActivationSpeech = 'VoidRift';
//END AUTOGENERATED CODE: Template Overrides 'Amplify'
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Offensive;
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Amplify";
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.bShowActivation = true;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitOnlyProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	EffectsCondition = new class'X2Condition_UnitEffects';
	EffectsCondition.AddExcludeEffect(class'X2Effect_Amplify'.default.EffectName, 'AA_AlreadyAmplified');
	Template.AbilityTargetConditions.AddItem(EffectsCondition);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	ActionPointCost.bFreeCost = false; 
	Template.AbilityCosts.AddItem(ActionPointCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 0;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);
	
	AmplifyEffect = new class'X2Effect_Amplify';
	AmplifyEffect.BuildPersistentEffect(1, true, true);
	AmplifyEffect.bRemoveWhenTargetDies = true;
	AmplifyEffect.BonusDamageMult = class'X2Ability_TemplarAbilitySet'.default.AmplifyBonusDamageMult;
	AmplifyEffect.MinBonusDamage = class'X2Ability_TemplarAbilitySet'.default.AmplifyMinBonusDamage;

	MindrazorMarkEffect = class'X2Effect_MindrazorDamage'.static.CreateMindrazorMarked();
	Template.AddTargetEffect(MindrazorMarkEffect);// Just spawns in icon and description and some FX hooks

	AbilityTag = X2AbilityTag(`XEXPANDCONTEXT.FindTag("Ability"));
	AbilityTag.ParseObj = AmplifyEffect;
	AmplifyEffect.SetDisplayInfo(ePerkBuff_Penalty, class'X2Ability_TemplarAbilitySet'.default.AmplifyEffectName, `XEXPAND.ExpandString(class'X2Ability_TemplarAbilitySet'.default.AmplifyEffectDesc), Template.IconImage, true, , Template.AbilitySourceName);

	// bsg-dforrest (7.27.17): need to clear out ParseObject
	AbilityTag.ParseObj = none;
	// bsg-dforrest (7.27.17): end

	Template.AddTargetEffect(AmplifyEffect);
	
	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	Template.AdditionalAbilities.AddItem('SAVMindrazorAmpWillDrain');

	return Template;
}

static function X2AbilityTemplate SAVMindrazorAmpWillDrain()
{
	local X2AbilityTemplate 					Template;
	local X2Effect_SavWillLoss					SavWillLossEffect;
	local XMBCondition_AbilityName				AbilityNameCondition;

	SavWillLossEffect = new class'X2Effect_SavWillLoss';
	SavWillLossEffect.WillMod = -10;

	// Create the template using a helper function
	Template = SelfTargetTrigger('SAVMindrazorAmpWillDrain', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Amplify", false, SavWillLossEffect, 'AbilityActivated');//==============Needs Icon

	AbilityNameCondition = new class'XMBCondition_AbilityName';
	AbilityNameCondition.IncludeAbilityNames.AddItem('SAVMindrazorAmplify');
	AddTriggerTargetCondition(Template, AbilityNameCondition);

	return Template;
}

//SAVAutoStigmata
static function X2AbilityTemplate SAVAutoStigmata()
{
	local X2AbilityTemplate 					Template;
	local X2Effect_SavWillLoss					SavWillLossEffect;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local XMBCondition_AbilityName				AbilityNameCondition;
	local X2Effect_ApplyWeaponDamage			WeaponDamageEffect;
	local XMBEffect_PermanentStatChange			PermenantMainBoostEffect;
	local X2Condition_UnitStatCheck				MaxStatCondition;
	local X2Effect_Persistent					BleedingEffect;
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = 'Stigmata';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_PsiOffense, 15);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ShieldHP, 4);// The trigger causes 1-3 Armor/shield piercing damage, net gain of 1-3 hp
	PersistentStatChangeEffect.DuplicateResponse = eDupe_Allow;

	// Create the template using a helper function
	Template = SelfTargetTrigger('SAVAutoStigmata', "img:///UILibrary_SavageItems.UIPerk_Autostigmata", false, PersistentStatChangeEffect, 'AbilityActivated');

// Permenant Psi Offence
	PermenantMainBoostEffect = new class'XMBEffect_PermanentStatChange';
	PermenantMainBoostEffect.AddStatChange(eStat_PsiOffense, 2);
	PermenantMainBoostEffect.ApplyChance = 65;	
	MaxStatCondition = new class'X2Condition_UnitStatCheck';
	MaxStatCondition.AddCheckStat(eStat_PsiOffense, 175, eCheck_LessThan);
	PermenantMainBoostEffect.TargetConditions.AddItem(MaxStatCondition);
	AddSecondaryEffect(Template, PermenantMainBoostEffect);

	BleedingEffect = class'X2StatusEffects'.static.CreateBleedingStatusEffect(6, 1);
	BleedingEffect.ApplyChance = 30;
	AddSecondaryEffect(Template, BleedingEffect);

	// Trigger abilities don't appear as passives. Add a passive ability icon.
	AddIconPassive(Template);
	Template.AbilitySourceName = 'eAbilitySource_Psionic';

	SavWillLossEffect = new class'X2Effect_SavWillLoss';
	SavWillLossEffect.WillMod = -2;
	AddSecondaryEffect(Template, SavWillLossEffect);
	
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bBypassShields = true;
	WeaponDamageEffect.bIgnoreArmor = true;
	AddSecondaryEffect(Template, WeaponDamageEffect);

	Template.CustomFireAnim = 'HL_SAVAutostigmata';
	
	AbilityNameCondition = new class'XMBCondition_AbilityName';
	AbilityNameCondition.IncludeAbilityNames.AddItem('SAVInjectPsiko');
	AbilityNameCondition.IncludeAbilityNames.AddItem('SAVPsikotikScream');
	AbilityNameCondition.IncludeAbilityNames.AddItem('SAVMindrazorAmplify');
	AbilityNameCondition.IncludeAbilityNames.AddItem('Soulfire');
	AbilityNameCondition.IncludeAbilityNames.AddItem('Stasis');
	AbilityNameCondition.IncludeAbilityNames.AddItem('Insanity');
	AbilityNameCondition.IncludeAbilityNames.AddItem('Inspire');
	AbilityNameCondition.IncludeAbilityNames.AddItem('Fuse');
	AbilityNameCondition.IncludeAbilityNames.AddItem('Domination');		
	AbilityNameCondition.IncludeAbilityNames.AddItem('NullLance');
	AbilityNameCondition.IncludeAbilityNames.AddItem('VoidRift');	
	AbilityNameCondition.IncludeAbilityNames.AddItem('PsiOperativeMindControlAbility');
	AbilityNameCondition.IncludeAbilityNames.AddItem('SAVMindCrush');
	AbilityNameCondition.IncludeAbilityNames.AddItem('IRI_PhaseWalk');
	AbilityNameCondition.IncludeAbilityNames.AddItem('IRI_NullWard');
	AbilityNameCondition.IncludeAbilityNames.AddItem('IRI_PsiReanimation');
	AbilityNameCondition.IncludeAbilityNames.AddItem('IRI_SoulMerge');
	AbilityNameCondition.IncludeAbilityNames.AddItem('IRI_SoulStorm');
	AbilityNameCondition.IncludeAbilityNames.AddItem('Volt');
	AbilityNameCondition.IncludeAbilityNames.AddItem('Amplify');
	AbilityNameCondition.IncludeAbilityNames.AddItem('Pillar');
	AbilityNameCondition.IncludeAbilityNames.AddItem('TemplarInvert');
	AbilityNameCondition.IncludeAbilityNames.AddItem('TemplarExchange');
	AbilityNameCondition.IncludeAbilityNames.AddItem('Ghost');
	AbilityNameCondition.IncludeAbilityNames.AddItem('IonicStorm');
	AbilityNameCondition.IncludeAbilityNames.AddItem('VoidConduit');
	AbilityNameCondition.IncludeAbilityNames.AddItem('StunStrike');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZAcidBall');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZAcidSpray');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZAmorFati');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZAuroraWave');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZBetrayal');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZBoulderCrush');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZBurningHands');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZCausticLance');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZClearTranquil');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZCongregation');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZControlUndead');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZCurseLure');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZDeadExplosion');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZDelayedBlastFireball');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZDisable');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZEarthHeal');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZEvilGaze');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZFireball');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZFireWhip');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZFetidBreath');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZFuse');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZHealersMind');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZHaltUndead');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZHellishRebuke');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZKineticLance');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZKineticPull');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZKineticPush');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZKineticRescue');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZMachinaPuppeteer');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZMagnusExorcismus');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZMalaise');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZManuForti');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZMassPanic');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZMassSleep');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZMindControl');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZMindMerge');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZMindSoothe');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZPanacea');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZPhantasmalKiller');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZPhantasmalPrison');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZPhantasmalWeird');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZPoisonball');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZPsiBlind');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZPsiBomb');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZPsiHeal');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZPsiPanic');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZPsiShield');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZPsiSleep');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZProtection');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZRayOfLife');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZRayzeelSong');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZRestoreLife');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZSearingLance');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZShiningAir');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZStormBreath');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZThunderousRoar');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZTransmitPrana');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZTurnUndead');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZWhiteFlame');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZZombify');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZCloudCover');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZForkedLightning');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZLashOut');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZStormForce');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZStormShock');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZStormSurge');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZThunderstorm');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZVoidConduit');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZVoidShock');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MZVoidLightning');
	AddTriggerTargetCondition(Template, AbilityNameCondition);

	return Template;
}