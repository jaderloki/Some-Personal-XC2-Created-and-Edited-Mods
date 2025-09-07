//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_RaiderFactionBases.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_RaiderFactionBases extends X2DownloadableContentInfo;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame()
{}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{
	class'XComGameState_RaiderBaseManager'.static.CreateBaseManager(StartState);
}

/// This method is run when the player loads a saved game directly into Strategy while this DLC is installed
/// </summary>
static event OnLoadedSavedGameToStrategy()
{
	class'XComGameState_RaiderBaseManager'.static.CreateBaseManager();
}

// Start Issue #157
/// <summary>
/// Called from XComGameState_Missionsite:SetMissionData
/// lets mods add SitReps with custom spawn rules to newly generated missions
/// Advice: Check for present Strategy game if you dont want this to affect TQL/Multiplayer/Main Menu 
/// Example: If (`HQGAME  != none && `HQPC != None && `HQPRES != none) ...
/// </summary>
static function PostSitRepCreation(out GeneratedMissionData GeneratedMission, optional XComGameState_BaseObject SourceObject)
{
	local XComGameState_Continent Continent;
	local XComGameState_RaiderBase Base;
	local XComGameState_MissionSite MissionState;
	local XComGameStateHistory History;
	local XComGameState_HeadquartersResistance ResHQ;
	local float AppearanceChance;
	local int i;
	local XComGameState_RaiderBase Entry;
	local array<XComGameState_RaiderBase> UnshuffledBases, ShuffledBases;
	local int iTemp, idx, iRand;
	History = `XCOMHistory;
	ResHQ = XComGameState_HeadquartersResistance(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersResistance'));
	If (`HQGAME  != none && `HQPC != None && `HQPRES != none) // we're in strategy
	{
		MissionState = XComGameState_MissionSite(SourceObject);
		if(MissionState.GetMissionSource().DataName == 'MissionSource_RaiderAmbush' || MissionState.GetMissionSource().DataName == 'MissionSource_RaiderBaseTakedown')
		{
			// ignore these missions
			 return;
		}
		Continent = XComGameState_Continent(History.GetGameStateForObjectID(MissionState.Continent.ObjectID));
	
		if(Continent == none)
		{
            Continent = XComGameState_WorldRegion(History.GetGameStateForObjectID(MissionState.Region.ObjectID)).GetContinent(); 
		}
		if(ResHQ.NumMonths > 1) // is not march/early april
		{
			if(Continent.GetResistanceLevel() > 0) //is open
			{
				UnshuffledBases = class'XComGameState_RaiderBaseManager'.static.GetBaseManager().GetBasesForContinent(Continent);

				// Shuffle the bases because the first one to roll is always going to have the better chance
				iTemp = UnshuffledBases.Length;
				for(idx = 0; idx < iTemp; idx++)
				{
				  iRand = `SYNC_RAND_STATIC(UnshuffledBases.Length);
				  Entry = UnshuffledBases[iRand];
				  UnshuffledBases.Remove(iRand, 1);
				  ShuffledBases.AddItem(Entry);
				}
				foreach ShuffledBases(Base)
				{
					//`log("Raider Base " $ Base.GetDisplayName() $ " is now checking to see if we're active.");
					if(Base.IsActive() && !class'X2Helpers_RM_RaiderBases'.static.HasContestingTags(MissionState, Base.GetDef().SitrepName) )
					 // does not already exist in the sitrep and base is active
					{
						AppearanceChance = Base.GetAppearanceChance(); // allows for modifications of the base config chance

						if(ResHQ.NumMonths < 4)  // must be around may for full chance 
						{
							AppearanceChance /= 2;
						}
						`log("Raider Base now rolling with appearance chance of " $ AppearanceChance);
						if(`SYNC_RAND_STATIC(100) < AppearanceChance)
						{
							GeneratedMission.SitReps.AddItem(Base.GetDef().SitrepName);
							break; // only do one added sitrep
						}
					}
				}
			}
		}
	}
}


