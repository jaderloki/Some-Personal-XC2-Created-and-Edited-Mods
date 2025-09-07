class UIScreenListener_GrenadeForDays extends UIScreenListener;

var float lastTime;
event OnInit(UIScreen Screen)
{
	local Object ThisObj;
	if (`PRES == none)
        return;
    if (`PRES.GetTacticalHUD() == none)
        return;
	ThisObj = self;
	`log("UIScreenListener_GrenadeForDays");
	`XEVENTMGR.UnRegisterFromAllEvents(ThisObj);
	`XEVENTMGR.RegisterForEvent(ThisObj, 'PlayerTurnBegun', BeginTurn, ELD_OnVisualizationBlockCompleted);
}

function EventListenerReturn BeginTurn(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData) {
	local WorldInfo WI;
	WI = Class'WorldInfo'.static.GetWorldInfo();
	if(WI.RealTimeSeconds - lastTime > 5){
		`log("UIScreenListener_GrenadeForDays BeginTurn " $ lastTime);
		class'XComGameState_Turns'.static.addNewTurnNumber();
	}
	lastTime = WI.RealTimeSeconds;
	return ELR_NoInterrupt;
}