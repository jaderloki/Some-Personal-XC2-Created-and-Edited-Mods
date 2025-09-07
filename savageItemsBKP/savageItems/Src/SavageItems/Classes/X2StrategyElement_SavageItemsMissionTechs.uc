class X2StrategyElement_SavageItemsMissionTechs extends X2StrategyElement config(SAVItemsCacheTechs);
//extends X2StrategyElement_XpackTechs

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;
//Missions - Taken from Reality Machina's mod
Techs.AddItem(SAVPrepareGuerillaOp());
Techs.AddItem(SAVPrepareSupplyRaid());
Techs.AddItem(SAVPrepareUFOShootdown());
Techs.AddItem(SAVPrepareCityCenterOP());
Techs.AddItem(SAVPrepareResistanceOperation());

	return Techs;
}

//#############################################################################################
//-----------------   Mission Spawners   -----------------------------------------------------
//#############################################################################################
//Mission Techs- Taken from Reality Machina's mod
static function X2DataTemplate SAVPrepareGuerillaOp()
{
	local X2TechTemplate Template;
	local ArtifactCost Resource;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVTech_PrepareGuerillaOp');
	Template.PointsToComplete = 400;
	Template.RepeatPointsIncrease = 50;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_MI_UnlockMission_ResOps";
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = SpawnSAVGuerillaOp;

	Template.Requirements.RequiredTechs.AddItem('ResistanceCommunications');
	Template.Requirements.RequiredItems.AddItem('SAV_MissionIntel_GuerillaOps');
	Template.Requirements.bVisibleIfTechsNotMet = false;

	// Cost
	Artifacts.ItemTemplateName = 'SAV_MissionIntel_GuerillaOps';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Resource.ItemTemplateName = 'Intel';
	Resource.Quantity = 10;
	Template.Cost.ResourceCosts.AddItem(Resource);
	return Template;
}

static function X2DataTemplate SAVPrepareSupplyRaid()
{
	local X2TechTemplate Template;
	local ArtifactCost Resource;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVTech_PrepareSupplyRaid');
	Template.PointsToComplete = 600;
	Template.RepeatPointsIncrease = 75;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_MI_UnlockMission_ADVENTSupply";
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = SpawnSAVSupplyRaid;

	Template.Requirements.RequiredTechs.AddItem('ResistanceCommunications');
	Template.Requirements.RequiredItems.AddItem('SAV_MissionIntel_SupplyRaid');
	Template.Requirements.bVisibleIfTechsNotMet = false;

	// Cost
	Artifacts.ItemTemplateName = 'SAV_MissionIntel_SupplyRaid';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Resource.ItemTemplateName = 'Intel';
	Resource.Quantity = 15;
	Template.Cost.ResourceCosts.AddItem(Resource);

	return Template;
}

static function X2DataTemplate SAVPrepareUFOShootdown()
{
	local X2TechTemplate Template;
	local ArtifactCost Resource;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVTech_PrepareUFOShootdown');
	Template.PointsToComplete = 800;
	Template.RepeatPointsIncrease = 200;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_MI_UnlockMission_AlienUFO";
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = SpawnSAVUFOShootdown;

	Template.Requirements.RequiredTechs.AddItem('ResistanceCommunications');
	Template.Requirements.RequiredItems.AddItem('SAV_MissionIntel_UFO');
	Template.Requirements.bVisibleIfTechsNotMet = false;

	// Cost
	Artifacts.ItemTemplateName = 'SAV_MissionIntel_UFO';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Resource.ItemTemplateName = 'Intel';
	Resource.Quantity = 25;
	Template.Cost.ResourceCosts.AddItem(Resource);

	return Template;
}

static function X2DataTemplate SAVPrepareCityCenterOP()
{
	local X2TechTemplate Template;
	local ArtifactCost Resource;
	local ArtifactCost Artifacts;
	
	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVTech_PrepareCityCenterOP');
	Template.PointsToComplete = 600;
	Template.RepeatPointsIncrease = 75;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_MI_UnlockMission_CouncilOp";
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = SpawnSAVCityCenterOP;

	Template.Requirements.RequiredTechs.AddItem('ResistanceCommunications');
	Template.Requirements.RequiredItems.AddItem('SAV_MissionIntel_CouncilOps');
	Template.Requirements.bVisibleIfTechsNotMet = false;

	// Cost
	Artifacts.ItemTemplateName = 'SAV_MissionIntel_CouncilOps';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Resource.ItemTemplateName = 'Intel';
	Resource.Quantity = 15;
	Template.Cost.ResourceCosts.AddItem(Resource);

	return Template;
}

