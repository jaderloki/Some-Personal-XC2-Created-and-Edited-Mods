class X2Effect_BunkerModPersonalShieldVFX extends XMBEffect_ConditionalBonus config (GameCore);

	var config string SAVBunkerModPersonalShieldParticle_Name;
	var config name SAVBunkerModPersonalShieldSocket_Name;
	var config name SAVBunkerModPersonalShieldSocketsArray_Name;

static function XMBEffect_ConditionalBonus CreateBunkerModPersonalShieldVFX()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingFriendlyCondition;
	
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'SAVBunkerModPersonalVFXName';
	Effect.DuplicateResponse = eDupe_Ignore;
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	Effect.bRemoveWhenTargetDies = true;

	LivingFriendlyCondition = new class'X2Condition_UnitProperty';
	LivingFriendlyCondition.ExcludeFriendlyToSource = false;
	LivingFriendlyCondition.ExcludeHostileToSource = false;
	LivingFriendlyCondition.ExcludeCivilian = false;
	LivingFriendlyCondition.ExcludeDead = true;
	Effect.TargetConditions.AddItem(LivingFriendlyCondition);

	if (default.SAVBunkerModPersonalShieldParticle_Name != "")
	{
		Effect.VFXTemplateName = default.SAVBunkerModPersonalShieldParticle_Name;
		Effect.VFXSocket = default.SAVBunkerModPersonalShieldSocket_Name;
		Effect.VFXSocketsArrayName = default.SAVBunkerModPersonalShieldSocketsArray_Name;
	}

	return Effect;
}