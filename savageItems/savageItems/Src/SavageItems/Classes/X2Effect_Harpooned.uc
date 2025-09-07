class X2Effect_Harpooned extends X2Effect_PersistentStatChange config(GameCore);

	var localized string SavHarpoonedEffectName;
	var localized string SavHarpoonedDesc;
	var config string SavHarpoonedParticle_Name;
	var config name SavHarpoonedSocket_Name;
	var config name SavHarpoonedSocketsArray_Name;

	var config float HARPOONED_MOBILITY_SCALAR;

static function X2Effect_PersistentStatChange CreateSavHarpoonedEffect()
{
	local X2Effect_PersistentStatChange	Effect;
	local X2Condition_UnitProperty		Condition;
	
	Effect = new class'X2Effect_PersistentStatChange';
	Effect.EffectName = 'Harpooned';
	Effect.DuplicateResponse = eDupe_Refresh;
	Effect.BuildPersistentEffect(3, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Penalty, default.SavHarpoonedEffectName, default.SavHarpoonedDesc, "img:///UILibrary_SavageItems.UIPerk_Unique_Harpooned", true);
	Effect.AddPersistentStatChange(eStat_Mobility, default.HARPOONED_MOBILITY_SCALAR, MODOP_PostMultiplication);
	Effect.AddPersistentStatChange(eStat_Dodge, -100);
	Effect.AddPersistentStatChange(eStat_Defense, -10);
	Effect.bRemoveWhenTargetDies = false;

	Condition = new class'X2Condition_UnitProperty';
	Condition.ExcludeFriendlyToSource = true;
	Condition.ExcludeHostileToSource = false;
	Condition.ExcludeCivilian = false;
	Condition.ExcludeDead = true;
	Condition.ExcludeRobotic = true;
	Effect.TargetConditions.AddItem(Condition);

	if (default.SavHarpoonedParticle_Name != "")
	{
		Effect.VFXTemplateName = default.SavHarpoonedParticle_Name;
		Effect.VFXSocket = default.SavHarpoonedSocket_Name;
		Effect.VFXSocketsArrayName = default.SavHarpoonedSocketsArray_Name;
	}

	return Effect;
}