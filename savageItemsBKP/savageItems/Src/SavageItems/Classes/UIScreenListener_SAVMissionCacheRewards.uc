class UIScreenListener_SAVMissionCacheRewards extends UIScreenListener config(SavageStockItems);

var public config array<String> CouncilCacheLootTable;
var public config array<String> ResistanceCacheLootTable;
var public config array<String> FactionCacheLootTable;
var public config array<String> SupplyRaidCacheLootTable;
var public config array<String> UFORaidCacheLootTable;
var public config array<String> ADVENTCacheLootTable;
var public config array<String> AlienCacheLootTable;
var public config array<String> AVATARFacilityLootTable;
var public config array<String> WarlockCacheLootTable;
var public config array<String> AssassinCacheLootTable;
var public config array<String> HunterCacheLootTable;

var public config int CouncilRewardDropChance;
var public config int GuerillaOpRewardDropChance;
var public config int RetaliationRewardDropChance;
var public config int ResistanceOpRewardDropChance;
var public config int SupplyRaidRewardDropChance;
var public config int UFORaidRewardDropChance;
var public config int AVATARFacilityRewardDropChance;;

var public localized array<String> CouncilRewardVerbiage;
var public localized array<String> GOpsRewardVerbiage;
var public localized array<String> RetalRewardVerbiage;
var public localized array<String> ResOpsRewardVerbiage;
var public localized array<String> SupRaidRewardVerbiage;
var public localized array<String> UFORaidRewardVerbiage;
var public localized array<String> BlacksiteRewardVerbiage;
var public localized array<String> ForgeRewardVerbiage;
var public localized array<String> GatewayRewardVerbiage;
var public localized array<String> AVATARFacilityRewardVerbiage;
var public localized array<String> WarlockRewardVerbiage;
var public localized array<String> AssassinRewardVerbiage;
var public localized array<String> HunterRewardVerbiage;
var public localized string CouncilTitle;
var public localized string GOpsTitle;
var public localized string RetaliationTitle;
var public localized string ResOpsTitle;
var public localized string SupRaidTitle;
var public localized string UFORaidTitle;
var public localized string BlacksiteTitle;
var public localized string ForgeTitle;
var public localized string GatewayTitle;
var public localized string AVATARFacilityTitle;
var public localized string WarlockTitle;
var public localized string AssassinTitle;
var public localized string HunterTitle;

var public localized String FallbackMessage;
var public localized String CouncilErrorTitle;
var public localized string CouncilError;
var public localized String GuerillaErrorTitle;
var public localized string GuerillaError;
var public localized String RetaliationErrorTitle;
var public localized string RetaliationError;
var public localized String ResistanceErrorTitle;
var public localized string ResistanceError;
var public localized String SupplyRaidErrorTitle;
var public localized string SupplyRaidError;
var public localized String UFOErrorTitle;
var public localized string UFOError;
var public localized String FacilityErrorTitle;
var public localized string FacilityError;
var public localized String ErrorTitle;
var public localized string Error;

