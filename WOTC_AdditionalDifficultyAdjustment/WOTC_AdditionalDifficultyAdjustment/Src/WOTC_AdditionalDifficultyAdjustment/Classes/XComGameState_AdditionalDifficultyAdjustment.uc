class XComGameState_AdditionalDifficultyAdjustment extends XComGameState_BaseObject config(AdditionalDifficultyAdjustment);

struct CharacterTemplateData
{
    var string ID;
    var float HP;
    var float Offense;
    var float Defense;
    var float Dodge;
    var float Mobility;
    var float SightRadius;
    var float Armor;
    var float ShieldHP;
    var float PsiOffense;
    var float Will;
    var float HackDefense;
    var float DetectionRadius;
    var float CritChance;
    var float FlankingCritChance;
    var float FlankingAimBonus;
};

struct WeaponTemplateData
{
    var name ID;
    var float Damage;
    var float Crit;
};

var config array< CharacterTemplateData > CharacterTemplatesOriginalDataCopy;
var config array< WeaponTemplateData > WeaponTemplatesOriginalDataCopy;

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

function CharacterTemplateData GetTemplateOriginalDataCopy(string CharacterTemplateDataId)
{
    local CharacterTemplateData c;
    local int i;


	`Log("jader4");
    for (i = 0; i < CharacterTemplatesOriginalDataCopy.Length; ++i)
    {
        if (CharacterTemplatesOriginalDataCopy[i].ID == CharacterTemplateDataId)
            return CharacterTemplatesOriginalDataCopy[i];
    }

    return c;
}

function StoreTemplateOriginalDataCopy(CharacterTemplateData c)
{
	`Log("jader3");
    CharacterTemplatesOriginalDataCopy.AddItem(c);
}

static function XComGameState_AdditionalDifficultyAdjustment GetAdditionalDifficultyAdjustmentState()
{
   //local XComGameState NewGameState;
   //local XComGameState_AdditionalDifficultyAdjustment s;
   //
   //s = XComGameState_AdditionalDifficultyAdjustment(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_AdditionalDifficultyAdjustment', true));
   //if (s == none)
   //{
   //    NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("ffs");
   //    s = XComGameState_AdditionalDifficultyAdjustment(NewGameState.CreateStateObject(class'XComGameState_AdditionalDifficultyAdjustment'));
   //    NewGameState.AddStateObject(s);
	//	if (NewGameState.GetNumGameStateObjects() > 0)
	//	{
	//		`XCOMHISTORY.AddGameStateToHistory(NewGameState); 
	//	}
	//	else
	//	{
	//		`XCOMHISTORY.CleanupPendingGameState(NewGameState);
	//	}
   //}
   //
   //return s;
}

