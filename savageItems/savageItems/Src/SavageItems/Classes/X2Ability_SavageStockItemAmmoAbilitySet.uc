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
var config int AAJDE_SHRED;
var config int AAJDE_HVYAP;
var config int AAJDE_HVYSHRED;

var config float MENTALDISRUPTIONWILL;
var config float MENTALDISRUPTIONHACKDEF;

//Configs to add! 
var config int HPTAMMO_CRITCHANCE;//15
var config int HPTAMMO_CRITDAMAGE;//1
var config int HPTAMMO_FULLCOVER_CRITCHANCE;//-5
var config int HPTAMMO_FULLCOVER_CRITDAMAGE;//-1
var config int HPTAMMO_ARMORED_CRITCHANCE;//-5
var config int HPTAMMO_ARMORED_CRITDAMAGE;//-1

var config array<name> AbilityArray_FullAutoShots;
var config int DUMBTRACER_AIM;//3
var config int DUMBTRACER_AUTOMATICS_REACTIONAIM;//6
var config int DUMBTRACER_FULLAUTO_AIM;//8
var config int DUMBTRACER_AUTOMATICS_AIM;//3
var config int DUMBTRACER_SHOOTER_DEFENCEDEBUFF;//-4
var config int DUMBTRACER_TARGETED_DEFENCEDEBUFF;//-6

var config int HVAP_FULLCOVER_AP;//1
var config int HVAP_FULLCOVER_CRITDAM;//-1
var config int HVAP_FULLCOVER_CRITCHANCE;//-50
var config int HVAP_FULLCOVER_AIM;//10
var config int HVAP_HALFCOVER_AP;//2
var config int HVAP_HALFCOVER_CRITDAM;//-1
var config int HVAP_HALFCOVER_CRITCHANCE;//-40
var config int HVAP_HALFCOVER_AIM;//5
var config int HVAP_NOCOVER_AP;//2
var config int HVAP_NOCOVER_CRITDAM;//-1
var config int HVAP_NOCOVER_CRITCHANCE;//-30
var config int HVAP_HIGHACCURACYSINGLESHOT_AP;//1

var config int HIGHCAL_MEDCALDAM_CV;//2
var config int HIGHCAL_MEDCALDAM_MG;//2
var config int HIGHCAL_MEDCALDAM_BM;//3
var config int HIGHCAL_SMLCALDAM_CV;//1
var config int HIGHCAL_SMLCALDAM_MG;//1
var config int HIGHCAL_SMLCALDAM_BM;//2
var config int HIGHCAL_HICALAP_CV;//1
var config int HIGHCAL_HICALAP_MG;//1
var config int HIGHCAL_HICALAP_BM;//2
var config int HIGHCAL_HICALDAM_CV;//3
var config int HIGHCAL_HICALDAM_MG;//3
var config int HIGHCAL_HICALDAM_BM;//4
var config int HIGHCAL_RECOILAIM;//-20
var config int HIGHCAL_RECOILWILLLOSS;//-1

var config int HEROUNDS_HICAL_SHRED;//1
var config int HEROUNDS_CRITDAMAGE;//-1
var config int HEROUNDS_CRITCHANCE;//-40
var config int HEROUNDS_SMLCAL_DAMAGE;//-1
var config int HEROUNDS_RUPTURE_DURATION;//2
var config int HEROUNDS_RUPTURE_DAMAGE;//2

var config int XSTUNROUNDS_ROBOTBONUSDMAGE;//2

var config int COVERPIERCING_FULLCOVER_AIM;//10
var config int COVERPIERCING_HALFCOVER_AP;//1
var config int COVERPIERCING_HALFCOVER_AIM;//5
var config int COVERPIERCING_NOCOVER_AP;//1
var config int COVERPIERCING_HIGHACCURACYSINGLE_AP;//1

var config int PLASMABURSTROUNDS_HICAL_SHRED;//1
var config int PLASMABURSTROUNDS_ALLSHOTS_SHRED;//1
var config int PLASMABURSTROUNDS_ALLSHOTS_CRITDAMAGE;//-1
var config int PLASMABURSTROUNDS_ALLSHOTS_CRITCHANCE;//-10
var config int PLASMABURSTROUNDS_SMALLCAL_DAMAGE;//-1
var config int PLASMABURSTROUNDS_SMALLCAL_CRITCHANCE;//-15
var config int PLASMABURSTROUNDS_RUPTURE_DURTION;//4
var config int PLASMABURSTROUNDS_RUPTURE_DAMAGE;//4

var config int DISRUPTORROUNDS_MENTALDISRUPTION_DURATION;//5

