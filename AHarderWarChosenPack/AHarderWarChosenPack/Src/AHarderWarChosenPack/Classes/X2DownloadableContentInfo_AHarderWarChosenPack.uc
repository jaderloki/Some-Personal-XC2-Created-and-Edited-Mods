//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_AHarderWarChosenPack.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_AHarderWarChosenPack extends X2DownloadableContentInfo;

static event OnPostTemplatesCreated() {
   local X2CharacterTemplateManager		   CharacterMgr;
   local array<name> TemplateNames;
   local name TemplateName;
   local array<X2DataTemplate>			   TemplateAllDifficulties;
   local X2DataTemplate					   Template;
   local X2CharacterTemplate			   CharacterTemplate;
   local X2ItemTemplateManager             AllItems;
   local X2WeaponTemplate                  CurrentWeapon;

   AllItems     = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

   // Chosen Hunter - Can make the Hunter a very troublesome/annoying foe to face, sometimes alternating between Overwatch and Tracking Shot.

   AddPerk( 'ChosenSniperM3',      'HunterAbility_HunterFocus');
   AddPerk( 'ChosenSniperM4',      'HunterAbility_HunterFocus');

   AddPerk( 'ChosenSniperM3',      'DeepFocus');
   AddPerk( 'ChosenSniperM4',      'DeepFocus');

   AddPerk( 'ChosenSniperM3',      'Quickdraw');
   AddPerk( 'ChosenSniperM4',      'Quickdraw');

   AddPerk( 'ChosenSniper',        'SteadyHands');
   AddPerk( 'ChosenSniperM2',      'SteadyHands');
   AddPerk( 'ChosenSniperM3',      'SteadyHands');
   AddPerk( 'ChosenSniperM4',      'SteadyHands');

   AddPerk( 'ChosenSniperM2',      'CoolUnderPressure');
   AddPerk( 'ChosenSniperM3',      'CoolUnderPressure');
   AddPerk( 'ChosenSniperM4',      'CoolUnderPressure');

   // Chosen Assassin
   
   AddPerk( 'ChosenAssassinM3',    'AssassinAbility_AssassinFocus');
   AddPerk( 'ChosenAssassinM4',    'AssassinAbility_AssassinFocus');

   AddPerk( 'ChosenAssassinM3',    'DeepFocus');
   AddPerk( 'ChosenAssassinM4',    'DeepFocus');

   AddPerk( 'ChosenAssassinM2',    'BloodTrail');
   AddPerk( 'ChosenAssassinM3',    'BloodTrail');
   AddPerk( 'ChosenAssassinM4',    'BloodTrail');

   AddPerk( 'ChosenAssassinM3',    'SkirmisherStrike');
   AddPerk( 'ChosenAssassinM4',    'SkirmisherStrike');

   AddPerk( 'ChosenAssassin',      'CoolUnderPressure');
   AddPerk( 'ChosenAssassinM2',    'CoolUnderPressure');
   AddPerk( 'ChosenAssassinM3',    'CoolUnderPressure');
   AddPerk( 'ChosenAssassinM4',    'CoolUnderPressure');

   // Chosen Warlock - Solace and Dirsuptor make him very effective against Psi Operatives and Templars.
   
   AddPerk( 'ChosenWarlockM2',     'SkirmisherStrike');
   AddPerk( 'ChosenWarlockM3',     'SkirmisherStrike');
   AddPerk( 'ChosenWarlockM4',     'SkirmisherStrike');

   AddPerk( 'ChosenWarlockM2',     'WarlockAbility_Disruptor');
   AddPerk( 'ChosenWarlockM3',     'WarlockAbility_Disruptor');
   AddPerk( 'ChosenWarlockM4',     'WarlockAbility_Disruptor');

   AddPerk( 'ChosenWarlock',       'Solace');
   AddPerk( 'ChosenWarlockM2',     'Solace');
   AddPerk( 'ChosenWarlockM3',     'Solace');
   AddPerk( 'ChosenWarlockM4',     'Solace');

   AddPerk( 'ChosenWarlock',	   'CoolUnderPressure');
   AddPerk( 'ChosenWarlockM2',     'CoolUnderPressure');
   AddPerk( 'ChosenWarlockM3',     'CoolUnderPressure');
   AddPerk( 'ChosenWarlockM4',     'CoolUnderPressure');

   // Training Wheels Come Off! - Removes Chosen Keen
   RemovePerk( 'ChosenSniperM2',          'ChosenKeen');
   RemovePerk( 'ChosenSniperM3',          'ChosenKeen');
   RemovePerk( 'ChosenSniperM4',          'ChosenKeen');

   RemovePerk( 'ChosenAssassinM2',        'ChosenKeen');
   RemovePerk( 'ChosenAssassinM3',        'ChosenKeen');
   RemovePerk( 'ChosenAssassinM4',        'ChosenKeen');

   RemovePerk( 'ChosenWarlockM2',         'ChosenKeen');
   RemovePerk( 'ChosenWarlockM3',         'ChosenKeen');
   RemovePerk( 'ChosenWarlockM4',         'ChosenKeen');

   CharacterMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();

   CharacterMgr.GetTemplateNames(TemplateNames);

    foreach TemplateNames(TemplateName)
    {
        CharacterMgr.FindDataTemplateAllDifficulties(TemplateName, TemplateAllDifficulties);

        foreach TemplateAllDifficulties(Template)
        {
            CharacterTemplate = X2CharacterTemplate(Template);

   			switch(CharacterTemplate.DataName)
			{
				case 'ChosenWarlock':
					CharacterTemplate.strPawnArchetypes.RemoveItem("GameUnit_ChosenWarlock.ARC_GameUnit_ChosenWarlock");
					CharacterTemplate.strPawnArchetypes.AddItem("AHarderWar_GameUnit_ChosenWarlock.ARC_GameUnit_ChosenWarlock_AHW");
					break;
				case 'ChosenWarlockM2':
					CharacterTemplate.strPawnArchetypes.RemoveItem("GameUnit_ChosenWarlock.ARC_GameUnit_ChosenWarlockM2");
					CharacterTemplate.strPawnArchetypes.AddItem("AHarderWar_GameUnit_ChosenWarlock.ARC_GameUnit_ChosenWarlockM2_AHW");
					break;
				case 'ChosenWarlockM3':
					CharacterTemplate.strPawnArchetypes.RemoveItem("GameUnit_ChosenWarlock.ARC_GameUnit_ChosenWarlockM3");
					CharacterTemplate.strPawnArchetypes.AddItem("AHarderWar_GameUnit_ChosenWarlock.ARC_GameUnit_ChosenWarlockM3_AHW");
					break;
				case 'ChosenWarlockM4':
					CharacterTemplate.strPawnArchetypes.RemoveItem("GameUnit_ChosenWarlock.ARC_GameUnit_ChosenWarlockM4");
					CharacterTemplate.strPawnArchetypes.AddItem("AHarderWar_GameUnit_ChosenWarlock.ARC_GameUnit_ChosenWarlockM4_AHW");
					break;
			}
        }
    }

   CurrentWeapon = X2WeaponTemplate(AllItems.FindItemTemplate('ChosenRifle_MG'));
   if ( CurrentWeapon != none ) {
	   if ( CurrentWeapon.bShouldCreateDifficultyVariants == true ) {
		   AllItems.FindDataTemplateAllDifficulties('WarlockAbility_PsychokineticShock', TemplateAllDifficulties);
		   foreach TemplateAllDifficulties(Template) {
			   CurrentWeapon = X2WeaponTemplate(Template);
			   if ( CurrentWeapon != none ) {
               CurrentWeapon.Abilities.AddItem('WarlockAbility_PsychokineticShock');
     		   }
         }
	   } else {
         // Same as above but only for one difficulty
         CurrentWeapon.Abilities.AddItem('WarlockAbility_PsychokineticShock');
      }
   }
   CurrentWeapon = X2WeaponTemplate(AllItems.FindItemTemplate('ChosenRifle_BM'));
   if ( CurrentWeapon != none ) {
	   if ( CurrentWeapon.bShouldCreateDifficultyVariants == true ) {
		   AllItems.FindDataTemplateAllDifficulties('WarlockAbility_PsychokineticShock', TemplateAllDifficulties);
		   foreach TemplateAllDifficulties(Template) {
			   CurrentWeapon = X2WeaponTemplate(Template);
			   if ( CurrentWeapon != none ) {
               CurrentWeapon.Abilities.AddItem('WarlockAbility_PsychokineticShock');
     		   }
         }
	   } else {
         // Same as above but only for one difficulty
         CurrentWeapon.Abilities.AddItem('WarlockAbility_PsychokineticShock');
      }
   }
   CurrentWeapon = X2WeaponTemplate(AllItems.FindItemTemplate('ChosenRifle_T4'));
   if ( CurrentWeapon != none ) {
	   if ( CurrentWeapon.bShouldCreateDifficultyVariants == true ) {
		   AllItems.FindDataTemplateAllDifficulties('WarlockAbility_PsychokineticShock', TemplateAllDifficulties);
		   foreach TemplateAllDifficulties(Template) {
			   CurrentWeapon = X2WeaponTemplate(Template);
			   if ( CurrentWeapon != none ) {
               CurrentWeapon.Abilities.AddItem('WarlockAbility_PsychokineticShock');
     		   }
         }
	   } else {
         // Same as above but only for one difficulty
         CurrentWeapon.Abilities.AddItem('WarlockAbility_PsychokineticShock');
      }
   }
   CurrentWeapon = X2WeaponTemplate(AllItems.FindItemTemplate('ChosenRifle_XCOM'));
   if ( CurrentWeapon != none ) {
	   if ( CurrentWeapon.bShouldCreateDifficultyVariants == true ) {
		   AllItems.FindDataTemplateAllDifficulties('ChosenRifle_XCOM', TemplateAllDifficulties);
		   foreach TemplateAllDifficulties(Template) {
			   CurrentWeapon = X2WeaponTemplate(Template);
			   if ( CurrentWeapon != none ) {
               CurrentWeapon.Abilities.AddItem('SkirmisherStrike');
     		   }
         }
	   } else {
         // Same as above but only for one difficulty
         CurrentWeapon.Abilities.AddItem('SkirmisherStrike');
      }
   }
   CurrentWeapon = X2WeaponTemplate(AllItems.FindItemTemplate('ChosenShotgun_XCOM'));
   if ( CurrentWeapon != none ) {
	   if ( CurrentWeapon.bShouldCreateDifficultyVariants == true ) {
		   AllItems.FindDataTemplateAllDifficulties('ChosenShotgun_XCOM', TemplateAllDifficulties);
		   foreach TemplateAllDifficulties(Template) {
			   CurrentWeapon = X2WeaponTemplate(Template);
			   if ( CurrentWeapon != none ) {
               CurrentWeapon.Abilities.AddItem('AssassinAbility_Decimate');
     		   }
         }
	   } else {
         // Same as above but only for one difficulty
         CurrentWeapon.Abilities.AddItem('AssassinAbility_Decimate');
      }
   }
   CurrentWeapon = X2WeaponTemplate(AllItems.FindItemTemplate('ChosenSword_XCOM'));
   if ( CurrentWeapon != none ) {
	   if ( CurrentWeapon.bShouldCreateDifficultyVariants == true ) {
		   AllItems.FindDataTemplateAllDifficulties('ChosenSword_XCOM', TemplateAllDifficulties);
		   foreach TemplateAllDifficulties(Template) {
			   CurrentWeapon = X2WeaponTemplate(Template);
			   if ( CurrentWeapon != none ) {
               CurrentWeapon.Abilities.AddItem('BloodTrail');
     		   }
         }
	   } else {
         // Same as above but only for one difficulty
         CurrentWeapon.Abilities.AddItem('BloodTrail');
      }
   }
   CurrentWeapon = X2WeaponTemplate(AllItems.FindItemTemplate('ChosenSniperRifle_XCOM'));
   if ( CurrentWeapon != none ) {
	   if ( CurrentWeapon.bShouldCreateDifficultyVariants == true ) {
		   AllItems.FindDataTemplateAllDifficulties('ChosenSniperRifle_XCOM', TemplateAllDifficulties);
		   foreach TemplateAllDifficulties(Template) {
			   CurrentWeapon = X2WeaponTemplate(Template);
			   if ( CurrentWeapon != none ) {
               CurrentWeapon.Abilities.AddItem('Sentinel');
     		   }
         }
	   } else {
         // Same as above but only for one difficulty
         CurrentWeapon.Abilities.AddItem('Sentinel');
      }
   }
   CurrentWeapon = X2WeaponTemplate(AllItems.FindItemTemplate('ChosenSniperPistol_XCOM'));
   if ( CurrentWeapon != none ) {
	   if ( CurrentWeapon.bShouldCreateDifficultyVariants == true ) {
		   AllItems.FindDataTemplateAllDifficulties('ChosenSniperPistol_XCOM', TemplateAllDifficulties);
		   foreach TemplateAllDifficulties(Template) {
			   CurrentWeapon = X2WeaponTemplate(Template);
			   if ( CurrentWeapon != none ) {
               CurrentWeapon.Abilities.AddItem('CoolUnderPressure');
     		   }
         }
	   } else {
         // Same as above but only for one difficulty
         CurrentWeapon.Abilities.AddItem('CoolUnderPressure');
      }
   }
}

