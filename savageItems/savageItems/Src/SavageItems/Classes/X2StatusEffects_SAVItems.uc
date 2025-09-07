class X2StatusEffects_SAVItems extends X2StatusEffects config(GameCore);

var name NanoShredName;

var config float NANOSHRED_HACKDEFENCE_SCALAR;
var config int NANOSHRED_INFECT_PERCENTAGE;
var config int NANOSHRED_INFECT_DISTANCE;
var config int NANOSHRED_INITIAL_SHED;
var config int NANOSHRED_PER_TURN_SHED;

var config string NanoShredParticle_Name;
var config name NanoShredSocket_Name;
var config name NanoShredSocketsArray_Name;

var localized string NanoShredFriendlyName;
var localized string NanoShredFriendlyDesc;
var localized string NanoShredEffectAcquiredString;
var localized string NanoShredEffectTickedString;
var localized string NanoShredEffectLostString;

var config string NanoShredEnteredPerk_Name;

static function X2Effect_Panicked CreateSAVRedMistBerserkStatusEffect()
{
	local X2Effect_Panicked     PanickedEffect;

	PanickedEffect = new class'X2Effect_SAVRedHaze';
	PanickedEffect.EffectName = class'X2Effect_SAVRedHaze'.default.EffectName;
	PanickedEffect.BuildPersistentEffect(1, , , , eGameRule_PlayerTurnBegin);  // Because the effect is removed at Begin turn, we add 1 to duration.
	PanickedEffect.AddPersistentStatChange(eStat_Mobility, 3);
	PanickedEffect.AddPersistentStatChange(eStat_Defense, 10);
//	PanickedEffect.AddPersistentStatChange(eStat_Offense, 0);
	PanickedEffect.AddPersistentStatChange(eStat_Strength, 50);
	PanickedEffect.AddPersistentStatChange(eStat_CritChance, 25);
	PanickedEffect.EffectHierarchyValue = default.PANICKED_HIERARCHY_VALUE;
	PanickedEffect.EffectAppliedEventName = 'PanickedEffectApplied';

	return PanickedEffect;
}

////////////////////////////////////////
////////////NANO SHRED STUFF////////////
////////////////////////////////////////

static function X2Effect_PersistentStatChange CreateNanoShredStatusEffect()
{
	local X2Effect_PersistentStatChange     PersistentStatChangeEffect;
	local X2Effect_ApplyWeaponDamage        DamageEffect;
	local X2Condition_UnitProperty 			UnitPropCondition;

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = default.NanoShredName;
	PersistentStatChangeEffect.DuplicateResponse = eDupe_Refresh;
	PersistentStatChangeEffect.BuildPersistentEffect(4,, false,,eGameRule_PlayerTurnBegin);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Penalty, default.NanoShredFriendlyName, default.NanoShredFriendlyDesc, "img:///UILibrary_SavageItems.UIPerk_NanoShred");
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, 0.8, MODOP_Multiplication);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, 0.45, MODOP_Multiplication);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HackDefense, default.NANOSHRED_HACKDEFENCE_SCALAR, MODOP_PostMultiplication);
	PersistentStatChangeEffect.iInitialShedChance = default.NANOSHRED_INITIAL_SHED;
	PersistentStatChangeEffect.iPerTurnShedChance = default.NANOSHRED_PER_TURN_SHED;
	PersistentStatChangeEffect.VisualizationFn = NanoShredVisualization;
	PersistentStatChangeEffect.EffectTickedVisualizationFn = NanoShredVisualizationTicked;
	PersistentStatChangeEffect.EffectRemovedVisualizationFn = NanoShredVisualizationRemoved;
	PersistentStatChangeEffect.DamageTypes.AddItem('NanoShred');
	PersistentStatChangeEffect.bRemoveWhenTargetDies = true;
	PersistentStatChangeEffect.bCanTickEveryAction = true;
	PersistentStatChangeEffect.EffectAppliedEventName = 'NanoShredEffectAdded';
	
	if (default.NanoShredParticle_Name != "")
	{
		PersistentStatChangeEffect.VFXTemplateName = default.NanoShredParticle_Name;
		PersistentStatChangeEffect.VFXSocket = default.NanoShredSocket_Name;
		PersistentStatChangeEffect.VFXSocketsArrayName = default.NanoShredSocketsArray_Name;
	}
	PersistentStatChangeEffect.PersistentPerkName = default.NanoShredEnteredPerk_Name;

	UnitPropCondition = new class'X2Condition_UnitProperty';
	UnitPropCondition.ExcludeFriendlyToSource = false;
	UnitPropCondition.ExcludeRobotic = false;
	PersistentStatChangeEffect.TargetConditions.AddItem(UnitPropCondition);

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.EffectDamageValue.Damage = 4;
	DamageEffect.EffectDamageValue.Spread = 1;
	DamageEffect.EnvironmentalDamageAmount = 15;
	DamageEffect.EffectDamageValue.DamageType = 'NanoShred';//Change to NanoShred
	DamageEffect.bIgnoreBaseDamage = true;
	DamageEffect.DamageTypes.AddItem('NanoShred');
	DamageEffect.bAllowFreeKill = false;
	DamageEffect.bIgnoreArmor = true;
	DamageEffect.bBypassShields = true;
	DamageEffect.bApplyOnMiss = false;
	PersistentStatChangeEffect.ApplyOnTick.AddItem(DamageEffect);

	PersistentStatChangeEffect.EffectTickedFn = NanoShredTicked;

	return PersistentStatChangeEffect;
}

