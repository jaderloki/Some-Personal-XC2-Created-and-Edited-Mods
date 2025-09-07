class X2Item_SavageCompositeAModItems extends X2Item config(SavageStockItems);

var config int SUPPLY_COST_DAEMONAMOD;//NOT HOOKED UP YET

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Items;
	//Base Item
	Items.AddItem(CreateDaemonArmorMod());
				
	return Items;
}
	//Base Item - DEACTIVATED FOR NOW
static function X2DataTemplate CreateDaemonArmorMod()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'DaemonArmorMod');
	Template.ItemCat = 'bplating';
	Template.InventorySlot = eInvSlot_ArmorMod;
	Template.strImage = "img:///UILibrary_SavageItems.Inv_Ceramic_Overlay";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Tier = 1;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.Abilities.AddItem('DaemonArmorOverlayBonus');
	Template.Abilities.AddItem('AModBonusSlotBlocker');

	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SUPPLY_COST_DAEMONAMOD;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}