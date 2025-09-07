class X2Item_SavageStockAmmo extends X2Item config(GameData_SavitemsWeaponData);

var config int IGNITIONROUNDS_CHANCE_PERCENT;

var config int SUPPLY_COST_HIGHCAL;
var config int SUPPLY_COST_HEROUNDS;
var config int SUPPLY_COST_STUNROUNDS;

var config int SAVHICAL_AMMO_TPV;
var config int SAVHE_AMMO_TPV;
var config int SAVSTUN_AMMO_TPV;
var config int AAJ_AMMO_TPV;
var config int AAJDE_AMMO_TPV;
var config int PLASMABURST_AMMO_TPV;
var config int DISRUPTOR_AMMO_TPV;
var config int SMARTSEEKER_AMMO_TPV;
var config int HOTSHOT_AMMO_TPV;

var config int BUTCHER_AMMO_TPV;
var config int BREACHBUSTER_AMMO_TPV;
var config int SKULLSPLITTER_AMMO_TPV;
var config int MILSPEC_AMMO_TPV;
var config int ALIENPOWER_AMMO_TPV;
var config int NANOSHRED_AMMO_TPV;

var config bool HOLLOWPOINT_STARTING;
var config bool HOLLOWPOINT_BUILDABLE;
var config bool HOLLOWPOINT_INFINITE;
var config bool DUMBTRACER_STARTING;
var config bool DUMBTRACER_BUILDABLE;
var config bool DUMBTRACER_INFINITE;
var config bool HIGHVELOCITYAP_STARTING;
var config bool HIGHVELOCITYAP_BUILDABLE;
var config bool HIGHVELOCITYAP_INFINITE;
var config bool IGNITION_STARTING;
var config bool IGNITION_BUILDABLE;
var config bool IGNITION_INFINITE;
var config bool HIGHCAL_STARTING;
var config bool HIGHCAL_BUILDABLE;
var config bool HIGHCAL_INFINITE;
var config bool HIGHEXPLOSIVE_STARTING;
var config bool HIGHEXPLOSIVE_BUILDABLE;
var config bool HIGHEXPLOSIVE_INFINITE;
var config bool SAVSTUN_STARTING;
var config bool SAVSTUN_BUILDABLE;
var config bool SAVSTUN_INFINITE;

var config int SUPPLY_COST_HOLLOWPOINT;
var config int SUPPLY_COST_DUMBTRACER;
var config int SUPPLY_COST_HIGHVELOCITYAP;
var config int SUPPLY_COST_IGNITION;
var config int LOSTCORPSES_IGNITION;
var config int TPV_HOLLOWPOINT;
var config int TPV_DUMBTRACER;
var config int TPV_HIGHVELOCITYAP;
var config int TPV_IGNITION;

//NEW CONFIGS
var config int IGNITIONROUNDS_DAMAGE;//-1

var config int XSTUN_STUNVALUE;//1
var config int XSTUN_STUNCHANCE;//50
var config int XSTUN_DAMAGEMOD;//-1

var config int DISRUPTORROUNDS_DAMAGE;//1

var config int DISRUPTORROUNDS_STUNVALUE;//1
var config int DISRUPTORROUNDS_STUNCHANCE;//80

var config int HOTSHOTROUNDS_DAMAGE;//-1
var config int HOTSHOTROUNDS_BURNING_BASEDAMAGE;//2
var config int HOTSHOTROUNDS_BURNING_DAMAGESPREAD;//1
var config int HOTSHOTROUNDS_ACIDBURN_BASEDAMAGE;//2
var config int HOTSHOTROUNDS_ACIDBURN_DAMAGESPREAD;//1

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Items;

	Items.AddItem(CreateSAVHollowPointRounds());
	Items.AddItem(CreateDumbTracerRounds());
	Items.AddItem(CreateHighVelocityAP());
	Items.AddItem(CreateIgnitionRounds());
	Items.AddItem(CreateHighCalRounds());
	Items.AddItem(CreateExplosiveRounds());	
	Items.AddItem(CreateSavStunRounds());
	Items.AddItem(CreateAAJRounds());
	Items.AddItem(CreateAAJDERounds());
	Items.AddItem(CreatePlasmaBurstRounds());
	Items.AddItem(CreateDisruptorRounds());
	Items.AddItem(CreateSmartSeekerRounds());
	Items.AddItem(CreateHotshotRounds());
	Items.AddItem(CreateSAVButcherRounds());
	Items.AddItem(CreateSAVBreachBusters());
	Items.AddItem(CreateSAVSkullSplitters());
	Items.AddItem(CreateSAVMilspecRounds());
	Items.AddItem(CreateSAVAlienPowerPack());
	Items.AddItem(CreateSAVNanoShredderRounds());

	return Items;
}

