////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    11/07/23    06:30
////////////////////////////////////////////////////////////////////////////////////////////////////

class PathIndicator_GA extends Actor;

// Order matters and corresponds to their position in the texturearrays.
// Custom texturearrays cannot be used without noseekfreeloading, so we don't use them and order actually doesn't matter anymore
// Standard indicators are defined in DefaultGameCore.ini / XComGameCore.ini
// PathIndicatorUtility_GA handles assignment of non-standard indicators (activation, overwatch, PSI bomb, curse, acid cones, frost). // WOTC - Hunter's Mark Tracking Shot

enum EIndicatorType
{
    eNone,
    eMoveThroughAcid,
    eMoveThroughPoison,
    eMoveThroughFire,
    eMoveThroughSmoke,
    eMakeNoise,
    eTriggerActivation,
    eHunterShot,
    eBreakConceal,
    eTriggerOverwatch,
    ePsiBomb,
    eMoveThroughCurse,
    eMoveThroughFrost,
    eNotSet1,
    eNotSet2,
};

enum EWaypointUpdateMode
{
    eNoUpdate,
    eCreate,
    eRemove,
};

struct HazardEffectPostType
{
    var name EffectName;
    var name AbilityName;
    var name DamageType;
    var EIndicatorType HazardMarkerType;
};

var private StaticMeshComponent IndicatorMesh;
var private MaterialInstanceConstant MIC;

var private vector Position;

////////////////////////////////////////////////////////////////////////////////////////////////////
//	ON INIT
////////////////////////////////////////////////////////////////////////////////////////////////////

public function Init(TTile Tile, array<EIndicatorType> IndicatorTypes, EWaypointUpdateMode WaypointMode)
{
    local XComWorldData World;
    local int i;

    World = `XWORLD;
    IndicatorMesh.SetStaticMesh(StaticMesh(XComContentManager(class'Engine'.static.GetEngine().GetContentManager()).RequestGameArchetype("UILibrary_GA.PathIndicators.WaypointStatus")));
    
    Position = World.GetPositionFromTileCoordinates(Tile);
    Position.Z = World.GetFloorZForPosition(Position) + XComTacticalController(class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController()).m_kPathingPawn.PathHeightOffset;

    IndicatorMesh.SetTranslation(Position);
    
    MIC = GetMIC(IndicatorMesh, 1);
    
    for(i = 0; i < IndicatorTypes.Length; i++)
    {
        switch(i)
        {
            case 0: MIC.SetScalarParameterValue('FirstStatusIndex',     IndicatorTypes[i]);     break;
            case 1: MIC.SetScalarParameterValue('SecondStatusIndex',    IndicatorTypes[i]);     break;
            case 2: MIC.SetScalarParameterValue('ThirdStatusIndex',     IndicatorTypes[i]);     break;
        }
    }

    UpdateWaypointMode(WaypointMode);

    IndicatorMesh.SetHidden(false);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	UPDATE
////////////////////////////////////////////////////////////////////////////////////////////////////

public function UpdateWaypointMode(EWaypointUpdateMode WaypointMode)
{
    MIC.SetScalarParameterValue('WaypointStatusIndex', WaypointMode);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	GET MATERIAL INSTANT
////////////////////////////////////////////////////////////////////////////////////////////////////

private function MaterialInstanceConstant GetMIC(StaticMeshComponent Mesh, optional int MICIndex = 0)
{
    local MaterialInstanceConstant currentMIC, newMIC;

    // Creates a new MIC to avoid changing all indicators
    currentMIC = MaterialInstanceConstant(Mesh.GetMaterial(MICIndex));
	newMIC = new (self) class'MaterialInstanceConstant';
	newMIC.SetParent(currentMIC);
	Mesh.SetMaterial(MICIndex, newMIC);

    return newMIC;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	DEFAULT PROPERTIES
////////////////////////////////////////////////////////////////////////////////////////////////////

defaultproperties
{
    Begin Object Class=StaticMeshComponent Name=IndicatorMeshComponentObject_01
        bOwnerNoSee=false
		CastShadow=false
		BlockNonZeroExtent=false
		BlockZeroExtent=false
        BlockActors=false
		CollideActors=false
		TranslucencySortPriority=10000
		bTranslucentIgnoreFOW=true
		AbsoluteTranslation=true
		AbsoluteRotation=true
		Scale=1.0
	End Object
	IndicatorMesh=IndicatorMeshComponentObject_01
    Components.Add(IndicatorMeshComponentObject_01)
}
