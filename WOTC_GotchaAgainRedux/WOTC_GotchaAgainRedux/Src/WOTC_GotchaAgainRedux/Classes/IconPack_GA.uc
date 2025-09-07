////////////////////////////////////////////////////////////////////////////////////////////////////
//	GOTCHA AGAIN REDUX BY RUSTYDIOS AND OTHERS
//  CREATED SOMETIME BEFORE 04/09/17
//  LAST UPDATED    16/10/23    01:45
////////////////////////////////////////////////////////////////////////////////////////////////////

class IconPack_GA extends Object;

`include(WOTC_GotchaAgainRedux\Src\ModConfigMenuAPI\MCM_API_CfgHelpers.uci)

// Order here is important since it defines the initial value for UIUnitLOSIndicator_GA icons
enum EIndicatorValue
{
    eNotVisible,
    eSpotted,
    eSquadsight,
    eFlanked,
    eSquadsightFlanked,
    eSpottedByEnemy,
    eHackable,
    eAlreadyHacked,
    eSpottedFriendly,
    eLoneWolfActive,
    eSquadsightGremlin
};

enum EIconSetIdentifier
{
    eNoIconSet,
    eDestroyAlienFacility,
    eKillVIP,
    eRecoverItem,
    eHackWorkstation,
    eHackUFO,
    eHackBroadcast,
    eHackAdventTower,
    eUnitIconSet
};

struct ArrowIndicatorIconSet
{
    var EIconSetIdentifier Identifier;
    var string DefaultIcon,
               SpottedIcon,
               FlankedIcon,
               SquadsightIcon,
               SquadsightFlankedIcon,
               HackableIcon,
               AlreadyHackedIcon;
};

struct UnitIndicatorIconSet
{
    var EIconSetIdentifier Identifier;
    var string SpottedIcon,
               FlankedIcon,
               SquadsightIcon,
               SquadsightFlankedIcon,
               HackableIcon,
               SquadsightHackableIcon,
               SquadsightGremlinIcon,
               SpottedFriendlyIcon,
               SpottedByEnemyIcon,
               LoneWolfActiveIcon;
};

var private array<ArrowIndicatorIconSet> IconSets;
var ArrowIndicatorIconSet IconSetDestroyAlienFacility, IconSetKillVIP, IconSetRecoverItem, IconSetHackWorkstation, IconSetHackUFO, IconSetHackBroadcast, IconSetHackAdventTower;

var UnitIndicatorIconSet IconSetUnits;

////////////////////////////////////////////////////////////////////////////////////////////////////
//	ON INIT
////////////////////////////////////////////////////////////////////////////////////////////////////

public function Init()
{
    IconSets.AddItem(IconSetDestroyAlienFacility);
    IconSets.AddItem(IconSetKillVIP);
    IconSets.AddItem(IconSetRecoverItem);
    IconSets.AddItem(IconSetHackWorkstation);
    IconSets.AddItem(IconSetHackUFO);
    IconSets.AddItem(IconSetHackBroadcast);
    IconSets.AddItem(IconSetHackAdventTower);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	IDENITIFY CURRENT ICON SET
////////////////////////////////////////////////////////////////////////////////////////////////////

public function EIconSetIdentifier IdentifyIconSet(XcomGameState_IndicatorArrow Arrow)
{
    local string IconName;
    local int i;

    // This relies on the icon-paths only containing a single "."
    // It is only used for identifying arrow icons which follow this rule
    IconName = Split(Arrow.Icon, ".", true);

    for(i = 0; i < IconSets.Length; i++)
    {
        if(     InStr(IconSets[i].DefaultIcon,              IconName) != INDEX_NONE
           ||   InStr(IconSets[i].SpottedIcon,              IconName) != INDEX_NONE
           ||   InStr(IconSets[i].SquadsightIcon,           IconName) != INDEX_NONE
           ||   InStr(IconSets[i].FlankedIcon,              IconName) != INDEX_NONE
           ||   InStr(IconSets[i].SquadsightFlankedIcon,    IconName) != INDEX_NONE
           ||   InStr(IconSets[i].HackableIcon,             IconName) != INDEX_NONE
           ||   InStr(IconSets[i].AlreadyHackedIcon,        IconName) != INDEX_NONE
           )
        {  
            return IconSets[i].Identifier;
        }
    }

    return eNoIconSet;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	GET ICON SET METHODS
////////////////////////////////////////////////////////////////////////////////////////////////////

public function string GetIconFromIconSet(EIconSetIdentifier IconSetIdentifier, EIndicatorValue IndicatorValue)
{
    if(IconSetIdentifier == eUnitIconSet) return GetIconFromUnitIconSet(IndicatorValue);

    switch(IndicatorValue)
    {
        case eNotVisible:           return GetIconSet(IconSetIdentifier).DefaultIcon;
        case eSpotted:              return GetIconSet(IconSetIdentifier).SpottedIcon;
        case eSquadsight:           return GetIconSet(IconSetIdentifier).SquadsightIcon;
        case eFlanked:              return GetIconSet(IconSetIdentifier).FlankedIcon;
        case eSquadsightFlanked:    return GetIconSet(IconSetIdentifier).SquadsightFlankedIcon;
        case eHackable:             return GetIconSet(IconSetIdentifier).HackableIcon;
        case eAlreadyHacked:        return GetIconSet(IconSetIdentifier).AlreadyHackedIcon;

        default:
            `log("Gotcha Again: Error! Requested icon for unsupported EIndicatorValue");
			break;
    }
}