static function X2DataTemplate SAVPrepareResistanceOperation()
{
	local X2TechTemplate Template;
	local ArtifactCost Resource;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'SAVTech_PrepareResistanceOperation');
	Template.PointsToComplete = 600;
	Template.RepeatPointsIncrease = 75;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_SavageItems.TECH_MI_UnlockMission_ResFactionOps";
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = SpawnSavResistanceOpReward;
		
	Template.Requirements.RequiredTechs.AddItem('ResistanceCommunications');
	Template.Requirements.RequiredItems.AddItem('SAV_MissionIntel_ResistanceOps');
	Template.Requirements.bVisibleIfTechsNotMet = false;

	// Cost
	Artifacts.ItemTemplateName = 'SAV_MissionIntel_ResistanceOps';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Resource.ItemTemplateName = 'Intel';
	Resource.Quantity = 15;
	Template.Cost.ResourceCosts.AddItem(Resource);

	return Template;
}

//Functions Which generate Missions and rewards

function SpawnSAVGuerillaOp(XComGameState NewGameState,  XComGameState_Tech TechState)//optional StateObjectReference AuxRef
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersAlien AlienHQ;
	local XComGameState_MissionSite MissionState, DarkEventMissionState;
	local XComGameState_WorldRegion RegionState;
	local XComGameState_Reward MissionRewardState;
	local XComGameState_DarkEvent DarkEventState;
	local XComGameState_MissionCalendar CalendarState;
	local X2RewardTemplate RewardTemplate;
	local X2StrategyElementTemplateManager StratMgr;
	local X2MissionSourceTemplate MissionSource;
	local array<XComGameState_Reward> MissionRewards;
	local array<StateObjectReference> DarkEvents, PossibleDarkEvents;
	local array<int> OnMissionDarkEventIDs;
	local StateObjectReference DarkEventRef;
	local float MissionDuration;
//	local XComGameState_CovertAction ActionState;
	local array<name> ExcludeList;
	local XComGameState_HeadquartersResistance ResHQ;

	History = `XCOMHISTORY;
	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	AlienHQ = XComGameState_HeadquartersAlien(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersAlien'));
//	ActionState = XComGameState_CovertAction(`XCOMHISTORY.GetGameStateForObjectID(AuxRef.ObjectID));
//	RegionState = ActionState.GetWorldRegion();
	RegionState = GetRandomContactedRegion();
	ResHQ = class'UIUtilities_Strategy'.static.GetResistanceHQ();

	CalendarState = XComGameState_MissionCalendar(History.GetSingleGameStateObjectForClass(class'XComGameState_MissionCalendar'));
	MissionRewards.Length = 0;
	RewardTemplate = X2RewardTemplate(StratMgr.FindStrategyElementTemplate(class'X2StrategyElement_DefaultMissionSources'.static.SelectGuerillaOpRewardType(ExcludeList, CalendarState)));
	MissionRewardState = RewardTemplate.CreateInstanceFromTemplate(NewGameState);
	MissionRewardState.GenerateReward(NewGameState, ResHQ.GetMissionResourceRewardScalar(MissionRewardState), RegionState.GetReference());
	MissionRewards.AddItem(MissionRewardState);

	MissionState = XComGameState_MissionSite(NewGameState.CreateNewStateObject(class'XComGameState_MissionSite'));

	MissionSource = X2MissionSourceTemplate(StratMgr.FindStrategyElementTemplate('MissionSource_GuerillaOp'));

	MissionDuration = float((18 + `SYNC_RAND_STATIC(26 - 18 + 1)) * 3600);
	MissionState.BuildMission(MissionSource, RegionState.GetRandom2DLocationInRegion(), RegionState.GetReference(), MissionRewards, true, true, , MissionDuration);
	MissionState.PickPOI(NewGameState);
	
	// Find out if there are any missions on the board which are paired with Dark Events
	foreach History.IterateByClassType(class'XComGameState_MissionSite', DarkEventMissionState)
	{
		if (DarkEventMissionState.DarkEvent.ObjectID != 0)
		{
			OnMissionDarkEventIDs.AddItem(DarkEventMissionState.DarkEvent.ObjectID);
		}
	}

	// See if there are any Dark Events left over after comparing the mission Dark Event list with the Alien HQ Chosen Events
	DarkEvents = AlienHQ.ChosenDarkEvents;
	foreach DarkEvents(DarkEventRef)
	{		
		if (OnMissionDarkEventIDs.Find(DarkEventRef.ObjectID) == INDEX_NONE)
		{
			PossibleDarkEvents.AddItem(DarkEventRef);
		}
	}

	// If there are Dark Events that this mission can counter, pick a random one and ensure it won't activate before the mission expires
	if (PossibleDarkEvents.Length > 0)
	{
		DarkEventRef = PossibleDarkEvents[`SYNC_RAND_STATIC(PossibleDarkEvents.Length)];		
		DarkEventState = XComGameState_DarkEvent(History.GetGameStateForObjectID(DarkEventRef.ObjectID));
		if (DarkEventState.TimeRemaining < MissionDuration)
		{
			DarkEventState = XComGameState_DarkEvent(NewGameState.ModifyStateObject(class'XComGameState_DarkEvent', DarkEventState.ObjectID));
			DarkEventState.ExtendActivationTimer(26);
		}

		MissionState.DarkEvent = DarkEventRef;
	}

