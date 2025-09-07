
class X2SitRepEffects_CovertOp extends X2SitRep_DefaultSitRepEffects;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(CreateCovertPhantomTemplate());
	
	return Templates;
}

static function X2SitRepEffectTemplate CreateCovertPhantomTemplate()
{
	local X2SitRepEffect_GrantAbilities Template;

	`CREATE_X2TEMPLATE(class'X2SitRepEffect_GrantAbilities', Template, 'RM_CovertPhantomEffect');

	Template.AbilityTemplateNames.AddItem('RM_CovertPhantom');
	Template.AbilityTemplateNames.AddItem('Hack_CovertObjectiveChest');
	Template.GrantToSoldiers = true;

	return Template;
}