static function X2Effect CreateNanoShredSpreadEffect()
{
	local X2Effect NanoShredSpreadEffect;
	local X2Condition_UnitProperty UnitPropertyCondition;
	local X2Condition_Visibility TargetVisibilityCondition;
		
	NanoShredSpreadEffect = CreateNanoShredStatusEffect();

	NanoShredSpreadEffect.ApplyChance = default.NANOSHRED_INFECT_PERCENTAGE;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeHostileToSource = false;
	UnitPropertyCondition.ExcludeCivilian = false;
	UnitPropertyCondition.FailOnNonUnits = true;
	NanoShredSpreadEffect.TargetConditions.AddItem(UnitPropertyCondition);

	// don't allow poison to infect through walls
	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bCannotPeek = true;
	NanoShredSpreadEffect.TargetConditions.AddItem(TargetVisibilityCondition);

	return NanoShredSpreadEffect;
}

// At start of each turn, poisoned units can infect nearby units.
function bool NanoShredTicked(X2Effect_Persistent PersistentEffect, const out EffectAppliedData ApplyEffectParameters, XComGameState_Effect kNewEffectState, XComGameState NewGameState, bool FirstApplication)
{
	local XComGameState_Unit TargetUnit;
	local XComGameState_Unit PlayerUnit;

	local EffectAppliedData NanoShredAppliedData;
	local X2Effect NanoShredSpreadEffect;

	TargetUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(ApplyEffectParameters.TargetStateObjectRef.ObjectID));
	if (TargetUnit == none)
		return true; // effect is done

	// create the poison effect template
	NanoShredSpreadEffect = CreateNanoShredSpreadEffect();
	if (NanoShredSpreadEffect == none)
		return true; // effect is done

	// iterate thorugh all player units
	foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_Unit', PlayerUnit)
	{
		// skip if it's the same unit
		if (PlayerUnit.ObjectID == TargetUnit.ObjectID)
			continue;

		// skip if unit is not within range
		if (PlayerUnit.TileDistanceBetween(TargetUnit) > default.NANOSHRED_INFECT_DISTANCE)
			continue;

		// make a copy of the ApplyEffectParameters, and set the source and target appropriately
		NanoShredAppliedData = ApplyEffectParameters; 
		NanoShredAppliedData.SourceStateObjectRef = TargetUnit.GetReference();
		NanoShredAppliedData.TargetStateObjectRef = PlayerUnit.GetReference();

		if (NanoShredSpreadEffect.ApplyEffect(NanoShredAppliedData, PlayerUnit, NewGameState) == 'AA_Success')
		{
			if (NewGameState.GetContext().PostBuildVisualizationFn.Find(NanoShredSpreadVisualization) == INDEX_NONE)
				NewGameState.GetContext().PostBuildVisualizationFn.AddItem(NanoShredSpreadVisualization);
		}
	}

	return false; // effect persists
}

