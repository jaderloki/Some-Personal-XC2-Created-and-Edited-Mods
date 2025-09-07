class X2AbilityCharges_SAVGremlinMedikits extends X2AbilityCharges;
//This class modified for me by Iridar, who is a legend.

var array<name> ItemsThatGrantBonusCharges;
var() bool bStabilize;

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
	if (bStabilize)
	{
		TotalCharges /= class'X2Ability_DefaultAbilitySet'.default.MEDIKIT_STABILIZE_AMMO;
	}
    return TotalCharges;
}

DefaultProperties
{
	ItemsThatGrantBonusCharges(0)="Medikit"
	ItemsThatGrantBonusCharges(1)="NanoMedikit"
	InitialCharges = 0
}