class X2StrategyElement_ArmorModSlot extends CHItemSlotSet config(SavageItemsSlots);

var localized string strAModFirstLetter;

var config bool bLog;
var config array<name> AllowedItemCategories;
var config bool bAllowEmpty;
var config array<name> AbilityUnlocksAModSlot;
var config bool AllowRobotAModSlot;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	Templates.AddItem(CreateAModSlotTemplate('ArmorModSlot', eInvSlot_ArmorMod));

	return Templates;
}

static function X2DataTemplate CreateAModSlotTemplate(name TemplateName, EInventorySlot InventorySlot)
{
	local CHItemSlot Template;

	`CREATE_X2TEMPLATE(class'CHItemSlot', Template, TemplateName);

	Template.InvSlot = InventorySlot;
	Template.SlotCatMask = Template.SLOT_ARMOR | Template.SLOT_ITEM;
	// Unused for now
//	Template.IsUserEquipSlot = true;
	// Uses unique rule
//	Template.IsEquippedSlot = true;
	// Does not bypass unique rule
//	Template.BypassesUniqueRule = false;
//	Template.IsMultiItemSlot = true;
//	Template.IsSmallSlot = true;

	Template.IsUserEquipSlot = true;
	// Uses unique rule
	Template.IsEquippedSlot = false;
	// Does not bypass unique rule
	Template.BypassesUniqueRule = false;
	Template.IsMultiItemSlot = false;
	Template.MinimumEquipped = -1;
	Template.IsSmallSlot = false;
	Template.NeedsPresEquip = true;
	
	Template.CanAddItemToSlotFn = CanAddItemToAmodSlot;
	Template.UnitHasSlotFn = HasAmodSlot;
	Template.GetPriorityFn = AmodGetPriority;
	Template.ShowItemInLockerListFn = ShowAmodItemInLockerList;
	Template.ValidateLoadoutFn = ValidateLoadout;
	Template.GetSlotUnequipBehaviorFn = AmodGetUnequipBehavior;

	return Template;
}

static function bool CanAddItemToAmodSlot(CHItemSlot Slot, XComGameState_Unit Unit, X2ItemTemplate Template, optional XComGameState CheckGameState, optional int Quantity = 1, optional XComGameState_Item ItemState)
{
	local string strDummy;
	`log(GetFuncName() @ "called");
	if (!Slot.UnitHasSlot(Unit, strDummy, CheckGameState) || Unit.GetItemInSlot(Slot.InvSlot, CheckGameState) != none)
	{
		return false;
	}
	return Template.ItemCat == 'bplating';
}

