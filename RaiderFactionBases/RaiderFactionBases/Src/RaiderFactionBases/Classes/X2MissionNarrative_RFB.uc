
class X2MissionNarrative_RFB extends X2MissionNarrative;

static function array<X2DataTemplate> CreateTemplates()
{
    local array<X2MissionNarrativeTemplate> Templates;

    // Data Retrieval
    Templates.AddItem(AddDataRetrievalNarrativeTemplate());

	// Base Takedown
	Templates.AddItem(AddRaiderBaseTakedownNarrativeTemplate());

	// Datamine
	Templates.AddItem(AddDatamineNarrativeTemplate());
    return Templates;
}

static function X2MissionNarrativeTemplate AddDatamineNarrativeTemplate()
{
    local X2MissionNarrativeTemplate Template;

    `CREATE_X2MISSIONNARRATIVE_TEMPLATE(Template, 'RM_RaiderDatamine');

	Template.MissionType = "RM_CovertOp_Datamine";
    Template.NarrativeMoments[0]="X2NarrativeMoments.TACTICAL.General.GenTactical_SecureRetreat";
    Template.NarrativeMoments[1]="X2NarrativeMoments.TACTICAL.General.GenTactical_ConsiderRetreat";
    Template.NarrativeMoments[2]="X2NarrativeMoments.TACTICAL.General.GenTactical_PartialEVAC";
    Template.NarrativeMoments[3]="X2NarrativeMoments.TACTICAL.General.GenTactical_FullEVAC";
    Template.NarrativeMoments[4]="X2NarrativeMoments.TACTICAL.ProtectDevice.T_Protect_Device_PrDv_Intro";
    Template.NarrativeMoments[5]="X2NarrativeMoments.TACTICAL.ProtectDevice.T_Protect_Device_PrDv_ProceedToSweep";
    Template.NarrativeMoments[6]="X2NarrativeMoments.TACTICAL.ProtectDevice.T_Protect_Device_PrDv_STObjDestroyed";
    Template.NarrativeMoments[7]="X2NarrativeMoments.TACTICAL.General.CEN_Gen_BurnoutSecured_02";
    Template.NarrativeMoments[8]="X2NarrativeMoments.TACTICAL.General.GenTactical_SquadWipe";
    Template.NarrativeMoments[9]="X2NarrativeMoments.TACTICAL.General.GenTactical_MissionExtroFailure";
    Template.NarrativeMoments[10]="X2NarrativeMoments.TACTICAL.General.GenTactical_MissionExtroPartialSuccess";
    Template.NarrativeMoments[11]="X2NarrativeMoments.TACTICAL.General.GenTactical_MissionExtroTotalSuccess";
    Template.NarrativeMoments[12]="X2NarrativeMoments.T_Protect_Device_Sighted_Central";
	//now this is where we do the recover objective phase too
	Template.NarrativeMoments[13]="X2NarrativeMoments.TACTICAL.Recover.Recover_TacIntro"; //objective spawned, it's timed
	Template.NarrativeMoments[14]="X2NarrativeMoments.TACTICAL.Recover.Recover_TimerNagLast"; //timer about to expire
	Template.NarrativeMoments[15]="X2NarrativeMoments.TACTICAL.Recover.Recover_STObjDestroyedEnemyRemain"; //lost objective
    Template.NarrativeMoments[16]="X2NarrativeMoments.TACTICAL.Recover.Recover_STObjDestroyedMissionOver";
    Template.NarrativeMoments[17]="X2NarrativeMoments.TACTICAL.Recover.Recover_AllEnemiesDefeatedContinue"; 
    Template.NarrativeMoments[18]="X2NarrativeMoments.TACTICAL.Recover.Recover_ObjAcquiredNoRNF"; //reinforcements end once objective is gotten or destroyed
	Template.NarrativeMoments[19]="X2NarrativeMoments.TACTICAL.General.GenTactical_TacWinOnly"; //tactical objective done only
    Template.NarrativeMoments[20]="X2NarrativeMoments.TACTICAL.Recover.Recover_STObjSpotted";
    Template.NarrativeMoments[21]="X2NarrativeMoments.TACTICAL.Recover.Recover_STObjReacquired";
    Template.NarrativeMoments[22]="X2NarrativeMoments.TACTICAL.Recover.SKY_RecoGEN_ItemSecured";
    Template.NarrativeMoments[23]="X2NarrativeMoments.TACTICAL.Recover.Recover_STObjDropped";
    return Template;
}

static function X2MissionNarrativeTemplate AddRaiderBaseTakedownNarrativeTemplate()
{
    local X2MissionNarrativeTemplate Template;

    `CREATE_X2MISSIONNARRATIVE_TEMPLATE(Template, 'RM_RaiderBaseTakedown');
	
    Template.MissionType = "RM_CovertOp_BaseTakedown";
    Template.NarrativeMoments[0]="X2NarrativeMoments.TACTICAL.Neutralize.Neutralize_TacIntro"; // generalized intro: 
    Template.NarrativeMoments[1]="X2NarrativeMoments.TACTICAL.General.GenTactical_SecureRetreat";
    Template.NarrativeMoments[2]="X2NarrativeMoments.TACTICAL.General.GenTactical_ConsiderRetreat";
    Template.NarrativeMoments[3]="X2NarrativeMoments.TACTICAL.General.GenTactical_AdviseRetreat";
    Template.NarrativeMoments[4]="X2NarrativeMoments.TACTICAL.General.GenTactical_PartialEVAC";
    Template.NarrativeMoments[5]="X2NarrativeMoments.TACTICAL.General.GenTactical_FullEVAC";
    Template.NarrativeMoments[6]="X2NarrativeMoments.TACTICAL.Recover.Recover_STObjSpotted";
    Template.NarrativeMoments[7]="X2NarrativeMoments.TACTICAL.Recover.Recover_STObjReacquired";
    Template.NarrativeMoments[8]="X2NarrativeMoments.TACTICAL.Recover.SKY_RecoGEN_ItemSecured";
    Template.NarrativeMoments[9]="X2NarrativeMoments.TACTICAL.Recover.Recover_STObjDropped";
    Template.NarrativeMoments[10]="X2NarrativeMoments.TACTICAL.Sabotage.Sabotage_RNFIncoming"; // warning that reinforcements will arrive soon
    Template.NarrativeMoments[11]="X2NarrativeMoments.TACTICAL.Recover.Recover_TimerNagLast";
    Template.NarrativeMoments[12]="X2NarrativeMoments.TACTICAL.General.CEN_ExtrGEN_ProceedToSweep"; // strategy objective destroyed, proceed to evac
    Template.NarrativeMoments[13]="X2NarrativeMoments.TACTICAL.General.CEN_ExtrGEN_ProceedToSweep"; // same as bove
    Template.NarrativeMoments[14]="X2NarrativeMoments.TACTICAL.Recover.Recover_AllEnemiesDefeatedContinue";// this should never be used because we're always calling reinforcements
    Template.NarrativeMoments[15]="X2NarrativeMoments.TACTICAL.Recover.Recover_ObjAcquiredNoRNF"; // this should never be used because we're always calling reinforcements
    Template.NarrativeMoments[16]="X2NarrativeMoments.TACTICAL.Forge.Forge_PrototypeAcquired"; // "package secured, move to evac"
    Template.NarrativeMoments[17]="X2NarrativeMoments.TACTICAL.Extract.Central_Extract_VIP_Evac_Destroyed"; // play if evac zone is destroyed
    Template.NarrativeMoments[18]="X2NarrativeMoments.TACTICAL.General.GenTactical_SquadWipe";
    Template.NarrativeMoments[19]="X2NarrativeMoments.TACTICAL.General.GenTactical_MissionExtroFailure";
    Template.NarrativeMoments[20]="X2NarrativeMoments.TACTICAL.General.GenTactical_MissionExtroPartialSuccess";
    Template.NarrativeMoments[21]="X2NarrativeMoments.TACTICAL.General.GenTactical_MissionExtroTotalSuccess";
    Template.NarrativeMoments[22]="XPACK_NarrativeMoments.X2_XP_CEN_T_Swarm_EVAC_Is_Ready"; // play when evac zone is placed
    Template.NarrativeMoments[23]="X2NarrativeMoments.TACTICAL.General.GenTactical_SquadWipe";

    return Template;
}
static function X2MissionNarrativeTemplate AddDataRetrievalNarrativeTemplate()
{
    local X2MissionNarrativeTemplate Template;

    `CREATE_X2MISSIONNARRATIVE_TEMPLATE(Template, 'RM_DataRetrieval');
	
    Template.MissionType = "RM_CovertOp_DataRetrieval";
    Template.NarrativeMoments[0]="X2NarrativeMoments.TACTICAL.Recover.CEN_RecoGEN_Intro"; // generalized intro: 
    Template.NarrativeMoments[1]="X2NarrativeMoments.TACTICAL.General.GenTactical_SecureRetreat";
    Template.NarrativeMoments[2]="X2NarrativeMoments.TACTICAL.General.GenTactical_ConsiderRetreat";
    Template.NarrativeMoments[3]="X2NarrativeMoments.TACTICAL.General.GenTactical_AdviseRetreat";
    Template.NarrativeMoments[4]="X2NarrativeMoments.TACTICAL.General.GenTactical_PartialEVAC";
    Template.NarrativeMoments[5]="X2NarrativeMoments.TACTICAL.General.GenTactical_FullEVAC";
    Template.NarrativeMoments[6]="X2NarrativeMoments.TACTICAL.Recover.Recover_STObjSpotted";
    Template.NarrativeMoments[7]="X2NarrativeMoments.TACTICAL.Recover.Recover_STObjReacquired";
    Template.NarrativeMoments[8]="X2NarrativeMoments.TACTICAL.Recover.SKY_RecoGEN_ItemSecured";
    Template.NarrativeMoments[9]="X2NarrativeMoments.TACTICAL.Recover.Recover_STObjDropped";
    Template.NarrativeMoments[10]="X2NarrativeMoments.TACTICAL.Sabotage.Sabotage_RNFIncoming"; // warning that reinforcements will arrive soon
    Template.NarrativeMoments[11]="X2NarrativeMoments.TACTICAL.Recover.Recover_TimerNagLast";
    Template.NarrativeMoments[12]="X2NarrativeMoments.TACTICAL.General.CEN_ExtrGEN_ProceedToSweep"; // strategy objective destroyed, proceed to evac
    Template.NarrativeMoments[13]="X2NarrativeMoments.TACTICAL.General.CEN_ExtrGEN_ProceedToSweep"; // same as bove
    Template.NarrativeMoments[14]="X2NarrativeMoments.TACTICAL.Recover.Recover_AllEnemiesDefeatedContinue";// this should never be used because we're always calling reinforcements
    Template.NarrativeMoments[15]="X2NarrativeMoments.TACTICAL.Recover.Recover_ObjAcquiredNoRNF"; // this should never be used because we're always calling reinforcements
    Template.NarrativeMoments[16]="X2NarrativeMoments.TACTICAL.Forge.Forge_PrototypeAcquired"; // "package secured, move to evac"
    Template.NarrativeMoments[17]="X2NarrativeMoments.TACTICAL.Extract.Central_Extract_VIP_Evac_Destroyed"; // play if evac zone is destroyed
    Template.NarrativeMoments[18]="X2NarrativeMoments.TACTICAL.General.GenTactical_SquadWipe";
    Template.NarrativeMoments[19]="X2NarrativeMoments.TACTICAL.General.GenTactical_MissionExtroFailure";
    Template.NarrativeMoments[20]="X2NarrativeMoments.TACTICAL.General.GenTactical_MissionExtroPartialSuccess";
    Template.NarrativeMoments[21]="X2NarrativeMoments.TACTICAL.General.GenTactical_MissionExtroTotalSuccess";
    Template.NarrativeMoments[22]="XPACK_NarrativeMoments.X2_XP_CEN_T_Swarm_EVAC_Is_Ready"; // play when evac zone is placed
    Template.NarrativeMoments[23]="X2NarrativeMoments.TACTICAL.General.GenTactical_SquadWipe";

    return Template;
}