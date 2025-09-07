// original extends X2StrategyElement
class X2StrategyElement_SavageItemsRewards extends X2StrategyElement_DefaultRewards
	dependson(X2RewardTemplate)
	config(GameData);

var config name	AlienCacheRewardDeck;
var config name	ADVENTCacheRewardDeck;
var config name	ResistanceCacheRewardDeck;
var config name	SAVItemsUtilityRewardDeck;
var config name	AlienTechItemRewardDeck;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Rewards;

	// Proving Grounds MFG Reward Decks
	Rewards.AddItem(CreateAlienCacheReward());
	Rewards.AddItem(CreateADVENTCacheReward());
	Rewards.AddItem(CreateResistanceCacheReward());
	Rewards.AddItem(CreateSAVItemsUtilityReward());
	Rewards.AddItem(CreateSAVItemsAlienTechItemReward());
	return Rewards;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//REWARD DECKS
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
static function X2DataTemplate CreateAlienCacheReward()
{
	local X2RewardTemplate Template;

	`CREATE_X2Reward_TEMPLATE(Template, 'Reward_AlienCache');

	Template.GenerateRewardFn = GenerateAlienCacheReward;
	Template.SetRewardFn = SAVSetItemReward;
	Template.GiveRewardFn = SAVGiveItemReward;
	Template.GetRewardStringFn = SAVGetItemRewardString;
	Template.GetRewardImageFn = SAVGetItemRewardImage;
	Template.GetBlackMarketStringFn = SAVGetItemBlackMarketString;
	Template.GetRewardIconFn = SAVGetGenericRewardIcon;
	Template.RewardPopupFn = SAVItemRewardPopup;

	return Template;
}

static function GenerateAlienCacheReward(XComGameState_Reward RewardState, XComGameState NewGameState, optional float RewardScalar = 1.0, optional StateObjectReference RegionRef)
{	
	SAVGenerateDeckedItemReward(RewardState, NewGameState, default.AlienCacheRewardDeck);
}

//---------------------------------------------------------------------------------------
static function X2DataTemplate CreateADVENTCacheReward()
{
	local X2RewardTemplate Template;

	`CREATE_X2Reward_TEMPLATE(Template, 'Reward_ADVENTCache');

	Template.GenerateRewardFn = GenerateADVENTCacheReward;
	Template.SetRewardFn = SAVSetItemReward;
	Template.GiveRewardFn = SAVGiveItemReward;
	Template.GetRewardStringFn = SAVGetItemRewardString;
	Template.GetRewardImageFn = SAVGetItemRewardImage;
	Template.GetBlackMarketStringFn = SAVGetItemBlackMarketString;
	Template.GetRewardIconFn = SAVGetGenericRewardIcon;
	Template.RewardPopupFn = SAVItemRewardPopup;

	return Template;
}

static function GenerateADVENTCacheReward(XComGameState_Reward RewardState, XComGameState NewGameState, optional float RewardScalar = 1.0, optional StateObjectReference RegionRef)
{	
	SAVGenerateDeckedItemReward(RewardState, NewGameState, default.ADVENTCacheRewardDeck);
}

