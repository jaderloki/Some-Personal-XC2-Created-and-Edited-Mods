class AdditionalDifficultyAdjustment_MCMListener extends UIScreenListener config(AdditionalDifficultyAdjustment_Config);

`include(WOTC_AdditionalDifficultyAdjustment/Src/ModConfigMenuAPI/MCM_API_Includes.uci)
`include(WOTC_AdditionalDifficultyAdjustment/Src/ModConfigMenuAPI/MCM_API_CfgHelpers.uci)

var config float HP_MULTIPLIER;
var config float OFFENSE_MULTIPLIER;
var config float DEFENSE_MULTIPLIER;
var config float DODGE_DELTA;
var config float DAMAGE_DELTA;
var config float MOBILITY_DELTA;
var config float SIGHT_RADIUS_DELTA;
var config float ARMOR_DELTA;
var config float SHIELD_HP_DELTA;
var config float PSI_OFFENSE_MULTIPLIER;
var config float WILL_DELTA;
var config float HACK_DEFENSE_MULTIPLIER;
var config float DETECTION_RADIUS_DELTA;
var config float CRIT_CHANCE_DELTA;
var config float FLANKING_CRIT_CHANCE_DELTA;
var config float FLANKING_AIM_BONUS_DELTA;

var config int CONFIG_VERSION;

