class FastForwardMyGameObserver  extends UIScreenListener implements(X2VisualizationMgrObserverInterface) config(FastForwardMyGame);

var config float Speed;
var config name Hotkey;
var config name HotkeyAtivar;
var float currentspeed;

event OnInit(UIScreen Screen)
{	
	currentspeed = default.Speed;
	XComInputBase(Screen.PC.PlayerInput).SetRawInputHandler(RawInputHandler);
	`XCOMVISUALIZATIONMGR.RegisterObserver(self);
}

event OnVisualizationBlockComplete(XComGameState NewGameState)
{
	//class'WorldInfo'.static.GetWorldInfo().Game.SetGameSpeedMultiplier(currentspeed);
}


event OnVisualizationIdle();
event OnActiveUnitChanged(XComGameState_Unit NewActiveUnit);

simulated function bool RawInputHandler(Name Key, int ActionMask, bool bCtrl, bool bAlt, bool bShift)
{
	//local UIOptionsPCScreen OptionsScreen; 
	//on press
	if (ActionMask != 1)
		return false;

	if (Key == default.Hotkey)
	{
		if (currentspeed == 1)
			currentspeed = default.Speed;
		else
			currentspeed = 1;
			
		class'WorldInfo'.static.GetWorldInfo().Game.SetGameSpeedMultiplier(currentspeed);
		
		

		return true;
	}else if(Key == default.HotkeyAtivar){
		if(`PRESBASE.IsPCOptionsRaised() != true){
			`PRESBASE.UIPCOptions();
		}
		return true;
	}
	return false;
}

