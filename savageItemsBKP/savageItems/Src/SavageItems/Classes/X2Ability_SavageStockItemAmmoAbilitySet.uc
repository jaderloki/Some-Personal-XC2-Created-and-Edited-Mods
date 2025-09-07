class X2Ability_SavageStockItemAmmoAbilitySet extends XMBAbility
	dependson (XComGameStateContext_Ability) config(SavageStockItems);

//Here are the config arrays for the different classifications of weapons
var config array<name> WeaponCatArray_AllShootingWeapons;
var config array<name> WeaponCatArray_AllAutomaticWeapons;
var config array<name> WeaponCatArray_HighAccuracySingleShot;
var config array<name> WeaponCatArray_AllHighCaliberWeapons;
var config array<name> WeaponCatArray_AllMediumCaliberWeapons;
var config array<name> WeaponCatArray_AllSmallCaliberWeapons;
var config array<name> WeaponCatArray_AllPrimaryShootingWeapons;
var config array<name> WeaponCatArray_AllPrimaryAutomaticWeapons;

var localized string DumbTracerDebuffEffectName;
var localized string DumbTracerDebuffEffectDesc;
var localized string HERuptureEffectName;
var localized string HERuptureEffectDesc;
var localized string MentalDisruptionEffectName;
var localized string MentalDisruptionEffectDesc;
var localized string PlasmaBurstEffectName;
var localized string PlasmaBurstEffectDesc;

var config int HOLLOWPOINT_AP;
var config int HOLLOWPOINT_CRITCHANCE;
var config int HOLLOWPOINT_CRIT;
var config int HICALDEBUFF;
var config int AAJ_CRIT;
var config int AAJ_CRITCHANCE;
var config int AAJ_AP;
var config int AAJDE_AP;
var config int AAJDE_CRIT;

var config float MENTALDISRUPTIONWILL;
var config float MENTALDISRUPTIONHACKDEF;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(HollowPoint());
	Templates.AddItem(DumbTracerAim());
	Templates.AddItem(DumbTracerDebuff());
	Templates.AddItem(HVAPMod());
	Templates.AddItem(IgnitionRounds());
	Templates.AddItem(HighCalDamage());
	Templates.AddItem(HiCalRecoil());
	Templates.AddItem(HEAmmoDamageHeavy());
	Templates.AddItem(HEAmmoDamageLight());
	Templates.AddItem(SavStunAmoAbility());
	Templates.AddItem(AAJAmmoBonus());
	Templates.AddItem(AAJDEAmmoBonus());
	Templates.AddItem(CoverPiercing());
	Templates.AddItem(PlasmaBurstDamage());
	Templates.AddItem(SmartRoundsAutopsy());
	Templates.AddItem(SmartRoundsTargetMarked());
	Templates.AddItem(SmartRoundsMarkTargetMarked());
	Templates.AddItem(SmartRoundsTargetHoloMarked());
	Templates.AddItem(SmartRoundsTargetScanned());
	Templates.AddItem(CreateSavHotShotBonus());
	Templates.AddItem(CreateSAVButcherRounds());
	Templates.AddItem(CreateSAVBreachBusterRounds());
	Templates.AddItem(CreateSAVBreachBusted());
	Templates.AddItem(CreateSAVSkullSplitterRounds());
	Templates.AddItem(CreateSAVMilspecRounds());
	Templates.AddItem(CreateSAVAlienPowerPack());
	Templates.AddItem(CreateSAVUnreliableRounds());

	return Templates;
}

static function X2AbilityTemplate HollowPoint()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalBonus		Effect, Effect2, Effect3;
	local XMBCondition_AbilityProperty		Condition;
	local X2Condition_UnitStatCheck			ConditionArmor;
	local X2Condition_SavWeaponCategory		WeaponCondition;
	local name WeaponCatName_AllShootingWeapons;

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}
		
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitModifier(15, eHit_Crit);
	Effect.AddDamageModifier(1, eHit_Crit);
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);	

	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bExcludeMelee = true;
	Condition.bRequireActivated = false;
	Effect.AbilityTargetConditions.AddItem(Condition);

	Effect2 = new class'XMBEffect_ConditionalBonus';
	Effect2.AbilityTargetConditions.AddItem(default.FullCoverCondition);
	Effect2.AddDamageModifier(-1, eHit_Crit);
	Effect2.AddToHitModifier(-5, eHit_Crit);
	Effect2.AbilityTargetConditions.AddItem(Condition);
	Effect2.AbilityTargetConditions.AddItem(WeaponCondition);

	ConditionArmor = new class'X2Condition_UnitStatCheck';
	ConditionArmor.AddCheckStat(eStat_ArmorMitigation, 1, eCheck_GreaterThan,,, false);

	Effect3 = new class'XMBEffect_ConditionalBonus';
	Effect3.AbilityTargetConditions.AddItem(ConditionArmor);
	Effect3.AddDamageModifier(-1, eHit_Crit);
	Effect3.AddToHitModifier(-5, eHit_Crit);
	Effect3.AbilityTargetConditions.AddItem(Condition);
	Effect3.AbilityTargetConditions.AddItem(WeaponCondition);

	Template = Passive('HollowPoint', "img:///UILibrary_SavageItems.NewPerks.UIPerk_CritAmmo", true, Effect);
		
	AddSecondaryEffect(Template, Effect2);
	AddSecondaryEffect(Template, Effect3);

	return Template;
}

static function X2AbilityTemplate DumbTracerAim()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalBonus		Effect, Effect2, Effect3, Effect4;
	local XMBCondition_AbilityProperty		Condition;
	local X2Condition_SavWeaponCategory		WeaponCondition, WeaponCondition2;
	local XMBCondition_AbilityName			AbilityNameCondition;
	local name WeaponCatName_AllShootingWeapons;
	local name WeaponCatName_AllAutomaticWeapons;

	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bExcludeMelee = true;
	Condition.bRequireActivated = false;

	AbilityNameCondition = new class'XMBCondition_AbilityName';
	AbilityNameCondition.IncludeAbilityNames.AddItem('FullAutoFire');

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}

	WeaponCondition2 = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllAutomaticWeapons(WeaponCatName_AllAutomaticWeapons)
	{
		WeaponCondition2.IncludeWeaponCategories.AddItem(WeaponCatName_AllAutomaticWeapons);
	}
	
