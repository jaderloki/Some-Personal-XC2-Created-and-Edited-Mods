class X2Effect_BunkerModuleDummyEffect extends XMBEffect_ConditionalBonus config (GameCore);

	var localized string SAVBunkerModuleDummyEffectName;
	var localized string SAVBunkerModuleDummyDesc;
	var config string SAVBunkerModuleDummyParticle_Name;
	var config name SAVBunkerModuleDummySocket_Name;
	var config name SAVBunkerModuleDummySocketsArray_Name;

	var config string SAVBunkerEmitterDummyParticle_Name;
	var config name SAVBunkerEmitterDummySocket_Name;
	var config name SAVBunkerEmitterDummySocketsArray_Name;

	var localized string SAVBunkerPersonalDummyEffectName;
	var localized string SAVBunkerPersonalDummyDesc;

static function XMBEffect_ConditionalBonus CreateSAVBunkerModuleDummyEffect()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingFriendlyCondition;
	
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'SAVBunkerModuleDummyEffectName';
	Effect.DuplicateResponse = eDupe_Ignore;
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.SAVBunkerModuleDummyEffectName, default.SAVBunkerModuleDummyDesc, "img:///UILibrary_SavageItems.UIPerk_BunkerModule", true);
	Effect.bRemoveWhenTargetDies = true;

	LivingFriendlyCondition = new class'X2Condition_UnitProperty';
	LivingFriendlyCondition.ExcludeFriendlyToSource = false;
	LivingFriendlyCondition.ExcludeHostileToSource = true;
	LivingFriendlyCondition.ExcludeCivilian = true;
	LivingFriendlyCondition.ExcludeDead = true;
	Effect.TargetConditions.AddItem(LivingFriendlyCondition);

	if (default.SAVBunkerModuleDummyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.SAVBunkerModuleDummyParticle_Name;
		Effect.VFXSocket = default.SAVBunkerModuleDummySocket_Name;
		Effect.VFXSocketsArrayName = default.SAVBunkerModuleDummySocketsArray_Name;
	}

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateSAVBunkerEmitterDummyEffect()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingFriendlyCondition;
	
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'SAVBunkerEmitter';
	Effect.DuplicateResponse = eDupe_Ignore;
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	Effect.bRemoveWhenTargetDies = true;

	LivingFriendlyCondition = new class'X2Condition_UnitProperty';
	LivingFriendlyCondition.ExcludeFriendlyToSource = false;
	LivingFriendlyCondition.ExcludeHostileToSource = true;
	LivingFriendlyCondition.ExcludeCivilian = true;
	LivingFriendlyCondition.ExcludeDead = true;
	Effect.TargetConditions.AddItem(LivingFriendlyCondition);

	if (default.SAVBunkerEmitterDummyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.SAVBunkerEmitterDummyParticle_Name;
		Effect.VFXSocket = default.SAVBunkerEmitterDummySocket_Name;
		Effect.VFXSocketsArrayName = default.SAVBunkerEmitterDummySocketsArray_Name;
	}

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateSAVBunkerPersonalDummyEffect()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingFriendlyCondition;
	
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'SAVBunkerPersonalEffect';
	Effect.AddToHitAsTargetModifier(-150, eHit_Crit);
	Effect.AddToHitAsTargetModifier(-35);
	Effect.DuplicateResponse = eDupe_Ignore;
	Effect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.SAVBunkerPersonalDummyEffectName, default.SAVBunkerPersonalDummyDesc, "img:///UILibrary_SavageItems.UIPerk_BunkerField", true);
	Effect.bRemoveWhenTargetDies = true;

	LivingFriendlyCondition = new class'X2Condition_UnitProperty';
	LivingFriendlyCondition.ExcludeFriendlyToSource = false;
	LivingFriendlyCondition.ExcludeHostileToSource = false;
	LivingFriendlyCondition.ExcludeCivilian = false;
	LivingFriendlyCondition.ExcludeDead = true;
	Effect.TargetConditions.AddItem(LivingFriendlyCondition);

	return Effect;
}

//DefaultEffectNames
/*defaultproperties
{
	SAVBunkerPersonalEffectName="SAVBunkerPersonalEffect"
}
*/