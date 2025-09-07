////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    10/07/23    02:00
////////////////////////////////////////////////////////////////////////////////////////////////////

//THIS IS PEEK FROM CONCEALMENTS USIL
class UISL_PeekTacticalHUD extends UIScreenListener;

`include(WOTC_GotchaAgainRedux\Src\ModConfigMenuAPI\MCM_API_CfgHelpers.uci)

var int numRevealedSteps, numSteps;

// <> TODO : use GetCoverTypeForTarget to examine the path and ignore blocked concealment tiles for the path warning.

////////////////////////////////////////////////////////////////////////////////////////////////////
//	ON INIT
////////////////////////////////////////////////////////////////////////////////////////////////////

// This event is triggered after a screen is initialized
event OnInit(UIScreen Screen)
{
	local Object ThisObj;

	//CHECK MASTER TOGGLE, BAIL IF PFC IS DISABLED
	if (`GETMCMVAR(DisablePFC)) { return; }

    //`LOG("Starting Peek TacticalHUD Listener OnInit: " @ self);
	// make sure new units (eg. from reinforcements) have their movement events deregistered
	
	ThisObj = self;
	`XEVENTMGR.RegisterForEvent(ThisObj, 'PlayerTurnBegun', BeginTurn, ELD_OnStateSubmitted);
	`XEVENTMGR.RegisterForEvent(ThisObj, 'OnUnitBeginPlay', BeginTurnUnit, ELD_OnStateSubmitted);

	AttachCallbacksToUnits();
	AttachCallbacksToPlayers();
}

function EventListenerReturn BeginTurn(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	AttachCallbacksToUnits();
    AttachCallbacksToPlayers();
	return ELR_NoInterrupt;
}