static function X2AmmoTemplate CreateSAVHollowPointRounds()
{
	local X2AmmoTemplate Template;
	local ArtifactCost		Resources;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'SAVHollowPointRounds');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_HollowPt_Rounds";
	Template.StartingItem = default.HOLLOWPOINT_STARTING;
	Template.CanBeBuilt = default.HOLLOWPOINT_BUILDABLE;
	Template.bInfiniteItem = default.HOLLOWPOINT_INFINITE;
	Template.TradingPostValue = 0;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('HollowPoint');
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";
	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CriticalChanceBonusLabel, eStat_CritChance, class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HPTAMMO_CRITCHANCE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CriticalDamageLabel, , class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HPTAMMO_CRITDAMAGE);

	Template.TradingPostValue = Default.TPV_HOLLOWPOINT;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_HOLLOWPOINT;
	Template.Cost.ResourceCosts.AddItem(Resources);

	//FX Reference
	Template.GameArchetype = "Sav_Ammo_Assets.PJ_Hollowpt";
	
	return Template;
}

static function X2AmmoTemplate CreateDumbTracerRounds()
{
	local X2AmmoTemplate Template;
	local ArtifactCost		Resources;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'DumbTracerRounds');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_DumbTracer";
	Template.StartingItem = default.DUMBTRACER_STARTING;
	Template.CanBeBuilt = default.DUMBTRACER_BUILDABLE;
	Template.bInfiniteItem = default.DUMBTRACER_INFINITE;
	Template.TradingPostValue = 0;
	Template.PointsToComplete = 0;
	Template.TargetEffects.AddItem(class'X2Ability_SavageStockItemAmmoAbilitySet'.static.DumbTracerDebuffEffect());
	Template.Abilities.AddItem('DumbTracerAim');
	Template.Abilities.AddItem('DumbTracerDebuff');
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";

	Template.SetUIStatMarkup(class'XLocalizedData'.default.AimLabel, eStat_Offense, class'X2Ability_SavageStockItemAmmoAbilitySet'.default.DUMBTRACER_AIM);

	Template.TradingPostValue = Default.TPV_DUMBTRACER;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_DUMBTRACER;
	Template.Cost.ResourceCosts.AddItem(Resources);

	//FX Reference
	Template.GameArchetype = "Sav_Ammo_Assets.PJ_DumbTracer";
	
	return Template;
}

static function X2AmmoTemplate CreateHighVelocityAP()
{
	local X2AmmoTemplate Template;
	local ArtifactCost		Resources;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'HighVelocityAP');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_HVAP_Ammo";
	Template.StartingItem = default.HIGHVELOCITYAP_STARTING;
	Template.CanBeBuilt = default.HIGHVELOCITYAP_BUILDABLE;
	Template.bInfiniteItem = default.HIGHVELOCITYAP_INFINITE;
	Template.TradingPostValue = 0;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('HVAPMod');
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";

	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, eStat_ArmorPiercing, class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HVAP_NOCOVER_AP);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CriticalChanceBonusLabel, eStat_CritChance, class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HVAP_NOCOVER_CRITCHANCE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CriticalDamageLabel, , class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HVAP_NOCOVER_CRITDAM);
	
	Template.TradingPostValue = Default.TPV_HIGHVELOCITYAP;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_HIGHVELOCITYAP;
	Template.Cost.ResourceCosts.AddItem(Resources);

	//FX Reference
	Template.GameArchetype = "Sav_Ammo_Assets.PJ_HVAP";

	return Template;
}

