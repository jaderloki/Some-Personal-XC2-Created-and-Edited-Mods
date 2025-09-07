class X2Effect_HEDamageAmp extends X2Effect_Persistent;

var localized string EffectFriendlyName;
var localized string EffectLostFriendlyName;
var localized string EffectFriendlyDesc;
var localized string EffectAcquiredString;

var float BonusDamage;

function int GetDefendingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, X2Effect_ApplyWeaponDamage WeaponDamageEffect, optional XComGameState NewGameState)
{
	local int DamageMod;

	if (AppliedData.AbilityInputContext.PrimaryTarget.ObjectID > 0 && class'XComGameStateContext_Ability'.static.IsHitResultHit(AppliedData.AbilityResultContext.HitResult) && CurrentDamage != 0)
	{
		DamageMod = BonusDamage;

	}

	return DamageMod;
}

DefaultProperties
{
	EffectName = "HeDamageAmp"
	DuplicateResponse = eDupe_Allow
	bDisplayInSpecialDamageMessageUI = true
	DamageTypes(0) = "Projectile_Conventional"
}