var config int SMARTROUNDS_AUTOPSY_CRITCHANCE;//20
var config int SMARTROUNDS_AUTOPSY_CRITDAMAGE;//2
var config int SMARTROUNDS_TACSCAN_HOLO_MARK_AIM;//10
var config int SMARTROUNDS_TACSCAN_HOLO_MARK_CRITCHANCE;//10
var config int SMARTROUNDS_TACSCAN_HOLO_MARK_DODGEPIERCE;//-50
var config int SMARTROUNDS_TACSCAN_HOLO_MARK_CRITDAMAGE;//1
var config int SMARTROUNDS_SCANNERPINGED_AIM;//5
var config int SMARTROUNDS_SCANNERPINGED_CRITCHANCE;//5
var config int SMARTROUNDS_SCANNERPINGED_DODGEPIERCE;//-25

var config int HOTSHOTROUNDS_ALLSHOTS_AIM;//-5
var config int HOTSHOTROUNDS_ALLSHOTS_SHRED;//1

var config int BREACHBUSTER_ALLPRIMARYWEAPONS_DAMAGE_CV;//3
var config int BREACHBUSTER_ALLPRIMARYWEAPONS_DAMAGE_MG;//3
var config int BREACHBUSTER_ALLPRIMARYWEAPONS_DAMAGE_BM;//4
var config int BREACHBUSTER_HIGHCALBONUS_AP_CV;//1
var config int BREACHBUSTER_HIGHCALBONUS_AP_MG;//1
var config int BREACHBUSTER_HIGHCALBONUS_AP_BM;//2
var config int BREACHBUSTER_HIGHCALBONUS_DAMAGE_CV;//1
var config int BREACHBUSTER_HIGHCALBONUS_DAMAGE_MG;//1
var config int BREACHBUSTER_HIGHCALBONUS_DAMAGE_BM;//1
var config int BREACHBUSTER_ALLPRIMARYWEAPONS_RECOIL_AIM;//-25
var config int BREACHBUSTER_AUTOMATICWEAPONS_RECOIL_AIM;//-15
var config int BREACHBUSTER_RECOIL_WILLDRAIN;//-2

var config int SKULLSPLITTER_APPLYARMORPENALTY_ARMORGREATERTHAN;//0
var config int SKULLSPLITTER_PRIMARYWEAPONS_CRITCHANCE;//35
var config int SKULLSPLITTER_PRIMARYWEAPONS_CRITDAMAGE;//3
var config int SKULLSPLITTER_FULLCOVERPENALTY_CRITDAMAGE;//-1
var config int SKULLSPLITTER_FULLCOVERPENALTY_CRITCHANCE;//-15
var config int SKULLSPLITTER_ARMORPENALTY_CRITDAMAGE;//-1
var config int SKULLSPLITTER_ARMORPENALTY_CRITCHANCE;//-15

var config int BUTCHERROUNDS_BIOLOGICALTARGET_CRITCHANCE;//30
var config int BUTCHERROUNDS_BIOLOGICALTARGET_CRITDAMAGE;//1
var config int BUTCHERROUNDS_AUTOPSYBONUS_DAMAGE_CV;//1
var config int BUTCHERROUNDS_AUTOPSYBONUS_DAMAGE_MG;//2
var config int BUTCHERROUNDS_AUTOPSYBONUS_DAMAGE_BM;//3

var config int MILSPECROUNDS_AIM_CV;//10
var config int MILSPECROUNDS_AIM_MG;//5
var config int MILSPECROUNDS_AIM_BM;//0
var config int MILSPECROUNDS_CRITCHANCE_CV;//10
var config int MILSPECROUNDS_CRITCHANCE_MG;//5
var config int MILSPECROUNDS_CRITCHANCE_BM;//0
var config int MILSPECROUNDS_CRITDAMAGE_CV;//1
var config int MILSPECROUNDS_CRITDAMAGE_MG;//1
var config int MILSPECROUNDS_CRITDAMAGE_BM;//0
var config int MILSPECROUNDS_DAMAGE_CV;//1
var config int MILSPECROUNDS_DAMAGE_MG;//0
var config int MILSPECROUNDS_DAMAGE_BM;//0

var config int ALIENPOWERPACK_AIM_CV;//0
var config int ALIENPOWERPACK_AIM_MG;//5
var config int ALIENPOWERPACK_AIM_BM;//10
var config int ALIENPOWERPACK_CRITCHANCE_CV;//0
var config int ALIENPOWERPACK_CRITCHANCE_MG;//7
var config int ALIENPOWERPACK_CRITCHANCE_BM;//15
var config int ALIENPOWERPACK_CRITDAMAGE_CV;//0
var config int ALIENPOWERPACK_CRITDAMAGE_MG;//1
var config int ALIENPOWERPACK_CRITDAMAGE_BM;//2
var config int ALIENPOWERPACK_DAMAGE_CV;//0
var config int ALIENPOWERPACK_DAMAGE_MG;//0
var config int ALIENPOWERPACK_DAMAGE_BM;//1
var config int ALIENPOWERPACK_AP_BM;//1

