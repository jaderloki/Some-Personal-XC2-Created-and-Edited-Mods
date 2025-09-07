class AHarderWar_Abilities_ChosenWarlock extends X2Ability_ChosenWarlock config(AHWChosenPack_Configuration);

var config int WARLOCK_FINAL_HOUR_REGEN;
var config int DISRUPTOR_TEMPLAR_CRIT;
var config int DISRUPTOR_PSIOP_CRIT;
var private name WarlockAbilityAftershockName;

var localized string DisruptorTemplarCritDisplayText;
var localized string DisruptorPsiOpCritDisplayText;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(WarlockAbility_Disruptor());
	Templates.AddItem(WarlockAbility_DisruptorTemplar());
	Templates.AddItem(WarlockAbility_DisruptorPsiOp());
	Templates.AddItem(WarlockAbility_PsychokineticShock());
	Templates.AddItem(WarlockAbility_AftershockTrigger());

	return Templates;
}

static function X2AbilityTemplate WarlockAbility_Disruptor()
{
	local X2AbilityTemplate         Template;

	Template = PurePassive('WarlockAbility_Disruptor', "img:///UILibrary_PerkIcons.UIPerk_schism", false, 'eAbilitySource_Psionic');
	
	Template.AdditionalAbilities.AddItem('WarlockAbility_DisruptorTemplar');
	Template.AdditionalAbilities.AddItem('WarlockAbility_DisruptorPsiOp');

	return Template;
}