static function bool HasAmodSlot(CHItemSlot Slot, XComGameState_Unit UnitState, out string LockedReason, optional XComGameState CheckGameState)
{
	local name Ability;
	local X2EquipmentTemplate EquipmentTemplate;
	local array<XComGameState_Item> CurrentInventory;
	local XComGameState_Item InventoryItem;
	local bool DefaultCanHaveSlot;//this bit is added

	`log(GetFuncName() @ "called");


	if (default.AbilityUnlocksAModSlot.Length == 0)
	{
		if (UnitState.IsRobotic() && !default.AllowRobotAModSlot)
		{
		 return false;
		}
		else return UnitState.IsSoldier();
		DefaultCanHaveSlot = UnitState.IsSoldier();//this bit is added and im going with no amods on robots sice it can cause wierdness I can't be bothered to iron out right now.
	}

	foreach default.AbilityUnlocksAModSlot(Ability)
	{
		if (UnitState.HasSoldierAbility(Ability, true))
		{
			`LOG(GetFuncName() @ "unlocked by" @ Ability,, 'AmodSlot');
			return true;
		}
	}

	CurrentInventory = UnitState.GetAllInventoryItems(CheckGameState);
	foreach CurrentInventory(InventoryItem)
	{
		EquipmentTemplate = X2EquipmentTemplate(InventoryItem.GetMyTemplate());
		if (EquipmentTemplate != none)
		{
			foreach EquipmentTemplate.Abilities(Ability)
			{
				if (default.AbilityUnlocksAModSlot.Find(Ability) != INDEX_NONE)
				{
					`LOG(GetFuncName() @ "unlocked by" @ Ability,, 'AmodSlot');
					return true;
				}
			}
		}
	}

	//return false;
	return TriggerSoldierHasAModSlot(UnitState, DefaultCanHaveSlot);

}

static function bool TriggerSoldierHasAModSlot(XComGameState_Unit UnitState, bool DefaultCanHaveSlot)
{
	local XComLWTuple OverrideTuple;

	OverrideTuple = new class'XComLWTuple';
	OverrideTuple.Id = 'SoldierHasAModSlot';
    OverrideTuple.Data.Add(1);
	OverrideTuple.Data[0].Kind = XComLWTVBool;
	OverrideTuple.Data[0].b = DefaultCanHaveSlot;

	`XEVENTMGR.TriggerEvent(OverrideTuple.Id, OverrideTuple, UnitState);

	return OverrideTuple.Data[0].b;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//static function bool HasAmodSlot(CHItemSlot Slot, XComGameState_Unit UnitState, out string LockedReason, optional XComGameState CheckGameState)
//{
//	local name Ability;
//	local bool DefaultCanHaveSlot;

//	DefaultCanHaveSlot = true;

//	if (default.AbilityInteractsWithPistolSlot.Length == 0)
//	{
//		return UnitState.IsSoldier() && !UnitState.IsRobotic();
//		DefaultCanHaveSlot = UnitState.IsSoldier() && !UnitState.IsRobotic();
//	}

	//foreach default.AbilityInteractsWithPistolSlot(Ability)
//	foreach default.AbilityInteractsWithPistolSlot(Ability)
//	{
//		if (UnitState.HasSoldierAbility(Ability, true))
//		{
			//return !default.ABILITY_EXCLUDES_SLOT;
//			DefaultCanHaveSlot = !default.ABILITY_EXCLUDES_SLOT;
//		}
//	}

//return default.ABILITY_EXCLUDES_SLOT;
//return TriggerSoldierHasPistolSlot(UnitState, DefaultCanHaveSlot);
//}

//static function bool TriggerSoldierHasPistolSlot(XComGameState_Unit UnitState, bool DefaultCanHaveSlot)
//{
//	local XComLWTuple OverrideTuple;

//	OverrideTuple = new class'XComLWTuple';
//	OverrideTuple.Id = 'SoldierHasPistolSlot';
//    OverrideTuple.Data.Add(1);
//	OverrideTuple.Data[0].Kind = XComLWTVBool;
//	OverrideTuple.Data[0].b = DefaultCanHaveSlot;

//	`XEVENTMGR.TriggerEvent(OverrideTuple.Id, OverrideTuple, UnitState);

//	return OverrideTuple.Data[0].b;
//}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


static function int AmodGetPriority(CHItemSlot Slot, XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	`log(GetFuncName() @ "called");
	return 15; // Ammo Pocket is 110 WAS 50
}

static function bool ShowAmodItemInLockerList(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_Item ItemState, X2ItemTemplate ItemTemplate, XComGameState CheckGameState)
{
	return ItemTemplate.ItemCat == 'bplating';
}

static function string GetAmodDisplayLetter(CHItemSlot Slot)
{
	`log(GetFuncName() @ "called");
	return default.strAModFirstLetter;
}

static function ValidateLoadout(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_HeadquartersXCom XComHQ, XComGameState NewGameState)
{
	local XComGameState_Item EquippedItem;
	local string strDummy;
	local bool HasSlot;
	EquippedItem = Unit.GetItemInSlot(Slot.InvSlot, NewGameState);
	HasSlot = Slot.UnitHasSlot(Unit, strDummy, NewGameState);

	`LOG(Unit.GetFullName() @ "validating Armor Upgrade Slot. Unit has slot:" @ HasSlot @ EquippedItem == none ? ", slot is empty." : ", slot contains item:" @ EquippedItem.GetMyTemplateName(), default.bLog, 'Armor_Upgrade_Slot');

	if(EquippedItem == none && HasSlot && !default.bAllowEmpty)
	{
		EquippedItem = FindBestItem(Unit, XComHQ, NewGameState);
		if (EquippedItem != none)
		{
			`LOG("Empty slot is not allowed, equipping:" @ EquippedItem.GetMyTemplateName(), default.bLog, 'Armor_Upgrade_Slot');
			Unit.AddItemToInventory(EquippedItem, eInvSlot_ArmorMod, NewGameState);
		}
		else `LOG("Empty slot is not allowed, but the mod was unable to find an infinite item to fill the slot.", default.bLog, 'Armor_Upgrade_Slot');
	}
	else if(EquippedItem != none && !HasSlot)
	{
		`LOG("WARNING Unit has an item equipped in the Armor Upgrade Slot, but they do not have the Armor Upgrade Slot. Unequipping the item and putting it into HQ Inventory.", default.bLog, 'Armor_Upgrade_Slot');
		EquippedItem = XComGameState_Item(NewGameState.ModifyStateObject(class'XComGameState_Item', EquippedItem.ObjectID));
		Unit.RemoveItemFromInventory(EquippedItem, NewGameState);
		XComHQ.PutItemInInventory(NewGameState, EquippedItem);
		EquippedItem = none;
	}
}

private static function XComGameState_Item FindBestItem(const XComGameState_Unit UnitState, XComGameState_HeadquartersXCom XComHQ, XComGameState NewGameState)
{
	local X2EquipmentTemplate				EquipmentTemplate;
	local XComGameStateHistory				History;
	local int								HighestTier;
	local XComGameState_Item				ItemState;
	local XComGameState_Item				BestItemState;
	local StateObjectReference				ItemRef;

	HighestTier = -999;
	History = `XCOMHISTORY;

	//	Cycle through all items in HQ Inventory
	foreach XComHQ.Inventory(ItemRef)
	{
		ItemState = XComGameState_Item(History.GetGameStateForObjectID(ItemRef.ObjectID));
		if (ItemState != none)
		{
			EquipmentTemplate = X2EquipmentTemplate(ItemState.GetMyTemplate());

			if (EquipmentTemplate != none &&	//	If this is an equippable item
				default.AllowedItemCategories.Find(EquipmentTemplate.ItemCat) != INDEX_NONE &&	//	That has a matching Item Category
				EquipmentTemplate.bInfiniteItem && EquipmentTemplate.Tier > HighestTier &&		//	And is of higher Tier than previously found items
				UnitState.CanAddItemToInventory(EquipmentTemplate, eInvSlot_ArmorMod, NewGameState, ItemState.Quantity, ItemState))	//	And can be equipped on the soldier
			{
				//	Remember this item as the currently best replacement option.
				HighestTier = EquipmentTemplate.Tier;
				BestItemState = ItemState;
			}
		}
	}

	if (BestItemState != none)
	{
		//	This will set up the Item State for modification automatically, or create a new Item State in the NewGameState if the template is infinite.
		XComHQ.GetItemFromInventory(NewGameState, BestItemState.GetReference(), BestItemState);
		return BestItemState;
	}
	else
	{
		return none;
	}
}
/*
function ECHSlotUnequipBehavior AmodGetUnequipBehavior(CHItemSlot Slot, ECHSlotUnequipBehavior DefaultBehavior, XComGameState_Unit Unit, XComGameState_Item ItemState, optional XComGameState CheckGameState)
{
	return eCHSUB_DontAllow;
}
*/
function ECHSlotUnequipBehavior AmodGetUnequipBehavior(CHItemSlot Slot, ECHSlotUnequipBehavior DefaultBehavior, XComGameState_Unit Unit, XComGameState_Item ItemState, optional XComGameState CheckGameState)
{	
	if (default.bAllowEmpty)
	{
		return eCHSUB_AllowEmpty;
	}
	else
	{
		return eCHSUB_AttemptReEquip;
	}
}