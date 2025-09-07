class AHarderWar_Abilities_ChosenAssassin extends X2Ability_ChosenAssassin config(AHWChosenPack_Configuration);

var config int DEVASTATION_T1_MOBILITY;
var config int DEVASTATION_T1_DODGE;
var config int DEVASTATION_T1_DAMAGE;

var config int DEVASTATION_T2_MOBILITY;
var config int DEVASTATION_T2_DODGE;
var config int DEVASTATION_T2_DAMAGE;

var config int DEVASTATION_T3_MOBILITY;
var config int DEVASTATION_T3_DODGE;
var config int DEVASTATION_T3_DAMAGE;

var config int DANCINGSHADOWS_MOBILITY_INCREASE;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(AssassinAbility_Expose());
	Templates.AddItem(AssassinAbility_Decimate());
	Templates.AddItem(AssassinAbility_AssassinFocus());
	Templates.AddItem(AssassinAbility_DancingShadows());
	Templates.AddItem(AssassinAbility_DancingShadows2());
	Templates.AddItem(AssassinAbility_DeadlyCadence());
	Templates.AddItem(AssassinAbility_DeadlyCadence2());

	return Templates;
}

static function X2AbilityTemplate AssassinAbility_Expose()
{
	local X2AbilityTemplate						Template;
	local X2Effect_ApplyDirectionalWorldDamage  WorldDamage;
	local X2AbilityCooldown						Cooldown;
	local X2Condition_UnitProperty              TargetCondition;
	local X2AbilityToHitCalc_StandardAim		StandardAim;
	local X2Effect_RemoveEffects				RemoveEffects;
	local X2Effect_ApplyWeaponDamage			WeaponDamageEffect;
	local X2Effect_Persistent					MarkedEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AssassinAbility_Expose');

	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SERGEANT_PRIORITY;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_demolition";
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.bLimitTargetIcons = true;
	Template.bShowActivation = true;

	Template.AbilityCosts.AddItem(default.FreeActionCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 2;
	Template.AbilityCooldown = Cooldown;

	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bMultiTargetOnly = true;
	StandardAim.bGuaranteedHit = true;
	Template.AbilityToHitCalc = StandardAim;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeAlive=false;
	TargetCondition.ExcludeDead=true;
	TargetCondition.ExcludeFriendlyToSource=true;
	TargetCondition.ExcludeHostileToSource=false;
	TargetCondition.FailOnNonUnits = true;
	Template.AbilityTargetConditions.AddItem(TargetCondition);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	WorldDamage = new class'X2Effect_ApplyDirectionalWorldDamage';
	WorldDamage.bUseWeaponDamageType = true;
	WorldDamage.bUseWeaponEnvironmentalDamage = false;
	WorldDamage.EnvironmentalDamageAmount = 30;
	WorldDamage.bApplyOnHit = true;
	WorldDamage.bApplyOnMiss = true;
	WorldDamage.bApplyToWorldOnHit = true;
	WorldDamage.bApplyToWorldOnMiss = true;
	WorldDamage.bHitAdjacentDestructibles = true;
	WorldDamage.PlusNumZTiles = 1;
	WorldDamage.bHitTargetTile = true;
	Template.AddTargetEffect(WorldDamage);

	// Doesn't actually do any damage. But it does cause Overwatch removal. 
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bIgnoreBaseDamage = true;
	Template.AddTargetEffect(WeaponDamageEffect);

	MarkedEffect = class'X2StatusEffects'.static.CreateMarkedEffect(2, false);
	Template.AddTargetEffect(MarkedEffect);

	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2Effect_Suppression'.default.EffectName);

	//  visually always appear as a miss so the target unit doesn't look like it's being damaged
	Template.bOverrideVisualResult = true;
	Template.OverrideVisualResult = eHit_Miss;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate AssassinAbility_Decimate()
{
	local X2AbilityTemplate						Template;
	local X2AbilityToHitCalc_StandardAim		StandardAim;
	local X2AbilityTarget_Cursor				CursorTarget;
	local X2AbilityMultiTarget_Line				LineMultiTarget;
	local X2Condition_UnitProperty				TargetCondition;
	local X2AbilityCost_ActionPoints			ActionCost;
	local X2Effect_ApplyWeaponDamage			WeaponDamageEffect;
	local X2Effect_ApplyDirectionalWorldDamage  WorldDamage;
	local X2AbilityCooldown						Cooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AssassinAbility_Decimate');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Offensive;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_saturationfire";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	ActionCost = new class'X2AbilityCost_ActionPoints';
	ActionCost.iNumPoints = 1;
	ActionCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 5;
	Template.AbilityCooldown = Cooldown;

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);	

	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bMultiTargetOnly = true;
	StandardAim.bGuaranteedHit = true;
	StandardAim.bAllowCrit = true;
	Template.AbilityToHitCalc = StandardAim;
	
	Template.bOverrideAim = true;

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.FixedAbilityRange = 15;
	Template.AbilityTargetStyle = CursorTarget;

	LineMultiTarget = new class'X2AbilityMultiTarget_Line';
	Template.AbilityMultiTargetStyle = LineMultiTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeFriendlyToSource = false;
	TargetCondition.ExcludeDead = true;
	Template.AbilityMultiTargetConditions.AddItem(TargetCondition);

	WorldDamage = new class'X2Effect_ApplyDirectionalWorldDamage';
	WorldDamage.bUseWeaponDamageType = true;
	WorldDamage.bUseWeaponEnvironmentalDamage = false;
	WorldDamage.EnvironmentalDamageAmount = 30;
	WorldDamage.bApplyOnHit = true;
	WorldDamage.bApplyOnMiss = true;
	WorldDamage.bApplyToWorldOnHit = true;
	WorldDamage.bApplyToWorldOnMiss = true;
	WorldDamage.bHitAdjacentDestructibles = true;
	WorldDamage.PlusNumZTiles = 1;
	WorldDamage.bHitTargetTile = true;
	WorldDamage.ApplyChance = class'X2Ability_GrenadierAbilitySet'.default.SATURATION_DESTRUCTION_CHANCE;
	Template.AddMultiTargetEffect(WorldDamage);

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bAlwaysKillsCivilians = true;
	Template.AddMultiTargetEffect(WeaponDamageEffect);

	Template.TargetingMethod = class'X2TargetingMethod_Line';
	Template.CinescriptCameraType = "Grenadier_SaturationFire";

	Template.bUseSourceLocationZToAim = true;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.bShowActivation = true;

	return Template;
}

static function X2AbilityTemplate AssassinAbility_AssassinFocus()
{
	local X2AbilityTemplate		Template;
	local X2Effect_TemplarFocus	FocusEffect;
	local array<StatChange>		StatChanges;
	local StatChange			NewStatChange;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AssassinAbility_AssassinFocus');

	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_InnerFocus";
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	FocusEffect = new class'X2Effect_TemplarFocus';
	FocusEffect.BuildPersistentEffect(1, true, false);
	FocusEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, false, , Template.AbilitySourceName);

	//	focus 0
	StatChanges.Length = 0;
	FocusEffect.AddNextFocusLevel(StatChanges, 0, 0);
	//	focus 1
	StatChanges.Length = 0;
	NewStatChange.StatType = eStat_Mobility;
	NewStatChange.StatAmount = default.DEVASTATION_T1_MOBILITY;
	StatChanges.AddItem(NewStatChange);
	NewStatChange.StatType = eStat_Dodge;
	NewStatChange.StatAmount = default.DEVASTATION_T1_DODGE;
	StatChanges.AddItem(NewStatChange);
	FocusEffect.AddNextFocusLevel(StatChanges, 0, default.DEVASTATION_T1_DAMAGE);
	//	focus 2
	StatChanges.Length = 0;
	NewStatChange.StatType = eStat_Mobility;
	NewStatChange.StatAmount = default.DEVASTATION_T2_MOBILITY;
	StatChanges.AddItem(NewStatChange);
	NewStatChange.StatType = eStat_Dodge;
	NewStatChange.StatAmount = default.DEVASTATION_T2_DODGE;
	StatChanges.AddItem(NewStatChange);
	FocusEffect.AddNextFocusLevel(StatChanges, 0, default.DEVASTATION_T2_DAMAGE);
	//	focus 3
	StatChanges.Length = 0;
	NewStatChange.StatType = eStat_Mobility;
	NewStatChange.StatAmount = default.DEVASTATION_T3_MOBILITY;
	StatChanges.AddItem(NewStatChange);
	NewStatChange.StatType = eStat_Dodge;
	NewStatChange.StatAmount = default.DEVASTATION_T3_DODGE;
	StatChanges.AddItem(NewStatChange);
	FocusEffect.AddNextFocusLevel(StatChanges, 0, default.DEVASTATION_T3_DAMAGE);

	Template.AddTargetEffect(FocusEffect);

	Template.AdditionalAbilities.AddItem('FocusKillTracker');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.bSkipFireAction = true;

	return Template;
}

