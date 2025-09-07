class X2Effect_AModDefField extends XMBEffect_ConditionalBonus
	config(GameCore);

	var localized string AModDefenceFieldName;
	var localized string AModDefenceFieldDesc;
	var config string AModDefenceFieldFriendlyParticle_Name;
	var config name AModDefenceFieldFriendlySocket_Name;
	var config name AModDefenceFieldFriendlySocketsArray_Name;

static function XMBEffect_ConditionalBonus CreateAModDefFieldEffect()
{
	local XMBEffect_ConditionalBonus	Effect;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'AModDefenceField';
	Effect.BuildPersistentEffect(0, false, false, false, eGameRule_PlayerTurnBegin);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.AModDefenceFieldName, default.AModDefenceFieldDesc, "img:///UILibrary_PerkIcons.UIPerk_adventshieldbearer_energyshield", true);
	Effect.AddToHitAsTargetModifier(-30);
	Effect.AddDamageModifier(-2);
	Effect.DuplicateResponse = eDupe_Refresh;
	Effect.bRemoveWhenTargetDies = true;
	Effect.EffectRemovedVisualizationFn = OnDefFieldRemoved_BuildVisualization;
	
	if (default.AModDefenceFieldFriendlyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.AModDefenceFieldFriendlyParticle_Name;
		Effect.VFXSocket = default.AModDefenceFieldFriendlySocket_Name;
		Effect.VFXSocketsArrayName = default.AModDefenceFieldFriendlySocketsArray_Name;
	}

	return Effect;
}

simulated function OnDefFieldRemoved_BuildVisualization(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const name EffectApplyResult)
{
	local X2Action_PlaySoundAndFlyOver SoundAndFlyOver;

	if (XGUnit(ActionMetadata.VisualizeActor).IsAlive())
	{
		SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(ActionMetadata, VisualizeGameState.GetContext(), false, ActionMetadata.LastActionAdded));
		SoundAndFlyOver.SetSoundAndFlyOverParameters(None, class'XLocalizedData'.default.ShieldRemovedMsg, '', eColor_Bad, , 0.75, true);
	}
}