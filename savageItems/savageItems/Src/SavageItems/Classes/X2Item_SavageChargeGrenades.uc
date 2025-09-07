class X2Item_SavageChargeGrenades extends X2Item config(GameData_SavitemsWeaponData);

var config WeaponDamageValue HECHARGE_BASEDAMAGE;
var config WeaponDamageValue PLASMACHARGE_BASEDAMAGE;
var config WeaponDamageValue INCENDIARYCHARGE_BASEDAMAGE;
var config WeaponDamageValue TOXINCHARGE_BASEDAMAGE;
var config WeaponDamageValue KRAKCHARGE_BASEDAMAGE;
var config WeaponDamageValue IMPLOSIONCHARGE_BASEDAMAGE;

var config int HECHARGE_ISOUNDRANGE;
var config int HECHARGE_IENVIRONMENTDAMAGE;
var config int HECHARGE_TRADINGPOSTVALUE;
var config int HECHARGE_IPOINTS;
var config int HECHARGE_ICLIPSIZE;
var config int HECHARGE_RANGE;
var config int HECHARGE_RADIUS;
var config int HECHARGE_SUPPLIES;

var config int PLASMACHARGE_ISOUNDRANGE;
var config int PLASMACHARGE_IENVIRONMENTDAMAGE;
var config int PLASMACHARGE_TRADINGPOSTVALUE;
var config int PLASMACHARGE_IPOINTS;
var config int PLASMACHARGE_ICLIPSIZE;
var config int PLASMACHARGE_RANGE;
var config int PLASMACHARGE_RADIUS;
var config int PLASMACHARGE_SUPPLIES;
var config int PLASMACHARGE_ECORE;

var config int INCENDIARYCHARGE_ISOUNDRANGE;
var config int INCENDIARYCHARGE_IENVIRONMENTDAMAGE;
var config int INCENDIARYCHARGE_TRADINGPOSTVALUE;
var config int INCENDIARYCHARGE_IPOINTS;
var config int INCENDIARYCHARGE_ICLIPSIZE;
var config int INCENDIARYCHARGE_RANGE;
var config int INCENDIARYCHARGE_RADIUS;

var config int TOXINCHARGE_ISOUNDRANGE;
var config int TOXINCHARGE_IENVIRONMENTDAMAGE;
var config int TOXINCHARGE_TRADINGPOSTVALUE;
var config int TOXINCHARGE_IPOINTS;
var config int TOXINCHARGE_ICLIPSIZE;
var config int TOXINCHARGE_RANGE;
var config int TOXINCHARGE_RADIUS;

var config int KRAKCHARGE_ISOUNDRANGE;
var config int KRAKCHARGE_IENVIRONMENTDAMAGE;
var config int KRAKCHARGE_TRADINGPOSTVALUE;
var config int KRAKCHARGE_IPOINTS;
var config int KRAKCHARGE_ICLIPSIZE;
var config int KRAKCHARGE_RANGE;
var config int KRAKCHARGE_RADIUS;

var config int IMPLOSIONCHARGE_ISOUNDRANGE;
var config int IMPLOSIONCHARGE_IENVIRONMENTDAMAGE;
var config int IMPLOSIONCHARGE_ISUPPLIES;
var config int IMPLOSIONCHARGE_TRADINGPOSTVALUE;
var config int IMPLOSIONCHARGE_IPOINTS;
var config int IMPLOSIONCHARGE_ICLIPSIZE;
var config int IMPLOSIONCHARGE_RANGE;
var config int IMPLOSIONCHARGE_RADIUS;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Grenades;

	Grenades.AddItem(CreateHECharge());
	Grenades.AddItem(CreatePlasmaCharge());
	Grenades.AddItem(CreateIncendaryCharge());
	Grenades.AddItem(CreateToxinCharge());
	Grenades.AddItem(CreateKrakCharge());
	Grenades.AddItem(CreateImplosionCharge());
	
	return Grenades;
}