//	Base Aim buff	
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitModifier(3, eHit_Success);
	Effect.AbilityTargetConditions.AddItem(Condition);
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);

	Template = Passive('DumbTracerAim', "UILibrary_SavageItems.NewPerks.UIPerk_TracerRounds", true, Effect);

//	Reaction fire aim bonus for automatic weapons
	Effect2 = new class'XMBEffect_ConditionalBonus';
	Effect2.AddToHitModifier(6, eHit_Success);
	Effect2.AbilityTargetConditions.AddItem(WeaponCondition2);
	Effect2.AbilityTargetConditions.AddItem(default.ReactionFireCondition);
	Effect2.AbilityTargetConditions.AddItem(Condition);
	AddSecondaryEffect(Template, Effect2);

//	Autofire aim bonus for people with RPGO - eliminates about half of the aim debuff applied to that ability
	Effect3 = new class'XMBEffect_ConditionalBonus';
	Effect3.AddToHitModifier(10, eHit_Success);
	Effect3.AbilityTargetConditions.AddItem(AbilityNameCondition);
	Effect3.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect3.AbilityTargetConditions.AddItem(Condition);
	AddSecondaryEffect(Template, Effect3);

//	Aim bonus for automatic weapons, effectively doubling the base aim bonus for certain weapons
	Effect4 = new class'XMBEffect_ConditionalBonus';
	Effect4.AddToHitModifier(3, eHit_Success);
	Effect4.AbilityTargetConditions.AddItem(WeaponCondition2);
	Effect4.AbilityTargetConditions.AddItem(Condition);
	AddSecondaryEffect(Template, Effect4);

	return Template;
}

static function X2AbilityTemplate DumbTracerDebuff()
{
	local X2AbilityTemplate Template;
	local X2AbilityTrigger_EventListener    Trigger;
	local X2Effect_PersistentStatChange DefenceDebuff;
	local X2Condition_SavWeaponCategory		WeaponCondition;
	local name WeaponCatName_AllShootingWeapons;

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}

	`CREATE_X2ABILITY_TEMPLATE(Template, 'DumbTracerDebuff');
	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_TracerLitUp";
	Template.Hostility = eHostility_Neutral;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.EventID = 'AbilityActivated';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.Filter = eFilter_None;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.TypicalAttackListener;
	Template.AbilityTriggers.AddItem(Trigger);
	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	DefenceDebuff = new class'X2Effect_PersistentStatChange';
	DefenceDebuff.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	DefenceDebuff.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	DefenceDebuff.AddPersistentStatChange(eStat_Defense, -4, MODOP_Addition);
	DefenceDebuff.DuplicateResponse = eDupe_Allow;
//	DefenceDebuff.VisualizationFn = EffectFlyOver_Visualization;
	Template.AddShooterEffect(DefenceDebuff);
//	Template.AddTargetEffect(DefenceDebuff);
	DefenceDebuff.TargetConditions.AddItem(WeaponCondition);
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
		
	Template.bSkipFireAction = true;
	Template.bShowActivation = false;
	
	return Template;
}

static function X2Effect_PersistentStatChange DumbTracerDebuffEffect()
{
	local X2Effect_PersistentStatChange Effect;
	local X2Condition_SavWeaponCategory		WeaponCondition;
	local name WeaponCatName_AllShootingWeapons;

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}

	Effect = new class'X2Effect_PersistentStatChange';
	Effect.SetDisplayInfo(ePerkBuff_Penalty, default.DumbTracerDebuffEffectName, `XEXPAND.ExpandString(default.DumbTracerDebuffEffectDesc), "img:///UILibrary_SavageItems.NewPerks.UIPerk_TracerLitUp", true);
	Effect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	Effect.AddPersistentStatChange(eStat_Defense, -6, MODOP_Addition);
	Effect.bApplyOnHit = true;
	Effect.bApplyOnMiss = true;
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.VisualizationFn = EffectFlyOver_Visualization;
	Effect.TargetConditions.AddItem(WeaponCondition);

	return Effect;
}

static function X2AbilityTemplate HVAPMod()
{
	local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus Effect, Effect2, Effect3, Effect4;
	local X2Condition_SavWeaponCategory		WeaponCondition, SniperWeaponCondition;
	local name WeaponCatName_AllShootingWeapons;
	local name WeaponCatName_HighAccuracySingleShot;

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}

	SniperWeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_HighAccuracySingleShot(WeaponCatName_HighAccuracySingleShot)
	{
		SniperWeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_HighAccuracySingleShot);
	}

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AbilityTargetConditions.AddItem(default.FullCoverCondition);
	Effect.AddArmorPiercingModifier(1);
	Effect.AddDamageModifier(-1, eHit_Crit);
	Effect.AddToHitModifier(-50, eHit_Crit);
	Effect.AddToHitModifier(10);
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	
	Template = Passive('HVAPMod', "img:///UILibrary_SavageItems.NewPerks.UIPerk_ArmorPiercing", true, Effect);

	Effect2 = new class'XMBEffect_ConditionalBonus';
	Effect2.AbilityTargetConditions.AddItem(default.HalfCoverCondition);
	Effect2.AddArmorPiercingModifier(2);
	Effect2.AddDamageModifier(-1, eHit_Crit);
	Effect2.AddToHitModifier(-40, eHit_Crit);
	Effect2.AddToHitModifier(5);
	Effect2.AbilityTargetConditions.AddItem(WeaponCondition);
	AddSecondaryEffect(Template, Effect2);

	Effect3 = new class'XMBEffect_ConditionalBonus';
	Effect3.AbilityTargetConditions.AddItem(default.NoCoverCondition);
	Effect3.AddArmorPiercingModifier(2);
	Effect3.AddDamageModifier(-1, eHit_Crit);
	Effect3.AddToHitModifier(-30, eHit_Crit);
	Effect3.AbilityTargetConditions.AddItem(WeaponCondition);
	AddSecondaryEffect(Template, Effect3);

	Effect4 = new class'XMBEffect_ConditionalBonus';
	Effect4.AddArmorPiercingModifier(1);
	Effect4.AbilityTargetConditions.AddItem(SniperWeaponCondition);
	AddSecondaryEffect(Template, Effect4);

	return Template;
}

