class X2AbilityCharges_SAVStims2 extends X2AbilityCharges;
//This class modified for me by Iridar, who is a legend.

var array<name> ItemsThatGrantBonusCharges;

function int GetInitialCharges(XComGameState_Ability Ability, XComGameState_Unit Unit)
{
    local array<XComGameState_Item> InventoryItems;
    local XComGameState_Item ItemIter;
    local int TotalCharges;

    TotalCharges = InitialCharges;
    InventoryItems = Unit.GetAllInventoryItems();
    foreach InventoryItems(ItemIter)
    {
        if (ItemIter.bMergedOut) // This line may or may not be relevant for you
            continue;
            
        if (default.ItemsThatGrantBonusCharges.Find(ItemIter.GetMyTemplateName()) != INDEX_NONE)
        {
            TotalCharges += ItemIter.Ammo; // Or TotalCharges++; or whatever custom logic for charges per item
        }
    }
    return TotalCharges;
}

DefaultProperties
{
	ItemsThatGrantBonusCharges(0)="SavStimGun2"
	InitialCharges = 1
}