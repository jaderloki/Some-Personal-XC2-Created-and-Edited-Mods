class X2TemplateHelper_SavageItems extends Object config(SavageStockItems);

//STOLEN (and modified a bit) FROM RPGO! THANKS TO MUSASHI!
static function PatchSAVGremlins()
{
	local X2ItemTemplateManager ItemTemplateManager;
	local array<name> TemplateNames;
	local array<X2DataTemplate> DifficultyVariants;
	local name TemplateName;
	local X2DataTemplate ItemTemplate;
	local X2WeaponTemplate WeaponTemplate;
	local X2GremlinTemplate GremlinTemplate;

	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	ItemTemplateManager.GetTemplateNames(TemplateNames);

	foreach TemplateNames(TemplateName)
	{
		ItemTemplateManager.FindDataTemplateAllDifficulties(TemplateName, DifficultyVariants);
		// Iterate over all variants
		
		foreach DifficultyVariants(ItemTemplate)
		{
			WeaponTemplate = X2WeaponTemplate(ItemTemplate);
			if (WeaponTemplate != none)
			{

				if (InStr(WeaponTemplate.DataName, "CV") != INDEX_NONE || InStr(WeaponTemplate.DataName, "T1") != INDEX_NONE)
				{
					//WeaponTemplate.BaseDamage
				}

				switch (WeaponTemplate.WeaponCat)
				{
					case 'Gremlin':
						GremlinTemplate = X2GremlinTemplate(WeaponTemplate);
						AddAbilityToGremlinTemplate(GremlinTemplate, 'SAVGremlinHeal', false);
						AddAbilityToGremlinTemplate(GremlinTemplate, 'SAVGremlinStabilize', false);
						AddAbilityToGremlinTemplate(GremlinTemplate, 'SavRegenSprayGremlin', false);
						AddAbilityToGremlinTemplate(GremlinTemplate, 'SavRegen2SprayGremlin', false);
						AddAbilityToGremlinTemplate(GremlinTemplate, 'SavNaniteRegenGremlin', false);
						AddAbilityToGremlinTemplate(GremlinTemplate, 'SavStimulatorGremlin', false);
						AddAbilityToGremlinTemplate(GremlinTemplate, 'SAVGremlinAdministerStims', false);
						AddAbilityToGremlinTemplate(GremlinTemplate, 'SAVGremlinAdministerStims2', false);
						AddAbilityToGremlinTemplate(GremlinTemplate, 'SAVRepairKitGremlin', false);
						AddAbilityToGremlinTemplate(GremlinTemplate, 'SAVRepairKit2Gremlin', false);
						AddAbilityToGremlinTemplate(GremlinTemplate, 'PlatingKitGremlin', false);
						break;
				}
			}
		}
	}
}

static function PatchSAVAnimations()
{
	local X2ItemTemplateManager ItemTemplateManager;
	local array<name> TemplateNames;
	local array<X2DataTemplate> DifficultyVariants;
	local name TemplateName;
	local X2DataTemplate ItemTemplate;
	local X2WeaponTemplate WeaponTemplate;
	local X2GremlinTemplate GremlinTemplate;

	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	ItemTemplateManager.GetTemplateNames(TemplateNames);

	foreach TemplateNames(TemplateName)
	{
		ItemTemplateManager.FindDataTemplateAllDifficulties(TemplateName, DifficultyVariants);
		// Iterate over all variants
		
		foreach DifficultyVariants(ItemTemplate)
		{
			WeaponTemplate = X2WeaponTemplate(ItemTemplate);
			if (WeaponTemplate != none)
			{

				if (InStr(WeaponTemplate.DataName, "CV") != INDEX_NONE || InStr(WeaponTemplate.DataName, "T1") != INDEX_NONE)
				{
					//WeaponTemplate.BaseDamage
				}

				switch (WeaponTemplate.WeaponCat)
				{
					case 'Gremlin':
						GremlinTemplate = X2GremlinTemplate(WeaponTemplate);
						AddGremlinAnimSetsToCharacterTemplate(GremlinTemplate.CosmeticUnitTemplate);
					case 'sparkbit':
						GremlinTemplate = X2GremlinTemplate(WeaponTemplate);
						AddBITAnimSetsToCharacterTemplate(GremlinTemplate.CosmeticUnitTemplate);
					return;
				}
			}
		}
	}
}