exec function LocateRaiderBases(bool DisobeyRules)
{
	local XComGameState NewGameState;
	local XComGameState_RaiderBaseManager BaseMgr;
	local array<XComGameState_RaiderBase> Bases;
	local XComGameState_RaiderBase base;
	local XComGameState_WorldRegion RegionState;
	local XComGameStateHistory History;
	local array<XComGameState_WorldRegion> AllRegions;
	local bool AlteredState;
	History = `XCOMHISTORY;
	AllRegions.Length = 0;
	AlteredState = false;
	foreach History.IterateByClassType(class'XComGameState_WorldRegion', RegionState)
	{
		AllRegions.AddItem(RegionState);
	}

	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Locating RaideR bases");
	if (NewGameState != none)
	{
		// so if we got here, this means that we know there's at least one base in the given continent that we can use for this
		// we need to save two things: our action state and the base we pick: we store our reference to the base in the action state
		BaseMgr = class'XComGameState_RaiderBaseManager'.static.GetBaseManager();
		if(BaseMgr != none)
		{

			foreach AllRegions(RegionState)
			{
				Bases = BaseMgr.GetBasesForContinent(RegionState.GetContinent());
				if (Bases.Length > 0)
				{
					foreach Bases(base)
					{	

							if(DisobeyRules && base.GetStatus() != eRB_Destroyed)
							{
								base = XComGameState_RaiderBase(NewGameState.ModifyStateObject(class'XComGameState_RaiderBase', base.GetReference().ObjectID));
								Base.bWaitingForCovertAction = false;
								Base.UpdateStatus(eRB_ReadyToAssault);
								AlteredState = true;
							}
							else if(RegionState.ResistanceLevel > 0 && !base.bWaitingForCovertAction && base.GetStatus() != eRB_Destroyed)
							{
								base = XComGameState_RaiderBase(NewGameState.ModifyStateObject(class'XComGameState_RaiderBase', base.GetReference().ObjectID));
								Base.bWaitingForCovertAction = false;
								Base.UpdateStatus(eRB_ReadyToAssault);
								AlteredState = true;
							}
						
					}
				}	
			}		
		}	
	}
	if(AlteredState){
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	}
	else{
		History.CleanupPendingGameState(NewGameState);
	}
}


exec function PrintRaiderBaseStates()
{

	local XComGameStateHistory History;
	local XComGameState_RaiderBase base;

	History = `XCOMHISTORY;

	foreach History.IterateByClassType(class'XComGameState_RaiderBase', Base)
	{
		if(base != none)
		{
		
			class'Helpers'.static.OutputMsg("Raider Base state " $ Base.GetReference().ObjectID $ " is" $ base.GetDisplayName() $ " with the current status of " $ Base.GetStatus());
			if(Base.bWaitingForCovertAction)
			{
				class'Helpers'.static.OutputMsg("Raider base state is waiting on covert action");
			}
			else
			{
				class'Helpers'.static.OutputMsg("Raider base state is NOT waiting on covert action");
			}
		}
	}

}

