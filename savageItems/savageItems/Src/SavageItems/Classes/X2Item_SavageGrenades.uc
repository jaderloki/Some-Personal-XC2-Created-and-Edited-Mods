class X2Item_SavageGrenades extends X2Item config(GameData_SavitemsWeaponData);

var config WeaponDamageValue NANOSHREDDERGRENADE_BASEDAMAGE;

var config int NANOSHREDDERGRENADE_ISOUNDRANGE;
var config int NANOSHREDDERGRENADE_IENVIRONMENTDAMAGE;
var config int NANOSHREDDERGRENADE_ISUPPLIES;
var config int NANOSHREDDERGRENADE_TRADINGPOSTVALUE;
var config int NANOSHREDDERGRENADE_IPOINTS;
var config int NANOSHREDDERGRENADE_ICLIPSIZE;
var config int NANOSHREDDERGRENADE_RANGE;
var config int NANOSHREDDERGRENADE_RADIUS;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Grenades;

	Grenades.AddItem(CreateSAVNanoShredderGrenade());

	return Grenades;
}

static function X2DataTemplate CreateSAVNanoShredderGrenade()
{
	local X2GrenadeTemplate Template;
	local X2Effect_ApplyWeaponDamage WeaponDamageEffect;

	`CREATE_X2TEMPLATE(class'X2GrenadeTemplate', Template, 'SAVNanoShredderGrenade');

	Template.strImage = "img:///UILibrary_SavageItems.Inv_NanoShredder_Grenade";
	Template.EquipSound = "StrategyUI_Grenade_Equip";
	Template.AddAbilityIconOverride('ThrowGrenade', "img:///UILibrary_PerkIcons.UIPerk_grenade_emp");
	Template.AddAbilityIconOverride('LaunchGrenade', "img:///UILibrary_PerkIcons.UIPerk_grenade_emp");

	Template.iRange = default.NANOSHREDDERGRENADE_RANGE;
	Template.iRadius = default.NANOSHREDDERGRENADE_RADIUS;

	Template.BaseDamage = default.NANOSHREDDERGRENADE_BASEDAMAGE;
	Template.iSoundRange = default.NANOSHREDDERGRENADE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.NANOSHREDDERGRENADE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.NANOSHREDDERGRENADE_TRADINGPOSTVALUE;
	Template.PointsToComplete = default.NANOSHREDDERGRENADE_IPOINTS;
	Template.iClipSize = default.NANOSHREDDERGRENADE_ICLIPSIZE;
	Template.Tier = 1;

	Template.Abilities.AddItem('ThrowGrenade');
	Template.Abilities.AddItem('GrenadeFuse');

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = true;
	Template.ThrownGrenadeEffects.AddItem(WeaponDamageEffect);
	Template.ThrownGrenadeEffects.AddItem(class'X2StatusEffects_SAVItems'.static.CreateNanoShredStatusEffect());
	Template.LaunchedGrenadeEffects = Template.ThrownGrenadeEffects;
	
	Template.GameArchetype = "SavNanoWarfare.WP_Grenade_NanoShredder";

	Template.iPhysicsImpulse = 0;

	Template.CanBeBuilt = false;
	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.NANOSHREDDERGRENADE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.NANOSHREDDERGRENADE_RADIUS);

	return Template;
}