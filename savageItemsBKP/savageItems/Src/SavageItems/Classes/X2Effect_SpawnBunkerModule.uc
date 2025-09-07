class X2Effect_SpawnBunkerModule extends X2Effect_SpawnUnit config(GameData_SoldierSkills);

var config array<Name> AbilitiesBMODULECantHave;

function vector GetSpawnLocation(const out EffectAppliedData ApplyEffectParameters, XComGameState NewGameState)
{
	local Vector DropPosition;

	DropPosition = ApplyEffectParameters.AbilityInputContext.TargetLocations[0];

	if(ApplyEffectParameters.AbilityInputContext.TargetLocations.Length == 0)
	{
		return vect(0,0,0);
	}
	
	return DropPosition;
}

function OnSpawnComplete(const out EffectAppliedData ApplyEffectParameters, StateObjectReference NewUnitRef, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	local XComGameState_Unit NewUnitState;

	NewUnitState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', NewUnitRef.ObjectID));
	NewUnitState.GhostSourceUnit = ApplyEffectParameters.SourceStateObjectRef;
	NewUnitState.kAppearance.bGhostPawn = true;

	NewUnitState.SetUnitFloatValue('NewSpawnedUnit', 1, eCleanup_BeginTactical);
}

function ETeam GetTeam(const out EffectAppliedData ApplyEffectParameters)
{
	return GetSourceUnitsTeam(ApplyEffectParameters);
}

/*
function OnSpawnComplete(const out EffectAppliedData ApplyEffectParameters, StateObjectReference NewUnitRef, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
    local XComGameState_Unit SpawnedUnitGameState;
    SpawnedUnitGameState = XComGameState_Unit(NewGameState.GetGameStateForObjectID(NewUnitRef.ObjectID));
    SpawnedUnitGameState.kAppearance.bGhostPawn = true;
}
*/
simulated function ModifyAbilitiesPreActivation(StateObjectReference NewUnitRef, out array<AbilitySetupData> AbilityData, XComGameState NewGameState)
{
	local X2AbilityTemplate NewAbilityTemplate;
	local AbilitySetupData TempData;
	local int FindIndex, LoopIndex, CantHaveIndex;
	local name LoopName, CantHaveName;

	// Jwats: Ghost templar should not have some abilities
	for (LoopIndex = 0; LoopIndex < class'X2Ability_TemplarAbilitySet'.default.AbilitiesGhostCantHave.Length; ++LoopIndex)
	{
		LoopName = class'X2Ability_TemplarAbilitySet'.default.AbilitiesGhostCantHave[LoopIndex];
		FindIndex = AbilityData.Find('TemplateName', LoopName);
		while (FindIndex != INDEX_NONE)
		{
			AbilityData.Remove(FindIndex, 1);
			FindIndex = AbilityData.Find('TemplateName', LoopName);
		}
	}
	// Ghost templar needs some other abilities regular templars don't get
	for (LoopIndex = 0; LoopIndex < class'X2Ability_TemplarAbilitySet'.default.GhostOnlyAbilities.Length; ++LoopIndex)
	{
		LoopName = class'X2Ability_TemplarAbilitySet'.default.GhostOnlyAbilities[LoopIndex];
		NewAbilityTemplate = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate(LoopName);
		if (NewAbilityTemplate != None)
		{
			TempData.Template = NewAbilityTemplate;
			TempData.TemplateName = NewAbilityTemplate.DataName;
			AbilityData.AddItem(TempData);
		}
	}
	// Check to see which abilities the Shadow can't have
	for (CantHaveIndex = 0; CantHaveIndex < default.AbilitiesBMODULECantHave.Length; ++CantHaveIndex)
	{
		CantHaveName = default.AbilitiesBMODULECantHave[CantHaveIndex];
		FindIndex = AbilityData.Find('TemplateName', CantHaveName);
		while (FindIndex != INDEX_NONE)
		{
			AbilityData.Remove(FindIndex, 1);
			FindIndex = AbilityData.Find('TemplateName', CantHaveName);
		}
	}
}

defaultproperties
{
	UnitToSpawnName="BunkerModule"
	bKnockbackAffectsSpawnLocation=false
	EffectName="SpawnBunkerModule"
}