exec function FixWaitingBaseStates(bool DestroyBases = false)
{
	local XComGameStateHistory History;
	local XComGameState_RaiderBase base;
	local XComGameState NewGameState;
	History = `XCOMHISTORY;

	foreach History.IterateByClassType(class'XComGameState_RaiderBase', Base)
	{
		if(base != none && base.bWaitingForCovertAction && base.GetStatus() == eRB_Discovered)
		{
			NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Locating RaideR bases");
			Base = XComGameState_RaiderBase(NewGameState.ModifyStateObject(class'XComGameState_RaiderBase', Base.GetReference().ObjectID));
			Base.bWaitingForCovertAction = false;
			Base.UpdateStatus(eRB_ReadyToAssault);
			`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
		}
		if(DestroyBases && base != none && base.bWaitingForCovertAction && base.GetStatus() == eRB_ReadyToAssault)
		{
			NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Locating RaideR bases");
			Base = XComGameState_RaiderBase(NewGameState.ModifyStateObject(class'XComGameState_RaiderBase', Base.GetReference().ObjectID));
			Base.bWaitingForCovertAction = false;
			Base.UpdateStatus(eRB_Destroyed);
			`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
		}
	}


}

static event OnPostTemplatesCreated()
{
	EditQuestItemTemplates();

}

static function EditQuestItemTemplates()
{
	local X2ItemTemplateManager ItemTemplateManager;

	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	UpdateQuestItemTemplate(ItemTemplateManager, 'DecryptionAlgorithms', "RM_CovertOp_DataRetrieval");
	UpdateQuestItemTemplate(ItemTemplateManager, 'AccessCodes', "RM_CovertOp_DataRetrieval");
	UpdateQuestItemTemplate(ItemTemplateManager, 'CollaboratorDatabase', "RM_CovertOp_DataRetrieval");
	UpdateQuestItemTemplate(ItemTemplateManager, 'ArchivalFootage', "RM_CovertOp_DataRetrieval");
	UpdateQuestItemTemplate(ItemTemplateManager, 'EquipmentAllocations', "RM_CovertOp_DataRetrieval");
	UpdateQuestItemTemplate(ItemTemplateManager, 'ChipCensusData', "RM_CovertOp_DataRetrieval");
	UpdateQuestItemTemplate(ItemTemplateManager, 'TroopMovements', "RM_CovertOp_DataRetrieval");
	UpdateQuestItemTemplate(ItemTemplateManager, 'EncryptionKeys', "RM_CovertOp_DataRetrieval");
	UpdateQuestItemTemplate(ItemTemplateManager, 'SensorData', "RM_CovertOp_DataRetrieval");
	UpdateQuestItemTemplate(ItemTemplateManager, 'DissectionReport', "RM_CovertOp_DataRetrieval");
	UpdateQuestItemTemplate(ItemTemplateManager, 'DiagnosticReports', "RM_CovertOp_DataRetrieval");
	UpdateQuestItemTemplate(ItemTemplateManager, 'ExposureTestingData', "RM_CovertOp_DataRetrieval");

}


static function UpdateQuestItemTemplate(X2ItemTemplateManager ItemTemplateMgr, name QuestItem, string BaseItem)
{
	local array<X2ItemTemplate> ItemTemplates;
	local X2QuestItemTemplate QuestTemplate;
	local X2ItemTemplate ItemTemplate;

	FindItemTemplateAllDifficulties(QuestItem, ItemTemplates, ItemTemplateMgr);

	foreach ItemTemplates(ItemTemplate)
	{
		QuestTemplate = X2QuestItemTemplate(ItemTemplate);
		if(QuestTemplate != none)
		{
			QuestTemplate.MissionType.AddItem(BaseItem);
			QuestTemplate.RewardType.AddItem('Reward_None'); // covert action support
		}
	}


}


//retrieves all difficulty variants of a given item template
static function FindItemTemplateAllDifficulties(name DataName, out array<X2ItemTemplate> ItemTemplates, optional X2ItemTemplateManager ItemTemplateMgr)
{
	local array<X2DataTemplate> DataTemplates;
	local X2DataTemplate DataTemplate;
	local X2ItemTemplate ItemTemplate;

	if(ItemTemplateMgr == none)
		ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	ItemTemplateMgr.FindDataTemplateAllDifficulties(DataName, DataTemplates);
	ItemTemplates.Length = 0;
	foreach DataTemplates(DataTemplate)
	{
		ItemTemplate = X2ItemTemplate(DataTemplate);
		if( ItemTemplate != none )
		{
			ItemTemplates.AddItem(ItemTemplate);
		}
	}
}


/// <summary>
/// Called when the player completes a mission while this DLC / Mod is installed.
/// </summary>
static event OnPostMission()
{
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameStateHistory History; 
	local XComGameState NewGameState;
	local StateObjectReference SoldierRef;
	local XComGameState_Unit UnitState;
	local ReserveSquad NextSquad;
	local UnitValue SoldierValue;
	local float value;
	History = `XCOMHistory;
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Checking To Do Covert Operation cleanup");
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));

	foreach XComHQ.AllSquads(NextSquad) // for most missions, this is the same as XComHQ.Squad. For Avenger Assault and other missions, this grabs everybody chosen for a mission.
	{
		foreach NextSquad.SquadMembers(SoldierRef)
		{
			UnitState = XComGameState_Unit(History.GetGameStateForObjectID(SoldierRef.ObjectID));
			UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', UnitState.ObjectID));
			if(UnitState.GetUnitValue('IsCovertOp', SoldierValue))
			{
				value = SoldierValue.fValue;
				if(value > 0)
				{
					UnitState.SetUnitFloatValue('IsCovertOp', 0, eCleanup_BeginTactical);
				}
		}
		}

		

	}
	`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
}



// Start Issue #136
/// <summary>
/// Called from XComGameState_MissionSite:CacheSelectedMissionData
/// Encounter Data is modified immediately prior to being added to the SelectedMissionData, ported from LW2
/// </summary>
static function PostEncounterCreation(out name EncounterName, out PodSpawnInfo Encounter, int ForceLevel, int AlertLevel, optional XComGameState_BaseObject SourceObject)
{
	local XComGameState_MissionSite MissionState;
	local name SitRepName;
	local RaiderBaseDef BaseDef, ValidBaseDef, EmptyDef;
	MissionState = XComGameState_MissionSite(SourceObject);
	ValidBaseDef = EmptyDef;
	if(MissionState == none) //no valid object, no pod alteration
		return; 

	switch(MissionState.GetMissionSource().DataName) //this is only for altering our covert op missions
	{
		case 'MissionSource_RaiderAmbush':
		case 'MissionSource_RaiderBaseTakedown':
			break;
		default:
			return;
	}

	foreach class'X2Helpers_RM_Raiderbases'.default.BaseDefinitions(BaseDef)
	{

		foreach MissionState.GeneratedMission.Sitreps (SitrepName)
		{
			if(SitrepName == BaseDef.SitrepName)
			{
				ValidBaseDef = BaseDef;
				break;
			}
		}

		if(ValidBaseDef != EmptyDef) 
		{
			break;
		}
	}
	`log("RFB found following base def to use for raider ambush: " $ ValidBaseDef.DisplayName);
	switch (EncounterName) //don't alter these skulljack pods.
	{
		case 'LoneAvatar':
		case 'LoneCodex':
			return;
		default:
			break;
	}

	if (InStr (EncounterName,"PROTECTED") != -1) //don't alter any specially marked pods
	{
		return;
	}

	if(InStr(EncounterName, "CHOSEN") != -1) //don't alter the Chosen
	{
		return;
	}

	if(InStr(EncounterName, "CivilianGroup") != -1) // don't alter civilians
	{
		return;
	}
	if(InStr(EncounterName, "Dummy_Bos") != -1) // strong pods get altered appropriately
	{
		class'X2Helpers_RM_RaiderBases'.static.ProcessEncounter(EncounterName, Encounter, ValidBaseDef, MissionState, 3);
	}
	else if(InStr(EncounterName, "Dummy_Str") != -1) // strong pods get altered appropriately
	{
		class'X2Helpers_RM_RaiderBases'.static.ProcessEncounter(EncounterName, Encounter, ValidBaseDef, MissionState, 2);
	}
	else if (InStr(EncounterName, "Dummy_Nor") != -1)
	{
		class'X2Helpers_RM_RaiderBases'.static.ProcessEncounter(EncounterName, Encounter, ValidBaseDef, MissionState, 1);
	}
	else if (InStr(EncounterName, "Dummy_Wea") != -1) // these are weak pods if the above two didn't trigger
	{
		class'X2Helpers_RM_RaiderBases'.static.ProcessEncounter(EncounterName, Encounter, ValidBaseDef, MissionState, 0);
	}
}

