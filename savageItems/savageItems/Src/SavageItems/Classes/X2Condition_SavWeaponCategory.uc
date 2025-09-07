class X2Condition_SavWeaponCategory extends X2Condition;
//THANKS TO MUSASHI FOR PROVIDING THIS CONDITION, ITS A STRAIGHT COPY
var() array<name> IncludeWeaponCategories;
var() array<name> ExcludeWeaponCategories;

event name CallAbilityMeetsCondition(XComGameState_Ability kAbility, XComGameState_BaseObject kTarget)
{
	local XComGameState_Item SourceWeapon;
	local X2WeaponTemplate WeaponTemplate;
	
	SourceWeapon = kAbility.GetSourceWeapon();
	if (SourceWeapon != none)
	{
		WeaponTemplate = X2WeaponTemplate(SourceWeapon.GetMyTemplate());
		if (IncludeWeaponCategories.Length > 0 && IncludeWeaponCategories.Find(WeaponTemplate.WeaponCat) != INDEX_NONE)
		{
			//`LOG(self.Class.Name @ GetFuncName() @ kAbility.GetMyTemplateName() @ "IncludeWeaponCategories matches" @ WeaponTemplate.WeaponCat,, 'RPG');
			return 'AA_Success';
		}

		if (ExcludeWeaponCategories.Length > 0 && ExcludeWeaponCategories.Find(WeaponTemplate.WeaponCat) != INDEX_NONE)
		{
			//`LOG(self.Class.Name @ GetFuncName() @ kAbility.GetMyTemplateName() @ "ExcludeWeaponCategories matches" @ WeaponTemplate.WeaponCat,, 'RPG');
			return 'AA_WeaponIncompatible';
		}
	}
	else
	{
		//`LOG(self.Class.Name @ GetFuncName() @ kAbility.GetMyTemplateName() @ "no source weapon found",, 'RPG');
	}

	return 'AA_WeaponIncompatible';
}