static private function AddGREMLINAnimSetsToCharacterTemplate(string TemplateName)
{
    local X2CharacterTemplateManager    CharMgr;
    local X2CharacterTemplate           CharTemplate;
	local array<X2DataTemplate>			DifficultyVariants;
	local X2DataTemplate				DifficultyVariant;
	local XComContentManager			Content;
	
    CharMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
	Content = `CONTENT;

	CharMgr.FindDataTemplateAllDifficulties(name(TemplateName), DifficultyVariants);
	foreach DifficultyVariants(DifficultyVariant)
	{
		CharTemplate = X2CharacterTemplate(DifficultyVariant);

		if (CharTemplate != none)
		{
			CharTemplate.AdditionalAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("SAV_GremlinAnimation.AS_Gremlin")));	
		}
	}
}

static private function AddBITAnimSetsToCharacterTemplate(string TemplateName)
{
    local X2CharacterTemplateManager    CharMgr;
    local X2CharacterTemplate           CharTemplate;
	local array<X2DataTemplate>			DifficultyVariants;
	local X2DataTemplate				DifficultyVariant;
	local XComContentManager			Content;
	
    CharMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
	Content = `CONTENT;

	CharMgr.FindDataTemplateAllDifficulties(name(TemplateName), DifficultyVariants);
	foreach DifficultyVariants(DifficultyVariant)
	{
		CharTemplate = X2CharacterTemplate(DifficultyVariant);

		if (CharTemplate != none)
		{
			CharTemplate.AdditionalAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("SAV_AltHWeps.AS_SAVBit")));	
		}
	}
}

/*
static function UpdateAnimations(out array<AnimSet> CustomAnimSets, XComGameState_Unit UnitState, XComUnitPawn Pawn, optional XComGameState CheckGameState)
{
	local X2WeaponTemplate			SecondaryWeaponTemplate, InventoryWeaponTemplate;
	local AnimSet AnimSetIter;

	SecondaryWeaponTemplate = X2WeaponTemplate(UnitState.GetSecondaryWeapon().GetMyTemplate());
	InventoryWeaponTemplate = X2WeaponTemplate(UnitState.GetItemInSlot(eInvSlot_Utility, CheckGameState).GetMyTemplate());

	if (SecondaryWeaponTemplate.WeaponCat == 'Gremlin')
	{
		AddAnimSet(Pawn, AnimSet(`CONTENT.RequestGameArchetype("SAV_GremlinAnimation.AS_Gremlin")));
		Pawn.Mesh.UpdateAnimations();
	}

	if (InventoryWeaponTemplate.WeaponCat == 'Gremlin')
	{
		AddAnimSet(Pawn, AnimSet(`CONTENT.RequestGameArchetype("SAV_GremlinAnimation.AS_Gremlin")));
		Pawn.Mesh.UpdateAnimations();
	}
	
	foreach Pawn.Mesh.AnimSets(AnimSetIter)
	{

	}

}

static function AddAnimSet(XComUnitPawn Pawn, AnimSet AnimSetToAdd)
{
	if (Pawn.Mesh.AnimSets.Find(AnimSetToAdd) == INDEX_NONE)
	{
		Pawn.Mesh.AnimSets.AddItem(AnimSetToAdd);
		//`LOG(GetFuncName() @ "adding" @ AnimSetToAdd,, 'SAVITEMS');
	}
}
*/

static function AddAbilityToGremlinTemplate(out X2GremlinTemplate Template, name Ability, bool bShowInTactical = false)
{
	if (Template.Abilities.Find(Ability) == INDEX_NONE)
	{
		//`LOG(GetFuncName() @ Template.DataName @ Ability,, 'SAVAGEITEMS');
		Template.Abilities.AddItem(Ability);
		if (bShowInTactical)
			ShowInTacticalText(Ability);
	}
}

static function ShowInTacticalText(name Ability)
{
	local X2AbilityTemplateManager		TemplateManager;
	local X2AbilityTemplate				AbilityTemplate;

	TemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
	AbilityTemplate = TemplateManager.FindAbilityTemplate(Ability);
	AbilityTemplate.bDisplayInUITacticalText = true;
}