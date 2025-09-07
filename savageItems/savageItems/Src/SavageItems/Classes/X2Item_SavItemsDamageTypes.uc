class X2Item_SavItemsDamageTypes extends X2Item_DefaultDamageTypes config(GameData_SavitemsWeaponData);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> DamageTypes;

	DamageTypes.AddItem(CreateNanoShredDamageType());
	
	return DamageTypes;
}

static function X2DamageTypeTemplate CreateNanoShredDamageType()
{
	local X2DamageTypeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2DamageTypeTemplate', Template, 'NanoShred');

	Template.bCauseFracture = true;
	Template.MaxFireCount = 0;
	Template.bAllowAnimatedDeath = true;

	return Template;
}