static function X2AbilityTemplate IgnitionRounds()
{
	local X2AbilityTemplate             Template;
	local X2Effect_IncendiaryRounds     Effect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'IgnitionRounds');

	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_IncendiaryAmmo";
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	Effect = new class'X2Effect_IncendiaryRounds';
	Effect.BuildPersistentEffect(1, true, false, false);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
	Template.AddShooterEffect(Effect);
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate HighCalDamage()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalBonus		MedEffect, SmlEffect, HiEffect;
	local XMBCondition_AbilityProperty		Condition;
	local X2Condition_SavWeaponCategory		MedWeaponCondition, HighWeaponCondition, SmlWeaponCondition;
	local name WeaponCatName_AllMediumCaliberWeapons;
	local name WeaponCatName_AllHighCaliberWeapons;
	local name WeaponCatName_AllSmallCaliberWeapons;

	MedWeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllMediumCaliberWeapons(WeaponCatName_AllMediumCaliberWeapons)
	{
		MedWeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllMediumCaliberWeapons);
	}

	HighWeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllHighCaliberWeapons(WeaponCatName_AllHighCaliberWeapons)
	{
		HighWeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllHighCaliberWeapons);
	}

	SmlWeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllSmallCaliberWeapons(WeaponCatName_AllSmallCaliberWeapons)
	{
		SmlWeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllSmallCaliberWeapons);
	}

	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bExcludeMelee = true;
	Condition.bRequireActivated = false;

	MedEffect = new class'XMBEffect_ConditionalBonus';
	MedEffect = new class'XMBEffect_ConditionalBonus';
	MedEffect.EffectName = 'SavMediumCaliberBonusDamage';
	MedEffect.AddDamageModifier(2,, 'conventional');
	MedEffect.AddDamageModifier(2,, 'magnetic');
	MedEffect.AddDamageModifier(3,, 'beam');	
	MedEffect.AbilityTargetConditions.AddItem(MedWeaponCondition);
	MedEffect.AbilityTargetConditions.AddItem(Condition);
	
	Template = Passive('HighCalDamage', "img:///UILibrary_PerkIcons.UIPerk_bulletshred", false, MedEffect);
	
	SmlEffect = new class'XMBEffect_ConditionalBonus';
	SmlEffect.EffectName = 'SavSmallCaliberBonusDamage';
	SmlEffect.AddDamageModifier(1,, 'conventional');
	SmlEffect.AddDamageModifier(1,, 'magnetic');
	SmlEffect.AddDamageModifier(2,, 'beam');
	SmlEffect.AbilityTargetConditions.AddItem(SmlWeaponCondition);
	SmlEffect.AbilityTargetConditions.AddItem(Condition);
	AddSecondaryEffect(Template, SmlEffect);

	HiEffect = new class'XMBEffect_ConditionalBonus';
	HiEffect.EffectName = 'SavHighCaliberBonusDamage';
	HiEffect.AddArmorPiercingModifier(1,, 'conventional');
	HiEffect.AddArmorPiercingModifier(1,, 'magnetic');
	HiEffect.AddArmorPiercingModifier(2,, 'beam');
	HiEffect.AddDamageModifier(3,, 'conventional');
	HiEffect.AddDamageModifier(3,, 'magnetic');
	HiEffect.AddDamageModifier(4,, 'beam');
	HiEffect.AbilityTargetConditions.AddItem(HighWeaponCondition);
	HiEffect.AbilityTargetConditions.AddItem(Condition);
	AddSecondaryEffect(Template, HiEffect);

	return Template;
}

static function X2AbilityTemplate HiCalRecoil()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalBonus		Effect;
	local XMBCondition_AbilityProperty		Condition;
	local X2Condition_SavWeaponCategory		WeaponCondition;
	local X2Effect_SavWillLoss				SavWillLossEffect;
	local name WeaponCatName_AllShootingWeapons;

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}

	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bExcludeMelee = true;
	Condition.bRequireActivated = false;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'SavBreachBusterRecoil';
	Effect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);	
	Effect.AddToHitModifier(-20);	
	Effect.DuplicateResponse = eDupe_Allow;	
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);

	Template = SelfTargetTrigger('HiCalRecoil', "img:///UILibrary_PerkIcons.UIPerk_bulletshred", false, Effect, 'AbilityActivated');

	Effect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);

	SavWillLossEffect = new class'X2Effect_SavWillLoss';
//	SavWillLossEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	SavWillLossEffect.WillMod = -1;
	AddSecondaryEffect(Template, SavWillLossEffect);
//	ChanceToHit.PercentToHit = 75;
//	Template.AbilityToHitCalc = ChanceToHit;

	AddTriggerTargetCondition(Template, WeaponCondition);	
	AddTriggerTargetCondition(Template, Condition);

	AddIconPassive(Template);

	return Template;
}

static function X2AbilityTemplate HEAmmoDamageHeavy()
{
	local X2AbilityTemplate				Template;
	local XMBEffect_ConditionalBonus	DamageBonus, DamageBonus2;
	local X2Condition_SavWeaponCategory	WeaponCondition, WeaponCondition2;
	local name WeaponCatName_AllShootingWeapons;
	local name WeaponCatName_AllHighCaliberWeapons;

	Template = PurePassive('HEAmmoDamageHeavy', "img:///UILibrary_SavageItems.NewPerks.UIPerk_ExplosiveRupture", false, 'eAbilitySource_Perk', false);

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}
	
	WeaponCondition2 = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllHighCaliberWeapons(WeaponCatName_AllHighCaliberWeapons)
	{
		WeaponCondition2.IncludeWeaponCategories.AddItem(WeaponCatName_AllHighCaliberWeapons);
	}

	DamageBonus = new class'XMBEffect_ConditionalBonus';
	DamageBonus.BuildPersistentEffect(1, false, false, false);
	DamageBonus.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,,Template.AbilitySourceName);
	DamageBonus.AddShredModifier(1);
	DamageBonus.AbilityTargetConditions.AddItem(WeaponCondition2);
	DamageBonus.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);
	Template.AddTargetEffect(DamageBonus);
	
	DamageBonus2 = new class'XMBEffect_ConditionalBonus';
	DamageBonus2.BuildPersistentEffect(1, false, false, false);
	DamageBonus2.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,,Template.AbilitySourceName);
	DamageBonus2.AddDamageModifier(-1, eHit_Crit);
	DamageBonus2.AddToHitModifier(-40, eHit_Crit);
	DamageBonus2.AbilityTargetConditions.AddItem(WeaponCondition);

	AddSecondaryEffect(Template, DamageBonus2);

	return Template;
}

