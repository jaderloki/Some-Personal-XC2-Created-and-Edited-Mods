class X2Effect_MindrazorDamage extends XMBEffect_BonusDamageByDamageType
	config(GameCore);

	var name MindrazorLvl1Name;
	var localized string MindrazorLvl1EffectName;
	var localized string MindrazorLvl1Desc;
	var config string MindrazorLvl1FriendlyParticle_Name;
	var config name MindrazorLvl1FriendlySocket_Name;
	var config name MindrazorLvl1FriendlySocketsArray_Name;

	var name MindrazorLvl2Name;
	var localized string MindrazorLvl2EffectName;
	var localized string MindrazorLvl2Desc;
	var config string MindrazorLvl2FriendlyParticle_Name;
	var config name MindrazorLvl2FriendlySocket_Name;
	var config name MindrazorLvl2FriendlySocketsArray_Name;

	var name MindrazorLvl3Name;
	var localized string MindrazorLvl3EffectName;
	var localized string MindrazorLvl3Desc;
	var config string MindrazorLvl3FriendlyParticle_Name;
	var config name MindrazorLvl3FriendlySocket_Name;
	var config name MindrazorLvl3FriendlySocketsArray_Name;

	var name MindrazorLvl4Name;
	var localized string MindrazorLvl4EffectName;
	var localized string MindrazorLvl4Desc;
	var config string MindrazorLvl4FriendlyParticle_Name;
	var config name MindrazorLvl4FriendlySocket_Name;
	var config name MindrazorLvl4FriendlySocketsArray_Name;

	var name MindrazorMarkedName;
	var localized string MindrazorMarkedEffectName;
	var localized string MindrazorMarkedDesc;
	var config string MindrazorMarkedFriendlyParticle_Name;
	var config name MindrazorMarkedFriendlySocket_Name;
	var config name MindrazorMarkedFriendlySocketsArray_Name;

	var config int MINDRAZOR1DAMAGEBONUS;
	var config int MINDRAZORDAMAGE1DURATION;
	var config int MINDRAZOR2DAMAGEBONUS;
	var config int MINDRAZORDAMAGE2DURATION;
	var config int MINDRAZOR3DAMAGEBONUS;
	var config int MINDRAZORDAMAGE3DURATION;
	var config int MINDRAZOR4DAMAGEBONUS;
	var config int MINDRAZORDAMAGE4DURATION;
	var config int MINDRAZORAMPLIFYMARKAIM;

static function XMBEffect_BonusDamageByDamageType CreateMindrazorDamageLvl1Effect()
{
	local XMBEffect_BonusDamageByDamageType	Effect;

	Effect = new class'XMBEffect_BonusDamageByDamageType';
	Effect.EffectName = default.MindrazorLvl1Name;
	Effect.DuplicateResponse = eDupe_ignore;
	Effect.BuildPersistentEffect(default.MINDRAZORDAMAGE1DURATION, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.MindrazorLvl1EffectName, default.MindrazorLvl1Desc, "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Amplify", true);
	Effect.bRemoveWhenTargetDies = true;
	Effect.RequiredDamageTypes.AddItem('Psi');
	Effect.RequiredDamageTypes.AddItem('Mental');
	Effect.DamageBonus = default.MINDRAZOR1DAMAGEBONUS;

	if (default.MindrazorLvl1FriendlyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.MindrazorLvl1FriendlyParticle_Name;
		Effect.VFXSocket = default.MindrazorLvl1FriendlySocket_Name;
		Effect.VFXSocketsArrayName = default.MindrazorLvl1FriendlySocketsArray_Name;
	}

	return Effect;
}

static function XMBEffect_BonusDamageByDamageType CreateMindrazorDamageLvl2Effect()
{
	local XMBEffect_BonusDamageByDamageType	Effect;

	Effect = new class'XMBEffect_BonusDamageByDamageType';
	Effect.EffectName = default.MindrazorLvl2Name;
	Effect.DuplicateResponse = eDupe_ignore;
	Effect.BuildPersistentEffect(default.MINDRAZORDAMAGE2DURATION, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.MindrazorLvl2EffectName, default.MindrazorLvl2Desc, "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Amplify", true);
	Effect.bRemoveWhenTargetDies = true;
	Effect.RequiredDamageTypes.AddItem('Psi');
	Effect.RequiredDamageTypes.AddItem('Mental');
	Effect.DamageBonus = default.MINDRAZOR2DAMAGEBONUS;

	if (default.MindrazorLvl2FriendlyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.MindrazorLvl2FriendlyParticle_Name;
		Effect.VFXSocket = default.MindrazorLvl2FriendlySocket_Name;
		Effect.VFXSocketsArrayName = default.MindrazorLvl2FriendlySocketsArray_Name;
	}

	return Effect;
}