// Enables adding Abilities to the Chosen

static function AddPerk( name nEnemyName, name nPerkName ) {
	local X2CharacterTemplateManager		AllCharacters;
	local X2CharacterTemplate				CurrentUnit;
	local X2DataTemplate					DifficultyTemplate;
	local array<X2DataTemplate>				DifficultyTemplates;

   if ( nPerkName == '' ) {
      `RedScreen("Enemy Perk add called with no perk name.");
      return;
   }

   if ( nEnemyName == '' ) {
      `RedScreen("Enemy Perk add called with no unit name.");
      return;
   }

	AllCharacters = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
	AllCharacters.FindDataTemplateAllDifficulties(nEnemyName, DifficultyTemplates);

   CurrentUnit = AllCharacters.FindCharacterTemplate(nEnemyName);

	if ( CurrentUnit.bShouldCreateDifficultyVariants == true ) {
		AllCharacters.FindDataTemplateAllDifficulties(nEnemyName, DifficultyTemplates);
		foreach DifficultyTemplates(DifficultyTemplate) {
			CurrentUnit = X2CharacterTemplate(DifficultyTemplate);
			if ( CurrentUnit != none ) {
            CurrentUnit.Abilities.RemoveItem(nPerkName); // Prevents duplication
            CurrentUnit.Abilities.AddItem(nPerkName);
   		}
      }
	} else {
      // Same as above but only for one difficulty
      CurrentUnit.Abilities.RemoveItem(nPerkName); // Prevents duplication
      CurrentUnit.Abilities.AddItem(nPerkName);
   }
}

