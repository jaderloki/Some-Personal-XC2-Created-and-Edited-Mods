class SAVStockBlackMarket extends UIScreenListener	config(SavageStockItems);
//Ripped from TheGrimSqueeker72's pre WOTC "Buy Corpses From The Black Market" mod Though I havn't figured it out yet.
/*
var config int BMITEMCOST;

function UpdateBlackMarket(array<X2ItemTemplate> SAVBMItems)
{
	local XComGameState NewGameState;
	local X2StrategyElementTemplateManager StratMgr;
	local X2RewardTemplate RewardTemplate;
	local XComGameState_Reward RewardState;
	local XComGameState_Item ItemState;
	local XComGameState_BlackMarket BlackMarket, UpdatedBlackMarket;
	local Commodity ForSaleItem;
	local ArtifactCost ResourceCost;
	local array<name> SAVBMItemsArray;

	SAVBMItemsArray.AddItem('SavCOREBar');

	BlackMarket = class'UIUtilities_Strategy'.static.GetBlackMarket();
	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

	// Reward_AlienCorpse doesn't get created for some reason
	// and anyway it turns out Reward_Item already does what I need without any changes
	RewardTemplate = X2RewardTemplate(StratMgr.FindStrategyElementTemplate('Reward_Item'));

	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Savage item to black market");
	ItemState = SAVBMItemsArray[`SYNC_RAND(SAVBMItems.length)].CreateInstanceFromTemplate(NewGameState);
	RewardState = RewardTemplate.CreateInstanceFromTemplate(NewGameState);
	RewardState.SetReward(ItemState.GetReference());

	NewGameState.AddStateObject(ItemState);
	NewGameState.AddStateObject(RewardState);


	ForSaleItem.RewardRef = RewardState.GetReference();

	ResourceCost.ItemTemplateName = 'Intel';
	ResourceCost.Quantity = BMITEMCOST;
	ForSaleItem.Cost.ResourceCosts.AddItem(ResourceCost);

	ForSaleItem.Title = RewardState.GetRewardString();
	ForSaleItem.Desc = RewardState.GetBlackMarketString();
	ForSaleItem.Image = RewardState.GetRewardImage();
	ForSaleItem.CostScalars = BlackMarket.GoodsCostScalars;
	ForSaleItem.DiscountPercent = BlackMarket.GoodsCostPercentDiscount;

	UpdatedBlackMarket = XComGameState_BlackMarket(NewGameState.CreateStateObject(class'XComGameState_BlackMarket', BlackMarket.ObjectID));
	UpdatedBlackMarket.ForSaleItems.AddItem(ForSaleItem);

	NewGameState.AddStateObject(UpdatedBlackMarket);

	`XCOMHISTORY.AddGameStateToHistory(NewGameState);
}

// called when the black market resets
defaultproperties
{
	ScreenClass = UIResistanceReport;
}
*/