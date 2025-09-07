class X2Item_SavageStockHeavyWeapons extends X2Item_HeavyWeapons config(GameData_SavitemsWeaponData);

var config WeaponDamageValue PLASMALAUNCHEROVERLAY_BASEDAMAGE;
var config WeaponDamageValue HEAVYAUTOCANNON_BASEDAMAGE;
var config WeaponDamageValue ANTITANK_BASEDAMAGE;
var config WeaponDamageValue HEAVYMICROMISSILES_BASEDAMAGE;

var config int PLASMALAUNCHEROVERLAY_ISOUNDRANGE;
var config int PLASMALAUNCHEROVERLAY_IENVIRONMENTDAMAGE;
var config int PLASMALAUNCHEROVERLAY_ISUPPLIES;
var config int PLASMALAUNCHEROVERLAY_TRADINGPOSTVALUE;
var config int PLASMALAUNCHEROVERLAY_IPOINTS;
var config int PLASMALAUNCHEROVERLAY_ICLIPSIZE;
var config int PLASMALAUNCHEROVERLAY_RANGE;
var config int PLASMALAUNCHEROVERLAY_RADIUS;

var config int HEAVYAUTOCANNON_ISOUNDRANGE;
var config int HEAVYAUTOCANNON_IENVIRONMENTDAMAGE;
var config int HEAVYAUTOCANNON_ICLIPSIZE;
var config array<int> HEAVYAUTOCANNON_RANGE;
var config int HEAVYAUTOCANNON_RADIUS;
var config int HEAVYAUTOCANNON_TRADINGPOSTVALUE;
var config int SUPPLY_COST_HEAVYAUTOCANNON;

var config int ANTITANK_ISOUNDRANGE;
var config int ANTITANK_IENVIRONMENTDAMAGE;
var config int ANTITANK_ICLIPSIZE;
var config int ANTITANK_RANGE;
var config int ANTITANK_RADIUS;
var config int ANTITANK_TRADINGPOSTVALUE;
var config int SUPPLY_COST_ANTITANK;

var config int HEAVYMICROMISSILES_RANGE;
var config int HEAVYMICROMISSILES_AMMO;
var config int HEAVYMICROMISSILES_ISOUNDRANGE;
var config int HEAVYMICROMISSILES_IENVIRONMENTDAMAGE;
var config int HEAVYMICROMISSILES_TPV;
var config int SUPPLY_COST_HEAVYMICROMISSILES;
var config int HEAVYMICROMISSILES_RADIUS;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	Weapons.AddItem(CreatePlasmaLauncherOverlay());
	Weapons.AddItem(CreateSAVHeavyAutocannon());
	Weapons.AddItem(CreateSAVAntiTankCannon());
	Weapons.AddItem(CreateSAVMicroMissiles());
	return Weapons;
}

static function X2WeaponTemplate CreatePlasmaLauncherOverlay()
{
	local X2WeaponTemplate		Template;
	local AltGameArchetypeUse	GameArch;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PlasmaLauncherOverlay');
	Template.WeaponCat = 'heavy';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_PlasmaRocketOverlay";
	Template.EquipSound = "StrategyUI_Heavy_Weapon_Equip";
	Template.WeaponTech = 'conventional';

	Template.BaseDamage = default.PLASMALAUNCHEROVERLAY_BASEDAMAGE;
	Template.iSoundRange = default.PLASMALAUNCHEROVERLAY_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.PLASMALAUNCHEROVERLAY_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.PLASMALAUNCHEROVERLAY_ICLIPSIZE;
	Template.iRange = default.PLASMALAUNCHEROVERLAY_RANGE;
	Template.iRadius = default.PLASMALAUNCHEROVERLAY_RADIUS;
	
	Template.PointsToComplete = default.PLASMALAUNCHEROVERLAY_IPOINTS;
	Template.TradingPostValue = default.PLASMALAUNCHEROVERLAY_TRADINGPOSTVALUE;
	
	Template.InventorySlot = eInvSlot_HeavyWeapon;
	Template.StowedLocation = eSlot_HeavyWeapon;
	Template.GameArchetype = "SAV_Plasma_RocketLauncher.WP_Plasma_RocketLauncher";
	Template.AltGameArchetype = "SAV_Plasma_RocketLauncher.WP_Plasma_RocketLauncher_Powered";
	Template.ArmorTechCatForAltArchetype = 'powered';
	Template.bMergeAmmo = true;
	Template.DamageTypeTemplateName = 'Explosion';
	Template.fCoverage = 15.0f;

	GameArch.UseGameArchetypeFn = SparkHeavyWeaponCheck;
	GameArch.ArchetypeString = "SAV_Plasma_RocketLauncher.WP_Plasma_RocketLauncher_Spark";
	Template.AltGameArchetypeArray.AddItem(GameArch);

	GameArch.UseGameArchetypeFn = BitHeavyWeaponCheck;
	GameArch.ArchetypeString = "SAV_Plasma_RocketLauncher.WP_Plasma_RocketLauncher_Bit";
	Template.AltGameArchetypeArray.AddItem(GameArch);

	Template.Abilities.AddItem('RocketLauncher');
	Template.Abilities.AddItem('SparkRocketLauncher');
	Template.Abilities.AddItem('RocketFuse');

	Template.CreatorTemplateName = 'AdvancedGrenades'; // The schematic which creates this item
	Template.BaseItem = 'RocketLauncher'; // Which item this will be upgraded from
	Template.Requirements.RequiredTechs.AddItem('AdvancedGrenades');

	Template.CanBeBuilt = false;
	Template.StartingItem = false;
	Template.bInfiniteItem = true;
		
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.PLASMALAUNCHEROVERLAY_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.PLASMALAUNCHEROVERLAY_RADIUS);
	
	return Template;
}

