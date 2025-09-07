class XComGameState_RaiderBaseManager extends XComGameState_BaseObject;

// purpose: track and get specific raider base game states
// also spawn them on game start or game load

var array<StateObjectReference> AllBaseRefs;

//---------------------------------------------------------------------------------------
function array<XComGameState_RaiderBase> GetAllBases()
{
	local XComGameStateHistory History;
	local XComGameState_RaiderBase BaseState;
	local array<XComGameState_RaiderBase> AllBases;

	History = `XCOMHISTORY;
	AllBases.Length = 0;

	foreach History.IterateByClassType(class'XComGameState_RaiderBase', BaseState)
	{
		AllBases.AddItem(BaseState);
	}

	return AllBases;
}

static function XComGameState_RaiderBaseManager GetBaseManager(optional bool AllowNULL = false)
{

	`log("Results of getting base manager object back is " $ XComGameState_RaiderBaseManager(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_RaiderBaseManager', AllowNULL)).ObjectID );
	return XComGameState_RaiderBaseManager(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_RaiderBaseManager', AllowNULL));
}

static function CreateBaseManager(optional XComGameState StartState)
{
	local XComGameState_RaiderBaseManager OutpostMgr;
	local XComGameState NewGameState;

	if (GetBaseManager(true) != none)
		return;

	if(StartState != none)
	{
		NewGameState = StartState;
	}
	else
	{
		NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Creating Raider Base Manager Singleton");
	}

	OutpostMgr = XComGameState_RaiderBaseManager(NewGameState.CreateNewStateObject(class'XComGameState_RaiderBaseManager'));
	OutpostMgr.CreateBases(NewGameState);

	if (StartState == none)
	{
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	}
}


protected function CreateBases(XComGameState NewState)
{
	local XComGameState_Continent Region;
	local XComGameStateHistory History;
	local XComGameState_RaiderBase Base;
	local RaiderBaseDef baseDef;
	local int NumPerContinent;
	local bool Added;
	local array<XComGameState_RaiderBase> Bases;
	History = `XCOMHISTORY;

	NumPerContinent = 1; //at first, try to assign a unique raider base per continent
	`log("Amount of definitions we think base definitions have: " $ class'X2Helpers_RM_Raiderbases'.default.BaseDefinitions.Length);
	foreach class'X2Helpers_RM_Raiderbases'.default.BaseDefinitions(baseDef)
	{
		Added = false;
		if(class'X2Helpers_RM_RaiderBases'.static.IsExistingMod(baseDef.DLCName))
		{
			while(!Added)
			{
				foreach History.IterateByClassType(class'XComGameState_Continent', Region)
				{
					Bases = GetBasesForContinent(Region);
					`log("Raider Bases in continent " $ Region.GetMyTemplate().DisplayName $ " is # " $ Bases.length);
					if(Bases.Length < NumPerContinent)  // if the array is smaller than how many bases we need to add...
					{
						`log("Raider Base: adding " $ baseDef.DLCName $ " to continent " $ Region.GetMyTemplate().DisplayName);
						`log("Has appearance chance: " $ baseDef.AppearanceChance);
						`log("Has display name of: " $ baseDef.DisplayName);
						`log("Uses sitrep: " $ baseDef.SitrepName);
						Base = class'XComGameState_RaiderBase'.static.CreateBase(NewState, Region, Region.GetRandomRegionInContinent(), baseDef);
						AllBaseRefs.AddItem(Base.GetReference());
						Added = true;
						break; // stop once we added this base def
					}
				}

				//if we're here and still not added, increment by one and go through the loop again
				if(!Added)
				{
					NumPerContinent++;
				}
			}
		}
	}


}


function array<XComGameState_RaiderBase> GetBasesForContinent(XComGameState_Continent Region)
{
	local StateObjectReference Ref;
	local XComGameState_RaiderBase Base;
	local array<XComGameState_RaiderBase> Bases;
	local XComGameStateHistory History;

	History = `XCOMHISTORY;
	Bases.Length = 0;
	foreach AllBaseRefs(Ref)
	{
		Base = XComGameState_RaiderBase(History.GetGameStateForObjectID(Ref.ObjectID));
		if (Base.Continent.ObjectID == Region.GetReference().ObjectID)
		{
			Bases.AddItem(Base);
		}
	}

	return Bases;
}

function XComGameState_Continent GetContinentForBase(XComGameState_RaiderBase Outpost)
{
	local XComGameState_Continent Region;

	Region = XComGameState_Continent(`XCOMHISTORY.GetGameStateForObjectID(Outpost.Continent.ObjectID));
	return Region;
}


DefaultProperties
{
	bSingletonStateType=true
}

