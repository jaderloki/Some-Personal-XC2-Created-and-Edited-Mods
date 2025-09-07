class X2Ability_SAVDefaultAbilitySetExtended extends X2Ability_DefaultAbilitySet config(GameCore);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(AddSavRedHazeAbility());

	return Templates;
}

static function X2AbilityTemplate AddSavRedHazeAbility()
{
	local X2AbilityTemplate                 Template;

	Template = AddPanicAbility('SavRedHazeAbility', class'X2StatusEffects_SAVItems'.static.CreateSAVRedMistBerserkStatusEffect());

	return Template;
}