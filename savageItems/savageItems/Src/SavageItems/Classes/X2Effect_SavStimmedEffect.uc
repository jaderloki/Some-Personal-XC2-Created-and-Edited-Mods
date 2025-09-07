class X2Effect_SavStimmedEffect extends XMBEffect_ConditionalBonus
	config(GameCore);

	var localized string SavComStimmedEffectName;
	var localized string SavComStimmedDesc;
	var config string SavComStimmedParticle_Name;
	var config name SavComStimmedSocket_Name;
	var config name SavComStimmedSocketsArray_Name;

	var localized string SavComStimmed2EffectName;
	var localized string SavComStimmed2Desc;

	var localized string SavSerumRedActiveEffectName;
	var localized string SavSerumRedActiveDesc;
	var config string SavSerumRedActiveParticle_Name;
	var config name SavSerumRedActiveSocket_Name;
	var config name SavSerumRedActiveSocketsArray_Name;

	var localized string SavSerumBlueActiveEffectName;
	var localized string SavSerumBlueActiveDesc;
	var config string SavSerumBlueActiveParticle_Name;
	var config name SavSerumBlueActiveSocket_Name;
	var config name SavSerumBlueActiveSocketsArray_Name;

	var localized string SavSerumYellowActiveEffectName;
	var localized string SavSerumYellowActiveDesc;
	var config string SavSerumYellowActiveParticle_Name;
	var config name SavSerumYellowActiveSocket_Name;
	var config name SavSerumYellowActiveSocketsArray_Name;

	var localized string SavSerumVioletActiveEffectName;
	var localized string SavSerumVioletActiveDesc;
	var config string SavSerumVioletActiveParticle_Name;
	var config name SavSerumVioletActiveSocket_Name;
	var config name SavSerumVioletActiveSocketsArray_Name;
	
	var localized string SavMindCrushedActiveEffectName;
	var localized string SavMindCrushedActiveDesc;
	var config string SavMindCrushedActiveParticle_Name;
	var config name SavMindCrushedActiveSocket_Name;
	var config name SavMindCrushedActiveSocketsArray_Name;

	var localized string SavSerumOrangeActiveEffectName;
	var localized string SavSerumOrangeActiveDesc;
	var config string SavSerumOrangeActiveParticle_Name;
	var config name SavSerumOrangeActiveSocket_Name;
	var config name SavSerumOrangeActiveSocketsArray_Name;

	var localized string SavSerumGreenActiveEffectName;
	var localized string SavSerumGreenActiveDesc;
	var config string SavSerumGreenActiveParticle_Name;
	var config name SavSerumGreenActiveSocket_Name;
	var config name SavSerumGreenActiveSocketsArray_Name;