event OnInit(UIScreen Screen)
{
	local UIMissionSummary uiMissionSummary;
	local GeneratedMissionData GeneratedMission;
	
	uiMissionSummary = UIMissionSummary(Screen);
// Regular mission Rewards
	if ( uiMissionSummary != none ) 
	{
			if( uiMissionSummary.BattleData.bLocalPlayerWon && !uiMissionSummary.BattleData.bMissionAborted )

			GeneratedMission = class'UIUtilities_Strategy'.static.GetXComHQ().GetGeneratedMissionData(uiMissionSummary.BattleData.m_iMissionID);
//CouncilMission
			if(GeneratedMission.Mission.MissionFamily == "Neutralize")
				{
				GiveSavItems_CouncilReward();
				}
			if(GeneratedMission.Mission.MissionFamily == "Extract")
				{
				GiveSavItems_CouncilReward();
				}
			if(GeneratedMission.Mission.MissionFamily == "Rescue")
				{
				GiveSavItems_CouncilReward();
				}
			if(GeneratedMission.Mission.MissionFamily == "SabotageCC_CI")
				{
				GiveSavItems_CouncilReward();
				}
			if(GeneratedMission.Mission.MissionFamily == "Extract_LW")
				{
				GiveSavItems_CouncilReward();
				}
			if(GeneratedMission.Mission.MissionFamily == "Neutralize_LW")
				{
				GiveSavItems_CouncilReward();
				}
			if(GeneratedMission.Mission.MissionFamily == "Rescue_LW")
				{
				GiveSavItems_CouncilReward();
				}
			if(GeneratedMission.Mission.MissionFamily == "RecruitRaid_LW")
				{
				GiveSavItems_CouncilReward();
				}
			if(GeneratedMission.Mission.MissionFamily == "Jailbreak_LW")
				{
				GiveSavItems_CouncilReward();
				}
//GuerillaOp			
			if(GeneratedMission.Mission.MissionFamily == "Recover")
				{
				GiveSavItems_GuerillaOp();
				}
			if(GeneratedMission.Mission.MissionFamily == "Hack")
				{
				GiveSavItems_GuerillaOp();
				}
			if(GeneratedMission.Mission.MissionFamily == "DestroyObject")
				{
				GiveSavItems_GuerillaOp();
				}
			if(GeneratedMission.Mission.MissionFamily == "ProtectDevice")
				{
				GiveSavItems_GuerillaOp();
				}
			if(GeneratedMission.Mission.MissionFamily == "NeutralizeFieldCommander")
				{
				GiveSavItems_GuerillaOp();
				}
			if(GeneratedMission.Mission.MissionFamily == "SabotageTransmitter")
				{
				GiveSavItems_GuerillaOp();
				}
			if(GeneratedMission.Mission.MissionFamily == "RM_OperativeEscort")
				{
				GiveSavItems_GuerillaOp();
				}
			if(GeneratedMission.Mission.MissionFamily == "Hack_LW")
				{
				GiveSavItems_GuerillaOp();
				}
			if(GeneratedMission.Mission.MissionFamily == "DestroyObject_LW")
				{
				GiveSavItems_GuerillaOp();
				}
			if(GeneratedMission.Mission.MissionFamily == "ProtectDevice_LW")
				{
				GiveSavItems_GuerillaOp();
				}
			if(GeneratedMission.Mission.MissionFamily == "Recover_LW")
				{
				GiveSavItems_GuerillaOp();
				}
			if(GeneratedMission.Mission.MissionFamily == "TroopManeuvers_LW")
				{
				GiveSavItems_GuerillaOp();
				}
			if(GeneratedMission.Mission.MissionFamily == "IntelRaid_LW")
				{
				GiveSavItems_GuerillaOp();
				}
//Retaliation
			if(GeneratedMission.Mission.MissionFamily == "Terror")
				{
				GiveSavItems_Retaliation();
				}
			if(GeneratedMission.Mission.MissionFamily == "ChosenRetaliation")
				{
				GiveSavItems_Retaliation();
				}
			if(GeneratedMission.Mission.MissionFamily == "AHWTMChryssalidRescue")
				{
				GiveSavItems_Retaliation();
				}
			if(GeneratedMission.Mission.MissionFamily == "Terror_LW")
				{
				GiveSavItems_Retaliation();
				}
			if(GeneratedMission.Mission.MissionFamily == "Defend_LW")
				{
				GiveSavItems_Retaliation();
				}
			if(GeneratedMission.Mission.MissionFamily == "Invasion_LW")
				{
				GiveSavItems_Retaliation();
				}
//Resistance Ops
			if(GeneratedMission.Mission.MissionFamily == "GatherSurvivors")
				{
				GiveSavItems_ResistanceOp();
				}
			if(GeneratedMission.Mission.MissionFamily == "SwarmDefense")
				{
				GiveSavItems_ResistanceOp();
				}
			if(GeneratedMission.Mission.MissionFamily == "RecoverExpedition")
				{
				GiveSavItems_ResistanceOp();
				}
// Supply Raid Rewards
			if(GeneratedMission.Mission.MissionFamily == "SupplyLineRaid")
				{
				GiveSavItems_SupplyRaid();
				}
			if(GeneratedMission.Mission.MissionFamily == "SupplyExtraction")
				{
				GiveSavItems_SupplyRaid();
				}
			if(GeneratedMission.Mission.MissionFamily == "SupplyExtraction_CI")
				{
				GiveSavItems_SupplyRaid();
				}
			if(GeneratedMission.Mission.MissionFamily == "SupplyLineRaid_LW")
				{
				GiveSavItems_SupplyRaid();
				}
			if(GeneratedMission.Mission.MissionFamily == "SmashNGrab_LW")
				{
				GiveSavItems_SupplyRaid();
				}
			if(GeneratedMission.Mission.MissionFamily == "SupplyConvoy_LW")
				{
				GiveSavItems_SupplyRaid();
				}
// UFO Raid Rewards
			if(GeneratedMission.Mission.sType == "SecureUFO")
				{
				GiveSavItems_UFORaid();
				}
			if(GeneratedMission.Mission.MissionFamily == "SecureUFO_LW")
				{
				GiveSavItems_UFORaid();
				}
// Story mission Rewards			
			if(GeneratedMission.Mission.MissionFamily == "GoldenPath1")
				{
				GiveSavItems_BlackSiteCache();
				}
			if(GeneratedMission.Mission.MissionFamily == "GoldenPath2")
				{
				GiveSavItems_ForgeCache();
				}
			if(GeneratedMission.Mission.MissionFamily == "GoldenPath3")
				{
				GiveSavItems_PsiGateCache();
				}
			if(GeneratedMission.Mission.MissionFamily == "GoldenPath1_LW")
				{
				GiveSavItems_BlackSiteCache();
				}
			if(GeneratedMission.Mission.MissionFamily == "GoldenPath2_LW")
				{
				GiveSavItems_ForgeCache();
				}
			if(GeneratedMission.Mission.MissionFamily == "GoldenPath3_LW")
				{
				GiveSavItems_PsiGateCache();
				}
			if(GeneratedMission.Mission.sType == "Sabotage")
				{
				GiveSavItems_FacilityCache();
				}
			if(GeneratedMission.Mission.MissionFamily == "Sabotage_LW")
				{
				GiveSavItems_FacilityCache();
				}
// Chosen Showdown Rewards				
			if(GeneratedMission.Mission.MissionFamily == "ChosenShowdown_Warlock")
				{
				GiveSavItems_WarlockCache();
				}
			if(GeneratedMission.Mission.MissionFamily == "ChosenShowdown_Assassin")
				{
				GiveSavItems_AssassinCache();
				}
			if(GeneratedMission.Mission.MissionFamily == "ChosenShowdown_Hunter")
				{
				GiveSavItems_HunterCache();
				}
	}
}

