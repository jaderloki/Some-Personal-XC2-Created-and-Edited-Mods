class X2DownloadableContentInfo_AdditionalDifficultyAdjustment extends X2DownloadableContentInfo;

static event OnLoadedSavedGame()
{
}

static event InstallNewCampaign(XComGameState StartState)
{
}

static event OnPostTemplatesCreated()
{
}

static event OnPreMission(XComGameState StartGameState, XComGameState_MissionSite MissionState)
{
    class'XComGameState_AdditionalDifficultyAdjustment'.static.AdjustEnemiesStats();
}

static event OnLoadedSavedGameToStrategy()
{
}