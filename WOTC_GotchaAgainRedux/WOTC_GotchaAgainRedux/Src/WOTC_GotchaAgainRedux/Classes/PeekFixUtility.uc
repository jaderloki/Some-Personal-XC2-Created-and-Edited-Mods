////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    11/07/23	22:30
//	<> TODO : INVESTIGATE DAVIDTIRUNES CROUCH LOWER MOD FOR BETTER METHODS?
////////////////////////////////////////////////////////////////////////////////////////////////////

//THIS IS PEEK FROM CONCEALMENTS RULE CHANGES
class PeekFixUtility extends Object config(WOTCGotchaAgainReduxDefaults);

var config int static_NumGraceTiles;

`include(WOTC_GotchaAgainRedux\Src\ModConfigMenuAPI\MCM_API_CfgHelpers.uci)

////////////////////////////////////////////////////////////////////////////////////////////////////
//	INDICATORS - CONCEALMENT BREAKING
////////////////////////////////////////////////////////////////////////////////////////////////////

static function MakeConcealmentMarkers(XComPathingPawn PathingPawn, out array<TTile> ConcealmentMarkers)
{
	local XComGameState_InteractiveObject InteractiveObjectState;
	local XComGameStateHistory History;
	local XComWorldData WorldData;
	local XComGameState_Unit ActiveUnitState, EnemyUnit;
    local array<XComGameState_Unit> RevealedEnemies;

	local UIUnitFlagManager_GA UnitFlagManager;
	local GameRulesCache_VisibilityInfo VisInfo;
	local Vector CurrentPosition, TestPosition;
	local LOSValues UnitLOSValues;
	local TTile Tile;

	local bool bVisibleAtThisTile, bVisibleAtThisTileFINAL, RequireHighCover;
	local int i, xvideos, SightRange, NumTilesVisible;

	local float graceTilesTMP, HighestTargetCoverPoint;
	local ECoverType TargetCover, LowestTargetCover;

	ConcealmentMarkers.Length = 0;

	UnitFlagManager = UIUnitFlagManager_GA(`PRES.m_kUnitFlagManager);
	History = `XCOMHISTORY;
	WorldData = `XWORLD;

	ActiveUnitState = XComGameState_Unit(History.GetGameStateForObjectID(PathingPawn.LastActiveUnit.ObjectID));
	RevealedEnemies = GetRevealedSpottersOfUnit(ActiveUnitState, true);

	//graceTilesTMP = `GETMCMVAR(NumGraceTiles);
	graceTilesTMP = 10;

	for (i = 0; i < PathingPawn.PathTiles.Length; i++)
	{
		// check this tile
		Tile = PathingPawn.PathTiles[i];

		bVisibleAtThisTile = false;
		bVisibleAtThisTileFINAL = false;
		HighestTargetCoverPoint = 0;

		// interactive objects, eg. lamp posts which have the eye of sauron and are all seeing all powerful
		foreach History.IterateByClassType(class'XComGameState_InteractiveObject', InteractiveObjectState)
		{
			if (InteractiveObjectState.DetectionRange > 0.0 && !InteractiveObjectState.bHasBeenHacked)
			{
				CurrentPosition = WorldData.GetPositionFromTileCoordinates(Tile);
				TestPosition = WorldData.GetPositionFromTileCoordinates(InteractiveObjectState.TileLocation);

				if (VSizeSq(TestPosition - CurrentPosition) <= Square(InteractiveObjectState.DetectionRange))
				{
					bVisibleAtThisTile = true;
					ConcealmentMarkers.AddItem(Tile);
					//class'PeekFixUtility'.default.static_NumGraceTiles = 10;
					`LOG("GRACE EMPTY");
					return;
				}
			}
		}

		foreach RevealedEnemies(EnemyUnit)
		{
			SightRange = ActiveUnitState.GetConcealmentDetectionDistance(EnemyUnit);

			// use all of Gotcha's reliability tricks to figure out LOS, but with range = detection distance instead of sight range.
			UnitLOSValues = UnitFlagManager.LOSUtilityInstance.GetLOSValues(EnemyUnit.TileLocation, Tile, EnemyUnit, ActiveUnitState, Square(SightRange) + 1, VisInfo, !EnemyUnit.CanTakeCover());

			
			if (WorldData.CanSeeTileToTile(Tile, EnemyUnit.TileLocation, VisInfo) && VisInfo.DefaultTargetDist <= Square(SightRange))
			{
				ConcealmentMarkers.AddItem(Tile);
				return;
			}
			

			if (
				UnitLOSValues.bClearLOS &&
				UnitLOSValues.bWithinRegularRange &&
				(
					WorldData.CanSeeTileToTile(Tile, EnemyUnit.TileLocation, VisInfo) ||
					VisInfo.DefaultTargetDist <= Square(SightRange)
				)
			)
			{ 
				// get cover value from the enemy unit to the tile
				bVisibleAtThisTile = true;

				TargetCover = GetCoverData(UnitFlagManager.LOSUtilityInstance, EnemyUnit, ActiveUnitState, Tile, VisInfo);
				
				// apply concealment rules based on configuration
				if (
					Tile.Z >= (EnemyUnit.TileLocation.Z + class'X2TacticalGameRuleset'.default.UnitHeightAdvantage)
				){
					RequireHighCover = false;
				}else if(TargetCover == CT_MidLevel){
					RequireHighCover = false;
				}else if (`GETMCMVAR(HideInHighCover)){
					RequireHighCover = true;
				}else{
					break; // No hiding.
				}

				//if(PathingPawn.PathTiles.Length - 1 == i && TargetCover == CT_None){
				//	HighestTargetCoverPoint = 100;
				//}

				//`LOG("sexo " $ TargetCover);
				// check cover state allowing for peeking
				//if (
				//	HasCoverFromEnemyToTile(UnitFlagManager.LOSUtilityInstance, RequireHighCover, EnemyUnit, ActiveUnitState, Tile, VisInfo)
				//){
				//	bVisibleAtThisTile = false;
				//}else{
					`LOG("Visible " $ TargetCover);
					if (
						Tile.Z >= (EnemyUnit.TileLocation.Z + class'X2TacticalGameRuleset'.default.UnitHeightAdvantage)
					){
						if(TargetCover == CT_None){
							HighestTargetCoverPoint = (HighestTargetCoverPoint > 0.5) ? HighestTargetCoverPoint : 0.5;
						}else if(TargetCover == CT_MidLevel){
							HighestTargetCoverPoint = (HighestTargetCoverPoint > 0.0) ? HighestTargetCoverPoint : 0.0;
						}
					}else{
						if(TargetCover == CT_None){
							HighestTargetCoverPoint = (HighestTargetCoverPoint > 2.0) ? HighestTargetCoverPoint : 2.0;
						}else if(TargetCover == CT_MidLevel){
							HighestTargetCoverPoint = (HighestTargetCoverPoint > 1.0) ? HighestTargetCoverPoint : 1.0;
						}
					}
				//}
			}

			if (bVisibleAtThisTile) { 
				bVisibleAtThisTileFINAL = true;
			}
		}

		graceTilesTMP = graceTilesTMP - HighestTargetCoverPoint;

		if (bVisibleAtThisTileFINAL){
			NumTilesVisible++;
		}
			
		`LOG(
			" Podem Ver o Soldado? " $ 
			" pts stealth restante " $ graceTilesTMP $
			" NumTilesVisible " $ NumTilesVisible $
			" i " $ i $
			" PathingPawn.PathTiles.Length - 1 " $ (PathingPawn.PathTiles.Length - 1)
		);

		if (
			NumTilesVisible > graceTilesTMP 
			//|| i == PathingPawn.PathTiles.Length - 1 
			//|| i == 0
		){
			`LOG("GLORIA GOOVE");
			ConcealmentMarkers.AddItem(Tile);
			if(i != 0){
				`LOG("GAY");
				for (xvideos = i; xvideos > 0; xvideos--){
					`LOG("GAY " $ xvideos);
					ConcealmentMarkers.AddItem(PathingPawn.PathTiles[xvideos]);
				}
			}
			`LOG("GRACE TEN");
			class'PeekFixUtility'.default.static_NumGraceTiles = 10;
			return;
		}
	}
	`LOG("GRACE ZERO");
	class'PeekFixUtility'.default.static_NumGraceTiles = 0;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	CHECK COVER
////////////////////////////////////////////////////////////////////////////////////////////////////

// Here be monsters.  Some code adapted from LOSUtility_GA but we're looking in the opposite direction here (source unit fixed, target variable)
// This is some messed up shit and I can't believe Gotcha Again actually managed to work with all this hell
static function bool HasCoverFromEnemyToTile(LOSUtility_GA LOSUtility, bool RequireHighCover, 
												XComGameState_Unit SourceUnit, XComGameState_Unit TargetUnit, 
												const out TTile TargetTile, GameRulesCache_VisibilityInfo VisibilityInfo)
{
	local XComWorldData WorldData;
	local Vector SourceVector, TargetVector;
	local CachedCoverAndPeekData PeekData;
	local ECoverType TargetCover;
	local float TargetCoverAngle;
	local array<int> CoverDirectionsToCheck;
	local int i;

	WorldData = `XWORLD;

	SourceVector = WorldData.GetPositionFromTileCoordinates(SourceUnit.TileLocation);
	TargetVector = WorldData.GetPositionFromTileCoordinates(TargetTile);
	TargetCover = WorldData.GetCoverTypeForTarget(SourceVector, TargetVector, TargetCoverAngle); // TargetCoverAngle is an out parameter! It is never used...

	// BAIL FOR INCORRECT COVER TYPES // VisibilityInfo.bVisibleFromDefault && 
    // VisibilityInfo is shady as fuck and cannot be trusted!
    // If bVisibleFromDefault is false, the LOS requires peeking, but we don't always know to which side (the PeekSide value can be eNoPeek regardless)!
    // But if it is true, the LOS is from the actual tile without stepping out
	// in short we don't use it here, as per PFC's rules .... 
	if (TargetCover == CT_None) { return false; }
	if (TargetCover == CT_MidLevel && RequireHighCover) { return false; }

	// Now we have to check whether the enemy can see this tile by stepping out.  The hell begins here.
    CoverDirectionsToCheck = GetPotentialCoverDirections(SourceVector, TargetVector);
	PeekData = WorldData.GetCachedCoverAndPeekData(SourceUnit.TileLocation);

    // PeekSide seem to be reliable when it is not eNoPeek... let's hope that it actually is!
    // <> TODO : INVESTIGATE IF THIS DODGY LITTLE SET UP IS THE CAUSE OF THE PHANTOM COVER ISSUE
    switch(VisibilityInfo.PeekSide)
    {
        case ePeekLeft:     foreach CoverDirectionsToCheck(i) 
			{ if(!CheckCoverOnSide(PeekData.CoverDirectionInfo[i], false, LOSUtility, RequireHighCover, TargetVector, TargetUnit, SourceUnit)) { return false; } }
			break;

        case ePeekRight:    foreach CoverDirectionsToCheck(i) 
			{ if(!CheckCoverOnSide(PeekData.CoverDirectionInfo[i], true,  LOSUtility, RequireHighCover, TargetVector, TargetUnit, SourceUnit)) { return false; } }
			break;

        case eNoPeek:
            // We don't know which side we're peeking to (eNoPeek ought to mean we're not, but it doesn't... WTF?!) ... Check both sides
            foreach CoverDirectionsToCheck(i) 
			{ 
				if(CheckCoverOnSide(PeekData.CoverDirectionInfo[i], false, LOSUtility, RequireHighCover, TargetVector, TargetUnit, SourceUnit) 
				|| CheckCoverOnSide(PeekData.CoverDirectionInfo[i], true,  LOSUtility, RequireHighCover, TargetVector, TargetUnit, SourceUnit)) 
				{
					return true;
				}
			}
            break;
    }

	return true;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
//	CHECK COVER
////////////////////////////////////////////////////////////////////////////////////////////////////

// Here be monsters.  Some code adapted from LOSUtility_GA but we're looking in the opposite direction here (source unit fixed, target variable)
// This is some messed up shit and I can't believe Gotcha Again actually managed to work with all this hell
static function ECoverType GetCoverData(LOSUtility_GA LOSUtility,
												XComGameState_Unit SourceUnit, XComGameState_Unit TargetUnit, 
												const out TTile TargetTile, GameRulesCache_VisibilityInfo VisibilityInfo)
{
	local XComWorldData WorldData;
	local Vector SourceVector, TargetVector;
	local CachedCoverAndPeekData PeekData;
	local ECoverType TargetCover;
	local float TargetCoverAngle;
	local array<int> CoverDirectionsToCheck;
	local int i;

	WorldData = `XWORLD;

	SourceVector = WorldData.GetPositionFromTileCoordinates(SourceUnit.TileLocation);
	TargetVector = WorldData.GetPositionFromTileCoordinates(TargetTile);
	TargetCover = WorldData.GetCoverTypeForTarget(SourceVector, TargetVector, TargetCoverAngle); // TargetCoverAngle is an out parameter! It is never used...

	return TargetCover;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	CHECK COVER DIRECTIONS <> TODO: INVEST IF THIS IS WHY COVER GETS IGNORED ??
////////////////////////////////////////////////////////////////////////////////////////////////////

private static function array<int> GetPotentialCoverDirections(const out vector SourceVector, const out vector TargetVector)
{
	// out parameters to pass-by-ref
    local vector PeekFromCoverInDirection;
    local array<int> CoverDirections;

    PeekFromCoverInDirection = TargetVector - SourceVector;

    if(PeekFromCoverInDirection.X > 0) { CoverDirections.AddItem(3); }
    if(PeekFromCoverInDirection.X < 0) { CoverDirections.AddItem(2); }
    if(PeekFromCoverInDirection.Y < 0) { CoverDirections.AddItem(1); }
    if(PeekFromCoverInDirection.Y > 0) { CoverDirections.AddItem(0); }

    return CoverDirections;
}

private static function bool CheckCoverOnSide(CoverDirectionPeekData PeekSide, bool bCheckRight, LOSUtility_GA LOSUtility, bool RequireHighCover, 
											  Vector TargetVector, XComGameState_Unit TargetUnit, XComGameState_Unit SourceUnit)
{
    local PeekAroundInfo PeekData;
    PeekData = bCheckRight ? PeekSide.RightPeek : PeekSide.LeftPeek;

    if(PeekSide.bHasCover == 1 && PeekData.bHasPeekaround == 1)
    {
        if(HasCoverFromPeekTile(LOSUtility, RequireHighCover, PeekData, TargetUnit.TileLocation, TargetVector, TargetUnit, SourceUnit))
        {
            return true;
        }
    }

    return false;
}

private static function bool HasCoverFromPeekTile(LOSUtility_GA LOSUtility, bool RequireHighCover, const out PeekAroundInfo PeekData, TTile TargetTile, vector TargetVector, 
                                            XComGameState_Unit TargetUnit, XComGameState_Unit SourceUnit, optional bool CheckVisibility = false)
{
    local float CoverAngle; // Is not used, but GetCoverTypeForTarget needs an out parameter
	local ECoverType CoverType;

    // We only check visibility in certain cases (when PeekSide is noPeek), since shots can be taken from a tile being peeked to even though there is no visibility from that tile. 
	// Hopefully that will not be needed when PeekSide is noPeek...
    // Do not allow visibility from a stepout from this tile and don't care about range, so just pass 0 as sightrange.
    if(CheckVisibility && !LOSUtility.GetLOSValues(PeekData.PeekTile, TargetTile, SourceUnit, TargetUnit, 0, , true).bClearLOS) { return true; };

    CoverType = `XWORLD.GetCoverTypeForTarget(PeekData.PeekAroundLocation, TargetVector, CoverAngle);
	if (RequireHighCover && CoverType == CT_Standing)
	{
		return true;
	}
	else if (CoverType == CT_MidLevel || CoverType == CT_Standing)
	{
		return true;
	}

	//CoverType == CT_None
	return false;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	CHECK LOS
////////////////////////////////////////////////////////////////////////////////////////////////////

/*
    <> TODO: INVESTIGATE USAGE OF TACTICAL VISIBILITY HELPERS HERE
    /// Returns an out param, VisibleUnits, containing all the units (and, optionally, destructibles) that a given player can see
	//Set default conditions (visible units need to be alive and game play visible) if no conditions were specified
    GetAllVisibleObjectsForPlayer(int PlayerStateObjectID, out array<StateObjectReference> VisibleUnits, optional array<X2Condition> RequiredConditions, int HistoryIndex = -1, bool IncludeNonUnits = false))

   	VisibilityMgr = `TACTICALRULES.VisibilityMgr;
    RequiredConditions = class'X2TacticalVisibilityHelpers'.default.LivingGameplayVisibleFilter;
	VisibilityMgr.GetAllVisibleToSource(kUnit.ObjectID, VisibleUnits, class'XComGameState_Unit', HistoryIndex, RequiredConditions);

    local GameRulesCache_VisibilityInfo OutVisInfo;
	local X2GameRulesetVisibilityManager VisibilityMgr;

   	VisibilityMgr = `TACTICALRULES.VisibilityMgr;
    VisibilityMgr.GetVisibilityInfo(Unit.ID, EnemyUnit.ID, OutVisInfo);
    if (OutVisInfo.bVisibleGameplay)
    {
        RevealedEnemies.AddItem(EnemyUnit);
    }

	//bVisibleBasic; //TRUE if LOS is clear *AND* PeekToTargetDist is less than the source's visibility radius.	
	//bVisibleGameplay reflects game play mechanics like stealth, where bVisiblBasic might be true but the state of the unit makes it hidden
*/

// Note that we don't require these to be 'enemies' since civilians don't count
static function array<XComGameState_Unit> GetRevealedSpottersOfUnit(XComGameState_Unit Unit, bool bForceAllRevealed)
{
    local array<XComGameState_Unit> RevealedEnemies;
    local XComGameState_Unit EnemyUnit;

	foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_Unit', EnemyUnit)
	{
		// don't process visibility against self or the dead
		if( EnemyUnit.ObjectID == Unit.ObjectID || EnemyUnit.IsDead())
		{
			continue;
		}

        if(Unit.UnitBreaksConcealment(EnemyUnit) && (EnemyUnit.GetVisualizer().IsVisible() || bForceAllRevealed))
		{
            RevealedEnemies.AddItem(EnemyUnit);
        }
	}

    return RevealedEnemies;
}