exec function CreateRaiderAmbushTest()
{
	local XComGameState_MissionSiteRaiderAmbush MissionState;
	local XComGameState_WorldRegion RegionState;
	local XComGameState_Reward MissionRewardState;
	local X2RewardTemplate RewardTemplate;
	local X2StrategyElementTemplateManager StratMgr;
	local X2MissionSourceTemplate MissionSource;
	local array<XComGameState_Reward> MissionRewards;
	local XComGameState NewGameState;
	local array<XComGameState_WorldRegion> ContactRegions;
	local XComGameState_RaiderBase Base, SelectedBase;
	local array<XComGameState_RaiderBase> Bases, ValidBases;
	local XComGameState_Continent Continent;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Callback Enable Genji Content");

	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();


	foreach `XCOMHistory.IterateByClassType(class'XComGameState_WorldRegion', RegionState)
	{

			ContactRegions.AddItem(RegionState);
			
	}
	RegionState = ContactRegions[`SYNC_RAND_STATIC(ContactRegions.Length)];
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

	MissionRewards.Length = 0;
	RewardTemplate = X2RewardTemplate(StratMgr.FindStrategyElementTemplate('Reward_None'));
	MissionRewardState = RewardTemplate.CreateInstanceFromTemplate(NewGameState);
	MissionRewardState.GenerateReward(NewGameState, , RegionState.GetReference());
	MissionRewards.AddItem(MissionRewardState);

	MissionState = XComGameState_MissionSiteRaiderAmbush(NewGameState.CreateNewStateObject(class'XComGameState_MissionSiteRaiderAmbush'));
	MissionSource = X2MissionSourceTemplate(StratMgr.FindStrategyElementTemplate('MissionSource_RaiderAmbush'));
	MissionState.BuildMission(MissionSource, RegionState.GetRandom2DLocationInRegion(), RegionState.GetReference(), MissionRewards);
	//MissionState.ManualDifficultySetting =  MissionSource.GetMissionDifficultyFn(MissionState) + default.Difficulty_Mod;
	MissionState.ResistanceFaction = class'X2StrategyElement_XPACKMissionSources'.static.SelectRandomResistanceOpFaction().GetReference();
	MissionState.GeneratedMission.SitReps.AddItem(SelectedBase.GetSitrep());
	//RewardState.RewardObjectReference = MissionState.GetReference();


	XComGameInfo(class'Engine'.static.GetCurrentWorldInfo().Game).GameRuleset.SubmitGameState(NewGameState);
	MissionState.SelectSquad();

}