static function X2WeaponTemplate CreateSAVHeavyAutocannon()
{
	local X2WeaponTemplate		Template;
	local AltGameArchetypeUse	GameArch;
	local ArtifactCost			Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVHeavyAutocannon');
	Template.WeaponCat = 'heavy';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_HeavyAutocannon";
	Template.EquipSound = "StrategyUI_Heavy_Weapon_Equip";

	Template.BaseDamage = default.HEAVYAUTOCANNON_BASEDAMAGE;
	Template.iSoundRange = default.HEAVYAUTOCANNON_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.HEAVYAUTOCANNON_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.HEAVYAUTOCANNON_ICLIPSIZE;
	Template.RangeAccuracy = default.HEAVYAUTOCANNON_RANGE;
	Template.iRadius = default.HEAVYAUTOCANNON_RADIUS;
	Template.PointsToComplete = 0;
	
	Template.TradingPostValue = default.HEAVYAUTOCANNON_TRADINGPOSTVALUE;
	
	Template.InventorySlot = eInvSlot_HeavyWeapon;
	Template.StowedLocation = eSlot_HeavyWeapon;
	Template.GameArchetype = "SAV_AltHWeps.WP_Heavy_Autocannon_Basic";
	Template.AltGameArchetype = "SAV_AltHWeps.WP_Heavy_Autocannon_Powered";
	Template.ArmorTechCatForAltArchetype = 'powered';
	Template.bMergeAmmo = true;

	GameArch.UseGameArchetypeFn = SparkHeavyWeaponCheck;
	GameArch.ArchetypeString = "SAV_AltHWeps.WP_HeavyAutocannon_Spark";
	Template.AltGameArchetypeArray.AddItem(GameArch);

	GameArch.UseGameArchetypeFn = BitHeavyWeaponCheck;
	GameArch.ArchetypeString = "SAV_AltHWeps.WP_HeavyAutocannon_Bit";
	Template.AltGameArchetypeArray.AddItem(GameArch);

	Template.Abilities.AddItem('SAVHeavyAutocannonShot');
	Template.Abilities.AddItem('SAVHeavyAutocannonShot_BIT');
	
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('AlternativeHeavyWeaponsConcepts');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_HEAVYAUTOCANNON;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2WeaponTemplate CreateSAVAntiTankCannon()
{
	local X2WeaponTemplate		Template;
	local AltGameArchetypeUse	GameArch;
	local ArtifactCost			Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVAntiTankCannon');
	Template.WeaponCat = 'heavy';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_HeavyAntiTankGun";
	Template.EquipSound = "StrategyUI_Heavy_Weapon_Equip";

	Template.BaseDamage = default.ANTITANK_BASEDAMAGE;
	Template.iSoundRange = default.ANTITANK_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.ANTITANK_IENVIRONMENTDAMAGE;
	Template.iClipSize = default.ANTITANK_ICLIPSIZE;
	Template.iRange = default.ANTITANK_RANGE;
	Template.iRadius = default.ANTITANK_RADIUS;
	Template.PointsToComplete = 0;
	
	Template.TradingPostValue = default.ANTITANK_TRADINGPOSTVALUE;
	
	Template.InventorySlot = eInvSlot_HeavyWeapon;
	Template.StowedLocation = eSlot_HeavyWeapon;
	Template.GameArchetype = "SAV_AltHWeps.WP_Heavy_AntiTankRifle_Basic";
	Template.AltGameArchetype = "SAV_AltHWeps.WP_Heavy_AntiTankRifle_Powered";
	Template.ArmorTechCatForAltArchetype = 'powered';
	Template.bMergeAmmo = true;

	GameArch.UseGameArchetypeFn = SparkHeavyWeaponCheck;
	GameArch.ArchetypeString = "SAV_AltHWeps.WP_HeavyAntiTankRifle_Spark";
	Template.AltGameArchetypeArray.AddItem(GameArch);

	GameArch.UseGameArchetypeFn = BitHeavyWeaponCheck;
	GameArch.ArchetypeString = "SAV_AltHWeps.WP_HeavyAntiTankRifle_Bit";
	Template.AltGameArchetypeArray.AddItem(GameArch);

	Template.Abilities.AddItem('SAVAntiTankShot');
	Template.Abilities.AddItem('SAVAntiTankShot_BIT');

	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('AlternativeHeavyWeaponsConcepts');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_ANTITANK;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}


static function X2DataTemplate CreateSAVMicroMissiles()
{
	local X2WeaponTemplate		Template;
	local AltGameArchetypeUse	GameArch;
	local ArtifactCost			Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SAVMicroMissiles');
	
	Template.WeaponCat = 'heavy';
	Template.strImage = "img:///UILibrary_SavageItems.Inv_HeavyMicroMissiles";
	Template.EquipSound = "StrategyUI_Heavy_Weapon_Equip";
	Template.WeaponTech = 'conventional';

	Template.BaseDamage = default.HEAVYMICROMISSILES_BASEDAMAGE;
	Template.iClipSize = default.HEAVYMICROMISSILES_AMMO;
	Template.iSoundRange = default.HEAVYMICROMISSILES_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.HEAVYMICROMISSILES_IENVIRONMENTDAMAGE;
	Template.iPhysicsImpulse = 5;
	Template.TradingPostValue = default.HEAVYMICROMISSILES_TPV;
	Template.iRange = default.HEAVYMICROMISSILES_RANGE;
	Template.iRadius = default.HEAVYMICROMISSILES_RADIUS;

	Template.Abilities.AddItem('SAVHeavyMicroMissileVolley');
	Template.Abilities.AddItem('SAVHeavyMicroMissileVolley_BIT');

	Template.InventorySlot = eInvSlot_HeavyWeapon;
	Template.StowedLocation = eSlot_HeavyWeapon;
	Template.GameArchetype = "SAV_AltHWeps.WP_Heavy_MicroMissiles_Basic";
	Template.AltGameArchetype = "SAV_AltHWeps.WP_Heavy_MicroMissiles_Powered";
	Template.ArmorTechCatForAltArchetype = 'powered';
	Template.bMergeAmmo = true;

	GameArch.UseGameArchetypeFn = SparkHeavyWeaponCheck;
	GameArch.ArchetypeString = "SAV_AltHWeps.WP_HeavyMicroMissiles_Spark";
	Template.AltGameArchetypeArray.AddItem(GameArch);

	GameArch.UseGameArchetypeFn = BitHeavyWeaponCheck;
	GameArch.ArchetypeString = "SAV_AltHWeps.WP_HeavyMicroMissiles_Bit";
	Template.AltGameArchetypeArray.AddItem(GameArch);

	// This controls how much arc this projectile may have and how many times it may bounce
	Template.WeaponPrecomputedPathData.InitialPathTime = 1.5;
	Template.WeaponPrecomputedPathData.MaxPathTime = 2.0;
	Template.WeaponPrecomputedPathData.MaxNumberOfBounces = 0;

	Template.DamageTypeTemplateName = 'Explosion';

	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('AlternativeHeavyWeaponsConcepts');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_HEAVYMICROMISSILES;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function bool SparkHeavyWeaponCheck(XComGameState_Item ItemState, XComGameState_Unit UnitState, string ConsiderArchetype)
{
	switch(UnitState.GetMyTemplateName())
	{
	case 'SparkSoldier':
	case 'LostTowersSpark':
		return true;
	}
	return false;
}

static function bool BitHeavyWeaponCheck(XComGameState_Item ItemState, XComGameState_Unit UnitState, string ConsiderArchetype)
{
	switch(UnitState.GetMyTemplateName())
	{
	case 'SparkBitMk1':
	case 'SparkBitMk2':
	case 'SparkBitMk3':
		return true;
	}
	return false;
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}