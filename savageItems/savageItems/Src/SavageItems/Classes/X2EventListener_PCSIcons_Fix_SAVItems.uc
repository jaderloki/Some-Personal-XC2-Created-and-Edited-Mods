//*******************************************************************************************
//  FILE:   Psionics Ex Machina. stuff                                 
//  
//	File created	25/07/20    21:00
//	LAST UPDATED    07/08/20	18:30
//	Stolen			03/02/23	22:49
//
//	FIXES UP THE ICON FOR PSI PCS'		CURRENTLY HAS OPTIONAL COLOURED VERSION
//
//	SUPER STOLEN FROM LongWar, because Savage doesn't know what he's doing
//*******************************************************************************************
class X2EventListener_PCSIcons_Fix_SAVItems extends X2EventListener;

//add the listener
static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(CreatePCSIconsFix_SAVItems());

	return Templates;
}

static function CHEventListenerTemplate CreatePCSIconsFix_SAVItems()
{
	local CHEventListenerTemplate Template;

	`CREATE_X2TEMPLATE(class'CHEventListenerTemplate', Template, 'PCSIconsFix_SAVItems');

	Template.RegisterInTactical = true;
	Template.RegisterInStrategy = true;

	Template.AddCHEvent('OnGetPCSImage', OnGetPCSImage, ELD_Immediate, 41);
	//`LOG("=== Register Event OnGetPCSImage");

	return Template;
}

static function EventListenerReturn OnGetPCSImage(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComLWTuple			OverridePCSImageTuple;
	local XComGameState_Item	ItemState;

	OverridePCSImageTuple = XComLWTuple(EventData);
	if(OverridePCSImageTuple == none)
	{
		`REDSCREEN("OverrideGetPCSImage event triggered with invalid event data.");
		return ELR_NoInterrupt;
	}
	if(OverridePCSImageTuple.Id != 'GetPCSImageTuple')
		return ELR_NoInterrupt;

    ItemState = XComGameState_Item(OverridePCSImageTuple.Data[0].o);
	if(ItemState == none)
		return ELR_NoInterrupt;

	switch (ItemState.GetMyTemplateName())
	{
		case 'SAV_MedicalPCS': OverridePCSImageTuple.Data[0].b = true; OverridePCSImageTuple.Data[1].s = "img:///UILibrary_SavageItems.0_4_Perks.PCS_Medical_PCSIcon"; break;
		case 'SAV_OverwhelmedPCS': OverridePCSImageTuple.Data[0].b = true; OverridePCSImageTuple.Data[1].s = "img:///UILibrary_SavageItems.0_4_Perks.PCS_Overwhelmed_PCSIcon"; break;
		case 'SAV_StealthPCS': OverridePCSImageTuple.Data[0].b = true; OverridePCSImageTuple.Data[1].s = "img:///UILibrary_SavageItems.0_4_Perks.PCS_Partisan_PCSIcon"; break;
		case 'SAV_SurvivalPCS': OverridePCSImageTuple.Data[0].b = true; OverridePCSImageTuple.Data[1].s = "img:///UILibrary_SavageItems.0_4_Perks.PCS_Survivor_PCSIcon"; break;
		case 'SAV_CQBPCS': OverridePCSImageTuple.Data[0].b = true; OverridePCSImageTuple.Data[1].s = "img:///UILibrary_SavageItems.0_4_Perks.PCS_UrbanWar_PCSIcon"; break;
		case 'SAVDrugsPES': OverridePCSImageTuple.Data[0].b = true; OverridePCSImageTuple.Data[1].s = "img:///UILibrary_SavageItems.0_4_Perks.PCS_Drugs_PCSIcon"; break;
		case 'SAVPornPES': OverridePCSImageTuple.Data[0].b = true; OverridePCSImageTuple.Data[1].s = "img:///UILibrary_SavageItems.0_4_Perks.PCS_Sex_PCSIcon"; break;
		case 'SAVPrewarPES': OverridePCSImageTuple.Data[0].b = true; OverridePCSImageTuple.Data[1].s = "img:///UILibrary_SavageItems.0_4_Perks.PCS_Prewar_PCSIcon"; break;
		case 'SAV_ADVENTPCS_Security': OverridePCSImageTuple.Data[0].b = true; OverridePCSImageTuple.Data[1].s = "img:///UILibrary_SavageItems.PCS_ICON_ACS_Hacking"; break;
		case 'SAV_ADVENTPCS_Mark': OverridePCSImageTuple.Data[0].b = true; OverridePCSImageTuple.Data[1].s = "img:///UILibrary_SavageItems.PCS_ICON_ACS_MarkTarget"; break;
		case 'SAV_ADVENTPCS_Reflex': OverridePCSImageTuple.Data[0].b = true; OverridePCSImageTuple.Data[1].s = "img:///UILibrary_SavageItems.PCS_ICON_ACS_Reflexes"; break;
	
	default:  break;
	}
	
	return ELR_NoInterrupt;
}
/*
//what does the listener do when it hears a call?
static function EventListenerReturn FixPCSIcons_SAVItems(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameState_Item	ItemState;
	local XComLWTuple			Tuple;

	Tuple = XComLWTuple(EventData);
	ItemState = XComGameState_Item(Tuple.Data[0].o);

	//Add icons to the new PCS' no config option - these icons get added.Period.
	if (ItemState != none)
	{
		//Psi PCS = PsiOffense


		else if (InStr(ItemState.GetMyTemplateName(), "", , true) != INDEX_NONE)
		{
			Tuple.Data[1].s = "";
		}
		else if (InStr(ItemState.GetMyTemplateName(), "", , true) != INDEX_NONE)
		{
			Tuple.Data[1].s = "";
		}
		else if (InStr(ItemState.GetMyTemplateName(), "", , true) != INDEX_NONE)
		{
			Tuple.Data[1].s = "";
		}
		else if (InStr(ItemState.GetMyTemplateName(), "", , true) != INDEX_NONE)
		{
			Tuple.Data[1].s = "";
		}
		else if (InStr(ItemState.GetMyTemplateName(), "", , true) != INDEX_NONE)
		{
			Tuple.Data[1].s = "";
		}
		else if (InStr(ItemState.GetMyTemplateName(), "", , true) != INDEX_NONE)
		{
			Tuple.Data[1].s = "";
		}
		else
		{
			Tuple.Data[1].s = "img:///UILibrary_SavageItems.PCS_Generic";
		}
	}
	
	return ELR_NoInterrupt;
}
*/