class X2StrategyElement_LSFacilityUpgrades extends X2StrategyElement_DefaultFacilityUpgrades config(LivingSpace);

var config int CREW_LIMIT_INCREASE_I;
var config int CREW_LIMIT_INCREASE_II;
var config int CREW_LIMIT_INCREASE_3;
var config int CREW_LIMIT_INCREASE_4;
var config int CREW_LIMIT_INCREASE_5;
var config int CREW_LIMIT_INCREASE_6;
var config int CREW_LIMIT_INCREASE_7;
var config int CREW_LIMIT_INCREASE_8;
var config int CREW_LIMIT_INCREASE_9;
var config int CREW_LIMIT_INCREASE_10;

var config int CrewSizeI_Power;
var config int CrewSizeI_UpkeepCost;
var config StrategyCost CrewSizeI_Cost;

var config int CrewSizeII_Power;
var config int CrewSizeII_UpkeepCost;
var config StrategyCost CrewSizeII_Cost;

var config int CrewSize3_Power;
var config int CrewSize3_UpkeepCost;
var config StrategyCost CrewSize3_Cost;

var config int CrewSize4_Power;
var config int CrewSize4_UpkeepCost;
var config StrategyCost CrewSize4_Cost;

var config int CrewSize5_Power;
var config int CrewSize5_UpkeepCost;
var config StrategyCost CrewSize5_Cost;

var config int CrewSize6_Power;
var config int CrewSize6_UpkeepCost;
var config StrategyCost CrewSize6_Cost;

var config int CrewSize7_Power;
var config int CrewSize7_UpkeepCost;
var config StrategyCost CrewSize7_Cost;

var config int CrewSize8_Power;
var config int CrewSize8_UpkeepCost;
var config StrategyCost CrewSize8_Cost;

var config int CrewSize9_Power;
var config int CrewSize9_UpkeepCost;
var config StrategyCost CrewSize9_Cost;

var config int CrewSize10_Power;
var config int CrewSize10_UpkeepCost;
var config StrategyCost CrewSize10_Cost;

static function array<X2DataTemplate> CreateTemplates ()
{
	local array<X2DataTemplate> Upgrades;

	Upgrades.AddItem(CreateLivingQuarters_CrewSizeI());
	Upgrades.AddItem(CreateLivingQuarters_CrewSizeII());
	Upgrades.AddItem(CreateLivingQuarters_CrewSize3());
	Upgrades.AddItem(CreateLivingQuarters_CrewSize4());
	Upgrades.AddItem(CreateLivingQuarters_CrewSize5());
	Upgrades.AddItem(CreateLivingQuarters_CrewSize6());
	Upgrades.AddItem(CreateLivingQuarters_CrewSize7());
	Upgrades.AddItem(CreateLivingQuarters_CrewSize8());
	Upgrades.AddItem(CreateLivingQuarters_CrewSize9());
	Upgrades.AddItem(CreateLivingQuarters_CrewSize10());
	
	return Upgrades;
}

static function X2DataTemplate CreateLivingQuarters_CrewSizeI ()
{
	local X2FacilityUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2FacilityUpgradeTemplate', Template, 'LivingQuarters_CrewSizeI');
	Template.PointsToComplete = 0;
	Template.MaxBuild = 1;
	Template.strImage = "img:///UILibrary_StrategyImages.FacilityIcons.ChooseFacility_PowerConduitUpgrade";
	Template.OnUpgradeAddedFn = OnUpgradeAdded_IncreaseCrewSizeI;

	Template.iPower = default.CrewSizeI_Power;
	Template.UpkeepCost = default.CrewSizeI_UpkeepCost;
	Template.Cost = default.CrewSizeI_Cost;

	return Template;
}

static function X2DataTemplate CreateLivingQuarters_CrewSizeII ()
{
	local X2FacilityUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2FacilityUpgradeTemplate', Template, 'LivingQuarters_CrewSizeII');
	Template.PointsToComplete = 0;
	Template.MaxBuild = 1;
	Template.strImage = "img:///UILibrary_StrategyImages.FacilityIcons.ChooseFacility_EleriumConduitUpgrade";
	Template.OnUpgradeAddedFn = OnUpgradeAdded_IncreaseCrewSizeII;

	Template.iPower = default.CrewSizeII_Power;
	Template.UpkeepCost = default.CrewSizeII_UpkeepCost;
	Template.Cost = default.CrewSizeII_Cost;

	return Template;
}