//---------------------------------------------------------------------------------------
static function X2DataTemplate CreateResistanceCacheReward()
{
	local X2RewardTemplate Template;

	`CREATE_X2Reward_TEMPLATE(Template, 'Reward_ResistanceCache');

	Template.GenerateRewardFn = GenerateResistanceCacheReward;
	Template.SetRewardFn = SAVSetItemReward;
	Template.GiveRewardFn = SAVGiveItemReward;
	Template.GetRewardStringFn = SAVGetItemRewardString;
	Template.GetRewardImageFn = SAVGetItemRewardImage;
	Template.GetBlackMarketStringFn = SAVGetItemBlackMarketString;
	Template.GetRewardIconFn = SAVGetGenericRewardIcon;
	Template.RewardPopupFn = SAVItemRewardPopup;

	return Template;
}

static function GenerateResistanceCacheReward(XComGameState_Reward RewardState, XComGameState NewGameState, optional float RewardScalar = 1.0, optional StateObjectReference RegionRef)
{	
	SAVGenerateDeckedItemReward(RewardState, NewGameState, default.ResistanceCacheRewardDeck);
}

//---------------------------------------------------------------------------------------
static function X2DataTemplate CreateSAVItemsUtilityReward()
{
	local X2RewardTemplate Template;

	`CREATE_X2Reward_TEMPLATE(Template, 'Reward_SAVItemsUtility');

	Template.GenerateRewardFn = GenerateSAVItemsUtilityReward;
	Template.SetRewardFn = SAVSetItemReward;
	Template.GiveRewardFn = SAVGiveItemReward;
	Template.GetRewardStringFn = SAVGetItemRewardString;
	Template.GetRewardImageFn = SAVGetItemRewardImage;
	Template.GetBlackMarketStringFn = SAVGetItemBlackMarketString;
	Template.GetRewardIconFn = SAVGetGenericRewardIcon;
	Template.RewardPopupFn = SAVItemRewardPopup;

	return Template;
}

static function GenerateSAVItemsUtilityReward(XComGameState_Reward RewardState, XComGameState NewGameState, optional float RewardScalar = 1.0, optional StateObjectReference RegionRef)
{	
	SAVGenerateDeckedItemReward(RewardState, NewGameState, default.SAVItemsUtilityRewardDeck);
}

static function X2DataTemplate CreateSAVItemsAlienTechItemReward()
{
	local X2RewardTemplate Template;

	`CREATE_X2Reward_TEMPLATE(Template, 'Reward_SAVItemsAlienTechItem');

	Template.GenerateRewardFn = GenerateSAVItemsAlienTechItemReward;
	Template.SetRewardFn = SAVSetItemReward;
	Template.GiveRewardFn = SAVGiveItemReward;
	Template.GetRewardStringFn = SAVGetItemRewardString;
	Template.GetRewardImageFn = SAVGetItemRewardImage;
	Template.GetBlackMarketStringFn = SAVGetItemBlackMarketString;
	Template.GetRewardIconFn = SAVGetGenericRewardIcon;
	Template.RewardPopupFn = SAVItemRewardPopup;

	return Template;
}

static function GenerateSAVItemsAlienTechItemReward(XComGameState_Reward RewardState, XComGameState NewGameState, optional float RewardScalar = 1.0, optional StateObjectReference RegionRef)
{	
	SAVGenerateDeckedItemReward(RewardState, NewGameState, default.AlienTechItemRewardDeck);
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//HELPER FUNCTIONS
static function SAVItemRewardPopup(XComGameState_Reward RewardState)
{
	local XComGameState_Item ItemState;

	ItemState = XComGameState_Item(`XCOMHISTORY.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));
	if (ItemState != none)
	{
		`HQPRES.UIItemReceived(ItemState.GetMyTemplate());
	}
}

static function string SAVGetItemBlackMarketString(XComGameState_Reward RewardState)
{
	local XComGameState_Item ItemState;
	local XComGameStateHistory History;
	local String BMText;

	History = `XCOMHISTORY;
	ItemState = XComGameState_Item(History.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));

	BMText = ItemState.GetMyTemplate().GetItemBlackMarketText();
	if( BMText != "" )
	{
		return BMText;
	}

	return default.GenericItemBlackMarketText[`SYNC_RAND_STATIC(default.GenericItemBlackMarketText.Length)];
}

static function SAVGenerateDeckedItemReward(XComGameState_Reward RewardState, XComGameState NewGameState, name RewardDeckName)
{	
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_Tech TechState;
	local XComGameState_Item ItemState;
	local X2ItemTemplateManager ItemTemplateManager;
	local X2ItemTemplate ItemTemplate;
	local X2CardManager CardManager;
	local string RewardName;

	CardManager = class'X2CardManager'.static.GetCardManager();
	CardManager.SelectNextCardFromDeck(RewardDeckName, RewardName);

	// Safety check in case the deck doesn't exist
	if (RewardName == "")
	{
		History = `XCOMHISTORY;
		foreach History.IterateByClassType(class'XComGameState_Tech', TechState)
		{
			if (TechState.GetMyTemplate().RewardDeck == RewardDeckName)
			{
				TechState.SetUpTechRewardDeck(TechState.GetMyTemplate());
				CardManager.SelectNextCardFromDeck(TechState.GetMyTemplate().RewardDeck, RewardName);
				break;
			}
		}
	}

	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	ItemTemplate = ItemTemplateManager.FindItemTemplate(name(RewardName));

	// Find the highest available upgraded version of the item
	XComHQ = class'UIUtilities_Strategy'.static.GetXComHQ();
	XComHQ.UpdateItemTemplateToHighestAvailableUpgrade(ItemTemplate);

	ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
	RewardState.RewardObjectReference = ItemState.GetReference();
}

