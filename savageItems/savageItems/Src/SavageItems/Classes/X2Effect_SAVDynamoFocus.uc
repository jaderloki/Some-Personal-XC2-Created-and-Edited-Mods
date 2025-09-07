class X2Effect_SAVDynamoFocus extends X2Effect_ModifyStats;

struct FocusLevelModifiers
{
	var array<StatChange>		StatChanges;
};

var array<FocusLevelModifiers>	arrFocusModifiers;
var localized string SpecialDamageName;

function AddNextFocusLevel(const array<StatChange> NextStatChanges)
{
	local FocusLevelModifiers NextFocusLevel;

	NextFocusLevel.StatChanges = NextStatChanges;
	arrFocusModifiers.AddItem(NextFocusLevel);
}

function FocusLevelModifiers GetFocusModifiersForLevel(int FocusLevel)
{
	local FocusLevelModifiers Modifiers;

	if (FocusLevel >= 0)
	{
		if (FocusLevel >= arrFocusModifiers.Length)
			Modifiers = arrFocusModifiers[arrFocusModifiers.Length - 1];
		else
			Modifiers = arrFocusModifiers[FocusLevel];
	}

	return Modifiers;
}

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	local XComGameState_Effect_TemplarFocus FocusState;

	FocusState = XComGameState_Effect_TemplarFocus(NewEffectState);
	`assert(FocusState != none);

	FocusState.FocusLevel = FocusState.GetStartingFocus(XComGameState_Unit(kNewTargetState));	
	FocusState.StatChanges = GetFocusModifiersForLevel(FocusState.FocusLevel).StatChanges;
	if (FocusState.StatChanges.Length > 0)
		super.OnEffectAdded(ApplyEffectParameters, kNewTargetState, NewGameState, FocusState);
}

DefaultProperties
{
	EffectName = "TemplarFocus"			//	must match TemplarFocusName in X2AbilityTemplateManager
	DuplicateResponse = eDupe_Allow
	bCanBeRedirected = false
	GameStateEffectClass = class'XComGameState_Effect_TemplarFocus'
	bDisplayInSpecialDamageMessageUI = true
}