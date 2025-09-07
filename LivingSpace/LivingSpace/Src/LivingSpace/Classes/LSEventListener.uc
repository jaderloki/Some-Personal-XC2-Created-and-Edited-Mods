class LSEventListener extends X2EventListener config(LivingSpace);

var config float RECOVERY_PENALTY_PER_SOLDIER;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(CreateStrategyListeners());

	return Templates;
}

////////////////
/// Strategy ///
////////////////

static function CHEventListenerTemplate CreateStrategyListeners ()
{
	local CHEventListenerTemplate Template;

	`CREATE_X2TEMPLATE(class'CHEventListenerTemplate', Template, 'LivingSpace_Strategy');
	Template.AddCHEvent('WillRecoveryTimeModifier', WillRecoveryTimeModifier, ELD_Immediate, class'LS_DataStructures'.const.DEFAULT_EVENT_PRIORITY);
	Template.AddCHEvent('HeadquartersUnitFired', HeadquartersUnitFired, ELD_OnStateSubmitted, class'LS_DataStructures'.const.DEFAULT_EVENT_PRIORITY);
	Template.RegisterInStrategy = true;

	return Template;
}

static protected function EventListenerReturn WillRecoveryTimeModifier (Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComLWTuple Tuple;
	
	Tuple = XComLWTuple(EventData);

	if (Tuple == none || Tuple.Id != 'WillRecoveryTimeModifier') return ELR_NoInterrupt;

	Tuple.Data[0].f = GetRecoveryTimeModifier();

	return ELR_NoInterrupt;
}

static protected function float GetRecoveryTimeModifier ()
{
	local float CurrentCrewSize, CurrentCrewLimit;

	CurrentCrewSize = class'LSHelpers'.static.GetCurrentCrewSize();
	CurrentCrewLimit = class'XComGameState_LivingSpaceData'.static.GetSingleton().CurrentCrewLimit;

	if (CurrentCrewSize <= CurrentCrewLimit)
	{
		return 1.0;
	}

	return 1.0 - ((CurrentCrewSize - CurrentCrewLimit) * default.RECOVERY_PENALTY_PER_SOLDIER);
}

static protected function EventListenerReturn HeadquartersUnitFired (Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	// Force refresh of will recovery projects length
	`XCOMHQ.HandlePowerOrStaffingChange();

	return ELR_NoInterrupt;
}