event OnInit(UIScreen Screen)
{
    if (MCM_API(Screen) != none)
    {
        `MCM_API_Register(Screen, ClientModCallback);
    }
}

function string SliderValueDisplayFilter(float value)
{
    local string retstring;
    local int i;
    
    retstring = string(value / 100);

    // if there is a decimal, strip out any ending zeroes (and the decimal if necessary)
    i = InStr(retstring, ".");
    if (i > 0) {
        while (Right(retstring, 1) == "0") retstring = Left(retstring, Len(retstring) - 1);
        if    (Right(retstring, 1) == ".") retstring = Left(retstring, Len(retstring) - 1);
    }
    
    return retstring;
}

`define MCM_API_BasicSliderSaveHandler2(FuncName,VarName)\
    simulated function `{FuncName} (MCM_API_Setting _Setting, float _SettingValue) { `{VarName} = _SettingValue / 100; }

simulated function ClientModCallback(MCM_API_Instance ConfigAPI, int GameMode)
{
    local MCM_API_SettingsPage Page;
    local MCM_API_SettingsGroup Group;
    
    LoadSavedSettings();
    
    Page = ConfigAPI.NewSettingsPage("Additional Difficulty Adjustment");
    Page.SetPageTitle("Additional Difficulty Adjustment");
    Page.SetSaveHandler(SaveButtonClicked);
    
    Group = Page.AddGroup('Group1', "General Settings");

    Group.AddSlider('SliderHPMultiplier', "HP Multiplier", "The coefficient applied to the points of health of enemies.", 0.0 * 100, 10.0 * 100, 0.05 * 100, Round(HP_MULTIPLIER * 100), SaveHandler_HPMultiplier).SetValueDisplayFilter(SliderValueDisplayFilter);
    Group.AddSlider('SliderOffenseMultiplier', "Aim Multiplier", "The coefficient applied to the aim value of enemies.", 0.0 * 100, 3.0 * 100, 0.05 * 100, Round(OFFENSE_MULTIPLIER * 100), SaveHandler_OffenseMultiplier).SetValueDisplayFilter(SliderValueDisplayFilter);
    Group.AddSlider('SliderDefenseMultiplier', "Defense Multiplier", "The coefficient applied to the defense value of enemies.", 0.0 * 100, 3.0 * 100, 0.05 * 100, Round(DEFENSE_MULTIPLIER * 100), SaveHandler_DefenseMultiplier).SetValueDisplayFilter(SliderValueDisplayFilter);
    Group.AddSlider('SliderDodgeDelta', "Dodge Delta", "The value to add to the dodje value of enemies.", -100 * 100, 100 * 100, 5 * 100, Round(DODGE_DELTA * 100), SaveHandler_DodgeDelta).SetValueDisplayFilter(SliderValueDisplayFilter);
    Group.AddSlider('SliderDamageDelta', "Damage Delta", "The value to add to the damage value of enemies.", -20 * 100, 20 * 100, 1 * 100, Round(DAMAGE_DELTA * 100), SaveHandler_DamageDelta).SetValueDisplayFilter(SliderValueDisplayFilter);
    Group.AddSlider('SliderMobilityDelta', "Mobility Delta", "The value to add to the mobility value of enemies.", -20 * 100, 60 * 100, 1 * 100, Round(MOBILITY_DELTA * 100), SaveHandler_MobilityDelta).SetValueDisplayFilter(SliderValueDisplayFilter);
    Group.AddSlider('SliderSightRadiusDelta', "Sight Radius Delta", "The value to add to the sight radius value of enemies.", -20 * 100, 60 * 100, 1 * 100, Round(SIGHT_RADIUS_DELTA * 100), SaveHandler_SightRadiusDelta).SetValueDisplayFilter(SliderValueDisplayFilter);
    Group.AddSlider('SliderArmorDelta', "Armor Delta", "The value to add to the armor value of enemies.", -20 * 100, 20 * 100, 1 * 100, Round(ARMOR_DELTA * 100), SaveHandler_ArmorDelta).SetValueDisplayFilter(SliderValueDisplayFilter);
    Group.AddSlider('SliderShieldHPDelta', "Shield HP Delta", "The value to add to the shield HP value of enemies.", -20 * 100, 20 * 100, 1 * 100, Round(SHIELD_HP_DELTA * 100), SaveHandler_ShieldHPDelta).SetValueDisplayFilter(SliderValueDisplayFilter);
    Group.AddSlider('SliderPsiOffenseMultiplier', "Psi Offense Multiplier", "The coefficient applied to the psi offense value of enemies.", 0.0 * 100, 3.0 * 100, 0.05 * 100, Round(PSI_OFFENSE_MULTIPLIER * 100), SaveHandler_PsiOffenseMultiplier).SetValueDisplayFilter(SliderValueDisplayFilter);
    Group.AddSlider('SliderWillDelta', "Will Delta", "The value to add to the will value of enemies.", -100 * 100, 100 * 100, 5 * 100, Round(WILL_DELTA * 100), SaveHandler_WillDelta).SetValueDisplayFilter(SliderValueDisplayFilter);
    Group.AddSlider('HackDefenseMultiplier', "Hack Defense Multiplier", "The coefficient applied to the hack defense value of enemies.", 0.0 * 100, 3.0 * 100, 0.05 * 100, Round(HACK_DEFENSE_MULTIPLIER * 100), SaveHandler_HackDefenseMultiplier).SetValueDisplayFilter(SliderValueDisplayFilter);
    Group.AddSlider('DetectionRadiusDelta', "Detection Radius Delta", "The value to add to the detection radius value of enemies.", -20 * 100, 60 * 100, 1 * 100, Round(DETECTION_RADIUS_DELTA * 100), SaveHandler_DetectionRadiusDelta).SetValueDisplayFilter(SliderValueDisplayFilter);
    Group.AddSlider('CritChanceDelta', "Crit Chance Delta", "The value to add to the crit chance value of enemies.", -100 * 100, 100 * 100, 5 * 100, Round(CRIT_CHANCE_DELTA * 100), SaveHandler_CritChanceDelta).SetValueDisplayFilter(SliderValueDisplayFilter);
    Group.AddSlider('FlankingCritChanceDelta', "Flanking Crit Chance Delta", "The value to add to the flanking crit chance value of enemies.", -100 * 100, 100 * 100, 5 * 100, Round(FLANKING_CRIT_CHANCE_DELTA * 100), SaveHandler_FlankingCritChanceDelta).SetValueDisplayFilter(SliderValueDisplayFilter);
    Group.AddSlider('FlankingAimBonusDelta', "Flanking Aim Bonus Delta", "The value to add to the flanking aim bonus value of enemies.", -100 * 100, 100 * 100, 5 * 100, Round(FLANKING_AIM_BONUS_DELTA * 100), SaveHandler_FlankingAimBonusDelta).SetValueDisplayFilter(SliderValueDisplayFilter);
    
    Page.ShowSettings();
}

`MCM_CH_VersionChecker(class'AdditionalDifficultyAdjustmentDefaults'.default.VERSION,CONFIG_VERSION)

simulated function LoadSavedSettings()
{
    HP_MULTIPLIER = `MCM_CH_GetValue(class'AdditionalDifficultyAdjustmentDefaults'.default.HP_MULTIPLIER, HP_MULTIPLIER);
    `Log("LOAD HP_MULTIPLIER:" $ HP_MULTIPLIER);
    OFFENSE_MULTIPLIER = `MCM_CH_GetValue(class'AdditionalDifficultyAdjustmentDefaults'.default.OFFENSE_MULTIPLIER, OFFENSE_MULTIPLIER);
    DEFENSE_MULTIPLIER = `MCM_CH_GetValue(class'AdditionalDifficultyAdjustmentDefaults'.default.DEFENSE_MULTIPLIER, DEFENSE_MULTIPLIER);
    DODGE_DELTA = `MCM_CH_GetValue(class'AdditionalDifficultyAdjustmentDefaults'.default.DODGE_DELTA, DODGE_DELTA);
    DAMAGE_DELTA = `MCM_CH_GetValue(class'AdditionalDifficultyAdjustmentDefaults'.default.DAMAGE_DELTA, DAMAGE_DELTA);
    MOBILITY_DELTA = `MCM_CH_GetValue(class'AdditionalDifficultyAdjustmentDefaults'.default.MOBILITY_DELTA, MOBILITY_DELTA);
    SIGHT_RADIUS_DELTA = `MCM_CH_GetValue(class'AdditionalDifficultyAdjustmentDefaults'.default.SIGHT_RADIUS_DELTA, SIGHT_RADIUS_DELTA);
    ARMOR_DELTA = `MCM_CH_GetValue(class'AdditionalDifficultyAdjustmentDefaults'.default.ARMOR_DELTA, ARMOR_DELTA);
    SHIELD_HP_DELTA = `MCM_CH_GetValue(class'AdditionalDifficultyAdjustmentDefaults'.default.SHIELD_HP_DELTA, SHIELD_HP_DELTA);
    PSI_OFFENSE_MULTIPLIER = `MCM_CH_GetValue(class'AdditionalDifficultyAdjustmentDefaults'.default.PSI_OFFENSE_MULTIPLIER, PSI_OFFENSE_MULTIPLIER);
    WILL_DELTA = `MCM_CH_GetValue(class'AdditionalDifficultyAdjustmentDefaults'.default.WILL_DELTA, WILL_DELTA);
    HACK_DEFENSE_MULTIPLIER = `MCM_CH_GetValue(class'AdditionalDifficultyAdjustmentDefaults'.default.HACK_DEFENSE_MULTIPLIER, HACK_DEFENSE_MULTIPLIER);
    DETECTION_RADIUS_DELTA = `MCM_CH_GetValue(class'AdditionalDifficultyAdjustmentDefaults'.default.DETECTION_RADIUS_DELTA, DETECTION_RADIUS_DELTA);
    CRIT_CHANCE_DELTA = `MCM_CH_GetValue(class'AdditionalDifficultyAdjustmentDefaults'.default.CRIT_CHANCE_DELTA, CRIT_CHANCE_DELTA);
    FLANKING_CRIT_CHANCE_DELTA = `MCM_CH_GetValue(class'AdditionalDifficultyAdjustmentDefaults'.default.FLANKING_CRIT_CHANCE_DELTA, FLANKING_CRIT_CHANCE_DELTA);
    FLANKING_AIM_BONUS_DELTA = `MCM_CH_GetValue(class'AdditionalDifficultyAdjustmentDefaults'.default.FLANKING_AIM_BONUS_DELTA, FLANKING_AIM_BONUS_DELTA);
}

