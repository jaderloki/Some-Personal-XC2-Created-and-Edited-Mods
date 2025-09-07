class X2StrategyElement_RaiderCovertActions extends X2StrategyElement_DefaultCovertActions;

// purpose: adds in covert actions for both discovering a raider base's location, and unlocking the mission to destroy it
// will have likely limitation of only being able to do one base chain at a time

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> CovertActions;
	local RaiderBaseDef baseDef;

	foreach class'X2Helpers_RM_Raiderbases'.default.BaseDefinitions (baseDef)
	{
		
		CovertActions.AddItem(CreateFindRaiderBase());
		CovertActions.AddItem(CreateRaiderBaseAction()); // for now: I'm making this a lengthy covert action to "break up" the pace of covert actions in between doing chosen stuff
			
		// covert operations
		// data retrieval
		CovertActions.AddItem(CreateDataRetrieval());
	}
	return CovertActions;
}

//---------------------------------------------------------------------------------------
// DATA RETRIEVAL COVERT OP
//---------------------------------------------------------------------------------------
static function X2DataTemplate CreateDataRetrieval()
{
	local X2CovertActionTemplate Template;

	`CREATE_X2TEMPLATE(class'X2CovertActionTemplate', Template, 'CovertAction_RaiderDataRetrieval' );

	Template.ChooseLocationFn = ChooseRaiderBaseLocation;
	Template.OverworldMeshPath = "UI_3D.Overwold_Final.CovertAction";
	Template.OnStartedFn = OnDataRetrievalStarted;
	Template.RequiredFactionInfluence = eFactionInfluence_Respected;
	Template.bUseRewardImage = false;
	Template.bDisplayIgnoresInfluence = true;

	Template.Narratives.AddItem('CovertActionNarrative_RaiderDataRetrieval');

	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot', 1)); //must not be a rookie


	//Template.Risks.AddItem('CovertActionRisk_SoldierWounded');
	Template.Risks.AddItem('CovertActionRisk_RaiderAmbush');
	//Template.Risks.AddItem('CovertActionRisk_SoldierCaptured');

	Template.Rewards.AddItem('Reward_Intel'); 
	Template.Rewards.AddItem('Reward_Intel');
	Template.Rewards.AddItem('Reward_Supplies');
	Template.Rewards.AddItem('Reward_Supplies');
	return Template;
}


function OnDataRetrievalStarted(XComGameState NewGameState, XComGameState_CovertAction ActionState)
{
	ActionState.ActivateRisks(); // always activate even if the tutorial is active
}

//---------------------------------------------------------------------------------------
// REVEAL RAIDER BASE
//---------------------------------------------------------------------------------------
static function X2DataTemplate CreateFindRaiderBase()
{
	local X2CovertActionTemplate Template;

	`CREATE_X2TEMPLATE(class'X2CovertActionTemplate', Template, 'CovertAction_FindRaiderBase' );

	Template.ChooseLocationFn = ChooseRaiderBaseLocation;
	Template.OverworldMeshPath = "UI_3D.Overwold_Final.CovertAction";
	Template.RequiredFactionInfluence = eFactionInfluence_Respected;
	Template.bUseRewardImage = false;
	Template.bDisplayIgnoresInfluence = true;

	Template.Narratives.AddItem('CovertActionNarrative_FindRaiderBase');

	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot', 3));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));

	//Template.Risks.AddItem('CovertActionRisk_SoldierWounded');
	Template.Risks.AddItem('CovertActionRisk_RaiderAmbush');
	//Template.Risks.AddItem('CovertActionRisk_SoldierCaptured');

	Template.Rewards.AddItem('Reward_DiscoverRaiderBase');
	Template.Rewards.AddItem('Reward_Intel');

	return Template;
}


//---------------------------------------------------------------------------------------
// REVEAL RAIDER BASE
//---------------------------------------------------------------------------------------
static function X2DataTemplate CreateRaiderBaseAction()
{
	local X2CovertActionTemplate Template;

	`CREATE_X2TEMPLATE(class'X2CovertActionTemplate', Template, 'CovertAction_RaiderBaseAction' );

	Template.ChooseLocationFn = ChooseFoundRaiderBaseLocation;
	Template.OverworldMeshPath = "UI_3D.Overwold_Final.CovertAction";
	Template.RequiredFactionInfluence = eFactionInfluence_Influential;
	Template.bUseRewardImage = false;
	Template.bDisplayIgnoresInfluence = true;
	Template.bForceCreation = true;

	Template.Narratives.AddItem('CovertActionNarrative_RaiderBaseAction');

	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot', 5));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot', 3));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));

	//Template.Risks.AddItem('CovertActionRisk_SoldierWounded');
	Template.Risks.AddItem('CovertActionRisk_RaiderAmbush');
	//Template.Risks.AddItem('CovertActionRisk_SoldierCaptured');

	Template.Rewards.AddItem('Reward_RaiderBaseAction');
	Template.Rewards.AddItem('Reward_Supplies');
	Template.Rewards.AddItem('Reward_Intel');

	return Template;
}

static function ChooseRaiderBaseLocation(XComGameState NewGameState, XComGameState_CovertAction ActionState, out array<StateObjectReference> ExcludeLocations)
{
	local XComGameStateHistory History;
	local XComGameState_WorldRegion RegionState;
	local array<StateObjectReference> RegionRefs;
	local XComGameState_RaiderBaseManager BaseMgr;
	local array<XComGameState_RaiderBase> Bases;
	local XComGameState_RaiderBase base;

	History = `XCOMHISTORY;
	BaseMgr = class'XComGameState_RaiderBaseManager'.static.GetBaseManager();
	foreach History.IterateByClassType(class'XComGameState_WorldRegion', RegionState)
	{
		if(BaseMgr != none)
		{
			Bases = BaseMgr.GetBasesForContinent(RegionState.GetContinent());
			if (Bases.Length > 0)
			{
				foreach Bases(base)
				{	
					if(base.GetStatus() == eRB_Discovered)
					{
						RegionState = base.GetWorldRegion(); // regions don't actually matter for bases: we can have multiple bases in one region, for instance
						if(ExcludeLocations.Find('ObjectID', RegionState.GetReference().ObjectID) == INDEX_NONE )
						{
							RegionRefs.AddItem(RegionState.GetReference());
						}
					}

				}
			}			
		}		

	}

	if(RegionRefs.Length < 1)
	{
		`log("RFB ERROR: was unable to actually locate base for covert action");
		foreach History.IterateByClassType(class'XComGameState_WorldRegion', RegionState)
		{
			if (ExcludeLocations.Find('ObjectID', RegionState.GetReference().ObjectID) == INDEX_NONE)
			{
				RegionRefs.AddItem(RegionState.GetReference());
			}		
		}
	}
	

	ActionState.LocationEntity = RegionRefs[`SYNC_RAND_STATIC(RegionRefs.Length)];
}


