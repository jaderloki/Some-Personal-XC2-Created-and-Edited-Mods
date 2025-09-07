class AHarderWar_Abilities_ChosenSniper extends X2Ability_ChosenSniper config(AHWChosenPack_Configuration);   

var config int RUIN_T1_AIM;
var config int RUIN_T1_CRIT;
var config int RUIN_T1_DAMAGE;

var config int RUIN_T2_AIM;
var config int RUIN_T2_CRIT;
var config int RUIN_T2_DAMAGE;

var config int RUIN_T3_AIM;
var config int RUIN_T3_CRIT;
var config int RUIN_T3_DAMAGE;


static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(HunterAbility_HunterFocus());
	Templates.AddItem(HunterAbility_Sadism());
	Templates.AddItem(HunterAbility_Sadism2());
	Templates.AddItem(HunterAbility_Sadism3());
	Templates.AddItem(HunterAbility_Heartseeker());
	Templates.AddItem(HunterAbility_LethalTempo());
	Templates.AddItem(HunterAbility_Showdown());

	return Templates;
}

static function X2AbilityTemplate HunterAbility_HunterFocus()
{
	local X2AbilityTemplate		Template;
	local X2Effect_TemplarFocus	FocusEffect;
	local array<StatChange>		StatChanges;
	local StatChange			NewStatChange;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HunterAbility_HunterFocus');

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
	NewStatChange.StatType = eStat_Offense;
	NewStatChange.StatAmount = default.RUIN_T1_AIM;
	StatChanges.AddItem(NewStatChange);
	NewStatChange.StatType = eStat_CritChance;
	NewStatChange.StatAmount = default.RUIN_T1_CRIT;
	StatChanges.AddItem(NewStatChange);
	FocusEffect.AddNextFocusLevel(StatChanges, 0, default.RUIN_T1_DAMAGE);
	//	focus 2
	StatChanges.Length = 0;
	NewStatChange.StatType = eStat_Offense;
	NewStatChange.StatAmount = default.RUIN_T2_AIM;
	StatChanges.AddItem(NewStatChange);
	NewStatChange.StatType = eStat_CritChance;
	NewStatChange.StatAmount = default.RUIN_T2_CRIT;
	StatChanges.AddItem(NewStatChange);
	FocusEffect.AddNextFocusLevel(StatChanges, 0, default.RUIN_T2_DAMAGE);
	//	focus 3
	StatChanges.Length = 0;
	NewStatChange.StatType = eStat_Offense;
	NewStatChange.StatAmount = default.RUIN_T3_AIM;
	StatChanges.AddItem(NewStatChange);
	NewStatChange.StatType = eStat_CritChance;
	NewStatChange.StatAmount = default.RUIN_T3_CRIT;
	StatChanges.AddItem(NewStatChange);
	FocusEffect.AddNextFocusLevel(StatChanges, 0, default.RUIN_T3_DAMAGE);

	Template.AddTargetEffect(FocusEffect);

	Template.AdditionalAbilities.AddItem('FocusKillTracker');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.bSkipFireAction = true;

	return Template;
}

