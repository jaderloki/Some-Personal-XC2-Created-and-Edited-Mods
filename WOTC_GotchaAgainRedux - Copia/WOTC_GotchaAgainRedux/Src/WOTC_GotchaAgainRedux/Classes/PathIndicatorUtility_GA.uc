////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    16/10/23    01:45
////////////////////////////////////////////////////////////////////////////////////////////////////

//The Within specifier designates that instances of this class can only be created within an instance of the ClassName class
//meaning that an object of type ClassName must be assigned as the new instance’s Outer property at the time of creation.
//An example of this might be a MaterialExpression. 
//It would have no reason to exist outside of a Material so that class is declared using the Within specifier and the Material ClassName 
// making it impossible for a MaterialExpression to be created anywhere but within a Material.
class PathIndicatorUtility_GA extends Object within UIUnitFlagManager_GA config (Game) dependson (UIUnitActivationIndicator_GA);

`include(WOTC_GotchaAgainRedux\Src\ModConfigMenuAPI\MCM_API_CfgHelpers.uci)

var config array<HazardEffectPostType> PostTypes;
var config array<name>SuppressionEffectNames, SquadsightOverwatchPerkNames, ShadowStepEffectNames;

var private CacheUtility_GA CacheUtility;
var private LOSUtility_GA LOSUtility;

var public XComPathingPawn PathingPawn;

var private bool QualifiedForAudioWarningLastUpdate, QualifiedForAudioWarningThisUpdate, bUnitHasShadowstep, bRevertAlreadyChecked, bRevertIsActive;

var private int PathIndicatorLocationIndex;
var private array<PathIndicatorLocation_GA> PathIndicatorLocations;

// Keep an array of these and clear the unit-indicators after processing the movement path to avoid flicker from turning them off and on again!
var private array<int> UnitObjectIDsToClear;

////////////////////////////////////////////////////////////////////////////////////////////////////
//	ON INIT
////////////////////////////////////////////////////////////////////////////////////////////////////

public function Init(CacheUtility_GA CacheUtilityInstance, LOSUtility_GA LOSUtilityInstance)
{
    CacheUtility = CacheUtilityInstance;
    LOSUtility = LOSUtilityInstance;

    SetPathingPawn(XComTacticalController(class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController()).m_kPathingPawn);

    class'WorldInfo'.static.GetWorldInfo().MyWatchVariableMgr.RegisterWatchVariable( PathingPawn, 'WaypointModifyMode', self, OnUpdateWaypointMode);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	SET CURRENT PATHING PAWN
////////////////////////////////////////////////////////////////////////////////////////////////////

private function SetPathingPawn(XComPathingPawn _PathingPawn)
{
    PathingPawn = _PathingPawn;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	PROCESS NEW PATH INDICATORS
////////////////////////////////////////////////////////////////////////////////////////////////////

public function ProcessPathIndicators(XComPathingPawn _PathingPawn)
{
    local int LoosingConcealAtIndex;

    SetPathingPawn(_PathingPawn);

    ClearAllPathIndicators(true);

    PathIndicatorLocationIndex = INDEX_NONE;

	// Iridar: obsessive none checking.
	if (Outer.ControlledUnit == none) { return; }

    // Determine if this is a melee move that will break concealment immediately
    if(Outer.ControlledUnit.IsConcealed() && IsMeleeMove(PathingPawn.PathTiles))
    {
        LoosingConcealAtIndex = 0;
    }
    else
    {
        LoosingConcealAtIndex = INDEX_NONE;
    }

    // Prepare markers for default indicators (fire, poison, acid, noise) and figure out if concealment is lost along the path
    LoosingConcealAtIndex = PrepareDefaultIndicators(PathingPawn.PathTiles, LoosingConcealAtIndex);

    // Prepare markers for existing waypoints. MUST happen after the default indicators are prepared since otherwise they would be removed as part of cleanup happening in that method
    PrepareWaypointMarkers();

    // Prepare trigger markers. MUST happen after the default indicators are prepared since otherwise we don't know when we're loosing concealment
    if(`GETMCMVAR(bShowOverwatchTriggers) || `GETMCMVAR(bShowActivationTriggers) )
    {
        PrepareTriggerIndicators(PathingPawn.PathTiles, `GETMCMVAR(bShowOverwatchTriggers), `GETMCMVAR(bShowActivationTriggers), LoosingConcealAtIndex);
    }

    // Prepare custom markers
    if(`GETMCMVAR(bShowSmokeIndicator) )            { PrepareSmokeIndicator(PathingPawn.PathTiles);         }
    if(`GETMCMVAR(bShowDelayedDamageIndicator) )    { PrepareDelayedDamageIndicator(PathingPawn.PathTiles); }
	if(`GETMCMVAR(bShowHuntersMarkIndicator) )      { PrepareHuntersMarkIndicator(PathingPawn.PathTiles);   }
    
    // Update the waypoint-indicator at the current tile if waypoint-updatemode is active (private access-modifier is not enforced at runtime!)
    if(PathingPawn.WaypointModifyMode)
    {
        UpdateWaypointIndicator(false);
    }

    // Create the prepared markers
    CreateMarkers(PathingPawn.PathTiles[PathingPawn.PathTiles.Length - 1], PathingPawn.PathTiles.Length - 1);
    
    // Update Unit Flag Icons
    DoQueuedUnitFlagUpdates();

    // Ping singular post-made audio warning
    DoAudioWarning();
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	DO AUDIO PING ON PATH MARKER
////////////////////////////////////////////////////////////////////////////////////////////////////