var config int UNRELIABLEROUNDS_TRIGGERCHANCE;//15

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
	Effect.AddToHitModifier(default.HPTAMMO_CRITCHANCE, eHit_Crit);
	Effect.AddDamageModifier(default.HPTAMMO_CRITDAMAGE, eHit_Crit);
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
	Effect2.AddDamageModifier(default.HPTAMMO_FULLCOVER_CRITDAMAGE, eHit_Crit);
	Effect2.AddToHitModifier(default.HPTAMMO_FULLCOVER_CRITCHANCE, eHit_Crit);
	Effect2.AbilityTargetConditions.AddItem(Condition);
	Effect2.AbilityTargetConditions.AddItem(WeaponCondition);

	ConditionArmor = new class'X2Condition_UnitStatCheck';
	ConditionArmor.AddCheckStat(eStat_ArmorMitigation, 1, eCheck_GreaterThan,,, false);
	
	Effect3 = new class'XMBEffect_ConditionalBonus';
	Effect3.AbilityTargetConditions.AddItem(ConditionArmor);
	Effect3.AddDamageModifier(default.HPTAMMO_ARMORED_CRITDAMAGE, eHit_Crit);
	Effect3.AddToHitModifier(default.HPTAMMO_ARMORED_CRITCHANCE, eHit_Crit);
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
	local name AbilityName_FullAutoShots;

	Condition = new class'XMBCondition_AbilityProperty';
	Condition.IncludeHostility.AddItem(eHostility_Offensive);
	Condition.ExcludeHostility.AddItem(eHostility_Neutral);
	Condition.ExcludeHostility.AddItem(eHostility_Defensive);
	Condition.bExcludeMelee = true;
	Condition.bRequireActivated = false;

    AbilityNameCondition = new class'XMBCondition_AbilityName';
	foreach default.AbilityArray_FullAutoShots(AbilityName_FullAutoShots)
	{
		AbilityNameCondition.IncludeAbilityNames.AddItem(AbilityName_FullAutoShots);
	}
	
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
	Effect.AddToHitModifier(default.DUMBTRACER_AIM, eHit_Success);
	Effect.AbilityTargetConditions.AddItem(Condition);
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);

	Template = Passive('DumbTracerAim', "UILibrary_SavageItems.NewPerks.UIPerk_TracerRounds", true, Effect);

//	Reaction fire aim bonus for automatic weapons
	Effect2 = new class'XMBEffect_ConditionalBonus';
	Effect2.AddToHitModifier(default.DUMBTRACER_AUTOMATICS_REACTIONAIM, eHit_Success);
	Effect2.AbilityTargetConditions.AddItem(WeaponCondition2);
	Effect2.AbilityTargetConditions.AddItem(default.ReactionFireCondition);
	Effect2.AbilityTargetConditions.AddItem(Condition);
	AddSecondaryEffect(Template, Effect2);

//	Autofire aim bonus for people with RPGO - eliminates about half of the aim debuff applied to that ability
	Effect3 = new class'XMBEffect_ConditionalBonus';
	Effect3.AddToHitModifier(default.DUMBTRACER_FULLAUTO_AIM, eHit_Success);
	Effect3.AbilityTargetConditions.AddItem(AbilityNameCondition);
	Effect3.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect3.AbilityTargetConditions.AddItem(Condition);
	AddSecondaryEffect(Template, Effect3);