//////////////////
//Reward Functions
//////////////////
function GiveSavItems_CouncilReward()
{
	local int WhichRewardIndex;
	local String ResourceTemplateName;
	local String ResourceDesc;
	local int ResourceQuantity;
	local int DropChance;
	
	local Engine LocalGameEngine;
	local int Seed;
	local int alertIndex;
	local String alertText;
	local string fallbackMsg;
//	ResourceDesc = "";

	DropChance = `SYNC_RAND_STATIC(100);

	if ( DropChance < default.CouncilRewardDropChance )
	{
		WhichRewardIndex = `SYNC_RAND_STATIC(default.CouncilCacheLootTable.Length);
		ResourceTemplateName = CouncilCacheLootTable[WhichRewardIndex];
		ResourceDesc = SAVGetItemTemplateDescription(name(ResourceTemplateName), false);
		ResourceQuantity=1;
		SAVAddItem(ResourceTemplateName);
	} 
	if ( ResourceQuantity < 1 || ResourceDesc == "" )
	{
		`PRESBASE.UITutorialBox(CouncilErrorTitle, CouncilError, "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic1" );
	}
	else 
	{
		LocalGameEngine = class'Engine'.static.GetEngine();
		Seed = LocalGameEngine.GetARandomSeed();
		LocalGameEngine.SetRandomSeeds(Seed);

		alertIndex = `SYNC_RAND_STATIC(CouncilRewardVerbiage.Length);
		alertText = CouncilRewardVerbiage[alertIndex];

		alertText = Repl(alertText, "$1", "" @ ResourceQuantity);
		alertText = Repl(alertText, "$2", "" @ ResourceDesc);

		fallbackMsg = Repl(fallbackMsg, "$1", "" @ ResourceQuantity);
		fallbackMsg = Repl(fallbackMsg, "$2", "" @ ResourceDesc);

		alertText = class'UIUtilities_Text'.static.GetColoredText(alertText, eUIState_Good);
		fallbackMsg = class'UIUtilities_Text'.static.GetColoredText(fallbackMsg, eUIState_Good);
//This one is used to show general resistance sourced rewards
		CouncilDisplayRewardMessage(alertText, fallbackMsg);
	} 
}

function GiveSavItems_GuerillaOp()
{
	local int WhichRewardIndex;
	local String ResourceTemplateName;
	local String ResourceDesc;
	local int ResourceQuantity;
	local int DropChance;
	
	local Engine LocalGameEngine;
	local int Seed;
	local int alertIndex;
	local String alertText;
	local string fallbackMsg;
//	ResourceDesc = "";

	DropChance = `SYNC_RAND_STATIC(100);

	if ( DropChance < default.GuerillaOpRewardDropChance )
	{
		WhichRewardIndex = `SYNC_RAND_STATIC(default.ResistanceCacheLootTable.Length);
		ResourceTemplateName = ResistanceCacheLootTable[WhichRewardIndex];
		ResourceDesc = SAVGetItemTemplateDescription(name(ResourceTemplateName), false);
		ResourceQuantity=1;
		SAVAddItem(ResourceTemplateName);
	} 
	if ( ResourceQuantity < 1 || ResourceDesc == "" )
	{
		`PRESBASE.UITutorialBox(GuerillaErrorTitle, GuerillaError, "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic1" );
	} 
	else 
	{
		LocalGameEngine = class'Engine'.static.GetEngine();
		Seed = LocalGameEngine.GetARandomSeed();
		LocalGameEngine.SetRandomSeeds(Seed);

		alertIndex = `SYNC_RAND_STATIC(GOpsRewardVerbiage.Length);
		alertText = GOpsRewardVerbiage[alertIndex];

		alertText = Repl(alertText, "$1", "" @ ResourceQuantity);
		alertText = Repl(alertText, "$2", "" @ ResourceDesc);

		fallbackMsg = Repl(fallbackMsg, "$1", "" @ ResourceQuantity);
		fallbackMsg = Repl(fallbackMsg, "$2", "" @ ResourceDesc);

		alertText = class'UIUtilities_Text'.static.GetColoredText(alertText, eUIState_Good);
		fallbackMsg = class'UIUtilities_Text'.static.GetColoredText(fallbackMsg, eUIState_Good);
//This one is used to show general resistance sourced rewards
		GuerillaOpsDisplayRewardMessage(alertText, fallbackMsg);
	} 
}

function GiveSavItems_Retaliation()
{
	local int WhichRewardIndex;
	local String ResourceTemplateName;
	local String ResourceDesc;
	local int ResourceQuantity;
	local int DropChance;
	
	local Engine LocalGameEngine;
	local int Seed;
	local int alertIndex;
	local String alertText;
	local string fallbackMsg;
//	ResourceDesc = "";

	DropChance = `SYNC_RAND_STATIC(100);

	if ( DropChance < default.RetaliationRewardDropChance )
	{
		WhichRewardIndex = `SYNC_RAND_STATIC(default.ResistanceCacheLootTable.Length);
		ResourceTemplateName = ResistanceCacheLootTable[WhichRewardIndex];
		ResourceDesc = SAVGetItemTemplateDescription(name(ResourceTemplateName), false);
		ResourceQuantity=1;
		SAVAddItem(ResourceTemplateName);
	} 
	if ( ResourceQuantity < 1 || ResourceDesc == "" )
	{
		`PRESBASE.UITutorialBox(RetaliationErrorTitle, RetaliationError, "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic1" );
	} 
	else 
	{
		LocalGameEngine = class'Engine'.static.GetEngine();
		Seed = LocalGameEngine.GetARandomSeed();
		LocalGameEngine.SetRandomSeeds(Seed);

		alertIndex = `SYNC_RAND_STATIC(RetalRewardVerbiage.Length);
		alertText = RetalRewardVerbiage[alertIndex];

		alertText = Repl(alertText, "$1", "" @ ResourceQuantity);
		alertText = Repl(alertText, "$2", "" @ ResourceDesc);

		fallbackMsg = Repl(fallbackMsg, "$1", "" @ ResourceQuantity);
		fallbackMsg = Repl(fallbackMsg, "$2", "" @ ResourceDesc);

		alertText = class'UIUtilities_Text'.static.GetColoredText(alertText, eUIState_Good);
		fallbackMsg = class'UIUtilities_Text'.static.GetColoredText(fallbackMsg, eUIState_Good);
//This one is used to show general resistance sourced rewards
		RetaliationDisplayRewardMessage(alertText, fallbackMsg);
	} 
}

