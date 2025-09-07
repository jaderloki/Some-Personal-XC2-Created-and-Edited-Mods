class X2Effect_SpawnNanoCloneUnit extends X2Effect_SpawnUnit config(GameData_SoldierSkills);

var name ShadowbindUnconciousCheckName;

var privatewrite name NanocloneTurned;

function vector GetSpawnLocation(const out EffectAppliedData ApplyEffectParameters, XComGameState NewGameState)
{
	if (ApplyEffectParameters.AbilityInputContext.TargetLocations.Length == 0)
	{
		`Redscreen("Attempting to create X2Effect_SpawnShadowbindUnit without a target location! @dslonneger");
		return vect(0, 0, 0);
	}

	return ApplyEffectParameters.AbilityInputContext.TargetLocations[0];
}

// Get the team that this unit should be added to
function ETeam GetTeam(const out EffectAppliedData ApplyEffectParameters)
{
	return GetSourceUnitsTeam(ApplyEffectParameters);
}

function OnSpawnComplete(const out EffectAppliedData ApplyEffectParameters, StateObjectReference NewUnitRef, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	local XComGameState_Unit ShadowbindUnitGameState, ShadowbindTargetUnitGameState;
	local EffectAppliedData NewEffectParams;
	local X2Effect ShadowboundLinkEffect;
	local X2EventManager EventMgr;
	local Object EffectObj;

	ShadowbindTargetUnitGameState = XComGameState_Unit(NewGameState.GetGameStateForObjectID(ApplyEffectParameters.TargetStateObjectRef.ObjectID));
	if( ShadowbindTargetUnitGameState == none )
	{
		ShadowbindTargetUnitGameState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', ApplyEffectParameters.TargetStateObjectRef.ObjectID));
	}
	`assert(ShadowbindTargetUnitGameState != none);

	if (ShadowbindTargetUnitGameState.bReadOnly)
	{
		`RedScreen("X2Effect_SpawnLostZombie: This cannot run on a read only object: " $ShadowbindTargetUnitGameState.ObjectID);
	}

	// Don't allow the dead unit to become a zombie again
	ShadowbindTargetUnitGameState.SetUnitFloatValue(NanocloneTurned, 1, eCleanup_BeginTactical);

	ShadowbindUnitGameState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', NewUnitRef.ObjectID));
	// shadow units cannot move on the same turn they are spawned.
	ShadowbindUnitGameState.ActionPoints.Length = 1;


	// Link the Source and Shadow units
	NewEffectParams = ApplyEffectParameters;
	NewEffectParams.EffectRef.ApplyOnTickIndex = INDEX_NONE;
	NewEffectParams.EffectRef.LookupType = TELT_AbilityTargetEffects;
	NewEffectParams.EffectRef.SourceTemplateName = class'X2Ability_Spectre'.default.ShadowboundLinkName;
	NewEffectParams.EffectRef.TemplateEffectLookupArrayIndex = 0;
	NewEffectParams.TargetStateObjectRef = ShadowbindUnitGameState.GetReference();

	ShadowboundLinkEffect = class'X2Effect'.static.GetX2Effect(NewEffectParams.EffectRef);
	`assert(ShadowboundLinkEffect != none);
	ShadowboundLinkEffect.ApplyEffect(NewEffectParams, ShadowbindUnitGameState, NewGameState);

	// Shadow units need the anim sets of the units they copied. They are all humanoid units so this should be fine
	ShadowbindUnitGameState.ShadowUnit_CopiedUnit = ShadowbindTargetUnitGameState.GetReference();


	EventMgr = `XEVENTMGR;
	EffectObj = NewEffectState;
	EventMgr.RegisterForEvent(EffectObj, 'UnitDied', NewEffectState.ShadowbindUnitDeathListener, ELD_OnStateSubmitted, , ShadowbindUnitGameState);
}

function AddSpawnVisualizationsToTracks(XComGameStateContext Context, XComGameState_Unit SpawnedUnit, out VisualizationActionMetadata SpawnedUnitTrack,
										XComGameState_Unit EffectTargetUnit, optional out VisualizationActionMetadata EffectTargetUnitTrack)
{
	local XComGameStateVisualizationMgr VisMgr;
	local XComGameStateHistory History;
	local X2Action_ShadowbindTarget TargetShadowbind;
	local X2Action_CreateDoppelganger CopyUnitAction;
//	local X2Action_ReanimateCorpse Action;

	VisMgr = `XCOMVISUALIZATIONMGR;
	History = `XCOMHISTORY;

	TargetShadowbind = X2Action_ShadowbindTarget(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_ShadowbindTarget', , XComGameStateContext_Ability(Context).InputContext.PrimaryTarget.ObjectID));

	// Copy the target unit's appearance to the Shadow
	CopyUnitAction = X2Action_CreateDoppelganger(class'X2Action_CreateDoppelganger'.static.AddToVisualizationTree(SpawnedUnitTrack, Context, true, , TargetShadowbind.ParentActions));//TargetShadowbind/*, TargetShadowbind.ParentActions*/));
	CopyUnitAction.OriginalUnit = XGUnit(History.GetVisualizer(EffectTargetUnit.ObjectID));
	CopyUnitAction.ShouldCopyAppearance = false;
	CopyUnitAction.bReplacingOriginalUnit = true;

//	Action = X2Action_ReanimateCorpse(class'X2Action_ReanimateCorpse'.static.AddToVisualizationTree(SpawnedUnitTrack, Context));
//	Action.ReanimationName = 'HL_GetUpA';
}

defaultproperties
{
	UnitToSpawnName="SAVNanoClone"
	bCopyTargetAppearance=false
	bKnockbackAffectsSpawnLocation=false
	EffectName="SpawnNanoCloneUnit"
	bCopyReanimatedFromUnit=true
	bCopyReanimatedStatsFromUnit=false
	bSetProcessedScamperAs=false
	NanocloneTurned="NanocloneTurnedName"
	bClearTileBlockedByTargetUnitFlag=true
//	AnimationName="HL_GetUpA"
//	StartAnimationMinDelaySec=0.0f
//	StartAnimationMaxDelaySec=0.0f
}