static function X2AbilityTemplate WarlockAbility_DisruptorTemplar()
{
	local X2AbilityTemplate             Template;
	local X2Effect_ToHitModifier        PersistentEffect;
	local X2Condition_UnitProperty		TargetCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WarlockAbility_DisruptorTemplar');

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.RequireSoldierClasses.AddItem('Templar');
	PersistentEffect = new class'X2Effect_ToHitModifier';
	PersistentEffect.DuplicateResponse = eDupe_Ignore;
	PersistentEffect.BuildPersistentEffect(1, true, false);
	PersistentEffect.AddEffectHitModifier(eHit_Crit, default.DISRUPTOR_TEMPLAR_CRIT, default.DisruptorTemplarCritDisplayText,,,,,,,,true);
	PersistentEffect.ToHitConditions.AddItem(TargetCondition);
	Template.AddTargetEffect(PersistentEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	// Note: no visualization on purpose!
	
	return Template;
}


static function X2AbilityTemplate WarlockAbility_DisruptorPsiOp()
{
	local X2AbilityTemplate             Template;
	local X2Effect_ToHitModifier        PersistentEffect;
	local X2Condition_UnitProperty		TargetCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WarlockAbility_DisruptorPsiOp');

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.RequireSoldierClasses.AddItem('PsiOperative');
	PersistentEffect = new class'X2Effect_ToHitModifier';
	PersistentEffect.DuplicateResponse = eDupe_Ignore;
	PersistentEffect.BuildPersistentEffect(1, true, false);
	PersistentEffect.AddEffectHitModifier(eHit_Crit, default.DISRUPTOR_PSIOP_CRIT, default.DisruptorPsiOpCritDisplayText,,,,,,,,true);
	PersistentEffect.ToHitConditions.AddItem(TargetCondition);
	Template.AddTargetEffect(PersistentEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	// Note: no visualization on purpose!
	
	return Template;
}

static function X2AbilityTemplate WarlockAbility_PsychokineticShock()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2AbilityCooldown						Cooldown;
	local X2AbilityToHitCalc_StandardAim		ToHitCalc;
	local X2Condition_UnitProperty				TargetCondition;
	local X2Effect_ImmediateAbilityActivation	ImpairingAbilityEffect;
	local X2Effect_ApplyWeaponDamage			WeaponDamageEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WarlockAbility_PsychokineticShock');

	Template.bShowActivation = true;
	Template.AdditionalAbilities.AddItem(default.WarlockAbilityAftershockName);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);	

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 4;
	Template.AbilityCooldown = Cooldown;

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.bAllowCrit = true;
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeDead = true;
	TargetCondition.ExcludeFriendlyToSource = true;
	TargetCondition.ExcludeHostileToSource = false;
	TargetCondition.TreatMindControlledSquadmateAsHostile = false;
	TargetCondition.FailOnNonUnits = true;
	TargetCondition.ExcludeCivilian = true;
	TargetCondition.ExcludeCosmetic = true;
	TargetCondition.ExcludeRobotic = true;
	TargetCondition.RequireUnitSelectedFromHQ = true;
	Template.AbilityTargetConditions.AddItem(TargetCondition);

	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.DamageTypes.AddItem('Psi');
	Template.AddTargetEffect(WeaponDamageEffect);

	ImpairingAbilityEffect = new class 'X2Effect_ImmediateAbilityActivation';
	ImpairingAbilityEffect.BuildPersistentEffect(1, false, true, , eGameRule_PlayerTurnBegin);
	ImpairingAbilityEffect.EffectName = 'ImmediateWarlockAftershock';
	ImpairingAbilityEffect.AbilityName = default.WarlockAbilityAftershockName;
	ImpairingAbilityEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	ImpairingAbilityEffect.bRemoveWhenTargetDies = true;
	ImpairingAbilityEffect.VisualizationFn = WarlockAftershockTriggeredVisualization;
	Template.AddTargetEffect(ImpairingAbilityEffect);

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_hailofbullets";

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2DataTemplate WarlockAbility_AftershockTrigger()
{
	local X2AbilityTemplate							Template;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit   StatContest;
	local X2AbilityTarget_Single					SingleTarget;
	local X2Effect_Dazed							DazedEffect;
	local X2Effect_Persistent						ShatteredEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, default.WarlockAbilityAftershockName);

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.bShowActivation = true;

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	Template.AbilityTargetStyle = SingleTarget;

	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_Placeholder');      //  ability is activated by another ability that hits

	// Target Conditions
	//
	Template.AbilityTargetConditions.AddItem(default.LivingTargetUnitOnlyProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	// Shooter Conditions
	//
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	Template.AddShooterEffectExclusions();

	// This will be a stat contest
	StatContest = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	Template.AbilityToHitCalc = StatContest;

	// On hit effects
	//  Dazed effect for 1 to 2 unblocked hits
	DazedEffect = class'X2StatusEffects_XPack'.static.CreateDazedStatusEffect(4, 100);
	DazedEffect.MinStatContestResult = 1;
	DazedEffect.MaxStatContestResult = 2;
	DazedEffect.bRemoveWhenSourceDies = true;
	Template.AddTargetEffect(DazedEffect);

	//  Shattered effect for 3 or more unblocked hits
	ShatteredEffect = class'X2StatusEffects'.static.CreateShatteredStatusEffect();
	ShatteredEffect.MinStatContestResult = 3;
	ShatteredEffect.MaxStatContestResult = 0;
	ShatteredEffect.bRemoveWhenSourceDies = true;
	Template.AddTargetEffect(ShatteredEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	Template.bSkipPerkActivationActions = true;
	Template.bSkipPerkActivationActionsSync = false;
	Template.bSkipFireAction = true;

	return Template;
}

static function WarlockAftershockTriggeredVisualization(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const name EffectApplyResult)
{
	local XComGameStateContext_Ability AbilityContext;
	local XComGameStateContext Context;
	local XComGameStateContext_Ability TestAbilityContext;
	local int i, j, ChildIndex;
	local XComGameStateHistory History;
	local bool bAbilityWasSuccess;
	local X2AbilityTemplate AbilityTemplate;
	local X2VisualizerInterface TargetVisualizerInterface;
	local XComGameStateVisualizationMgr VisMgr;
	local X2Action_ApplyWeaponDamageToUnit DamageAction;
	local X2Action TempAction;
	local X2Action_MarkerNamed HitReactAction;

	if( (EffectApplyResult != 'AA_Success') || (XComGameState_Unit(ActionMetadata.StateObject_NewState) == none) )
	{
		return;
	}

	Context = VisualizeGameState.GetContext();
	AbilityContext = XComGameStateContext_Ability(Context);

	if( AbilityContext.EventChainStartIndex != 0 )
	{
		History = `XCOMHISTORY;

		// This GameState is part of a chain, which means there may be a stun to the target
		for( i = AbilityContext.EventChainStartIndex; !Context.bLastEventInChain; ++i )
		{
			Context = History.GetGameStateFromHistory(i).GetContext();

			TestAbilityContext = XComGameStateContext_Ability(Context);
			bAbilityWasSuccess = (TestAbilityContext != none) && class'XComGameStateContext_Ability'.static.IsHitResultHit(TestAbilityContext.ResultContext.HitResult);

			if( bAbilityWasSuccess &&
				TestAbilityContext.InputContext.AbilityTemplateName == default.WarlockAbilityAftershockName &&
				TestAbilityContext.InputContext.SourceObject.ObjectID == AbilityContext.InputContext.SourceObject.ObjectID &&
				TestAbilityContext.InputContext.PrimaryTarget.ObjectID == AbilityContext.InputContext.PrimaryTarget.ObjectID )
			{
				// The Melee Impairing Ability has been found with the same source and target
				// Move that ability's visualization forward to this track
				AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(TestAbilityContext.InputContext.AbilityTemplateName);

				for( j = 0; j < AbilityTemplate.AbilityTargetEffects.Length; ++j )
				{
					AbilityTemplate.AbilityTargetEffects[j].AddX2ActionsForVisualization(TestAbilityContext.AssociatedState, ActionMetadata, TestAbilityContext.FindTargetEffectApplyResult(AbilityTemplate.AbilityTargetEffects[j]));
				}

				TargetVisualizerInterface = X2VisualizerInterface(ActionMetadata.VisualizeActor);
				if (TargetVisualizerInterface != none)
				{
					TargetVisualizerInterface.BuildAbilityEffectsVisualization(Context.AssociatedState, ActionMetadata);
				}

				VisMgr = `XCOMVISUALIZATIONMGR;

				DamageAction = X2Action_ApplyWeaponDamageToUnit(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_ApplyWeaponDamageToUnit', ActionMetadata.VisualizeActor));

				if( DamageAction.ChildActions.Length > 0 )
				{
					HitReactAction = X2Action_MarkerNamed(class'X2Action_MarkerNamed'.static.AddToVisualizationTree(ActionMetadata, AbilityContext, true, DamageAction));
					HitReactAction.SetName("ImpairingReact");
					HitReactAction.AddInputEvent('Visualizer_AbilityHit');

					for( ChildIndex = 0; ChildIndex < DamageAction.ChildActions.Length; ++ChildIndex )
					{
						TempAction = DamageAction.ChildActions[ChildIndex];
						VisMgr.DisconnectAction(TempAction);
						VisMgr.ConnectAction(TempAction, VisMgr.BuildVisTree, false, , DamageAction.ParentActions);
					}

					VisMgr.DisconnectAction(DamageAction);
					VisMgr.ConnectAction(DamageAction, VisMgr.BuildVisTree, false, ActionMetadata.LastActionAdded);
				}

				break;
			}
		}
	}
}

DefaultProperties
{
	WarlockAbilityAftershockName="WarlockAbility_Aftershock"
}