static function X2DataTemplate CreateIgnitionRounds()
{
	local X2AmmoTemplate Template;
	local ArtifactCost		Resources;
	local ArtifactCost Artifacts;
	local WeaponDamageValue DamageValue;
	local X2Effect_Persistent BurningEffect;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'IgnitionRounds');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Ignition_Rounds";
	DamageValue.Damage = default.IGNITIONROUNDS_DAMAGE;
//	DamageValue.DamageType = 'Fire';
	Template.AddAmmoDamageModifier(none, DamageValue);
	Template.StartingItem = default.IGNITION_STARTING;
	Template.CanBeBuilt = default.IGNITION_BUILDABLE;
	Template.bInfiniteItem = default.IGNITION_INFINITE;
	Template.TradingPostValue = 0;
	Template.PointsToComplete = 0;
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";

	BurningEffect = (class'X2StatusEffects'.static.CreateBurningStatusEffect(0,0));
	BurningEffect.ApplyChance = default.IGNITIONROUNDS_CHANCE_PERCENT;
	Template.TargetEffects.AddItem(BurningEffect);

	Template.Requirements.RequiredTechs.AddItem('AutopsyTheLost');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.DamageBonusLabel, , default.IGNITIONROUNDS_DAMAGE);

	Template.TradingPostValue = Default.TPV_IGNITION;

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_IGNITION;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'CorpseTheLost';
	Artifacts.Quantity = default.LOSTCORPSES_IGNITION;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);


	//FX Reference
	Template.GameArchetype = "Sav_Ammo_Assets.PJ_Ignition";

	return Template;
}

static function X2AmmoTemplate CreateHighCalRounds()
{
	local X2AmmoTemplate	Template;
	local ArtifactCost		Resources;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'HighCalRounds');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Hical_Ammo";
	Template.StartingItem = default.HIGHCAL_STARTING;
	Template.CanBeBuilt = default.HIGHCAL_BUILDABLE;
	Template.bInfiniteItem = default.HIGHCAL_INFINITE;
	Template.TradingPostValue = Default.SAVHICAL_AMMO_TPV;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('HiCalRecoil');
	Template.Abilities.AddItem('HighCalDamage');

//	Template.ModClipSize = -1; === This is unreliable so balance is now based around a tougher recoil mallus
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";
	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DamageBonusLabel, , class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HIGHCAL_MEDCALDAM_CV);

	Template.Requirements.RequiredTechs.AddItem('ModularWeapons');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_HIGHCAL;
	Template.Cost.ResourceCosts.AddItem(Resources);

	//FX Reference
	Template.GameArchetype = "Sav_Ammo_Assets.PJ_Hical";
	
	return Template;
}

static function X2AmmoTemplate CreateExplosiveRounds()
{
	local X2AmmoTemplate					Template;
	local ArtifactCost						Resources;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'ExplosiveRounds');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_HEAmmo";
	Template.StartingItem = default.HIGHEXPLOSIVE_STARTING;
	Template.CanBeBuilt = default.HIGHEXPLOSIVE_BUILDABLE;
	Template.bInfiniteItem = default.HIGHEXPLOSIVE_INFINITE;
	Template.TradingPostValue = Default.SAVHE_AMMO_TPV;
	Template.PointsToComplete = 0;
//	Template.ModClipSize = -1; === This is unreliable so balance is now based around loss of crit chance
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";
	Template.Abilities.AddItem('HEAmmoDamageHeavy');
	Template.Abilities.AddItem('HEAmmoDamageLight');

	Template.TargetEffects.AddItem(class'X2Ability_SavageStockItemAmmoAbilitySet'.static.HERuptureEffect());	

	Template.SetUIStatMarkup(class'XLocalizedData'.default.CriticalChanceBonusLabel, eStat_CritChance, class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HEROUNDS_CRITCHANCE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CriticalDamageLabel, , class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HEROUNDS_CRITDAMAGE);

	Template.Requirements.RequiredTechs.AddItem('ModularWeapons');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_HEROUNDS;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Template.GameArchetype = "Sav_Ammo_Assets.PJ_HEAmmo";

	return Template;
}

