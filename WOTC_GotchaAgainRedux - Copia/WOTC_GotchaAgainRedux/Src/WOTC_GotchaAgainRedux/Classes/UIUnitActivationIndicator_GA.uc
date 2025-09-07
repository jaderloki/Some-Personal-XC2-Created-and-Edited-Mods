////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    16/07/23    19:30
////////////////////////////////////////////////////////////////////////////////////////////////////

class UIUnitActivationIndicator_GA extends UIIcon;

enum EActivationIcon
{
    eNone,
    eOverwatchTriggered,
    ePodActivated,
    eSuppressionTriggered
};

const OverwatchTriggeredIconPath = "img:///UILibrary_GA.UnitIndicators.T2D_TriggeredOverwatchIcon"; //this gets the base game overwatch eye behind it
const ActivationTriggeredIconPath = "img:///UILibrary_GA.UnitIndicators.T2D_TriggeredActivationIcon";
const SuppressionTriggeredIconPath = "img:///UILibrary_GA.UnitIndicators.T2D_TriggeredSuppressionIcon";

var private EActivationIcon CurrentIcon;

////////////////////////////////////////////////////////////////////////////////////////////////////
//	ON INIT
////////////////////////////////////////////////////////////////////////////////////////////////////

public function UIUnitActivationIndicator_GA InitIndicator()
{
    InitIcon(, , false, false, 32);
    SetDisabled(true);

    // This places it exactly on top of the current overwatch icon
    SetX(20);
    SetY(-28);

    return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	SET ICON TYPE ON UNIT FLAG - REPLACING 'MOVES' SECTION FOR ENEMIES
////////////////////////////////////////////////////////////////////////////////////////////////////

public function SetIcon(EActivationIcon ActivationType)
{
    if(CurrentIcon == ActivationType) return;
    
    CurrentIcon = ActivationType;

    switch(CurrentIcon)
    {
        case ePodActivated:         LoadIcon(ActivationTriggeredIconPath);  break;
        case eOverwatchTriggered:   LoadIcon(OverwatchTriggeredIconPath);   break;
        case eSuppressionTriggered: LoadIcon(SuppressionTriggeredIconPath); break;
        
        case eNone:
        default:
            //say whut?
            LoadIcon("");
            break;
    }
}
