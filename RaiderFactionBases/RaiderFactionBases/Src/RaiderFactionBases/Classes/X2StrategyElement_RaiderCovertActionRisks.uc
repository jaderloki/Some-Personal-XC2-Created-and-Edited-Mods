class X2StrategyElement_RaiderCovertActionRisks extends X2StrategyElement_DefaultCovertActionRisks
	dependson(XComGameState_RaiderBase);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> CovertActions;
	CovertActions.AddItem(CreateRaiderAmbushRiskTemplate());

	return CovertActions;
}


//---------------------------------------------------------------------------------------
// AMBUSH
//---------------------------------------------------------------------------------------
static function X2DataTemplate CreateRaiderAmbushRiskTemplate()
{
	local X2CovertActionRiskTemplate Template;

	`CREATE_X2TEMPLATE(class'X2CovertActionRiskTemplate', Template, 'CovertActionRisk_RaiderAmbush');
	//Template.IsRiskAvailableFn = IsRaiderFactionAvailable;
	// no need to check for risk availablity: once the risk fires we can just use the action state status to double check
	Template.ApplyRiskFn = CreateRaiderAmbushMission;
	Template.bBlockOtherRisks = true;

	return Template;
}


static function CreateRaiderAmbushMission(XComGameState NewGameState, XComGameState_CovertAction ActionState, optional StateObjectReference TargetRef)
{
	local XComGameState_MissionSiteRaiderAmbush MissionState;
	local XComGameState_WorldRegion RegionState;
	local XComGameState_Reward RewardState;
	local X2StrategyElementTemplateManager StratMgr;
	local X2RewardTemplate RewardTemplate;
	local X2MissionSourceTemplate MissionSource;
	local array<XComGameState_Reward> MissionRewards;
	local XComGameState_Continent Continent;
	local XComGameState_RaiderBase Base, SelectedBase;
	local array<XComGameState_RaiderBase> Bases, ValidBases;

	RegionState = ActionState.GetWorldRegion();
	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	MissionSource = X2MissionSourceTemplate(StratMgr.FindStrategyElementTemplate('MissionSource_RaiderAmbush'));
	Continent = RegionState.GetContinent();
	`log("RFB testing that we have a region: " $ RegionState.GetMyTemplateName());
	`log("RFB testing that we have a continent: " $ Continent.GetMyTemplateName());
	Bases = class'XComGameState_RaiderBaseManager'.static.GetBaseManager().GetBasesForContinent(Continent);
	//Bases =  class'XComGameState_RaiderBaseManager'.static.GetBaseManager().GetAllBases(); // REMOVE ME AFTER DONE TESTING
	foreach Bases(Base)
	{
		`log("RFB testing that we have a base: " $ Base.GetDisplayName());
		if(Base != none && Base.GetDef().WeakBucket != '') // this at the least should be valid
		{
			`log("RFB: Found a valid base for raider ambush mission");
			`log(Base.GetDisplayName());
			ValidBases.AddItem(Base);
		}
		
	}
	if(ValidBases.length < 1)
	{
		`log("RFB ERROR: no valid base was found for raider ambush mission: trying fallback");
		
		Bases =  class'XComGameState_RaiderBaseManager'.static.GetBaseManager().GetAllBases(); 
		foreach Bases(Base)
		{
			`log("RFB testing that we have a base: " $ Base.GetDisplayName());
			if(Base != none && Base.GetDef().WeakBucket != '') // this at the least should be valid
			{
				`log("RFB: Found a valid base for raider ambush mission");
				`log(Base.GetDisplayName());
				ValidBases.AddItem(Base);
			}
		
		}
		if(ValidBases.length < 1)
		{
		`log("RFB ERROR: no valid base was found for raider ambush mission: aborting mission");
		return; // abort applying risk if there's no raider faction
		}
		
	}
	else if (ValidBases.length > 1)
	{
		SelectedBase = ValidBases[`SYNC_RAND_STATIC(ValidBases.Length)];
	}
	else if (SelectedBase == none)
	{
		SelectedBase = ValidBases[0];
	}


	ActionState.bAmbushed = true; // Flag the Action as being ambushed so it cleans up properly and doesn't give rewards

	ActionState.bNeedsAmbushPopup = true; // Set up for the Ambush popup

	MissionRewards.Length = 0;
	RewardTemplate = X2RewardTemplate(StratMgr.FindStrategyElementTemplate('Reward_None'));
	RewardState = RewardTemplate.CreateInstanceFromTemplate(NewGameState);
	MissionRewards.AddItem(RewardState);
	`log("RFB has the following action state template" $ ActionState.GetMyTemplateName());
	if(ActionState.GetMyTemplateName() != 'CovertAction_RaiderBaseAction')
	{
		MissionSource = X2MissionSourceTemplate(StratMgr.FindStrategyElementTemplate('MissionSource_RaiderAmbush'));
		ActionState.AmbushMissionSource = 'MissionSource_RaiderAmbush'; // make sure it's looking for right mission source
	}
	else
	{
		MissionSource = X2MissionSourceTemplate(StratMgr.FindStrategyElementTemplate('MissionSource_RaiderBaseTakedown'));
		ActionState.AmbushMissionSource = 'MissionSource_RaiderBaseTakedown'; // make sure it's looking for right mission source
	}
	MissionState = XComGameState_MissionSiteRaiderAmbush(NewGameState.CreateNewStateObject(class'XComGameState_MissionSiteRaiderAmbush'));
	MissionState.CovertActionRef = ActionState.GetReference();
	

		MissionState.BuildMission(MissionSource, RegionState.GetRandom2DLocationInRegion(), RegionState.GetReference(), MissionRewards, true);
		MissionState.ResistanceFaction = ActionState.Faction;
		MissionState.GeneratedMission.SitReps.AddItem(SelectedBase.GetSitrep()); // adds our chosen sitrep to the mission, this kicks in *before* the shadow chamber would check the mission
	
}
