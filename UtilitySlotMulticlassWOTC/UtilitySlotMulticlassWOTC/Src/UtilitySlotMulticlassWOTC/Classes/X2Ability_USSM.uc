class X2Ability_USSM extends X2Ability config(UtilitySlotMulticlassWOTC);

var config array<name> AllowedClasses;
var config array<name> AllowedSubClasses;

struct MulticlassInfo {
	var name ClassName;
	var array<name> Perks;
	var bool DefaultPrimary;

	var int RandomRank;
	var array<name> RandomChoices;
};

var config array<MulticlassInfo> Multiclass;

var config array<name> GrenadeLauncherPerks;
var config array<name> PistolPerks;
var config array<name> SwordPerks;
var config array<name> GremlinPerks;

// for templar training
var config array<name> GauntletPerks;

var config array<name> BadForReroll;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(HackingBonus());
	Templates.AddItem(AimBonus());
	Templates.AddItem(PurePassive('GrenadePocket', "img:///UILibrary_XPACK_Common.PerkIcons.weak_Shellshocked", true));

	return Templates;
}

static function X2AbilityTemplate HackingBonus()
{
	local X2AbilityTemplate             Template;
	local X2Effect_PersistentStatChange PersistentEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HackingStatBonus');

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_comm_hack";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;

	Template.bCrossClassEligible = true;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentEffect = new class'X2Effect_PersistentStatChange';
	PersistentEffect.BuildPersistentEffect(1, true, false);
	PersistentEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, true, , Template.AbilitySourceName);
	PersistentEffect.AddPersistentStatChange(eStat_Hacking, 40);
	Template.AddTargetEffect(PersistentEffect);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.TechLabel, eStat_Hacking, 40);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate AimBonus()
{
	local X2AbilityTemplate             Template;
	local X2Effect_PersistentStatChange PersistentEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AimStatBonus');

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_combatstim_focus";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;

	Template.bCrossClassEligible = true;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentEffect = new class'X2Effect_PersistentStatChange';
	PersistentEffect.BuildPersistentEffect(1, true, false);
	PersistentEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, true, , Template.AbilitySourceName);
	PersistentEffect.AddPersistentStatChange(eStat_Offense, 5);
	Template.AddTargetEffect(PersistentEffect);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.AimLabel, eStat_Offense, 5);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function GetMulticlassClassTemplates(X2SoldierClassTemplateManager SoldierClassTemplateMan, XComGameState_Unit ForUnit, out array<X2SoldierClassTemplate> ClassTemplates)
{
	local MulticlassInfo MCInfo;
	local X2SoldierClassTemplate Template;
	local name UnitClassName;

	ClassTemplates.Length = 0;

	UnitClassName = ForUnit.GetSoldierClassTemplateName();

	foreach default.Multiclass(MCInfo) {
		if (MCInfo.ClassName != UnitClassName)
		{
			Template = SoldierClassTemplateMan.FindSoldierClassTemplate(MCInfo.ClassName);
			ClassTemplates.AddItem(Template);
		}
	}
}

static function bool GetPerksForMulticlassClass(name MulticlassClass, out array<name> ClassPerks)
{
	local int i;
	local int r;
	local MulticlassInfo MCInfo;
	local name CurrentPerk;
	
	ClassPerks.Length = 0;

	foreach default.Multiclass(MCInfo) {
		if (MulticlassClass == MCInfo.ClassName) {
			for (i=0; i < MCInfo.Perks.Length; i++) {
				if (MCInfo.RandomRank > 0 && MCInfo.RandomRank == i) {
					r = `SYNC_RAND_STATIC(MCInfo.RandomChoices.Length);
					CurrentPerk = MCInfo.RandomChoices[r];
				} else {
					CurrentPerk = MCInfo.Perks[i];
				}

				ClassPerks.AddItem(CurrentPerk);
			}
			return MCInfo.DefaultPrimary;
		}
	}
}

static function name DetermineMulticlassClassForUnit(XComGameState_Unit UnitState)
{
	local name firstAbilityName;
	local MulticlassInfo MCInfo;

	if (UnitState.AbilityTree[1].Abilities.Length < 4)
		return '';

	firstAbilityName = UnitState.AbilityTree[1].Abilities[3].AbilityName;

	foreach default.Multiclass(MCInfo) {
		if (firstAbilityName == MCInfo.Perks[0]) {
			return MCInfo.ClassName;
		}
	}

	return '';
}