static function X2AbilityTemplate AssassinAbility_DancingShadows()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;
	local X2Condition_UnitProperty			TargetCondition;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityCooldown					Cooldown;
	local X2Effect_Dazed					BloodTideEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AssassinAbility_DancingShadows');

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 4;
	Template.AbilityCooldown = Cooldown;

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.bAllowCrit = true;
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeDead = true;
	TargetCondition.ExcludeFriendlyToSource = true;
	TargetCondition.ExcludeHostileToSource = false;
	TargetCondition.TreatMindControlledSquadmateAsHostile = false;
	TargetCondition.FailOnNonUnits = true;
	TargetCondition.ExcludeCivilian = true;
	TargetCondition.ExcludeCosmetic = true;
	TargetCondition.RequireUnitSelectedFromHQ = true;
	Template.AbilityTargetConditions.AddItem(TargetCondition);
	Template.AbilityMultiTargetConditions.AddItem(TargetCondition);

	// Damage Effect
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddTargetEffect(WeaponDamageEffect);

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	Template.AssociatedPassives.AddItem('ChosenHoloTargeting');

	BloodTideEffect = class'X2StatusEffects_XPack'.static.CreateDazedStatusEffect(class'X2Ability_ChosenSniper'.default.LETHALDOSE_DAZE2_TURNS, 100);
	BloodTideEffect.bRemoveWhenSourceDies = true;
	Template.AddTargetEffect(BloodTideEffect);

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.IconImage = "img://UILibrary_XPACK_Common.PerkIcons.UIPerk_sting";
	Template.bShowActivation = true;

	Template.AdditionalAbilities.AddItem('AssassinAbility_DancingShadows2');
	Template.PostActivationEvents.AddItem('AssassinDancingShadows2');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate AssassinAbility_DancingShadows2()
{
	local X2AbilityTemplate					Template;
	local X2AbilityTrigger_EventListener    Trigger;
	local X2Effect_RemoveEffects			RemoveEffects;
	local X2Effect_VanishingWind			VanishingWindEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AssassinAbility_DancingShadows2');
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_vanishingwind";
	Template.Hostility = eHostility_Neutral;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	
	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.EventID = 'AssassinDancingShadows2';
	Trigger.ListenerData.Filter = eFilter_Unit;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityShooterConditions.AddItem(class'X2Effect_Vanish'.static.VanishShooterEffectsCondition());

	// Add remove suppression
	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2Effect_Suppression'.default.EffectName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2Effect_TargetDefinition'.default.EffectName);
	Template.AddTargetEffect(RemoveEffects);

	VanishingWindEffect = new class'X2Effect_VanishingWind';
	VanishingWindEffect.BuildPersistentEffect(1, true, false, true);
	VanishingWindEffect.AddPersistentStatChange(eStat_Mobility, default.VANISHINGWIND_MOBILITY_INCREASE, MODOP_Multiplication);
	VanishingWindEffect.VanishSyncAnimName = 'ADD_HL_VanishingWindBase_Immediate';
	Template.AddTargetEffect(VanishingWindEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	
	Template.CustomFireAnim = 'HL_VanishingWind';
	Template.bSkipExitCoverWhenFiring = true;
	Template.bShowActivation = true;

	Template.CinescriptCameraType = "ChosenAssassin_VanishingWind";
	
	return Template;
}


