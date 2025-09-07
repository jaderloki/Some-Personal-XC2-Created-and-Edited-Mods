class X2Effect_SavScanPing extends XMBEffect_ConditionalBonus
	config(GameCore);

	var name ScanPingName;
	var localized string ScanPingEffectName;
	var localized string ScanPingDesc;
	var config string ScanPingFriendlyParticle_Name;
	var config name ScanPingFriendlySocket_Name;
	var config name ScanPingFriendlySocketsArray_Name;

static function XMBEffect_ConditionalBonus CreateScanPingEffect()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingEnemyCondition;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = default.ScanPingName;
	Effect.DuplicateResponse = eDupe_Refresh;
	Effect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	Effect.SetDisplayInfo(ePerkBuff_Penalty, default.ScanPingEffectName, default.ScanPingDesc, "img:///UILibrary_PerkIcons.UIPerk_battlescanner", true);
	Effect.bRemoveWhenTargetDies = true;

	LivingEnemyCondition = new class'X2Condition_UnitProperty';
	LivingEnemyCondition.ExcludeDead = true;
	LivingEnemyCondition.ExcludeInStasis=false;
	LivingEnemyCondition.ExcludeFriendlyToSource = true;
	LivingEnemyCondition.ExcludeHostileToSource = false;
	LivingEnemyCondition.ExcludeCivilian = false;

	Effect.TargetConditions.AddItem(LivingEnemyCondition);

	if (default.ScanPingFriendlyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.ScanPingFriendlyParticle_Name;
		Effect.VFXSocket = default.ScanPingFriendlySocket_Name;
		Effect.VFXSocketsArrayName = default.ScanPingFriendlySocketsArray_Name;
	}

	return Effect;
}


DefaultProperties
{
	ScanPingName="ScanPing"
}