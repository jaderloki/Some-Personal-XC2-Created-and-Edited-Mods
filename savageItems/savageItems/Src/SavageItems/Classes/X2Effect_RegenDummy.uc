class X2Effect_RegenDummy extends XMBEffect_ConditionalBonus
	config(GameCore);

	var name RegenDummyName;
	var localized string RegenDummyEffectName;
	var localized string RegenDummyDesc;
	var config string RegenDummyFriendlyParticle_Name;
	var config name RegenDummyFriendlySocket_Name;
	var config name RegenDummyFriendlySocketsArray_Name;

static function XMBEffect_ConditionalBonus CreateRegenDummyEffect()
{
	local XMBEffect_ConditionalBonus	Effect;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = default.RegenDummyName;
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.BuildPersistentEffect(5, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.RegenDummyEffectName, default.RegenDummyDesc, "img:///UILibrary_SavageItems.UIPerk_Effect_Regen", true);
	Effect.bRemoveWhenTargetDies = true;

	if (default.RegenDummyFriendlyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.RegenDummyFriendlyParticle_Name;
		Effect.VFXSocket = default.RegenDummyFriendlySocket_Name;
		Effect.VFXSocketsArrayName = default.RegenDummyFriendlySocketsArray_Name;
	}

	return Effect;
}

DefaultProperties
{
	RegenDummyName="RegenDummy"
}