static function X2AbilityTemplate HEAmmoDamageLight()
{
	local X2AbilityTemplate				Template;
	local XMBEffect_ConditionalBonus	DamageBonus;
	local X2Condition_SavWeaponCategory	WeaponCondition;
	local name WeaponCatName_AllSmallCaliberWeapons;

	Template = PurePassive('HEAmmoDamageLight', "img:///UILibrary_SavageItems.NewPerks.UIPerk_ExplosiveRupture", false, 'eAbilitySource_Perk', false);

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllSmallCaliberWeapons(WeaponCatName_AllSmallCaliberWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllSmallCaliberWeapons);
	}
	
	DamageBonus = new class'XMBEffect_ConditionalBonus';
	DamageBonus.BuildPersistentEffect(1, false, false, false);
	DamageBonus.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,,Template.AbilitySourceName);
	DamageBonus.AddDamageModifier(-1);
	DamageBonus.AbilityTargetConditions.AddItem(WeaponCondition);
	DamageBonus.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);

	return Template;
}

	static function X2Effect_HEDamageAmp HERuptureEffect()
{
	local X2Effect_HEDamageAmp 				Effect;
	local X2Condition_SavWeaponCategory	WeaponCondition;
	local name WeaponCatName_AllShootingWeapons;

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}

	Effect = new class'X2Effect_HEDamageAmp';
	Effect.EffectName = 'HERuptureEffect';
	Effect.BuildPersistentEffect(2, false, true, false, eGameRule_PlayerTurnBegin);
	Effect.SetDisplayInfo(ePerkBuff_Penalty, default.HERuptureEffectName, default.HERuptureEffectDesc, "img:///UILibrary_SavageItems.NewPerks.UIPerk_ExplosiveRupture", true);
	Effect.bRemoveWhenTargetDies = true;
	Effect.BonusDamage = 2;
	Effect.TargetConditions.AddItem(WeaponCondition);
	Effect.VisualizationFn = EffectFlyOver_Visualization;

	return Effect;
}

static function X2AbilityTemplate SavStunAmoAbility()
{
	local XMBEffect_ConditionalBonus Effect;
	local X2Condition_UnitProperty UnitPropertyCondition;
	local X2Condition_SavWeaponCategory WeaponCondition;
	local name WeaponCatName_AllShootingWeapons;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddDamageModifier(2);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeOrganic = true;
	UnitPropertyCondition.ExcludeDead = false;
	UnitPropertyCondition.ExcludeFriendlyToSource = true;
	UnitPropertyCondition.ExcludeHostileToSource = false;
	Effect.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}

	Effect.TargetConditions.AddItem(WeaponCondition);

	return Passive('SavStunAmoAbility', "img:///UILibrary_SavageItems.NewPerks.UIPerk_StunAmmo", false, Effect);
}

static function X2AbilityTemplate AAJAmmoBonus()
{
	local X2AbilityTemplate             Template;
	local X2Effect_APRounds				Effect;
	local X2Condition_SavWeaponCategory WeaponCondition;
	local name WeaponCatName_AllShootingWeapons;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AAJAmmoBonus');

	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_ArmorPiercing";
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}

	Effect = new class'X2Effect_APRounds';
	Effect.BuildPersistentEffect(1, true, false, false);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);

	Effect.CritDamage = default.AAJ_CRIT;
	Effect.CritChance = default.AAJ_CRITCHANCE;
	Effect.Pierce = default.AAJ_AP;
	Effect.TargetConditions.AddItem(WeaponCondition);

	Template.AddShooterEffect(Effect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate AAJDEAmmoBonus()
{
	local X2AbilityTemplate             Template;
	local X2Effect_APRounds				Effect;
	local X2Condition_SavWeaponCategory WeaponCondition, WeaponCondition2;
	local XMBEffect_ConditionalBonus	DamageBonus;
	local name WeaponCatName_AllShootingWeapons;
	local name WeaponCatName_AllHighCaliberWeapons;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AAJDEAmmoBonus');

	Template.IconImage = "img:///UILibrary_SavageItems.NewPerks.UIPerk_ArmorPiercing";
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}
	
	WeaponCondition2 = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllHighCaliberWeapons(WeaponCatName_AllHighCaliberWeapons)
	{
		WeaponCondition2.IncludeWeaponCategories.AddItem(WeaponCatName_AllHighCaliberWeapons);
	}

	Effect = new class'X2Effect_APRounds';
	Effect.BuildPersistentEffect(1, true, false, false);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
	Effect.CritDamage = default.AAJDE_CRIT;
	Effect.Pierce = default.AAJDE_AP;
	Effect.TargetConditions.AddItem(WeaponCondition);

	DamageBonus = new class'XMBEffect_ConditionalBonus';
	DamageBonus.BuildPersistentEffect(1, false, false, false);
	DamageBonus.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,,Template.AbilitySourceName);
	DamageBonus.AddShredModifier(2);
	DamageBonus.AbilityTargetConditions.AddItem(WeaponCondition2);
	DamageBonus.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);
	Template.AddTargetEffect(DamageBonus);

	Template.AddShooterEffect(Effect);
	AddSecondaryEffect(Template, DamageBonus);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate CoverPiercing()
{
	local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus		Effect, Effect2, Effect3, Effect4;
	local X2Condition_SavWeaponCategory		WeaponCondition, SniperWeaponCondition;
	local XMBCondition_AbilityProperty		Condition;
	local name WeaponCatName_AllShootingWeapons;
	local name WeaponCatName_HighAccuracySingleShot;


	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}

	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bExcludeMelee = true;
	Condition.bRequireActivated = false;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AbilityTargetConditions.AddItem(default.FullCoverCondition);
	Effect.AddToHitModifier(10);
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);

	SniperWeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_HighAccuracySingleShot(WeaponCatName_HighAccuracySingleShot)
	{
		SniperWeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_HighAccuracySingleShot);
	}
	
	Template = Passive('CoverPiercing', "img:///UILibrary_SavageItems.NewPerks.UIPerk_CoverPiercing", true, Effect);

	Effect2 = new class'XMBEffect_ConditionalBonus';
	Effect2.AbilityTargetConditions.AddItem(default.HalfCoverCondition);
	Effect2.AddArmorPiercingModifier(1);
	Effect2.AddToHitModifier(5);
	Effect2.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect2.AbilityTargetConditions.AddItem(Condition);
	AddSecondaryEffect(Template, Effect2);

	Effect3 = new class'XMBEffect_ConditionalBonus';
	Effect3.AbilityTargetConditions.AddItem(default.NoCoverCondition);
	Effect3.AddArmorPiercingModifier(1);
	Effect3.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect3.AbilityTargetConditions.AddItem(Condition);
	AddSecondaryEffect(Template, Effect3);

	Effect4 = new class'XMBEffect_ConditionalBonus';
	Effect4.AddArmorPiercingModifier(1);
	Effect4.AbilityTargetConditions.AddItem(SniperWeaponCondition);
	Effect4.AbilityTargetConditions.AddItem(Condition);
	AddSecondaryEffect(Template, Effect4);

	return Template;
}