static function AdjustEnemiesStats(XComGameState_AdditionalDifficultyAdjustment s)
{
    local X2CharacterTemplateManager CharacterTemplateManager;
    local X2CharacterTemplate CharTemplate;
    local array<X2DataTemplate> DataTemplates;
    local X2DataTemplate Template, DiffTemplate;
    local int n, i;
    local string CharacterTemplateDataID;
    local CharacterTemplateData _CharacterTemplateData;
    //local XComGameState_AdditionalDifficultyAdjustment s;
    local float _HPMultiplier, _OffenseMultiplier, _DefenseMultiplier, _DodgeDelta, _MobilityDelta, _SightRadiusDelta, _ArmorDelta, _ShieldHP, 
        _PsiOffenseMultiplier, _WillDelta, _HackDefenseMultiplier, _DetectionRadiusDelta, _CritChanceDelta, _FlankingCritChanceDelta, _FlankingAimBonusDelta;
    local bool originalDataCopyUpdated;
    local array< name > loadoutsNames;

	`Log("jader1");
    originalDataCopyUpdated = false;

    //s = GetAdditionalDifficultyAdjustmentState();

    if (s.CharacterTemplatesOriginalDataCopy.Length == 0)
    {
        `Log("Store charachter templates original data.");
    }

    _HPMultiplier = 0.45;
	_MobilityDelta = 0.60;
    //_OffenseMultiplier = s.OffenseMultiplier();
    //_DefenseMultiplier = s.DefenseMultiplier();
    //_DodgeDelta = s.DodgeDelta();
    //_MobilityDelta = s.MobilityDelta();
    //_SightRadiusDelta = s.SightRadiusDelta();
    //_ArmorDelta = s.ArmorDelta();
    //_ShieldHP = s.ShieldHP();
    //_PsiOffenseMultiplier = s.PsiOffenseMultiplier();
    //_WillDelta = s.WillDelta();
    //_HackDefenseMultiplier = s.HackDefenseMultiplier();
    //_DetectionRadiusDelta = s.DetectionRadiusDelta();
    //_CritChanceDelta = s.CritChanceDelta();
    //_FlankingCritChanceDelta = s.FlankingCritChanceDelta();
    //_FlankingAimBonusDelta = s.FlankingAimBonusDelta();

    `Log("HPMultiplier: " $ _HPMultiplier);
    //`Log("OffenseMultiplier: " $ _OffenseMultiplier);
    //`Log("DefenseMultiplier: " $ _DefenseMultiplier);
    //`Log("DodgeDelta: " $ _DodgeDelta);
    `Log("MobilityDelta: " $ _MobilityDelta);
    //`Log("SightRadiusDelta: " $ _SightRadiusDelta);
    //`Log("ArmorDelta: " $ _ArmorDelta);
    //`Log("ShieldHP: " $ _ShieldHP);
    //`Log("PsiOffenseMultiplierer: " $ _PsiOffenseMultiplier);
    //`Log("WillDelta: " $ _WillDelta);
    //`Log("HackDefenseMultiplier: " $ _HackDefenseMultiplier);
    //`Log("DetectionRadiusDelta: " $ _DetectionRadiusDelta);
    //`Log("CritChanceDelta: " $ _CritChanceDelta);
    //`Log("FlankingCritChanceDelta: " $ _FlankingCritChanceDelta);
    //`Log("FlankingAimBonusDelta: " $ _FlankingAimBonusDelta);

    CharacterTemplateManager = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();

    foreach CharacterTemplateManager.IterateTemplates(Template, None)
    {
		`Log("naruto1");
        CharacterTemplateManager.FindDataTemplateAllDifficulties(Template.DataName, DataTemplates);
        n = 0;
        foreach DataTemplates(DiffTemplate)
        {
			`Log("naruto2");
            n++;
            CharTemplate = X2CharacterTemplate(DiffTemplate);
            if (CharTemplate != None)
            {
                if (
					!CharTemplate.bIsAdvent && 
					!CharTemplate.bIsAlien && 
                    !CharTemplate.bIsTurret && 
					!(InStr(CharTemplate.DataName, "Zombie") > -1)
				){
                    //continue;
				}

                CharacterTemplateDataID = CharTemplate.DataName $ "_" $ n;

                _CharacterTemplateData = s.GetTemplateOriginalDataCopy(CharacterTemplateDataID);

                if (_CharacterTemplateData.ID == "")
                {
                    // Save original character stats
                    _CharacterTemplateData.ID = CharacterTemplateDataID;
                    _CharacterTemplateData.HP = CharTemplate.CharacterBaseStats[eStat_HP];
					`Log("naruto5 original hp " $ CharTemplate.CharacterBaseStats[eStat_HP]);
                    _CharacterTemplateData.Offense = CharTemplate.CharacterBaseStats[eStat_Offense];
                    _CharacterTemplateData.Defense = CharTemplate.CharacterBaseStats[eStat_Defense];
                    _CharacterTemplateData.Dodge = CharTemplate.CharacterBaseStats[eStat_Dodge];
                    _CharacterTemplateData.Mobility = CharTemplate.CharacterBaseStats[eStat_Mobility];
                    _CharacterTemplateData.SightRadius = CharTemplate.CharacterBaseStats[eStat_SightRadius];
                    _CharacterTemplateData.Armor = CharTemplate.CharacterBaseStats[eStat_ArmorMitigation];
                    _CharacterTemplateData.ShieldHP = CharTemplate.CharacterBaseStats[eStat_ShieldHP];
                    _CharacterTemplateData.PsiOffense = CharTemplate.CharacterBaseStats[eStat_PsiOffense];
                    _CharacterTemplateData.Will = CharTemplate.CharacterBaseStats[eStat_Will];
                    _CharacterTemplateData.HackDefense = CharTemplate.CharacterBaseStats[eStat_HackDefense];
                    _CharacterTemplateData.DetectionRadius = CharTemplate.CharacterBaseStats[eStat_DetectionRadius];
                    _CharacterTemplateData.CritChance = CharTemplate.CharacterBaseStats[eStat_CritChance];
                    _CharacterTemplateData.FlankingCritChance = CharTemplate.CharacterBaseStats[eStat_FlankingCritChance];
                    _CharacterTemplateData.FlankingAimBonus = CharTemplate.CharacterBaseStats[eStat_FlankingAimBonus];

                    s.StoreTemplateOriginalDataCopy(_CharacterTemplateData);

                    originalDataCopyUpdated = true;
                }

				if (
					!CharTemplate.bIsAdvent && 
					!CharTemplate.bIsAlien && 
                    !CharTemplate.bIsTurret && 
					!(InStr(CharTemplate.DataName, "Zombie") > -1)
				){
					CharTemplate.CharacterBaseStats[eStat_ArmorMitigation] = -5;
				}else{
					`Log("naruto3 " $ "id: " $ CharacterTemplateDataID $ " wtf(" $ _CharacterTemplateData.HP $ ", " $ _HPMultiplier $ ") hp(Original:" $ CharTemplate.CharacterBaseStats[eStat_HP] $ ", newvalue:" $ Max(Round(_CharacterTemplateData.HP * _HPMultiplier), 1) $ ")");
					CharTemplate.CharacterBaseStats[eStat_HP] = Max(Round(_CharacterTemplateData.HP * _HPMultiplier), 1);
					CharTemplate.CharacterBaseStats[eStat_ArmorMitigation] = 1;
				}

				if (_CharacterTemplateData.Mobility != 0){
					`Log("naruto69 id: " $ CharacterTemplateDataID $ " movement modified ");
					CharTemplate.CharacterBaseStats[eStat_Mobility] = Max(Round(_CharacterTemplateData.Mobility * _MobilityDelta), 1);
				}
				//CharTemplate.CharacterBaseStats[eStat_Mobility] = -6;

                //CharTemplate.CharacterBaseStats[eStat_Offense] = Max(Round(_CharacterTemplateData.Offense * _OffenseMultiplier), 0);
                //CharTemplate.CharacterBaseStats[eStat_Defense] = Max(Round(_CharacterTemplateData.Defense * _DefenseMultiplier), 0);
                //CharTemplate.CharacterBaseStats[eStat_Dodge] = Max(Round(_CharacterTemplateData.Dodge + _DodgeDelta), 0);
                //if (_CharacterTemplateData.Mobility != 0)
                //    CharTemplate.CharacterBaseStats[eStat_Mobility] = Max(Round(_CharacterTemplateData.Mobility + _MobilityDelta), 1);
                //CharTemplate.CharacterBaseStats[eStat_SightRadius] = Max(Round(_CharacterTemplateData.SightRadius + _SightRadiusDelta), 0);
                //CharTemplate.CharacterBaseStats[eStat_ArmorMitigation] = Max(Round(_CharacterTemplateData.Armor + _ArmorDelta), 0);
                //CharTemplate.CharacterBaseStats[eStat_ShieldHP] = Max(Round(_CharacterTemplateData.ShieldHP + _ShieldHP), 0);
                //CharTemplate.CharacterBaseStats[eStat_PsiOffense] = Max(Round(_CharacterTemplateData.PsiOffense * _PsiOffenseMultiplier), 0);
                //CharTemplate.CharacterBaseStats[eStat_Will] = Max(Round(_CharacterTemplateData.Will + _WillDelta), 0);
                //CharTemplate.CharacterBaseStats[eStat_HackDefense] = Max(Round(_CharacterTemplateData.HackDefense * _HackDefenseMultiplier), 0);
                //CharTemplate.CharacterBaseStats[eStat_DetectionRadius] = Max(Round(_CharacterTemplateData.DetectionRadius + _DetectionRadiusDelta), 0);
                //CharTemplate.CharacterBaseStats[eStat_CritChance] = Max(Round(_CharacterTemplateData.CritChance + _CritChanceDelta), 0);
                //CharTemplate.CharacterBaseStats[eStat_FlankingCritChance] = Max(Round(_CharacterTemplateData.FlankingCritChance + _FlankingCritChanceDelta), 0);
                //CharTemplate.CharacterBaseStats[eStat_FlankingAimBonus] = Max(Round(_CharacterTemplateData.FlankingAimBonus + _FlankingAimBonusDelta), 0);

                //`Log("Additional Difficulty Adjustment for template " $ CharacterTemplateDataID);

                //if (loadoutsNames.Find(CharTemplate.DefaultLoadout) == INDEX_NONE)
                //{
                //    loadoutsNames.AddItem(CharTemplate.DefaultLoadout);
                //}
            }
        }
    }

    /*
	if (ProcessLoadouts(loadoutsNames, s) || originalDataCopyUpdated)
    {
        `Log("Additional Difficulty Adjustment: original data copy updated.");
        s.SaveConfig();
    }
	*/

    /*for (i = 0; i < s.CharacterTemplatesOriginalDataCopy.Length; ++i)
    {
        _CharacterTemplateData = s.CharacterTemplatesOriginalDataCopy[i];
        `Log("Array item: " $ _CharacterTemplateData.ID);
        `Log(_CharacterTemplateData.HP);
        `Log(_CharacterTemplateData.Offense);
    }*/
}