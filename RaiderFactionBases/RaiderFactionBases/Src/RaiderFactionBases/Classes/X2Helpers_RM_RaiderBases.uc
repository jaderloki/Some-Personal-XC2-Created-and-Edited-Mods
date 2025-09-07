class X2Helpers_RM_RaiderBases extends Object config(RaiderBases);

struct RaiderBaseDef
{
	var name DLCName; // name found in XComGame.ini
	var name SitrepName; // the sitrep that is normally spawned by the mod
	var int AppearanceChance; // chance of appearing *seperately* from the normal sitrep roll for the given continent
	var string DisplayName; // name to show for the rewards on the covert action screen
	var name WeakBucket; // main pods we use for covert operations early game
	var name NormalBucket; // mid game
	var name StrongBucket; // late game
	var name BossBucket; // for base takedowns
};


// design intent for covert operations:
// One soldier per covert action
// always ends in the "ambush", which is a covert operation you send a XCOM team on
// Current mission types:
// Data Retrieval - covert operative spawns at one end of a large map size and needs to make it over to XCOM's side where the evacuation point is. 
// no hard timer, but reinforcements start flooding in once XCOM kicks off the party as they spawn unconcealed. 
// (The operative however, retains concealment. Reapers will do pretty well on these missions!)
// future mission types:
// Hack and Retrieve - covert operative must hack a workstation to learn the location of a chest containing the mission item to evacuate with. 
// again, no hard timer, but reinforcements start flooding in after the chest location is learned. 

// enemy compositions will generally revolve around three levels of buckets:
// our weak bucket is something we expect to be pretty easy to deal with, even early game
// normal bucket is a bit more of a challenge
// strong bucket is something you should care about when they appear


// for now soldiers will use their normal comsetics, but I do plan to use the covert operative appearance by default unless people end up having a problem with that

// covert operatives themselves I've decided will retain their *general* loadout once I get comfortable with altering them, albeit cut down for size:
// bullpups are used for rifle and shotgun users
// bringing back the LMGs from Battle Rifle Expansion for Cannon users
// sniper rifle users use modified Vektor Rifles that work with their abilities
// Grenadiers can not carry their launcher on missions: they can hide the grenades on their person but they will need to use their hands

// faction classes of course effectively get away with carrying their normal loadout for free, as you are giving up being able to use them for a couple weeks instead


enum RaiderBaseStatus
{
	eRB_Undiscovered, // not yet found by player 
	eRB_Discovered, // ready to do the first covert action for (get onto continent where they exist)
	eRB_ReadyToAssault, // ready to do second covert action for (do the first covert action)
	eRB_Assaulting, // mission for it has been spawned, if I ever decide to do this
	eRB_Destroyed //did the covert action: changed from original design intent. We'll be skipping straight to this status after the second covert action.
};

var config array<RaiderBaseDef> BaseDefinitions;

