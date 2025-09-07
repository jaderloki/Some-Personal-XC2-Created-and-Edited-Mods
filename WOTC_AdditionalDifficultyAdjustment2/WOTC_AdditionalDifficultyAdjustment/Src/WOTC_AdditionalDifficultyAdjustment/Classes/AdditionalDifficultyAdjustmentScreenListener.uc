class AdditionalDifficultyAdjustmentScreenListener extends UIScreenListener;

event OnInit(UIScreen Screen)
{
    if (`PRES == none)
        return;
    if (`PRES.GetTacticalHUD() == none)
        return;

    class'XComGameState_AdditionalDifficultyAdjustment'.static.AdjustEnemiesStats();
}
