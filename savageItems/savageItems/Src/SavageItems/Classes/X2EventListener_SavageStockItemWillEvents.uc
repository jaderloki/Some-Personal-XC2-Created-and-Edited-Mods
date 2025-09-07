class X2EventListener_SavageStockItemWillEvents extends X2EventListener dependson(XComGameStateContext_WillRoll) config(GameCore);

var const localized string ReflexActionActivated;
var const localized string ReflexInteruptActivated;
var const localized string TeleportActionActivated;
var const localized string OneWillLossActionActivated;

var protected const config WillEventRollData SavReflexiveActionData;
var protected const config WillEventRollData SavReflexiveInteruptData;
var protected const config WillEventRollData SavTeleportActionData;
var protected const config WillEventRollData SavOneWillLossActionData;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(CreateReflexActionActivatedTemplate());
	Templates.AddItem(CreateReflexInteruptActivatedTemplate());
	Templates.AddItem(CreateTeleportActionActivatedTemplate());
	Templates.AddItem(CreateOneWillLossActionActivatedTemplate());
		
	return Templates;
}

static function X2EventListenerTemplate CreateReflexActionActivatedTemplate()
{
	local X2EventListenerTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EventListenerTemplate', Template, 'ReflexActionActivated');

	Template.RegisterInTactical = true;
	Template.AddEvent('ReflexActionActivated', OnReflexActionActivated);

	return Template;
}

static protected function EventListenerReturn OnReflexActionActivated(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameStateHistory History;
	local XComGameStateContext_WillRoll WillRollContext;
	local XComGameState_Unit TargetUnit;
	local XComGameStateContext_Ability AbilityContext;

	AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
	if (AbilityContext != none && class'XComGameStateContext_Ability'.static.IsHitResultHit(AbilityContext.ResultContext.HitResult))
	{
		History = `XCOMHISTORY;

		TargetUnit = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.PrimaryTarget.ObjectID));
		`assert(TargetUnit != none);

		if( class'XComGameStateContext_WillRoll'.static.ShouldPerformWillRoll(default.SavReflexiveActionData, TargetUnit) )
		{
			WillRollContext = class'XComGameStateContext_WillRoll'.static.CreateWillRollContext(TargetUnit, 'ReflexActionActivated', default.ReflexActionActivated, false);
			WillRollContext.DoWillRoll(default.SavReflexiveActionData);
			WillRollContext.Submit();
		}
	}

	return ELR_NoInterrupt;
}

static function X2EventListenerTemplate CreateReflexInteruptActivatedTemplate()
{
	local X2EventListenerTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EventListenerTemplate', Template, 'ReflexInteruptActivated');

	Template.RegisterInTactical = true;
	Template.AddEvent('ReflexInteruptActivated', OnReflexInteruptActivated);

	return Template;
}

static protected function EventListenerReturn OnReflexInteruptActivated(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameStateHistory History;
	local XComGameStateContext_WillRoll WillRollContext;
	local XComGameState_Unit TargetUnit;
	local XComGameStateContext_Ability AbilityContext;

	AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
	if (AbilityContext != none && class'XComGameStateContext_Ability'.static.IsHitResultHit(AbilityContext.ResultContext.HitResult))
	{
		History = `XCOMHISTORY;

		TargetUnit = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.PrimaryTarget.ObjectID));
		`assert(TargetUnit != none);

		if( class'XComGameStateContext_WillRoll'.static.ShouldPerformWillRoll(default.SavReflexiveInteruptData, TargetUnit) )
		{
			WillRollContext = class'XComGameStateContext_WillRoll'.static.CreateWillRollContext(TargetUnit, 'ReflexInteruptActivated', default.ReflexInteruptActivated, false);
			WillRollContext.DoWillRoll(default.SavReflexiveInteruptData);
			WillRollContext.Submit();
		}
	}

	return ELR_NoInterrupt;
}

static function X2EventListenerTemplate CreateTeleportActionActivatedTemplate()
{
	local X2EventListenerTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EventListenerTemplate', Template, 'TeleportActionActivated');

	Template.RegisterInTactical = true;
	Template.AddEvent('SavTeleportEvent', OnTeleportActionActivated);

	return Template;
}

static protected function EventListenerReturn OnTeleportActionActivated(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameStateHistory History;
	local XComGameStateContext_WillRoll WillRollContext;
	local XComGameState_Unit TargetUnit;
	local XComGameStateContext_Ability AbilityContext;

	AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
	if (AbilityContext != none && class'XComGameStateContext_Ability'.static.IsHitResultHit(AbilityContext.ResultContext.HitResult))
	{
		History = `XCOMHISTORY;

		TargetUnit = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.PrimaryTarget.ObjectID));
		`assert(TargetUnit != none);

		if( class'XComGameStateContext_WillRoll'.static.ShouldPerformWillRoll(default.SavTeleportActionData, TargetUnit) )
		{
			WillRollContext = class'XComGameStateContext_WillRoll'.static.CreateWillRollContext(TargetUnit, 'SavTeleportEvent', default.TeleportActionActivated, false);
			WillRollContext.DoWillRoll(default.SavTeleportActionData);
			WillRollContext.Submit();
		}
	}

	return ELR_NoInterrupt;
}

static function X2EventListenerTemplate CreateOneWillLossActionActivatedTemplate()
{
	local X2EventListenerTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EventListenerTemplate', Template, 'OneWillLossActionActivated');

	Template.RegisterInTactical = true;
	Template.AddEvent('SavOneWillLossEvent', OnOneWillLossActionActivated);

	return Template;
}

static protected function EventListenerReturn OnOneWillLossActionActivated(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameStateHistory History;
	local XComGameStateContext_WillRoll WillRollContext;
	local XComGameState_Unit TargetUnit;
	local XComGameStateContext_Ability AbilityContext;

	AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
	if (AbilityContext != none && class'XComGameStateContext_Ability'.static.IsHitResultHit(AbilityContext.ResultContext.HitResult))
	{
		History = `XCOMHISTORY;

		TargetUnit = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.PrimaryTarget.ObjectID));
		`assert(TargetUnit != none);

		if( class'XComGameStateContext_WillRoll'.static.ShouldPerformWillRoll(default.SavOneWillLossActionData, TargetUnit) )
		{
			WillRollContext = class'XComGameStateContext_WillRoll'.static.CreateWillRollContext(TargetUnit, 'SavOneWillLossEvent', default.OneWillLossActionActivated, false);
			WillRollContext.DoWillRoll(default.SavOneWillLossActionData);
			WillRollContext.Submit();
		}
	}

	return ELR_NoInterrupt;
}