class X2StrategyElement_SAVItemsCovertActions extends X2StrategyElement;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> CovertActions;

	CovertActions.AddItem(CreateResistanceCacheTemplate());
	CovertActions.AddItem(CreateADVENTCacheTemplate());
	CovertActions.AddItem(CreateAlienCacheTemplate());
	CovertActions.AddItem(CreateAlienTechItemTemplate());
	CovertActions.AddItem(CreateCovertAction_SkirmisherCache());
	CovertActions.AddItem(CreateCovertAction_TemplarCache());
	CovertActions.AddItem(CreateCovertAction_ReaperCache());

	return CovertActions;
}
//---------------------------------------------------------------------------------------
// Resistance Cache
//---------------------------------------------------------------------------------------
static function X2DataTemplate CreateResistanceCacheTemplate()
{
	local X2CovertActionTemplate Template;

	`CREATE_X2TEMPLATE(class'X2CovertActionTemplate', Template, 'CovertAction_ResistanceCache');

	Template.ChooseLocationFn = ChooseRandomRegion;
	Template.OverworldMeshPath = "UI_3D.Overwold_Final.CovertAction";
	Template.bMultiplesAllowed = false;
	Template.bUseRewardImage = true;
	
	Template.Narratives.AddItem('CovertActionNarrative_ResistanceCacheNarative');

	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot', 3));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));	
	Template.Slots.AddItem(CreateDefaultOptionalSlot('CovertActionEngineerStaffSlot'));

	Template.Risks.AddItem('CovertActionRisk_SoldierWounded');
	Template.Risks.AddItem('CovertActionRisk_Ambush');

	Template.Rewards.AddItem('Reward_ResistanceCache');

	return Template;
}
//---------------------------------------------------------------------------------------
// ADVENT Cache
//---------------------------------------------------------------------------------------
static function X2DataTemplate CreateADVENTCacheTemplate()
{
	local X2CovertActionTemplate Template;

	`CREATE_X2TEMPLATE(class'X2CovertActionTemplate', Template, 'CovertAction_ADVENTCache');

	Template.ChooseLocationFn = ChooseRandomRegion;
	Template.OverworldMeshPath = "UI_3D.Overwold_Final.CovertAction";
	Template.bMultiplesAllowed = false;
	Template.bUseRewardImage = true;
	
	Template.Narratives.AddItem('CovertActionNarrative_ADVENTCacheNarative');

	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot', 3));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));
	Template.Slots.AddItem(CreateDefaultOptionalSlot('CovertActionSoldierStaffSlot'));

	Template.Risks.AddItem('CovertActionRisk_SoldierWounded');
	Template.Risks.AddItem('CovertActionRisk_Ambush');

	Template.Rewards.AddItem('Reward_ADVENTCache');

	return Template;
}

//---------------------------------------------------------------------------------------
// Alien Cache
//---------------------------------------------------------------------------------------
static function X2DataTemplate CreateAlienCacheTemplate()
{
	local X2CovertActionTemplate Template;

	`CREATE_X2TEMPLATE(class'X2CovertActionTemplate', Template, 'CovertAction_AlienCache');

	Template.ChooseLocationFn = ChooseRandomRegion;
	Template.OverworldMeshPath = "UI_3D.Overwold_Final.CovertAction";
	Template.bMultiplesAllowed = false;
	Template.bUseRewardImage = true;
//	Template.bGoldenPath = true;//<<====================================================================== This is just to make sure it shows up
//	Template.bForceCreation = true;//<<====================================================================== This is just to make sure it shows up
	
	Template.Narratives.AddItem('CovertActionNarrative_AlienCacheNarative');
	Template.RequiredFactionInfluence = eFactionInfluence_Respected;//<<====================================================================== TEMP

	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot',5,, true));//<<============================================ TEMP
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));
	Template.Slots.AddItem(CreateDefaultOptionalSlot('CovertActionScientistStaffSlot'));

	Template.Risks.AddItem('CovertActionRisk_SoldierWounded');
	Template.Risks.AddItem('CovertActionRisk_SoldierCaptured');
	Template.Risks.AddItem('CovertActionRisk_Ambush');

	Template.Rewards.AddItem('Reward_AlienCache');

	return Template;
}

//---------------------------------------------------------------------------------------
// Alien Tech Items
//---------------------------------------------------------------------------------------
static function X2DataTemplate CreateAlienTechItemTemplate()
{
	local X2CovertActionTemplate Template;

	`CREATE_X2TEMPLATE(class'X2CovertActionTemplate', Template, 'CovertAction_AlienTechItem');

	Template.ChooseLocationFn = ChooseRandomRegion;
	Template.OverworldMeshPath = "UI_3D.Overwold_Final.CovertAction";
	Template.bMultiplesAllowed = false;
	Template.bUseRewardImage = true;
//	Template.bGoldenPath = true;//<<====================================================================== This is just to make sure it shows up
//	Template.bForceCreation = true;//<<====================================================================== This is just to make sure it shows up
	
	Template.Narratives.AddItem('CovertActionNarrative_AlienTechItemNarative');
	Template.RequiredFactionInfluence = eFactionInfluence_Respected;

	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot',5,, true));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));
	Template.Slots.AddItem(CreateDefaultOptionalSlot('CovertActionScientistStaffSlot'));

	Template.Risks.AddItem('CovertActionRisk_SoldierWounded');
	Template.Risks.AddItem('CovertActionRisk_SoldierCaptured');
	Template.Risks.AddItem('CovertActionRisk_Ambush');

	Template.Rewards.AddItem('Reward_SAVItemsAlienTechItem');

	return Template;
}

