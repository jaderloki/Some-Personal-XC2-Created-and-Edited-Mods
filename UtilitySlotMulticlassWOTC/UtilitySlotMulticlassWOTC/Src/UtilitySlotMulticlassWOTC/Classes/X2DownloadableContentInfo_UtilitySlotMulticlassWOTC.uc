class X2DownloadableContentInfo_UtilitySlotMulticlassWOTC extends X2DownloadableContentInfo;

static event OnPostTemplatesCreated()
{
	local int n;
	local X2FacilityTemplate Template;
	local array<X2FacilityTemplate> FacilityTemplates;
	local X2DownloadableContentInfo USSE;

	USSE = class'OrderControl'.static.GetMyInstance("UtilitySlotSidearmsExtendedWOTC");
	if (USSE == none) {
		USSE = class'OrderControl'.static.GetMyInstance("UtilitySlotSidearms_WOTC");
		if (USSE != none) {
			`log("WARNING! Found USS, not USSE! Trying anyway...",, 'UtilitySlotMulticlassWOTC');
		}
	}

	if (USSE == none) {
		return;
	}

	FindFacilityTemplateAllDifficulties('OfficerTrainingSchool', FacilityTemplates);
	foreach FacilityTemplates(Template) {
		for (n=0;n<Template.StaffSlotDefs.Length;n++) {
			if (Template.StaffSlotDefs[n].StaffSlotTemplateName == 'OTSStaffSlot') {
				Template.StaffSlotDefs[n].StaffSlotTemplateName = 'USSM_OTSStaffSlot';
				
				`log("Replaced OTS Staff slot " $ n);

			}
		}
	}
	
}

static function FindFacilityTemplateAllDifficulties(name DataName, out array<X2FacilityTemplate> FacilityTemplates, optional X2StrategyElementTemplateManager StrategyTemplateMgr)
{
	local array<X2DataTemplate> DataTemplates;
	local X2DataTemplate DataTemplate;
	local X2FacilityTemplate FacilityTemplate;

	if(StrategyTemplateMgr == none)
		StrategyTemplateMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

	StrategyTemplateMgr.FindDataTemplateAllDifficulties(DataName, DataTemplates);
	FacilityTemplates.Length = 0;
	foreach DataTemplates(DataTemplate) {
		FacilityTemplate = X2FacilityTemplate(DataTemplate);
		if( FacilityTemplate != none ) {
			FacilityTemplates.AddItem(FacilityTemplate);
		}
	}
}