static function SAVSetItemReward(XComGameState_Reward RewardState, optional StateObjectReference RewardObjectRef, optional int Amount)
{
	RewardState.RewardObjectReference = RewardObjectRef;
}

static function SAVGiveItemReward(XComGameState NewGameState, XComGameState_Reward RewardState, optional StateObjectReference AuxRef, optional bool bOrder = false, optional int OrderHours = -1)
{
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_Item ItemState;
	local XComGameStateHistory History;
	local bool bXComHQGameStateCreated;

	History = `XCOMHISTORY;

	foreach NewGameState.IterateByClassType(class'XComGameState_HeadquartersXCom', XComHQ)
	{
		break;
	}

	if (XComHQ == none)
	{
		XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
		bXComHQGameStateCreated = true;
	}
	
	ItemState = XComGameState_Item(History.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));

	if(!XComHQ.PutItemInInventory(NewGameState, ItemState))
	{
		if (bXComHQGameStateCreated) // Only delete the XComHQ game state if it was created by this function
		{
			NewGameState.PurgeGameStateForObjectID(XComHQ.ObjectID);
		}
	}
}

static function string SAVGetItemRewardString(XComGameState_Reward RewardState)
{
	local XComGameStateHistory History;
	local XComGameState_Item ItemState;

	History = `XCOMHISTORY;
	ItemState = XComGameState_Item(History.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));

	if(ItemState != none)
	{
		return string(ItemState.Quantity) @ (ItemState.Quantity == 1 ? ItemState.GetMyTemplate().GetItemFriendlyName() : ItemState.GetMyTemplate().GetItemFriendlyNamePlural());
	}

	return "";
}

static function string SAVGetItemRewardImage(XComGameState_Reward RewardState)
{
	local XComGameStateHistory History;
	local XComGameState_Item ItemState;

	History = `XCOMHISTORY;
	ItemState = XComGameState_Item(History.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));

	if (ItemState != none)
	{
		return ItemState.GetMyTemplate().strImage;
	}

	return "";
}

//---------------------------------------------------------------------------------------
static function string SAVGetGenericRewardIcon(XComGameState_Reward RewardState)
{
	local XComGameState_Tech TechState;
	local XComGameState_Unit UnitState;
	local StateObjectReference EmptyRef;
	local XComGameStateHistory History;
	local XComGameState_Item ItemState;

	History = `XCOMHISTORY;

	if(RewardState.RewardObjectReference != EmptyRef)
	{
		UnitState = XComGameState_Unit(History.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));

		if(UnitState != none)
		{
			if( UnitState.IsEngineer() )  	
				return class'UIUtilities_Image'.const.AlertIcon_Engineering;
			else if( UnitState.IsScientist() )  	
				return class'UIUtilities_Image'.const.AlertIcon_Science;
			else
				return class'UIUtilities_Image'.const.EventQueue_Staff;
		}

		TechState = XComGameState_Tech(History.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));

		if(TechState == none)
		{
			return class'UIUtilities_Image'.const.AlertIcon_Science;
		}
		
		ItemState = XComGameState_Item(History.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));

		if (ItemState != none)
		{
			return ItemState.GetMyTemplate().strImage;
		}
	}
	return "";
}