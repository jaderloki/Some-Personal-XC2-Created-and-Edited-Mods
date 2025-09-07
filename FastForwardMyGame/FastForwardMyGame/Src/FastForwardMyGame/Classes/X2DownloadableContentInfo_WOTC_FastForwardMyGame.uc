class X2DownloadableContentInfo_WOTC_FastForwardMyGame extends X2DownloadableContentInfo;

static event OnLoadedSavedGame()
{
	//ligar();
}

static event InstallNewCampaign(XComGameState StartState)
{
}

static event OnPostTemplatesCreated()
{
	
}

static event OnPreMission(XComGameState NewGameState, XComGameState_MissionSite MissionState)
{
	//ligar();
}

static event OnLoadedSavedGameToStrategy()
{
	//ligar();
}

static event OnPostMission()
{
	//ligar();
}

/// <summary>
/// Called after the player exits the post-mission sequence while this DLC / Mod is installed.
/// </summary>
static event OnExitPostMissionSequence()
{
	//ligar();
}

static simulated function ligar(){
	local UIOptionsPCScreen.EUI_PCOptions_Tabs gaficos;

	`LOG("LIGAR coisaDoida INICIO");
	if(`PRESBASE != none){
		gaficos = ePCTab_Graphics;

		//`PRESBASE.Init();
		if(`PRESBASE.IsPCOptionsRaised() != true){
			`PRESBASE.InitUIScreens();
			`PRESBASE.UIPCOptions(true);
		}
		`PRESBASE.UIRedScreen();
		//`PRESBASE.PlayUISound(eSUISound_MenuSelect);
		`PRESBASE.m_kPCOptions.SetSelectedTab(`PRESBASE.m_kPCOptions.m_iCurrentTab + 1, true);

		`PRESBASE.m_kPCOptions.bGraphicsAutoDetectInProgress = true;
		//`PRESBASE.m_kPCOptions.Hide();
		//`PRESBASE.m_kPCOptions.NavHelp.Hide();
		`XENGINE.RunGPUAutoDetect(true, ligarPOST);
		`PRESBASE.m_kPCOptions.GPUAutoDetectFinished();
		`PRESBASE.m_kPCOptions.Navigator.SetSelected(`PRESBASE.m_kPCOptions.SaveAndExitButton);
		`PRESBASE.m_kPCOptions.SaveAndExit(`PRESBASE.m_kPCOptions.SaveAndExitButton);
		`PRESBASE.m_kPCOptions.ExitScreen();
		`PRESBASE.m_kPCOptions.Movie.Stack.Pop(`PRESBASE.m_kPCOptions);
	}
}

static simulated function ligarPOST(){
	if(`PRESBASE != none){
		
	}
	`LOG("LIGAR coisaDoida FIM - CHAMAR PARA FINALIZAR");
}

static simulated function closeGraficos(){
	if(`PRESBASE != none){
		`PRESBASE.m_kPCOptions.SaveAndExitFinal();
		`PRESBASE.m_kPCOptions.ExitScreen();
	}
	`LOG("FINALIZADO GRAFICOS");
}

static simulated function desligar(){
	local UIOptionsPCScreen.EUI_PCOptions_Tabs gaficos;
	local UIOptionsPCScreen.EUI_PCOptions_GraphicsSettings gaficosSetingus;
	local UIOptionsPCScreen.EUI_PCOptions_Graphics gaficosOptinus_Preset                ;
	local UIOptionsPCScreen.EUI_PCOptions_Graphics gaficosOptinus_Shadow                ;
	local UIOptionsPCScreen.EUI_PCOptions_Graphics gaficosOptinus_ShadowQuality         ;
	local UIOptionsPCScreen.EUI_PCOptions_Graphics gaficosOptinus_TextureFiltering      ;
	local UIOptionsPCScreen.EUI_PCOptions_Graphics gaficosOptinus_TextureDetail         ;
	local UIOptionsPCScreen.EUI_PCOptions_Graphics gaficosOptinus_AntiAliasing          ;
	local UIOptionsPCScreen.EUI_PCOptions_Graphics gaficosOptinus_AmbientOcclusion      ;
	local UIOptionsPCScreen.EUI_PCOptions_Graphics gaficosOptinus_Effects               ;
	local UIOptionsPCScreen.EUI_PCOptions_Graphics gaficosOptinus_Bloom                 ;
	local UIOptionsPCScreen.EUI_PCOptions_Graphics gaficosOptinus_DepthOfField          ;
	local UIOptionsPCScreen.EUI_PCOptions_Graphics gaficosOptinus_DirtyLens             ;
	local UIOptionsPCScreen.EUI_PCOptions_Graphics gaficosOptinus_Decals                ;
	local UIOptionsPCScreen.EUI_PCOptions_Graphics gaficosOptinus_SubsurfaceScattering  ;
	local UIOptionsPCScreen.EUI_PCOptions_Graphics gaficosOptinus_ScreenSpaceReflections;
	local UIOptionsPCScreen.EUI_PCOptions_Graphics gaficosOptinus_MaxDrawDistance       ;

	`LOG("DESLIGAR coisaDoida INCIAR");
	if(`PRESBASE != none){
		gaficos = ePCTab_Graphics;
		gaficosSetingus = eGraphicsSetting_Minimal;
		gaficosOptinus_Preset                            = ePCGraphics_Preset;
		gaficosOptinus_Shadow                            = ePCGraphics_Shadow;
		gaficosOptinus_ShadowQuality                     = ePCGraphics_ShadowQuality;
		gaficosOptinus_TextureFiltering                  = ePCGraphics_TextureFiltering;
		gaficosOptinus_TextureDetail                     = ePCGraphics_TextureDetail;
		gaficosOptinus_AntiAliasing                      = ePCGraphics_AntiAliasing;
		gaficosOptinus_AmbientOcclusion                  = ePCGraphics_AmbientOcclusion;
		gaficosOptinus_Effects                           = ePCGraphics_Effects;
		gaficosOptinus_Bloom                             = ePCGraphics_Bloom;
		gaficosOptinus_DepthOfField                      = ePCGraphics_DepthOfField;
		gaficosOptinus_DirtyLens                         = ePCGraphics_DirtyLens;
		gaficosOptinus_Decals                            = ePCGraphics_Decals;
		gaficosOptinus_SubsurfaceScattering              = ePCGraphics_SubsurfaceScattering;
		gaficosOptinus_ScreenSpaceReflections            = ePCGraphics_ScreenSpaceReflections;
		gaficosOptinus_MaxDrawDistance                   = ePCGraphics_MaxDrawDistance;

		//`PRESBASE.Init();
		if(`PRESBASE.IsPCOptionsRaised() != true){
			`PRESBASE.InitUIScreens();
			`PRESBASE.UIPCOptions(true);
		}
		`PRESBASE.UIRedScreen();
		//`PRESBASE.PlayUISound(eSUISound_MenuSelect);
		`PRESBASE.m_kPCOptions.SetSelectedTab(`PRESBASE.m_kPCOptions.m_iCurrentTab + 1, true);
		//`PRESBASE.m_kPCOptions.SetPresetState();
		`PRESBASE.m_kPCOptions.SetShadowSysSetting(gaficosSetingus);
		`PRESBASE.m_kPCOptions.SetShadowQualitySysSetting(gaficosSetingus);
		`PRESBASE.m_kPCOptions.SetTextureFilteringSysSetting(gaficosSetingus);
		`PRESBASE.m_kPCOptions.SetTextureDetailSysSetting(gaficosSetingus);
		`PRESBASE.m_kPCOptions.SetAntiAliasingSysSetting(gaficosSetingus);
		`PRESBASE.m_kPCOptions.SetAmbientOcclusionSysSetting(gaficosSetingus);
		`PRESBASE.m_kPCOptions.SetMaxDrawDistanceSysSetting(gaficosSetingus);
		`PRESBASE.m_kPCOptions.SetEffectsSysSetting(gaficosSetingus);
		`PRESBASE.m_kPCOptions.SetBloomSysSetting(gaficosSetingus);
		`PRESBASE.m_kPCOptions.SetDepthOfFieldSysSetting(gaficosSetingus);
		`PRESBASE.m_kPCOptions.SetDirtyLensSysSetting(gaficosSetingus);
		`PRESBASE.m_kPCOptions.SetDecalsSysSetting(gaficosSetingus);
		`PRESBASE.m_kPCOptions.SetSubsurfaceScatteringSysSettings(gaficosSetingus);
		`PRESBASE.m_kPCOptions.SetScreenSpaceReflectionsSysSetting(gaficosSetingus);
		//`PRESBASE.m_kPCOptions.UpdateGraphicsWidgetCommon();
		//`PRESBASE.m_kPCOptions.ApplyPresetState(true);
		//`PRESBASE.m_kPCOptions.SetGraphicsValsFromCurrentSettings();

		`PRESBASE.m_kPCOptions.GraphicsVals[gaficosOptinus_Preset] = 0;
		`PRESBASE.m_kPCOptions.GraphicsVals[gaficosOptinus_Shadow] = `PRESBASE.m_kPCOptions.DetermineIndexFromSetting(gaficosOptinus_Shadow, `PRESBASE.m_kPCOptions.GetCurrentShadowSetting());
		`PRESBASE.m_kPCOptions.GraphicsVals[gaficosOptinus_ShadowQuality] = `PRESBASE.m_kPCOptions.DetermineIndexFromSetting(gaficosOptinus_ShadowQuality, `PRESBASE.m_kPCOptions.GetCurrentShadowQualitySetting());
		`PRESBASE.m_kPCOptions.GraphicsVals[gaficosOptinus_TextureFiltering] = `PRESBASE.m_kPCOptions.DetermineIndexFromSetting(gaficosOptinus_TextureFiltering, `PRESBASE.m_kPCOptions.GetCurrentTextureFilteringSetting());
		`PRESBASE.m_kPCOptions.GraphicsVals[gaficosOptinus_TextureDetail] = `PRESBASE.m_kPCOptions.DetermineIndexFromSetting(gaficosOptinus_TextureDetail, `PRESBASE.m_kPCOptions.GetCurrentTextureDetailSetting());
		`PRESBASE.m_kPCOptions.GraphicsVals[gaficosOptinus_AntiAliasing] = `PRESBASE.m_kPCOptions.DetermineIndexFromSetting(gaficosOptinus_AntiAliasing, `PRESBASE.m_kPCOptions.GetCurrentAntiAliasingSetting());
		`PRESBASE.m_kPCOptions.GraphicsVals[gaficosOptinus_AmbientOcclusion] = `PRESBASE.m_kPCOptions.DetermineIndexFromSetting(gaficosOptinus_AmbientOcclusion, `PRESBASE.m_kPCOptions.GetCurrentAmbientOcclusionSetting());
		`PRESBASE.m_kPCOptions.GraphicsVals[gaficosOptinus_Effects] = `PRESBASE.m_kPCOptions.DetermineIndexFromSetting(gaficosOptinus_Effects, `PRESBASE.m_kPCOptions.GetCurrentEffectsSetting());
		`PRESBASE.m_kPCOptions.GraphicsVals[gaficosOptinus_Bloom] = `PRESBASE.m_kPCOptions.DetermineIndexFromSetting(gaficosOptinus_Bloom, `PRESBASE.m_kPCOptions.GetCurrentBloomSetting());
		`PRESBASE.m_kPCOptions.GraphicsVals[gaficosOptinus_DepthOfField] = `PRESBASE.m_kPCOptions.DetermineIndexFromSetting(gaficosOptinus_DepthOfField, `PRESBASE.m_kPCOptions.GetCurrentDepthOfFieldSetting());
		`PRESBASE.m_kPCOptions.GraphicsVals[gaficosOptinus_DirtyLens] = `PRESBASE.m_kPCOptions.DetermineIndexFromSetting(gaficosOptinus_DirtyLens, `PRESBASE.m_kPCOptions.GetCurrentDirtyLensSetting());
		`PRESBASE.m_kPCOptions.GraphicsVals[gaficosOptinus_Decals] = `PRESBASE.m_kPCOptions.DetermineIndexFromSetting(gaficosOptinus_Decals, `PRESBASE.m_kPCOptions.GetCurrentDecalsSetting());
		`PRESBASE.m_kPCOptions.GraphicsVals[gaficosOptinus_SubsurfaceScattering] = `PRESBASE.m_kPCOptions.DetermineIndexFromSetting(gaficosOptinus_SubsurfaceScattering, `PRESBASE.m_kPCOptions.GetCurrentSubsurfaceScatteringSetting());
		`PRESBASE.m_kPCOptions.GraphicsVals[gaficosOptinus_ScreenSpaceReflections] = `PRESBASE.m_kPCOptions.DetermineIndexFromSetting(gaficosOptinus_ScreenSpaceReflections, `PRESBASE.m_kPCOptions.GetCurrentScreenSpaceReflectionsSetting());
		`PRESBASE.m_kPCOptions.GraphicsVals[gaficosOptinus_MaxDrawDistance] = `PRESBASE.m_kPCOptions.DetermineIndexFromSetting(gaficosOptinus_MaxDrawDistance, `PRESBASE.m_kPCOptions.GetCurrentMaxDrawDistanceSetting());

		`PRESBASE.m_kPCOptions.GPUAutoDetectFinished();
		`PRESBASE.m_kPCOptions.Navigator.SetSelected(`PRESBASE.m_kPCOptions.SaveAndExitButton);
		`PRESBASE.m_kPCOptions.SaveAndExit(`PRESBASE.m_kPCOptions.SaveAndExitButton);
		`PRESBASE.m_kPCOptions.ExitScreen();
		`PRESBASE.m_kPCOptions.Movie.Stack.Pop(`PRESBASE.m_kPCOptions);
	}
}

exec simulated function jaderLigar(){
	ligar();
}

exec simulated function jaderDesligar(){
	desligar();
}

exec simulated function buceta(){
	if(`PRESBASE != none){
		`PRESBASE.m_kPCOptions.Navigator.SetSelected(`PRESBASE.m_kPCOptions.SaveAndExitButton);
		`PRESBASE.m_kPCOptions.SaveAndExit(`PRESBASE.m_kPCOptions.SaveAndExitButton);
		`PRESBASE.m_kPCOptions.ExitScreen();
	}
	`LOG("FINALIZADO GRAFICOS");
}