static function ChooseFoundRaiderBaseLocation(XComGameState NewGameState, XComGameState_CovertAction ActionState, out array<StateObjectReference> ExcludeLocations)
{
	local XComGameStateHistory History;
	local XComGameState_WorldRegion RegionState;
	local array<StateObjectReference> RegionRefs;
	local XComGameState_RaiderBaseManager BaseMgr;
	local array<XComGameState_RaiderBase> Bases;
	local XComGameState_RaiderBase base;

	History = `XCOMHISTORY;
	BaseMgr = class'XComGameState_RaiderBaseManager'.static.GetBaseManager();
	foreach History.IterateByClassType(class'XComGameState_WorldRegion', RegionState)
	{
		if(BaseMgr != none)
		{
			Bases = BaseMgr.GetBasesForContinent(RegionState.GetContinent());
			if (Bases.Length > 0)
			{
				foreach Bases(base)
				{	
					if(base.GetStatus() == eRB_ReadyToAssault)
					{
						RegionState = base.GetWorldRegion(); // regions don't actually matter for bases: we can have multiple bases in one region, for instance
						if(ExcludeLocations.Find('ObjectID', RegionState.GetReference().ObjectID) == INDEX_NONE)
						{
							RegionRefs.AddItem(RegionState.GetReference());
						}
					}

				}
			}			
		}		

	}
	
	if(RegionRefs.Length < 1)
	{
		`log("RFB ERROR: was unable to actually locate base for covert action");
		foreach History.IterateByClassType(class'XComGameState_WorldRegion', RegionState)
		{
			if (ExcludeLocations.Find('ObjectID', RegionState.GetReference().ObjectID) == INDEX_NONE)
			{
				RegionRefs.AddItem(RegionState.GetReference());
			}		
		}
	}
	
	ActionState.LocationEntity = RegionRefs[`SYNC_RAND_STATIC(RegionRefs.Length)];
}




//---------------------------------------------------------------------------------------
// DEFAULT SLOTS
//---------------------------------------------------------------------------------------

private static function CovertActionSlot CreateDefaultSoldierSlot(name SlotName, optional int iMinRank, optional bool bRandomClass, optional bool bFactionClass)
{
	local CovertActionSlot SoldierSlot;

	SoldierSlot.StaffSlot = SlotName;
	SoldierSlot.Rewards.AddItem('Reward_StatBoostHP');
	SoldierSlot.Rewards.AddItem('Reward_StatBoostAim');
	SoldierSlot.Rewards.AddItem('Reward_StatBoostMobility');
	SoldierSlot.Rewards.AddItem('Reward_StatBoostDodge');
	SoldierSlot.Rewards.AddItem('Reward_StatBoostWill');
	SoldierSlot.Rewards.AddItem('Reward_StatBoostHacking');
	SoldierSlot.Rewards.AddItem('Reward_RankUp');
	SoldierSlot.iMinRank = iMinRank;
	SoldierSlot.bChanceFame = false;
	SoldierSlot.bRandomClass = bRandomClass;
	SoldierSlot.bFactionClass = bFactionClass;

	if (SlotName == 'CovertActionRookieStaffSlot')
	{
		SoldierSlot.bChanceFame = false;
	}

	return SoldierSlot;
}

private static function CovertActionSlot CreateDefaultStaffSlot(name SlotName)
{
	local CovertActionSlot StaffSlot;
	
	// Same as Soldier Slot, but no rewards
	StaffSlot.StaffSlot = SlotName;
	StaffSlot.bReduceRisk = false;
	
	return StaffSlot;
}

private static function CovertActionSlot CreateDefaultOptionalSlot(name SlotName, optional int iMinRank, optional bool bFactionClass)
{
	local CovertActionSlot OptionalSlot;

	OptionalSlot.StaffSlot = SlotName;
	OptionalSlot.bChanceFame = false;
	OptionalSlot.bReduceRisk = true;
	OptionalSlot.iMinRank = iMinRank;
	OptionalSlot.bFactionClass = bFactionClass;

	return OptionalSlot;
}

private static function StrategyCostReward CreateOptionalCostSlot(name ResourceName, int Quantity)
{
	local StrategyCostReward ActionCost;
	local ArtifactCost Resources;

	Resources.ItemTemplateName = ResourceName;
	Resources.Quantity = Quantity;
	ActionCost.Cost.ResourceCosts.AddItem(Resources);
	ActionCost.Reward = 'Reward_DecreaseRisk';
	
	return ActionCost;
}