class X2DownloadableContentInfo_WOTC_AdditionalDifficultyAdjustment extends X2DownloadableContentInfo;

static event OnPostTemplatesCreated()
{
	local XComGameState_AdditionalDifficultyAdjustment s;
	
	`Log("OnPostTemplatesCreated10");
    s = XComGameState_AdditionalDifficultyAdjustment(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_AdditionalDifficultyAdjustment', true));
	class'XComGameState_AdditionalDifficultyAdjustment'.static.AdjustEnemiesStats(s);
	`Log("OnPostTemplatesCreated69");
}