private function DoAudioWarning()
{
    if(QualifiedForAudioWarningLastUpdate != QualifiedForAudioWarningThisUpdate)
    {
        if(QualifiedForAudioWarningThisUpdate)
        {
            PlayAKEvent(AkEvent'SoundTacticalUI.Concealment_Warning');
        }

        QualifiedForAudioWarningLastUpdate = QualifiedForAudioWarningThisUpdate;
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	CHECK FOR MELEE MOVEMENT ON PATH
////////////////////////////////////////////////////////////////////////////////////////////////////

// This is recreated from XComPathingPawn.Tick() because even though it has already been done, it is not passed along the callstack so we can access the result.
// The result is not used for changing the MovePuck either until after our code has run, so there is no other option than redoing it short of overriding and redoing
// the XComPathingPawn.RebuildPathingInformation() function which is the last place where the result is accessible before our code...
private function bool IsMeleeMove(const out array<TTile> PathTiles)
{
	local XComGameState_BaseObject TargetObject;
    local XComTacticalHUD Hud;
    local TTile PathDestination;
    local bool IsAMeleeMove;
    local int TargetObjectID;

    if(X2MeleePathingPawn_GA(PathingPawn) != none)
    {
        IsAMeleeMove = true;
    }
    else
    {
        Hud = XComTacticalHUD(class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController().myHUD);
        
        if(XComUnitPawn(Hud.CachedMouseInteractionInterface) != none)
        {
		    TargetObjectId = XComUnitPawn(Hud.CachedMouseInteractionInterface).GetGameUnit().ObjectID;
	    }
        else if(XComDestructibleActor(Hud.CachedMouseInteractionInterface) != none)
        {
		    TargetObjectId = XComDestructibleActor(Hud.CachedMouseInteractionInterface).ObjectID;
	    }

        TargetObject = `XCOMHISTORY.GetGameStateForObjectID(TargetObjectId);

        IsAMeleeMove = (PathingPawn.SelectMeleeMovePathDestination(TargetObject, Hud, PathDestination) != none);
    }

    if(IsAMeleeMove)
    {
        // Add an indicator on the current tile of the unit
        PathIndicatorLocationIndex = GetPathIndicator(PathTiles[0], 0, PathIndicatorLocationIndex);
        PathIndicatorLocations[PathIndicatorLocationIndex].AddIndicatorToLocation(eBreakConceal);
    }

    return IsAMeleeMove;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	PROCESS NEW PATH INDICATORS - STANDARD WAYPOINTS
////////////////////////////////////////////////////////////////////////////////////////////////////

private function PrepareWaypointMarkers()
{
    local int i, PathTilesIndex;
    
    for(i = 0; i < PathingPawn.Waypoints.Length; i++)
    {
        // We cannot search for structs using Find... wtf?
        for(PathTilesIndex = 0; PathTilesIndex < PathingPawn.PathTiles.Length; PathTilesIndex++)
        {
            if(PathingPawn.PathTiles[PathTilesIndex] == PathingPawn.Waypoints[i].Tile)
            {
                break; // We are certain to find it since we cannot have a waypoint not on the path
            }
        }

        PathIndicatorLocationIndex = GetPathIndicator(PathingPawn.Waypoints[i].Tile, PathTilesIndex, PathIndicatorLocationIndex);
    }
}

//UPDATE HERE !!
public function OnUpdateWaypointMode()
{
    //BAIL IF NOT USING CUSTOM SYSTEM
    if(!`GETMCMVAR(bUseCustomPathIndicatorSystem)) { return; }

    // Make sure we have the correct PathingPawn since this function can be called externally!
    SetPathingPawn(XComTacticalController(class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController()).m_kPathingPawn);

    // Reset PathIndicatorLocationIndex for the same reason
    PathIndicatorLocationIndex = INDEX_NONE;    
    UpdateWaypointIndicator(true);
}

//HONESTLY I GOT NO CLUE WHAT THIS DOES BUT I THINK IT IS WHAT DECIDES THE WAYPOINT TEXTURE INDEX ~ SO THANKYOU ORIGINAL GOTCHA DEVS! ~ RUSTYDIOS
private function UpdateWaypointIndicator(bool UpdateMarkerImmediately)
{
    PathIndicatorLocationIndex = GetPathIndicator(PathingPawn.PathTiles[PathingPawn.PathTiles.Length - 1], PathingPawn.PathTiles.Length - 1, PathIndicatorLocationIndex, false);

    // Private access-modifier not enforced at runtime
    if(PathingPawn.WaypointModifyMode)
    {
        if(PathIndicatorLocationIndex == INDEX_NONE)
        {
            PathIndicatorLocationIndex = GetPathIndicator(PathingPawn.PathTiles[PathingPawn.PathTiles.Length - 1], PathingPawn.PathTiles.Length - 1, PathIndicatorLocationIndex);
        }

        if(PathingPawn.Waypoints.Find('Tile',  PathIndicatorLocations[PathIndicatorLocationIndex].Tile) != INDEX_NONE)
        {
            PathIndicatorLocations[PathIndicatorLocationIndex].WaypointUpdateMode = eRemove;
        }
        else
        {
            PathIndicatorLocations[PathIndicatorLocationIndex].WaypointUpdateMode = eCreate;
        }
    }
    else if(PathIndicatorLocationIndex != INDEX_NONE)
    {
        PathIndicatorLocations[PathIndicatorLocationIndex].WaypointUpdateMode = eNoUpdate;
    }

    if(UpdateMarkerImmediately && PathIndicatorLocationIndex != INDEX_NONE)
    {
        if(PathIndicatorLocations[PathIndicatorLocationIndex].PathIndicator == none
           && PathIndicatorLocations[PathIndicatorLocationIndex].WaypointUpdateMode != eNoUpdate)
        {
            PathIndicatorLocations[PathIndicatorLocationIndex].PathIndicator = Outer.Spawn(class'PathIndicator_GA', Outer);
            PathIndicatorLocations[PathIndicatorLocationIndex].PathIndicator.Init(PathIndicatorLocations[PathIndicatorLocationIndex].Tile, 
                                                                                  PathIndicatorLocations[PathIndicatorLocationIndex].IndicatorTypes,
                                                                                  PathIndicatorLocations[PathIndicatorLocationIndex].WaypointUpdateMode);
        }
        else if(PathIndicatorLocations[PathIndicatorLocationIndex].PathIndicator != none
                  && PathIndicatorLocations[PathIndicatorLocationIndex].WaypointUpdateMode == eNoUpdate
                  && PathIndicatorLocations[PathIndicatorLocationIndex].IndicatorTypes.Length == 0
                  && PathingPawn.Waypoints.Find('Tile', PathIndicatorLocations[PathIndicatorLocationIndex].Tile) == INDEX_NONE)
        {
            PathIndicatorLocations[PathIndicatorLocationIndex].PathIndicator.Destroy();
            PathIndicatorLocations.RemoveItem(PathIndicatorLocations[PathIndicatorLocationIndex]);
        }
        else if(PathIndicatorLocations[PathIndicatorLocationIndex].PathIndicator != none)
        {
            PathIndicatorLocations[PathIndicatorLocationIndex].PathIndicator.UpdateWaypointMode(PathIndicatorLocations[PathIndicatorLocationIndex].WaypointUpdateMode);
        }
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	PROCESS NEW PATH INDICATORS - TRIGGERS - OVERWATCH, SUPPRESSION, POD REVEALS
////////////////////////////////////////////////////////////////////////////////////////////////////

private function PrepareTriggerIndicators(const out array<TTile> PathTiles, bool DoOverwatchIndicators, bool DoActivationIndicators, int BrokeConcealAtIndex)
{
    local XComWorldData World;
    local XComGameState_AIGroup AIGroup;
    local XComGameState_Unit EnemyUnit;
    local array<XComGameState_Unit> RevealedEnemies, Shooters, Viewers, TriggeredOverwatches;
    local array<XComGameState_AIGroup> TriggeredActivations, CurrentTileActivations;

    local array<name> DefaultShadowStepEffectNames;
    local name ShadowStepEffectName;

    local UIUnitActivationIndicator_GA ActivationIndi;
    local EActivationIcon OwActivationType;

	local Vector SourceVector, TargetVector;
	local float TargetCoverAngle;
    local int i, StartIndex;

    World = `XWORLD;

	// Iridar: obsessive none checking.
	if (Outer.ControlledUnit == none) { return; }

    // Check for shadowstep here - once - thanks davidtriune!
    bUnitHasShadowstep = false;
    DefaultShadowStepEffectNames = default.ShadowStepEffectNames;
    foreach DefaultShadowStepEffectNames(ShadowStepEffectName)
    {
        if ( Outer.ControlledUnit.AffectedByEffectNames.Find(ShadowStepEffectName) != INDEX_NONE)
        {
            bUnitHasShadowstep = true;
            break; //we found a shadowstep style effect
        }
    }

    // Only do our custom indicators if we're not concealed, or we're breaking concealment on this path ... since they're not relevant otherwise
    if(!Outer.ControlledUnit.IsConcealed() || BrokeConcealAtIndex != INDEX_NONE)
    {
        RevealedEnemies = CacheUtility.GetRevealedEnemiesOfUnit(Outer.ControlledUnit, `GETMCMVAR(bAlwaysShowPodActivation));

        // We can skip the first tile [0] since overwatches only trigger when moving through a tile
        //  and the first tile [0] we're only exiting and activations would have already happened for this tile if they were going to.
        StartIndex = 1;

        // If we are using the Revert Overwatch rules change mod we can take a single-tile move without triggering overwatches, so we increase the start index to reflect this
        // The Break LoS and Last Tile if in Concealment rules should also be handled correctly ... 
        if (!bRevertAlreadyChecked)
        {
            // IS MOD LOADED IS A PRETTY HEAVY CHECK AS IT GOES THROUGH ALL MODS, WHICH CAN BE LOADS, SO WE SAVE THE RESULT AND DO THIS ONCE ONLY!
            bRevertIsActive = class'X2DownloadableContentInfo_WOTC_GotchaAgainRedux'.static.IsModLoaded('WOTCRevertOverwatchRules');
            bRevertAlreadyChecked = true;
        }
        if (bRevertIsActive) { StartIndex++; }

        //START CHECKING TILES
        for(i = StartIndex; i < PathTiles.Length; i++)
        {
            // CONTINUE TO NEXT TILE IF UNIT IS CONCEALED
            if(Outer.ControlledUnit.IsConcealed() && i < BrokeConcealAtIndex) { continue; }

            // DONT TRIGGER FOR LAST TILE IF REVERT OVERWATCH RULES AND STILL IN CONCEALMENT
            if(Outer.ControlledUnit.IsConcealed() && i < BrokeConcealAtIndex && i == PathTiles.Length - 1 && bRevertIsActive) { continue; }

            //GET ALL UNITS THAT CAN SEE AND SHOOT THIS TILE
            GetShootersAndViewersForTile(PathTiles[i], RevealedEnemies, Shooters, Viewers); //, (i == PathTiles.Length - 1)); //REMOVED SKIP FINAL TILE CHECK ~ RUSTYDIOS
            
            // OVERWATCH AND SUPPRESSION - ONLY IF THERE ARE ACTIVE SHOOTERS
            if(DoOverwatchIndicators && Shooters.length > 0) //i < PathTiles.Length -1) //WOTC RULES CHANGE: OVERWATCHES CAN TRIGGER ON LAST TILE
            {
                foreach Shooters(EnemyUnit)
                {
                    // DONT TRIGGER FOR LAST TILE IF REVERT OVERWATCH RULES AND LAST TILE IS IN FULL COVER
                    if(i == PathTiles.Length - 1 && bRevertIsActive)
                    {
                        SourceVector = World.GetPositionFromTileCoordinates(EnemyUnit.TileLocation);
                        TargetVector = World.GetPositionFromTileCoordinates(PathTiles[i]);

                        // TargetCoverAngle is a required out parameter! It is never used...
                        if( World.GetCoverTypeForTarget(SourceVector, TargetVector, TargetCoverAngle) == CT_Standing)
                        {
                            continue;
                        }
                    }

                    // YEAY WE GET TO DO OVERWATCHES AND SUPPRESSION FINALLY
                    if(TriggeredOverwatches.Find(EnemyUnit) == INDEX_NONE)
                    {
                        TriggeredOverwatches.AddItem(EnemyUnit);
                                
                        PathIndicatorLocationIndex = GetPathIndicator(PathTiles[i], i, PathIndicatorLocationIndex);
                        PathIndicatorLocations[PathIndicatorLocationIndex].AddIndicatorToLocation(eTriggerOverwatch);
                        PathIndicatorLocations[PathIndicatorLocationIndex].TriggeredOverwatchObjectIDs.AddItem(EnemyUnit.ObjectID);
                        
                        // Set indicator on enemy unit and remove it from the list of UnitFlags to have the overwatch-indicator reset
                        // If the unit is not on overwatch it must be suppressing (either single or area)

                        ActivationIndi = CacheUtility.GetActivationIndicatorForUnitObjectID(EnemyUnit.ObjectID);

                        if (EnemyUnit.ReserveActionPoints.Find('overwatch') != INDEX_NONE )
                        {
                            OwActivationType = eOverwatchTriggered;
                        }
                        else if (EnemyUnit.ReserveActionPoints.Find('pistoloverwatch') != INDEX_NONE)
                        {
                            OwActivationType = eOverwatchTriggered;
                        }
                        else
                        {
                            OwActivationType = eSuppressionTriggered;
                        }

                        ActivationIndi.SetIcon(OwActivationType);
                        UnitObjectIDsToClear.RemoveItem(EnemyUnit.ObjectID);
                    }
                }
            }
            
            // POD ACTIVATIONS - ONLY IF THERE ARE ACTIVE VIEWERS
            if(DoActivationIndicators && Viewers.length > 0)
            {
                foreach Viewers(EnemyUnit)
                {
                    AIGroup = EnemyUnit.GetGroupMembership();
                    
                    if(
						EnemyUnit.IsUnrevealedAI()
                       && !EnemyUnit.IsMindControlled() // For some reason mind controlled XCom units return true for IsUnrevealedAI(), so we check that it is not mindcontrolled as well
                       && !EnemyUnit.IsUnitAffectedByEffectName('SireZombieLink') // Raised PsiZombies also return true for IsUnrevealedAI(), but they are always activated, so ignore these too
                       && TriggeredActivations.Find(AIGroup) == INDEX_NONE
					){
                        // Add these to an intermediate array before adding to TriggeredActivations, so we find all units from the pod activating on current tile
                        if(CurrentTileActivations.Find(AIGroup) == INDEX_NONE)
                        {
                            CurrentTileActivations.AddItem(AIGroup); 
                        }

                        PathIndicatorLocationIndex = GetPathIndicator(PathTiles[i], i, PathIndicatorLocationIndex);
                        PathIndicatorLocations[PathIndicatorLocationIndex].AddIndicatorToLocation(eTriggerActivation);
                        PathIndicatorLocations[PathIndicatorLocationIndex].TriggeredActivationObjectIDs.AddItem(EnemyUnit.ObjectID);

                        // Set indicator on enemy unit and remove it from the list of UnitFlags to have the overwatch-indicator reset
                        ActivationIndi = CacheUtility.GetActivationIndicatorForUnitObjectID(EnemyUnit.ObjectID);
                        ActivationIndi.SetIcon(ePodActivated);
                        UnitObjectIDsToClear.RemoveItem(EnemyUnit.ObjectID);
                    }
                }

                // Now add the activated pods to the check-array so we don't indicate any enemies from it as activating on a later tile
                foreach CurrentTileActivations(AIGroup)
                {
                    TriggeredActivations.AddItem(AIGroup);
                }
            }

        } //CLOSE PATHING TILES FOR LOOP

    } //CLOSE IS NOT CONCEALED
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	PROCESS NEW PATH INDICATORS - SMOKE
////////////////////////////////////////////////////////////////////////////////////////////////////

private function PrepareSmokeIndicator(const out array<TTile> PathTiles)
{
    local XComWorldData WorldData;
	local array<HazardEffectPostType> DefaultPostTypes;
    local HazardEffectPostType PostType;
    local TTile CheckTile;
 	local int i;

    WorldData = `XWORLD;

    CheckTile = PathTiles[PathTiles.Length - 1];

    // The native WorldData.TileContainsSmoke() is useless since it returns true if it contains smoke generated from fires, not smokegrenades...
    // We can get by with checking the ground-floor tile from the PathTiles array for the worldeffect from smokegrenades since the smoke seems to "fall down"
    // so we do not have to take unitheight into account.
    //|| `XWORLD.TileContainsWorldEffect(CheckTile, 'X2Effect_ApplySmokeToWorld') << CAN'T HAVE THIS AS IS THE WRONG 'SMOKE'

    /* //ORIGINAL FUNCTION FOR THROWBACK REF
        if(    WorldData.TileContainsWorldEffect(CheckTile, 'X2Effect_ApplySmokeGrenadeToWorld') 
            || WorldData.TileContainsWorldEffect(CheckTile, 'X2Effect_ApplySmokeGrenadeToWorld_NoLOS')
            || WorldData.TileContainsWorldEffect(CheckTile, 'X2Effect_ApplyDenseSmokeGrenadeToWorld')
            || WorldData.TileContainsWorldEffect(CheckTile, 'X2Effect_WOTC_APA_ApplyAidProtocolSmokeToWorld')
            || WorldData.TileContainsWorldEffect(CheckTile, 'X2Effect_ApplySmokeGrenadeToWorldWithConceal') )
        {
            PathIndicatorLocationIndex = GetPathIndicator(PathTiles[PathTiles.Length - 1], PathTiles.Length - 1, PathIndicatorLocationIndex);
            PathIndicatorLocations[PathIndicatorLocationIndex].AddIndicatorToLocation(eMoveThroughSmoke);
        }
    */

    // Iridar - store the config array in a local var so the function doesn't need to grab the ClassDefaultObject everytime and we can filter the array
	DefaultPostTypes = default.PostTypes;

	// Iridar - Smoke checks only care if the marker type is eMoveThroughSmoke, so we can remove anything that isn't
	for (i = DefaultPostTypes.Length - 1; i >= 0; i--)
	{
		if (DefaultPostTypes[i].HazardMarkerType != eMoveThroughSmoke )
		{
			DefaultPostTypes.Remove(i, 1);
		}
	}

    //RUSTY CONFIG VERSION :)
    foreach DefaultPostTypes(PostType)
    {
        if( WorldData.TileContainsWorldEffect(CheckTile, PostType.EffectName)) // && PostType.HazardMarkerType == eMoveThroughSmoke) // extra check now redundant as we removed anything that wasn't smoke
        {
            PathIndicatorLocationIndex = GetPathIndicator(PathTiles[PathTiles.Length - 1], PathTiles.Length - 1, PathIndicatorLocationIndex);
            PathIndicatorLocations[PathIndicatorLocationIndex].AddIndicatorToLocation(eMoveThroughSmoke); //PostType.HazardMarkerType); //will always be eMoveThroughSmoke as everything else is removed
        }
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	PROCESS NEW PATH INDICATORS - DELAYED DAMAGE AOE - EG PSIBOMB
////////////////////////////////////////////////////////////////////////////////////////////////////

private function PrepareDelayedDamageIndicator(const out array<TTile> PathTiles)
{
    local XComWorldData WorldData;
	local XComGameStateHistory History;
    local X2Effect_Persistent PersistentEffect;
    local XComGameState_Effect Effect;
    local X2AbilityTemplateManager AbiltyManager;
    local X2AbilityTemplate AbilityTemplate;
	local XComGameState_Ability AbilityState;
	local array<HazardEffectPostType> DefaultPostTypes;
    local HazardEffectPostType PostType;
	local vector EndPathPosition;
    local float DistanceInUnits, TargetRadius;
 	local int i;

	// Iridar: obsessive none checking.
	if (Outer.ControlledUnit == none) { return; }

    WorldData = `XWORLD;
	History = `XCOMHISTORY;
    AbiltyManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

    // Iridar - store the config array in a local var so the function doesn't need to grab the ClassDefaultObject for every effect in History
	DefaultPostTypes = default.PostTypes;

	// Iridar - If a unit is immune to a particular damage type in a PostType, we will always skip that PostType later.
	// So do the checks now and remove the PostTypes with damage types the unit is immune to from consideration.
    // Checks for a delayed damage indicator should also have an ability type, so we can remove any that don't as well
	for (i = DefaultPostTypes.Length - 1; i >= 0; i--)
	{
		if (DefaultPostTypes[i].AbilityName == '' || Outer.ControlledUnit.IsImmuneToDamage(DefaultPostTypes[i].DamageType) )
		{
			DefaultPostTypes.Remove(i, 1);
		}
	}
	
	// Iridar: cache the end path position, no need to recalculate it every time in the foreach.
	EndPathPosition = WorldData.GetPositionFromTileCoordinates(PathTiles[PathTiles.Length - 1]);

	// Rusty: cache the Path Indicator Location Index, no need to recalculate it every time in the foreach.
    PathIndicatorLocationIndex = GetPathIndicator(PathTiles[PathTiles.Length - 1], PathTiles.Length - 1, PathIndicatorLocationIndex);

    //CHECK THROUGH ALL EFFECTS
    // <> TODO : PROFILE THIS FOR HOW MUCH LAG IT CAUSES AS THIS IS HOTCODE
    foreach History.IterateByClassType(class'XComGameState_Effect', Effect)
    {
        PersistentEffect = Effect.GetX2Effect();

        //CONTINUE IF NOT A PERSISTENT EFFECT
		// Iridar: technically, only Persistent Effects have an Effect State, so it's always a persistent effect
		// it's still a good check to do, maybe it would help in case a mod was removed mid mission
        if(PersistentEffect == none) { continue; }

		// Iridar: don't assume it has an effect name, though you have to do dumb things to end up with an effect without an effect name
		if (PersistentEffect.EffectName == '') { continue; }

        // ... CHECK FOR MATCHING CONFIG ENTRIES
        foreach DefaultPostTypes(PostType)
        {
            //CHECK IF THIS EFFECT SHOULD PROCESS AS DELAYED DAMAGE 'BOMB' ...
            if (PostType.EffectName != PersistentEffect.EffectName ) { continue; }

            // Iridar: don't assume the effect was applied to a location
            if (Effect.ApplyEffectParameters.AbilityInputContext.TargetLocations.Length == 0) { continue; }

            // CHECK THE SECONDARY PERK LISTED IN THE CONFIG ACTUALLY EXISTS
            AbilityTemplate = AbiltyManager.FindAbilityTemplate(PostType.AbilityName); 
			if (AbilityTemplate == none) { continue; }

			// Iridar: grab the template of the ability that applied the effect, not the ability specified in config
			AbilityTemplate = AbiltyManager.FindAbilityTemplate(Effect.ApplyEffectParameters.AbilityInputContext.AbilityTemplateName);
			if (AbilityTemplate == none) { continue; }

            // CALCULATE IF WITHIN RANGE OF EXPLOSION ABILITY ... 

			// Iridar: none check.
			// Technically this is pretty bad practice, because you're only respecting abilities that have a radius multi target,
			// but a proper "is unit in range of ability effect" is way more expensive, so hard to say if this is worth it.
            // ~ meh!, as the only current use cases are both of this type ~ Rusty
			if (X2AbilityMultiTarget_Radius(AbilityTemplate.AbilityMultiTargetStyle) == none) { continue; }

            // THIS ASSUMES THAT THE RADIUS OF THE PERK/STATE THAT MADE THE EFFECT AND THE RADIUS OF THE DELAYED SECOND PERK/EFFECT ARE THE SAME!
			AbilityState = XComGameState_Ability(History.GetGameStateForObjectID(Effect.ApplyEffectParameters.AbilityInputContext.AbilityRef.ObjectID));
			if (AbilityState == none) { continue; }

			// Iridar: a more proper way to get ability radius, uses the calculated/modified radius
            // Returns distance in Units this Ability can reach from the source location. -1 if unlimited range.
			TargetRadius = X2AbilityMultiTarget_Radius(AbilityTemplate.AbilityMultiTargetStyle).GetTargetRadius(AbilityState);
            // Had to go back to the old method, new one didn't work, shows post for wherever the bomb can be set, not the bomb radius itself? ~ Rusty
            // Is in  Meters! (for now) If bUseWeaponRadius is true, this value is added on.
			//TargetRadius = X2AbilityMultiTarget_Radius(AbilityTemplate.AbilityMultiTargetStyle).fTargetRadius;
            if (TargetRadius == 0) { continue; }

            //DistanceInMeters = VSize(WorldData.GetPositionFromTileCoordinates(PathTiles[PathTiles.Length - 1]) 
            //    - Effect.ApplyEffectParameters.AbilityInputContext.TargetLocations[0]) / WorldData.WORLD_METERS_TO_UNITS_MULTIPLIER;

			//DistanceInMeters = VSize(EndPathPosition - Effect.ApplyEffectParameters.AbilityInputContext.TargetLocations[0]) / WorldData.WORLD_METERS_TO_UNITS_MULTIPLIER;

			// Iridar: slightly shorter way of writing the same thing. slightly faster too :D
            //TargetRadius = `UNITSTOMETERS(TargetRadius);
			//DistanceInMeters = `UNITSTOMETERS(VSize(EndPathPosition - Effect.ApplyEffectParameters.AbilityInputContext.TargetLocations[0]));

            // BOTH VALUES ARE IN UNITS SO NO POINT IN CONVERTING BOTH TO METERS TO THEN COMPARE THEM
            DistanceInUnits = VSize(EndPathPosition - Effect.ApplyEffectParameters.AbilityInputContext.TargetLocations[0]);
            if(DistanceInUnits <= TargetRadius)
            {
                //END PATH MARKER IS IN THE RADIUS, POP UP THE POST HERE
                //PathIndicatorLocationIndex = GetPathIndicator(PathTiles[PathTiles.Length - 1], PathTiles.Length - 1, PathIndicatorLocationIndex);
                PathIndicatorLocations[PathIndicatorLocationIndex].AddIndicatorToLocation(PostType.HazardMarkerType);
                break; //FOUND A POST TYPE NEEDED FOR THIS EFFECT, BREAK OUT OF POSTTYPES TO GO TO NEXT EFFECT ...
            }

        } //CLOSE POSTTYPES FOREACH

    } //CLOSE EFFECT FOREACH
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	PROCESS NEW PATH INDICATORS - HUNTERS MARK
////////////////////////////////////////////////////////////////////////////////////////////////////

private function PrepareHuntersMarkIndicator(const out array<TTile> PathTiles)
{
    local XComWorldData WorldData;
	local array<HazardEffectPostType> DefaultPostTypes;
    local HazardEffectPostType PostType;
	local TTile CheckTile;
    local int i;

    WorldData = `XWORLD;
    CheckTile = PathTiles[PathTiles.Length - 1];

	// HUNTERS MARK CHECKING - USES UNIQUE MARKER SYSTEM!
	for(i = 0; i < PathingPawn.LaserScopeMarkers.Length; i++)
    {
        if(PathingPawn.LaserScopeMarkers[i] == CheckTile)
        {
			PathIndicatorLocationIndex = GetPathIndicator(PathTiles[PathTiles.Length - 1], PathTiles.Length - 1, PathIndicatorLocationIndex);
            PathIndicatorLocations[PathIndicatorLocationIndex].AddIndicatorToLocation(eHunterShot);
            break;
        }
    }

    // KILLZONE CHECKING - USES UNIQUE MARKER SYSTEM!
	for(i = 0; i < PathingPawn.KillZoneMarkers.Length; i++)
    {
        if(PathingPawn.KillZoneMarkers[i] == CheckTile)
        {
			PathIndicatorLocationIndex = GetPathIndicator(PathTiles[PathTiles.Length - 1], PathTiles.Length - 1, PathIndicatorLocationIndex);
            PathIndicatorLocations[PathIndicatorLocationIndex].AddIndicatorToLocation(eHunterShot);
            break;
        }
    }

    // Iridar - store the config array in a local var so the function doesn't need to grab the ClassDefaultObject for every effect in History
	DefaultPostTypes = default.PostTypes;

	// Iridar - HunterMark checks only care if the marker type is eHunterShot, so we can remove anything that isn't
	for (i = DefaultPostTypes.Length - 1; i >= 0; i--)
	{
		if (DefaultPostTypes[i].HazardMarkerType != eHunterShot )
		{
			DefaultPostTypes.Remove(i, 1);
		}
	}

    // CHECK CONFIG FOR MORE EFFECTS
    foreach DefaultPostTypes(PostType)
    {
        if( WorldData.TileContainsWorldEffect(CheckTile, PostType.EffectName) ) // && PostType.HazardMarkerType == eHunterShot ) //extra check now not required as we removed any post types that dont match
        {
            PathIndicatorLocationIndex = GetPathIndicator(PathTiles[PathTiles.Length - 1], PathTiles.Length - 1, PathIndicatorLocationIndex);
            PathIndicatorLocations[PathIndicatorLocationIndex].AddIndicatorToLocation(eHunterShot);
        }
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	PROCESS NEW PATH INDICATORS - DEFAULTS - NOISE, HAZARDS, CONCEALMENT BREAKS
//  THIS METHOD IS FIRST TO COMPLETE BUT LAST IN CODE AS IT'S THE ONLY ONE THAT RETURNS A VALUE !!
//  VALUE IS USED FOR [LOOSINGCONCEALATINDEX] ... 
////////////////////////////////////////////////////////////////////////////////////////////////////

private function int PrepareDefaultIndicators(const out array<TTile> PathTiles, int LoosingConcealAtIndex)
{
	local array<HazardEffectPostType> DefaultPostTypes;
    local HazardEffectPostType PostType;
    local EIndicatorType HazardMarkerType;
    local array<PathPoint> PathPoints;
    local bool FireTriggered, AcidTriggered, PoisonTriggered, CurseTriggered, FrostTriggered, BrokeConceal, MCMNoiseShowing;
    local int i, j, CorrectedNoiseMarkerPosition, HazardMarkersIndex, BrokeConcealAtIndex;

	// Iridar: obsessive none checking.
	if (Outer.ControlledUnit == none) { return 0 ; }

    //CHECK WHEN CONCEALMENT WAS BROKEN
    BrokeConcealAtIndex = LoosingConcealAtIndex;
    BrokeConceal = !Outer.ControlledUnit.IsConcealed() || LoosingConcealAtIndex != INDEX_NONE;

    // Set the already triggered bools to the immunity value of the moving unit to avoid indicators of that type
    // this is also used to negate having a string from first tile marked to last tile in the actual check
    FireTriggered   = Outer.ControlledUnit.IsImmuneToDamage('Fire');
    AcidTriggered   = Outer.ControlledUnit.IsImmuneToDamage('Acid');
    PoisonTriggered = Outer.ControlledUnit.IsImmuneToDamage('Poison');
    CurseTriggered  = Outer.ControlledUnit.IsImmuneToDamage('Psi');
    FrostTriggered  = Outer.ControlledUnit.IsImmuneToDamage('Frost');

    // Iridar - store the config array in a local var so the function doesn't need to grab the ClassDefaultObject for every for loop
    DefaultPostTypes = default.PostTypes;

	// Iridar - If a unit is immune to a particular damage type in a PostType, we will always skip that PostType later.
	// So do the checks now and remove the PostTypes with damage types the unit is immune to from consideration.
    // Checks for this indicator should also NOT have an ability type, so we can remove any that do as well
	for (i = DefaultPostTypes.Length - 1; i >= 0; i--)
	{
		if (DefaultPostTypes[i].AbilityName != '' || Outer.ControlledUnit.IsImmuneToDamage(DefaultPostTypes[i].DamageType) )
		{
			DefaultPostTypes.Remove(i, 1);
		}
	}

    //get if the MCM setting for if noise indicators is on so we don't have to find it each loop
    MCMNoiseShowing = `GETMCMVAR(bShowNoiseIndicators);

    //FOR EACH TILE IN THE PATH
    for(i = 0; i < PathTiles.Length; i++)
    {
        // CONCEALMENT BROKEN MARKER
        if(!BrokeConceal && PathingPawn.ConcealmentMarkers.Length > 0 && PathingPawn.ConcealmentMarkers[0] == PathTiles[i])
        {
            PathIndicatorLocationIndex = GetPathIndicator(PathTiles[i], i, PathIndicatorLocationIndex);
            PathIndicatorLocations[PathIndicatorLocationIndex].AddIndicatorToLocation(eBreakConceal);
            PathingPawn.ConcealmentMarkers.Length = 0;
            BrokeConceal = true;
            BrokeConcealAtIndex = i;
        }

        // NOISE MADE MARKER - WINDOWS, DOORS
        if(MCMNoiseShowing || !BrokeConceal)
        {
            for(j = 0; j < PathingPawn.NoiseMarkers.Length; j++)
            {
                if(PathingPawn.NoiseMarkers[j] == PathTiles[i])
                {
                    // NOISE MARKERS GENERATED BY THE NATIVE CODE ARE PLACED 1TILE TOO EARLY, SO HERE WE CORRECT THEM!
                    CorrectedNoiseMarkerPosition = (i < PathTiles.Length - 1) ? i + 1 : i;
                    PathIndicatorLocationIndex = GetPathIndicator(PathTiles[CorrectedNoiseMarkerPosition], CorrectedNoiseMarkerPosition, PathIndicatorLocationIndex);
                    PathIndicatorLocations[PathIndicatorLocationIndex].AddIndicatorToLocation(eMakeNoise);
                    
                    PathingPawn.NoiseMarkers.RemoveItem(PathingPawn.NoiseMarkers[j]);
                    break;
                }
            }
        }

        // HAZARD MARKERS - FIRE, ACID, POISON, FROST, CURSE
        HazardMarkersIndex = PathingPawn.HazardMarkers.Find('Tile', PathTiles[i]);
        if(HazardMarkersIndex != INDEX_NONE)
        {
            for(j = 0; j < PathingPawn.HazardMarkers[HazardMarkersIndex].HazardEffectNames.Length; j++)
            {
                // CHECK CONFIG FOR MORE EFFECTS
                foreach DefaultPostTypes(PostType)
                {
                    //IF THE POST TYPE HAS AN ATTACHED ABILITY NAME THEN IT SHOULD BE COVERED BY DELAYED DAMAGE MARKERS
                    //CONTINUE ON ... MOVED TO REMOVE FROM INITIAL ARRAY
                    //if (PostType.AbilityName != '') { continue; }

                    //IF THE POST TYPE EFFECT MATCHES OUR HAZARD EFFECT WE WANT TO KEEP GOING
                    if (PostType.EffectName == PathingPawn.HazardMarkers[HazardMarkersIndex].HazardEffectNames[j])
                    {
                        switch (PostType.HazardMarkerType)
                        {
                            case eMoveThroughFire:      HazardMarkerType = FireTriggered    ? eNone : eMoveThroughFire;     FireTriggered   = true; break;
                            case eMoveThroughAcid:      HazardMarkerType = AcidTriggered    ? eNone : eMoveThroughAcid;     AcidTriggered   = true; break;
                            case eMoveThroughPoison:    HazardMarkerType = PoisonTriggered  ? eNone : eMoveThroughPoison;   PoisonTriggered = true; break;
                            case eMoveThroughCurse:     HazardMarkerType = CurseTriggered   ? eNone : eMoveThroughCurse;    CurseTriggered  = true; break;
                            case eMoveThroughFrost:     HazardMarkerType = FrostTriggered   ? eNone : eMoveThroughFrost;    FrostTriggered  = true; break;
                            default:
                                //so this is anything else in the array, such as psibombs and smokes and unknown stuff
                                HazardMarkerType = eNone;
                                break;
                        }
                    }
                }

                //IF THE MARKER TYPE WAS FOUND AND REQUIRED, WE ADD A MARKER
                if(HazardMarkerType != eNone)
                {
                    PathIndicatorLocationIndex = GetPathIndicator(PathTiles[i], i, PathIndicatorLocationIndex);
                    PathIndicatorLocations[PathIndicatorLocationIndex].AddIndicatorToLocation(HazardMarkerType);
                }
            }

            // REMOVE THIS HAZARD MARKER FROM THE BASE-GAME ARRAY, WE'VE HANDLED IT
            PathingPawn.HazardMarkers.RemoveItem(PathingPawn.HazardMarkers[HazardMarkersIndex]);
        }

    } //CLOSE FOREACH PATH TILES

    // Make sure nothing is left over for the standard function indicator function!
    // This is not strictly necessary since we override that function to do nothing as this code will not run before every call of it ...
    PathingPawn.HazardMarkers.Length = 0; 
    PathingPawn.NoiseMarkers.Length = 0;

    // Only concealment-breaking noise-markers are stored in the PathingPawn.NoiseMarkers array, so we do a manual investigation to check if noise-only markers are needed
    if(MCMNoiseShowing)
    {
        class'X2PathSolver'.static.GetPathPointsFromPath(Outer.ControlledUnit, PathTiles, PathPoints);

        for(i = 0; i < PathPoints.Length; i++)
        {
            switch(PathPoints[i].Traversal)
            {
                case eTraversal_BreakWindow:
                case eTraversal_KickDoor:
                    PathIndicatorLocationIndex = GetPathIndicator(PathTiles[PathPoints[i].PathTileIndex], PathPoints[i].PathTileIndex, PathIndicatorLocationIndex);
                    PathIndicatorLocations[PathIndicatorLocationIndex].AddIndicatorToLocation(eMakeNoise);
                    break;
            }
        }
    }

    // Check if we have to convert a noise-marker to a break-concealment marker or if noise-markers are not enabled remove any that comes after a concealment-breaking marker!
    BrokeConceal = !Outer.ControlledUnit.IsConcealed();
    PathIndicatorLocations.Sort(IndicatorSortFunction);

    for(i = 0; i < PathIndicatorLocations.Length; i++)
    {
        for(j = PathIndicatorLocations[i].IndicatorTypes.Length - 1; j > -1; j--)
        {
            if(BrokeConceal)
            {
                if(PathIndicatorLocations[i].IndicatorTypes[j] == eBreakConceal)
                {
                    // If we already broke concealment at this point, remove this indicator
                    PathIndicatorLocations[i].IndicatorTypes.RemoveItem(PathIndicatorLocations[i].IndicatorTypes[j]);
                }
                else if(PathIndicatorLocations[i].IndicatorTypes[j] == eMakeNoise && !MCMNoiseShowing)
                {
                    // If we don't need any more breakconceal-indicators and noise-indicators are not enabled, remove them!
                    PathIndicatorLocations[i].IndicatorTypes.RemoveItem(PathIndicatorLocations[i].IndicatorTypes[j]);
                }
            }
            else
            {
                if(PathIndicatorLocations[i].IndicatorTypes[j] == eBreakConceal)
                {
                    BrokeConceal = true;
                    if(BrokeConcealAtIndex == INDEX_NONE || BrokeConcealAtIndex > PathIndicatorLocations[i].PathTileIndex)
                    {
                        BrokeConcealAtIndex = PathIndicatorLocations[i].PathTileIndex;
                    }
                }
                else if(PathIndicatorLocations[i].IndicatorTypes[j] == eMakeNoise)
                {
                    // The first time we make noise, we will also break concealment!
                    PathIndicatorLocations[i].IndicatorTypes[j] = eBreakConceal;
                    BrokeConceal = true;

                    if(BrokeConcealAtIndex == INDEX_NONE || BrokeConcealAtIndex > PathIndicatorLocations[i].PathTileIndex)
                    {
                        BrokeConcealAtIndex = PathIndicatorLocations[i].PathTileIndex;
                    }
                }
            }
        }
        
        // If there are no more indicatortypes left at this tile, remove the indicator completely!
        if(PathIndicatorLocations[i].IndicatorTypes.Length == 0)
        {
            PathIndicatorLocations.RemoveItem(PathIndicatorLocations[i]);
            i--;
        }

    } //CLOSE PATH INDICATOR LOCATIONS

    //RETURN THE CONCEALMENT BROKEN INDEX!!
    return BrokeConcealAtIndex;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	CREATE NEW WAYPOINT MARKERS - MORE MAGIC FROM THE GOTCHA DEVS! ~ THANKS
////////////////////////////////////////////////////////////////////////////////////////////////////

private function CreateMarkers(TTile SummaryTile, int SummaryTilePathTileIndex)
{
    local int i,SummaryIndicatorIndex;
    local EIndicatorType Indicator;

    QualifiedForAudioWarningThisUpdate = false;

    // Now determine what to show in the summary-indicator and actually create the path indicators.
    // Sort the indicators so the summary is order in order of encountering the thing that is indicated
    PathIndicatorLocations.Sort(IndicatorSortFunction);

    SummaryIndicatorIndex = GetPathIndicator(SummaryTile, SummaryTilePathTileIndex, INDEX_NONE);
    
    for(i = 0; i < PathIndicatorLocations.Length; i++)
    {
        // We handle the summary indicator last
        if(i == SummaryIndicatorIndex)
        {
            continue;
        }

        PathIndicatorLocations[i].PathIndicator = Outer.Spawn(class'PathIndicator_GA', Outer);
        PathIndicatorLocations[i].PathIndicator.Init(PathIndicatorLocations[i].Tile, PathIndicatorLocations[i].IndicatorTypes, PathIndicatorLocations[i].WaypointUpdateMode);

        foreach PathIndicatorLocations[i].IndicatorTypes(Indicator)
        {
            PathIndicatorLocations[SummaryIndicatorIndex].AddIndicatorToLocation(Indicator);
        }
    }

    // Only create the summary indicator if there is something to summarize or it is on top of a waypoint
    if(PathIndicatorLocations[SummaryIndicatorIndex].IndicatorTypes.Length > 0
       || PathIndicatorLocations[SummaryIndicatorIndex].WaypointUpdateMode != eNoUpdate
       || PathingPawn.Waypoints.Find('Tile', PathIndicatorLocations[SummaryIndicatorIndex].Tile) != INDEX_NONE)
    {
        PathIndicatorLocations[SummaryIndicatorIndex].PathIndicator = Outer.Spawn(class'PathIndicator_GA', Outer);
        PathIndicatorLocations[SummaryIndicatorIndex].PathIndicator.Init(PathIndicatorLocations[SummaryIndicatorIndex].Tile, 
            PathIndicatorLocations[SummaryIndicatorIndex].IndicatorTypes, PathIndicatorLocations[SummaryIndicatorIndex].WaypointUpdateMode);

        // If the summary-indicator was created because of indicators (could be a waypoint as well which is not relevant), we qualify for an audio-warning
        if(PathIndicatorLocations[SummaryIndicatorIndex].IndicatorTypes.Length > 0)
        {
            QualifiedForAudioWarningThisUpdate = true;
        }
    }
    else
    {
        PathIndicatorLocations.RemoveItem(PathIndicatorLocations[SummaryIndicatorIndex]);
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	SORT ALL INDICATORS - PRETTY SIMPLE SORT METHOD
////////////////////////////////////////////////////////////////////////////////////////////////////

private function int IndicatorSortFunction(PathIndicatorLocation_GA A, PathIndicatorLocation_GA B)
{
    return (A.PathTileIndex > B.PathTileIndex) ? -1 : 0;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	GET INDIVIDUAL INDICATORS
////////////////////////////////////////////////////////////////////////////////////////////////////

private function int GetPathIndicator(TTile Tile, int PathTileIndex, int CurrentIndex, optional bool CreateIfNoneFound = true)
{
    local PathIndicatorLocation_GA newPathIndicatorLocation;
    local int i;

    if(CurrentIndex != INDEX_NONE && PathIndicatorLocations[CurrentIndex].Tile == Tile)
    {  
        // Skip searching if we have the correct index already
        return CurrentIndex;
    }

    PathIndicatorLocationIndex = INDEX_NONE;

    for(i = 0; i < PathIndicatorLocations.Length; i++)
    {
        if(PathIndicatorLocations[i].Tile == Tile)
        {
            PathIndicatorLocationIndex = i;
            break;
        }
    }

    if(PathIndicatorLocationIndex == INDEX_NONE && CreateIfNoneFound)
    {
        PathIndicatorLocationIndex = PathIndicatorLocations.Length;
        newPathIndicatorLocation = new class'PathIndicatorLocation_GA';
        newPathIndicatorLocation.PathTileIndex = PathTileIndex;
        newPathIndicatorLocation.Tile = Tile;
        PathIndicatorLocations.AddItem(newPathIndicatorLocation);
    }

    return PathIndicatorLocationIndex;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	CLEAR ALL INDICATORS
////////////////////////////////////////////////////////////////////////////////////////////////////

public function ClearAllPathIndicators(optional bool QueueUnitFlagUpdates = false)
{
    local int i, TriggeredObjectID;

    for(i = 0; i < PathIndicatorLocations.Length; i++)
    {
        PathIndicatorLocations[i].PathIndicator.Destroy();

        foreach PathIndicatorLocations[i].TriggeredOverwatchObjectIDs(TriggeredObjectID)
        {
            UnitObjectIDsToClear.AddItem(TriggeredObjectID);
        }

        foreach PathIndicatorLocations[i].TriggeredActivationObjectIDs(TriggeredObjectID)
        {
            UnitObjectIDsToClear.AddItem(TriggeredObjectID);
        }
    }

    PathIndicatorLocations.Length = 0;

    if(!QueueUnitFlagUpdates)
    {
        DoQueuedUnitFlagUpdates();
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	UPDATE UNIT FLAG LOS MARKERS
////////////////////////////////////////////////////////////////////////////////////////////////////

private function DoQueuedUnitFlagUpdates()
{
    local int UnitObjectID;

    foreach UnitObjectIDsToClear(UnitObjectID)
    {
        CacheUtility.GetActivationIndicatorForUnitObjectID(UnitObjectID).SetIcon(eNone);
    }

    UnitObjectIDsToClear.Length = 0;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	GET ALL UNITS THAT SEE AND CAN SHOOT AT TILE
////////////////////////////////////////////////////////////////////////////////////////////////////

// This has side-effects! (Shooters and Viewers arrays)
private function GetShootersAndViewersForTile(const out TTile Tile, const out array<XComGameState_Unit> RevealedEnemies, out array<XComGameState_Unit> Shooters, out array<XComGameState_Unit> Viewers)
{
    local XComGameState_Unit EnemyUnit, EnemySpotter;
    local LOSValues UnitLOSValues;
    local array<int> IndexesToCheckForSpotters;
    local int i, SuppressionEffectIndex, SuppressionEffectID;
    local bool SpotterFound;
    local name SuppressionEffectName;
    local string TilePositionXYZ;

    Shooters.Length = 0;
    Viewers.Length = 0;

    TilePositionXYZ = "[" $ Tile.X $ "." $ Tile.Y $"." $ Tile.Z $"]";

    if (`GETMCMVAR(bEnableLogging)) { class'Helpers'.static.OutputMsg("===== TILE ======" @ TilePositionXYZ ); }

    foreach RevealedEnemies(EnemyUnit)
    {
        // WOTC Update - Overwatch can now trigger on the final tile.
        //      The final tile is not relevant for shooters since overwatch cannot trigger on that
        //      On all but the final tile our unit is moving so would logically not be used for overwatching units LOS checks, BUT IT IS!
        // If this is the final tile, we need to get actual LOS values!

        UnitLOSValues = LOSUtility.GetLOSValues(EnemyUnit.TileLocation, Tile, EnemyUnit, Outer.ControlledUnit, LOSUtility.GetUnitSightRange(EnemyUnit), , !EnemyUnit.CanTakeCover());
        SuppressionEffectIndex = INDEX_NONE;
        
        // If the unit has clear LoS to us ... SO THIS SHOULD INCLUDE REVERT OVERWATCH RULES CHANGES ...
        if(UnitLOSValues.bClearLOS)
        {
            // Shooters within regular range are always viewers too
            if(UnitLOSValues.bWithinRegularRange)
            {
                Viewers.AddItem(EnemyUnit);

                // WOTC Update - Overwatch can now trigger on the final tile. So it does not only register as a viewer anymore
                // <> TODO : ACOUNT FOR REVERT OVERWATCH RULES CHANGE MOD HERE ??
                //if (IsFinalTile) { continue; } 

                // - only add shooter for overwatch/suppression if unit does not have shadowstep ...
                if(!bUnitHasShadowstep)
                {
                    // Enemies doing suppression are relevant for shooters
                    // - checking by action point type, gets Supression of 'nearly' all types ? ...

                    // Enemies on overwatch are relevant for shooters
                    // - checking by action point type, gets Overwatch, Pistol Overwatch, Longwatch, Chemthrower Overwatch, Modded Overwatch ...

                    if(EnemyUnit.ReserveActionPoints.Find('overwatch') != INDEX_NONE || EnemyUnit.ReserveActionPoints.Find('pistoloverwatch') != INDEX_NONE )
                    {
                        if (`GETMCMVAR(bEnableLogging)) { class'Helpers'.static.OutputMsg("Shooters:" @ EnemyUnit.GetFullName() @ "| ID" @EnemyUnit.GetReference().ObjectID @"| Reason: Overwatch"); }
                        Shooters.AddItem(EnemyUnit);
                    }
                    else if(`GETMCMVAR(bShowOverwatchTriggerForSuppression) && EnemyUnit.ReserveActionPoints.Find('Suppression') != INDEX_NONE)
                    {
                        foreach default.SuppressionEffectNames(SuppressionEffectName)
                        {
                            // Find the first relevant suppression effect ...
                            SuppressionEffectIndex = EnemyUnit.AppliedEffectNames.Find(SuppressionEffectName);

                            // Check that the found suppression is applied to the moving unit before adding the enemy to Shooters
                            if(SuppressionEffectIndex != INDEX_NONE)
                            {
                                SuppressionEffectID = EnemyUnit.AppliedEffects[SuppressionEffectIndex].ObjectID;

                                // Check that the found suppression is applied to the moving unit before adding the enemy to Shooters
                                if(Outer.ControlledUnit.AffectedByEffects.Find('ObjectID', SuppressionEffectID) != INDEX_NONE)
                                {
                                    if (`GETMCMVAR(bEnableLogging)) { class'Helpers'.static.OutputMsg("Shooters:" @ EnemyUnit.GetFullName() @ "| ID" @EnemyUnit.GetReference().ObjectID @"| Reason:" @SuppressionEffectName); }
                                    Shooters.AddItem(EnemyUnit);
                                }
                                break; //we found a suppression effect, stop looking for more
                            }
                        }
                    }

                } // end shadowstep check
            }
            else if( EnemyUnit.HasAnyOfTheAbilitiesFromAnySource(default.SquadsightOverwatchPerkNames)) //'LongWatch'))
            {
                // - only add shooter for overwatch/suppression if unit does not have shadowstep ...
                if(!bUnitHasShadowstep)
                {
                    if(EnemyUnit.ReserveActionPoints.Find('overwatch') != INDEX_NONE || EnemyUnit.ReserveActionPoints.Find('pistoloverwatch') != INDEX_NONE )
                    {
                        // We need to check if there is another enemy viewer of the tile for squadsight to be possible, but we are not done building the Viewer array yet, so save a list of indexes to be verified!
                        // By design, we only check revealed enemies here since checking all of them would be using more info than is available to the player from the UI and thus cheating
                        if (`GETMCMVAR(bEnableLogging)) { class'Helpers'.static.OutputMsg("Shooters:" @ EnemyUnit.GetFullName() @ "| ID" @EnemyUnit.GetReference().ObjectID @"| Reason: Squadsight Overwatch Pre-Viewers Check"); }
                        IndexesToCheckForSpotters.AddItem(Shooters.Length);
                        Shooters.AddItem(EnemyUnit);
                    }
                }
            }

        } //close clearLos Checks
    } //close foreach revealed enemies

    // Perform check of Shooters that will shoot because of squadsight!
    // Run backwards since we will be removing shooters with no spotter!
    for(i = IndexesToCheckForSpotters.Length - 1; i > -1; i--)
    {   
        SpotterFound = false;

        foreach Viewers(EnemySpotter)
        {
            if(EnemySpotter != Shooters[i])
            {
                SpotterFound = true;
                break; // No need to look further
            }
        }

        if(!SpotterFound)
        {
            // No spotter found, this is not a valid shooter
            if (`GETMCMVAR(bEnableLogging)) { class'Helpers'.static.OutputMsg("Shooters:" @ EnemyUnit.GetFullName() @ "| ID" @EnemyUnit.GetReference().ObjectID @"| Reason: Squadsight Overwatch Post-Viewers Check: !REMOVED!"); }
            Shooters.RemoveItem(Shooters[i]);
        }
    }

    if (`GETMCMVAR(bEnableLogging))
    {
        foreach Viewers(EnemySpotter)
        {
            class'Helpers'.static.OutputMsg("Viewers :" @ EnemySpotter.GetFullName() @"ID" @EnemySpotter.GetReference().ObjectID);
        }

        class'Helpers'.static.OutputMsg("Tile Summary" @ TilePositionXYZ @ "Shooters [" @ Shooters.Length @ "] Viewers [" @ Viewers.Length @ "]");
    }
}
