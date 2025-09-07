class X2Effect_SavUplink extends X2Effect_PersistentStatChange
	config(GameCore);

	var name AdvToolUplinkName;
	var localized string UplinkEffectName;
	var localized string UplinkEffectDesc;
	var config int ADVHACKTUPLINK_BONUS;

	var config string UplinkFriendlyParticle_Name;
	var config name UplinkFriendlySocket_Name;
	var config name UplinkFriendlySocketsArray_Name;

	var name IceBreakerName;
	var localized string IceBreakerEffectName;
	var localized string IceBreakerEffectDesc;
//	var config int ADVHACKTUPLINK_BONUS;

	var config string IceBreakerFriendlyParticle_Name;
	var config name IceBreakerFriendlySocket_Name;
	var config name IceBreakerFriendlySocketsArray_Name;

static function X2Effect_PersistentStatChange CreateSavUplink()
{
	local X2Effect_PersistentStatChange	Effect;

	Effect = new class'X2Effect_PersistentStatChange';
	Effect.EffectName = default.AdvToolUplinkName;
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.UplinkEffectName, default.UplinkEffectDesc, "img:///UILibrary_SavageItems.UIPerk_AdvUplink", true);
	Effect.AddPersistentStatChange(eStat_Hacking, default.ADVHACKTUPLINK_BONUS);
	Effect.bRemoveWhenTargetDies = true;

	if (default.UplinkFriendlyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.UplinkFriendlyParticle_Name;
		Effect.VFXSocket = default.UplinkFriendlySocket_Name;
		Effect.VFXSocketsArrayName = default.UplinkFriendlySocketsArray_Name;
	}

	return Effect;
}

static function X2Effect_PersistentStatChange CreateSavIceBreaker()
{
	local X2Effect_PersistentStatChange	Effect;

	Effect = new class'X2Effect_PersistentStatChange';
	Effect.EffectName = default.IceBreakerName;
	Effect.DuplicateResponse = eDupe_Refresh;
	Effect.BuildPersistentEffect(2, false, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Penalty, default.IceBreakerEffectName, default.IceBreakerEffectDesc, "img:///UILibrary_SavageItems.UIPerk_IceBreaker", true);
//	Effect.AddPersistentStatChange(eStat_Hacking, default.ADVHACKTUPLINK_BONUS);
	Effect.bRemoveWhenTargetDies = true;

	if (default.UplinkFriendlyParticle_Name != "")
	{
		Effect.VFXTemplateName = default.IceBreakerFriendlyParticle_Name;
		Effect.VFXSocket = default.IceBreakerFriendlySocket_Name;
		Effect.VFXSocketsArrayName = default.IceBreakerFriendlySocketsArray_Name;
	}

	return Effect;
}

DefaultProperties
{
	AdvToolUplinkName="Uplink"
	IceBreakerName="IceBreaker"
}