static function X2AbilityTemplate PlasmaBurstDamage()
{
	local X2AbilityTemplate				Template;
	local XMBEffect_ConditionalBonus	DamageBonus, DamageBonus2, DamageBonus3;
	local X2Condition_SavWeaponCategory	WeaponCondition, WeaponCondition2, WeaponCondition3;
	local name WeaponCatName_AllShootingWeapons;
	local name WeaponCatName_AllHighCaliberWeapons;
	local name WeaponCatName_AllPrimaryShootingWeapons;

	Template = PurePassive('PlasmaBurstDamage', "img:///UILibrary_SavageItems.NewPerks.UIPerk_ExplosiveRupture", false, 'eAbilitySource_Perk', false);

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}
	
	WeaponCondition2 = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllHighCaliberWeapons(WeaponCatName_AllHighCaliberWeapons)
	{
		WeaponCondition2.IncludeWeaponCategories.AddItem(WeaponCatName_AllHighCaliberWeapons);
	}	

	WeaponCondition3 = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllPrimaryShootingWeapons(WeaponCatName_AllPrimaryShootingWeapons)
	{
		WeaponCondition3.IncludeWeaponCategories.AddItem(WeaponCatName_AllPrimaryShootingWeapons);
	}
	DamageBonus = new class'XMBEffect_ConditionalBonus';
	DamageBonus.BuildPersistentEffect(1, false, false, false);
	DamageBonus.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,,Template.AbilitySourceName);
	DamageBonus.AddShredModifier(1);
	DamageBonus.AbilityTargetConditions.AddItem(WeaponCondition2);
	DamageBonus.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);
	Template.AddTargetEffect(DamageBonus);
	
	DamageBonus2 = new class'XMBEffect_ConditionalBonus';
	DamageBonus2.BuildPersistentEffect(1, false, false, false);
	DamageBonus2.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,,Template.AbilitySourceName);
	DamageBonus2.AddShredModifier(1);
	DamageBonus2.AddDamageModifier(-1, eHit_Crit);
	DamageBonus2.AddToHitModifier(-10, eHit_Crit);
	DamageBonus2.AbilityTargetConditions.AddItem(WeaponCondition);
	
	DamageBonus3 = new class'XMBEffect_ConditionalBonus';
	DamageBonus3.BuildPersistentEffect(1, false, false, false);
	DamageBonus3.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,,Template.AbilitySourceName);
	DamageBonus3.AddDamageModifier(-1);
	DamageBonus3.AddDamageModifier(-1, eHit_Crit);
	DamageBonus3.AddToHitModifier(-10, eHit_Crit);
	DamageBonus3.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);
	DamageBonus3.AbilityTargetConditions.AddItem(WeaponCondition3);

	AddSecondaryEffect(Template, DamageBonus2);
	AddSecondaryEffect(Template, DamageBonus3);

	return Template;
}

	static function X2Effect_HEDamageAmp PlasmaBurstEffect()
{
	local X2Effect_HEDamageAmp 				Effect;
	local X2Condition_SavWeaponCategory	WeaponCondition;
	local name WeaponCatName_AllShootingWeapons;

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}

	Effect = new class'X2Effect_HEDamageAmp';
	Effect.EffectName = 'HERuptureEffect';
	Effect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnBegin);
	Effect.SetDisplayInfo(ePerkBuff_Penalty, default.PlasmaBurstEffectName, default.PlasmaBurstEffectDesc, "img:///UILibrary_SavageItems.NewPerks.UIPerk_ExplosiveRupture", true);
	Effect.bRemoveWhenTargetDies = true;
	Effect.BonusDamage = 4;
	Effect.TargetConditions.AddItem(WeaponCondition);
	Effect.VisualizationFn = EffectFlyOver_Visualization;

	return Effect;
}

static function X2Effect_PersistentStatChange DisruptorRoundsMentalDisruptionEffect()
{
	local X2Effect_PersistentStatChange		Effect;
	local X2Condition_SavWeaponCategory		WeaponCondition;
	local name WeaponCatName_AllShootingWeapons;

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}

	Effect = new class'X2Effect_PersistentStatChange';
	Effect.SetDisplayInfo(ePerkBuff_Penalty, default.MentalDisruptionEffectName, default.MentalDisruptionEffectDesc, "img:///UILibrary_PerkIcons.UIPerk_insanity", false);
	Effect.BuildPersistentEffect(5, false, true, false, eGameRule_PlayerTurnBegin);
	Effect.AddPersistentStatChange(eStat_Will, default.MENTALDISRUPTIONWILL, MODOP_PostMultiplication);
	Effect.AddPersistentStatChange(eStat_HackDefense, default.MENTALDISRUPTIONHACKDEF, MODOP_PostMultiplication);
	Effect.bApplyOnHit = true;
	Effect.bApplyOnMiss = false;
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.VisualizationFn = EffectFlyOver_Visualization;
	Effect.TargetConditions.AddItem(WeaponCondition);

	return Effect;
}