static function XMBEffect_BonusDamageByDamageType CreateMindrazorDamageLvl3Effect()
{
	local XMBEffect_BonusDamageByDamageType	Effect;

	Effect = new class'XMBEffect_BonusDamageByDamageType';
	Effect.EffectName = default.MindrazorLvl3Name;
	Effect.DuplicateResponse = eDupe_ignore;
	Effect.BuildPersistentEffect(default.MINDRAZORDAMAGE3DURATION, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.MindrazorLvl3EffectName, default.MindrazorLvl3Desc, "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Amplify", true);
	Effect.bRemoveWhenTargetDies = true;
	Effect.RequiredDamageTypes.AddItem('Psi');
	Effect.RequiredDamageTypes.AddItem('Mental');
	Effect.DamageBonus = default.MINDRAZOR3DAMAGEBONUS;

	if (default.MindrazorLvl3FriendlyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.MindrazorLvl3FriendlyParticle_Name;
		Effect.VFXSocket = default.MindrazorLvl3FriendlySocket_Name;
		Effect.VFXSocketsArrayName = default.MindrazorLvl3FriendlySocketsArray_Name;
	}

	return Effect;
}

static function XMBEffect_BonusDamageByDamageType CreateMindrazorDamageLvl4Effect()
{
	local XMBEffect_BonusDamageByDamageType	Effect;

	Effect = new class'XMBEffect_BonusDamageByDamageType';
	Effect.EffectName = default.MindrazorLvl4Name;
	Effect.DuplicateResponse = eDupe_ignore;
	Effect.BuildPersistentEffect(default.MINDRAZORDAMAGE4DURATION, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.MindrazorLvl4EffectName, default.MindrazorLvl4Desc, "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Amplify", true);
	Effect.bRemoveWhenTargetDies = true;
	Effect.RequiredDamageTypes.AddItem('Psi');
	Effect.RequiredDamageTypes.AddItem('Mental');
	Effect.DamageBonus = default.MINDRAZOR4DAMAGEBONUS;

	if (default.MindrazorLvl4FriendlyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.MindrazorLvl4FriendlyParticle_Name;
		Effect.VFXSocket = default.MindrazorLvl4FriendlySocket_Name;
		Effect.VFXSocketsArrayName = default.MindrazorLvl4FriendlySocketsArray_Name;
	}

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateMindrazorMarked()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingEnemyCondition;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = default.MindrazorMarkedName;
	Effect.DuplicateResponse = eDupe_ignore;
	Effect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Penalty, default.MindrazorMarkedEffectName, default.MindrazorMarkedDesc, "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Amplify", true);
	Effect.bRemoveWhenTargetDies = true;
	Effect.AddToHitAsTargetModifier(default.MINDRAZORAMPLIFYMARKAIM);

	LivingEnemyCondition = new class'X2Condition_UnitProperty';
	LivingEnemyCondition.ExcludeFriendlyToSource = true;
	LivingEnemyCondition.ExcludeHostileToSource = false;
	LivingEnemyCondition.ExcludeCivilian = false;
	LivingEnemyCondition.ExcludeDead = true;
	Effect.TargetConditions.AddItem(LivingEnemyCondition);

	if (default.MindrazorMarkedFriendlyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.MindrazorMarkedFriendlyParticle_Name;
		Effect.VFXSocket = default.MindrazorMarkedFriendlySocket_Name;
		Effect.VFXSocketsArrayName = default.MindrazorMarkedFriendlySocketsArray_Name;
	}

	return Effect;
}

DefaultProperties
{
	MindrazorLvl1Name="MindrazorLvl1"
	MindrazorLvl2Name="MindrazorLvl2"
	MindrazorLvl3Name="MindrazorLvl3"
	MindrazorLvl4Name="MindrazorLvl4"
	MindrazorMarkedName="Mindrazor Amplify Mark"
}