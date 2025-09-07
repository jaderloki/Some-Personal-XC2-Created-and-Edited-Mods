class X2Effect_SAVHeadsDown extends X2Effect_PersistentStatChange config(GameCore);

	var localized string SAVHeadsDownEffectName;
	var localized string SAVHeadsDownDesc;
	var config string SAVHeadsDownParticle_Name;
	var config name SAVHeadsDownSocket_Name;
	var config name SAVHeadsDownSocketsArray_Name;

	var config float HEADSDN_MOBILITY_SCALAR;
	var config float HEADSDN_OFFENCE_SCALAR;

static function X2Effect_PersistentStatChange CreateSAVHeadsDownEffect()
{
	local X2Effect_PersistentStatChange	Effect;
	local X2Condition_UnitProperty		Condition;
	
	Effect = new class'X2Effect_PersistentStatChange';
	Effect.EffectName = 'Harpooned';
	Effect.DuplicateResponse = eDupe_Refresh;
	Effect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Penalty, default.SAVHeadsDownEffectName, default.SAVHeadsDownDesc, "img:///UILibrary_SavageItems.UiPerk_Unique_HeadsDnEffect", true);
	Effect.AddPersistentStatChange(eStat_Mobility, default.HEADSDN_MOBILITY_SCALAR, MODOP_PostMultiplication);
	Effect.AddPersistentStatChange(eStat_Offense, default.HEADSDN_OFFENCE_SCALAR, MODOP_PostMultiplication);
	Effect.bRemoveWhenTargetDies = false;
	Effect.bIsImpairing = true;
	Effect.bApplyOnMiss = true;

	Condition = new class'X2Condition_UnitProperty';
	Condition.ExcludeFriendlyToSource = true;
	Condition.ExcludeHostileToSource = false;
	Condition.ExcludeCivilian = false;
	Condition.ExcludeDead = true;
	Condition.ExcludeRobotic = true;
	Effect.TargetConditions.AddItem(Condition);

	if (default.SAVHeadsDownParticle_Name != "")
	{
		Effect.VFXTemplateName = default.SAVHeadsDownParticle_Name;
		Effect.VFXSocket = default.SAVHeadsDownSocket_Name;
		Effect.VFXSocketsArrayName = default.SAVHeadsDownSocketsArray_Name;
	}

	return Effect;
}