//	Aim bonus for automatic weapons, effectively doubling the base aim bonus for certain weapons
	Effect4 = new class'XMBEffect_ConditionalBonus';
	Effect4.AddToHitModifier(default.DUMBTRACER_AUTOMATICS_AIM, eHit_Success);
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
	DefenceDebuff.AddPersistentStatChange(eStat_Defense, default.DUMBTRACER_SHOOTER_DEFENCEDEBUFF, MODOP_Addition);
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
	Effect.AddPersistentStatChange(eStat_Defense, default.DUMBTRACER_TARGETED_DEFENCEDEBUFF, MODOP_Addition);
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
	Effect.AddArmorPiercingModifier(default.HVAP_FULLCOVER_AP);
	Effect.AddDamageModifier(default.HVAP_FULLCOVER_CRITDAM, eHit_Crit);
	Effect.AddToHitModifier(default.HVAP_FULLCOVER_CRITCHANCE, eHit_Crit);
	Effect.AddToHitModifier(default.HVAP_FULLCOVER_AIM);
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	
	Template = Passive('HVAPMod', "img:///UILibrary_SavageItems.NewPerks.UIPerk_ArmorPiercing", true, Effect);

	Effect2 = new class'XMBEffect_ConditionalBonus';
	Effect2.AbilityTargetConditions.AddItem(default.HalfCoverCondition);
	Effect2.AddArmorPiercingModifier(default.HVAP_HALFCOVER_AP);
	Effect2.AddDamageModifier(default.HVAP_HALFCOVER_CRITDAM, eHit_Crit);
	Effect2.AddToHitModifier(default.HVAP_HALFCOVER_CRITCHANCE, eHit_Crit);
	Effect2.AddToHitModifier(default.HVAP_HALFCOVER_AIM);
	Effect2.AbilityTargetConditions.AddItem(WeaponCondition);
	AddSecondaryEffect(Template, Effect2);

	Effect3 = new class'XMBEffect_ConditionalBonus';
	Effect3.AbilityTargetConditions.AddItem(default.NoCoverCondition);
	Effect3.AddArmorPiercingModifier(default.HVAP_NOCOVER_AP);
	Effect3.AddDamageModifier(default.HVAP_NOCOVER_CRITDAM, eHit_Crit);
	Effect3.AddToHitModifier(default.HVAP_NOCOVER_CRITCHANCE, eHit_Crit);
	Effect3.AbilityTargetConditions.AddItem(WeaponCondition);
	AddSecondaryEffect(Template, Effect3);

	Effect4 = new class'XMBEffect_ConditionalBonus';
	Effect4.AddArmorPiercingModifier(default.HVAP_HIGHACCURACYSINGLESHOT_AP);
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
	MedEffect.AddDamageModifier(default.HIGHCAL_MEDCALDAM_CV,, 'conventional');
	MedEffect.AddDamageModifier(default.HIGHCAL_MEDCALDAM_MG,, 'magnetic');
	MedEffect.AddDamageModifier(default.HIGHCAL_MEDCALDAM_BM,, 'beam');	
	MedEffect.AbilityTargetConditions.AddItem(MedWeaponCondition);
	MedEffect.AbilityTargetConditions.AddItem(Condition);
	
	Template = Passive('HighCalDamage', "img:///UILibrary_PerkIcons.UIPerk_bulletshred", false, MedEffect);

	SmlEffect = new class'XMBEffect_ConditionalBonus';
	SmlEffect.EffectName = 'SavSmallCaliberBonusDamage';
	SmlEffect.AddDamageModifier(default.HIGHCAL_SMLCALDAM_CV,, 'conventional');
	SmlEffect.AddDamageModifier(default.HIGHCAL_SMLCALDAM_MG,, 'magnetic');
	SmlEffect.AddDamageModifier(default.HIGHCAL_SMLCALDAM_BM,, 'beam');
	SmlEffect.AbilityTargetConditions.AddItem(SmlWeaponCondition);
	SmlEffect.AbilityTargetConditions.AddItem(Condition);
	AddSecondaryEffect(Template, SmlEffect);
	
	HiEffect = new class'XMBEffect_ConditionalBonus';
	HiEffect.EffectName = 'SavHighCaliberBonusDamage';
	HiEffect.AddArmorPiercingModifier(default.HIGHCAL_HICALAP_CV,, 'conventional');
	HiEffect.AddArmorPiercingModifier(default.HIGHCAL_HICALAP_MG,, 'magnetic');
	HiEffect.AddArmorPiercingModifier(default.HIGHCAL_HICALAP_BM,, 'beam');
	HiEffect.AddDamageModifier(default.HIGHCAL_HICALDAM_CV,, 'conventional');
	HiEffect.AddDamageModifier(default.HIGHCAL_HICALDAM_MG,, 'magnetic');
	HiEffect.AddDamageModifier(default.HIGHCAL_HICALDAM_BM,, 'beam');
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
	Effect.EffectName = 'SavHighCaliberRecoil';
	Effect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);	
	Effect.AddToHitModifier(default.HIGHCAL_RECOILAIM);	
	Effect.DuplicateResponse = eDupe_Allow;	
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);

	Template = SelfTargetTrigger('HiCalRecoil', "img:///UILibrary_PerkIcons.UIPerk_bulletshred", false, Effect, 'AbilityActivated');

	Effect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);

	SavWillLossEffect = new class'X2Effect_SavWillLoss';
