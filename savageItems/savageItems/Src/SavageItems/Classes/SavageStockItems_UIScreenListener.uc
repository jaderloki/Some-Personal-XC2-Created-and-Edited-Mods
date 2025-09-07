// This is an Unreal Script This is simply a modified version of the StartWithFlashbangAndSmokeGrenade mod by "Someone"

class SavageStockItems_UIScreenListener extends UIScreenListener dependson(X2Item_DefaultGrenades) dependson(X2StrategyElement_DefaultTechs);
/*
//var bool didUpdateTemplates;

event OnInit(UIScreen Screen)
{

	if (ISStrategyState())
	{
		// Update the templates in use.
		//if (!didUpdateTemplates)
		//{
			UpdateTemplates();
			//didUpdateTemplates = true;
		//}
	}
}

function bool IsStrategyState()
{
    return `HQGAME  != none && `HQPC != None && `HQPRES != none;
}

// Removes an item entirely from the XComHQ.
function RemoveItemCompletely(XComGameState NewGameState, XComGameState_HeadquartersXCom NewXComHQState, name ItemName)
{
	local XComGameState_Item InventoryItemState, ItemState;
	local array<XComGameState_Item> InventoryItems;
	local array<XComGameState_Unit> Soldiers;
	local int iSoldier;

	ItemState = NewXComHQState.GetItemByName(ItemName);
	if (ItemState != none)
	{
		NewXComHQState.RemoveItemFromInventory(NewGameState, ItemState.GetReference(), ItemState.Quantity);
		NewGameState.RemoveStateObject(ItemState.GetReference().ObjectID);

		Soldiers = NewXComHQState.GetSoldiers();
		for (iSoldier = 0; iSoldier < Soldiers.Length; iSoldier++)
		{
			InventoryItems = Soldiers[iSoldier].GetAllInventoryItems(NewGameState, false);

			foreach InventoryItems(InventoryItemState)
			{
				if (InventoryItemState.GetMyTemplateName() == ItemName)
				{
					// Remove the old item and delete it from the game
					Soldiers[iSoldier].RemoveItemFromInventory(InventoryItemState, NewGameState);
					NewGameState.RemoveStateObject(InventoryItemState.GetReference().ObjectID);
				}
			}
		}
	}
}

function UpdateTemplates()
{
	local X2ItemTemplateManager itemMan;
	local X2ItemTemplate HollowPt, DTracer, HiCal, IgniteR, ReVest, CBPlate, Medpak, WebOver, StandardAMod, HidBlade, LVest, RBar;
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom OldXComHQState, NewXComHQState;
	local XComGameState_Item HollowPtState, DTracerState, HiCalState, IgniteRState, ReVestState, CBPlateState, MedpakState, WebOverState, StandardAModState, HidBladeState, LVestState, RBarState, ItemState;
	local XComGameState NewGameState;
	local bool hpaB, dtraceB, hcalB, igrB, rvB, cbpB, mpkB, webB, stdmodB, hidblaB, lvestB, RBarB;

	// Get the XCom HQ so we can manipulate its items.
	History = `XCOMHISTORY;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Savage Items");
	OldXComHQState = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	NewXComHQState = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', OldXComHQState.ObjectID));

	// Determine if new copies of the items need to be added or if the items already exist in the base
	foreach History.IterateByClassType(class'XComGameState_Item', ItemState)
	{
		if (ItemState.GetMyTemplateName() == 'SAVHollowPointRounds' && ItemState.InventorySlot == eInvSlot_Unknown)
		{
			hpaB = true; // It doesn't need to be manually added.
		}
		if (ItemState.GetMyTemplateName() == 'DumbTracerRounds' && ItemState.InventorySlot == eInvSlot_Unknown)
		{
			dtraceB = true; // It doesn't need to be manually added.
		}
		if (ItemState.GetMyTemplateName() == 'HighVelocityAP' && ItemState.InventorySlot == eInvSlot_Unknown)
		{
			hcalB = true; // It doesn't need to be manually added.
		}
		if (ItemState.GetMyTemplateName() == 'IgnitionRounds' && ItemState.InventorySlot == eInvSlot_Unknown)
		{
			igrB = true; // It doesn't need to be manually added.
		}
		if (ItemState.GetMyTemplateName() == 'ReinforcedVest' && ItemState.InventorySlot == eInvSlot_Unknown)
		{
			rvB = true; // It doesn't need to be manually added.
		}
		if (ItemState.GetMyTemplateName() == 'Medipack' && ItemState.InventorySlot == eInvSlot_Unknown)
		{
			mpkB = true; // It doesn't need to be manually added.
		}
		if (ItemState.GetMyTemplateName() == 'CeramicBolsterPlating' && ItemState.InventorySlot == eInvSlot_Unknown)
		{
			cbpB = true; // It doesn't need to be manually added.
		}
		if (ItemState.GetMyTemplateName() == 'WebbingOverlay' && ItemState.InventorySlot == eInvSlot_Unknown)
		{
			webB = true; // It doesn't need to be manually added.
		}
		if (ItemState.GetMyTemplateName() == 'StandardIssueAMod' && ItemState.InventorySlot == eInvSlot_Unknown)
		{
			stdmodB = true; // It doesn't need to be manually added.
		}
		if (ItemState.GetMyTemplateName() == 'HiddenBladesCV' && ItemState.InventorySlot == eInvSlot_Unknown)
		{
			hidblaB = true; // It doesn't need to be manually added.
		}
		if (ItemState.GetMyTemplateName() == 'SavLightVest' && ItemState.InventorySlot == eInvSlot_Unknown)
		{
			lvestB = true; // It doesn't need to be manually added.
		}
		if (ItemState.GetMyTemplateName() == 'SavRationBar' && ItemState.InventorySlot == eInvSlot_Unknown)
		{
			RBarB = true; // It doesn't need to be manually added.
		}
	}
	*/



	// Delete all three grenades from the HQ completely.
	/*RemoveItemCompletely(NewGameState, NewXComHQState, 'FlashbangGrenade');
	RemoveItemCompletely(NewGameState, NewXComHQState, 'SmokeGrenade');
	RemoveItemCompletely(NewGameState, NewXComHQState, 'SmokeGrenadeMk2');*/
	

	/*

	// Get the item templates.
	itemMan = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	HollowPt = itemMan.FindItemTemplate('SAVHollowPointRounds');
	DTracer = itemMan.FindItemTemplate('DumbTracerRounds');
	HiCal = itemMan.FindItemTemplate('HighVelocityAP');
	IgniteR = itemMan.FindItemTemplate('IgnitionRounds');
	ReVest = itemMan.FindItemTemplate('ReinforcedVest');
	CBPlate = itemMan.FindItemTemplate('CeramicBolsterPlating');
	WebOver = itemMan.FindItemTemplate('WebbingOverlay');
	Medpak = itemMan.FindItemTemplate('Medipack');
	StandardAMod = itemMan.FindItemTemplate('StandardIssueAMod');
	HidBlade = itemMan.FindItemTemplate('HiddenBladesCV');
	LVest = itemMan.FindItemTemplate('SavLightVest');
	RBar = itemMan.FindItemTemplate('SavRationBar');
	
	// Add our new versions of the grenades back to the game.


	HollowPtState = HollowPt.CreateInstanceFromTemplate(NewGameState);
	DTracerState = DTracer.CreateInstanceFromTemplate(NewGameState);
	HiCalState = HiCal.CreateInstanceFromTemplate(NewGameState);
	IgniteRState = IgniteR.CreateInstanceFromTemplate(NewGameState);
	ReVestState = ReVest.CreateInstanceFromTemplate(NewGameState);
	CBPlateState = CBPlate.CreateInstanceFromTemplate(NewGameState);
	WebOverState = WebOver.CreateInstanceFromTemplate(NewGameState);
	MedpakState = Medpak.CreateInstanceFromTemplate(NewGameState);
	StandardAModState = StandardAMod.CreateInstanceFromTemplate(NewGameState);
	HidBladeState = HidBlade.CreateInstanceFromTemplate(NewGameState);
	LVestState = LVest.CreateInstanceFromTemplate(NewGameState);
	RBarState = RBar.CreateInstanceFromTemplate(NewGameState);

	HollowPtState.OnCreation(HollowPt);
	DTracerState.OnCreation(DTracer);
	HiCalState.OnCreation(HiCal);
	IgniteRState.OnCreation(IgniteR);
	ReVestState.OnCreation(ReVest);
	CBPlateState.OnCreation(CBPlate);
	WebOverState.OnCreation(WebOver);
	MedpakState.OnCreation(Medpak);
	StandardAModState.OnCreation(StandardAMod);
	HidBladeState.OnCreation(HidBlade);
	LVestState.OnCreation(LVest);
	RBarState.OnCreation(RBar);

	NewGameState.AddStateObject(HollowPtState);
	NewGameState.AddStateObject(DTracerState);
	NewGameState.AddStateObject(HiCalState);
	NewGameState.AddStateObject(IgniteRState);	
	NewGameState.AddStateObject(ReVestState);
	NewGameState.AddStateObject(CBPlateState);
	NewGameState.AddStateObject(WebOverState);
	NewGameState.AddStateObject(MedpakState);
	NewGameState.AddStateObject(StandardAModState);
	NewGameState.AddStateObject(HidBladeState);
	NewGameState.AddStateObject(LVestState);
	NewGameState.AddStateObject(RBarState);

		// Add items to the HQ if they are needed

	if (!hpaB)
	{
		NewXComHQState.AddItemToHQInventory(HollowPtState);
	}
	if (!dtraceB)
	{
		NewXComHQState.AddItemToHQInventory(DTracerState);
	}
	if (!hcalB)
	{
		NewXComHQState.AddItemToHQInventory(HiCalState);
	}
	if (!igrB)
	{
		NewXComHQState.AddItemToHQInventory(IgniteRState);
	}
	if (!rvB)
	{
		NewXComHQState.AddItemToHQInventory(ReVestState);
	}
	if (!cbpB)
	{
		NewXComHQState.AddItemToHQInventory(CBPlateState);
	}
	if (!mpkB)
	{
		NewXComHQState.AddItemToHQInventory(MedpakState);
	}
	if (!webB)
	{
		NewXComHQState.AddItemToHQInventory(WebOverState);
	}
	if (!stdmodB)
	{
		NewXComHQState.AddItemToHQInventory(StandardAModState);
	}
	if (!hidblaB)
	{
		NewXComHQState.AddItemToHQInventory(HidBladeState);
	}
	if (!lvestB)
	{
		NewXComHQState.AddItemToHQInventory(LVestState);
	}
	if (!RBarB)
	{
		NewXComHQState.AddItemToHQInventory(RBarState);
	}
		
	// Add the changes to the game state, and then push it.
	NewGameState.AddStateObject(NewXComHQState);
	History.AddGameStateToHistory(NewGameState);
}

// This event is triggered after a screen receives focus
event OnReceiveFocus(UIScreen Screen);
 
// This event is triggered after a screen loses focus
event OnLoseFocus(UIScreen Screen);
 
// This event is triggered when a screen is removed
event OnRemoved(UIScreen Screen);
 
defaultproperties
{
    // Leaving this assigned to none will cause every screen to trigger its signals on this class
    ScreenClass = UIFacilityGrid;
}
*/