static function X2AbilityTemplate HunterAbility_Sadism()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty			TargetCondition;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityCooldown                 Cooldown;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;

	// Macro to do localisation and stuffs
	`CREATE_X2ABILITY_TEMPLATE(Template, 'HunterAbility_Sadism');

	// Icon Properties
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_soulreaper";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.AbilitySourceName = 'eAbilitySource_Perk';                                       // color of the icon
	Template.bShowActivation = true;

	// Activated by a button press; additionally, tells the AI this is an activatable
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	// *** VALIDITY CHECKS *** //
	Template.AddShooterEffectExclusions();

	// Targeting Details
	// Can only shoot visible enemies
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	// Can't target dead; Can't target friendlies
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	// Can't shoot while dead
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	// Only at single targets that are in range.
	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	// Action Point
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);	

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 4;
	Template.AbilityCooldown = Cooldown;

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

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.bAllowCrit = true;
	Template.AbilityToHitCalc = ToHitCalc;

	Template.AddTargetEffect(class'X2StatusEffects'.static.CreateBleedingStatusEffect(2, 1));
	// MAKE IT LIVE!
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.PostActivationEvents.AddItem('HunterSadism2');

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;	
}

static function X2AbilityTemplate HunterAbility_Sadism2()
{
	local X2AbilityTemplate					Template;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityTrigger_EventListener    Trigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HunterAbility_Sadism2');


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
	Trigger.ListenerData.EventID = 'HunterSadism2';
	Trigger.ListenerData.Filter = eFilter_Unit;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
	Template.AbilityTriggers.AddItem(Trigger);

	// Damage Effect
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddTargetEffect(WeaponDamageEffect);

	Template.AddTargetEffect(class'X2StatusEffects'.static.CreatePoisonedStatusEffect());

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_soulreaper";

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.MergeVisualizationFn = SequentialShot_MergeVisualization;
	
	Template.PostActivationEvents.AddItem('HunterSadism3');

	Template.bShowActivation = true;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate HunterAbility_Sadism3()
{
	local X2AbilityTemplate					Template;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityTrigger_EventListener    Trigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HunterAbility_Sadism3');

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
	Trigger.ListenerData.EventID = 'HunterSadism3';
	Trigger.ListenerData.Filter = eFilter_Unit;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
	Template.AbilityTriggers.AddItem(Trigger);

	// Damage Effect
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddTargetEffect(WeaponDamageEffect);

	Template.AddTargetEffect(class'X2StatusEffects'.static.CreateAcidBurningStatusEffect(2, 1));

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_soulreaper";

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.MergeVisualizationFn = SequentialShot_MergeVisualization;
	
	Template.bShowActivation = true;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate HunterAbility_Heartseeker()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_Ammo				AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;
	local X2AbilityCooldown                 Cooldown;
	local X2Condition_UnitProperty			TargetCondition;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2Effect_Dazed					TriggerHappyEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HunterAbility_Heartseeker');

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 3;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);	

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.bGuaranteedHit = true;
	ToHitCalc.bAllowCrit = true;
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;
	
	Template.bAllowAmmoEffects = true;	

	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

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

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bIgnoreArmor = true;
	WeaponDamageEffect.bBypassShields = true;
	Template.AddTargetEffect(WeaponDamageEffect);

	TriggerHappyEffect = class'X2StatusEffects_XPack'.static.CreateDazedStatusEffect(class'X2Ability_ChosenSniper'.default.LETHALDOSE_DAZE2_TURNS, 100);
	Template.AddTargetEffect(TriggerHappyEffect);

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_hailofbullets";
	Template.bShowActivation = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate HunterAbility_LethalTempo()
{
	local X2AbilityTemplate                 Template;
	local X2Condition_UnitProperty			TargetCondition;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityCooldown                 Cooldown;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;

	// Macro to do localisation and stuffs
	`CREATE_X2ABILITY_TEMPLATE(Template, 'HunterAbility_LethalTempo');

	// Icon Properties
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_fanfire";
	Template.AbilitySourceName = 'eAbilitySource_Perk';                                       // color of the icon
	Template.bShowActivation = true;

	// Activated by a button press; additionally, tells the AI this is an activatable
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	// *** VALIDITY CHECKS *** //
	Template.AddShooterEffectExclusions();

	// Targeting Details
	// Can only shoot visible enemies
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	// Can't target dead; Can't target friendlies
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	// Can't shoot while dead
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	// Only at single targets that are in range.
	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	// Action Point
	Template.AbilityCosts.AddItem(default.FreeActionCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 2;
	Template.AbilityCooldown = Cooldown;

	Template.bAllowAmmoEffects = true; // 	 	

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

	// Damage Effect
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddTargetEffect(WeaponDamageEffect);

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.bAllowCrit = true;
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

	// MAKE IT LIVE!
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	return Template;	
}