static function X2AmmoTemplate CreateSavStunRounds()
{
	local X2AmmoTemplate Template;
	local WeaponDamageValue DamageValue;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'SavStunRounds');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SavStun_Ammo";
	Template.StartingItem = default.SAVSTUN_STARTING;
	Template.CanBeBuilt = default.SAVSTUN_BUILDABLE;
	Template.bInfiniteItem = default.SAVSTUN_INFINITE;
	Template.TradingPostValue = Default.SAVSTUN_AMMO_TPV;
	Template.PointsToComplete = 0;
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";
	Template.Abilities.AddItem('SavStunAmoAbility');
	Template.TargetEffects.AddItem(class'X2StatusEffects'.static.CreateDisorientedStatusEffect(, , false));
	Template.TargetEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(default.XSTUN_STUNVALUE, default.XSTUN_STUNCHANCE, false));
	DamageValue.Damage = default.XSTUN_DAMAGEMOD;
	Template.AddAmmoDamageModifier(none, DamageValue);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.DamageBonusLabel, , default.XSTUN_DAMAGEMOD);
	
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventStunLancer');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_STUNROUNDS;
	Template.Cost.ResourceCosts.AddItem(Resources);

	//FX Reference
	Template.GameArchetype = "Sav_Ammo_Assets.PJ_Savstun";
	
	return Template;
}

static function X2AmmoTemplate CreateAAJRounds()
{
	local X2AmmoTemplate Template;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'AAJRounds');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_AAJ_Rounds";
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = Default.AAJ_AMMO_TPV;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('AAJAmmoBonus');
	Template.Abilities.AddItem('CoverPiercing');
	Template.Tier = 1;
	Template.EquipSound = "StrategyUI_Ammo_Equip";

	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, eStat_ArmorPiercing, class'X2Ability_SavageStockItemAmmoAbilitySet'.default.AAJ_AP);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CriticalChanceBonusLabel, eStat_CritChance, class'X2Ability_SavageStockItemAmmoAbilitySet'.default.AAJ_CRITCHANCE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CriticalDamageLabel, , class'X2Ability_SavageStockItemAmmoAbilitySet'.default.AAJ_CRIT);

	//FX Reference
	Template.GameArchetype = "Sav_Ammo_Assets.PJ_AAJ";
	
	return Template;
}

static function X2AmmoTemplate CreateAAJDERounds()
{
	local X2AmmoTemplate Template;
	local WeaponDamageValue DamageValue;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'AAJDERounds');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_AAJDE_Rounds";

	Template.AddAmmoDamageModifier(none, DamageValue);
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = Default.AAJDE_AMMO_TPV;
	Template.PointsToComplete = 0;

	Template.Abilities.AddItem('AAJDEAmmoBonus');
	Template.Abilities.AddItem('CoverPiercing');

	Template.Tier = 1;
	Template.EquipSound = "StrategyUI_Ammo_Equip";

	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, eStat_ArmorPiercing, class'X2Ability_SavageStockItemAmmoAbilitySet'.default.AAJDE_AP);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , class'X2Ability_SavageStockItemAmmoAbilitySet'.default.AAJDE_SHRED);

	//FX Reference
	Template.GameArchetype = "Sav_Ammo_Assets.PJ_AAJDE";
	
	return Template;
}