static function X2DataTemplate CreateHECharge()
{
	local X2GrenadeTemplate				Template;
	local X2Effect_ApplyWeaponDamage	WeaponDamageEffect;
	local X2Effect_Knockback			KnockbackEffect;
	local ArtifactCost 					Resources;

	`CREATE_X2TEMPLATE(class'X2GrenadeTemplate', Template, 'HECharge');

	Template.WeaponCat = 'grenade';
	Template.ItemCat = 'utility';

	Template.strImage = "img:///UILibrary_SavageItems.Inv_HE_Charge";
	Template.EquipSound = "StrategyUI_Grenade_Equip";
	Template.iRange = default.HECHARGE_RANGE;
	Template.iRadius = default.HECHARGE_RADIUS;

	Template.BaseDamage = default.HECHARGE_BASEDAMAGE;
	Template.iSoundRange = default.HECHARGE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.HECHARGE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.HECHARGE_TRADINGPOSTVALUE;
	Template.iClipSize = default.HECHARGE_ICLIPSIZE;
	Template.DamageTypeTemplateName = 'Explosion';
	Template.Tier = 0;

	Template.Abilities.AddItem('ThrowExplosiveCharge');
	Template.Abilities.AddItem('GrenadeFuse');

	Template.GameArchetype = "Sav_Charges.WP_HECharge";

	Template.iPhysicsImpulse = 16;

	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = true;
	Template.ThrownGrenadeEffects.AddItem(WeaponDamageEffect);

	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.KnockbackDistance = 5;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.HECHARGE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.HECHARGE_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.HECHARGE_BASEDAMAGE.Shred);

	Template.HideIfResearched = 'PlasmaGrenade';

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.HECHARGE_SUPPLIES;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Template.bShouldCreateDifficultyVariants = true;	
	
	return Template;
}

static function X2DataTemplate CreatePlasmaCharge()
{
	local X2GrenadeTemplate				Template;
	local X2Effect_ApplyWeaponDamage	WeaponDamageEffect;
	local X2Effect_Knockback			KnockbackEffect;
	local ArtifactCost 					Resources;
	local ArtifactCost					Artifacts;

	`CREATE_X2TEMPLATE(class'X2GrenadeTemplate', Template, 'PlasmaCharge');

	Template.WeaponCat = 'grenade';
	Template.ItemCat = 'utility';

	Template.strImage = "img:///UILibrary_SavageItems.Inv_Plasma_Charge";
	Template.EquipSound = "StrategyUI_Grenade_Equip";
	Template.iRange = default.PLASMACHARGE_RANGE;
	Template.iRadius = default.PLASMACHARGE_RADIUS;

	Template.BaseDamage = default.PLASMACHARGE_BASEDAMAGE;
	Template.iSoundRange = default.PLASMACHARGE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.PLASMACHARGE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.PLASMACHARGE_TRADINGPOSTVALUE;
	Template.iClipSize = default.PLASMACHARGE_ICLIPSIZE;
	Template.DamageTypeTemplateName = 'Explosion';
	Template.Tier = 2;

	Template.Abilities.AddItem('ThrowExplosiveCharge');
	Template.Abilities.AddItem('GrenadeFuse');

	Template.GameArchetype = "Sav_Charges.WP_PlasmaCharge";

	Template.iPhysicsImpulse = 20;

	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = true;
	Template.ThrownGrenadeEffects.AddItem(WeaponDamageEffect);

	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.KnockbackDistance = 7;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.PLASMACHARGE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.PLASMACHARGE_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.PLASMACHARGE_BASEDAMAGE.Shred);

	Template.CreatorTemplateName = 'PlasmaGrenade'; // The schematic which creates this item
	Template.BaseItem = 'HECharge'; // Which item this will be upgraded from
	Template.Requirements.RequiredTechs.AddItem('PlasmaGrenade');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.PLASMACHARGE_SUPPLIES;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.PLASMACHARGE_ECORE;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Template.bShouldCreateDifficultyVariants = true;	
	
	return Template;
}

