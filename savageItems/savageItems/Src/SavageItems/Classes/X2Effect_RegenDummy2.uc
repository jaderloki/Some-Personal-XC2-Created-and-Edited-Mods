class X2Effect_RegenDummy2 extends XMBEffect_ConditionalBonus
	config(GameCore);

	var name RegenDummy2Name;
	var localized string RegenDummy2EffectName;
	var localized string RegenDummy2Desc;
	var config string RegenDummy2FriendlyParticle_Name;
	var config name RegenDummy2FriendlySocket_Name;
	var config name RegenDummy2FriendlySocketsArray_Name;

static function XMBEffect_ConditionalBonus CreateRegenDummy2Effect()
{
	local XMBEffect_ConditionalBonus	Effect;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = default.RegenDummy2Name;
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.BuildPersistentEffect(6, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.RegenDummy2EffectName, default.RegenDummy2Desc, "img:///UILibrary_SavageItems.UIPerk_Effect_Regen", true);
	Effect.bRemoveWhenTargetDies = true;

	if (default.RegenDummy2FriendlyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.RegenDummy2FriendlyParticle_Name;
		Effect.VFXSocket = default.RegenDummy2FriendlySocket_Name;
		Effect.VFXSocketsArrayName = default.RegenDummy2FriendlySocketsArray_Name;
	}

	return Effect;
}

DefaultProperties
{
	RegenDummy2Name="RegenDummy2"
}