static function bool DisplayQueuedDynamicPopup(DynamicPropertySet PropertySet)
{
	local UIAlert_USSM Alert;
	local XComHQPresentationLayer HQPresLayer;

	HQPresLayer = `HQPRES();

	if (PropertySet.PrimaryRoutingKey == 'USSM_Multiclass') {
		Alert = HQPresLayer.Spawn(class'UIAlert_USSM', HQPresLayer);
		Alert.DisplayPropertySet = PropertySet;
		Alert.eAlertName = PropertySet.SecondaryRoutingKey;

		HQPresLayer.ScreenStack.Push(Alert);
		return true;
	}
}

static function int SlotPatcher(XComGameState_Unit UnitState, string PersonName, out array<AbilitySetupData> SetupData, int i, X2AbilityTemplate Template,
	XComGameState_Item SlotWeapon, XComGameState_Item U4_Weapon, XComGameState_Item Q5_Weapon, XComGameState_Item S6_Weapon, name cat1, name cat2,
	optional name cat3 = '', optional name cat4 = '')
{
	local X2WeaponTemplate SlotWeaponTemplate;
	local X2WeaponTemplate UseWeaponTemplate;

	// no source weapon for passive abilities anyway
	if (Template.bIsPassive == true)
		return 1;

	if (SlotWeapon != none) {
		SlotWeaponTemplate = X2WeaponTemplate(SlotWeapon.GetMyTemplate());
		if (SlotWeaponTemplate != none) {
			UseWeaponTemplate = SlotWeaponTemplate;
			if (UseWeaponTemplate.WeaponCat == cat1 || UseWeaponTemplate.WeaponCat == cat2 ||
				UseWeaponTemplate.WeaponCat == cat3 || UseWeaponTemplate.WeaponCat == cat4) 
			{
				// everything is already fine
				`log("USSM [" $ PersonName $ "]: Ability " $ Template.DataName $ " is already valid");
				return 1;
			}
		}
	}

	if (U4_Weapon != none) {
		UseWeaponTemplate = X2WeaponTemplate(U4_Weapon.GetMyTemplate());
		if (UseWeaponTemplate.WeaponCat == cat1 || UseWeaponTemplate.WeaponCat == cat2 ||
			UseWeaponTemplate.WeaponCat == cat3 || UseWeaponTemplate.WeaponCat == cat4) 
		{
			`log("USSM [" $ PersonName $ "]: Attached Ability " $ Template.DataName $ " to Slot 4");
			SetupData[i].SourceWeaponRef = U4_Weapon.GetReference();
			return 1;
		}
	}

	if (Q5_Weapon != none) {
		UseWeaponTemplate = X2WeaponTemplate(Q5_Weapon.GetMyTemplate());
		if (UseWeaponTemplate.WeaponCat == cat1 || UseWeaponTemplate.WeaponCat == cat2 ||
			UseWeaponTemplate.WeaponCat == cat3 || UseWeaponTemplate.WeaponCat == cat4) 
		{
			`log("USSM [" $ PersonName $ "]: Attached Ability " $ Template.DataName $ " to Slot 5");
			SetupData[i].SourceWeaponRef = Q5_Weapon.GetReference();
			return 1;
		}
	}

	if (S6_Weapon != none) {
		UseWeaponTemplate = X2WeaponTemplate(S6_Weapon.GetMyTemplate());
		if (UseWeaponTemplate.WeaponCat == cat1 || UseWeaponTemplate.WeaponCat == cat2 ||
			UseWeaponTemplate.WeaponCat == cat3 || UseWeaponTemplate.WeaponCat == cat4) 
		{
			`log("USSM [" $ PersonName $ "]: Attached Ability " $ Template.DataName $ " to Slot 6");
			SetupData[i].SourceWeaponRef = S6_Weapon.GetReference();
			return 1;
		}
	}

	`log("USSM [" $ PersonName $ "]: Couldn't find a slot for " $ Template.DataName $ " - [" $ SlotWeapon $ "][" $ SlotWeaponTemplate.DataName $ "]");
	return 0;

}

static function FinalizeUnitAbilitiesForInit(XComGameState_Unit UnitState, out array<AbilitySetupData> SetupData, optional XComGameState StartState, optional XComGameState_Player PlayerState, optional bool bMultiplayerDisplay)
{
	local array<int> RemoveMe;
	local int patch;
	local bool affectedTemplate;
	local int i;
	local int OldLength;
	local name chkName;
	local name TemplateName;
	local X2AbilityTemplate Template;
	local XComGameState_Item U4_Weapon;
	local XComGameState_Item Q5_Weapon;
	local XComGameState_Item S6_Weapon;
	local XComGameState_Item SlotWeapon;
	local string UnitName;

	if (UnitState.IsSoldier()) {
		UnitName = UnitState.GetFullName();

		U4_Weapon = UnitState.GetItemInSlot(eInvSlot_QuaternaryWeapon);
		Q5_Weapon = UnitState.GetItemInSlot(eInvSlot_QuinaryWeapon);
		S6_Weapon = UnitState.GetItemInSlot(eInvSlot_SenaryWeapon);

		for (i=0;i<SetupData.Length;i++) {
			SlotWeapon = XComGameState_Item(StartState.GetGameStateForObjectID(SetupData[i].SourceWeaponRef.ObjectID));
			TemplateName = SetupData[i].TemplateName;
			Template = SetupData[i].Template;
			if (Template.bIsPassive == false) {
				
				affectedTemplate = false;
				patch = 0;

				foreach class'X2Ability_USSM'.default.PistolPerks(chkName) {
					if (chkname == TemplateName) {
						affectedTemplate = true;
						patch += SlotPatcher(UnitState, UnitName, SetupData, i, Template, SlotWeapon,
							U4_Weapon, Q5_Weapon, S6_Weapon, 'pistol', 'sidearm', 'templar_pistol', 'soldier_sidearm');
					}
				}

				foreach class'X2Ability_USSM'.default.SwordPerks(chkName) {
					if (chkname == TemplateName) {
						affectedTemplate = true;
						patch += SlotPatcher(UnitState, UnitName, SetupData, i, Template, SlotWeapon,
							U4_Weapon, Q5_Weapon, S6_Weapon, 'sword', 'gauntlet', 'replace_psiamp');
					}
				}

				foreach class'X2Ability_USSM'.default.GremlinPerks(chkName) {
					if (chkname == TemplateName) {
						affectedTemplate = true;
						patch += SlotPatcher(UnitState, UnitName, SetupData, i, Template, SlotWeapon, U4_Weapon, Q5_Weapon, S6_Weapon, 'gremlin', '');
					}
				}

				foreach class'X2Ability_USSM'.default.GrenadeLauncherPerks(chkName) {
					if (chkname == TemplateName) {
						affectedTemplate = true;
						patch += SlotPatcher(UnitState, UnitName, SetupData, i, Template, SlotWeapon, U4_Weapon, Q5_Weapon, S6_Weapon, 'grenade_launcher', '');
					}
				}

				// templar training
				foreach class'X2Ability_USSM'.default.GauntletPerks(chkName) {
					if (chkname == TemplateName) {
						affectedTemplate = true;
						patch += SlotPatcher(UnitState, UnitName, SetupData, i, Template, SlotWeapon,
							U4_Weapon, Q5_Weapon, S6_Weapon, 'gauntlet', 'replace_psiamp');
					}
				}

				if (affectedTemplate) {
					if (patch > 1) {
						`log("USSM: ???? Ability " $ TemplateName $ " got patched more than once?!");
					} else if (patch == 0) {
						// this ability is not relevant for the moment
						RemoveMe.AddItem(i);
					}
				}

			}
		}

		if (RemoveMe.Length > 0) {
			OldLength = SetupData.Length;
			for(i=RemoveMe.Length-1;i>=0;i--) {
				`log("USSA: Removing " $ SetupData[RemoveMe[i]].TemplateName);
				SetupData.Remove(RemoveMe[i], 1);
			}

			`log("USSM: Had to remove " $ RemoveMe.Length $ " elements; from " $ OldLength $ " to " $ SetupData.Length); 

		}

	}
}