// Removing Abilities from the Chosen

static function RemovePerk( name nEnemyName, name nPerkName ) {
	local X2CharacterTemplateManager		AllCharacters;
	local X2CharacterTemplate				CurrentUnit;
	local X2DataTemplate					DifficultyTemplate;
	local array<X2DataTemplate>				DifficultyTemplates;

   if ( nPerkName == '' ) {
      `RedScreen("Enemy Perk add called with no perk name.");
      return;
   }

   if ( nEnemyName == '' ) {
      `RedScreen("Enemy Perk add called with no unit name.");
      return;
   }

	AllCharacters = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
	AllCharacters.FindDataTemplateAllDifficulties(nEnemyName, DifficultyTemplates);

   CurrentUnit = AllCharacters.FindCharacterTemplate(nEnemyName);

	if ( CurrentUnit.bShouldCreateDifficultyVariants == true ) {
		AllCharacters.FindDataTemplateAllDifficulties(nEnemyName, DifficultyTemplates);
		foreach DifficultyTemplates(DifficultyTemplate) {
			CurrentUnit = X2CharacterTemplate(DifficultyTemplate);
			if ( CurrentUnit != none ) {
            CurrentUnit.Abilities.RemoveItem(nPerkName);
   		}
      }
	} else {
      // Same as above but only for one difficulty
      CurrentUnit.Abilities.RemoveItem(nPerkName);
   }
}