function GiveSavItems_ResistanceOp()
{
	local int WhichRewardIndex;
	local String ResourceTemplateName;
	local String ResourceDesc;
	local int ResourceQuantity;
	local int DropChance;
	
	local Engine LocalGameEngine;
	local int Seed;
	local int alertIndex;
	local String alertText;
	local string fallbackMsg;
//	ResourceDesc = "";

	DropChance = `SYNC_RAND_STATIC(100);

	if ( DropChance < default.ResistanceOpRewardDropChance )
	{
		WhichRewardIndex = `SYNC_RAND_STATIC(default.FactionCacheLootTable.Length);
		ResourceTemplateName = FactionCacheLootTable[WhichRewardIndex];
		ResourceDesc = SAVGetItemTemplateDescription(name(ResourceTemplateName), false);
		ResourceQuantity=1;
		SAVAddItem(ResourceTemplateName);
	} 
	if ( ResourceQuantity < 1 || ResourceDesc == "" )
	{
		`PRESBASE.UITutorialBox(ResistanceErrorTitle, ResistanceError, "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic1" );
	} 
	else 
	{
		LocalGameEngine = class'Engine'.static.GetEngine();
		Seed = LocalGameEngine.GetARandomSeed();
		LocalGameEngine.SetRandomSeeds(Seed);

		alertIndex = `SYNC_RAND_STATIC(ResOpsRewardVerbiage.Length);
		alertText = ResOpsRewardVerbiage[alertIndex];

		alertText = Repl(alertText, "$1", "" @ ResourceQuantity);
		alertText = Repl(alertText, "$2", "" @ ResourceDesc);

		fallbackMsg = Repl(fallbackMsg, "$1", "" @ ResourceQuantity);
		fallbackMsg = Repl(fallbackMsg, "$2", "" @ ResourceDesc);

		alertText = class'UIUtilities_Text'.static.GetColoredText(alertText, eUIState_Good);
		fallbackMsg = class'UIUtilities_Text'.static.GetColoredText(fallbackMsg, eUIState_Good);
//This one is used to show general resistance sourced rewards
		ResistanceOpDisplayRewardMessage(alertText, fallbackMsg);
	} 
}

function GiveSavItems_SupplyRaid()
{
	local int WhichRewardIndex;
	local String ResourceTemplateName;
	local String ResourceDesc;
	local int ResourceQuantity;
	local int DropChance;
	
	local Engine LocalGameEngine;
	local int Seed;
	local int alertIndex;
	local String alertText;
	local string fallbackMsg;
//	ResourceDesc = "";

	DropChance = `SYNC_RAND_STATIC(100);

	if ( DropChance < default.SupplyRaidRewardDropChance )
	{
		WhichRewardIndex = `SYNC_RAND_STATIC(default.SupplyRaidCacheLootTable.Length);
		ResourceTemplateName = SupplyRaidCacheLootTable[WhichRewardIndex];
		ResourceDesc = SAVGetItemTemplateDescription(name(ResourceTemplateName), false);
		ResourceQuantity=1;
		SAVAddItem(ResourceTemplateName);
	} 
	if ( ResourceQuantity < 1 || ResourceDesc == "" )
	{
		`PRESBASE.UITutorialBox(SupplyRaidErrorTitle, SupplyRaidError, "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic2" );
	} 
	else 
	{
		LocalGameEngine = class'Engine'.static.GetEngine();
		Seed = LocalGameEngine.GetARandomSeed();
		LocalGameEngine.SetRandomSeeds(Seed);

		alertIndex = `SYNC_RAND_STATIC(SupRaidRewardVerbiage.Length);
		alertText = SupRaidRewardVerbiage[alertIndex];

		alertText = Repl(alertText, "$1", "" @ ResourceQuantity);
		alertText = Repl(alertText, "$2", "" @ ResourceDesc);

		fallbackMsg = Repl(fallbackMsg, "$1", "" @ ResourceQuantity);
		fallbackMsg = Repl(fallbackMsg, "$2", "" @ ResourceDesc);

		alertText = class'UIUtilities_Text'.static.GetColoredText(alertText, eUIState_Good);
		fallbackMsg = class'UIUtilities_Text'.static.GetColoredText(fallbackMsg, eUIState_Good);
//This one is used to show general resistance sourced rewards
		SupplyRaidDisplayRewardMessage(alertText, fallbackMsg);
	} 
}

function GiveSavItems_UFORaid()
{
	local int WhichRewardIndex;
	local String ResourceTemplateName;
	local String ResourceDesc;
	local int ResourceQuantity;
	local int DropChance;
	
	local Engine LocalGameEngine;
	local int Seed;
	local int alertIndex;
	local String alertText;
	local string fallbackMsg;
//	ResourceDesc = "";

	DropChance = `SYNC_RAND_STATIC(100);

	if ( DropChance < default.UFORaidRewardDropChance )
	{
		WhichRewardIndex = `SYNC_RAND_STATIC(default.UFORaidCacheLootTable.Length);
		ResourceTemplateName = UFORaidCacheLootTable[WhichRewardIndex];
		ResourceDesc = SAVGetItemTemplateDescription(name(ResourceTemplateName), false);
		ResourceQuantity=1;
		SAVAddItem(ResourceTemplateName);
	} 
	if ( ResourceQuantity < 1 || ResourceDesc == "" )
	{
		`PRESBASE.UITutorialBox(UFOErrorTitle, UFOError, "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic3" );
	} 
	else 
	{
		LocalGameEngine = class'Engine'.static.GetEngine();
		Seed = LocalGameEngine.GetARandomSeed();
		LocalGameEngine.SetRandomSeeds(Seed);

		alertIndex = `SYNC_RAND_STATIC(UFORaidRewardVerbiage.Length);
		alertText = UFORaidRewardVerbiage[alertIndex];

		alertText = Repl(alertText, "$1", "" @ ResourceQuantity);
		alertText = Repl(alertText, "$2", "" @ ResourceDesc);

		fallbackMsg = Repl(fallbackMsg, "$1", "" @ ResourceQuantity);
		fallbackMsg = Repl(fallbackMsg, "$2", "" @ ResourceDesc);

		alertText = class'UIUtilities_Text'.static.GetColoredText(alertText, eUIState_Good);
		fallbackMsg = class'UIUtilities_Text'.static.GetColoredText(fallbackMsg, eUIState_Good);
//This one is used to show general resistance sourced rewards
		UFORaidDisplayRewardMessage(alertText, fallbackMsg);
	} 
}


