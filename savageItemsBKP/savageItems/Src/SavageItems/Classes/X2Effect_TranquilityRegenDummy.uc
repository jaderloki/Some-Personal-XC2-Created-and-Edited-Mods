class X2Effect_TranquilityRegenDummy extends XMBEffect_ConditionalBonus
	config(GameCore);

	var name TranquilityRegenDummyName;
	var localized string TranquilityRegenDummyEffectName;
	var localized string TranquilityRegenDummyDesc;
	var config string TranquilityRegenDummyFriendlyParticle_Name;
	var config name TranquilityRegenDummyFriendlySocket_Name;
	var config name TranquilityRegenDummyFriendlySocketsArray_Name;

static function XMBEffect_ConditionalBonus CreateTranquilityRegenDummyEffect()
{
	local XMBEffect_ConditionalBonus	Effect;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = default.TranquilityRegenDummyName;
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.TranquilityRegenDummyEffectName, default.TranquilityRegenDummyDesc, "img:///UILibrary_SavageItems.UIPerk_Effect_Regen", true);
	Effect.bRemoveWhenTargetDies = true;

	if (default.TranquilityRegenDummyFriendlyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.TranquilityRegenDummyFriendlyParticle_Name;
		Effect.VFXSocket = default.TranquilityRegenDummyFriendlySocket_Name;
		Effect.VFXSocketsArrayName = default.TranquilityRegenDummyFriendlySocketsArray_Name;
	}

	return Effect;
}

DefaultProperties
{
	TranquilityRegenDummyName="TranquilityRegenDummy"
}