static function X2AmmoTemplate CreatePlasmaBurstRounds()
{
	local X2AmmoTemplate					Template;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'PlasmaBurstRounds');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_PlasmaBurst_Rounds";
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = Default.PLASMABURST_AMMO_TPV;
	Template.PointsToComplete = 0;
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";
	Template.Abilities.AddItem('PlasmaBurstDamage');

	Template.TargetEffects.AddItem(class'X2Ability_SavageStockItemAmmoAbilitySet'.static.PlasmaBurstEffect());

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , class'X2Ability_SavageStockItemAmmoAbilitySet'.default.PLASMABURSTROUNDS_ALLSHOTS_SHRED);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CriticalChanceBonusLabel, eStat_CritChance, class'X2Ability_SavageStockItemAmmoAbilitySet'.default.PLASMABURSTROUNDS_ALLSHOTS_CRITCHANCE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CriticalDamageLabel, , class'X2Ability_SavageStockItemAmmoAbilitySet'.default.PLASMABURSTROUNDS_ALLSHOTS_CRITDAMAGE);
	
	Template.GameArchetype = "Sav_Ammo_Assets.PJ_PlasmaBurst";

	return Template;
}

static function X2AmmoTemplate CreateDisruptorRounds()
{
	local X2AmmoTemplate					Template;
	local WeaponDamageValue					DamageValue;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'DisruptorRounds');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Disruptor_Rounds";
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = Default.DISRUPTOR_AMMO_TPV;
	Template.PointsToComplete = 0;
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";

	Template.TargetEffects.AddItem(class'X2Ability_SavageStockItemAmmoAbilitySet'.static.DisruptorRoundsMentalDisruptionEffect());	
	Template.TargetEffects.AddItem(class'X2StatusEffects'.static.CreateDisorientedStatusEffect(, , false));
	Template.TargetEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(default.DISRUPTORROUNDS_STUNVALUE, default.DISRUPTORROUNDS_STUNCHANCE, false));
	DamageValue.Damage = default.DISRUPTORROUNDS_DAMAGE;
	Template.AddAmmoDamageModifier(none, DamageValue);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.DamageBonusLabel, , default.DISRUPTORROUNDS_DAMAGE);

	Template.GameArchetype = "Sav_Ammo_Assets.PJ_DisruptorRounds";

	return Template;
}

static function X2AmmoTemplate CreateSmartSeekerRounds()
{
	local X2AmmoTemplate					Template;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'SmartSeekerRounds');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SmartSeeker_Rounds";
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = Default.SMARTSEEKER_AMMO_TPV;
	Template.PointsToComplete = 0;
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";

	Template.Abilities.AddItem('SmartRoundsAutopsy');
	Template.Abilities.AddItem('SmartRoundsTargetMarked');
	Template.Abilities.AddItem('SmartRoundsMarkTargetMarked');
	Template.Abilities.AddItem('SmartRoundsTargetHoloMarked');
	Template.Abilities.AddItem('SmartRoundsTargetScanned');

	Template.GameArchetype = "Sav_Ammo_Assets.PJ_SmartSeeker";

	return Template;
}

static function X2DataTemplate CreateHotshotRounds()
{
	local X2AmmoTemplate				Template;
	local WeaponDamageValue				DamageValue;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'HotshotRounds');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_HotShot_Rounds";
	Template.AddAmmoDamageModifier(none, DamageValue);
	DamageValue.Damage = default.HOTSHOTROUNDS_DAMAGE;
	Template.TargetEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(default.HOTSHOTROUNDS_BURNING_BASEDAMAGE, default.HOTSHOTROUNDS_BURNING_DAMAGESPREAD));
	Template.TargetEffects.AddItem(class'X2StatusEffects'.static.CreateAcidBurningStatusEffect(default.HOTSHOTROUNDS_ACIDBURN_BASEDAMAGE, default.HOTSHOTROUNDS_ACIDBURN_DAMAGESPREAD));
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = Default.HOTSHOT_AMMO_TPV;
	Template.PointsToComplete = 0;
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";

	Template.Abilities.AddItem('SavHotShotBonus');
	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DamageBonusLabel, , default.HOTSHOTROUNDS_DAMAGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.AimLabel, eStat_Offense, class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HOTSHOTROUNDS_ALLSHOTS_AIM);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , class'X2Ability_SavageStockItemAmmoAbilitySet'.default.HOTSHOTROUNDS_ALLSHOTS_SHRED);
	
	//FX Reference
	Template.GameArchetype = "Sav_Ammo_Assets.Hotshot.PJ_Hotshot";

	return Template;
}

