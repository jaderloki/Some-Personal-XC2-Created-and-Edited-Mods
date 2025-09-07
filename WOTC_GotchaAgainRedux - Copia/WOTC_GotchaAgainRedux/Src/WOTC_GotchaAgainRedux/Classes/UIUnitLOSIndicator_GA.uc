////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    10/07/23    02:00
////////////////////////////////////////////////////////////////////////////////////////////////////

class UIUnitLOSIndicator_GA extends UIIcon;

var UIUnitFlag ParentUnitFlag;
var EIndicatorValue CurrentIndicatorValue;

var int LONEWOLF_MIN_DIST_TILES, LONEWOLF_MAX_DIST_TILES;

////////////////////////////////////////////////////////////////////////////////////////////////////
//	ON INIT
////////////////////////////////////////////////////////////////////////////////////////////////////

public function UIUnitLOSIndicator_GA InitIndicator(UIUnitFlag ParentUnitFlagInstance)
{
    ParentUnitFlag = ParentUnitFlagInstance;
    InitIcon(, , false, false, 32);
    SetDisabled(true);
    SetX(-12);
    SetY(-60);
    CurrentIndicatorValue = eNotVisible;

    LONEWOLF_MIN_DIST_TILES = class'UnitIndicatorUtility_GA'.default.LONEWOLF_MIN_DIST_TILES;
    LONEWOLF_MAX_DIST_TILES = class'UnitIndicatorUtility_GA'.default.LONEWOLF_MAX_DIST_TILES;

    return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	SET ICON TYPE ON UNIT FLAG - REPLACING 'GOTCHA' VISIBLE ICON WITH CUSTOM
////////////////////////////////////////////////////////////////////////////////////////////////////

public function SetIcon(IconPack_GA IconPack, EIndicatorValue IndicatorValue)
{
    local int iconlocalX, iconlocalY;

    //default position
    iconlocalX = -12;   iconlocalY = -60;

    //shift for bleeding out, or concealment
    if(XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(ParentUnitFlag.StoredObjectId)).IsBleedingOut())
    {
        iconlocalX = -20;   iconlocalY = -19;
    }
    else if(ParentUnitFlag.m_bConcealed) { iconlocalY = -25; }

    //set new icon position
    SetX(iconlocalX); SetY(iconlocalY);

    //load correct icon
    if(IndicatorValue != CurrentIndicatorValue)
    {
        LoadIcon(IconPack.GetIconFromIconSet(eUnitIconSet, IndicatorValue));
        CurrentIndicatorValue = IndicatorValue;
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	SET ICON ALPHA ON UNIT FLAG - ADJUSTING ALPHA BASED ON LONEWOLF TILE DISTANCE
////////////////////////////////////////////////////////////////////////////////////////////////////

simulated function SetWolfAlpha(int LoneWolfDistance)
{
    local float NewAlpha;

    //check min-max distances
    if (LoneWolfDistance >= LONEWOLF_MAX_DIST_TILES)        { NewAlpha = 100; }
    else if (LoneWolfDistance >= LONEWOLF_MIN_DIST_TILES)   { NewAlpha = 66 ; }
    else
    {
        //LOWER THAN MIN RANGE
        NewAlpha = 33;
    }

    SetAlpha(NewAlpha);
}