static function X2DataTemplate CreateIncendaryCharge()
{
	local X2GrenadeTemplate Template;
	local X2Effect_ApplyWeaponDamage WeaponDamageEffect;

	`CREATE_X2TEMPLATE(class'X2GrenadeTemplate', Template, 'IncendaryCharge');

	Template.WeaponCat = 'grenade';
	Template.ItemCat = 'utility';

	Template.strImage = "img:///UILibrary_SavageItems.Inv_IncendiaryCharge";
	Template.EquipSound = "StrategyUI_Grenade_Equip";
	Template.AddAbilityIconOverride('ThrowExplosiveCharge', "img:///UILibrary_PerkIcons.UIPerk_grenade_firebomb");
	
	Template.iRange = default.INCENDIARYCHARGE_RANGE;
	Template.iRadius = default.INCENDIARYCHARGE_RADIUS;
	Template.fCoverage = 70;

	Template.BaseDamage = default.INCENDIARYCHARGE_BASEDAMAGE;
	Template.iSoundRange = default.INCENDIARYCHARGE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.INCENDIARYCHARGE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.INCENDIARYCHARGE_TRADINGPOSTVALUE;
	Template.PointsToComplete = default.INCENDIARYCHARGE_IPOINTS;
	Template.iClipSize = default.INCENDIARYCHARGE_ICLIPSIZE;
	Template.Tier = 2;

	Template.Abilities.AddItem('ThrowExplosiveCharge');
	Template.Abilities.AddItem('GrenadeFuse');

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = true;
	Template.ThrownGrenadeEffects.AddItem(WeaponDamageEffect);
	Template.ThrownGrenadeEffects.AddItem(new class'X2Effect_ApplyFireToWorld');
	Template.ThrownGrenadeEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(3, 2));
	
	Template.GameArchetype = "Sav_Charges.WP_Fire_Charge";

	Template.iPhysicsImpulse = 10;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.INCENDIARYCHARGE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.INCENDIARYCHARGE_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.INCENDIARYCHARGE_BASEDAMAGE.Shred);

//	Template.RewardDecks.AddItem('AdvancedExplosiveChargeRewards');

	return Template;
}

static function X2DataTemplate CreateToxinCharge()
{
	local X2GrenadeTemplate				Template;
	local X2Effect_ApplyPoisonToWorld	WeaponEffect;
	local X2Effect_ApplyWeaponDamage	WeaponDamageEffect;

	`CREATE_X2TEMPLATE(class'X2GrenadeTemplate', Template, 'ToxinCharge');

	Template.WeaponCat = 'grenade';
	Template.ItemCat = 'utility';

	Template.strImage = "img:///UILibrary_SavageItems.Inv_ToxinCharge";
	Template.EquipSound = "StrategyUI_Grenade_Equip";
	Template.AddAbilityIconOverride('ThrowExplosiveCharge', "img:///UILibrary_PerkIcons.UIPerk_grenade_gas");
	Template.iRange = default.TOXINCHARGE_RANGE;
	Template.iRadius = default.TOXINCHARGE_RADIUS;

	Template.BaseDamage = default.TOXINCHARGE_BASEDAMAGE;
	Template.iSoundRange = default.TOXINCHARGE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.TOXINCHARGE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.TOXINCHARGE_TRADINGPOSTVALUE;
	Template.PointsToComplete = default.TOXINCHARGE_IPOINTS;
	Template.iClipSize = default.TOXINCHARGE_ICLIPSIZE;
	Template.Tier = 2;

	Template.Abilities.AddItem('ThrowExplosiveCharge');
	Template.Abilities.AddItem('GrenadeFuse');
	
	WeaponEffect = new class'X2Effect_ApplyPoisonToWorld';
	Template.ThrownGrenadeEffects.AddItem(WeaponEffect);
	Template.ThrownGrenadeEffects.AddItem(class'X2StatusEffects'.static.CreatePoisonedStatusEffect());
	// immediate damage
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = true;
	Template.ThrownGrenadeEffects.AddItem(WeaponDamageEffect);

	Template.GameArchetype = "Sav_Charges.WP_ToxinCharge";

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.TOXINCHARGE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.TOXINCHARGE_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.TOXINCHARGE_BASEDAMAGE.Shred);

//	Template.RewardDecks.AddItem('AdvancedExplosiveChargeRewards');

	return Template;
}

