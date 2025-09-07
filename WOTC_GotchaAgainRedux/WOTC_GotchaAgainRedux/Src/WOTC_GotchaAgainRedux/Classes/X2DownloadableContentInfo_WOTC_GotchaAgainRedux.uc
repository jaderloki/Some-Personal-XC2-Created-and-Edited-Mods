////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    16/10/23    01:45
////////////////////////////////////////////////////////////////////////////////////////////////////

class X2DownloadableContentInfo_WOTC_GotchaAgainRedux extends X2DownloadableContentInfo;

`include(WOTC_GotchaAgainRedux\Src\ModConfigMenuAPI\MCM_API_CfgHelpers.uci)

static event OnLoadedSavedGame(){}
static event InstallNewCampaign(XComGameState StartState){}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  OPTC
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

static event OnPostTemplatesCreated()
{
    ModifyTemplateDetectionRanges();
}

//THIS FUNCTIONALITY IS FROM PEEK FROM CONCEALMENTS UISL MADE INTO OPTC FOR EASE OF USE AND SO IT GETS DONE ONLY AT STARTUP
static function ModifyTemplateDetectionRanges()
{
	local X2CharacterTemplateManager    CharMgr;
	local X2CharacterTemplate			CharTemplate;

	local array<X2DataTemplate>			AllTemplates;
	local X2DataTemplate				DataTemplate;

	local array<name>					AllTemplateNames;
	local name							TemplateName;

	//CHECK MASTER TOGGLE, BAIL IF PFC IS DISABLED
	if (`GETMCMVAR(DisablePFC)) { return; }

	CharMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
	CharMgr.GetTemplateNames(AllTemplateNames);

	foreach AllTemplateNames(TemplateName)
	{
		CharMgr.FindDataTemplateAllDifficulties(TemplateName, AllTemplates);
		foreach AllTemplates(DataTemplate)
		{
			CharTemplate = X2CharacterTemplate(DataTemplate);
			if (CharTemplate != None)
			{
                if (CharTemplate.CharacterBaseStats[eStat_DetectionRadius] >= `GETMCMVAR(MinEligibleDetectionRange) )
                {
                    //`LOG("Buffing detection range of " @ CharTemplate.DataName);
                    CharTemplate.CharacterBaseStats[eStat_DetectionRadius] += `GETMCMVAR(ExtraDetectionRange);
                }
			}
		}
	}
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  COMMON FUNCTIONS
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

static function bool IsModLoaded(name ModName)
{
    local XComOnlineEventMgr EventManager;
    local int i;

    EventManager = XComOnlineEventMgr(class'Engine'.static.GetEngine().OnlineEventManager);

    for(i = 0; i < EventManager.GetNumDLC(); i++)
    {
        if(EventManager.GetDLCNames(i) == ModName)
        {
            return true;
        }
    }
    return false;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  CONSOLE COMMAND HELPERS
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

exec function RustyFix_GA_PrintTileWorldEffectNames()
{
	local XComGameState NewGameState;
    local XComGameState_WorldEffectTileData TileDataStateObject;
    local array<name> EffectNames;
    local name EffectName;

	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("hunting for tile effects");

    class'Helpers'.static.OutputMsg("Tile World Effect Name Hunting Begins");

    //ADD NAMES TO AN ARRAY IF NOT ALREADY IN IT TO AVOID REPEATS
	foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_WorldEffectTileData', TileDataStateObject)
	{
        if(Effectnames.Find(TileDataStateObject.WorldEffectClassName) == INDEX_NONE)
        {
            EffectNames.AddItem(TileDataStateObject.WorldEffectClassName);
        }
    }

    //OUTPUT NAMES
    foreach EffectNames(EffectName)
    {
        class'Helpers'.static.OutputMsg("Found with Nameof:" @ EffectName);
    }

    class'Helpers'.static.OutputMsg("Tile World Effect Name Hunting Over");

    `TACTICALRULES.SubmitGameState(NewGameState);
}

exec function RustyFix_UFE_GAR_RemoveAllUnitFlags()
{
    local UIUnitFlagManager_GA UIFlgMgr;

    UIFlgMgr = UIUnitFlagManager_GA(`PRES.m_kUnitFlagManager);
    UIFlgMgr.RemoveAllFlags();

    class'Helpers'.static.OutputMsg(`SHOWVAR(UIFlgMgr.m_arrFlags.length) @"|" @ `SHOWVAR(UIFlgMgr.m_arrSimpleFlags.length));
}

exec function RustyFix_UFE_GAR_RemakeAllUnitFlags()
{
    local UIUnitFlagManager_GA UIFlgMgr;

    UIFlgMgr = UIUnitFlagManager_GA(`PRES.m_kUnitFlagManager);
    UIFlgMgr.AddAllFlags();

    UIFlgMgr.Update();

    class'Helpers'.static.OutputMsg(`SHOWVAR(UIFlgMgr.m_arrFlags.length) @"|" @ `SHOWVAR(UIFlgMgr.m_arrSimpleFlags.length));
}

exec function RustyFix_UFE_GAR_ForceFlagRefresh()
{
    RustyFix_UFE_GAR_RemoveAllUnitFlags();
    RustyFix_UFE_GAR_RemakeAllUnitFlags();
}

exec function ForceCompleteObjectiveGay()
{
	local XComGameStateHistory History;
	local XComGameState_Objective ObjectiveState, ObjectiveStateMain;
	local XComGameState NewGameState;

	History = `XCOMHISTORY;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("CHEAT: Force Complete Objective");

	foreach History.IterateByClassType(class'XComGameState_Objective', ObjectiveState){
		iterateObjectives(ObjectiveState, NewGameState, "START");
	}

	if (NewGameState.GetNumGameStateObjects() > 0){
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	}else{
		History.CleanupPendingGameState(NewGameState);
	}
}

exec function endBattleNOW(){
	local X2TacticalGameRuleset Ruleset;
	local XGBattle_SP Battle;
	local XComGameStateContext_TacticalGameRule Context;
	local XComGameState NewGameState;
	local int ReplaySaveID;
	local XComGameState_BattleData BattleData;
	local XComOnlineProfileSettings ProfileSettings;
	local XComLWTuple OverrideTuple; // for issue #266
	local int VictoriousPlayerID; // for issue #266
	local XGPlayer VictoriousPlayer;
	local UICombatLoseType UILoseType;
	local bool GenerateReplaySave;
	local XComGameState_Player PlayerState;
	local int LocalPlayerID;

	UILoseType = eUICombatLose_FailableGeneric;
	GenerateReplaySave = false;

	Ruleset = `TACTICALRULES;
	Battle = XGBattle_SP(`BATTLE);

	if(Battle != none && Ruleset != none)
	{
		//VictoriousPlayer = Battle.GetAIPlayer();
		VictoriousPlayer = Battle.GetHumanPlayer();
		/*	
		if (`ONLINEEVENTMGR.bIsChallengeModeGame)
		{
			// Check for the End of Tactical Game ...
			foreach Ruleset.CachedHistory.IterateContextsByClassType(class'XComGameStateContext_TacticalGameRule', Context)
			{
				if (Context.GameRuleType == eGameRule_TacticalGameEnd)
				{
					Ruleset.TacticalGameEndIndex = Context.AssociatedState.HistoryIndex;
					`log(`location @ "eGameRule_TacticalGameEnd Found @" @ `ShowVar(Ruleset.TacticalGameEndIndex));
					return; // Make sure to not end the battle multiple times.
				}
			}
		}
		*/

		Ruleset.LoseType = UILoseType;

		/*
		if(class'XComGameState_HeadquartersXCom'.static.AnyTutorialObjectivesInProgress())
		{
			if (!Ruleset.SquadDead( ))
				Ruleset.LoseType = Ruleset.eUICombatLose_UnfailableObjective; //The squad made it out, but we lost - must have been an objective. Don't show "all xcom killed!" screen.
			else
				Ruleset.LoseType = Ruleset.eUICombatLose_UnfailableGeneric;
		}

		Ruleset.bPromptForRestart = !VictoriousPlayer.IsHumanPlayer() && Ruleset.LoseType != eUICombatLose_FailableGeneric;
		if (!VictoriousPlayer.IsHumanPlayer() && (Ruleset.CachedHistory.GetSingleGameStateObjectForClass( class'XComGameState_LadderProgress', true ) != none))
		{
			if (!Ruleset.SquadDead( ))
				Ruleset.LoseType = Ruleset.eUICombatLose_UnfailableObjective; //The squad made it out, but we lost - must have been an objective. Don't show "all xcom killed!" screen.
			else
				Ruleset.LoseType = Ruleset.eUICombatLose_UnfailableGeneric;

			Ruleset.bPromptForRestart = true;
		}
		*/

		/*
		BattleData = XComGameState_BattleData(CachedHistory.GetGameStateForObjectID( CachedBattleDataRef.ObjectID ));
		if (VictoriousPlayer.IsHumanPlayer() && (BattleData.m_strDesc == "Skirmish Mode"))
		{
			ProfileSettings = `XPROFILESETTINGS;

			++ProfileSettings.Data.HubStats.NumSkirmishVictories;

			`ONLINEEVENTMGR.SaveProfileSettings();
		}
		*/

		//Ruleset.bPromptForRestart = true;
		//Ruleset.LoseType = eUICombatLose_UnfailableObjective;

		// Don't end battles in PIE, at least not for now
		if(Ruleset.WorldInfo.IsPlayInEditor()) return;

		//LocalPlayerID = 
		foreach `XCOMHistory.IterateByClassType(class'XComGameState_Player', PlayerState)
		{
			if (PlayerState.TeamFlag == eTeam_XCom)
			{
				LocalPlayerID = XGPlayer(PlayerState.GetVisualizer()).ObjectID;
			}
		}
	
		// issue #266: set up a Tuple to determine objectID of victorious player of a battle
		OverrideTuple = new class'XComLWTuple'; 
		OverrideTuple.Id = 'OverrideVictoriousPlayer';
		OverrideTuple.Data.Add(1);
		OverrideTuple.Data[0].kind = XComLWTVInt;
		OverrideTuple.Data[0].i = LocalPlayerID;
		`LOG("VICTORUSOUR " $ LocalPlayerID);
		`XEVENTMGR.TriggerEvent('OverrideVictoriousPlayer', OverrideTuple, OverrideTuple, none); // mods should be able to use XCOMHistory to check the battle data without needing any intervention here
		
		OverrideTuple.Id = 'OverrideVictoriousPlayer';
		OverrideTuple.Data.Add(1);
		OverrideTuple.Data[0].kind = XComLWTVInt;
		OverrideTuple.Data[0].i = LocalPlayerID;
		`LOG("VICTORUSOUR AGAIN " $ LocalPlayerID);
	
		Context = class'XComGameStateContext_TacticalGameRule'.static.BuildContextFromGameRule(eGameRule_TacticalGameEnd);
		Context.PlayerRef.ObjectID = LocalPlayerID;
		NewGameState = Context.ContextBuildGameState();
		BattleData = XComGameState_BattleData(`XCOMHistory.GetSingleGameStateObjectForClass(class'XComGameState_BattleData'));
		BattleData = XComGameState_BattleData(NewGameState.ModifyStateObject(class'XComGameState_BattleData', BattleData.ObjectID));
		BattleData.bLocalPlayerWon = true;
		Ruleset.SubmitGameState(NewGameState);

		if(GenerateReplaySave)
		{
			ReplaySaveID = `AUTOSAVEMGR.GetNextSaveID();
			`ONLINEEVENTMGR.SaveGame(ReplaySaveID, false, false, none);
		}

		`XEVENTMGR.TriggerEvent('EndBattle');
	}
}

function iterateObjectives(XComGameState_Objective ObjectiveStateTarget, XComGameState NewGameState, optional String nb){
	local XComGameState_Objective ObjectiveState, ObjectiveStateMain;
	local int i;

	`LOG(
		"MISSION FUCK ME STARTBING"
	);

	if(ObjectiveStateTarget != None){
		`LOG(
			"MISSION FUCK ME " $
			ObjectiveStateTarget.GetMyTemplateName() $
			" ?? " $
			nb $
			" sub " $
			ObjectiveState.GetSubObjectives().Length
		);
		ObjectiveState = XComGameState_Objective(NewGameState.ModifyStateObject(class'XComGameState_Objective', ObjectiveStateTarget.ObjectID));
		ObjectiveState.CompleteObjective(NewGameState);
		//if(ObjectiveStateTarget.GetMainObjective() != None){
		//	`LOG(
		//		"MISSION FUCK ME MAIN " $
		//		ObjectiveStateTarget.GetMainObjective().GetMyTemplateName() $
		//		" ?? " $
		//		nb
		//	);
		//	ObjectiveStateMain = XComGameState_Objective(NewGameState.ModifyStateObject(class'XComGameState_Objective', ObjectiveStateTarget.GetMainObjective().ObjectID));
		//	ObjectiveStateMain.CompleteObjective(NewGameState);
		//}
		for (i = 0; i < ObjectiveState.GetSubObjectives().Length; i++){
			iterateObjectives(ObjectiveState.GetSubObjectives()[i], NewGameState, "SUBOBJECTIVE " $ i);
		}
	}
}