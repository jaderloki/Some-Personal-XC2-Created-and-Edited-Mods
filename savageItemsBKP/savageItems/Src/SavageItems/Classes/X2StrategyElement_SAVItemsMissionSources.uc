class X2StrategyElement_SAVItemsMissionSources extends X2StrategyElement_DefaultMissionSources config(GameData);

/*
static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> MissionSources;

	MissionSources.AddItem(CreateSAVSupplyRaidTemplate());

	return MissionSources;
}


// A copy of SUPPLY RAID so we can get around the bug with the mission spawning with the wrong mission type (chosen avenger assault)
//---------------------------------------------------------------------------------------
static function X2DataTemplate CreateSAVSupplyRaidTemplate()
{
	local X2MissionSourceTemplate Template;

	`CREATE_X2TEMPLATE(class'X2MissionSourceTemplate', Template, 'SAVSupplyRaidTemplate');
	Template.bIncreasesForceLevel = false;
	Template.bShowRewardOnPin = true;
	Template.bSkipRewardsRecap = true;
	Template.bDisconnectRegionOnFail = true;
	Template.OnSuccessFn = SavSupplyRaidOnSuccess;
	Template.OnFailureFn = SavSupplyRaidOnFailure;
	Template.OnExpireFn = SavSupplyRaidOnExpire;
	Template.OverworldMeshPath = "UI_3D.Overwold_Final.SupplyRaid_AdvConvoy";
	Template.MissionImage = "img:///UILibrary_StrategyImages.X2StrategyMap.Alert_Supply_Raid";
	Template.GetMissionDifficultyFn = GetMissionDifficultyFromMonth;
	Template.CreateMissionsFn = SavCreateSupplyRaidMission;
	Template.SpawnMissionsFn = SavSpawnSupplyRaidMission;
	Template.MissionPopupFn = SavSupplyRaidPopup;
	Template.GetOverworldMeshPathFn = SavGetSupplyRaidOverworldMeshPath;
	Template.WasMissionSuccessfulFn = OneStrategyObjectiveCompleted;
	Template.GetMissionRegionFn = GetCalendarMissionRegion;
	Template.GetSitRepsFn = SavGetSupplyRaidSitReps;

	return Template;
}
static function string SavGetSupplyRaidOverworldMeshPath(XComGameState_MissionSite MissionState)
{
	local name ObjectiveName;

	ObjectiveName = MissionState.GeneratedMission.Mission.MissionName;
	
	switch(ObjectiveName)
	{
	case 'SupplyLineRaidATT':
		return "UI_3D.Overwold_Final.SupplyRaid_AdvTroopTrans";
	case 'SupplyLineRaidTrain':
		return "UI_3D.Overwold_Final.SupplyRaid_AdvTrain";
	case 'SupplyLineRaidConvoy':
		return "UI_3D.Overwold_Final.SupplyRaid_AdvConvoy";
	default:
		break;
	}

	return "";
}

static function SavSupplyRaidOnSuccess(XComGameState NewGameState, XComGameState_MissionSite MissionState)
{
	GiveRewards(NewGameState, MissionState);
	SpawnPointOfInterest(NewGameState, MissionState);
	MissionState.RemoveEntity(NewGameState);
	class'XComGameState_HeadquartersResistance'.static.RecordResistanceActivity(NewGameState, 'ResAct_SupplyRaidsCompleted');
}

static function SavSupplyRaidOnFailure(XComGameState NewGameState, XComGameState_MissionSite MissionState)
{
	if(!IsInStartingRegion(MissionState))
	{
		LoseContactWithMissionRegion(NewGameState, MissionState, true);
	}
	
	MissionState.RemoveEntity(NewGameState);
	class'XComGameState_HeadquartersResistance'.static.DeactivatePOI(NewGameState, MissionState.POIToSpawn);
	class'XComGameState_HeadquartersResistance'.static.RecordResistanceActivity(NewGameState, 'ResAct_SupplyRaidsFailed');
}

static function SavSupplyRaidOnExpire(XComGameState NewGameState, XComGameState_MissionSite MissionState)
{
	if(!IsInStartingRegion(MissionState))
	{
		LoseContactWithMissionRegion(NewGameState, MissionState, false);
		`XEVENTMGR.TriggerEvent('SkippedMissionLostContact', , , NewGameState);
	}
	
	class'XComGameState_HeadquartersResistance'.static.DeactivatePOI(NewGameState, MissionState.POIToSpawn);
	class'XComGameState_HeadquartersResistance'.static.RecordResistanceActivity(NewGameState, 'ResAct_SupplyRaidsFailed');
}

static function SavCreateSupplyRaidMission(XComGameState NewGameState, int MissionMonthIndex)
{
	local XComGameState_Reward RewardState;
	local X2RewardTemplate RewardTemplate;
	local X2StrategyElementTemplateManager StratMgr;
	local array<XComGameState_Reward> MissionRewards;
	local StateObjectReference RegionRef;
	local Vector2D v2Loc;
	local XComGameState_MissionSite MissionState;
	local X2MissionSourceTemplate MissionSource;
	local XComGameState_MissionCalendar CalendarState;

	CalendarState = GetMissionCalendar(NewGameState);
	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	RewardTemplate = X2RewardTemplate(StratMgr.FindStrategyElementTemplate('Reward_None'));

	MissionRewards.Length = 0;
	RewardState = RewardTemplate.CreateInstanceFromTemplate(NewGameState);
	MissionRewards.AddItem(RewardState);
	
	MissionSource = X2MissionSourceTemplate(StratMgr.FindStrategyElementTemplate('MissionSource_SAVSupplyRaid'));
	
	// Build Mission, region and loc will be determined later so defer computing biome/plot data
	MissionState = XComGameState_MissionSite(NewGameState.CreateNewStateObject(class'XComGameState_MissionSite'));
	MissionState.BuildMission(MissionSource, v2Loc, RegionRef, MissionRewards, false, false, , , , , false);
	CalendarState.CurrentMissionMonth[MissionMonthIndex].Missions.AddItem(MissionState.GetReference());

	CalendarState.CreatedMissionSources.AddItem(MissionSource.DataName);
}

static function SavSpawnSupplyRaidMission(XComGameState NewGameState, int MissionMonthIndex)
{
	local XComGameState_MissionSite MissionState;
	local XComGameState_WorldRegion RegionState;
	local XComGameState_Reward RewardState;
	local array<XComGameState_WorldRegion> PossibleRegions;
	local float MissionDuration;
	local int iReward;
	local XComGameState_MissionCalendar CalendarState;
	local XComGameState_HeadquartersResistance ResHQ;

	CalendarState = GetMissionCalendar(NewGameState);

	// Calculate Mission Expiration timer (same for each op)
	MissionDuration = float((18 + `SYNC_RAND_STATIC(26 - 18 + 1)) * 3600);

	// Spawn the supply raid from the current mission event		
	MissionState = XComGameState_MissionSite(NewGameState.ModifyStateObject(class'XComGameState_MissionSite', CalendarState.CurrentMissionMonth[MissionMonthIndex].Missions[0].ObjectID));
	MissionState.TimeUntilDespawn = MissionDuration;
	MissionState.Available = true;
	MissionState.Expiring = true;
	MissionState.TimerStartDateTime = `STRATEGYRULES.GameTime;
	MissionState.SetProjectedExpirationDateTime(MissionState.TimerStartDateTime);
	PossibleRegions = MissionState.GetMissionSource().GetMissionRegionFn(NewGameState);
	RegionState = PossibleRegions[0];
	MissionState.Region = RegionState.GetReference();
	MissionState.Location = RegionState.GetRandomLocationInRegion();

	// Generate Rewards
	ResHQ = class'UIUtilities_Strategy'.static.GetResistanceHQ();
	for(iReward = 0; iReward < MissionState.Rewards.Length; iReward++)
	{
		RewardState = XComGameState_Reward(NewGameState.ModifyStateObject(class'XComGameState_Reward', MissionState.Rewards[iReward].ObjectID));
		RewardState.GenerateReward(NewGameState, ResHQ.GetMissionResourceRewardScalar(RewardState), MissionState.Region);
	}

	MissionState.SetMissionData(MissionState.GetRewardType(), false, 0);
	`HQPRES.StrategyMap2D.GetMapItem(MissionState, NewGameState).InitStatic3DUI(MissionState);

	MissionState.PickPOI(NewGameState);

	// Set Popup flag
	CalendarState.MissionPopupSources.AddItem(MissionState.Source);
}

static function SavSupplyRaidPopup(optional XComGameState_MissionSite MissionState)
{
	`HQPRES.UISupplyRaidMission();
}

static function array<name> SavGetSupplyRaidSitReps(XComGameState_MissionSite MissionState)
{
	local array<name> ActiveSitreps;

	ActiveSitreps.Length = 0;

	// Only sitreps on old supply raids
	if(MissionState.GeneratedMission.Mission.MissionFamily == "SupplyLineRaid" && `SYNC_RAND_STATIC(100) < 50)
	{
		ActiveSitreps = GetSitrepsGeneric(MissionState);
	}

	return ActiveSitreps;
}
*/