//	SavWillLossEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	SavWillLossEffect.WillMod = default.HIGHCAL_RECOILWILLLOSS;
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
	DamageBonus.AddShredModifier(default.HEROUNDS_HICAL_SHRED);
	DamageBonus.AbilityTargetConditions.AddItem(WeaponCondition2);
	DamageBonus.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);
	Template.AddTargetEffect(DamageBonus);
	
	DamageBonus2 = new class'XMBEffect_ConditionalBonus';
	DamageBonus2.BuildPersistentEffect(1, false, false, false);
	DamageBonus2.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,,Template.AbilitySourceName);
	DamageBonus2.AddDamageModifier(default.HEROUNDS_CRITDAMAGE, eHit_Crit);
	DamageBonus2.AddToHitModifier(default.HEROUNDS_CRITCHANCE, eHit_Crit);
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
	DamageBonus.AddDamageModifier(default.HEROUNDS_SMLCAL_DAMAGE);
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
	Effect.BuildPersistentEffect(default.HEROUNDS_RUPTURE_DURATION, false, true, false, eGameRule_PlayerTurnBegin);
	Effect.SetDisplayInfo(ePerkBuff_Penalty, default.HERuptureEffectName, default.HERuptureEffectDesc, "img:///UILibrary_SavageItems.NewPerks.UIPerk_ExplosiveRupture", true);
	Effect.bRemoveWhenTargetDies = true;
	Effect.BonusDamage = default.HEROUNDS_RUPTURE_DAMAGE;
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
	Effect.AddDamageModifier(default.XSTUNROUNDS_ROBOTBONUSDMAGE);

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
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_SavWeaponCategory	WeaponCondition;
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

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddDamageModifier(default.AAJ_CRIT, eHit_Crit);
	Effect.AddToHitModifier(default.AAJ_CRITCHANCE, eHit_Crit);
	Effect.AddArmorPiercingModifier(default.AAJ_AP);
	Effect.BuildPersistentEffect(1, true, false, false);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	Template.AddTargetEffect(Effect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate AAJDEAmmoBonus()
{
	local X2AbilityTemplate             Template;
	local XMBEffect_ConditionalBonus	Effect;
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

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddArmorPiercingModifier(default.AAJDE_AP);
	Effect.AddShredModifier(default.AAJDE_SHRED);
	Effect.BuildPersistentEffect(1, true, false, false);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	Template.AddTargetEffect(Effect);

	DamageBonus = new class'XMBEffect_ConditionalBonus';
	DamageBonus.BuildPersistentEffect(1, false, false, false);
	DamageBonus.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,,Template.AbilitySourceName);
	DamageBonus.AddShredModifier(default.AAJDE_HVYSHRED);
	DamageBonus.AddArmorPiercingModifier(default.AAJDE_HVYAP);
	DamageBonus.AbilityTargetConditions.AddItem(WeaponCondition2);
	DamageBonus.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);
	Template.AddTargetEffect(DamageBonus);

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
	Effect.AddToHitModifier(default.COVERPIERCING_FULLCOVER_AIM);
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
	Effect2.AddArmorPiercingModifier(default.COVERPIERCING_HALFCOVER_AP);
	Effect2.AddToHitModifier(default.COVERPIERCING_HALFCOVER_AIM);
	Effect2.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect2.AbilityTargetConditions.AddItem(Condition);
	AddSecondaryEffect(Template, Effect2);

	Effect3 = new class'XMBEffect_ConditionalBonus';
	Effect3.AbilityTargetConditions.AddItem(default.NoCoverCondition);
	Effect3.AddArmorPiercingModifier(default.COVERPIERCING_NOCOVER_AP);
	Effect3.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect3.AbilityTargetConditions.AddItem(Condition);
	AddSecondaryEffect(Template, Effect3);

	Effect4 = new class'XMBEffect_ConditionalBonus';
	Effect4.AddArmorPiercingModifier(default.COVERPIERCING_HIGHACCURACYSINGLE_AP);
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
	local name WeaponCatName_AllSmallCaliberWeapons;

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
	foreach default.WeaponCatArray_AllSmallCaliberWeapons(WeaponCatName_AllSmallCaliberWeapons)
	{
		WeaponCondition3.IncludeWeaponCategories.AddItem(WeaponCatName_AllSmallCaliberWeapons);
	}

	DamageBonus = new class'XMBEffect_ConditionalBonus';
	DamageBonus.BuildPersistentEffect(1, false, false, false);
	DamageBonus.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,,Template.AbilitySourceName);
	DamageBonus.AddShredModifier(default.PLASMABURSTROUNDS_HICAL_SHRED);
	DamageBonus.AbilityTargetConditions.AddItem(WeaponCondition2);
	DamageBonus.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);
	Template.AddTargetEffect(DamageBonus);
	
	DamageBonus2 = new class'XMBEffect_ConditionalBonus';
	DamageBonus2.BuildPersistentEffect(1, false, false, false);
	DamageBonus2.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,,Template.AbilitySourceName);
	DamageBonus2.AddShredModifier(default.PLASMABURSTROUNDS_ALLSHOTS_SHRED);
	DamageBonus2.AddDamageModifier(default.PLASMABURSTROUNDS_ALLSHOTS_CRITDAMAGE, eHit_Crit);
	DamageBonus2.AddToHitModifier(default.PLASMABURSTROUNDS_ALLSHOTS_CRITCHANCE, eHit_Crit);
	DamageBonus2.AbilityTargetConditions.AddItem(WeaponCondition);
	
	DamageBonus3 = new class'XMBEffect_ConditionalBonus';
	DamageBonus3.BuildPersistentEffect(1, false, false, false);
	DamageBonus3.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,,Template.AbilitySourceName);
	DamageBonus3.AddDamageModifier(default.PLASMABURSTROUNDS_SMALLCAL_DAMAGE);
	DamageBonus3.AddToHitModifier(default.PLASMABURSTROUNDS_SMALLCAL_CRITCHANCE, eHit_Crit);
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
	Effect.BuildPersistentEffect(default.PLASMABURSTROUNDS_RUPTURE_DURTION, false, true, false, eGameRule_PlayerTurnBegin);
	Effect.SetDisplayInfo(ePerkBuff_Penalty, default.PlasmaBurstEffectName, default.PlasmaBurstEffectDesc, "img:///UILibrary_SavageItems.NewPerks.UIPerk_ExplosiveRupture", true);
	Effect.bRemoveWhenTargetDies = true;
	Effect.BonusDamage = default.PLASMABURSTROUNDS_RUPTURE_DAMAGE;
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
	Effect.BuildPersistentEffect(default.DISRUPTORROUNDS_MENTALDISRUPTION_DURATION, false, true, false, eGameRule_PlayerTurnBegin);
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
	Effect.AddToHitModifier(default.SMARTROUNDS_AUTOPSY_CRITCHANCE, eHit_Crit);
	Effect.AddDamageModifier(default.SMARTROUNDS_AUTOPSY_CRITDAMAGE, eHit_Crit);
	Effect.AbilityTargetConditions.AddItem(new class 'X2Condition_SmartRoundsTargetAutopsy');

	return Passive('SmartRoundsAutopsy', "img:///UILibrary_SavageItems.NewPerks.UIPerk_CritAmmo", false, Effect);
}