static function XMBEffect_ConditionalBonus CreateSavComStimmedEffect()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingFriendlyCondition;
	
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'CombatStims';
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.BuildPersistentEffect(3, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.SavComStimmedEffectName, default.SavComStimmedDesc, "img:///UILibrary_SavageItems.UIPerk_combatstims", true);
	Effect.bRemoveWhenTargetDies = true;

	LivingFriendlyCondition = new class'X2Condition_UnitProperty';
	LivingFriendlyCondition.ExcludeFriendlyToSource = false;
	LivingFriendlyCondition.ExcludeHostileToSource = true;
	LivingFriendlyCondition.ExcludeCivilian = true;
	LivingFriendlyCondition.ExcludeDead = true;
	Effect.TargetConditions.AddItem(LivingFriendlyCondition);

	if (default.SavComStimmedParticle_Name != "")
	{
		Effect.VFXTemplateName = default.SavComStimmedParticle_Name;
		Effect.VFXSocket = default.SavComStimmedSocket_Name;
		Effect.VFXSocketsArrayName = default.SavComStimmedSocketsArray_Name;
	}

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateSavComStimmed2Effect()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingFriendlyCondition;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'AdvCombatStims';
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.SavComStimmed2EffectName, default.SavComStimmed2Desc, "img:///UILibrary_SavageItems.UIPerk_combatstims", true);
	Effect.bRemoveWhenTargetDies = true;

	LivingFriendlyCondition = new class'X2Condition_UnitProperty';
	LivingFriendlyCondition.ExcludeFriendlyToSource = false;
	LivingFriendlyCondition.ExcludeHostileToSource = true;
	LivingFriendlyCondition.ExcludeCivilian = true;
	LivingFriendlyCondition.ExcludeDead = true;
	Effect.TargetConditions.AddItem(LivingFriendlyCondition);

	if (default.SavComStimmedParticle_Name != "")
	{
		Effect.VFXTemplateName = default.SavComStimmedParticle_Name;
		Effect.VFXSocket = default.SavComStimmedSocket_Name;
		Effect.VFXSocketsArrayName = default.SavComStimmedSocketsArray_Name;
	}

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateSavSerumRedActiveEffect()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingFriendlyCondition;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'SerumRedActive';
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.SavSerumRedActiveEffectName, default.SavSerumRedActiveDesc, "img:///UILibrary_SavageItems.UIPerk_Serums", true);
	Effect.bRemoveWhenTargetDies = true;

	LivingFriendlyCondition = new class'X2Condition_UnitProperty';
	LivingFriendlyCondition.ExcludeFriendlyToSource = false;
	LivingFriendlyCondition.ExcludeHostileToSource = true;
	LivingFriendlyCondition.ExcludeCivilian = true;
	LivingFriendlyCondition.ExcludeDead = true;
	Effect.TargetConditions.AddItem(LivingFriendlyCondition);

	if (default.SavSerumRedActiveParticle_Name != "")
	{
		Effect.VFXTemplateName = default.SavSerumRedActiveParticle_Name;
		Effect.VFXSocket = default.SavSerumRedActiveSocket_Name;
		Effect.VFXSocketsArrayName = default.SavSerumRedActiveSocketsArray_Name;
	}

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateSavSerumBlueActiveEffect()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingFriendlyCondition;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'SerumBlueActive';
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.SavSerumBlueActiveEffectName, default.SavSerumBlueActiveDesc, "img:///UILibrary_SavageItems.UIPerk_Serums", true);
	Effect.bRemoveWhenTargetDies = true;

	LivingFriendlyCondition = new class'X2Condition_UnitProperty';
	LivingFriendlyCondition.ExcludeFriendlyToSource = false;
	LivingFriendlyCondition.ExcludeHostileToSource = true;
	LivingFriendlyCondition.ExcludeCivilian = true;
	LivingFriendlyCondition.ExcludeDead = true;
	Effect.TargetConditions.AddItem(LivingFriendlyCondition);

	if (default.SavSerumBlueActiveParticle_Name != "")
	{
		Effect.VFXTemplateName = default.SavSerumBlueActiveParticle_Name;
		Effect.VFXSocket = default.SavSerumBlueActiveSocket_Name;
		Effect.VFXSocketsArrayName = default.SavSerumBlueActiveSocketsArray_Name;
	}

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateSavSerumYellowActiveEffect()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingFriendlyCondition;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'SerumYellowActive';
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.SavSerumYellowActiveEffectName, default.SavSerumYellowActiveDesc, "img:///UILibrary_SavageItems.UIPerk_Serums", true);
	Effect.bRemoveWhenTargetDies = true;

	LivingFriendlyCondition = new class'X2Condition_UnitProperty';
	LivingFriendlyCondition.ExcludeFriendlyToSource = false;
	LivingFriendlyCondition.ExcludeHostileToSource = true;
	LivingFriendlyCondition.ExcludeCivilian = true;
	LivingFriendlyCondition.ExcludeDead = true;
	Effect.TargetConditions.AddItem(LivingFriendlyCondition);

	if (default.SavSerumYellowActiveParticle_Name != "")
	{
		Effect.VFXTemplateName = default.SavSerumYellowActiveParticle_Name;
		Effect.VFXSocket = default.SavSerumYellowActiveSocket_Name;
		Effect.VFXSocketsArrayName = default.SavSerumYellowActiveSocketsArray_Name;
	}

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateSavSerumVioletActiveEffect()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingFriendlyCondition;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'SerumVioletActive';
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.SavSerumVioletActiveEffectName, default.SavSerumVioletActiveDesc, "img:///UILibrary_SavageItems.UIPerk_Serums", true);
	Effect.bRemoveWhenTargetDies = true;

	LivingFriendlyCondition = new class'X2Condition_UnitProperty';
	LivingFriendlyCondition.ExcludeFriendlyToSource = false;
	LivingFriendlyCondition.ExcludeHostileToSource = true;
	LivingFriendlyCondition.ExcludeCivilian = true;
	LivingFriendlyCondition.ExcludeDead = true;
	Effect.TargetConditions.AddItem(LivingFriendlyCondition);

	if (default.SavSerumYellowActiveParticle_Name != "")
	{
		Effect.VFXTemplateName = default.SavSerumVioletActiveParticle_Name;
		Effect.VFXSocket = default.SavSerumVioletActiveSocket_Name;
		Effect.VFXSocketsArrayName = default.SavSerumVioletActiveSocketsArray_Name;
	}

	return Effect;
}