function GiveSavItems_BlackSiteCache()
{
	local int WhichRewardIndex;
	local String ResourceTemplateName;
	local String ResourceDesc;
	local int ResourceQuantity;
	
	local Engine LocalGameEngine;
	local int Seed;
	local int alertIndex;
	local String alertText;
	local string fallbackMsg;
//	ResourceDesc = "";

	WhichRewardIndex = `SYNC_RAND_STATIC(default.ADVENTCacheLootTable.Length);
	ResourceTemplateName = ADVENTCacheLootTable[WhichRewardIndex];
	ResourceDesc = SAVGetItemTemplateDescription(name(ResourceTemplateName), false);
	ResourceQuantity=1;
	SAVAddItem(ResourceTemplateName);

	if ( ResourceQuantity < 1 || ResourceDesc == "" )
	{
		`PRESBASE.UITutorialBox(ErrorTitle, Error, "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic3" );
	} 
	else 
	{
		LocalGameEngine = class'Engine'.static.GetEngine();
		Seed = LocalGameEngine.GetARandomSeed();
		LocalGameEngine.SetRandomSeeds(Seed);

		alertIndex = `SYNC_RAND_STATIC(BlacksiteRewardVerbiage.Length);
		alertText = BlacksiteRewardVerbiage[alertIndex];

		alertText = Repl(alertText, "$1", "" @ ResourceQuantity);
		alertText = Repl(alertText, "$2", "" @ ResourceDesc);

		fallbackMsg = Repl(fallbackMsg, "$1", "" @ ResourceQuantity);
		fallbackMsg = Repl(fallbackMsg, "$2", "" @ ResourceDesc);

		alertText = class'UIUtilities_Text'.static.GetColoredText(alertText, eUIState_Good);
		fallbackMsg = class'UIUtilities_Text'.static.GetColoredText(fallbackMsg, eUIState_Good);
//This one is used to show general resistance sourced rewards
		BlacksiteDisplayRewardMessage(alertText, fallbackMsg);
	} 
}

function GiveSavItems_ForgeCache()
{
	local int WhichRewardIndex;
	local String ResourceTemplateName;
	local String ResourceDesc;
	local int ResourceQuantity;
	
	local Engine LocalGameEngine;
	local int Seed;
	local int alertIndex;
	local String alertText;
	local string fallbackMsg;
//	ResourceDesc = "";

		WhichRewardIndex = `SYNC_RAND_STATIC(default.ADVENTCacheLootTable.Length);
		ResourceTemplateName = ADVENTCacheLootTable[WhichRewardIndex];
		ResourceDesc = SAVGetItemTemplateDescription(name(ResourceTemplateName), false);
		ResourceQuantity=1;
		SAVAddItem(ResourceTemplateName);

	if ( ResourceQuantity < 1 || ResourceDesc == "" )
	{
		`PRESBASE.UITutorialBox(ErrorTitle, Error, "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic3" );
	} 
	else 
	{
		LocalGameEngine = class'Engine'.static.GetEngine();
		Seed = LocalGameEngine.GetARandomSeed();
		LocalGameEngine.SetRandomSeeds(Seed);

		alertIndex = `SYNC_RAND_STATIC(ForgeRewardVerbiage.Length);
		alertText = ForgeRewardVerbiage[alertIndex];

		alertText = Repl(alertText, "$1", "" @ ResourceQuantity);
		alertText = Repl(alertText, "$2", "" @ ResourceDesc);

		fallbackMsg = Repl(fallbackMsg, "$1", "" @ ResourceQuantity);
		fallbackMsg = Repl(fallbackMsg, "$2", "" @ ResourceDesc);

		alertText = class'UIUtilities_Text'.static.GetColoredText(alertText, eUIState_Good);
		fallbackMsg = class'UIUtilities_Text'.static.GetColoredText(fallbackMsg, eUIState_Good);
//This one is used to show general resistance sourced rewards
		ForgeDisplayRewardMessage(alertText, fallbackMsg);
	} 
}

