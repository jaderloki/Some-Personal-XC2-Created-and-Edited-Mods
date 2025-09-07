class X2Effect_TacScanFriendlyEffect extends XMBEffect_ConditionalBonus
	config(GameCore);

	var config int TACSCAN_TURNS;

	var name TacScanFriendlyTagName;
	var localized string TacScannerTagEffectName;
	var localized string TacScannerTagDesc;
	var config string TacScanFriendlyParticle_Name;
	var config name TacScanFriendlySocket_Name;
	var config name TacScanFriendlySocketsArray_Name;

	var name TacScanEnemyTagName;
	var localized string TacScannerEnemyTagEffectName;
	var localized string TacScannerEnemyTagDesc;
	var config string TacScanEnemyParticle_Name;
	var config name TacScanEnemySocket_Name;
	var config name TacScanEnemySocketsArray_Name;

static function XMBEffect_ConditionalBonus CreateTacScanFriendlyEffect()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingFriendlyCondition;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = default.TacScanFriendlyTagName;
	Effect.DuplicateResponse = eDupe_Refresh;
	Effect.BuildPersistentEffect(default.TACSCAN_TURNS, false, true, false, eGameRule_PlayerTurnBegin);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.TacScannerTagEffectName, default.TacScannerTagDesc, "img:///UILibrary_SavageItems.UIPerk_Tacscan_Friendly", true);
	Effect.AddToHitAsTargetModifier(-15, eHit_Crit);
	Effect.AddToHitAsTargetModifier(-15);
	Effect.bRemoveWhenTargetDies = true;

	LivingFriendlyCondition = new class'X2Condition_UnitProperty';
	LivingFriendlyCondition.ExcludeFriendlyToSource = false;
	LivingFriendlyCondition.ExcludeHostileToSource = true;
	LivingFriendlyCondition.ExcludeCivilian = true;
	LivingFriendlyCondition.ExcludeDead = true;
	Effect.TargetConditions.AddItem(LivingFriendlyCondition);

	if (default.TacScanFriendlyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.TacScanFriendlyParticle_Name;
		Effect.VFXSocket = default.TacScanFriendlySocket_Name;
		Effect.VFXSocketsArrayName = default.TacScanFriendlySocketsArray_Name;
	}

//	Effect.VFXTemplateName = "SAV_TacScanner.P_TacScan_Friendly";
//	Effect.VFXSocket = 'FX_Chest';

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateTacScanEnemyEffect()
{
	local XMBEffect_ConditionalBonus	Effect;
	local X2Condition_UnitProperty		LivingEnemyCondition;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = default.TacScanEnemyTagName;
	Effect.DuplicateResponse = eDupe_Refresh;
	Effect.BuildPersistentEffect(default.TACSCAN_TURNS, false, true, false, eGameRule_PlayerTurnBegin);
	Effect.SetDisplayInfo(ePerkBuff_Penalty, default.TacScannerEnemyTagEffectName, default.TacScannerEnemyTagDesc, "UILibrary_SavageItems.UIPerk_Tacscan_Enemy", true);
	Effect.AddToHitAsTargetModifier(15, eHit_Crit);
	Effect.AddToHitAsTargetModifier(15);
	Effect.bRemoveWhenTargetDies = true;

	LivingEnemyCondition = new class'X2Condition_UnitProperty';
	LivingEnemyCondition.ExcludeFriendlyToSource = true;
	LivingEnemyCondition.ExcludeHostileToSource = false;
	LivingEnemyCondition.ExcludeCivilian = true;
	LivingEnemyCondition.ExcludeDead = true;
	Effect.TargetConditions.AddItem(LivingEnemyCondition);

	if (default.TacScanEnemyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.TacScanEnemyParticle_Name;
		Effect.VFXSocket = default.TacScanEnemySocket_Name;
		Effect.VFXSocketsArrayName = default.TacScanEnemySocketsArray_Name;
	}

	return Effect;
}

DefaultProperties
{
	TacScanFriendlyTagName="TacScanFriendly"
	TacScanEnemyTagName="TacScanEnemy"
}