static function X2AbilityTemplate SmartRoundsAutopsy()
{
	local XMBEffect_ConditionalBonus Effect;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitModifier(20, eHit_Crit);
	Effect.AddDamageModifier(2, eHit_Crit);
	Effect.AbilityTargetConditions.AddItem(new class 'X2Condition_SmartRoundsTargetAutopsy');

	return Passive('SmartRoundsAutopsy', "img:///UILibrary_SavageItems.NewPerks.UIPerk_CritAmmo", false, Effect);
}

static function X2AbilityTemplate SmartRoundsTargetMarked()
{
	local X2AbilityTemplate				Template;
	local XMBEffect_ConditionalBonus	TacScanMarkEffect;
	local X2Condition_UnitEffects		TargetEffectCondition;

	TacScanMarkEffect = new class'XMBEffect_ConditionalBonus';
	TacScanMarkEffect.AddToHitModifier(10);
	TacScanMarkEffect.AddToHitModifier(10, eHit_Crit);
	TacScanMarkEffect.AddToHitModifier(-50, eHit_Graze);
	TacScanMarkEffect.AddDamageModifier(1, eHit_Crit);

	TargetEffectCondition = new class'X2Condition_UnitEffects';
	TargetEffectCondition.AddRequireEffect(class'X2Effect_TacScanFriendlyEffect'.default.TacScanEnemyTagName, 'AA_MissingRequiredEffect');
	TacScanMarkEffect.AbilityTargetConditions.AddItem(TargetEffectCondition);

	Template = Passive('SmartRoundsTargetMarked', "img:///UILibrary_SavageItems.NewPerks.UIPerk_CritAmmo", true, TacScanMarkEffect);

	return Template;
}

static function X2AbilityTemplate SmartRoundsTargetHoloMarked()
{
	local X2AbilityTemplate				Template;
	local XMBEffect_ConditionalBonus	HoloTargetEffect;
	local X2Condition_UnitEffects		TargetEffectCondition;
	
	HoloTargetEffect = new class'XMBEffect_ConditionalBonus';
	HoloTargetEffect.AddToHitModifier(10);
	HoloTargetEffect.AddToHitModifier(10, eHit_Crit);
	HoloTargetEffect.AddToHitModifier(-50, eHit_Graze);
	HoloTargetEffect.AddDamageModifier(1, eHit_Crit);

	TargetEffectCondition = new class'X2Condition_UnitEffects';
	TargetEffectCondition.AddRequireEffect(class'X2Effect_HoloTarget'.default.EffectName, 'AA_MissingRequiredEffect');
	HoloTargetEffect.AbilityTargetConditions.AddItem(TargetEffectCondition);

	Template = Passive('SmartRoundsTargetHoloMarked', "img:///UILibrary_SavageItems.NewPerks.UIPerk_CritAmmo", true, HoloTargetEffect);

	return Template;
}

static function X2AbilityTemplate SmartRoundsMarkTargetMarked()
{
	local X2AbilityTemplate				Template;
	local XMBEffect_ConditionalBonus	MarkTargetEffect;
	local X2Condition_UnitEffects		TargetEffectCondition;
	
	MarkTargetEffect = new class'XMBEffect_ConditionalBonus';
	MarkTargetEffect.AddToHitModifier(10);
	MarkTargetEffect.AddToHitModifier(10, eHit_Crit);
	MarkTargetEffect.AddToHitModifier(-50, eHit_Graze);
	MarkTargetEffect.AddDamageModifier(1, eHit_Crit);

	TargetEffectCondition = new class'X2Condition_UnitEffects';
	TargetEffectCondition.AddRequireEffect(class'X2StatusEffects'.default.MarkedName, 'AA_MissingRequiredEffect');
	MarkTargetEffect.AbilityTargetConditions.AddItem(TargetEffectCondition);
	Template = Passive('SmartRoundsMarkTargetMarked', "img:///UILibrary_SavageItems.NewPerks.UIPerk_CritAmmo", true, MarkTargetEffect);

	return Template;
}

static function X2AbilityTemplate SmartRoundsTargetScanned()
{
	local X2AbilityTemplate				Template;
	local XMBEffect_ConditionalBonus	HoloTargetEffect;
	local X2Condition_UnitEffects		TargetEffectCondition;
	
	HoloTargetEffect = new class'XMBEffect_ConditionalBonus';
	HoloTargetEffect.AddToHitModifier(5);
	HoloTargetEffect.AddToHitModifier(5, eHit_Crit);
	HoloTargetEffect.AddToHitModifier(-25, eHit_Graze);

	TargetEffectCondition = new class'X2Condition_UnitEffects';
	TargetEffectCondition.AddRequireEffect(class'X2Effect_SavScanPing'.default.EffectName, 'AA_MissingRequiredEffect');
	HoloTargetEffect.AbilityTargetConditions.AddItem(TargetEffectCondition);

	Template = Passive('SmartRoundsTargetHoloMarked', "img:///UILibrary_SavageItems.NewPerks.UIPerk_CritAmmo", true, HoloTargetEffect);

	return Template;
}

static function X2AbilityTemplate CreateSavHotShotBonus()
{
	local X2AbilityTemplate				Template;
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_SavWeaponCategory		WeaponCondition;
	local name WeaponCatName_AllShootingWeapons;

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}
	
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitModifier(-5);
	Effect.AddDamageModifier(-1);
	Effect.AddShredModifier(1);
	Effect.AbilityShooterConditions.AddItem(WeaponCondition);
	
	Template = Passive('SavHotShotBonus', "img:///UILibrary_SavageItems.NewPerks.UIPerk_IncendiaryAmmo", true, Effect);

	return Template;
}

