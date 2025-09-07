class X2Effect_CommandDesignatorEffects extends XMBEffect_ConditionalBonus
	config(GameCore);

	var name CDTakeCoverName;
	var localized string CDTakeCoverEffectName;
	var localized string CDTakeCoverDesc;
	var config string CDTakeCoverParticle_Name;
	var config name CDTakeCoverSocket_Name;
	var config name CDTakeCoverSocketsArray_Name;
	
	var name CDMoveItName;
	var localized string CDMoveItEffectName;
	var localized string CDMoveItDesc;
	var config string CDMoveItParticle_Name;
	var config name CDMoveItSocket_Name;
	var config name CDMoveItSocketsArray_Name;

	var name CDCoveringFireName;
	var localized string CDCoveringFireEffectName;
	var localized string CDCoveringFireDesc;
	var config string CDCoveringFireParticle_Name;
	var config name CDCoveringFireSocket_Name;
	var config name CDCoveringFireSocketsArray_Name;

static function X2Effect_Persistent CreateCDTakeCoverEffect()
{
	local X2Effect_Persistent           PersistentEffect;
	
	PersistentEffect = new class'X2Effect_Persistent';
	PersistentEffect.EffectName = default.CDTakeCoverName;
	PersistentEffect.DuplicateResponse = eDupe_Refresh;
	PersistentEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	PersistentEffect.SetDisplayInfo(ePerkBuff_Bonus, default.CDTakeCoverEffectName, default.CDTakeCoverDesc, "img:///UILibrary_SavageItems.UIPerk_ComDesi_TakeCover", true);

	if (default.CDTakeCoverParticle_Name != "")
	{
		PersistentEffect.VFXTemplateName = default.CDTakeCoverParticle_Name;
		PersistentEffect.VFXSocket = default.CDTakeCoverSocket_Name;
		PersistentEffect.VFXSocketsArrayName = default.CDTakeCoverSocketsArray_Name;
	}

	return PersistentEffect;
}

static function X2Effect_Persistent CreateCDMoveItEffect()
{
	local X2Effect_Persistent           PersistentEffect;
	
	PersistentEffect = new class'X2Effect_Persistent';
	PersistentEffect.EffectName = default.CDMoveItName;
	PersistentEffect.DuplicateResponse = eDupe_Refresh;
	PersistentEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	PersistentEffect.SetDisplayInfo(ePerkBuff_Bonus, default.CDMoveItEffectName, default.CDMoveItDesc, "img:///UILibrary_SavageItems.UIPerk_ComDesi_MoveIt", true);

	if (default.CDMoveItParticle_Name != "")
	{
		PersistentEffect.VFXTemplateName = default.CDMoveItParticle_Name;
		PersistentEffect.VFXSocket = default.CDMoveItSocket_Name;
		PersistentEffect.VFXSocketsArrayName = default.CDMoveItSocketsArray_Name;
	}

	return PersistentEffect;
}

static function X2Effect_Persistent CreateCDCoveringFireEffect()
{
	local X2Effect_Persistent           PersistentEffect;
	
	PersistentEffect = new class'X2Effect_Persistent';
	PersistentEffect.EffectName = default.CDCoveringFireName;
	PersistentEffect.DuplicateResponse = eDupe_Refresh;
	PersistentEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	PersistentEffect.SetDisplayInfo(ePerkBuff_Bonus, default.CDCoveringFireEffectName, default.CDCoveringFireDesc, "img:///UILibrary_SavageItems.UIPerk_ComDesi_CoveringFire", true);

	if (default.CDCoveringFireParticle_Name != "")
	{
		PersistentEffect.VFXTemplateName = default.CDCoveringFireParticle_Name;
		PersistentEffect.VFXSocket = default.CDCoveringFireSocket_Name;
		PersistentEffect.VFXSocketsArrayName = default.CDCoveringFireSocketsArray_Name;
	}

	return PersistentEffect;
}

DefaultProperties
{
	CDTakeCoverName="CDTakeCover"
	CDMoveItName="CDMoveIt"
	CDCoveringFireName="CDCoveringFire"
}