static function X2AbilityTemplate HunterAbility_Showdown()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_Ammo				AmmoCost;
	local X2AbilityCooldown                 Cooldown;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;
	local X2AbilityMultiTarget_AllUnits		MultiTargetUnits;
	local X2Condition_UnitProperty			TargetCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HunterAbility_Showdown');

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_faceoff";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Offensive;
	Template.bShowActivation = true;

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 4;
	Template.AbilityCooldown = Cooldown;

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.bOnlyMultiHitWithSuccess = false;
	ToHitCalc.bAllowCrit = true;
	Template.AbilityToHitCalc = ToHitCalc;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	MultiTargetUnits = new class'X2AbilityMultiTarget_AllUnits';
	MultiTargetUnits.bUseAbilitySourceAsPrimaryTarget = true;
	MultiTargetUnits.bAcceptEnemyUnits = true;
	Template.AbilityMultiTargetStyle = MultiTargetUnits;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeCivilian = true;
	Template.AbilityMultiTargetConditions.AddItem(TargetCondition);

	Template.AddTargetEffect(new class'X2Effect_ApplyWeaponDamage');
	Template.AddMultiTargetEffect(new class'X2Effect_ApplyWeaponDamage');

	Template.bAllowAmmoEffects = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = HunterShowdown_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;


	return Template;
}

