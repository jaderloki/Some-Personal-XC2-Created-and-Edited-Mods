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
