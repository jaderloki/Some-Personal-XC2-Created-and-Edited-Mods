////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    10/07/23    02:00
////////////////////////////////////////////////////////////////////////////////////////////////////

class XComGameState_IndicatorArrow_GA extends XComGameState_IndicatorArrow;

var UISpecialMissionHUD_Arrows_GA ArrowManager;
var EIndicatorValue CurrentIndicatorValue;
var EIconSetIdentifier IconSetIdentifier;

////////////////////////////////////////////////////////////////////////////////////////////////////
//	ADD ARROW POINTING TOWARDS UNITS
////////////////////////////////////////////////////////////////////////////////////////////////////

static function XComGameState_IndicatorArrow CreateArrowPointingAtUnit(XComGameState_Unit InUnit, 
                                                                       optional float InOffset = 128, 
                                                                       optional EUIState InColor = eUIState_Normal,
                                                                       optional int InCounterValue = -1,
                                                                       optional string InIcon = "")
{
    local XComGameState_IndicatorArrow_GA CreatedArrow;
    
    // Replace wrong HostileVIP icon with one from the iconpack loaded
    if (InUnit.GetMyTemplateName() == 'HostileVIPCivilian' && InUnit.GetMyTemplate().bIsHostileCivilian)
    {
        InIcon = UIUnitFlagManager_GA(`PRES.m_kUnitFlagManager).GetIconPack().GetIconSet(eKillVIP).DefaultIcon;
    }

    CreatedArrow = XComGameState_IndicatorArrow_GA(super.CreateArrowPointingAtUnit(InUnit, InOffset, InColor, InCounterValue, InIcon));
    CreatedArrow.IconSetIdentifier = UIUnitFlagManager_GA(`PRES.m_kUnitFlagManager).GetIconPack().IdentifyIconSet(CreatedArrow);
    
    return CreatedArrow;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	ADD ARROW POINTING TOWARDS LOCATIONS
////////////////////////////////////////////////////////////////////////////////////////////////////

static function XComGameState_IndicatorArrow CreateArrowPointingAtLocation(vector InLocation, 
                                                                           optional float InOffset = 128, 
                                                                           optional EUIState InColor = eUIState_Normal,
                                                                           optional int InCounterValue = -1,
                                                                           optional string InIcon = "")
{
    local XComGameState_IndicatorArrow_GA CreatedArrow;
    local UIUnitFlagManager_GA UIFlgMgr;
    local IconPack_GA CurrentPack;
    local int ZOffset;

    UIFlgMgr = UIUnitFlagManager_GA(`PRES.m_kUnitFlagManager);
    CurrentPack = UIFlgMgr.GetIconPack();

    // Replace some more icons with icons from the iconpack used
    // This might replace with the exact same icon if the iconset doesn't replace this icon ... but this doesn't matter
    switch (InIcon)
    {
        case "img:///UILibrary_Common.Objective_DestroyAlienFacility":  InIcon = CurrentPack.GetIconSet(eDestroyAlienFacility).DefaultIcon; break;
        case "img:///UILibrary_Common.Objective_UFO":                   InIcon = CurrentPack.GetIconSet(eHackUFO).DefaultIcon;              break;
        case "img:///UILibrary_Common.Objective_Broadcast":             InIcon = CurrentPack.GetIconSet(eHackBroadcast).DefaultIcon;        break;
        case "img:///UILibrary_Common.Objective_RecoverItem":           InIcon = CurrentPack.GetIconSet(eRecoverItem).DefaultIcon;          break;
        case "img:///UILibrary_Common.Objective_HackWorkstation":       InIcon = CurrentPack.GetIconSet(eHackWorkstation).DefaultIcon;
            
            // Fix for incorrect placement of objective arrow pointing at the elevator computer in Shen's Last Gift
            if(XComTacticalMissionManager(class'Engine'.static.GetEngine().GetTacticalMissionManager()).ActiveMission.MissionName == 'LastGift')
            {
                ZOffset = 2 * class'XComWorldData'.const.WORLD_FloorHeight;
                InLocation.Z -= ZOffset;
                InOffSet += ZOffset;
            }
            break;
        default:
            //say whut?
            break;
    }

	CreatedArrow = XComGameState_IndicatorArrow_GA(super.CreateArrowPointingAtLocation(InLocation, InOffset, InColor, InCounterValue, InIcon));
    CreatedArrow.IconSetIdentifier = CurrentPack.IdentifyIconSet(CreatedArrow);
    
    return CreatedArrow;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	SET NEW ICON FOR ARROW
////////////////////////////////////////////////////////////////////////////////////////////////////

public function SetIcon(IconPack_GA IconPack, EIndicatorValue IndicatorValue, optional bool ForceSet = False)
{
    local vector ArrowOffset;

    if(IndicatorValue != CurrentIndicatorValue || ForceSet)
    {
        if(IconSetIdentifier == eNoIconSet)
        {
            if(!ForceSet) 
            {
                //`log("Gotcha Again: Error! Attempted to change icon of unknown IndicatorArrow! Current: " $ Icon $ ", Parameters: " $ IconPack $ ", " $ IndicatorValue);
                return;
            }
        }

        CurrentIndicatorValue = IndicatorValue;
        ArrowOffset.Z = Offset;

        if (PointsToUnit())
        {
            GetArrowManager().AddArrowPointingAtActor(`XCOMHISTORY.GetVisualizer(Unit.ObjectID), ArrowOffset, ArrowColor, CounterValue, IconPack.GetIconFromIconSet(IconSetIdentifier, IndicatorValue));
        }
        else if(IconSetIdentifier == eHackAdventTower && IndicatorValue == eAlreadyHacked)
        {
            // We want the already-hacked icon to be permanent, so we save the icon-path to the object so it will persist across savegames
            Icon = IconPack.GetIconFromIconSet(IconSetIdentifier, IndicatorValue);
            GetArrowManager().AddArrowPointingAtLocation(Location, ArrowOffset, ArrowColor, CounterValue, Icon);
        }
        else
        {
            GetArrowManager().AddArrowPointingAtLocation(Location, ArrowOffset, ArrowColor, CounterValue, IconPack.GetIconFromIconSet(IconSetIdentifier, IndicatorValue));
        }
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	DATA GATHERING
////////////////////////////////////////////////////////////////////////////////////////////////////

public function bool IsTowerIndicatorArrowByObjectType(CacheUtility_GA CacheUtility, XComGameState_IndicatorArrow_GA Arrow)
{
    local XComGameState_InteractiveObject Tower;
    local XComInteractiveLevelActor TowerActor;

    if (IconSetIdentifier == eHackAdventTower)
    {
        return true;
    }

    Tower = CacheUtility.GetObjectForArrow(Arrow);
    if(Tower != none)
    {
        TowerActor = XComInteractiveLevelActor(`XCOMHISTORY.GetVisualizer(Tower.ObjectID));
        if(TowerActor != none && TowerActor.ActorType == Type_AdventTower)
        {
            return true;
        }
    }

    return false;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	GET ARROW MANAGER - FOR TACTICAL LOADS TO REFRESH AS OLD ONE WILL NOT BE VALID
////////////////////////////////////////////////////////////////////////////////////////////////////

private function UISpecialMissionHUD_Arrows_GA GetArrowManager()
{
    if(ArrowManager == none)
    {
        ArrowManager = UISpecialMissionHUD_Arrows_GA(`PRES.GetSpecialMissionHUD().GetChildByName('arrowContainer'));
    }
    
    return ArrowManager;
}
