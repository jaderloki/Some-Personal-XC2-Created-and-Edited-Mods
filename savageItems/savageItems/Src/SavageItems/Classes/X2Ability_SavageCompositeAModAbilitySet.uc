class X2Ability_SavageCompositeAModAbilitySet extends XMBAbility
	dependson (XComGameStateContext_Ability) config(SavageStockItems);
// Note: All Composite stuff is cleaned out and repurposed as Daemon stuff, comp armor was a silly idea
static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
//This is the base item ability, it unlocks the two slots.
	Templates.AddItem(AddDaemonArmorOverlayBonus());
					
	return Templates;
}

//////////////////////////////////////////////////////////
//This is the base item ability, it unlocks the two slots.
//////////////////////////////////////////////////////////

static function X2AbilityTemplate AddDaemonArmorOverlayBonus()
{
	local X2AbilityTemplate                 Template;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'DaemonArmorOverlayBonus');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_nanofibervest";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, 1);
	Template.AddTargetEffect(PersistentStatChangeEffect);
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}