static function X2AbilityTemplate SmartRoundsTargetMarked()
{
	local X2AbilityTemplate				Template;
	local XMBEffect_ConditionalBonus	TacScanMarkEffect;
	local X2Condition_UnitEffects		TargetEffectCondition;

	TacScanMarkEffect = new class'XMBEffect_ConditionalBonus';
	TacScanMarkEffect.AddToHitModifier(default.SMARTROUNDS_TACSCAN_HOLO_MARK_AIM);
	TacScanMarkEffect.AddToHitModifier(default.SMARTROUNDS_TACSCAN_HOLO_MARK_CRITCHANCE, eHit_Crit);
	TacScanMarkEffect.AddToHitModifier(default.SMARTROUNDS_TACSCAN_HOLO_MARK_DODGEPIERCE, eHit_Graze);
	TacScanMarkEffect.AddDamageModifier(default.SMARTROUNDS_TACSCAN_HOLO_MARK_CRITDAMAGE, eHit_Crit);

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
	HoloTargetEffect.AddToHitModifier(default.SMARTROUNDS_TACSCAN_HOLO_MARK_AIM);
	HoloTargetEffect.AddToHitModifier(default.SMARTROUNDS_TACSCAN_HOLO_MARK_CRITCHANCE, eHit_Crit);
	HoloTargetEffect.AddToHitModifier(default.SMARTROUNDS_TACSCAN_HOLO_MARK_DODGEPIERCE, eHit_Graze);
	HoloTargetEffect.AddDamageModifier(default.SMARTROUNDS_TACSCAN_HOLO_MARK_CRITDAMAGE, eHit_Crit);

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
	MarkTargetEffect.AddToHitModifier(default.SMARTROUNDS_TACSCAN_HOLO_MARK_AIM);
	MarkTargetEffect.AddToHitModifier(default.SMARTROUNDS_TACSCAN_HOLO_MARK_CRITCHANCE, eHit_Crit);
	MarkTargetEffect.AddToHitModifier(default.SMARTROUNDS_TACSCAN_HOLO_MARK_DODGEPIERCE, eHit_Graze);
	MarkTargetEffect.AddDamageModifier(default.SMARTROUNDS_TACSCAN_HOLO_MARK_CRITDAMAGE, eHit_Crit);

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
	HoloTargetEffect.AddToHitModifier(default.SMARTROUNDS_SCANNERPINGED_AIM);
	HoloTargetEffect.AddToHitModifier(default.SMARTROUNDS_SCANNERPINGED_CRITCHANCE, eHit_Crit);
	HoloTargetEffect.AddToHitModifier(default.SMARTROUNDS_SCANNERPINGED_DODGEPIERCE, eHit_Graze);

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
	Effect.AddToHitModifier(default.HOTSHOTROUNDS_ALLSHOTS_AIM);
	Effect.AddShredModifier(default.HOTSHOTROUNDS_ALLSHOTS_SHRED);
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
	Effect.AddDamageModifier(default.BREACHBUSTER_ALLPRIMARYWEAPONS_DAMAGE_CV,, 'conventional');
	Effect.AddDamageModifier(default.BREACHBUSTER_ALLPRIMARYWEAPONS_DAMAGE_MG,, 'magnetic');
	Effect.AddDamageModifier(default.BREACHBUSTER_ALLPRIMARYWEAPONS_DAMAGE_BM,, 'beam');
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);
	
	Template = Passive('SAVBreachBusterRounds', "img:///UILibrary_SavageItems.0_4_Perks.BreachBusterRounds", false, Effect);

	Effect2 = new class'XMBEffect_ConditionalBonus';
	Effect2.EffectName = 'SavBreachBusterHeavyDamage';
	Effect2.AddArmorPiercingModifier(default.BREACHBUSTER_HIGHCALBONUS_AP_CV,, 'conventional');
	Effect2.AddArmorPiercingModifier(default.BREACHBUSTER_HIGHCALBONUS_AP_MG,, 'magnetic');
	Effect2.AddArmorPiercingModifier(default.BREACHBUSTER_HIGHCALBONUS_AP_BM,, 'beam');
	Effect2.AddDamageModifier(default.BREACHBUSTER_HIGHCALBONUS_DAMAGE_CV,, 'conventional');
	Effect2.AddDamageModifier(default.BREACHBUSTER_HIGHCALBONUS_DAMAGE_MG,, 'magnetic');
	Effect2.AddDamageModifier(default.BREACHBUSTER_HIGHCALBONUS_DAMAGE_BM,, 'beam');
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
	Effect.AddToHitModifier(default.BREACHBUSTER_ALLPRIMARYWEAPONS_RECOIL_AIM);	
	Effect.DuplicateResponse = eDupe_Allow;	
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);

	Template = SelfTargetTrigger('SAVBreachBusted', "img:///UILibrary_SavageItems.0_4_Perks.BreachBusted", false, Effect, 'AbilityActivated');

	Effect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);

	Effect2 = new class'XMBEffect_ConditionalBonus';
	Effect2.EffectName = 'SavBreachBusterAutoRecoil';
	Effect2.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	Effect2.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);	
	Effect2.AddToHitModifier(default.BREACHBUSTER_AUTOMATICWEAPONS_RECOIL_AIM);	
	Effect2.DuplicateResponse = eDupe_Allow;	
	Effect2.AbilityTargetConditions.AddItem(WeaponCondition2);
	Effect2.AbilityTargetConditions.AddItem(Condition);
	AddSecondaryEffect(Template, Effect2);

	SavWillLossEffect = new class'X2Effect_SavWillLoss';