static function X2AbilityTemplate CreateSAVBreachBusterRounds()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalBonus		Effect, Effect2;
	local XMBCondition_AbilityProperty		Condition;
	local X2Condition_SavWeaponCategory		WeaponCondition, WeaponCondition2;
	local name WeaponCatName_AllPrimaryShootingWeapons;
	local name WeaponCatName_AllHighCaliberWeapons;
	
	//Condition for Primary only
	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllPrimaryShootingWeapons(WeaponCatName_AllPrimaryShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllPrimaryShootingWeapons);
	}

	WeaponCondition2 = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllHighCaliberWeapons(WeaponCatName_AllHighCaliberWeapons)
	{
		WeaponCondition2.IncludeWeaponCategories.AddItem(WeaponCatName_AllHighCaliberWeapons);
	}
	
	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bExcludeMelee = true;
	Condition.bRequireActivated = false;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'SavBreachBusterBonusDamage';
	Effect.AddDamageModifier(3,, 'conventional');
	Effect.AddDamageModifier(3,, 'magnetic');
	Effect.AddDamageModifier(4,, 'beam');
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);
	
	Template = Passive('SAVBreachBusterRounds', "img:///UILibrary_SavageItems.0_4_Perks.BreachBusterRounds", false, Effect);

	Effect2 = new class'XMBEffect_ConditionalBonus';
	Effect2.EffectName = 'SavBreachBusterHeavyDamage';
	Effect2.AddArmorPiercingModifier(1,, 'conventional');
	Effect2.AddArmorPiercingModifier(1,, 'magnetic');
	Effect2.AddArmorPiercingModifier(2,, 'beam');
	Effect2.AddDamageModifier(1,, 'conventional');
	Effect2.AddDamageModifier(1,, 'magnetic');
	Effect2.AddDamageModifier(1,, 'beam');

	Effect2.AbilityTargetConditions.AddItem(WeaponCondition2);
	Effect2.AbilityTargetConditions.AddItem(Condition);

	AddSecondaryEffect(Template, Effect2);

	return Template;
}

static function X2AbilityTemplate CreateSAVBreachBusted()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalBonus		Effect, Effect2;
	local XMBCondition_AbilityProperty		Condition;
	local X2Condition_SavWeaponCategory		WeaponCondition, WeaponCondition2;
	local X2Effect_SavWillLoss				SavWillLossEffect;
	local name WeaponCatName_AllPrimaryShootingWeapons;
	local name WeaponCatName_AllPrimaryAutomaticWeapons;

	//Condition for Primary only
	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllPrimaryShootingWeapons(WeaponCatName_AllPrimaryShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllPrimaryShootingWeapons);
	}

	//Condition for automatics
	WeaponCondition2 = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllPrimaryAutomaticWeapons(WeaponCatName_AllPrimaryAutomaticWeapons)
	{
		WeaponCondition2.IncludeWeaponCategories.AddItem(WeaponCatName_AllPrimaryAutomaticWeapons);
	}

	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bExcludeMelee = true;
	Condition.bRequireActivated = false;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'SavBreachBusterRecoil';
	Effect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);	
	Effect.AddToHitModifier(-25);	
	Effect.DuplicateResponse = eDupe_Allow;	
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);

	Template = SelfTargetTrigger('SAVBreachBusted', "img:///UILibrary_SavageItems.0_4_Perks.BreachBusted", false, Effect, 'AbilityActivated');

	Effect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);

	Effect2 = new class'XMBEffect_ConditionalBonus';
	Effect2.EffectName = 'SavBreachBusterAutoRecoil';
	Effect2.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	Effect2.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);	
	Effect2.AddToHitModifier(-15);	
	Effect2.DuplicateResponse = eDupe_Allow;	
	Effect2.AbilityTargetConditions.AddItem(WeaponCondition2);
	Effect2.AbilityTargetConditions.AddItem(Condition);
	AddSecondaryEffect(Template, Effect2);

	SavWillLossEffect = new class'X2Effect_SavWillLoss';
//	SavWillLossEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	SavWillLossEffect.WillMod = -2;
	AddSecondaryEffect(Template, SavWillLossEffect);
//	ChanceToHit.PercentToHit = 75;

	AddTriggerTargetCondition(Template, WeaponCondition);	
	AddTriggerTargetCondition(Template, Condition);

	AddIconPassive(Template);

	return Template;
}

static function X2AbilityTemplate CreateSAVSkullSplitterRounds()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalBonus		Effect, Effect2, Effect3;
	local XMBCondition_AbilityProperty		Condition;
	local X2Condition_UnitStatCheck			ConditionArmor;
	local X2Condition_SavWeaponCategory		WeaponCondition;
	local name WeaponCatName_AllPrimaryShootingWeapons;

	//Condition for Primary only
	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllPrimaryShootingWeapons(WeaponCatName_AllPrimaryShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllPrimaryShootingWeapons);
	}

	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bExcludeMelee = true;
	Condition.bRequireActivated = false;

	ConditionArmor = new class'X2Condition_UnitStatCheck';
	ConditionArmor.AddCheckStat(eStat_ArmorMitigation, 0, eCheck_GreaterThan,,, false);
		
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitModifier(30, eHit_Crit);
	Effect.AddDamageModifier(2, eHit_Crit);
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);

	Template = Passive('SAVSkullSplitterRounds', "img:///UILibrary_SavageItems.0_4_Perks.SkullSplitterRounds", true, Effect);
	
	Effect2 = new class'XMBEffect_ConditionalBonus';
	Effect2.AbilityTargetConditions.AddItem(default.FullCoverCondition);
	Effect2.AddDamageModifier(-1, eHit_Crit);
	Effect2.AddToHitModifier(-18, eHit_Crit);
	Effect2.AbilityTargetConditions.AddItem(Condition);
	Effect2.AbilityTargetConditions.AddItem(WeaponCondition);

	Effect3 = new class'XMBEffect_ConditionalBonus';
	Effect3.AbilityTargetConditions.AddItem(ConditionArmor);
	Effect3.AddDamageModifier(-1, eHit_Crit);
	Effect3.AddToHitModifier(-18, eHit_Crit);
	Effect3.AbilityTargetConditions.AddItem(Condition);
	Effect3.AbilityTargetConditions.AddItem(WeaponCondition);	
		
	AddSecondaryEffect(Template, Effect2);
	AddSecondaryEffect(Template, Effect3);

	return Template;
}

static function X2AbilityTemplate CreateSAVButcherRounds()
{
	local X2AbilityTemplate					Template;
	local X2Condition_SavWeaponCategory		WeaponCondition;
	local X2Condition_UnitProperty			TargetCondition;
	local XMBEffect_ConditionalBonus		Effect, Effect2;
	local XMBCondition_AbilityProperty		Condition;
	local name WeaponCatName_AllPrimaryShootingWeapons;

	Template = Passive('SAVButcherRounds', "img:///UILibrary_SavageItems.0_4_Perks.ButcherRounds", false);

	//Condition for Primary only
	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllPrimaryShootingWeapons(WeaponCatName_AllPrimaryShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllPrimaryShootingWeapons);
	}
	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bExcludeMelee = true;
	Condition.bRequireActivated = false;

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeFriendlyToSource = false;
	TargetCondition.ExcludeHostileToSource = false;
	TargetCondition.ExcludeAlive = false;
	TargetCondition.FailOnNonUnits = true;
	TargetCondition.ExcludeRobotic = true;

