class X2Effect_JaggedAxe extends XMBEffect_ConditionalBonus config(GameCore);

var localized string JaggedAxe_AimUpName;
var localized string JaggedAxe_CritChanceUpName;
var localized string JaggedAxe_DamUpName;
var localized string JaggedAxe_CritDamUpName;

var localized string JaggedAxe_AimUpDesc;
var localized string JaggedAxe_CritChanceUpDesc;
var localized string JaggedAxe_DamUpDesc;
var localized string JaggedAxe_CritDamUpDesc;


static function XMBEffect_ConditionalBonus CreateJaggedAxe_AimUp()
{
	local XMBEffect_ConditionalBonus	Effect;
	local XMBCondition_WeaponName		WeaponCondition;
	local X2Condition_SavWeaponCategory	WeaponCondition2;

	WeaponCondition = new class'XMBCondition_WeaponName';
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxe');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxeThrown');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxe_Enhanced');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxeThrown_Enhanced');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxe_Enhanced');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxeThrown_Enhanced');

	WeaponCondition2 = new class'X2Condition_SavWeaponCategory';
	WeaponCondition2.IncludeWeaponCategories.AddItem('sword');

//Positive aim effect
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'JaggedAxe_AimUpNM';
	Effect.AddToHitModifier(5);
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.JaggedAxe_AimUpName, default.JaggedAxe_AimUpDesc, "img:///UILibrary_SavageItems.UIPerk_Unique_JaggedEdge", true);
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.bRemoveWhenTargetDies = true;

	Effect.AbilityShooterConditions.AddItem(WeaponCondition);
	Effect.AbilityShooterConditions.AddItem(WeaponCondition2);

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateJaggedAxe_CritChanceUp()
{
	local XMBEffect_ConditionalBonus	Effect;
	local XMBCondition_WeaponName		WeaponCondition;
	local X2Condition_SavWeaponCategory	WeaponCondition2;

	WeaponCondition = new class'XMBCondition_WeaponName';
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxe');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxeThrown');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxe_Enhanced');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxeThrown_Enhanced');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxe_Enhanced');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxeThrown_Enhanced');

	WeaponCondition2 = new class'X2Condition_SavWeaponCategory';
	WeaponCondition2.IncludeWeaponCategories.AddItem('sword');

//Positive crit chance
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'JaggedAxe_CritChanceUpNM';
	Effect.AddToHitModifier(5, eHit_Crit);
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.JaggedAxe_CritChanceUpName, default.JaggedAxe_CritChanceUpDesc, "img:///UILibrary_SavageItems.UIPerk_Unique_JaggedEdge", true);
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.bRemoveWhenTargetDies = true;

	Effect.AbilityShooterConditions.AddItem(WeaponCondition);
	Effect.AbilityShooterConditions.AddItem(WeaponCondition2);

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateJaggedAxe_DamUp()
{
	local XMBEffect_ConditionalBonus	Effect;
	local XMBCondition_WeaponName		WeaponCondition;
	local X2Condition_SavWeaponCategory	WeaponCondition2;

	WeaponCondition = new class'XMBCondition_WeaponName';
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxe');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxeThrown');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxe_Enhanced');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxeThrown_Enhanced');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxe_Enhanced');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxeThrown_Enhanced');

	WeaponCondition2 = new class'X2Condition_SavWeaponCategory';
	WeaponCondition2.IncludeWeaponCategories.AddItem('sword');

//Negative damage
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'JaggedAxe_DamUpNM';
	Effect.AddDamageModifier(1);
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.JaggedAxe_DamUpName, default.JaggedAxe_DamUpDesc, "img:///UILibrary_SavageItems.UIPerk_Unique_JaggedEdge", true);
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.bRemoveWhenTargetDies = true;

	Effect.AbilityShooterConditions.AddItem(WeaponCondition);
	Effect.AbilityShooterConditions.AddItem(WeaponCondition2);

	return Effect;
}

static function XMBEffect_ConditionalBonus CreateJaggedAxe_CritDamUp()
{
	local XMBEffect_ConditionalBonus	Effect;
	local XMBCondition_WeaponName		WeaponCondition;
	local X2Condition_SavWeaponCategory	WeaponCondition2;

	WeaponCondition = new class'XMBCondition_WeaponName';
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxe');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxeThrown');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxe_Enhanced');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxeThrown_Enhanced');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxe_Enhanced');
	WeaponCondition.IncludeWeaponNames.AddItem('SAV_Unique_JaggedAxeThrown_Enhanced');

	WeaponCondition2 = new class'X2Condition_SavWeaponCategory';
	WeaponCondition2.IncludeWeaponCategories.AddItem('sword');

//Positive crit damage
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'JaggedAxe_CritDamUpNM';
	Effect.AddDamageModifier(1, eHit_Crit);
	Effect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.JaggedAxe_CritDamUpName, default.JaggedAxe_CritDamUpDesc, "img:///UILibrary_SavageItems.UIPerk_Unique_JaggedEdge", true);
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.bRemoveWhenTargetDies = true;

	Effect.AbilityShooterConditions.AddItem(WeaponCondition);
	Effect.AbilityShooterConditions.AddItem(WeaponCondition2);

	return Effect;
}