static function X2AbilityTemplate AssassinAbility_DeadlyCadence()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2AbilityCost_Ammo				AmmoCost;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;
	local X2Condition_UnitProperty			TargetCondition;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityCooldown					Cooldown;
	local X2Effect_Knockback				KnockbackEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AssassinAbility_DeadlyCadence');

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	AmmoCost.bFreeCost = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 4;
	Template.AbilityCooldown = Cooldown;

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.bAllowCrit = true;
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeDead = true;
	TargetCondition.ExcludeFriendlyToSource = true;
	TargetCondition.ExcludeHostileToSource = false;
	TargetCondition.TreatMindControlledSquadmateAsHostile = false;
	TargetCondition.FailOnNonUnits = true;
	TargetCondition.ExcludeCivilian = true;
	TargetCondition.ExcludeCosmetic = true;
	TargetCondition.RequireUnitSelectedFromHQ = true;
	Template.AbilityTargetConditions.AddItem(TargetCondition);
	Template.AbilityMultiTargetConditions.AddItem(TargetCondition);

	// Damage Effect
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddTargetEffect(WeaponDamageEffect);

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	Template.AssociatedPassives.AddItem('ChosenHoloTargeting');

	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.KnockbackDistance = 3;
	KnockbackEffect.OnlyOnDeath = false; 
	Template.AddTargetEffect(KnockbackEffect);

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_rapidfire";
	Template.bShowActivation = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.AdditionalAbilities.AddItem('AssassinAbility_DeadlyCadence2');
	Template.PostActivationEvents.AddItem('AssassinDeadlyCadence2');

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate AssassinAbility_DeadlyCadence2()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_Ammo				AmmoCost;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityTrigger_EventListener    Trigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AssassinAbility_DeadlyCadence2');

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.bAllowCrit = true;
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);

	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.EventID = 'AssassinDeadlyCadence2';
	Trigger.ListenerData.Filter = eFilter_Unit;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
	Template.AbilityTriggers.AddItem(Trigger);

	// Damage Effect
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddTargetEffect(WeaponDamageEffect);

	Template.AddTargetEffect(class'X2StatusEffects'.static.CreatePoisonedStatusEffect());

	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_rapidfire";

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.MergeVisualizationFn = SequentialShot_MergeVisualization;
	
	Template.bShowActivation = true;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}