//Bonus when target is biological
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitModifier(30, eHit_Crit);
	Effect.AddDamageModifier(1, eHit_Crit);
	Effect.AbilityShooterConditions.AddItem(WeaponCondition);
	Effect.AbilityTargetConditions.AddItem(TargetCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);

	AddSecondaryEffect(Template, Effect);

//Bonus when target is autopsied and biological	
	Effect2 = new class'XMBEffect_ConditionalBonus';		
	Effect2.AddDamageModifier(1,, 'conventional');
	Effect2.AddDamageModifier(2,, 'magnetic');
	Effect2.AddDamageModifier(3,, 'beam');
	Effect2.DuplicateResponse = eDupe_Ignore;
	Effect2.AbilityShooterConditions.AddItem(WeaponCondition);
	Effect2.AbilityTargetConditions.AddItem(new class 'X2Condition_SmartRoundsTargetAutopsy');
	Effect2.AbilityTargetConditions.AddItem(TargetCondition);
	Effect2.AbilityTargetConditions.AddItem(Condition);

	AddSecondaryEffect(Template, Effect2);

	return Template;
}

static function X2AbilityTemplate CreateSAVMilspecRounds()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalBonus		Effect;
	local X2Condition_SavWeaponCategory		WeaponCondition;
	local XMBCondition_AbilityProperty		Condition;
	local name WeaponCatName_AllShootingWeapons;

	// Create a conditional bonus effect
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'SavMilspecBonuses';
	Effect.AddToHitModifier(10,, 'conventional');
	Effect.AddToHitModifier(5,, 'magnetic');
	Effect.AddToHitModifier(0,, 'beam');
	Effect.AddToHitModifier(10, eHit_Crit, 'conventional');
	Effect.AddToHitModifier(5, eHit_Crit, 'magnetic');
	Effect.AddToHitModifier(0, eHit_Crit, 'beam');
	Effect.AddDamageModifier(1, eHit_Crit, 'conventional');
	Effect.AddDamageModifier(1, eHit_Crit, 'magnetic');
	Effect.AddDamageModifier(0, eHit_Crit, 'beam');
	Effect.AddDamageModifier(1,, 'conventional');
	Effect.AddDamageModifier(0,, 'magnetic');
	Effect.AddDamageModifier(0,, 'beam');

	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bExcludeMelee = true;
	Condition.bRequireActivated = false;
	Effect.AbilityTargetConditions.AddItem(Condition);

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}

	Effect.AbilityShooterConditions.AddItem(WeaponCondition);

	Template = Passive('SAVMilspecRounds', "img:///UILibrary_SavageItems.0_4_Perks.MilspecRounds", false, Effect);

	return Template;
}

static function X2AbilityTemplate CreateSAVAlienPowerPack()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_ConditionalBonus		Effect;
	local X2Condition_SavWeaponCategory		WeaponCondition;
	local XMBCondition_AbilityProperty		Condition;
	local name WeaponCatName_AllShootingWeapons;

	// Create a conditional bonus effect
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'SavAlienPowerPackBonuses';
	Effect.AddToHitModifier(0,, 'conventional');
	Effect.AddToHitModifier(5,, 'magnetic');
	Effect.AddToHitModifier(10,, 'beam');
	Effect.AddToHitModifier(0, eHit_Crit, 'conventional');
	Effect.AddToHitModifier(7, eHit_Crit, 'magnetic');
	Effect.AddToHitModifier(15, eHit_Crit, 'beam');
	Effect.AddDamageModifier(0, eHit_Crit, 'conventional');
	Effect.AddDamageModifier(1, eHit_Crit, 'magnetic');
	Effect.AddDamageModifier(2, eHit_Crit, 'beam');
	Effect.AddDamageModifier(0,, 'conventional');
	Effect.AddDamageModifier(0,, 'magnetic');
	Effect.AddDamageModifier(1,, 'beam');
	Effect.AddArmorPiercingModifier(1,, 'beam');

	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bExcludeMelee = true;
	Condition.bRequireActivated = false;
	Effect.AbilityTargetConditions.AddItem(Condition);

	WeaponCondition = new class'X2Condition_SavWeaponCategory';
	foreach default.WeaponCatArray_AllShootingWeapons(WeaponCatName_AllShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllShootingWeapons);
	}

	Effect.AbilityShooterConditions.AddItem(WeaponCondition);

	Template = Passive('SAVAlienPowerPack', "img:///UILibrary_SavageItems.0_4_Perks.AlienPowerpackRounds", false, Effect);

	return Template;
}


static function X2AbilityTemplate CreateSAVUnreliableRounds()
{
	local X2AbilityTemplate 				Template;
	local X2Effect_DisableWeapon 			DisableWeaponEffect;
	local X2AbilityToHitCalc_PercentChance	ApplyChance;
	local X2Condition_SavWeaponCategory		WeaponCondition;
	local XMBCondition_AbilityProperty		Condition;
	local name WeaponCatName_AllPrimaryShootingWeapons;

	DisableWeaponEffect = new class'X2Effect_DisableWeapon';
	DisableWeaponEffect.TargetConditions.AddItem(default.LivingTargetUnitOnlyProperty);

	// Create the template using a helper function
	Template = SelfTargetTrigger('SAVUnreliableRounds', "img:///UILibrary_SavageItems.0_4_Perks.UnreliableAmmo", false, DisableWeaponEffect, 'AbilityActivated');

	//Has a chance to trigger
	ApplyChance = new class'X2AbilityToHitCalc_PercentChance';
	ApplyChance.PercentToHit = 15;
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
	foreach default.WeaponCatArray_AllPrimaryShootingWeapons(WeaponCatName_AllPrimaryShootingWeapons)
	{
		WeaponCondition.IncludeWeaponCategories.AddItem(WeaponCatName_AllPrimaryShootingWeapons);
	}
	
	AddTriggerTargetCondition(Template, WeaponCondition);

	// Show a flyover when the ability is activated
	Template.bShowActivation = true;

	return Template;
}