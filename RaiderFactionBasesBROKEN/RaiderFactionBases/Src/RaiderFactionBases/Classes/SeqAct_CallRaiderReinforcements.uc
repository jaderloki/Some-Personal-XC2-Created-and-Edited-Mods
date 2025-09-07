// Call reinforcements using standard lost parameters (skip visualizations, etc.)

class SeqAct_CallRaiderReinforcements extends SequenceAction
	dependson(XComAISpawnManager, X2Helpers_RM_RaiderBases);

// If >0, this value overrides the number of AI turns until reinforcements are spawned.
var() int OverrideCountdown;

// If bUseOverrideTargetLocation is true, this value overrides the target location for the next reinforcement group to spawn.
var() Vector OverrideTargetLocation;
var() bool bUseOverrideTargetLocation;

// When spawning using the OverrideTargatLocation, offset the spawner by this amount of tiles.
var() int IdealSpawnTilesOffset;

// The Name of the Reinforcement Encounter (defined in DefaultMissions.ini) that will be called in
var() Name EncounterID;

event Activated()
{
	local XComGameState_BattleData BattleData;
	local X2SitRepTemplateManager SitRepManager;
	local X2SitRepTemplate SitRepTemplate;
	local RaiderBaseDef BaseDef;
	local name WeakPod, NormPod, StrongPod, ActualPod, SitrepName;
	BattleData = XComGameState_BattleData(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_BattleData'));
	SitRepManager = class'X2SitRepTemplateManager'.static.GetSitRepTemplateManager();
	WeakPod ='';
	NormPod = '';
	StrongPod = '';
	foreach BattleData.ActiveSitReps(SitRepName)
	{
		SitRepTemplate = SitRepManager.FindSitRepTemplate(SitRepName);

		if( SitRepTemplate != none )
		{
			foreach class'X2Helpers_RM_RaiderBases'.default.BaseDefinitions(BaseDef)
			{
				if(BaseDef.SitrepName == SitrepTemplate.DataName)
				{
					WeakPod = BaseDef.WeakBucket;
					NormPod = BaseDef.NormalBucket;
					StrongPod = BaseDef.StrongBucket;
				}
			}
		}
	}

	if(EncounterID == 'COVERTOP_DUMMYPOD_STRONG')
	{
		ActualPod = StrongPod;
	}
	else if (EncounterID == 'COVERTOP_DUMMYPOD_NORMAL')
	{
		ActualPod = NormPod;
	}
	else if (WeakPod != '')
	{
		ActualPod = WeakPod;
	}
	else
	{
		ActualPod = '';
	}
	if(bUseOverrideTargetLocation)
	{
		class'XComGameState_AIReinforcementSpawner'.static.InitiateReinforcements(ActualPod, OverrideCountdown, bUseOverrideTargetLocation, OverrideTargetLocation, IdealSpawnTilesOffset, , true, 'TheLostSwarm', true, false, true, true, true);
	}
	else
	{
		class'XComGameState_AIReinforcementSpawner'.static.InitiateReinforcements(ActualPod, OverrideCountdown, , , BattleData.LostSpawningDistance, , true, 'TheLostSwarm', true, false, true, true, true);
	}		
}

defaultproperties
{
	ObjCategory="Gameplay"
	ObjName="Call Raider Reinforcements"
	bConvertedForReplaySystem=true
	OverrideCountdown=-1
}