function GiveSavItems_PsiGateCache()
{
	local int WhichRewardIndex;
	local String ResourceTemplateName;
	local String ResourceDesc;
	local int ResourceQuantity;
	
	local Engine LocalGameEngine;
	local int Seed;
	local int alertIndex;
	local String alertText;
	local string fallbackMsg;
//	ResourceDesc = "";

	WhichRewardIndex = `SYNC_RAND_STATIC(default.AlienCacheLootTable.Length);
	ResourceTemplateName = AlienCacheLootTable[WhichRewardIndex];
	ResourceDesc = SAVGetItemTemplateDescription(name(ResourceTemplateName), false);
	ResourceQuantity=1;
	SAVAddItem(ResourceTemplateName);
 
	if ( ResourceQuantity < 1 || ResourceDesc == "" )
	{
		`PRESBASE.UITutorialBox(ErrorTitle, Error, "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic3" );
	} 
	else 
	{
		LocalGameEngine = class'Engine'.static.GetEngine();
		Seed = LocalGameEngine.GetARandomSeed();
		LocalGameEngine.SetRandomSeeds(Seed);

		alertIndex = `SYNC_RAND_STATIC(GatewayRewardVerbiage.Length);
		alertText = GatewayRewardVerbiage[alertIndex];

		alertText = Repl(alertText, "$1", "" @ ResourceQuantity);
		alertText = Repl(alertText, "$2", "" @ ResourceDesc);

		fallbackMsg = Repl(fallbackMsg, "$1", "" @ ResourceQuantity);
		fallbackMsg = Repl(fallbackMsg, "$2", "" @ ResourceDesc);

		alertText = class'UIUtilities_Text'.static.GetColoredText(alertText, eUIState_Good);
		fallbackMsg = class'UIUtilities_Text'.static.GetColoredText(fallbackMsg, eUIState_Good);
//This one is used to show general resistance sourced rewards
		GatewayDisplayRewardMessage(alertText, fallbackMsg);
	} 
}

function GiveSavItems_FacilityCache()
{
	local int WhichRewardIndex;
	local String ResourceTemplateName;
	local String ResourceDesc;
	local int ResourceQuantity;
	local int DropChance;
	
	local Engine LocalGameEngine;
	local int Seed;
	local int alertIndex;
	local String alertText;
	local string fallbackMsg;
//	ResourceDesc = "";

	DropChance = `SYNC_RAND_STATIC(100);

	if ( DropChance < default.AVATARFacilityRewardDropChance )
	{
		WhichRewardIndex = `SYNC_RAND_STATIC(default.AVATARFacilityLootTable.Length);
		ResourceTemplateName = AVATARFacilityLootTable[WhichRewardIndex];
		ResourceDesc = SAVGetItemTemplateDescription(name(ResourceTemplateName), false);
		ResourceQuantity=1;
		SAVAddItem(ResourceTemplateName);
	} 
	if ( ResourceQuantity < 1 || ResourceDesc == "" )
	{
		`PRESBASE.UITutorialBox(FacilityErrorTitle, FacilityError, "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic3" );
	} 
	else 
	{
		LocalGameEngine = class'Engine'.static.GetEngine();
		Seed = LocalGameEngine.GetARandomSeed();
		LocalGameEngine.SetRandomSeeds(Seed);

		alertIndex = `SYNC_RAND_STATIC(AVATARFacilityRewardVerbiage.Length);
		alertText = AVATARFacilityRewardVerbiage[alertIndex];

		alertText = Repl(alertText, "$1", "" @ ResourceQuantity);
		alertText = Repl(alertText, "$2", "" @ ResourceDesc);

		fallbackMsg = Repl(fallbackMsg, "$1", "" @ ResourceQuantity);
		fallbackMsg = Repl(fallbackMsg, "$2", "" @ ResourceDesc);

		alertText = class'UIUtilities_Text'.static.GetColoredText(alertText, eUIState_Good);
		fallbackMsg = class'UIUtilities_Text'.static.GetColoredText(fallbackMsg, eUIState_Good);
//This one is used to show general resistance sourced rewards
		AVATARFacilityDisplayRewardMessage(alertText, fallbackMsg);
	} 
}


function GiveSavItems_WarlockCache()
{
	local int WhichRewardIndex;
	local String ResourceTemplateName;
	local String ResourceDesc;
	local int ResourceQuantity;
	
	local Engine LocalGameEngine;
	local int Seed;
	local int alertIndex;
	local String alertText;
	local string fallbackMsg;
//	ResourceDesc = "";

	WhichRewardIndex = `SYNC_RAND_STATIC(default.WarlockCacheLootTable.Length);
	ResourceTemplateName = WarlockCacheLootTable[WhichRewardIndex];
	ResourceDesc = SAVGetItemTemplateDescription(name(ResourceTemplateName), false);
	ResourceQuantity=1;
	SAVAddItem(ResourceTemplateName);

	if ( ResourceQuantity < 1 || ResourceDesc == "" )
	{
		`PRESBASE.UITutorialBox(ErrorTitle, Error, "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic2" );
	} 
	else 
	{
		LocalGameEngine = class'Engine'.static.GetEngine();
		Seed = LocalGameEngine.GetARandomSeed();
		LocalGameEngine.SetRandomSeeds(Seed);

		alertIndex = `SYNC_RAND_STATIC(WarlockRewardVerbiage.Length);
		alertText = WarlockRewardVerbiage[alertIndex];

		alertText = Repl(alertText, "$1", "" @ ResourceQuantity);
		alertText = Repl(alertText, "$2", "" @ ResourceDesc);

		fallbackMsg = Repl(fallbackMsg, "$1", "" @ ResourceQuantity);
		fallbackMsg = Repl(fallbackMsg, "$2", "" @ ResourceDesc);

		alertText = class'UIUtilities_Text'.static.GetColoredText(alertText, eUIState_Good);
		fallbackMsg = class'UIUtilities_Text'.static.GetColoredText(fallbackMsg, eUIState_Good);
//This one is used to show general resistance sourced rewards
		WarlockDisplayRewardMessage(alertText, fallbackMsg);
	} 
}

function GiveSavItems_AssassinCache()
{
	local int WhichRewardIndex;
	local String ResourceTemplateName;
	local String ResourceDesc;
	local int ResourceQuantity;
	
	local Engine LocalGameEngine;
	local int Seed;
	local int alertIndex;
	local String alertText;
	local string fallbackMsg;
//	ResourceDesc = "";

	WhichRewardIndex = `SYNC_RAND_STATIC(default.AssassinCacheLootTable.Length);
	ResourceTemplateName = AssassinCacheLootTable[WhichRewardIndex];
	ResourceDesc = SAVGetItemTemplateDescription(name(ResourceTemplateName), false);
	ResourceQuantity=1;
	SAVAddItem(ResourceTemplateName);

	if ( ResourceQuantity < 1 || ResourceDesc == "" )
	{
		`PRESBASE.UITutorialBox(ErrorTitle, Error, "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic2" );
	} 
	else 
	{
		LocalGameEngine = class'Engine'.static.GetEngine();
		Seed = LocalGameEngine.GetARandomSeed();
		LocalGameEngine.SetRandomSeeds(Seed);

		alertIndex = `SYNC_RAND_STATIC(AssassinRewardVerbiage.Length);
		alertText = AssassinRewardVerbiage[alertIndex];

		alertText = Repl(alertText, "$1", "" @ ResourceQuantity);
		alertText = Repl(alertText, "$2", "" @ ResourceDesc);

		fallbackMsg = Repl(fallbackMsg, "$1", "" @ ResourceQuantity);
		fallbackMsg = Repl(fallbackMsg, "$2", "" @ ResourceDesc);

		alertText = class'UIUtilities_Text'.static.GetColoredText(alertText, eUIState_Good);
		fallbackMsg = class'UIUtilities_Text'.static.GetColoredText(fallbackMsg, eUIState_Good);
//This one is used to show general resistance sourced rewards
		AssassinDisplayRewardMessage(alertText, fallbackMsg);
	} 
}

function GiveSavItems_HunterCache()
{
	local int WhichRewardIndex;
	local String ResourceTemplateName;
	local String ResourceDesc;
	local int ResourceQuantity;
	
	local Engine LocalGameEngine;
	local int Seed;
	local int alertIndex;
	local String alertText;
	local string fallbackMsg;
//	ResourceDesc = "";

	WhichRewardIndex = `SYNC_RAND_STATIC(default.HunterCacheLootTable.Length);
	ResourceTemplateName = HunterCacheLootTable[WhichRewardIndex];
	ResourceDesc = SAVGetItemTemplateDescription(name(ResourceTemplateName), false);
	ResourceQuantity=1;
	SAVAddItem(ResourceTemplateName);

	if ( ResourceQuantity < 1 || ResourceDesc == "" )
	{
		`PRESBASE.UITutorialBox(ErrorTitle, Error, "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic2" );
	} 
	else 
	{
		LocalGameEngine = class'Engine'.static.GetEngine();
		Seed = LocalGameEngine.GetARandomSeed();
		LocalGameEngine.SetRandomSeeds(Seed);

		alertIndex = `SYNC_RAND_STATIC(HunterRewardVerbiage.Length);
		alertText = HunterRewardVerbiage[alertIndex];

		alertText = Repl(alertText, "$1", "" @ ResourceQuantity);
		alertText = Repl(alertText, "$2", "" @ ResourceDesc);

		fallbackMsg = Repl(fallbackMsg, "$1", "" @ ResourceQuantity);
		fallbackMsg = Repl(fallbackMsg, "$2", "" @ ResourceDesc);

		alertText = class'UIUtilities_Text'.static.GetColoredText(alertText, eUIState_Good);
		fallbackMsg = class'UIUtilities_Text'.static.GetColoredText(fallbackMsg, eUIState_Good);
//This one is used to show general resistance sourced rewards
		HunterDisplayRewardMessage(alertText, fallbackMsg);
	} 
}


//////////////////
//Helper Functions
//////////////////

function CouncilDisplayRewardMessage(string inmessage, string fallbackMsg)
{	
    local String imagePath;

	if ( InStr(inmessage, "[COUNCIL1]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[COUNCIL1]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Council1";
	} 
	else if ( InStr(inmessage, "[COUNCIL2]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[COUNCIL2]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Council2";	
	} 
	else if ( InStr(inmessage, "[COUNCIL3]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[COUNCIL3]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Council3";
	}
	else if ( InStr(inmessage, "[COUNCIL4]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[COUNCIL4]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Council4";
	}
	else 
	{
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic3";
	}

	`PRESBASE.UITutorialBox(CouncilTitle, inmessage, imagePath );

}

function GuerillaOpsDisplayRewardMessage(string inmessage, string fallbackMsg)
{	
    local String imagePath;

	if ( InStr(inmessage, "[GOPS1]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[GOPS1]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-GuerillaOps1";
	} 
	else if ( InStr(inmessage, "[GOPS2]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[GOPS2]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-GuerillaOps2";	
	} 
	else if ( InStr(inmessage, "[GOPS3]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[GOPS3]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-GuerillaOps3";
	}
	else if ( InStr(inmessage, "[GOPS4]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[GOPS4]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-GuerillaOps4";
	}
	else 
	{
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic1";
	}

	`PRESBASE.UITutorialBox(GOpsTitle, inmessage, imagePath );

}

function RetaliationDisplayRewardMessage (string inmessage, string fallbackMsg)
{	
    local String imagePath;

	if ( InStr(inmessage, "[RETAL1]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[RETAL1]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Retaliation1";
	} 
	else if ( InStr(inmessage, "[RETAL2]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[RETAL2]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Retaliation2";	
	} 
	else if ( InStr(inmessage, "[RETAL3]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[RETAL3]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Retaliation3";
	}
	else if ( InStr(inmessage, "[RETAL4]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[RETAL4]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Retaliation4";
	}
	else 
	{
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic1";
	}

	`PRESBASE.UITutorialBox(RetaliationTitle, inmessage, imagePath );

}

function ResistanceOpDisplayRewardMessage (string inmessage, string fallbackMsg)
{	
    local String imagePath;

	if ( InStr(inmessage, "[RESOPS1]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[RESOPS1]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-ResOp1";
	} 
	else if ( InStr(inmessage, "[RESOPS2]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[RESOPS2]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-ResOp2";	
	} 
	else if ( InStr(inmessage, "[RESOPS3]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[RESOPS3]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-ResOp3";
	}
	else if ( InStr(inmessage, "[RESOPS4]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[RESOPS4]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-ResOp4";
	}
	else 
	{
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic4";
	}

	`PRESBASE.UITutorialBox(ResOpsTitle, inmessage, imagePath );
	
}

function SupplyRaidDisplayRewardMessage (string inmessage, string fallbackMsg)
{	
    local String imagePath;

	if ( InStr(inmessage, "[SUPRAID1]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[SUPRAID1]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-ADVENT1";
	} 
	else if ( InStr(inmessage, "[SUPRAID2]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[SUPRAID2]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-ADVENT2";	
	} 
	else if ( InStr(inmessage, "[SUPRAID3]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[SUPRAID3]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-ADVENT3";
	}
	else if ( InStr(inmessage, "[SUPRAID4]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[SUPRAID4]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-ADVENT4";
	}
	else 
	{
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic2";
	}

	`PRESBASE.UITutorialBox(SupRaidTitle, inmessage, imagePath );
	
}

function UFORaidDisplayRewardMessage (string inmessage, string fallbackMsg)
{	
    local String imagePath;

	if ( InStr(inmessage, "[UFORAID1]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[UFORAID1]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Alien1";
	} 
	else if ( InStr(inmessage, "[UFORAID2]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[UFORAID2]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Alien2";	
	} 
	else if ( InStr(inmessage, "[UFORAID3]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[UFORAID3]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Alien3";
	}
	else if ( InStr(inmessage, "[UFORAID4]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[UFORAID4]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Alien4";
	}
	else 
	{
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic3";
	}

	`PRESBASE.UITutorialBox(UFORaidTitle, inmessage, imagePath );
	
}

function BlacksiteDisplayRewardMessage (string inmessage, string fallbackMsg)
{	
    local String imagePath;

	if ( InStr(inmessage, "[BLKSITE1]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[BLKSITE1]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-GoldBlacksite";
	} 
	else 
	{
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic3";
	}

	`PRESBASE.UITutorialBox(BlacksiteTitle, inmessage, imagePath );
	
}

function ForgeDisplayRewardMessage (string inmessage, string fallbackMsg)
{	
    local String imagePath;

	if ( InStr(inmessage, "[FORGE1]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[FORGE1]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-GoldForge";
	} 
	else 
	{
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic3";
	}

	`PRESBASE.UITutorialBox(ForgeTitle, inmessage, imagePath );
	
}

function GatewayDisplayRewardMessage (string inmessage, string fallbackMsg)
{	
    local String imagePath;

	if ( InStr(inmessage, "[GATE1]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[GATE1]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-GoldPsiGate";
	} 
	else 
	{
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic3";
	}

	`PRESBASE.UITutorialBox(GatewayTitle, inmessage, imagePath );
	
}

function AVATARFacilityDisplayRewardMessage (string inmessage, string fallbackMsg)
{	
    local String imagePath;

	if ( InStr(inmessage, "[AVATARF1]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[AVATARF1]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-AVATARFacility";
	} 
	else 
	{
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic3";
	}

	`PRESBASE.UITutorialBox(AVATARFacilityTitle, inmessage, imagePath );
	
}

function WarlockDisplayRewardMessage (string inmessage, string fallbackMsg)
{	
    local String imagePath;

	if ( InStr(inmessage, "[WARLOCK1]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[WARLOCK1]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-ChoWarlock";
	} 
	else 
	{
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic2";
	}

	`PRESBASE.UITutorialBox(WarlockTitle, inmessage, imagePath );
	
}

function AssassinDisplayRewardMessage (string inmessage, string fallbackMsg)
{	
    local String imagePath;

	if ( InStr(inmessage, "[ASSASSIN1]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[ASSASSIN1]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-ChoAssassin";
	} 
	else 
	{
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic2";
	}

	`PRESBASE.UITutorialBox(AssassinTitle, inmessage, imagePath );
	
}

function HunterDisplayRewardMessage (string inmessage, string fallbackMsg)
{	
    local String imagePath;

	if ( InStr(inmessage, "[HUNTER1]") >= 0 ) 
	{
		inmessage = Repl(inmessage, "[HUNTER1]", "");
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-ChoHunter";
	} 
	else 
	{
		imagePath = "img:///UILibrary_SavageItems.MissionRewards.SAVMissionRewards-Generic2";
	}

	`PRESBASE.UITutorialBox(HunterTitle, inmessage, imagePath );
	
}

exec function SAVAddItem(string strItemTemplate, optional int Quantity = 1)
{
	local X2ItemTemplateManager ItemManager;
	local X2ItemTemplate ItemTemplate;
	local XComGameState NewGameState;
	local XComGameState_Item ItemState;
	local XComGameState_HeadquartersXCom HQState;
	local XComGameStateHistory History;

	ItemManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	ItemTemplate = ItemManager.FindItemTemplate(name(strItemTemplate));
	if (ItemTemplate == none)
	{
		`log("No item template named" @ strItemTemplate @ "was found.");
		return;
	}
	History = `XCOMHISTORY;
	HQState = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	`assert(HQState != none);
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Add Item Cheat: Create Item");
	ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
	NewGameState.AddStateObject(ItemState);
	ItemState.Quantity = Quantity;
	`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Add Item Cheat: Complete");
	HQState = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(HQState.Class, HQState.ObjectID));
	HQState.AddItemToHQInventory(ItemState);
	NewGameState.AddStateObject(HQState);
	`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	`log("Added item" @ strItemTemplate @ "object id" @ ItemState.ObjectID);

}

function string SAVGetItemTemplateDescription(name TemplateName, bool plural) {
	local X2ItemTemplateManager ItemManager;
	local X2ItemTemplate ItemTemplate;
	ItemManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	ItemTemplate = ItemManager.FindItemTemplate(TemplateName);

	if ( ItemTemplate != none ) {
		if ( plural ) {
			return ItemTemplate.GetItemFriendlyNamePlural();
		} else {
			return ItemTemplate.GetItemFriendlyName();
		}
	}
	return "";
}

defaultProperties
{
	// Leaving this assigned to none will cause every screen to trigger its signals on this class
	ScreenClass = none
}