//	SavWillLossEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	SavWillLossEffect.WillMod = default.BREACHBUSTER_RECOIL_WILLDRAIN;
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
	ConditionArmor.AddCheckStat(eStat_ArmorMitigation, default.SKULLSPLITTER_APPLYARMORPENALTY_ARMORGREATERTHAN, eCheck_GreaterThan,,, false);
		
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitModifier(default.SKULLSPLITTER_PRIMARYWEAPONS_CRITCHANCE, eHit_Crit);
	Effect.AddDamageModifier(default.SKULLSPLITTER_PRIMARYWEAPONS_CRITDAMAGE, eHit_Crit);
	Effect.AbilityTargetConditions.AddItem(WeaponCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);

	Template = Passive('SAVSkullSplitterRounds', "img:///UILibrary_SavageItems.0_4_Perks.SkullSplitterRounds", true, Effect);
	
	Effect2 = new class'XMBEffect_ConditionalBonus';
	Effect2.AbilityTargetConditions.AddItem(default.FullCoverCondition);
	Effect2.AddDamageModifier(default.SKULLSPLITTER_FULLCOVERPENALTY_CRITDAMAGE, eHit_Crit);
	Effect2.AddToHitModifier(default.SKULLSPLITTER_FULLCOVERPENALTY_CRITCHANCE, eHit_Crit);
	Effect2.AbilityTargetConditions.AddItem(Condition);
	Effect2.AbilityTargetConditions.AddItem(WeaponCondition);

	Effect3 = new class'XMBEffect_ConditionalBonus';
	Effect3.AbilityTargetConditions.AddItem(ConditionArmor);
	Effect3.AddDamageModifier(default.SKULLSPLITTER_ARMORPENALTY_CRITDAMAGE, eHit_Crit);
	Effect3.AddToHitModifier(default.SKULLSPLITTER_ARMORPENALTY_CRITCHANCE, eHit_Crit);
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
	Effect.AddToHitModifier(default.BUTCHERROUNDS_BIOLOGICALTARGET_CRITCHANCE, eHit_Crit);
	Effect.AddDamageModifier(default.BUTCHERROUNDS_BIOLOGICALTARGET_CRITDAMAGE, eHit_Crit);
	Effect.AbilityShooterConditions.AddItem(WeaponCondition);
	Effect.AbilityTargetConditions.AddItem(TargetCondition);
	Effect.AbilityTargetConditions.AddItem(Condition);

	AddSecondaryEffect(Template, Effect);

