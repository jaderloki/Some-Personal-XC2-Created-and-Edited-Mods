class X2Effect_NaniteRegenDummy extends XMBEffect_ConditionalBonus
	config(GameCore);

	var name NaniteRegenDummyName;
	var localized string NaniteRegenDummyEffectName;
	var localized string NaniteRegenDummyDesc;
	var config string NaniteRegenDummyFriendlyParticle_Name;
	var config name NaniteRegenDummyFriendlySocket_Name;
	var config name NaniteRegenDummyFriendlySocketsArray_Name;

static function XMBEffect_ConditionalBonus CreateNaniteRegenDummyEffect()
{
	local XMBEffect_ConditionalBonus	Effect;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = default.NaniteRegenDummyName;
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.BuildPersistentEffect(4, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.NaniteRegenDummyEffectName, default.NaniteRegenDummyDesc, "img:///UILibrary_SavageItems.UIPerk_Effect_Regen", true);
	Effect.bRemoveWhenTargetDies = true;

	if (default.NaniteRegenDummyFriendlyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.NaniteRegenDummyFriendlyParticle_Name;
		Effect.VFXSocket = default.NaniteRegenDummyFriendlySocket_Name;
		Effect.VFXSocketsArrayName = default.NaniteRegenDummyFriendlySocketsArray_Name;
	}

	return Effect;
}

DefaultProperties
{
	NaniteRegenDummyName="NaniteRegenDummy"
}