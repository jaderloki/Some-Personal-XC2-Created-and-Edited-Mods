class X2EventListener_CovertOps extends X2EventListener;



static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(FailCovertAction());

	return Templates;
}


static function CHEventListenerTemplate FailCovertAction()
{
	local CHEventListenerTemplate Template;

	`CREATE_X2TEMPLATE(class'CHEventListenerTemplate', Template, 'RM_FailCovertAction');
	//explanation: vanilla X2EvenetLIstenerTemplates do not specify deferrals, instead always being on ELD_OnStateSubmitted.
	//PCSes need to engage as soon as possible, so we use the CH highlander instead.

	Template.RegisterInStrategy = true;
	Template.AddCHEvent('CovertAction_PreventGiveRewards', CheckCovertAction, ELD_Immediate);

	return Template;
}

static protected function EventListenerReturn CheckCovertAction(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComLWTuple Tuple;
	local XComGameState_CovertAction ActionState;
	local XComGameState_HeadquartersXCom XComHQ;
	Tuple = XComLWTuple(EventData);
	if(Tuple == none)
	{
		ActionState = XComGameState_CovertAction(EventData);
		Tuple = XComLWTuple(EventSource);
	}
	else
	{
		ActionState = XComGameState_CovertAction(EventSource);
	}

	XComHQ = class'UIUtilities_Strategy'.static.GetXComHQ();

	if(ActionState.GetMyTemplateName() == 'CovertAction_RaiderDataRetrieval')
	{
		if(!XComHQ.LastMission.bXComWon)
		{
			if(XComHQ.LastMission.MissionSource == 'MissionSource_RaiderAmbush' || XComHQ.LastMission.MissionSource == 'MissionSource_RaiderBaseTakedown')
			{
				Tuple.Data[0].b = true; // reject covert action rewards if we lost the mission
			}
		}

	}
	
	return ELR_NoInterrupt;

}