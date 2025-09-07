class X2Item_RaiderBaseItems extends X2Item;

var localized string m_strMaterielReward;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Resources;

	Resources.AddItem(CreateRaiderMaterielTemplate());

	return Resources;
}
static function X2DataTemplate CreateRaiderMaterielTemplate()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'RM_RaiderMateriel');
	
	Template.ItemCat = 'quest';
	Template.CanBeBuilt = false;
	Template.strImage = "img:///UILibrary_StrategyImages.X2StrategyMap.Alert_Resistance_Ops_Appear";
	Template.HideInInventory = true;
	Template.bOneTimeBuild = false;
	Template.OnAcquiredFn = OnRaiderRewardAcquired;

	return Template;
}

static function bool OnRaiderRewardAcquired(XComGameState NewGameState, XComGameState_Item ItemState)
{
	local XComGameStateHistory History;
	local X2StrategyElementTemplateManager StratMgr;
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_MissionSite MissionState;
	local XComGameState_Reward RewardState;
	local XComGameState_WorldRegion RegionState;
	local X2RewardTemplate RewardTemplate;
	local int RewardAmount, i;
	local XGParamTag ParamTag;
	local array<name> ExtraRewards;

	History = `XCOMHISTORY;
	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	MissionState = XComGameState_MissionSite(History.GetGameStateForObjectID(XComHQ.MissionRef.ObjectID));
	ExtraRewards.Length = 0;
	// This resource should only be given during loot after missions, so this should be valid
	if (MissionState != none)
	{
		ExtraRewards.AddItem('Reward_Supplies');
		ExtraRewards.Additem('Reward_Elerium');
		ExtraRewards.Additem('Reward_Alloys');
		
		RegionState = MissionState.GetWorldRegion();
		ParamTag = XGParamTag(`XEXPANDCONTEXT.FindTag("XGParam"));
		
		// Increase region income per civilian rescued
		RewardAmount = ItemState.Quantity * class'X2StrategyElement_XpackRewards'.static.GetRescueCivilianIncomeIncreaseReward();

		RewardTemplate = X2RewardTemplate(StratMgr.FindStrategyElementTemplate('Reward_IncreaseIncome'));
		RewardState = RewardTemplate.CreateInstanceFromTemplate(NewGameState);
		RewardState.GenerateReward(NewGameState, , RegionState.GetReference());
		RewardState.SetReward(, RewardAmount); 
		RewardState.GiveReward(NewGameState);

		ParamTag.StrValue0 = RegionState.GetMyTemplate().DisplayName;
		class'XComGameState_HeadquartersResistance'.static.AddGlobalEffectString(NewGameState, `XEXPAND.ExpandString(class'UIRewardsRecap'.default.m_strIncreasedRegionSupplyOutput), false);
		ParamTag.StrValue0 = string(RewardAmount);
		class'XComGameState_HeadquartersResistance'.static.AddGlobalEffectString(NewGameState, `XEXPAND.ExpandString(class'UIRewardsRecap'.default.m_strIncreasedSupplyIncome), false);

		//choice between elerium, alloys, or even more supplies
		i = `SYNC_RAND_STATIC(ExtraRewards.Length);

		RewardTemplate = X2RewardTemplate(StratMgr.FindStrategyElementTemplate(ExtraRewards[i]));
		RewardState = RewardTemplate.CreateInstanceFromTemplate(NewGameState);
		RewardState.GenerateReward(NewGameState, , RegionState.GetReference());
		RewardState.GiveReward(NewGameState);
		ParamTag.StrValue0 = RewardTemplate.DisplayName;
		class'XComGameState_HeadquartersResistance'.static.AddGlobalEffectString(NewGameState, `XEXPAND.ExpandString(default.m_strMaterielReward), false);

	}
			
	return true;
}