static function X2DataTemplate CreateLivingQuarters_CrewSize3 ()
{
	local X2FacilityUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2FacilityUpgradeTemplate', Template, 'LivingQuarters_CrewSize3');
	Template.PointsToComplete = 0;
	Template.MaxBuild = 1;
	Template.strImage = "img:///UILibrary_StrategyImages.FacilityIcons.ChooseFacility_EleriumConduitUpgrade";
	Template.OnUpgradeAddedFn = OnUpgradeAdded_IncreaseCrewSize3;

	Template.iPower = default.CrewSize3_Power;
	Template.UpkeepCost = default.CrewSize3_UpkeepCost;
	Template.Cost = default.CrewSize3_Cost;

	return Template;
}

static function X2DataTemplate CreateLivingQuarters_CrewSize4 ()
{
	local X2FacilityUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2FacilityUpgradeTemplate', Template, 'LivingQuarters_CrewSize4');
	Template.PointsToComplete = 0;
	Template.MaxBuild = 1;
	Template.strImage = "img:///UILibrary_StrategyImages.FacilityIcons.ChooseFacility_EleriumConduitUpgrade";
	Template.OnUpgradeAddedFn = OnUpgradeAdded_IncreaseCrewSize4;

	Template.iPower = default.CrewSize4_Power;
	Template.UpkeepCost = default.CrewSize4_UpkeepCost;
	Template.Cost = default.CrewSize4_Cost;

	return Template;
}

static function X2DataTemplate CreateLivingQuarters_CrewSize5 ()
{
	local X2FacilityUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2FacilityUpgradeTemplate', Template, 'LivingQuarters_CrewSize5');
	Template.PointsToComplete = 0;
	Template.MaxBuild = 1;
	Template.strImage = "img:///UILibrary_StrategyImages.FacilityIcons.ChooseFacility_EleriumConduitUpgrade";
	Template.OnUpgradeAddedFn = OnUpgradeAdded_IncreaseCrewSize5;

	Template.iPower = default.CrewSize5_Power;
	Template.UpkeepCost = default.CrewSize5_UpkeepCost;
	Template.Cost = default.CrewSize5_Cost;

	return Template;
}

static function X2DataTemplate CreateLivingQuarters_CrewSize6 ()
{
	local X2FacilityUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2FacilityUpgradeTemplate', Template, 'LivingQuarters_CrewSize6');
	Template.PointsToComplete = 0;
	Template.MaxBuild = 1;
	Template.strImage = "img:///UILibrary_StrategyImages.FacilityIcons.ChooseFacility_EleriumConduitUpgrade";
	Template.OnUpgradeAddedFn = OnUpgradeAdded_IncreaseCrewSize6;

	Template.iPower = default.CrewSize6_Power;
	Template.UpkeepCost = default.CrewSize6_UpkeepCost;
	Template.Cost = default.CrewSize6_Cost;

	return Template;
}

static function X2DataTemplate CreateLivingQuarters_CrewSize7 ()
{
	local X2FacilityUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2FacilityUpgradeTemplate', Template, 'LivingQuarters_CrewSize7');
	Template.PointsToComplete = 0;
	Template.MaxBuild = 1;
	Template.strImage = "img:///UILibrary_StrategyImages.FacilityIcons.ChooseFacility_EleriumConduitUpgrade";
	Template.OnUpgradeAddedFn = OnUpgradeAdded_IncreaseCrewSize7;

	Template.iPower = default.CrewSize7_Power;
	Template.UpkeepCost = default.CrewSize7_UpkeepCost;
	Template.Cost = default.CrewSize7_Cost;

	return Template;
}

static function X2DataTemplate CreateLivingQuarters_CrewSize8 ()
{
	local X2FacilityUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2FacilityUpgradeTemplate', Template, 'LivingQuarters_CrewSize8');
	Template.PointsToComplete = 0;
	Template.MaxBuild = 1;
	Template.strImage = "img:///UILibrary_StrategyImages.FacilityIcons.ChooseFacility_EleriumConduitUpgrade";
	Template.OnUpgradeAddedFn = OnUpgradeAdded_IncreaseCrewSize8;

	Template.iPower = default.CrewSize8_Power;
	Template.UpkeepCost = default.CrewSize8_UpkeepCost;
	Template.Cost = default.CrewSize8_Cost;

	return Template;
}

static function X2DataTemplate CreateLivingQuarters_CrewSize9 ()
{
	local X2FacilityUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2FacilityUpgradeTemplate', Template, 'LivingQuarters_CrewSize9');
	Template.PointsToComplete = 0;
	Template.MaxBuild = 1;
	Template.strImage = "img:///UILibrary_StrategyImages.FacilityIcons.ChooseFacility_EleriumConduitUpgrade";
	Template.OnUpgradeAddedFn = OnUpgradeAdded_IncreaseCrewSize9;

	Template.iPower = default.CrewSize9_Power;
	Template.UpkeepCost = default.CrewSize9_UpkeepCost;
	Template.Cost = default.CrewSize9_Cost;

	return Template;
}