static function NanoShredSpreadVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameState_Effect EffectState;
	local XComGameState_Effect OldEffectState;
	local XComGameState_Unit EffectTarget;
	local X2VisualizerInterface VisualizerInterface;
	local VisualizationActionMetadata ActionMetadata;
	local VisualizationActionMetadata EmptyTrack;

	History = `XCOMHISTORY;

	//Find any newly-applied poison effects and visualize them here.
	//(the normal Context_TickEffect doesn't handle these, because they're not in EffectTemplate.ApplyOnTick - and they get applied to other units) 
		foreach VisualizeGameState.IterateByClassType(class'XComGameState_Effect', EffectState)
	{
		EffectTarget = XComGameState_Unit(History.GetGameStateForObjectID(EffectState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));
		if (EffectTarget == None)
			continue;

		OldEffectState = XComGameState_Effect(History.GetGameStateForObjectID(EffectState.ObjectID, , VisualizeGameState.HistoryIndex - 1));
		if (OldEffectState != None) //Not a new effect - don't visualize here
			continue;

		ActionMetadata = EmptyTrack;
		ActionMetadata.VisualizeActor = History.GetVisualizer(EffectTarget.ObjectID);
		VisualizerInterface = X2VisualizerInterface(ActionMetadata.VisualizeActor);

		History.GetCurrentAndPreviousGameStatesForObjectID(EffectTarget.ObjectID, ActionMetadata.StateObject_OldState, ActionMetadata.StateObject_NewState, eReturnType_Reference, VisualizeGameState.HistoryIndex);
		if (ActionMetadata.StateObject_NewState == none)
			ActionMetadata.StateObject_NewState = ActionMetadata.StateObject_OldState;
		else if (ActionMetadata.StateObject_OldState == none)
			ActionMetadata.StateObject_OldState = ActionMetadata.StateObject_NewState;

		//Add the normal "poisoned" visualization
		EffectState.GetX2Effect().AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, 'AA_Success');

		//Allow for target being killed/etc
		if (VisualizerInterface != none)
			VisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
	}
}

static function NanoShredVisualization(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const name EffectApplyResult)
{
	if( EffectApplyResult != 'AA_Success' )
	{
		return;
	}

	if (ActionMetadata.StateObject_NewState.IsA('XComGameState_Unit'))
	{
		AddEffectSoundAndFlyOverToTrack(ActionMetadata, VisualizeGameState.GetContext(), default.NanoShredFriendlyName, 'Poison', eColor_Bad, class'UIUtilities_Image'.const.UnitStatus_Poisoned);
		AddEffectMessageToTrack(
			ActionMetadata,
			default.NanoShredEffectAcquiredString,
			VisualizeGameState.GetContext(),
			class'UIEventNoticesTactical'.default.PoisonedTitle,
			"img:///UILibrary_PerkIcons.UIPerk_poisoned",
			eUIState_Bad);
		UpdateUnitFlag(ActionMetadata, VisualizeGameState.GetContext());//========================================NEEDS ICON
	}
}

static function NanoShredVisualizationTicked(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const name EffectApplyResult)
{
	local XComGameState_Unit UnitState;

	UnitState = XComGameState_Unit(ActionMetadata.StateObject_NewState);
	if (UnitState == none)
		return;

	// dead units should not be reported
	if( !UnitState.IsAlive() )
	{
		return;
	}

	AddEffectMessageToTrack(
		ActionMetadata,
		default.NanoShredEffectTickedString,
		VisualizeGameState.GetContext(),
		class'UIEventNoticesTactical'.default.PoisonedTitle,
		"img:///UILibrary_PerkIcons.UIPerk_poisoned",
		eUIState_Warning);
	UpdateUnitFlag(ActionMetadata, VisualizeGameState.GetContext());
}

static function NanoShredVisualizationRemoved(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const name EffectApplyResult)
{
	local XComGameState_Unit UnitState;

	UnitState = XComGameState_Unit(ActionMetadata.StateObject_NewState);
	if (UnitState == none)
		return;

	// dead units should not be reported
	if( !UnitState.IsAlive() )
	{
		return;
	}

	AddEffectMessageToTrack(
		ActionMetadata,
		default.NanoShredEffectLostString,
		VisualizeGameState.GetContext(),
		class'UIEventNoticesTactical'.default.PoisonedTitle,
		"img:///UILibrary_PerkIcons.UIPerk_poisoned",
		eUIState_Good);
	UpdateUnitFlag(ActionMetadata, VisualizeGameState.GetContext());
}

DefaultProperties
{
	NanoShredName="NanoShred"
}