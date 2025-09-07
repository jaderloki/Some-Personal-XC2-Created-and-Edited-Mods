class XComGameState_RaiderBase extends XComGameState_GeoscapeEntity;

// purpose: store information about how far along the player is in destroying the base
// update status when covert action rewards are complete, and when a mission finishes
// store the location of where the "home continent" of the given raider faction is
// the good news is that a scanning site class already does half of this!

var protected RaiderBaseStatus BaseStatus; // current status of this raider base

var protected RaiderBaseDef BaseDef;

var bool bWaitingForCovertAction; // update this for covert actions when they're spawned

var int ModAppearanceChance; // for other mods to use, if they wish to alter appearance chances outside of configs

static function XComGameState_RaiderBase CreateBase(XComGameState NewGameState, XComGameState_Continent ContinentInflow, XComGameState_WorldRegion RegionState, RaiderBaseDef def)
{
	local XComGameState_RaiderBase BaseState;


	BaseState = XComGameState_RaiderBase(NewGameState.CreateNewStateObject(class'XComGameState_RaiderBase'));
	BaseState.BaseDef = def;
	BaseState.Continent = ContinentInflow.GetReference();
	BaseState.Region = RegionState.GetReference();
	BaseState.bNeedsLocationUpdate = true;
	BaseState.bWaitingForCovertAction = false;

	if(ContinentInflow.GetResistanceLevel() <= 0)
		BaseState.BaseStatus = eRB_Undiscovered;
	else
		BaseState.BaseStatus = eRB_Discovered;

	return BaseState;
}


function UpdateStatus(RaiderBaseStatus newStatus)
{
	BaseStatus = newStatus;
}

function RaiderBaseStatus GetStatus()
{
	return BaseStatus;
}

function name GetSitrep()
{
	return BaseDef.SitrepName;
}

function float GetChance()
{
	return Basedef.AppearanceChance;
}

function RaiderBaseDef GetDef()
{
	local RaiderBaseDef currentDef;

	foreach class'X2Helpers_RM_Raiderbases'.default.BaseDefinitions(currentDef)
	{
		if(currentDef.SitrepName == BaseDef.SitrepName) //same base def, use this one to ensure the latest version is always used
		{
			return currentDef;
		}
	}
	return BaseDef;
}

function int GetAppearanceChance()
{
	local RaiderBaseDef currentDef;

	return currentDef.AppearanceChance + ModAppearanceChance;
}

function string GetDisplayName()
{
	return BaseDef.DisplayName;
}
//#############################################################################################
//----------------   GEOSCAPE ENTITY IMPLEMENTATION   -----------------------------------------
//#############################################################################################

protected function bool DisplaySelectionPrompt()
{
	return false;
}
//---------------------------------------------------------------------------------------
function string GetUIWidgetFlashLibraryName()
{
	return "MI_outpost";
}

//---------------------------------------------------------------------------------------
protected function bool CanInteract()
{
	return false; 
}

//---------------------------------------------------------------------------------------
function bool RequiresAvenger()
{
	return false;
}
//---------------------------------------------------------------------------------------
function class<UIStrategyMapItem> GetUIClass()
{
	return class'UIStrategyMapItem_RaiderBase';
}
// The static mesh for this entities 3D UI
function StaticMesh GetStaticMesh()
{
	local string OverworldMeshPath;
	local Object MeshObject;


	OverworldMeshPath = "UI_3D.Overwold_Final.CovertAction";
	

	if (OverworldMeshPath != "")
	{
		MeshObject = `CONTENT.RequestGameArchetype(OverworldMeshPath);

		if (MeshObject != none && MeshObject.IsA('StaticMesh'))
		{
			return StaticMesh(MeshObject);
		}
	}

	return none;
}

//---------------------------------------------------------------------------------------
function string GetUIPinImagePath()
{
	return "";
}
// ----------------------------------------------------------------------------------
function bool ShouldBeVisible()
{
	local XComGameState_Continent RegionState;

	if(Continent.ObjectID <= 0)
	{
		return false;
	}
	RegionState = XComGameState_Continent(`XCOMHISTORY.GetGameStateForObjectID(Continent.ObjectID));

	if(RegionState.GetResistanceLevel() <= 0) // don't show anything if they can't do anything there
	{
		return false;
	}
	else if (!IsActive()) // don't show if not applicable
	{
		return false;
	}

	return true;

}


function bool IsActive()
{

	return (GetStatus() != eRB_Undiscovered && GetStatus() != eRB_Destroyed);
}