static function X2DataTemplate CreateLivingQuarters_CrewSize10 ()
{
	local X2FacilityUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2FacilityUpgradeTemplate', Template, 'LivingQuarters_CrewSize10');
	Template.PointsToComplete = 0;
	Template.MaxBuild = 1;
	Template.strImage = "img:///UILibrary_StrategyImages.FacilityIcons.ChooseFacility_EleriumConduitUpgrade";
	Template.OnUpgradeAddedFn = OnUpgradeAdded_IncreaseCrewSize10;

	Template.iPower = default.CrewSize10_Power;
	Template.UpkeepCost = default.CrewSize10_UpkeepCost;
	Template.Cost = default.CrewSize10_Cost;

	return Template;
}

static protected function OnUpgradeAdded_IncreaseCrewSizeI (XComGameState NewGameState, XComGameState_FacilityUpgrade Upgrade, XComGameState_FacilityXCom Facility)
{
	IncreaseCrewSize(NewGameState, default.CREW_LIMIT_INCREASE_I);
}

static protected function OnUpgradeAdded_IncreaseCrewSizeII (XComGameState NewGameState, XComGameState_FacilityUpgrade Upgrade, XComGameState_FacilityXCom Facility)
{
	IncreaseCrewSize(NewGameState, default.CREW_LIMIT_INCREASE_II);
}

static protected function OnUpgradeAdded_IncreaseCrewSize3 (XComGameState NewGameState, XComGameState_FacilityUpgrade Upgrade, XComGameState_FacilityXCom Facility)
{
	IncreaseCrewSize(NewGameState, default.CREW_LIMIT_INCREASE_3);
}

static protected function OnUpgradeAdded_IncreaseCrewSize4 (XComGameState NewGameState, XComGameState_FacilityUpgrade Upgrade, XComGameState_FacilityXCom Facility)
{
	IncreaseCrewSize(NewGameState, default.CREW_LIMIT_INCREASE_4);
}

static protected function OnUpgradeAdded_IncreaseCrewSize5 (XComGameState NewGameState, XComGameState_FacilityUpgrade Upgrade, XComGameState_FacilityXCom Facility)
{
	IncreaseCrewSize(NewGameState, default.CREW_LIMIT_INCREASE_5);
}

static protected function OnUpgradeAdded_IncreaseCrewSize6 (XComGameState NewGameState, XComGameState_FacilityUpgrade Upgrade, XComGameState_FacilityXCom Facility)
{
	IncreaseCrewSize(NewGameState, default.CREW_LIMIT_INCREASE_6);
}

static protected function OnUpgradeAdded_IncreaseCrewSize7 (XComGameState NewGameState, XComGameState_FacilityUpgrade Upgrade, XComGameState_FacilityXCom Facility)
{
	IncreaseCrewSize(NewGameState, default.CREW_LIMIT_INCREASE_7);
}

static protected function OnUpgradeAdded_IncreaseCrewSize8 (XComGameState NewGameState, XComGameState_FacilityUpgrade Upgrade, XComGameState_FacilityXCom Facility)
{
	IncreaseCrewSize(NewGameState, default.CREW_LIMIT_INCREASE_8);
}

static protected function OnUpgradeAdded_IncreaseCrewSize9 (XComGameState NewGameState, XComGameState_FacilityUpgrade Upgrade, XComGameState_FacilityXCom Facility)
{
	IncreaseCrewSize(NewGameState, default.CREW_LIMIT_INCREASE_9);
}

static protected function OnUpgradeAdded_IncreaseCrewSize10 (XComGameState NewGameState, XComGameState_FacilityUpgrade Upgrade, XComGameState_FacilityXCom Facility)
{
	IncreaseCrewSize(NewGameState, default.CREW_LIMIT_INCREASE_10);
}

static protected function IncreaseCrewSize (XComGameState NewGameState, int Amount)
{
	local XComGameState_LivingSpaceData LSData;

	LSData = XComGameState_LivingSpaceData(NewGameState.ModifyStateObject(class'XComGameState_LivingSpaceData', class'XComGameState_LivingSpaceData'.static.GetSingleton().ObjectID));
	LSData.CurrentCrewLimit += Amount;
	
	`XEVENTMGR.TriggerEvent('LS_CrewLimitIncreased',,, NewGameState);
}