// existing mod
static function bool IsExistingMod(name DLCName)
{
	local array<X2DownloadableContentInfo> DLCInfos;
	local int i;
	DLCInfos = `ONLINEEVENTMGR.GetDLCInfos(false);	

	for(i = 0; i < DLCInfos.Length; i++)
	{
		if(name(DLCInfos[i].DLCIdentifier) == DLCName)
		{
			return true;
		}
	}
	return false;
}

//contesting tags
static function bool HasContestingTags(XComGameState_MissionSite MissionState, name SitRepName) 
//we need to do this seperately since we have a strategyrequirement to block our sitreps from being used normally
{
	local X2SitRepTemplateManager SitRepManager;
	local X2SitRepTemplate SitRepTemplate, OtherSitrepTemplate;
	local XComGameStateHistory History;
	local XComGameState_HeadquartersAlien AlienHQ; 
	local XComGameState_HeadquartersXCom XComHQ; 
	local MissionDefinition MissionDef;
	local name GameplayTag;
	local int ForceLevel;
	local name Tag;

	SitRepManager = class'X2SitRepTemplateManager'.static.GetSitRepTemplateManager();
	SitRepTemplate = SitRepManager.FindSitRepTemplate(SitRepName);

	History = `XCOMHISTORY;
	AlienHQ = XComGameState_HeadquartersAlien(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersAlien'));
	ForceLevel = AlienHQ.GetForceLevel();
	MissionDef = MissionState.GeneratedMission.Mission;

	if((SitrepTemplate.MinimumForceLevel > 0 && ForceLevel < SitrepTemplate.MinimumForceLevel) || (SitrepTemplate.MaximumForceLevel > 0 && ForceLevel > SitrepTemplate.MaximumForceLevel))
	{
		return true;
	}

	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	foreach SitrepTemplate.TacticalGameplayTags(Tag)
	{
		if(XComHQ.TacticalGameplayTags.Find(Tag) != INDEX_NONE)
		{
			return true;
		}
	}

	foreach SitrepTemplate.ExcludeGameplayTags(Tag)
	{
		if(XComHQ.TacticalGameplayTags.Find(Tag) != INDEX_NONE) //this is for alien rulers
		{
			return true;
		}
	}

	if(SitrepTemplate.ValidMissionTypes.Length > 0 && SitrepTemplate.ValidMissionTypes.Find(MissionDef.sType) == INDEX_NONE)
	{
		return true;
	}

	if(SitrepTemplate.ValidMissionFamilies.Length > 0 && SitrepTemplate.ValidMissionFamilies.Find(MissionDef.MissionFamily) == INDEX_NONE)
	{
		return true;
	}

	foreach MissionState.TacticalGameplayTags(GameplayTag)
	{
		if(SitrepTemplate.ExcludeGameplayTags.Find(GameplayTag) != INDEX_NONE)
		{
			return true;
		}
	}

	if(MissionDef.sType == "RecoverExpedition" || MissionDef.sType == "ProtectDevice" )
	{
		return true; // these groups don't obey mission specific conditions for these types, so this can cause near immediate mission failures  otherwise
	}

	if(MissionState.GetMissionSource().bGoldenPath)
	{
		return true; //ignore base story missions
	}

	switch(MissionState.GetMissionSource().DataName) //ignore dlc story + special missions like ambush
	{
		case 'MissionSource_LostAndAbandoned':
		case 'MissionSource_ChosenAvengerAssault':
		case 'MissionSource_AvengerDefense':
		case 'MissionSource_RescueSoldier':
		case 'MissionSource_ChosenAmbush':
		case 'MissionSource_ChosenStronghold':
		case 'MissionSource_AlienNest':
		case 'MissionSource_LostTowers':
		case 'MissionSource_RaiderAmbush': // also ignore raider ambushes since we'll be doing it differently here
		case 'MissionSource_RaiderBaseTakedown':
			return true;
	}

	foreach MissionState.GeneratedMission.Sitreps(SitrepName)
	{
		OtherSitrepTemplate = SitRepManager.FindSitRepTemplate(SitrepName);

		if(OtherSitrepTemplate.ExcludeGameplayTags.Find('SITREP_RaiderIncursion') != INDEX_NONE)
		{
			return true;
		}

	}

	return false;


}


// processing encounters
static function ProcessEncounter(out name EncounterName, out PodSpawnInfo Encounter, RaiderBaseDef BaseDef, XComGameState_MissionSite MissionState, int level = 0) 
{
	// 0 = weak, 1 = normal, strong = 2
	local int i, idx, k, curForceLevel, bucketSize; 
	local XComGameState_HeadquartersAlien AlienHQ;
	local ConfigurableEncounter CurEncounterDef, EncounterDef, EmptyDef;
	local EncounterBucket BucketDef;
	local name CharacterName;
	
	`log("RFB is altering encounter " $ EncounterName $ " with the following BaseDef " $ BaseDef.DisplayName);
	// Find the encounter's config definition

	if(level >= 3)
	{
		i = class'XComTacticalMissionManager'.default.EncounterBuckets.Find('EncounterBucketID', BaseDef.BossBucket);
		// SPECIAL HANDLING - some mods may  not have boss pods, so replace with a strong pod
		if(i == INDEX_NONE)
		{
			i = class'XComTacticalMissionManager'.default.EncounterBuckets.Find('EncounterBucketID', BaseDef.StrongBucket);
		}
	}
	else if(level >= 2)
	{
		i = class'XComTacticalMissionManager'.default.EncounterBuckets.Find('EncounterBucketID', BaseDef.StrongBucket);
	}
	else if (level >= 1)
	{
	
		i = class'XComTacticalMissionManager'.default.EncounterBuckets.Find('EncounterBucketID', BaseDef.NormalBucket);
	}
	else
	{
		i = class'XComTacticalMissionManager'.default.EncounterBuckets.Find('EncounterBucketID', BaseDef.WeakBucket);
	}
	if (i != INDEX_NONE)
	{
	 BucketDef = class'XComTacticalMissionManager'.default.EncounterBuckets[i];
	}
	else
	{
		`Redscreen("ProcessEncounter got BaseDef bucket that doesn't exist - aborting");
		return;
	}
	if(BucketDef.RandomizedSelection) // just pick a random pod
	{	
		k = class'XComTacticalMissionManager'.default.ConfigurableEncounters.Find('EncounterID', BucketDef.EncounterIDs[`SYNC_RAND_STATIC(BucketDef.EncounterIDs.Length)].EncounterID);
		if(k != INDEX_NONE)
		{
			EncounterDef = class'XComTacticalMissionManager'.default.ConfigurableEncounters[k];
		}
		else
		{
			`Redscreen("ProcessEncounter got EncounterDef that doesn't exist - aborting");
			return;
		}
	}
	else // check applicable force levels
	{
		AlienHQ = class'UIUtilities_Strategy'.static.GetAlienHQ();
		bucketSize = BucketDef.EncounterIDs.Length;
		curForceLevel = 0;
		for(idx = 0; idx < bucketSize; idx++)
		{
			k = class'XComTacticalMissionManager'.default.ConfigurableEncounters.Find('EncounterID', BucketDef.EncounterIDs[idx].EncounterID);
			if(k != INDEX_NONE)
			{
				CurEncounterDef = class'XComTacticalMissionManager'.default.ConfigurableEncounters[k];

				if(CurEncounterDef.MinRequiredForceLevel <= AlienHQ.GetForceLevel() && CurEncounterDef.MaxRequiredForceLevel >= AlienHQ.GetForceLevel())
				{
					// valid encounter def, but is it the strongest one we have?

					if(curForceLevel < CurEncounterDef.MinRequiredForceLevel) // we'll go with the first strongest encounter we can field: ignore similar pods if it's not randomized
					{
						EncounterDef = CurEncounterDef;
						curForceLevel = EncounterDef.MinRequiredForceLevel;

					}

				}
			}
		}
		if(curForceLevel == 0) //if this is 0 then something has gone wrong: the minimum force level is 1
		{
			`Redscreen("ProcessEncounter got EncounterDef that doesn't exist - aborting");
			return;
		}
	}

	if(EncounterDef != EmptyDef)
	{
		Encounter.SelectedCharacterTemplateNames = EncounterDef.ForceSpawnTemplateNames;
		Encounter.Team = EncounterDef.TeamToSpawnInto;
		Encounter.EncounterID = EncounterDef.EncounterID;
		EncounterName = Encounter.EncounterID;
		`log("RFB successfully replaced encounter definition data. This is now " $ EncounterName);
	}
	else
	{
		`Redscreen("ProcessEncounter got EncounterDef that doesn't exist - aborting");
	}
}


function static RemoveInvalidTiles(out array<TTile> Tiles)
{
    local XComWorldData WorldData;
    local TTile Tile;
    local int i;

    WorldData = `XWORLD;
    i = 0;
    while (i < Tiles.Length)
    {
        Tile = Tiles[i];
        if (WorldData.IsTileOutOfRange(Tile) || !WorldData.CanUnitsEnterTile(Tile)) // we can't use a tile outside of the gameplay area, nor an area already occupied by a unit
        {
            Tiles.Remove(i, 1);
        }
        else
        {
            ++i;
        }
    }
}