private function string GetIconFromUnitIconSet(EIndicatorValue IndicatorValue)
{
    switch(IndicatorValue)
    {
        case eNotVisible:           return "";
        case eSpotted:              return IconSetUnits.SpottedIcon;
        case eSquadsight:           return IconSetUnits.SquadsightIcon;
        case eFlanked:              return IconSetUnits.FlankedIcon;
        case eSquadsightFlanked:    return IconSetUnits.SquadsightFlankedIcon;
        case eSquadsightGremlin:    return IconSetUnits.SquadsightGremlinIcon;
        case eHackable:             return IconSetUnits.HackableIcon;
        case eSpottedFriendly:      return IconSetUnits.SpottedFriendlyIcon;
        case eSpottedByEnemy:       return IconSetUnits.SpottedByEnemyIcon;
        case eLoneWolfActive:       return IconSetUnits.LoneWolfActiveIcon;

        default:
            `log("Gotcha Again: Error! Requested icon in UnitIconSet for unsupported EIndicatorValue");
			break;
    }
}

public function ArrowIndicatorIconSet GetIconSet(EIconSetIdentifier IconSet)
{
    switch (IconSet)
    {
        case eDestroyAlienFacility:  return IconSetDestroyAlienFacility;
        case eKillVIP:               return IconSetKillVIP;
        case eRecoverItem:           return IconSetRecoverItem;
        case eHackWorkstation:       return IconSetHackWorkstation;
        case eHackUFO:               return IconSetHackUFO;
        case eHackBroadcast:         return IconSetHackBroadcast;
        case eHackAdventTower:       return IconSetHackAdventTower;

        default:
            `log("Gotcha Again: Error! Requested iconset for unsupported EIconSetIdentifier");
			break;
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	LOAD NEW ICON SET - DEFAULT SET IS NOW SET AND ALWAYS INDENTICAL TO VHS2
////////////////////////////////////////////////////////////////////////////////////////////////////

public static function IconPack_GA LoadIconPack()
{
    local IconPack_GA IconPack;

    IconPack = new class'IconPack_GA_vhs2';
    
    IconPack.Init();
    return IconPack;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//	DEFAULT PROPERTIES OF THIS ICON PACK - DEFAULT SET IS NOW SET AND ALWAYS INDENTICAL TO VHS2
////////////////////////////////////////////////////////////////////////////////////////////////////

defaultproperties
{
}
