class UIMission_SavItemsSupplyRaid extends UIMission;

var public localized String m_strSavItemsSupplyMission;
var public localized String m_strSavItemsLockedHelp;
var public localized String m_strSavItemsRaidDesc;
var public localized String m_strSavItemsBuyRaid;
var public localized String m_strSavItemsSupplyRaidTitleGreeble;
var public localized string m_strSavItemsSupplyRaidGreeble;

var array<UIPanel> arrOptionsWidgets;

//----------------------------------------------------------------------------
// MEMBERS

simulated function InitScreen(XComPlayerController InitController, UIMovie InitMovie, optional name InitName)
{
	super.InitScreen(InitController, InitMovie, InitName);

	FindMission('MissionSource_SAVSupplyRaid');

	BuildScreen();
}

//Override this in child classes. 
simulated function Name GetLibraryID()
{
	return 'Alert_SupplyRaidBlades';
}

simulated function BuildScreen()
{
	// Add Interception warning and Shadow Chamber info 
	super.BuildScreen();

	Navigator.Clear();
	Button1.OnLoseFocus();
	Button2.OnLoseFocus();
	Button3.OnLoseFocus();
	PlaySFX("Geoscape_Supply_Raid_Popup");
	XComHQPresentationLayer(Movie.Pres).CAMSaveCurrentLocation();

	if(bInstantInterp)
	{
		XComHQPresentationLayer(Movie.Pres).CAMLookAtEarth(GetMission().Get2DLocation(), CAMERA_ZOOM, 0);
	}
	else
	{
		XComHQPresentationLayer(Movie.Pres).CAMLookAtEarth(GetMission().Get2DLocation(), CAMERA_ZOOM);
	}
	// For this particular screen Button1, and Button2 are specifically getting used.
	// INS:
	Button1.SetResizeToText(true);
	Button2.SetResizeToText(true);
	Button1.SetStyle(eUIButtonStyle_HOTLINK_BUTTON);
	Button1.SetGamepadIcon(class 'UIUtilities_Input'.static.GetAdvanceButtonIcon());
	Button2.SetStyle(eUIButtonStyle_HOTLINK_BUTTON);
	Button2.SetGamepadIcon(class 'UIUtilities_Input'.static.GetBackButtonIcon());
}
simulated function OnButtonSizeRealized()
{
	super.OnButtonSizeRealized();

	Button1.SetX(-Button1.Width / 2.0);
	Button2.SetX(-Button2.Width / 2.0);

	Button1.SetY(10.0);
	Button2.SetY(40.0);
}

simulated function BuildMissionPanel()
{
	LibraryPanel.MC.BeginFunctionOp("UpdateSupplyRaidButtonBlade");
	LibraryPanel.MC.QueueString(m_strSAVItemsSupplyRaidTitleGreeble);
	LibraryPanel.MC.QueueString(GetRaidDesc());
	LibraryPanel.MC.QueueString(m_strLaunchMission);
	LibraryPanel.MC.QueueString(m_strIgnore);
	LibraryPanel.MC.EndOp();

	Button1.OnClickedDelegate = OnLaunchClicked;
	Button2.OnClickedDelegate = OnCancelClicked;

	Button3.Hide();
	ConfirmButton.Hide();
}

simulated function BuildOptionsPanel()
{
	LibraryPanel.MC.BeginFunctionOp("UpdateSupplyRaidInfoBlade");
	LibraryPanel.MC.QueueString(GetMissionImage());
	LibraryPanel.MC.QueueString(m_strSAVItemsSupplyMission);
	LibraryPanel.MC.QueueString(GetRegion().GetMyTemplate().DisplayName);
	LibraryPanel.MC.QueueString(GetOpName());
	LibraryPanel.MC.QueueString(m_strMissionObjective);
	LibraryPanel.MC.QueueString(GetObjectiveString());
	LibraryPanel.MC.QueueString(m_strSAVItemsSupplyRaidGreeble);

	// Launch/Help Panel
	LibraryPanel.MC.QueueString("");
	LibraryPanel.MC.QueueString("");
	LibraryPanel.MC.QueueString("");
	LibraryPanel.MC.QueueString("");

	LibraryPanel.MC.EndOp();
}

simulated function bool OnUnrealCommand(int cmd, int arg)
{
	if(!CheckInputIsReleaseOrDirectionRepeat(cmd, arg))
		return false;

	switch(cmd)
	{
	case class 'UIUtilities_Input'.const.FXS_BUTTON_A:
	case class 'UIUtilities_Input'.const.FXS_KEY_ENTER:
	case class 'UIUtilities_Input'.const.FXS_KEY_SPACEBAR:
		if(Button1 != none && Button1.OnClickedDelegate != none)
		{
			Button1.OnClickedDelegate(Button1);
			return true;
		}
	}
	return super.OnUnrealCommand(cmd, arg);
}

//-------------- EVENT HANDLING --------------------------------------------------------
simulated function UpdateData()
{
	super.UpdateData();
	BuildOptionsPanel();
}

//-------------- GAME DATA HOOKUP --------------------------------------------------------
simulated function String GetRaidDesc()
{
	local XGParamTag ParamTag;

	ParamTag = XGParamTag(`XEXPANDCONTEXT.FindTag("XGParam"));
	ParamTag.StrValue0 = GetRegionName();

	return `XEXPAND.ExpandString(m_strSAVItemsRaidDesc);
}

//==============================================================================

defaultproperties
{
	InputState = eInputState_Consume;
	Package = "/ package/gfxAlerts/Alerts";
}