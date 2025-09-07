
class X2Effect_SAVBrittleEffect extends XMBEffect_ConditionalBonus
	config(GameCore);

	var config int BRITTLE_TURNS;

	var name SAVBrittleName;
	var localized string SAVBrittleEffectName;
	var localized string SAVBrittleDesc;

	var config string SavBrittleParticle_Name;
	var config name SavBrittleSocket_Name;
	var config name SavBrittleSocketsArray_Name;

static function XMBEffect_ConditionalBonus CreateSAVBrittleEffect()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingEnemyCondition;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = default.SAVBrittleName;
	Effect.DuplicateResponse = eDupe_Refresh;
	Effect.BuildPersistentEffect(default.BRITTLE_TURNS, false, true, false, eGameRule_PlayerTurnBegin);
	Effect.SetDisplayInfo(ePerkBuff_Penalty, default.SAVBrittleEffectName, default.SAVBrittleDesc, "UILibrary_DLC2Images.PerkIcons.UIPerk_freezingbreath", true);
	Effect.AddToHitAsTargetModifier(33, eHit_Crit);
	Effect.bRemoveWhenTargetDies = true;

	LivingEnemyCondition = new class'X2Condition_UnitProperty';
	LivingEnemyCondition.ExcludeFriendlyToSource = true;
	LivingEnemyCondition.ExcludeHostileToSource = false;
	LivingEnemyCondition.ExcludeCivilian = false;
	LivingEnemyCondition.ExcludeDead = true;
	Effect.TargetConditions.AddItem(LivingEnemyCondition);

	if (default.SavBrittleParticle_Name != "")
	{
		Effect.VFXTemplateName = default.SavBrittleParticle_Name;
		Effect.VFXSocket = default.SavBrittleSocket_Name;
		Effect.VFXSocketsArrayName = default.SavBrittleSocketsArray_Name;
	}

	return Effect;
}

DefaultProperties
{
	SAVBrittleName="Brittle"
}