//	RewardState.RewardObjectReference = MissionState.GetReference();
}

function SpawnSAVSupplyRaid(XComGameState NewGameState,  XComGameState_Tech TechState)
{
	local XComGameState_Reward RewardState;
	local X2RewardTemplate RewardTemplate;
	local X2StrategyElementTemplateManager StratMgr;
	local array<XComGameState_Reward> MissionRewards;
	local StateObjectReference RegionRef;
	local Vector2D v2Loc;
	local XComGameState_MissionSite MissionState;
	local X2MissionSourceTemplate MissionSource;
	local XComGameState_WorldRegion RegionState;
	local float MissionDuration;

	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	RewardTemplate = X2RewardTemplate(StratMgr.FindStrategyElementTemplate('Reward_None'));

	MissionRewards.Length = 0;
	RewardState = RewardTemplate.CreateInstanceFromTemplate(NewGameState);
	RegionState = GetRandomContactedRegion();
	MissionRewards.AddItem(RewardState);
	
	MissionSource = X2MissionSourceTemplate(StratMgr.FindStrategyElementTemplate('MissionSource_SupplyRaid'));

	// Build Mission, region and loc will be determined later so defer computing biome/plot data
	MissionState = XComGameState_MissionSite(NewGameState.CreateNewStateObject(class'XComGameState_MissionSite'));
	MissionState.ExcludeMissionFamilies.AddItem("ChosenAvengerDefense");
	MissionState.ExcludeMissionTypes.AddItem("ChosenAvengerDefense");
//	MissionState.ExcludeMissionFamilies.AddItem("SupplyLineRaid");	
	MissionState.ExcludeMissionFamilies.AddItem("SupplyExtraction");			
	MissionState.ExcludeMissionFamilies.AddItem("SupplyExtraction_CI");

	MissionState.BuildMission(MissionSource, v2Loc, RegionRef, MissionRewards, false, false, , , , , false);

	MissionDuration = float((18 + `SYNC_RAND_STATIC(26 - 18 + 1)) * 3600);
	MissionState.BuildMission(MissionSource, RegionState.GetRandom2DLocationInRegion(), RegionState.GetReference(), MissionRewards, true, true, , MissionDuration);
	MissionState.PickPOI(NewGameState);

}

function SpawnSAVUFOShootdown(XComGameState NewGameState,  XComGameState_Tech TechState)
{
	local XComGameState_MissionSite MissionState;
	local XComGameState_WorldRegion RegionState;
	local XComGameState_Reward MissionRewardState;
	local X2RewardTemplate RewardTemplate;
	local X2StrategyElementTemplateManager StratMgr;
	local X2MissionSourceTemplate MissionSource;
	local array<XComGameState_Reward> MissionRewards;
	local float MissionDuration;
//	local XComGameState_CovertAction ActionState;
	local XComGameState_HeadquartersResistance ResHQ;

	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
//	ActionState = XComGameState_CovertAction(`XCOMHISTORY.GetGameStateForObjectID(AuxRef.ObjectID));
//	RegionState = ActionState.GetWorldRegion();
	RegionState = GetRandomContactedRegion();
	ResHQ = class'UIUtilities_Strategy'.static.GetResistanceHQ();

	MissionRewards.Length = 0;
	RewardTemplate = X2RewardTemplate(StratMgr.FindStrategyElementTemplate('Reward_None'));
	MissionRewardState = RewardTemplate.CreateInstanceFromTemplate(NewGameState);
	MissionRewardState.GenerateReward(NewGameState, ResHQ.GetMissionResourceRewardScalar(MissionRewardState), RegionState.GetReference());
//	MissionRewardState.GenerateReward(NewGameState, ResHQ.GetMissionResourceRewardScalar(RewardState), RegionState.GetReference());
	MissionRewards.AddItem(MissionRewardState);

	MissionState = XComGameState_MissionSite(NewGameState.CreateNewStateObject(class'XComGameState_MissionSite'));

	MissionSource = X2MissionSourceTemplate(StratMgr.FindStrategyElementTemplate('MissionSource_LandedUFO'));
	
	MissionDuration = float((10 + `SYNC_RAND_STATIC(16 - 10 + 1)) * 3600);
	MissionState.BuildMission(MissionSource, RegionState.GetRandom2DLocationInRegion(), RegionState.GetReference(), MissionRewards, true, true, , MissionDuration);
	MissionState.PickPOI(NewGameState);

//	RewardState.RewardObjectReference = MissionState.GetReference();
}

function SpawnSAVCityCenterOP(XComGameState NewGameState,  XComGameState_Tech TechState)
{
	local X2StrategyElementTemplateManager StratMgr;
	local XComGameState_MissionSite MissionState;
	local XComGameState_WorldRegion RegionState;
	local XComGameState_Reward RewardState;
	local X2RewardTemplate RewardTemplate;
	local X2MissionSourceTemplate MissionSource;
	local array<XComGameState_Reward> MissionRewards;
	local array<XComGameState_WorldRegion> PossibleRegions;
	local float MissionDuration;
	local XComGameState_MissionCalendar CalendarState;
	local XComGameState_HeadquartersResistance ResHQ;

	CalendarState = GetMissionCalendar(NewGameState);

	// Set Popup flag
	CalendarState.MissionPopupSources.AddItem('MissionSource_Council');

	// Calculate Mission Expiration timer
	MissionDuration = float((10 + `SYNC_RAND_STATIC(16 - 10 + 1)) * 3600);

	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	MissionSource = X2MissionSourceTemplate(StratMgr.FindStrategyElementTemplate('MissionSource_Council'));
	PossibleRegions = MissionSource.GetMissionRegionFn(NewGameState);
	RegionState = PossibleRegions[0];

	// Generate the mission reward
	ResHQ = class'UIUtilities_Strategy'.static.GetResistanceHQ();
	RewardTemplate = X2RewardTemplate(StratMgr.FindStrategyElementTemplate(SAVSelectCouncilMissionRewardType(CalendarState)));
	RewardState = RewardTemplate.CreateInstanceFromTemplate(NewGameState);
	if (RewardState.GetMyTemplateName() == 'Reward_Supplies')
		RewardState.GenerateReward(NewGameState, 1 * ResHQ.GetMissionResourceRewardScalar(RewardState), RegionState.GetReference());
	else
		RewardState.GenerateReward(NewGameState, ResHQ.GetMissionResourceRewardScalar(RewardState), RegionState.GetReference());
	MissionRewards.AddItem(RewardState);
	
	// All Council Missions also give an Intel reward
	RewardTemplate = X2RewardTemplate(StratMgr.FindStrategyElementTemplate('Reward_Intel'));
	RewardState = RewardTemplate.CreateInstanceFromTemplate(NewGameState);
	RewardState.GenerateReward(NewGameState, ResHQ.GetMissionResourceRewardScalar(RewardState), RegionState.GetReference());
	MissionRewards.AddItem(RewardState);
	
	MissionState = XComGameState_MissionSite(NewGameState.CreateNewStateObject(class'XComGameState_MissionSite'));

	MissionState.BuildMission(MissionSource, RegionState.GetRandom2DLocationInRegion(), RegionState.GetReference(), MissionRewards, true, true, , MissionDuration);

	MissionState.PickPOI(NewGameState);

	`XEVENTMGR.TriggerEvent('CouncilMissionSpawned', MissionState, MissionState, NewGameState);
	
	CalendarState.CreatedMissionSources.AddItem('MissionSource_Council');
}

static function name SAVSelectCouncilMissionRewardType(XComGameState_MissionCalendar CalendarState)
{
	local X2StrategyElementTemplateManager TemplateManager;
	local X2RewardTemplate RewardTemplate;
	local name RewardType;
	local int SourceIndex, Index;
	local bool bFoundNeededReward;
	local array<name> SkipList;

	SourceIndex = CalendarState.MissionRewardDecks.Find('MissionSource', 'MissionSource_Council');

	// Refill the deck if empty
	if(SourceIndex == INDEX_NONE || CalendarState.MissionRewardDecks[SourceIndex].Rewards.Length == 0)
	{
		CreateSAVCouncilMissionRewards(CalendarState);
	}

	SourceIndex = CalendarState.MissionRewardDecks.Find('MissionSource', 'MissionSource_Council');

	// first council mission is always a scientist reward
	if(!CalendarState.HasCreatedMissionOfSource('MissionSource_Council'))
	{
		RewardType = 'Reward_Scientist';
		Index = CalendarState.MissionRewardDecks[SourceIndex].Rewards.Find(RewardType);

		if(Index != INDEX_NONE)
		{
			CalendarState.MissionRewardDecks[SourceIndex].Rewards.Remove(Index, 1);
		}
	}
	else
	{
		while (RewardType == '')
		{
			TemplateManager = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

			// Check if there is a reward that the player badly needs, if so use it as the reward
			for (Index = 0; Index < CalendarState.MissionRewardDecks[SourceIndex].Rewards.Length; Index++)
			{
				if (SkipList.Find(CalendarState.MissionRewardDecks[SourceIndex].Rewards[Index]) == INDEX_NONE)
				{
					RewardType = CalendarState.MissionRewardDecks[SourceIndex].Rewards[Index];
					RewardTemplate = X2RewardTemplate(TemplateManager.FindStrategyElementTemplate(RewardType));
					if (RewardTemplate != none)
					{
						if (RewardTemplate.IsRewardNeededFn != none && RewardTemplate.IsRewardNeededFn())
						{
							CalendarState.MissionRewardDecks[SourceIndex].Rewards.Remove(Index, 1);
							bFoundNeededReward = true;
							break;
						}
						else // If the reward does not have have an IsRewardNeededFn, or it has failed, add it to the skip list so that reward type isn't checked again
						{
							SkipList.AddItem(RewardType);
							RewardType = ''; // Clear the reward type
						}
					}
				}
			}

			if (!bFoundNeededReward)
			{
				// take the first reward that is valid for this point in the game
				for (Index = 0; Index < CalendarState.MissionRewardDecks[SourceIndex].Rewards.Length; Index++)
				{
					RewardType = CalendarState.MissionRewardDecks[SourceIndex].Rewards[Index];
					RewardTemplate = X2RewardTemplate(TemplateManager.FindStrategyElementTemplate(RewardType));
					if (RewardTemplate != none && (RewardTemplate.IsRewardAvailableFn == none || RewardTemplate.IsRewardAvailableFn()))
					{
						CalendarState.MissionRewardDecks[SourceIndex].Rewards.Remove(Index, 1);
						break;
					}
					else
					{
						RewardType = ''; // Clear the reward type
					}
				}
			}

			if (RewardType == '')
			{
				// If we're starting over with a new reward deck, wipe the old one to get rid of any excluded stragglers
				CalendarState.MissionRewardDecks[SourceIndex].Rewards.Length = 0;
				CreateSAVCouncilMissionRewards(CalendarState);
			}
		}
	}

	return RewardType;
}

static function CreateSAVCouncilMissionRewards(XComGameState_MissionCalendar CalendarState)
{
	local X2StrategyElementTemplateManager StratMgr;
	local X2MissionSourceTemplate MissionSource;
	local array<name> Rewards;
	local int idx, SourceIndex;
	local MissionRewardDeck RewardDeck;

	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	MissionSource = X2MissionSourceTemplate(StratMgr.FindStrategyElementTemplate('MissionSource_Council'));
	Rewards = GetShuffledRewardDeck(MissionSource.RewardDeck);

	SourceIndex = CalendarState.MissionRewardDecks.Find('MissionSource', 'MissionSource_Council');

	if(SourceIndex == INDEX_NONE)
	{
		RewardDeck.MissionSource = 'MissionSource_Council';
		CalendarState.MissionRewardDecks.AddItem(RewardDeck);
		SourceIndex = CalendarState.MissionRewardDecks.Find('MissionSource', 'MissionSource_Council');
	}

	// Append to end of current list
	for(idx = 0; idx < Rewards.Length; idx++)
	{
		CalendarState.MissionRewardDecks[SourceIndex].Rewards.AddItem(Rewards[idx]);
	}
}

function SpawnSavResistanceOpReward(XComGameState NewGameState,  XComGameState_Tech TechState)//optional StateObjectReference AuxRef
{
	local X2StrategyElementTemplateManager StratMgr;
	local XComGameState_MissionSite MissionState;
	local XComGameState_ResistanceFaction FactionState;
	local X2MissionSourceTemplate MissionSource;
	local XComGameState_MissionCalendar CalendarState;

	CalendarState = GetMissionCalendar(NewGameState);
	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	MissionSource = X2MissionSourceTemplate(StratMgr.FindStrategyElementTemplate('MissionSource_ResistanceOp'));
	
	MissionState = BuildResOpMission(NewGameState, MissionSource);
	FactionState = SelectRandomResistanceOpFaction();
	MissionState.ResistanceFaction = FactionState.GetReference();
	
	// Set Popup and mission source flags in the calendar - do this after creating the mission so rewards are generated properly
	CalendarState.MissionPopupSources.AddItem('MissionSource_ResistanceOp');
	CalendarState.CreatedMissionSources.AddItem('MissionSource_ResistanceOp');
}

static function array<int> GetResOpExcludeRewards(XComGameState_MissionSite MissionState)
{
	local XComGameStateHistory History;
	local XComGameState_BattleData BattleData;
	local array<int> ExcludeIndices;
	local int idx;

	History = `XCOMHISTORY;
	BattleData = XComGameState_BattleData(History.GetSingleGameStateObjectForClass(class'XComGameState_BattleData'));
	`assert(BattleData.m_iMissionID == MissionState.ObjectID);

	for (idx = 0; idx < BattleData.MapData.ActiveMission.MissionObjectives.Length; idx++)
	{
		// SecondaryVIP_01 and SoldierVIP are the tags for the first soldier unit rescued in Gather Survivors and Recover Expedition, respectively
		if ((BattleData.MapData.ActiveMission.MissionObjectives[idx].ObjectiveName == 'SecondaryVIP_01' ||
			BattleData.MapData.ActiveMission.MissionObjectives[idx].ObjectiveName == 'SoldierVIP') &&
			!BattleData.MapData.ActiveMission.MissionObjectives[idx].bCompleted)
		{
			// Index should always be 2, since the first two rewards are Intel and the Sci / Eng VIP
			ExcludeIndices.AddItem(2);
		}

		// SecondaryVIP_02 is the second soldier rescued in Gather Survivors
		if (BattleData.MapData.ActiveMission.MissionObjectives[idx].ObjectiveName == 'SecondaryVIP_02' &&
			!BattleData.MapData.ActiveMission.MissionObjectives[idx].bCompleted)
		{
			ExcludeIndices.AddItem(3);
		}
	}

	return ExcludeIndices;
}


//---------------------------------------------------------------------------------------
static function XComGameState_ResistanceFaction SelectRandomResistanceOpFaction()
{
	local XComGameStateHistory History;
	local XComGameState_ResistanceFaction FactionState;
	local array<XComGameState_ResistanceFaction> AvailableFactions;

	History = `XCOMHISTORY;
	foreach History.IterateByClassType(class'XComGameState_ResistanceFaction', FactionState)
	{
		if (FactionState.bMetXCom)
		{
			AvailableFactions.AddItem(FactionState);
		}
	}

	if (AvailableFactions.Length > 0)
	{
		FactionState = AvailableFactions[`SYNC_RAND_STATIC(AvailableFactions.Length)];
	}

	if (FactionState == none)
	{
		`Redscreen("@jweinhoffer @gameplay No Factions could not be found for Resistance Op mission.");
	}

	return FactionState;
}

//---------------------------------------------------------------------------------------
static function name SelectResistanceOpRewardType(XComGameState_MissionCalendar CalendarState)
{
	local X2StrategyElementTemplateManager TemplateManager;
	local X2RewardTemplate RewardTemplate;
	local name RewardType;
	local int SourceIndex, Index;
	local bool bFoundNeededReward, bIgnoreAvailability;
	local array<name> SkipList;

	SourceIndex = CalendarState.MissionRewardDecks.Find('MissionSource', 'MissionSource_ResistanceOp');

	// Refill the deck if empty
	if (SourceIndex == INDEX_NONE || CalendarState.MissionRewardDecks[SourceIndex].Rewards.Length == 0)
	{
		CreateResistanceOpRewards(CalendarState);
	}

	SourceIndex = CalendarState.MissionRewardDecks.Find('MissionSource', 'MissionSource_ResistanceOp');

	// first resistance op mission is always a scientist reward
	if (!CalendarState.HasCreatedMissionOfSource('MissionSource_ResistanceOp') && !CalendarState.HasCreatedMissionOfSource('MissionSource_LostAndAbandoned'))
	{
		RewardType = 'Reward_Scientist';
		Index = CalendarState.MissionRewardDecks[SourceIndex].Rewards.Find(RewardType);

		if (Index != INDEX_NONE)
		{
			CalendarState.MissionRewardDecks[SourceIndex].Rewards.Remove(Index, 1);
		}
	}
	else
	{
		while (RewardType == '')
		{
			TemplateManager = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

			// Check if there is a reward that the player badly needs, if so use it as the reward
			for (Index = 0; Index < CalendarState.MissionRewardDecks[SourceIndex].Rewards.Length; Index++)
			{
				if (SkipList.Find(CalendarState.MissionRewardDecks[SourceIndex].Rewards[Index]) == INDEX_NONE)
				{
					RewardType = CalendarState.MissionRewardDecks[SourceIndex].Rewards[Index];
					RewardTemplate = X2RewardTemplate(TemplateManager.FindStrategyElementTemplate(RewardType));
					if (RewardTemplate != none)
					{
						if (bIgnoreAvailability || (RewardTemplate.IsRewardNeededFn != none && RewardTemplate.IsRewardNeededFn()))
						{
							CalendarState.MissionRewardDecks[SourceIndex].Rewards.Remove(Index, 1);
							bFoundNeededReward = true;
							break;
						}
						else // If the reward does not have have an IsRewardNeededFn, or it has failed, add it to the skip list so that reward type isn't checked again
						{
							SkipList.AddItem(RewardType);
							RewardType = ''; // Clear the reward type
						}
					}
				}
			}

			if (!bFoundNeededReward)
			{
				// take the first reward that is valid for this point in the game
				for (Index = 0; Index < CalendarState.MissionRewardDecks[SourceIndex].Rewards.Length; Index++)
				{
					RewardType = CalendarState.MissionRewardDecks[SourceIndex].Rewards[Index];
					RewardTemplate = X2RewardTemplate(TemplateManager.FindStrategyElementTemplate(RewardType));
					if (RewardTemplate != none && (bIgnoreAvailability || (RewardTemplate.IsRewardAvailableFn == none || RewardTemplate.IsRewardAvailableFn())))
					{
						CalendarState.MissionRewardDecks[SourceIndex].Rewards.Remove(Index, 1);
						break;
					}
					else
					{
						RewardType = ''; // Clear the reward type
					}
				}
			}

			if (RewardType == '')
			{
				// If we're starting over with a new reward deck, wipe the old one to get rid of any excluded stragglers
				CalendarState.MissionRewardDecks[SourceIndex].Rewards.Length = 0;
				CreateResistanceOpRewards(CalendarState);
				bIgnoreAvailability = true; // Already cycled through every reward once, so ignore availability functions the second time
			}
		}
	}

	return RewardType;
}

//---------------------------------------------------------------------------------------
static function CreateResistanceOpRewards(XComGameState_MissionCalendar CalendarState)
{
	local X2StrategyElementTemplateManager StratMgr;
	local X2MissionSourceTemplate MissionSource;
	local array<name> Rewards;
	local int idx, SourceIndex;
	local MissionRewardDeck RewardDeck;

	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	MissionSource = X2MissionSourceTemplate(StratMgr.FindStrategyElementTemplate('MissionSource_ResistanceOp'));
	Rewards = GetShuffledRewardDeck(MissionSource.RewardDeck);

	SourceIndex = CalendarState.MissionRewardDecks.Find('MissionSource', 'MissionSource_ResistanceOp');

	if (SourceIndex == INDEX_NONE)
	{
		RewardDeck.MissionSource = 'MissionSource_ResistanceOp';
		CalendarState.MissionRewardDecks.AddItem(RewardDeck);
		SourceIndex = CalendarState.MissionRewardDecks.Find('MissionSource', 'MissionSource_ResistanceOp');
	}

	// Append to end of current list
	for (idx = 0; idx < Rewards.Length; idx++)
	{
		CalendarState.MissionRewardDecks[SourceIndex].Rewards.AddItem(Rewards[idx]);
	}
}

//private static function XComGameState_MissionSite BuildResOpMission(XComGameState NewGameState, X2MissionSourceTemplate MissionSource, optional bool bNoPOI)
function XComGameState_MissionSite BuildResOpMission(XComGameState NewGameState, X2MissionSourceTemplate MissionSource, optional bool bNoPOI)
{
	local X2StrategyElementTemplateManager StratMgr;
	local XComGameState_MissionSite MissionState;
	local XComGameState_WorldRegion RegionState;
	local XComGameState_MissionCalendar CalendarState;
	local XComGameState_Reward RewardState;
	local X2RewardTemplate RewardTemplate;
	local array<XComGameState_Reward> MissionRewards;
	local array<XComGameState_WorldRegion> PossibleRegions;
	local float MissionDuration;
	local XComGameState_HeadquartersResistance ResHQ;
	
	// Calculate Mission Expiration timer
	MissionDuration = float((10 + `SYNC_RAND_STATIC(16 - 10 + 1)) * 3600);

	PossibleRegions = MissionSource.GetMissionRegionFn(NewGameState);
	RegionState = PossibleRegions[0];

	// Generate the mission reward (either Scientist or Engineer)
	ResHQ = class'UIUtilities_Strategy'.static.GetResistanceHQ();
	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	CalendarState = GetMissionCalendar(NewGameState);
	RewardTemplate = X2RewardTemplate(StratMgr.FindStrategyElementTemplate(SelectResistanceOpRewardType(CalendarState)));
	RewardState = RewardTemplate.CreateInstanceFromTemplate(NewGameState);
	RewardState.GenerateReward(NewGameState, ResHQ.GetMissionResourceRewardScalar(RewardState), RegionState.GetReference());
	AddSAVTacticalTagToRewardUnit(NewGameState, RewardState, 'VIPReward');
	MissionRewards.AddItem(RewardState);

	// All Resistance Op missions also give an Intel reward
	RewardTemplate = X2RewardTemplate(StratMgr.FindStrategyElementTemplate('Reward_Intel'));
	RewardState = RewardTemplate.CreateInstanceFromTemplate(NewGameState);
	RewardState.GenerateReward(NewGameState, ResHQ.GetMissionResourceRewardScalar(RewardState), RegionState.GetReference());
	MissionRewards.AddItem(RewardState);

	MissionState = XComGameState_MissionSite(NewGameState.CreateNewStateObject(class'XComGameState_MissionSite'));

	// If first on non-narrative, do not allow Swarm Defense since the reinforcement groups will be too strong
	if (!(XComGameState_CampaignSettings(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_CampaignSettings')).bXPackNarrativeEnabled) &&
		!CalendarState.HasCreatedMissionOfSource('MissionSource_ResistanceOp'))
	{
		MissionState.ExcludeMissionFamilies.AddItem("SwarmDefense");
	}

	MissionState.BuildMission(MissionSource, RegionState.GetRandom2DLocationInRegion(), RegionState.GetReference(), MissionRewards, true, true, , MissionDuration);
	
	if (!bNoPOI)
	{
		MissionState.PickPOI(NewGameState);
	}

	if (MissionState.GeneratedMission.Mission.MissionFamily == "GatherSurvivors" ||	MissionState.GeneratedMission.Mission.MissionFamily == "RecoverExpedition")
	{
		// Gather Survivors and Recover Expedition have an optional soldier reward
		RewardTemplate = X2RewardTemplate(StratMgr.FindStrategyElementTemplate('Reward_Soldier'));
		RewardState = RewardTemplate.CreateInstanceFromTemplate(NewGameState);
		RewardState.GenerateReward(NewGameState, ResHQ.GetMissionResourceRewardScalar(RewardState), RegionState.GetReference());
		AddSAVTacticalTagToRewardUnit(NewGameState, RewardState, 'SoldierRewardA');
		MissionState.Rewards.AddItem(RewardState.GetReference());
	}

	if (MissionState.GeneratedMission.Mission.MissionFamily == "GatherSurvivors")
	{
		// Gather Survivors missions also have a second optional soldier to rescue
		RewardTemplate = X2RewardTemplate(StratMgr.FindStrategyElementTemplate('Reward_Soldier'));
		RewardState = RewardTemplate.CreateInstanceFromTemplate(NewGameState);
		RewardState.GenerateReward(NewGameState, ResHQ.GetMissionResourceRewardScalar(RewardState), RegionState.GetReference());
		AddSAVTacticalTagToRewardUnit(NewGameState, RewardState, 'SoldierRewardB');
		MissionState.Rewards.AddItem(RewardState.GetReference());
	}

	return MissionState;
}

static function ResOpPopup(optional XComGameState_MissionSite MissionState)
{
	local XComGameStateHistory History;
	local XComGameState_MissionSite ResOpState;

	if (MissionState == none)
	{
		History = `XCOMHISTORY;

		foreach History.IterateByClassType(class'XComGameState_MissionSite', ResOpState)
		{
			if (ResOpState.Source == 'MissionSource_ResistanceOp' && ResOpState.Available)
			{
				break;
			}
		}
	}

	`HQPRES.UIResistanceOpMission(ResOpState);
}

function XComGameState_MissionCalendar GetMissionCalendar(XComGameState NewGameState)
{
	local XComGameStateHistory History;
	local XComGameState_MissionCalendar CalendarState;

	foreach NewGameState.IterateByClassType(class'XComGameState_MissionCalendar', CalendarState)
	{
		break;
	}

	if(CalendarState == none)
	{
		History = `XCOMHISTORY;
		CalendarState = XComGameState_MissionCalendar(History.GetSingleGameStateObjectForClass(class'XComGameState_MissionCalendar'));
		CalendarState = XComGameState_MissionCalendar(NewGameState.CreateStateObject(class'XComGameState_MissionCalendar', CalendarState.ObjectID));
		NewGameState.AddStateObject(CalendarState);
	}

	return CalendarState;
}

function XComGameState_WorldRegion GetRandomContactedRegion()
{
	local XComGameStateHistory History;
	local XComGameState_WorldRegion RegionState;
	local array<XComGameState_WorldRegion> ValidRegions, AllRegions;

	History = `XCOMHISTORY;

		foreach History.IterateByClassType(class'XComGameState_WorldRegion', RegionState)
	{
			AllRegions.AddItem(RegionState);

			if(RegionState.ResistanceLevel >= eResLevel_Contact)
			{
				ValidRegions.AddItem(RegionState);
			}
		}

	if(ValidRegions.Length > 0)
	{
		return ValidRegions[`SYNC_RAND(ValidRegions.Length)];
	}

	return AllRegions[`SYNC_RAND(AllRegions.Length)];
}

private static function AddSAVTacticalTagToRewardUnit(XComGameState NewGameState, XComGameState_Reward RewardState, name TacticalTag)
{
	local XComGameState_Unit UnitState;

	UnitState = XComGameState_Unit(NewGameState.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));
	if (UnitState != none)
	{
		UnitState.TacticalTag = TacticalTag;
	}
}

static function array<name> GetShuffledRewardDeck(array<RewardDeckEntry> ConfigRewards)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersAlien AlienHQ;
	local int ForceLevel, idx, i, iTemp, iRand;
	local array<name> UnshuffledRewards, ShuffledRewards;
	local name EntryName;

	History = `XCOMHISTORY;
	AlienHQ = XComGameState_HeadquartersAlien(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersAlien'));
	ForceLevel = AlienHQ.GetForceLevel();

	// Add all applicable rewards to unshuffled deck
	for(idx = 0; idx < ConfigRewards.Length; idx++)
	{
		if(ConfigRewards[idx].ForceLevelGate <= ForceLevel)
		{
			for(i = 0; i < ConfigRewards[idx].Quantity; i++)
			{
				UnshuffledRewards.AddItem(ConfigRewards[idx].RewardName);
			}
		}
	}

	// Shuffle the deck
	iTemp = UnshuffledRewards.Length;
	for(idx = 0; idx < iTemp; idx++)
	{
		iRand = `SYNC_RAND_STATIC(UnshuffledRewards.Length);
		EntryName = UnshuffledRewards[iRand];
		UnshuffledRewards.Remove(iRand, 1);
		ShuffledRewards.AddItem(EntryName);
	}

	return ShuffledRewards;
}