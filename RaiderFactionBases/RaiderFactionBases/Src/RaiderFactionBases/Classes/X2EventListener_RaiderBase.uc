class X2EventListener_RaiderBase extends X2EventListener;

// purpose: listen to specific events to change raider base statuses 
// for now, this is just when a player opens a region so we see if we need to change a raider base's status


static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(RegionOpened());

	return Templates;
}


static function CHEventListenerTemplate RegionOpened()
{
	local CHEventListenerTemplate Template;

	`CREATE_X2TEMPLATE(class'CHEventListenerTemplate', Template, 'RM_RaiderBase_RegionOpen');
	//explanation: vanilla X2EvenetLIstenerTemplates do not specify deferrals, instead always being on ELD_OnStateSubmitted.
	//PCSes need to engage as soon as possible, so we use the CH highlander instead.

	Template.RegisterInStrategy = true;
	Template.AddCHEvent('RegionContacted', CheckRegion, ELD_Immediate);

	return Template;
}


static protected function EventListenerReturn CheckRegion(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameStateHistory History;
	local XComGameState_Continent Continent;
	local XComGameState_RaiderBase Base;
	local array<XComGameState_RaiderBase> Bases;

	History = `XCOMHistory;

	if (GameState.GetContext( ).InterruptionStatus == eInterruptionStatus_Interrupt)
	{
		return ELR_NoInterrupt;
	}

	foreach GameState.IterateByClassType(class'XComGameState_Continent', Continent)
    {
        break;
    }

	if(Continent != none)
	{
		if(Continent.GetResistanceLevel() > 0) //is open
		{
			Bases = class'XComGameState_RaiderBaseManager'.static.GetBaseManager().GetBasesForContinent(Continent);
			
			foreach Bases(Base)
			{
				if(Base.GetStatus() == eRB_Undiscovered)
				{
					Base = XComGameState_RaiderBase(GameState.ModifyStateObject(class'XComGameState_RaiderBase', Base.ObjectID));
					Base.UpdateStatus(eRB_Discovered);
				}
			}
		}
	}
	else
	{
		foreach History.IterateByClassType(class'XComGameState_Continent', Continent)
		{
			if(Continent.GetResistanceLevel() > 0) //is open
			{
				Bases = class'XComGameState_RaiderBaseManager'.static.GetBaseManager().GetBasesForContinent(Continent);
			
				foreach Bases(Base)
				{
					if(Base.GetStatus() == eRB_Undiscovered)
					{
						Base = XComGameState_RaiderBase(GameState.ModifyStateObject(class'XComGameState_RaiderBase', Base.ObjectID));
						Base.UpdateStatus(eRB_Discovered);
					}
				}
			}
		}
	}
	return ELR_NoInterrupt;
}