function HunterShowdown_BuildVisualization(XComGameState VisualizeGameState)
{
	local X2AbilityTemplate             AbilityTemplate;
	local XComGameStateContext_Ability  Context;
	local AbilityInputContext           AbilityContext;
	local StateObjectReference          ShootingUnitRef;
	local X2Action_Fire                 FireAction;
	local X2Action_Fire_Faceoff         FireFaceoffAction;
	local XComGameState_BaseObject      TargetStateObject;//Container for state objects within VisualizeGameState	

	local Actor                     TargetVisualizer, ShooterVisualizer;
	local X2VisualizerInterface     TargetVisualizerInterface;
	local int                       EffectIndex, TargetIndex;

	local VisualizationActionMetadata        EmptyTrack;
	local VisualizationActionMetadata        ActionMetadata;
	local VisualizationActionMetadata        SourceTrack;
	local XComGameStateHistory      History;

	local X2Action_PlaySoundAndFlyOver SoundAndFlyover;
	local name         ApplyResult;

	local X2Action_StartCinescriptCamera CinescriptStartAction;
	local X2Action_EndCinescriptCamera   CinescriptEndAction;
	local X2Camera_Cinescript            CinescriptCamera;
	local string                         PreviousCinescriptCameraType;
	local X2Effect                       TargetEffect;

	local X2Action_MarkerNamed				JoinActions;
	local array<X2Action>					LeafNodes;
	local XComGameStateVisualizationMgr		VisualizationMgr;
	local X2Action_ApplyWeaponDamageToUnit	ApplyWeaponDamageAction;


	History = `XCOMHISTORY;
	VisualizationMgr = `XCOMVISUALIZATIONMGR;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	AbilityContext = Context.InputContext;
	AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(AbilityContext.AbilityTemplateName);
	ShootingUnitRef = Context.InputContext.SourceObject;

	ShooterVisualizer = History.GetVisualizer(ShootingUnitRef.ObjectID);

	SourceTrack = EmptyTrack;
	SourceTrack.StateObject_OldState = History.GetGameStateForObjectID(ShootingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	SourceTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(ShootingUnitRef.ObjectID);
	if( SourceTrack.StateObject_NewState == none )
		SourceTrack.StateObject_NewState = SourceTrack.StateObject_OldState;
	SourceTrack.VisualizeActor = ShooterVisualizer;

	if( AbilityTemplate.ActivationSpeech != '' )     //  allows us to change the template without modifying this function later
	{
		SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyover'.static.AddToVisualizationTree(SourceTrack, Context));
		SoundAndFlyOver.SetSoundAndFlyOverParameters(None, "", AbilityTemplate.ActivationSpeech, eColor_Good);
	}


	// Add a Camera Action to the Shooter's Metadata.  Minor hack: To create a CinescriptCamera the AbilityTemplate 
	// must have a camera type.  So manually set one here, use it, then restore.
	PreviousCinescriptCameraType = AbilityTemplate.CinescriptCameraType;
	AbilityTemplate.CinescriptCameraType = "StandardGunFiring";
	CinescriptCamera = class'X2Camera_Cinescript'.static.CreateCinescriptCameraForAbility(Context);
	CinescriptStartAction = X2Action_StartCinescriptCamera(class'X2Action_StartCinescriptCamera'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
	CinescriptStartAction.CinescriptCamera = CinescriptCamera;
	AbilityTemplate.CinescriptCameraType = PreviousCinescriptCameraType;


	class'X2Action_ExitCover'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded);

	//  Fire at the primary target first
	FireAction = X2Action_Fire(class'X2Action_Fire'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
	FireAction.SetFireParameters(Context.IsResultContextHit(), , false);
	//  Setup target response
	TargetVisualizer = History.GetVisualizer(AbilityContext.PrimaryTarget.ObjectID);
	TargetVisualizerInterface = X2VisualizerInterface(TargetVisualizer);
	ActionMetadata = EmptyTrack;
	ActionMetadata.VisualizeActor = TargetVisualizer;
	TargetStateObject = VisualizeGameState.GetGameStateForObjectID(AbilityContext.PrimaryTarget.ObjectID);
	if( TargetStateObject != none )
	{
		History.GetCurrentAndPreviousGameStatesForObjectID(AbilityContext.PrimaryTarget.ObjectID,
														   ActionMetadata.StateObject_OldState, ActionMetadata.StateObject_NewState,
														   eReturnType_Reference,
														   VisualizeGameState.HistoryIndex);
		`assert(ActionMetadata.StateObject_NewState == TargetStateObject);
	}
	else
	{
		//If TargetStateObject is none, it means that the visualize game state does not contain an entry for the primary target. Use the history version
		//and show no change.
		ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(AbilityContext.PrimaryTarget.ObjectID);
		ActionMetadata.StateObject_NewState = ActionMetadata.StateObject_OldState;
	}

	for( EffectIndex = 0; EffectIndex < AbilityTemplate.AbilityTargetEffects.Length; ++EffectIndex )
	{
		ApplyResult = Context.FindTargetEffectApplyResult(AbilityTemplate.AbilityTargetEffects[EffectIndex]);

		// Target effect visualization
		AbilityTemplate.AbilityTargetEffects[EffectIndex].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, ApplyResult);

		// Source effect visualization
		AbilityTemplate.AbilityTargetEffects[EffectIndex].AddX2ActionsForVisualizationSource(VisualizeGameState, SourceTrack, ApplyResult);
	}
	if( TargetVisualizerInterface != none )
	{
		//Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
		TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
	}

	ApplyWeaponDamageAction = X2Action_ApplyWeaponDamageToUnit(VisualizationMgr.GetNodeOfType(VisualizationMgr.BuildVisTree, class'X2Action_ApplyWeaponDamageToUnit', TargetVisualizer));
	if ( ApplyWeaponDamageAction != None)
	{
		VisualizationMgr.DisconnectAction(ApplyWeaponDamageAction);
		VisualizationMgr.ConnectAction(ApplyWeaponDamageAction, VisualizationMgr.BuildVisTree, false, FireAction);
	}

	//  Now configure a fire action for each multi target
	for( TargetIndex = 0; TargetIndex < AbilityContext.MultiTargets.Length; ++TargetIndex )
	{
		// Add an action to pop the previous CinescriptCamera off the camera stack.
		CinescriptEndAction = X2Action_EndCinescriptCamera(class'X2Action_EndCinescriptCamera'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
		CinescriptEndAction.CinescriptCamera = CinescriptCamera;
		CinescriptEndAction.bForceEndImmediately = true;

		// Add an action to push a new CinescriptCamera onto the camera stack.
		AbilityTemplate.CinescriptCameraType = "StandardGunFiring";
		CinescriptCamera = class'X2Camera_Cinescript'.static.CreateCinescriptCameraForAbility(Context);
		CinescriptCamera.TargetObjectIdOverride = AbilityContext.MultiTargets[TargetIndex].ObjectID;
		CinescriptStartAction = X2Action_StartCinescriptCamera(class'X2Action_StartCinescriptCamera'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
		CinescriptStartAction.CinescriptCamera = CinescriptCamera;
		AbilityTemplate.CinescriptCameraType = PreviousCinescriptCameraType;

		// Add a custom Fire action to the shooter Metadata.
		TargetVisualizer = History.GetVisualizer(AbilityContext.MultiTargets[TargetIndex].ObjectID);
		FireFaceoffAction = X2Action_Fire_Faceoff(class'X2Action_Fire_Faceoff'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
		FireFaceoffAction.SetFireParameters(Context.IsResultContextMultiHit(TargetIndex), AbilityContext.MultiTargets[TargetIndex].ObjectID, false);
		FireFaceoffAction.vTargetLocation = TargetVisualizer.Location;


		//  Setup target response
		TargetVisualizerInterface = X2VisualizerInterface(TargetVisualizer);
		ActionMetadata = EmptyTrack;
		ActionMetadata.VisualizeActor = TargetVisualizer;
		TargetStateObject = VisualizeGameState.GetGameStateForObjectID(AbilityContext.MultiTargets[TargetIndex].ObjectID);
		if( TargetStateObject != none )
		{
			History.GetCurrentAndPreviousGameStatesForObjectID(AbilityContext.MultiTargets[TargetIndex].ObjectID,
															   ActionMetadata.StateObject_OldState, ActionMetadata.StateObject_NewState,
															   eReturnType_Reference,
															   VisualizeGameState.HistoryIndex);
			`assert(ActionMetadata.StateObject_NewState == TargetStateObject);
		}
		else
		{
			//If TargetStateObject is none, it means that the visualize game state does not contain an entry for the primary target. Use the history version
			//and show no change.
			ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(AbilityContext.MultiTargets[TargetIndex].ObjectID);
			ActionMetadata.StateObject_NewState = ActionMetadata.StateObject_OldState;
		}

		for( EffectIndex = 0; EffectIndex < AbilityTemplate.AbilityMultiTargetEffects.Length; ++EffectIndex )
		{
			TargetEffect = AbilityTemplate.AbilityMultiTargetEffects[EffectIndex];
			ApplyResult = Context.FindMultiTargetEffectApplyResult(TargetEffect, TargetIndex);

			// Target effect visualization
			AbilityTemplate.AbilityMultiTargetEffects[EffectIndex].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, ApplyResult);

			// Source effect visualization
			AbilityTemplate.AbilityMultiTargetEffects[EffectIndex].AddX2ActionsForVisualizationSource(VisualizeGameState, SourceTrack, ApplyResult);
		}
		if( TargetVisualizerInterface != none )
		{
			//Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
			TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
		}

		ApplyWeaponDamageAction = X2Action_ApplyWeaponDamageToUnit(VisualizationMgr.GetNodeOfType(VisualizationMgr.BuildVisTree, class'X2Action_ApplyWeaponDamageToUnit', TargetVisualizer));
		if( ApplyWeaponDamageAction != None )
		{
			VisualizationMgr.DisconnectAction(ApplyWeaponDamageAction);
			VisualizationMgr.ConnectAction(ApplyWeaponDamageAction, VisualizationMgr.BuildVisTree, false, FireFaceoffAction);
		}
	}
	class'X2Action_EnterCover'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded);

	// Add an action to pop the last CinescriptCamera off the camera stack.
	CinescriptEndAction = X2Action_EndCinescriptCamera(class'X2Action_EndCinescriptCamera'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
	CinescriptEndAction.CinescriptCamera = CinescriptCamera;

	//Add a join so that all hit reactions and other actions will complete before the visualization sequence moves on. In the case
	// of fire but no enter cover then we need to make sure to wait for the fire since it isn't a leaf node
	VisualizationMgr.GetAllLeafNodes(VisualizationMgr.BuildVisTree, LeafNodes);

	if( VisualizationMgr.BuildVisTree.ChildActions.Length > 0 )
	{
		JoinActions = X2Action_MarkerNamed(class'X2Action_MarkerNamed'.static.AddToVisualizationTree(SourceTrack, Context, false, none, LeafNodes));
		JoinActions.SetName("Join");
	}
}