`MCM_API_BasicSliderSaveHandler2(SaveHandler_HPMultiplier, HP_MULTIPLIER)
`MCM_API_BasicSliderSaveHandler2(SaveHandler_OffenseMultiplier, OFFENSE_MULTIPLIER)
`MCM_API_BasicSliderSaveHandler2(SaveHandler_DefenseMultiplier, DEFENSE_MULTIPLIER)
`MCM_API_BasicSliderSaveHandler2(SaveHandler_DodgeDelta, DODGE_DELTA)
`MCM_API_BasicSliderSaveHandler2(SaveHandler_DamageDelta, DAMAGE_DELTA)
`MCM_API_BasicSliderSaveHandler2(SaveHandler_MobilityDelta, MOBILITY_DELTA)
`MCM_API_BasicSliderSaveHandler2(SaveHandler_SightRadiusDelta, SIGHT_RADIUS_DELTA)
`MCM_API_BasicSliderSaveHandler2(SaveHandler_ArmorDelta, ARMOR_DELTA)
`MCM_API_BasicSliderSaveHandler2(SaveHandler_ShieldHPDelta, SHIELD_HP_DELTA)
`MCM_API_BasicSliderSaveHandler2(SaveHandler_PsiOffenseMultiplier, PSI_OFFENSE_MULTIPLIER)
`MCM_API_BasicSliderSaveHandler2(SaveHandler_WillDelta, WILL_DELTA)
`MCM_API_BasicSliderSaveHandler2(SaveHandler_HackDefenseMultiplier, HACK_DEFENSE_MULTIPLIER)
`MCM_API_BasicSliderSaveHandler2(SaveHandler_DetectionRadiusDelta, DETECTION_RADIUS_DELTA)
`MCM_API_BasicSliderSaveHandler2(SaveHandler_CritChanceDelta, CRIT_CHANCE_DELTA)
`MCM_API_BasicSliderSaveHandler2(SaveHandler_FlankingCritChanceDelta, FLANKING_CRIT_CHANCE_DELTA)
`MCM_API_BasicSliderSaveHandler2(SaveHandler_FlankingAimBonusDelta, FLANKING_AIM_BONUS_DELTA)

simulated function SaveButtonClicked(MCM_API_SettingsPage Page)
{
    self.CONFIG_VERSION = `MCM_CH_GetCompositeVersion();
    self.SaveConfig();

    `Log("SAVE HP_MULTIPLIER:" $ HP_MULTIPLIER);
}

defaultproperties
{
    ScreenClass = none;
}