//---------------------------------------------------------------------------------------
// Resistance Faction Items
//---------------------------------------------------------------------------------------
static function X2DataTemplate CreateCovertAction_SkirmisherCache()
{
	local X2CovertActionTemplate Template;

	`CREATE_X2TEMPLATE(class'X2CovertActionTemplate', Template, 'CovertAction_SkirmisherCache');

	Template.ChooseLocationFn = ChooseRandomRegion;
	Template.OverworldMeshPath = "UI_3D.Overwold_Final.CovertAction";
	Template.bMultiplesAllowed = false;
	Template.bUseRewardImage = true;
	Template.bGoldenPath = false;
	Template.bForceCreation = false;
	
	Template.Narratives.AddItem('CovertActionNarrative_SkirmisherCacheNarative_Skirmisher');
	Template.Narratives.AddItem('CovertActionNarrative_SkirmisherCacheNarative_Templar');
	Template.Narratives.AddItem('CovertActionNarrative_SkirmisherCacheNarative_Reaper');
	Template.RequiredFactionInfluence = eFactionInfluence_Respected;

	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot',4,, true));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));
	Template.Slots.AddItem(CreateDefaultOptionalSlot('CovertActionSoldierStaffSlot'));

	Template.Risks.AddItem('CovertActionRisk_SoldierWounded');
	Template.Risks.AddItem('CovertActionRisk_SoldierCaptured');
	Template.Risks.AddItem('CovertActionRisk_Ambush');

	Template.Rewards.AddItem('Reward_SAVSkirmisherCacheReward');

	return Template;
}

static function X2DataTemplate CreateCovertAction_TemplarCache()
{
	local X2CovertActionTemplate Template;

	`CREATE_X2TEMPLATE(class'X2CovertActionTemplate', Template, 'CovertAction_CovertAction_TemplarCache');

	Template.ChooseLocationFn = ChooseRandomRegion;
	Template.OverworldMeshPath = "UI_3D.Overwold_Final.CovertAction";
	Template.bMultiplesAllowed = false;
	Template.bUseRewardImage = true;
	Template.bGoldenPath = false;
	Template.bForceCreation = false;
	
	Template.Narratives.AddItem('CovertActionNarrative_TemplarCacheNarative_Skirmisher');
	Template.Narratives.AddItem('CovertActionNarrative_TemplarCacheNarative_Templar');
	Template.Narratives.AddItem('CovertActionNarrative_TemplarCacheNarative_Reaper');
	Template.RequiredFactionInfluence = eFactionInfluence_Respected;

	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot',4,, true));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));
	Template.Slots.AddItem(CreateDefaultOptionalSlot('CovertActionSoldierStaffSlot'));

	Template.Risks.AddItem('CovertActionRisk_SoldierWounded');
	Template.Risks.AddItem('CovertActionRisk_SoldierCaptured');
	Template.Risks.AddItem('CovertActionRisk_Ambush');

	Template.Rewards.AddItem('Reward_SAVTemplarCacheReward');

	return Template;
}

