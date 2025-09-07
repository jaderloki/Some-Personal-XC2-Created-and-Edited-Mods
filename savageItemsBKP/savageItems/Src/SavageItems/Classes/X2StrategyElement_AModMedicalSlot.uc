class X2StrategyElement_AModMedicalSlot extends CHItemSlotSet config(SavageItemsSlots);

var localized string strAModMedFirstLetter;

var config array<name> AbilityUnlocksAModMedicalSlot;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	Templates.AddItem(CreateAModMedicalSlotTemplate('ArmorModMedicalSlot', eInvSlot_AModMedical));

	return Templates;
}

static function X2DataTemplate CreateAModMedicalSlotTemplate(name TemplateName, EInventorySlot InventorySlot)
{
	local CHItemSlot Template;

	`CREATE_X2TEMPLATE(class'CHItemSlot', Template, TemplateName);

	Template.InvSlot = InventorySlot;
	Template.SlotCatMask = Template.SLOT_ITEM;
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
	Template.BypassesUniqueRule = true;
	Template.IsMultiItemSlot = false;
	Template.IsSmallSlot = true;
	Template.NeedsPresEquip = true;


	Template.CanAddItemToSlotFn = CanAddItemToAmodMedicalSlot;
	Template.UnitHasSlotFn = HasAmodMedicalSlot;
	Template.GetPriorityFn = AmodMedicalGetPriority;
	Template.ShowItemInLockerListFn = ShowAmodMedicalItemInLockerList;
	Template.ValidateLoadoutFn = AModMedicalValidateLoadout;
	Template.GetSlotUnequipBehaviorFn = AmodMedicalGetUnequipBehavior;

	return Template;
}

static function bool CanAddItemToAmodMedicalSlot(CHItemSlot Slot, XComGameState_Unit Unit, X2ItemTemplate Template, optional XComGameState CheckGameState, optional int Quantity = 1, optional XComGameState_Item ItemState)
{
	local X2EquipmentTemplate EquipmentTemplate;
    local string strDummy;
     
     
   `LOG("Trying to equip " @ Template.DataName @ " on: " @ Unit.GetFullName(),, 'AMODMED_SLOT');
   
    if (!Slot.UnitHasSlot(Unit, strDummy, CheckGameState) || Unit.GetItemInSlot(Slot.InvSlot, CheckGameState) != none)
    {
        return false;
    }

    EquipmentTemplate = X2EquipmentTemplate(Template);

    if(EquipmentTemplate != none)
    {
		//return (class'X2DownloadableContentInfo_WOTC_PistolSlot'.default.PistolCategories.Find(WeaponTemplate.WeaponCat) != INDEX_NONE);
		return (class'X2DownloadableContentInfo_SavageItems'.static.TriggerIsItemValidForAModMedicalSlot(EquipmentTemplate));
    }
    
    return false;
}

static function bool HasAmodMedicalSlot(CHItemSlot Slot, XComGameState_Unit UnitState, out string LockedReason, optional XComGameState CheckGameState)
{
	local name Ability;
	local X2EquipmentTemplate EquipmentTemplate;
	local array<XComGameState_Item> CurrentInventory;
	local XComGameState_Item InventoryItem;
	
	`log(GetFuncName() @ "called");

	if (default.AbilityUnlocksAModMedicalSlot.Length == 0)
	{
		return UnitState.IsSoldier() && !UnitState.IsRobotic();
	}

	foreach default.AbilityUnlocksAModMedicalSlot(Ability)
	{
		if (UnitState.HasSoldierAbility(Ability, true))
		{
			`LOG(GetFuncName() @ "unlocked by" @ Ability,, 'Medical');
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
				if (default.AbilityUnlocksAModMedicalSlot.Find(Ability) != INDEX_NONE)
				{
					`LOG(GetFuncName() @ "unlocked by" @ Ability,, 'MedicalSlot');
					return true;
				}
			}
		}
	}

	return false;
	
}

static function int AmodMedicalGetPriority(CHItemSlot Slot, XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	`log(GetFuncName() @ "called");
	return 57; // Ammo Pocket is 110 
}

static function bool ShowAmodMedicalItemInLockerList(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_Item ItemState, X2ItemTemplate ItemTemplate, XComGameState CheckGameState)
{
	local X2EquipmentTemplate EquipmentTemplate;
    EquipmentTemplate = X2EquipmentTemplate(ItemTemplate);
    if(ItemTemplate != none)
    {
		if(EquipmentTemplate.InventorySlot == eInvSlot_Utility)
		  {
			//return (class'X2DownloadableContentInfo_WOTC_PistolSlot'.default.PistolCategories.Find(WeaponTemplate.WeaponCat) != INDEX_NONE);
			return (class'X2DownloadableContentInfo_SavageItems'.static.TriggerIsItemValidForAModMedicalSlot(EquipmentTemplate));
		  }
		return false;
	  }
}

static function string GetAmodMedicalDisplayLetter(CHItemSlot Slot)
{
	`log(GetFuncName() @ "called");
	return default.strAModMedFirstLetter;
}

static function AModMedicalValidateLoadout(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_HeadquartersXCom XComHQ, XComGameState NewGameState)
{
	local XComGameState_Item EquippedAModMed;
	local string strDummy;
	local bool HasSlot;
	EquippedAModMed = Unit.GetItemInSlot(Slot.InvSlot, NewGameState);
	HasSlot = Slot.UnitHasSlot(Unit, strDummy, NewGameState);
	
	if(EquippedAModMed == none && HasSlot)
	{
		//EquippedSecondaryWeapon = GetBestSecondaryWeapon(NewGameState);
		//AddItemToInventory(EquippedSecondaryWeapon, eInvSlot_SecondaryWeapon, NewGameState);
	}
	else if(EquippedAModMed != none && !HasSlot)
	{
		EquippedAModMed = XComGameState_Item(NewGameState.ModifyStateObject(class'XComGameState_Item', EquippedAModMed.ObjectID));
		Unit.RemoveItemFromInventory(EquippedAModMed, NewGameState);
		XComHQ.PutItemInInventory(NewGameState, EquippedAModMed);
		EquippedAModMed = none;
	}
}

function ECHSlotUnequipBehavior AmodMedicalGetUnequipBehavior(CHItemSlot Slot, ECHSlotUnequipBehavior DefaultBehavior, XComGameState_Unit Unit, XComGameState_Item ItemState, optional XComGameState CheckGameState)
{
	return eCHSUB_AllowEmpty;
}