function EventListenerReturn BeginTurnUnit(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	AttachCallbacksToUnits();
	return ELR_NoInterrupt;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	ATTACH NEW CALLBACKS
////////////////////////////////////////////////////////////////////////////////////////////////////

// This removes the default ObjectMoved callback from units.  It is replaced with the code in this class.
private function AttachCallbacksToPlayers()
{
    local X2EventManager EventMgr;
	local XComGameStateHistory History;
    local XComGameState_Player PlayerState;
    local Object ThisObj;

    History = `XCOMHISTORY;
    EventMgr = `XEVENTMGR;
	ThisObj = self;

	// if allowing exposure during a move, hook into the player visibility check to avoid a bug which would cause the player to become exposed prematurely.
	// if in strict mode, we don't have to do this, which avoids some compatibility issues.
	`LOG("static_NumGraceTiles  " $ class'PeekFixUtility'.default.static_NumGraceTiles );
	if (class'PeekFixUtility'.default.static_NumGraceTiles > 0){
		foreach History.IterateByClassType(class'XComGameState_Player', PlayerState)
		{
			// remove vanilla callbacks
			EventMgr.UnRegisterFromEvent(PlayerState, 'ObjectVisibilityChanged');
		}

		EventMgr.RegisterForEvent(ThisObj, 'ObjectVisibilityChanged', OnObjectVisibilityChanged, ELD_OnStateSubmitted);
	}
}

// This removes the default ObjectMoved callback from units.  It is replaced with the code in this class.
private function AttachCallbacksToUnits()
{
    local X2EventManager EventMgr;
	local XComGameStateHistory History;
    local XComGameState_Unit UnitState;
    local Object ThisObj;

    History = `XCOMHISTORY;
    EventMgr = `XEVENTMGR;
	ThisObj = self;

    foreach History.IterateByClassType(class'XComGameState_Unit', UnitState)
    {
		// remove vanilla callbacks
		EventMgr.UnRegisterFromEvent(UnitState, 'ObjectMoved');
    }

	// handle movement events ourselves
    EventMgr.RegisterForEvent(ThisObj, 'ObjectMoved', OnUnitEnteredTile, ELD_OnStateSubmitted);
    EventMgr.RegisterForEvent(ThisObj, 'UnitMoveFinished', OnUnitMoveFinished, ELD_OnStateSubmitted);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	EVENT LISTENER RETURNS - PLAYER VISIBILITY CHANGED
////////////////////////////////////////////////////////////////////////////////////////////////////

private function EventListenerReturn OnObjectVisibilityChanged(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local X2GameRulesetVisibilityInterface SourceObject;
	local XComGameState_Unit SeenUnit;
	local XComGameState_Unit SourceUnit;
	local GameRulesCache_VisibilityInfo VisibilityInfo;
	local X2GameRulesetVisibilityManager VisibilityMgr;
    local XComGameState_Player PlayerState, UpdatedPlayerState;
	local XComGameState NewGameState;

	VisibilityMgr = `TACTICALRULES.VisibilityMgr;

	SourceObject = X2GameRulesetVisibilityInterface(EventSource); 

	//find playerstate for this unit
	foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_Player', PlayerState)
	{
		if (PlayerState.ObjectID == SourceObject.GetAssociatedPlayerID())
		{
			break;
		}
	}

	SeenUnit = XComGameState_Unit(EventData); // we only care about enemy units
	
    // Don't trigger on cosmetic units (see comments in XCGS_Unit about gremlins not wanting to receive movement events).
    // Fixes bugs with Gremlins activating pods when you cancel a hack or when movement causes the gremlin to be visible while the unit isn't.
	if(SeenUnit != none && SourceObject.TargetIsEnemy(SeenUnit.ObjectID) && !SeenUnit.GetMyTemplate().bIsCosmetic)
	{
		SourceUnit = XComGameState_Unit(SourceObject);
		if(SourceUnit != none && GameState != none)
		{
			VisibilityMgr.GetVisibilityInfo(SourceUnit.ObjectID, SeenUnit.ObjectID, VisibilityInfo, GameState.HistoryIndex);
			if(VisibilityInfo.bVisibleGameplay)
			{
				if(PlayerState.TurnsSinceEnemySeen > 0 && SeenUnit.IsAlive())
				{
					NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("PlayerRecordEnemiesSeen");
					UpdatedPlayerState = XComGameState_Player(NewGameState.ModifyStateObject(class'XComGameState_Player', PlayerState.ObjectID));
					// TurnsSinceEnemySeen is a privatewrite variable is not normally accessible - make sure to unprivate in srcorig!
					// no small sacrifice, aliens which are barely visible and are not recorded in the counter created alien noises for the player.
					UpdatedPlayerState.TurnsSinceEnemySeen = 0;
					`GAMERULES.SubmitGameState(NewGameState);
				}

				//Inform the units that they see each other
				class'XComGameState_Unit'.static.UnitASeesUnitB(SourceUnit, SeenUnit, GameState);
			}
			else if (VisibilityInfo.bVisibleBasic)
			{
				//If the target is not yet gameplay-visible, it might be because they are concealed. Check if the source should break their concealment due to the new conditions.
				//(Typically happens in XComGameState_Unit when a unit moves, but there are edge cases, like blowing up the last structure between two units, when it needs to happen here.)
				// HACK -- don't count this when a unit is moving (NumSteps > 0).  NumSteps is set to 0 when motion ends.
				if (SeenUnit.IsConcealed() && SeenUnit.UnitBreaksConcealment(SourceUnit) && VisibilityInfo.TargetCover == CT_None && numSteps == 0)
				{
					if (VisibilityInfo.DefaultTargetDist <= Square(SeenUnit.GetConcealmentDetectionDistance(SourceUnit)))
					{
						//`LOG("Breaking concealment for player visibility check!");
						SeenUnit.BreakConcealment(SourceUnit, VisibilityInfo.TargetCover == CT_None);
					}
				}
			}
		}
	}

	return ELR_NoInterrupt;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	EVENT LISTENER RETURNS - UNIT ENTERED TILE -
////////////////////////////////////////////////////////////////////////////////////////////////////

// unit moves - alert for him for other units he sees from the new location
// unit moves - alert for other units towards this unit
// NOTE - this replaces the vanilla logic in XComGameState_Unit and is adapted from it.
function EventListenerReturn OnUnitEnteredTile(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameStateHistory History;
	local XComGameState NewGameState;
	local XComGameState_Unit OtherUnitState, ThisUnitState;
	local XComGameState_Effect EffectState;
	local XComGameState_AIGroup AIGroupState;
	local XComGameState_InteractiveObject InteractiveObjectState;
	local XComGameStateContext_Ability SourceAbilityContext;
	local XComGameStateContext_EffectRemoved EffectRemovedContext;
	
	local X2Effect_Persistent PersistentEffect;

	local X2GameRulesetVisibilityManager VisibilityMgr;
	local GameRulesCache_VisibilityInfo VisibilityInfoFromThisUnit, VisibilityInfoFromOtherUnit;
	
	local XComWorldData WorldData;
	local Vector CurrentPosition, TestPosition;
	local TTile CurrentTileLocation;

	local bool DoesUnitBreaksConcealmentIgnoringDistance, RetainConcealment, bRevealedByMovement;
	local float ConcealmentDetectionDistance;
	
	WorldData = `XWORLD;
	History = `XCOMHISTORY;

	ThisUnitState = XComGameState_Unit(EventData);

	// don't activate from Gremlins etc
	if (ThisUnitState.GetMyTemplate().bIsCosmetic) { return ELR_NoInterrupt; }

	// cleanse burning on entering water
	ThisUnitState.GetKeystoneVisibilityLocation(CurrentTileLocation);
	if( ThisUnitState.IsBurning() && WorldData.IsWaterTile(CurrentTileLocation) )
	{
		foreach History.IterateByClassType(class'XComGameState_Effect', EffectState)
		{
			if( EffectState.ApplyEffectParameters.TargetStateObjectRef.ObjectID == ThisUnitState.ObjectID )
			{
				PersistentEffect = EffectState.GetX2Effect();
				if( PersistentEffect.EffectName == class'X2StatusEffects'.default.BurningName )
				{
					EffectRemovedContext = class'XComGameStateContext_EffectRemoved'.static.CreateEffectRemovedContext(EffectState);
					NewGameState = History.CreateNewGameState(true, EffectRemovedContext);
					EffectState.RemoveEffect(NewGameState, NewGameState, true); //Cleansed

					`TACTICALRULES.SubmitGameState(NewGameState);
				}
			}
		}
	}

	SourceAbilityContext = XComGameStateContext_Ability(GameState.GetContext());
	if( SourceAbilityContext != None )
	{
		// concealment for this unit is broken when stepping into a new tile if the act of stepping into the new tile caused environmental damage (ex. "broken glass")
		// if this occurred, then the GameState will contain either an environmental damage state or an InteractiveObject state
		// unless you're in challenge mode, then breaking stuff doesn't break concealment, because why would it?
		if( ThisUnitState.IsConcealed() && SourceAbilityContext.ResultContext.bPathCausesDestruction && (History.GetSingleGameStateObjectForClass( class'XComGameState_ChallengeData', true ) == none))
		{
			ThisUnitState.BreakConcealment();
		}

		ThisUnitState = XComGameState_Unit(History.GetGameStateForObjectID(ThisUnitState.ObjectID));

		// check if this unit is a member of a group waiting on this unit's movement to complete 
		// (or at least reach the interruption step where the movement should complete)
		AIGroupState = ThisUnitState.GetGroupMembership();

		if( AIGroupState != None && AIGroupState.IsWaitingOnUnitForReveal(ThisUnitState) &&
			(SourceAbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt ||
			 (AIGroupState.FinalVisibilityMovementStep > INDEX_NONE && AIGroupState.FinalVisibilityMovementStep <= SourceAbilityContext.ResultContext.InterruptionStep)
			)
		 )
		{
			AIGroupState.StopWaitingOnUnitForReveal(ThisUnitState);
		}
	}

	// concealment may be broken by moving within range of an interactive object 'detector'
	if( ThisUnitState.IsConcealed() )
	{
		if (ThisUnitState.HasAnyOfTheAbilitiesFromAnySource(class'X2AbilityTemplateManager'.default.AbilityRetainsConcealmentVsInteractives))
		{
			RetainConcealment = true;
		}

		if (!RetainConcealment)
		{
			ThisUnitState.GetKeystoneVisibilityLocation(CurrentTileLocation);
			CurrentPosition = WorldData.GetPositionFromTileCoordinates(CurrentTileLocation);
		
			foreach History.IterateByClassType(class'XComGameState_InteractiveObject', InteractiveObjectState)
			{
				if (InteractiveObjectState.DetectionRange > 0.0 && !InteractiveObjectState.bHasBeenHacked)
				{
					TestPosition = WorldData.GetPositionFromTileCoordinates(InteractiveObjectState.TileLocation);

					if (VSizeSq(TestPosition - CurrentPosition) <= Square(InteractiveObjectState.DetectionRange))
					{
						ThisUnitState.BreakConcealment();
						ThisUnitState = XComGameState_Unit(History.GetGameStateForObjectID(ThisUnitState.ObjectID));
						break;
					}
				}
			}
		}
	}

	// concealment may also be broken if this unit moves into detection range of an enemy unit
	VisibilityMgr = `TACTICALRULES.VisibilityMgr;
	foreach History.IterateByClassType(class'XComGameState_Unit', OtherUnitState)
	{
		// don't process visibility against self
		if( OtherUnitState.ObjectID == ThisUnitState.ObjectID )
		{
			continue;
		}

		VisibilityMgr.GetVisibilityInfo(ThisUnitState.ObjectID, OtherUnitState.ObjectID, VisibilityInfoFromThisUnit);

		if( VisibilityInfoFromThisUnit.bVisibleBasic )
		{
			// check if the other unit is concealed, and this unit's move has revealed him
			if( OtherUnitState.IsConcealed() && OtherUnitState.UnitBreaksConcealment(ThisUnitState) && VisibilityInfoFromThisUnit.TargetCover == CT_None )
			{
				DoesUnitBreaksConcealmentIgnoringDistance = ThisUnitState.DoesUnitBreaksConcealmentIgnoringDistance();

				if( !DoesUnitBreaksConcealmentIgnoringDistance )
				{
					ConcealmentDetectionDistance = OtherUnitState.GetConcealmentDetectionDistance(ThisUnitState);
				}

				if( DoesUnitBreaksConcealmentIgnoringDistance || VisibilityInfoFromThisUnit.DefaultTargetDist <= Square(ConcealmentDetectionDistance) )
				{
					OtherUnitState.BreakConcealment(ThisUnitState, true);

					// have to refresh the unit state after broken concealment
					OtherUnitState = XComGameState_Unit(History.GetGameStateForObjectID(OtherUnitState.ObjectID));
				}
			}

			// generate alert data for this unit about other units
			ThisUnitState.UnitASeesUnitB(ThisUnitState, OtherUnitState, GameState);
		}

		// only need to process visibility updates from the other unit if it is still alive
		if( OtherUnitState.IsAlive() )
		{
			VisibilityMgr.GetVisibilityInfo(OtherUnitState.ObjectID, ThisUnitState.ObjectID, VisibilityInfoFromOtherUnit);

			if( VisibilityInfoFromOtherUnit.bVisibleBasic )
			{
				// check if this unit is concealed and that concealment is broken by entering into an enemy's detection tile
				if(
					ThisUnitState.IsConcealed() &&
					ThisUnitState.UnitBreaksConcealment(OtherUnitState) &&
					class'PeekConcealmentRules'.static.IsVisible(ThisUnitState, OtherUnitState, VisibilityInfoFromOtherUnit)
				)
				{
					DoesUnitBreaksConcealmentIgnoringDistance = OtherUnitState.DoesUnitBreaksConcealmentIgnoringDistance();

					if (!DoesUnitBreaksConcealmentIgnoringDistance)
					{
						ConcealmentDetectionDistance = ThisUnitState.GetConcealmentDetectionDistance(OtherUnitState);
					}

					if( DoesUnitBreaksConcealmentIgnoringDistance || VisibilityInfoFromOtherUnit.DefaultTargetDist <= Square(ConcealmentDetectionDistance) )
					{
						//`LOG("Revealed by self-motion: cover = " @ String(VisibilityInfoFromOtherUnit.TargetCover) @ " steps = " @ String(numRevealedSteps));
						
						// break concealment if visible too long.  Also if starting from a concealment-breaking tile (numSteps == 0)
						bRevealedByMovement = true;
						`LOG("static_NumGraceTiles numSteps  " $ class'PeekFixUtility'.default.static_NumGraceTiles );
						//if (numSteps == 0 || numRevealedSteps >= class'PeekFixUtility'.default.static_NumGraceTiles)
						if (numSteps == 0 || class'PeekFixUtility'.default.static_NumGraceTiles > 0)
						{
							//`LOG("Breaking concealment after step " @ String(numRevealedSteps) @ " with grace tiles = " @ String(`GETMCMVAR(NumGraceTiles)) );
							ThisUnitState.BreakConcealment(OtherUnitState);

							// have to refresh the unit state after broken concealment
							ThisUnitState = XComGameState_Unit(History.GetGameStateForObjectID(ThisUnitState.ObjectID));
						}
					}
				}

				// generate alert data for other units that see this unit
				if( VisibilityInfoFromOtherUnit.bVisibleBasic && !ThisUnitState.IsConcealed() )
				{
					//  don't register an alert if this unit is about to reflex
					AIGroupState = OtherUnitState.GetGroupMembership();
					
					if (AIGroupState == none || AIGroupState.EverSightedByEnemy)
					{
						ThisUnitState.UnitASeesUnitB(OtherUnitState, ThisUnitState, GameState);
					}
				}
			}
		}
	}

	// increment step counters.  These are reset when the unit move is finished
	if (bRevealedByMovement) { numRevealedSteps++; }
	numSteps++;

	return ELR_NoInterrupt;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	EVENT LISTENER RETURNS - UNIT MOVE FINISHED -
////////////////////////////////////////////////////////////////////////////////////////////////////

function EventListenerReturn OnUnitMoveFinished(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameState NewGameState;
	local XComGameState_Unit OtherUnitState, ThisUnitState;
	local XComGameState_AIGroup AIGroupState;
	local XComGameStateContext_TacticalGameRule NewContext;
	local XComGameStateHistory History;
	local X2GameRulesetVisibilityManager VisibilityMgr;
	local GameRulesCache_VisibilityInfo VisibilityInfoFromOtherUnit;

	VisibilityMgr = `TACTICALRULES.VisibilityMgr;
	
	History = `XCOMHISTORY;

	// reset step counter for the next move
	numRevealedSteps = 0;
	numSteps = 0;

	ThisUnitState = XComGameState_Unit(EventData);

	// don't activate from Gremlins etc
	if (ThisUnitState.GetMyTemplate().bIsCosmetic) { return ELR_NoInterrupt; }

	foreach History.IterateByClassType(class'XComGameState_Unit', OtherUnitState)
	{
		// don't process visibility against dead units
		if (!OtherUnitState.IsAlive()) { continue; }

		// don't process visibility against self
		if( OtherUnitState.ObjectID == ThisUnitState.ObjectID)
		{
			if( ThisUnitState.CanTakeCover() )
			{
				NewContext = class'XComGameStateContext_TacticalGameRule'.static.BuildContextFromGameRule(eGameRule_ClaimCover);
				NewContext.UnitRef = ThisUnitState.GetReference();
				NewGameState = NewContext.ContextBuildGameState();
				`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
			}

			continue;
		}

		VisibilityMgr.GetVisibilityInfo(OtherUnitState.ObjectID, ThisUnitState.ObjectID, VisibilityInfoFromOtherUnit);

		if( VisibilityInfoFromOtherUnit.bVisibleBasic )
		{
			// check if this unit is concealed and that concealment is broken by entering into an enemy's detection tile
			if( ThisUnitState.IsConcealed() && ThisUnitState.UnitBreaksConcealment(OtherUnitState) && class'PeekConcealmentRules'.static.IsVisible(ThisUnitState, OtherUnitState, VisibilityInfoFromOtherUnit) )
			{
				//`LOG("Revealed by self-motion in final state: cover = " @ String(VisibilityInfoFromOtherUnit.TargetCover));
				ThisUnitState.BreakConcealment(OtherUnitState);

				// have to refresh the unit state after broken concealment
				ThisUnitState = XComGameState_Unit(History.GetGameStateForObjectID(ThisUnitState.ObjectID));

				// generate alert data for other units that see this unit
				if( !ThisUnitState.IsConcealed() )
				{
					//  don't register an alert if this unit is about to reflex
					AIGroupState = OtherUnitState.GetGroupMembership();
					if (AIGroupState == none || AIGroupState.EverSightedByEnemy)
					{
						ThisUnitState.UnitASeesUnitB(OtherUnitState, ThisUnitState, GameState);
					}
				}
			}

		}
	}

	return ELR_NoInterrupt;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	UISL ON REMOVED - NOTES FROM ORIGINAL PEEK -
////////////////////////////////////////////////////////////////////////////////////////////////////

event OnRemoved(UIScreen screen)
{
	// WTF: strangely enough this seems to be called at the beginning of tactical missions.
	// if I remove listeners here, I lose access to events and bugs happen.
	// I think I have to just ignore this and rely on the uniqueness of this listener and de-duplication to avoid excess registrations.

    //`LOG("Peek TacticalHUD Listener OnRemoved: " @ self);
    //local Object ThisObj;
    //ThisObj = self;
	//`XEVENTMGR.UnRegisterFromAllEvents(ThisObj);
    //`XCOMHISTORY.UnRegisterOnNewGameStateDelegate(OnNewGameState);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	DEFAULT PROPERTIES - RUN ONLY ON THIS SCREEN -
////////////////////////////////////////////////////////////////////////////////////////////////////

defaultproperties
{
	ScreenClass = UITacticalHUD
}