static function X2DataTemplate CreateCovertAction_ReaperCache()
{
	local X2CovertActionTemplate Template;

	`CREATE_X2TEMPLATE(class'X2CovertActionTemplate', Template, 'CovertAction_ReaperCache');

	Template.ChooseLocationFn = ChooseRandomRegion;
	Template.OverworldMeshPath = "UI_3D.Overwold_Final.CovertAction";
	Template.bMultiplesAllowed = false;
	Template.bUseRewardImage = true;
	Template.bGoldenPath = false;
	Template.bForceCreation = false;
	
	Template.Narratives.AddItem('CovertActionNarrative_ReaperCacheNarative_Skirmisher');
	Template.Narratives.AddItem('CovertActionNarrative_ReaperCacheNarative_Templar');
	Template.Narratives.AddItem('CovertActionNarrative_ReaperCacheNarative_Reaper');
	Template.RequiredFactionInfluence = eFactionInfluence_Respected;

	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot',4,, true));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));
	Template.Slots.AddItem(CreateDefaultSoldierSlot('CovertActionSoldierStaffSlot'));
	Template.Slots.AddItem(CreateDefaultOptionalSlot('CovertActionSoldierStaffSlot'));

	Template.Risks.AddItem('CovertActionRisk_SoldierWounded');
	Template.Risks.AddItem('CovertActionRisk_SoldierCaptured');
	Template.Risks.AddItem('CovertActionRisk_Ambush');

	Template.Rewards.AddItem('Reward_SAVReaperCacheReward');

	return Template;
}

//---------------------------------------------------------------------------------------
// DEFAULT SLOTS, Helpers & Deligates below
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

//---------------------------------------------------------------------------------------
// GENERIC DELEGATES
//---------------------------------------------------------------------------------------

static function ChooseRandomRegion(XComGameState NewGameState, XComGameState_CovertAction ActionState, out array<StateObjectReference> ExcludeLocations)
{
	local XComGameStateHistory History;
	local XComGameState_WorldRegion RegionState;
	local array<StateObjectReference> RegionRefs;

	History = `XCOMHISTORY;

	foreach History.IterateByClassType(class'XComGameState_WorldRegion', RegionState)
	{
		if (ExcludeLocations.Find('ObjectID', RegionState.GetReference().ObjectID) == INDEX_NONE)
		{
			RegionRefs.AddItem(RegionState.GetReference());
		}		
	}

	ActionState.LocationEntity = RegionRefs[`SYNC_RAND_STATIC(RegionRefs.Length)];
}

static function ChooseRandomContactedRegion(XComGameState NewGameState, XComGameState_CovertAction ActionState, out array<StateObjectReference> ExcludeLocations)
{
	local XComGameStateHistory History;
	local XComGameState_WorldRegion RegionState;
	local array<StateObjectReference> RegionRefs;

	History = `XCOMHISTORY;

	foreach History.IterateByClassType(class'XComGameState_WorldRegion', RegionState)
	{
		if (ExcludeLocations.Find('ObjectID', RegionState.GetReference().ObjectID) == INDEX_NONE && RegionState.HaveMadeContact())
		{
			RegionRefs.AddItem(RegionState.GetReference());
		}
	}

	ActionState.LocationEntity = RegionRefs[`SYNC_RAND_STATIC(RegionRefs.Length)];
}

static function ChooseAdventFacilityRegion(XComGameState NewGameState, XComGameState_CovertAction ActionState, out array<StateObjectReference> ExcludeLocations)
{
	local XComGameStateHistory History;
	local XComGameState_WorldRegion RegionState;
	local array<StateObjectReference> RegionRefs;

	History = `XCOMHISTORY;

	foreach History.IterateByClassType(class'XComGameState_WorldRegion', RegionState)
	{
		if (ExcludeLocations.Find('ObjectID', RegionState.GetReference().ObjectID) == INDEX_NONE && RegionState.AlienFacility.ObjectID != 0)
		{
			RegionRefs.AddItem(RegionState.GetReference());
		}
	}

	ActionState.LocationEntity = RegionRefs[`SYNC_RAND_STATIC(RegionRefs.Length)];
}

static function ChooseFactionRegion(XComGameState NewGameState, XComGameState_CovertAction ActionState, out array<StateObjectReference> ExcludeLocations)
{
	ActionState.LocationEntity = ActionState.GetFaction().HomeRegion;
}

static function ChooseRivalChosenHomeRegion(XComGameState NewGameState, XComGameState_CovertAction ActionState, out array<StateObjectReference> ExcludeLocations)
{
	ActionState.LocationEntity = ActionState.GetFaction().GetRivalChosen().HomeRegion;
}

static function ChooseRivalChosenHomeContinentRegion(XComGameState NewGameState, XComGameState_CovertAction ActionState, out array<StateObjectReference> ExcludeLocations)
{
	local XComGameState_Continent ContinentState;
	local XComGameState_WorldRegion RegionState;
	local XComGameState_AdventChosen ChosenState;
	local array<StateObjectReference> ValidRegionRefs;
	local StateObjectReference RegionRef;
	
	ChosenState = ActionState.GetFaction().GetRivalChosen();
	RegionState = ChosenState.GetHomeRegion();

	if (RegionState != none)
	{
		ContinentState = RegionState.GetContinent();
		ValidRegionRefs.Length = 0;

		foreach ContinentState.Regions(RegionRef)
		{
			if(ChosenState.TerritoryRegions.Find('ObjectID', RegionRef.ObjectID) != INDEX_NONE)
			{
				ValidRegionRefs.AddItem(RegionRef);
			}
		}

		if(ValidRegionRefs.Length > 0)
		{
			ActionState.LocationEntity = ValidRegionRefs[`SYNC_RAND_STATIC(ValidRegionRefs.Length)];
		}
		else
		{
		ActionState.LocationEntity = ContinentState.Regions[`SYNC_RAND_STATIC(ContinentState.Regions.Length)];
	}
	}
	else
	{
		ActionState.LocationEntity = ChosenState.HomeRegion;
	}
}

static function ChooseRandomRivalChosenRegion(XComGameState NewGameState, XComGameState_CovertAction ActionState, out array<StateObjectReference> ExcludeLocations)
{
	local XComGameState_AdventChosen ChosenState;

	ChosenState = ActionState.GetFaction().GetRivalChosen();
	ActionState.LocationEntity = ChosenState.TerritoryRegions[`SYNC_RAND_STATIC(ChosenState.TerritoryRegions.Length)];
}