//---------------------------------------------------------------------------------------
//  FILE:    UIStrategyMapItem_Continent_LSCuc
//  AUTHOR:  RealityMachina
//  PURPOSE: Show and staff XCOM personnel for continent resistances
//				and show heat level of continent
//--------------------------------------------------------------------------------------- 

class UIStrategyMapItem_RaiderBase extends UIStrategyMapItem;

event UpdateVisuals(bool bOnScreen)
{
	super.UpdateVisuals(bOnScreen);
	UpdateMaterials();
}

//---------------------------------------------------------------------------------------
function UpdateMaterials()
{
	local string DesiredMaterialPath, CurrentMaterialPath;
	local MaterialInstanceConstant NewMaterial, NewMIC;
	local Object MaterialObject;

	CurrentMaterialPath = PathName(MapItem3D.GetMeshMaterial(0));

	// TODO: should this dynamically update depending on heat status? Other materials for reference:
	// "UI_3D.Overwold_Final.MIC_Red";
	// "UI_3D.Overwold_Final.MIC_Blue"; - going need to change icon to use this
	// make a custom yellow MIC?
	DesiredMaterialPath = "UI_3D.Overwold_Final.MIC_Red";

	if(CurrentMaterialPath != DesiredMaterialPath)
	{
		CurrentMaterialPath = DesiredMaterialPath;

		MaterialObject = `CONTENT.RequestGameArchetype(DesiredMaterialPath);

		if(MaterialObject != none && MaterialObject.IsA('MaterialInstanceConstant'))
		{
			NewMaterial = MaterialInstanceConstant(MaterialObject);
			NewMIC = new class'MaterialInstanceConstant';
			NewMIC.SetParent(NewMaterial);
			MapItem3D.SetMeshMaterial(0, NewMIC);

		}
	}
}

function UpdateFlyoverText()
{
	local XComGameState_RaiderBase RaiderBase;

	RaiderBase = XComGameState_RaiderBase(`XCOMHistory.GetGameStateForObjectID(GeoscapeEntityRef.ObjectID));
	SetLabel(RaiderBase.GetDisplayName() $ " " $ MapPin_Header);
}

defaultproperties
{
	bDisableHitTestWhenZoomedOut = false;
	bFadeWhenZoomedOut = false;
	bProcessesMouseEvents = false;
	bAnimateOnInit = false;
}
