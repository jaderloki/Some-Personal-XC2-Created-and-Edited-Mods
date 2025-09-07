class X2AbilityCooldown_PlayerLocalAndGlobal extends X2AbilityCooldown;

var() int NumGlobalTurns;

simulated function ApplyCooldown(XComGameState_Ability kAbility, XComGameState_BaseObject AffectState, XComGameState_Item AffectWeapon, XComGameState NewGameState)
{
	local XComGameState_Unit kUnitState;
	local XComGameState_Player kPlayerState;
	local XComGameStateHistory History;

	History = `XCOMHISTORY;

	super.ApplyCooldown(kAbility, AffectState, AffectWeapon, NewGameState);

	kUnitState = XComGameState_Unit(AffectState);
	kPlayerState = XComGameState_Player(History.GetGameStateForObjectID(kUnitState.ControllingPlayer.ObjectID));

//	if( (kPlayerState != none) && kPlayerState.IsPlayer() )
	if( (kPlayerState != none) )
	{
		// If the player state is Player then use the NumGlobalTurns value
		kPlayerState = XComGameState_Player(NewGameState.ModifyStateObject(kPlayerState.Class, kPlayerState.ObjectID));
		kPlayerState.SetCooldown(kAbility.GetMyTemplateName(), NumGlobalTurns);
	}
}