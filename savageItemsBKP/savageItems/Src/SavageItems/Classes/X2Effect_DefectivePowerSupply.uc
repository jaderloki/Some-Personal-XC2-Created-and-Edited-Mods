class X2Effect_DefectivePowerSupply extends XMBEffect_ConditionalBonus config(GameCore);

var localized string PowerSupply_AimUpName;
var localized string PowerSupply_AimDnName;
var localized string PowerSupply_CritChanceUpName;
var localized string PowerSupply_DamDnName;
var localized string PowerSupply_CritDamUpName;
var localized string PowerSupply_PierceUpName;
var localized string PowerSupply_AimUpDesc;
var localized string PowerSupply_AimDnDesc;
var localized string PowerSupply_CritChanceUpDesc;
var localized string PowerSupply_DamDnDesc;
var localized string PowerSupply_CritDamUpDesc;
var localized string PowerSupply_PierceUpDesc;

static function XMBEffect_ConditionalBonus CreateDefectivePowerSupply_AimUp()
{
	local XMBEffect_ConditionalBonus	Effect;
//Positive aim effect
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'DefectivePowerSupply_AimUpNM';
	Effect.AddToHitModifier(15);
	Effect.ApplyChance = 20;
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.PowerSupply_AimUpName, default.PowerSupply_AimUpDesc, "img:///UILibrary_SavageItems.UiPerk_Unique_Prototype_Hit", true);
	Effect.DuplicateResponse = eDupe_Ignore;
	Effect.bRemoveWhenTargetDies = true;

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateDefectivePowerSupply_AimDn()
{
	local XMBEffect_ConditionalBonus	Effect;
//Negative aim effect
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'DefectivePowerSupply_AimDnNM';
	Effect.AddToHitModifier(-10);
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Penalty, default.PowerSupply_AimDnName, default.PowerSupply_AimDnDesc, "img:///UILibrary_SavageItems.UiPerk_Unique_Prototype_Miss", true);
	Effect.DuplicateResponse = eDupe_Ignore;
	Effect.bRemoveWhenTargetDies = true;

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateDefectivePowerSupply_CritChanceUp()
{
	local XMBEffect_ConditionalBonus	Effect;
//Positive crit chance
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'DefectivePowerSupply_CritChanceUpNM';
	Effect.AddToHitModifier(20, eHit_Crit);
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.PowerSupply_CritChanceUpName, default.PowerSupply_CritChanceUpDesc, "img:///UILibrary_SavageItems.UiPerk_Unique_Prototype_CritChance", true);
	Effect.DuplicateResponse = eDupe_Ignore;
	Effect.bRemoveWhenTargetDies = true;

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateDefectivePowerSupply_DamDn()
{
	local XMBEffect_ConditionalBonus	Effect;
//Negative damage
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'DefectivePowerSupply_DamDnNM';
	Effect.AddDamageModifier(-1);
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Penalty, default.PowerSupply_DamDnName, default.PowerSupply_DamDnDesc, "img:///UILibrary_SavageItems.UiPerk_Unique_Prototype_Weak", true);
	Effect.DuplicateResponse = eDupe_Ignore;
	Effect.bRemoveWhenTargetDies = true;

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateDefectivePowerSupply_CritDamUp()
{
	local XMBEffect_ConditionalBonus	Effect;
//Positive crit damage
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'DefectivePowerSupply_CritDamUpNM';
	Effect.AddDamageModifier(3, eHit_Crit);
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.PowerSupply_CritDamUpName, default.PowerSupply_CritDamUpDesc, "img:///UILibrary_SavageItems.UiPerk_Unique_Prototype_CritDamage", true);
	Effect.DuplicateResponse = eDupe_Ignore;
	Effect.bRemoveWhenTargetDies = true;

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateDefectivePowerSupply_PierceUp()
{
	local XMBEffect_ConditionalBonus	Effect;
//Pierce bonus
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'DefectivePowerSupply_PierceUpNM';
	Effect.AddArmorPiercingModifier(3);
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.PowerSupply_PierceUpName, default.PowerSupply_PierceUpDesc, "img:///UILibrary_SavageItems.UiPerk_Unique_Prototype_AP", true);
	Effect.DuplicateResponse = eDupe_Ignore;
	Effect.bRemoveWhenTargetDies = true;

	return Effect;
}