static function X2DataTemplate CreateKrakCharge()
{
	local X2GrenadeTemplate				Template;
	local X2Effect_ApplyWeaponDamage	WeaponDamageEffect;
	local X2Effect_Knockback			KnockbackEffect;

	`CREATE_X2TEMPLATE(class'X2GrenadeTemplate', Template, 'KrakCharge');

	Template.WeaponCat = 'grenade';
	Template.ItemCat = 'utility';

	Template.strImage = "img:///UILibrary_SavageItems.Inv_Krak_Charge";
	Template.EquipSound = "StrategyUI_Grenade_Equip";
	Template.iRange = default.KRAKCHARGE_RANGE;
	Template.iRadius = default.KRAKCHARGE_RADIUS;

	Template.BaseDamage = default.KRAKCHARGE_BASEDAMAGE;
	Template.iSoundRange = default.KRAKCHARGE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.KRAKCHARGE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.KRAKCHARGE_TRADINGPOSTVALUE;
	Template.iClipSize = default.KRAKCHARGE_ICLIPSIZE;
	Template.DamageTypeTemplateName = 'Explosion';
	Template.Tier = 2;

	Template.Abilities.AddItem('ThrowExplosiveCharge');
	Template.Abilities.AddItem('GrenadeFuse');

	Template.GameArchetype = "Sav_Charges.WP_KrakCharge";

	Template.iPhysicsImpulse = 20;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = true;
	Template.ThrownGrenadeEffects.AddItem(WeaponDamageEffect);


	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.KnockbackDistance = 6;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.KRAKCHARGE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.KRAKCHARGE_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.KRAKCHARGE_BASEDAMAGE.Shred);

//	Template.RewardDecks.AddItem('AdvancedExplosiveChargeRewards');
	
	return Template;
}

static function X2DataTemplate CreateImplosionCharge()
{
	local X2GrenadeTemplate			 Template;
	local X2Effect_ApplyWeaponDamage WeaponDamageEffect;
	local X2Condition_UnitType		 UnitTypeCondition;
	local X2Effect_Persistent		 LureEffect;
	local X2Effect_AlertTheLost		 LostActivateEffect;

	`CREATE_X2TEMPLATE(class'X2GrenadeTemplate', Template, 'ImplosionCharge');

	Template.WeaponCat = 'grenade';
	Template.ItemCat = 'utility';

	Template.strImage = "img:///UILibrary_SavageItems.Inv_ImplosionCharge";
	Template.EquipSound = "StrategyUI_Grenade_Equip";
//	Template.AddAbilityIconOverride('ThrowExplosiveCharge', "img:///UILibrary_PerkIcons.UIPerk_grenade_flash");

	Template.iRange = default.IMPLOSIONCHARGE_RANGE;
	Template.iRadius = default.IMPLOSIONCHARGE_RADIUS;

	Template.BaseDamage = default.IMPLOSIONCHARGE_BASEDAMAGE;
	Template.iSoundRange = default.IMPLOSIONCHARGE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.IMPLOSIONCHARGE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.IMPLOSIONCHARGE_TRADINGPOSTVALUE;
	Template.iClipSize = default.IMPLOSIONCHARGE_ICLIPSIZE;
	Template.DamageTypeTemplateName = 'Explosion';
	Template.Tier = 2;
	
	Template.bFriendlyFire = true;
	Template.bFriendlyFireWarning = true;
	Template.Abilities.AddItem('ThrowExplosiveCharge');
	Template.Abilities.AddItem('GrenadeFuse');

	Template.ThrownGrenadeEffects.AddItem(class'X2StatusEffects'.static.CreateDisorientedStatusEffect(, , false));
	Template.ThrownGrenadeEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(1,75));

	//We need to have an ApplyWeaponDamage for visualization, even if the grenade does 0 damage (makes the unit flinch, shows overwatch removal)
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = true;
	WeaponDamageEffect.DamageTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.DisorientDamageType); // Added to allow 'immune' flyover on TheLost<apc> 
	Template.ThrownGrenadeEffects.AddItem(WeaponDamageEffect);

	Template.GameArchetype = "Sav_Charges.WP_ImplosionCharge";

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	
	Template.bShouldCreateDifficultyVariants = true;	

	// Apply an effect on all non-lost units in the grenade range, to paint as targets.
	UnitTypeCondition = new class'X2Condition_UnitType';
	UnitTypeCondition.ExcludeTypes.AddItem('TheLost');
	LureEffect = class'X2StatusEffects'.static.CreateUltrasonicLureTargetStatusEffect();
	LureEffect.TargetConditions.AddItem(UnitTypeCondition);
	Template.ThrownGrenadeEffects.AddItem(LureEffect);

	// Apply an effect on all lost units within sight range, to activate inactive lost groups.
	LostActivateEffect = new class'X2Effect_AlertTheLost';
	Template.ThrownGrenadeEffects.AddItem(LostActivateEffect);

	// Soldier Bark
	Template.OnThrowBarkSoundCue = 'ThrowFlashbang';

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.IMPLOSIONCHARGE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.IMPLOSIONCHARGE_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.IMPLOSIONCHARGE_BASEDAMAGE.Shred);

//	Template.RewardDecks.AddItem('AdvancedExplosiveChargeRewards');

	return Template;
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}