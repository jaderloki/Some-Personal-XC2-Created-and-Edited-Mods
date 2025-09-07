//---------------------------------------------------------------------------------------
//  FILE:    SeqAct_WarpsUnitToTile.uc
//  AUTHOR:  David Burchanowski
//  PURPOSE: Warps a unit to a given tile (if possible) via kismet. For LD scripting demo/tutorial save creation.
//           
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class SeqAct_WarpUnitsUsingLocation extends SequenceAction
	implements(X2KismetSeqOpVisualizer);

var XComGameState_Unit Unit;
var protected SeqVar_GameStateList Units; 
var Actor DestinationActor;
var vector DestinationLocation;
var int MinTileRange;
var int MaxTileRange;
function ModifyKismetGameState(out XComGameState GameState)
{
	local XComWorldData WorldData;
	local TTile DestinationTile;
	local array<TTile> TilePossibilities;
	local StateObjectReference StateRef;
	local XComGameStateHistory	History;

	WorldData = `XWORLD;
	History = `XCOMHistory;
	if(Units == none)
	{
		`RedScreen("SeqAct_WarpUnitsUsingLocation: No units provided");
		return;
	}
	
	foreach Units.GameStates(StateRef)
	{
		Unit = XComGameState_Unit(History.GetGameStateForObjectID(StateRef.ObjectID));
		if(DestinationActor != none)
		{
			DestinationLocation = DestinationActor.Location;
		}

		if(!WorldData.GetFloorTileForPosition(DestinationLocation, DestinationTile))
		{
			DestinationTile = `XWORLD.GetTileCoordinatesFromPosition(DestinationLocation); // we shouldn't need to do this, but just in case the crate's in a weird place
		}

		WorldData.GetSpawnTilePossibilities(DestinationTile, MinTileRange, MinTileRange, 3, TilePossibilities);
		class'X2Helpers_RM_RaiderBases'.static.RemoveInvalidTiles(TilePossibilities);

		if (TilePossibilities.Length == 0) 
		{
			// Try again, widening the search quite a bit
			WorldData.GetSpawnTilePossibilities(DestinationTile, MaxTileRange, MaxTileRange, 3, TilePossibilities);
			class'X2Helpers_RM_RaiderBases'.static.RemoveInvalidTiles(TilePossibilities);
		}

		if (TilePossibilities.Length != 0)
		{
			DestinationTile = TilePossibilities[`SYNC_RAND_STATIC(TilePossibilities.Length)];
		Unit = XComGameState_Unit(GameState.ModifyStateObject(class'XComGameState_Unit', Unit.ObjectID));
		Unit.SetVisibilityLocation(DestinationTile);
        
		}


	}
}

function BuildVisualization(XComGameState GameState)
{
	local XComGameState_Unit UnitState;
	local VisualizationActionMetadata BuildTrack;
	local X2Action_UpdateFOW FOWAction;

	foreach GameState.IterateByClassType(class'XComGameState_Unit', UnitState)
	{
		BuildTrack.StateObject_NewState = UnitState;
		BuildTrack.StateObject_OldState = UnitState;
		class'X2Action_SyncVisualizer'.static.AddToVisualizationTree(BuildTrack, GameState.GetContext());

		FOWAction = X2Action_UpdateFOW( class'X2Action_UpdateFOW'.static.AddToVisualizationTree( BuildTrack, GameState.GetContext()) );
		FOWAction.ForceUpdate = true;

		break;
	}
}

defaultproperties
{
	ObjCategory="Automation"
	ObjName="Warp Many Units Using Location"
	bCallHandler = false
	MinTileRange = 10
	MaxTileRange = 15
	bConvertedForReplaySystem=true
	bCanBeUsedForGameplaySequence=true

	VariableLinks(0)=(ExpectedType=class'SeqVar_GameStateList',LinkDesc="Units",PropertyName=Units)
	VariableLinks(1)=(ExpectedType=class'SeqVar_Object',LinkDesc="Destination Actor",PropertyName=DestinationActor)
	VariableLinks(2)=(ExpectedType=class'SeqVar_Vector',LinkDesc="Destination Location",PropertyName=DestinationLocation)
}