static function X2AmmoTemplate CreateSAVButcherRounds()
{
	local X2AmmoTemplate					Template;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'SAVButcherRounds');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SAVButcherRounds";
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = Default.BUTCHER_AMMO_TPV;
	Template.PointsToComplete = 0;
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";
	Template.Abilities.AddItem('SAVButcherRounds');
	Template.Abilities.AddItem('SAVUnreliableRounds');

	Template.GameArchetype = "Sav_Ammo_Assets.PJ_ButcherRounds";

	return Template;
}

static function X2AmmoTemplate CreateSAVBreachBusters()
{
	local X2AmmoTemplate					Template;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'SAVBreachBusters');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SAVBreachBusterRounds";
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = Default.BREACHBUSTER_AMMO_TPV;
	Template.PointsToComplete = 0;
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";
	Template.Abilities.AddItem('SAVBreachBusterRounds');
	Template.Abilities.AddItem('SAVBreachBusted');
	Template.Abilities.AddItem('SAVUnreliableRounds');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.DamageBonusLabel, , class'X2Ability_SavageStockItemAmmoAbilitySet'.default.BREACHBUSTER_ALLPRIMARYWEAPONS_DAMAGE_CV);

	Template.GameArchetype = "Sav_Ammo_Assets.PJ_BreachBreaker";

	return Template;
}

static function X2AmmoTemplate CreateSAVSkullSplitters()
{
	local X2AmmoTemplate					Template;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'SAVSkullSplitters');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SAVSkullSplitterRounds";
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = Default.SKULLSPLITTER_AMMO_TPV;
	Template.PointsToComplete = 0;
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";
	Template.Abilities.AddItem('SAVSkullSplitterRounds');
	Template.Abilities.AddItem('SAVUnreliableRounds');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.CriticalChanceBonusLabel, eStat_CritChance, class'X2Ability_SavageStockItemAmmoAbilitySet'.default.SKULLSPLITTER_PRIMARYWEAPONS_CRITCHANCE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CriticalDamageLabel, , class'X2Ability_SavageStockItemAmmoAbilitySet'.default.SKULLSPLITTER_PRIMARYWEAPONS_CRITDAMAGE);

	Template.GameArchetype = "Ammo_Talon.PJ_Talon";

	return Template;
}

static function X2AmmoTemplate CreateSAVMilspecRounds()
{
	local X2AmmoTemplate					Template;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'SAVMilspecRounds');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SAVMilspecRounds";
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = Default.MILSPEC_AMMO_TPV;
	Template.PointsToComplete = 0;
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";
	Template.Abilities.AddItem('SAVMilspecRounds');

	Template.GameArchetype = "Ammo_AP.PJ_AP";

	return Template;
}

static function X2AmmoTemplate CreateSAVAlienPowerPack()
{
	local X2AmmoTemplate					Template;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'SAVAlienPowerPack');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_SAVAlienPowerPack";
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = Default.ALIENPOWER_AMMO_TPV;
	Template.PointsToComplete = 0;
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";
	Template.Abilities.AddItem('SAVAlienPowerPack');

	Template.GameArchetype = "Sav_Ammo_Assets.PJ_AlienPowerpack";

	return Template;
}

static function X2AmmoTemplate CreateSAVNanoShredderRounds()
{
	local X2AmmoTemplate					Template;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'SAVNanoShredderRounds');
	Template.strImage = "img:///UILibrary_SavageItems.Inv_NanoShredder_Rounds";
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = Default.NANOSHRED_AMMO_TPV;
	Template.PointsToComplete = 0;
	Template.Tier = 0;
	Template.EquipSound = "StrategyUI_Ammo_Equip";
	Template.TargetEffects.AddItem(class'X2StatusEffects_SAVItems'.static.CreateNanoShredStatusEffect());

	Template.GameArchetype = "SavNanoWarfare.PJ_Nanoshredder_Rounds";
	
	return Template;
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}