static function X2Effect_PersistentStatChange CreateSavMindCrushedActiveEffect()
{
	local X2Effect_PersistentStatChange		Effect;
	local X2Condition_UnitProperty			UnitPropertyCondition;

	Effect = new class'X2Effect_PersistentStatChange';
	Effect.EffectName = 'SavMindCrushed';
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.BuildPersistentEffect(3, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Penalty, default.SavMindCrushedActiveEffectName, default.SavMindCrushedActiveDesc, "img:///UILibrary_PerkIcons.UIPerk_voidrift", true,);
	Effect.AddPersistentStatChange(eStat_Will, -25);
	Effect.bRemoveWhenTargetDies = true;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.FailOnNonUnits = true;
	Effect.TargetConditions.AddItem(UnitPropertyCondition);
	
	if (default.SavSerumYellowActiveParticle_Name != "")
	{
		Effect.VFXTemplateName = default.SavMindCrushedActiveParticle_Name;
		Effect.VFXSocket = default.SavMindCrushedActiveSocket_Name;
		Effect.VFXSocketsArrayName = default.SavMindCrushedActiveSocketsArray_Name;
	}

	return Effect;	
}

static function XMBEffect_ConditionalBonus CreateSavSerumOrangeActiveEffect()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingFriendlyCondition;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'SerumOrangeActive';
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.SavSerumOrangeActiveEffectName, default.SavSerumOrangeActiveDesc, "img:///UILibrary_SavageItems.UIPerk_Serums", true);
	Effect.bRemoveWhenTargetDies = true;

	LivingFriendlyCondition = new class'X2Condition_UnitProperty';
	LivingFriendlyCondition.ExcludeFriendlyToSource = false;
	LivingFriendlyCondition.ExcludeHostileToSource = true;
	LivingFriendlyCondition.ExcludeCivilian = true;
	LivingFriendlyCondition.ExcludeDead = true;
	Effect.TargetConditions.AddItem(LivingFriendlyCondition);

	if (default.SavSerumYellowActiveParticle_Name != "")
	{
		Effect.VFXTemplateName = default.SavSerumOrangeActiveParticle_Name;
		Effect.VFXSocket = default.SavSerumOrangeActiveSocket_Name;
		Effect.VFXSocketsArrayName = default.SavSerumOrangeActiveSocketsArray_Name;
	}

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateSavSerumGreenActiveEffect()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingFriendlyCondition;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'SerumGreenActive';
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.SavSerumGreenActiveEffectName, default.SavSerumGreenActiveDesc, "img:///UILibrary_SavageItems.UIPerk_Serums", true);
	Effect.bRemoveWhenTargetDies = true;

	LivingFriendlyCondition = new class'X2Condition_UnitProperty';
	LivingFriendlyCondition.ExcludeFriendlyToSource = false;
	LivingFriendlyCondition.ExcludeHostileToSource = true;
	LivingFriendlyCondition.ExcludeCivilian = true;
	LivingFriendlyCondition.ExcludeDead = true;
	Effect.TargetConditions.AddItem(LivingFriendlyCondition);

	if (default.SavSerumGreenActiveParticle_Name != "")
	{
		Effect.VFXTemplateName = default.SavSerumGreenActiveParticle_Name;
		Effect.VFXSocket = default.SavSerumGreenActiveSocket_Name;
		Effect.VFXSocketsArrayName = default.SavSerumGreenActiveSocketsArray_Name;
	}

	return Effect;
}