//Bonus when target is autopsied and biological	
	Effect2 = new class'XMBEffect_ConditionalBonus';		
	Effect2.AddDamageModifier(default.BUTCHERROUNDS_AUTOPSYBONUS_DAMAGE_CV,, 'conventional');
	Effect2.AddDamageModifier(default.BUTCHERROUNDS_AUTOPSYBONUS_DAMAGE_MG,, 'magnetic');
	Effect2.AddDamageModifier(default.BUTCHERROUNDS_AUTOPSYBONUS_DAMAGE_BM,, 'beam');
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
	Effect.AddToHitModifier(default.MILSPECROUNDS_AIM_CV,, 'conventional');
	Effect.AddToHitModifier(default.MILSPECROUNDS_AIM_MG,, 'magnetic');
	Effect.AddToHitModifier(default.MILSPECROUNDS_AIM_BM,, 'beam');
	Effect.AddToHitModifier(default.MILSPECROUNDS_CRITCHANCE_CV, eHit_Crit, 'conventional');
	Effect.AddToHitModifier(default.MILSPECROUNDS_CRITCHANCE_MG, eHit_Crit, 'magnetic');
	Effect.AddToHitModifier(default.MILSPECROUNDS_CRITCHANCE_BM, eHit_Crit, 'beam');
	Effect.AddDamageModifier(default.MILSPECROUNDS_CRITDAMAGE_CV, eHit_Crit, 'conventional');
	Effect.AddDamageModifier(default.MILSPECROUNDS_CRITDAMAGE_MG, eHit_Crit, 'magnetic');
	Effect.AddDamageModifier(default.MILSPECROUNDS_CRITDAMAGE_BM, eHit_Crit, 'beam');
	Effect.AddDamageModifier(default.MILSPECROUNDS_DAMAGE_CV,, 'conventional');
	Effect.AddDamageModifier(default.MILSPECROUNDS_DAMAGE_MG,, 'magnetic');
	Effect.AddDamageModifier(default.MILSPECROUNDS_DAMAGE_BM,, 'beam');

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
	Effect.AddToHitModifier(default.ALIENPOWERPACK_AIM_CV,, 'conventional');
	Effect.AddToHitModifier(default.ALIENPOWERPACK_AIM_MG,, 'magnetic');
	Effect.AddToHitModifier(default.ALIENPOWERPACK_AIM_BM,, 'beam');
	Effect.AddToHitModifier(default.ALIENPOWERPACK_CRITCHANCE_CV, eHit_Crit, 'conventional');
	Effect.AddToHitModifier(default.ALIENPOWERPACK_CRITCHANCE_MG, eHit_Crit, 'magnetic');
	Effect.AddToHitModifier(default.ALIENPOWERPACK_CRITCHANCE_BM, eHit_Crit, 'beam');
	Effect.AddDamageModifier(default.ALIENPOWERPACK_CRITDAMAGE_CV, eHit_Crit, 'conventional');
	Effect.AddDamageModifier(default.ALIENPOWERPACK_CRITDAMAGE_MG, eHit_Crit, 'magnetic');
	Effect.AddDamageModifier(default.ALIENPOWERPACK_CRITDAMAGE_BM, eHit_Crit, 'beam');
	Effect.AddDamageModifier(default.ALIENPOWERPACK_DAMAGE_CV,, 'conventional');
	Effect.AddDamageModifier(default.ALIENPOWERPACK_DAMAGE_MG,, 'magnetic');
	Effect.AddDamageModifier(default.ALIENPOWERPACK_DAMAGE_BM,, 'beam');
	Effect.AddArmorPiercingModifier(default.ALIENPOWERPACK_AP_BM,, 'beam');

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
	ApplyChance.PercentToHit = default.UNRELIABLEROUNDS_TRIGGERCHANCE;
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