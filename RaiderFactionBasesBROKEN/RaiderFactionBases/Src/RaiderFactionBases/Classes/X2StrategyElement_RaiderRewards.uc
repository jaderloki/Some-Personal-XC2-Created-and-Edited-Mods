class X2StrategyElement_RaiderRewards extends X2StrategyElement_DefaultRewards;

// purpose: hold reward templates for progressing the event chain, and unlocking the destroy base mission
// also the reward for destroying a raider base

var localized string m_strDiscoveryText;
var localized string m_strActionText;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Rewards;

	// Mission Rewards
	Rewards.AddItem(CreateDiscoverBaseRewardTemplate()); //this is so we can rescue soldiers just captured by ADVENT
	Rewards.AddItem(CreateBaseActionRewardTemplate());

	return Rewards;
}

static function X2DataTemplate CreateBaseActionRewardTemplate()
{
	local X2RewardTemplate Template;

	`CREATE_X2Reward_TEMPLATE(Template, 'Reward_RaiderBaseAction');

	Template.IsRewardAvailableFn = IsBaseActionAvailable;
	Template.GenerateRewardFn = GenerateBaseActionReward;
	Template.GiveRewardFn = GiveBaseActionReward;
	Template.GetRewardStringFn = GetBaseRewardString;
	Template.GetRewardPreviewStringFn = GetBaseRewardString;
	Template.GetRewardDetailsStringFn = GetActionRewardDetailsString;
	Template.CleanUpRewardFn = CleanupBaseReward;
	//Template.RewardPopupFn = MissionRewardPopup;

	return Template;
}
static function bool IsBaseActionAvailable(optional XComGameState NewGameState, optional StateObjectReference AuxRef)
{
	local XComGameState_RaiderBaseManager BaseMgr;
	local array<XComGameState_RaiderBase> Bases;
	local XComGameState_RaiderBase base;
	local XComGameState_CovertAction ActionState;
	local XComGameStateHistory History;
	local XComGameState_Reward RewardState;
	local array<StateObjectReference> BaseRefs;
	local StateObjectReference		BaseRef;
	local int idx;
	History = `XCOMHistory;

	foreach History.IterateByClassType(class'XComGameState_CovertAction', ActionState)
	{
		if(ActionState.GetMyTemplateName() == 'CovertAction_RaiderBaseAction' &&  !ActionState.bCompleted) //this is dumb but we have to account for this
		{
			for (idx = 0; idx < ActionState.RewardRefs.Length; idx++)
			{
				RewardState = XComGameState_Reward(History.GetGameStateForObjectID(ActionState.RewardRefs[idx].ObjectID));

				if (RewardState != none && RewardState.GetMyTemplateName() == 'Reward_RaiderBaseAction')
				{
					BaseRefs.AddItem(ActionState.StoredRewardRef);
				}
			}
		}
		

	}

	BaseMgr = class'XComGameState_RaiderBaseManager'.static.GetBaseManager();


	if(BaseMgr != none)
	{
		Bases = BaseMgr.GetAllBases();
		foreach Bases(base)
		{
			if(base.GetStatus() == eRB_ReadyToAssault && !base.bWaitingForCovertAction)
			{
				foreach BaseRefs(BaseRef)
				{
					if(base.GetReference().ObjectID == BaseRef.ObjectID)
					{
						continue; // skip if there's an already existing covert action that deals with this
					}
				}
				return true;
			}
		}
	}
	return false;
}

static function GiveBaseActionReward(XComGameState NewGameState, XComGameState_Reward RewardState, optional StateObjectReference AuxRef, optional bool bOrder = false, optional int OrderHours = -1)
{
	local XComGameStateHistory History;
	local XComGameState_CovertAction ActionState;
	local XComGameState_RaiderBase BaseState;
	ActionState = XComGameState_CovertAction(NewGameState.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));
	History = `XCOMHISTORY;
	if(ActionState == none)
	{
		

		ActionState = XComGameState_CovertAction(History.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));
		BaseState = XComGameState_RaiderBase(History.GetGameStateForObjectID(ActionState.StoredRewardRef.ObjectID));
	}
	else
	{	
		BaseState = XComGameState_RaiderBase(NewGameState.GetGameStateForObjectID(ActionState.StoredRewardRef.ObjectID));
	}

	if(BaseState == none)
	{
		BaseState = XComGameState_RaiderBase(History.GetGameStateForObjectID(ActionState.StoredRewardRef.ObjectID));
		
	}

	if(BaseState != none)
	{
		BaseState = XComGameState_RaiderBase(NewGameState.ModifyStateObject(class'XComGameState_RaiderBase', BaseState.GetReference().ObjectID));
		BaseState.bWaitingForCovertAction = false;
		BaseState.UpdateStatus(eRB_Destroyed); // TODO: do a mission for this instead of skipping straight to destroyed?
	}
	else
	{
		`log("ERROR: BASE STATE UNABLE TO BE FOUND FOR COVERT ACTION TO DESTROY IT");
	}
}

static function GenerateBaseActionReward(XComGameState_Reward RewardState, XComGameState NewGameState, optional float RewardScalar = 1.0, optional StateObjectReference AuxRef)
{
	local XComGameState_CovertAction ActionState;
	local XComGameState_RaiderBaseManager BaseMgr;
	local array<XComGameState_RaiderBase> Bases;
	local XComGameState_RaiderBase base;
	local XComGameState_WorldRegion RegionState;

	ActionState = XComGameState_CovertAction(NewGameState.GetGameStateForObjectID(AuxRef.ObjectID));
	if (ActionState != none)
	{
		// so if we got here, this means that we know there's at least one base in the given continent that we can use for this
		// we need to save two things: our action state and the base we pick: we store our reference to the base in the action state
		BaseMgr = class'XComGameState_RaiderBaseManager'.static.GetBaseManager();
		if(BaseMgr != none)
		{
			RegionState = XComGameState_WorldRegion(`XCOMHISTORY.GetGameStateForObjectID(ActionState.LocationEntity.ObjectID));
			Bases = BaseMgr.GetBasesForContinent(RegionState.GetContinent());
			if (Bases.Length > 0)
			{
				foreach Bases(base)
				{	
					if(base.GetStatus() == eRB_ReadyToAssault && !base.bWaitingForCovertAction)
					{
						base = XComGameState_RaiderBase(NewGameState.ModifyStateObject(class'XComGameState_RaiderBase', base.GetReference().ObjectID));
						base.bWaitingForCovertAction = true;
						break;
					}

				}
			}
			else // get from anywhere in the world
			{
				Bases = BaseMgr.GetAllBases();
				foreach Bases(base)
				{
					if(base.GetStatus() == eRB_ReadyToAssault && !base.bWaitingForCovertAction)
					{
						base = XComGameState_RaiderBase(NewGameState.ModifyStateObject(class'XComGameState_RaiderBase', base.GetReference().ObjectID));
						base.bWaitingForCovertAction = true;
						break;
					}
				}
			}
		}		
		// Save the generated card to the Action so it can easily be retrieved later
		if (base != none && base.bWaitingForCovertAction)
		{
			ActionState.StoredRewardRef = base.GetReference();
		}

		RewardState.RewardObjectReference = AuxRef;
	}
	else
	{
		`RedScreen("@realitymachina Tried to generate raider base discovery reward for non-covert action");
	}
}

// discover base reward
static function X2DataTemplate CreateDiscoverBaseRewardTemplate()
{
	local X2RewardTemplate Template;

	`CREATE_X2Reward_TEMPLATE(Template, 'Reward_DiscoverRaiderBase');

	Template.IsRewardAvailableFn = IsDiscoverBaseAvailable;
	Template.GenerateRewardFn = GenerateDiscoverRaiderReward;
	Template.GiveRewardFn = GiveDiscoverBaseReward;
	Template.GetRewardStringFn = GetBaseRewardString;
	Template.GetRewardPreviewStringFn = GetBaseRewardString;
	Template.GetRewardDetailsStringFn = GetDiscoverRewardDetailsString;
	Template.CleanUpRewardFn = CleanupBaseReward;
	//Template.RewardPopupFn = MissionRewardPopup;

	return Template;
}

static function bool IsDiscoverBaseAvailable(optional XComGameState NewGameState, optional StateObjectReference AuxRef)
{
	local XComGameState_RaiderBaseManager BaseMgr;
	local array<XComGameState_RaiderBase> Bases;
	local XComGameState_RaiderBase base;
	local XComGameState_CovertAction ActionState;
	local XComGameStateHistory History;
	local XComGameState_Reward RewardState;
	local array<StateObjectReference> BaseRefs;
	local StateObjectReference		BaseRef;
	local int idx;
	History = `XCOMHistory;

	foreach History.IterateByClassType(class'XComGameState_CovertAction', ActionState)
	{
		if(ActionState.GetMyTemplateName() == 'CovertAction_FindRaiderBase' &&  !ActionState.bCompleted) //this is dumb but we have to account for this
		{
			for (idx = 0; idx < ActionState.RewardRefs.Length; idx++)
			{
				RewardState = XComGameState_Reward(History.GetGameStateForObjectID(ActionState.RewardRefs[idx].ObjectID));

				if (RewardState != none && RewardState.GetMyTemplateName() == 'Reward_DiscoverRaiderBase')
				{
					BaseRefs.AddItem(ActionState.StoredRewardRef);
				}
			}
		}
		
	}

	BaseMgr = class'XComGameState_RaiderBaseManager'.static.GetBaseManager();
	if(BaseMgr != none)
	{
		Bases = BaseMgr.GetAllBases();
		foreach Bases(base)
		{
			if(base.GetStatus() == eRB_Discovered && !base.bWaitingForCovertAction)
			{
				foreach BaseRefs(BaseRef)
				{
					if(base.GetReference().ObjectID == BaseRef.ObjectID)
					{
						continue; // skip if there's an already existing covert action that deals with this
					}
				}
				return true;
			}
		}
	}
	return false;
}

static function GiveDiscoverBaseReward(XComGameState NewGameState, XComGameState_Reward RewardState, optional StateObjectReference AuxRef, optional bool bOrder = false, optional int OrderHours = -1)
{
	local XComGameStateHistory History;
	local XComGameState_CovertAction ActionState;
	local XComGameState_RaiderBase BaseState;
	ActionState = XComGameState_CovertAction(NewGameState.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));
	History = `XCOMHISTORY;
	if(ActionState == none)
	{
		

		ActionState = XComGameState_CovertAction(History.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));
		BaseState = XComGameState_RaiderBase(History.GetGameStateForObjectID(ActionState.StoredRewardRef.ObjectID));
		
	}
	else
	{
		
		BaseState = XComGameState_RaiderBase(NewGameState.GetGameStateForObjectID(ActionState.StoredRewardRef.ObjectID));
	}

	if(BaseState == none)
	{
		BaseState = XComGameState_RaiderBase(History.GetGameStateForObjectID(ActionState.StoredRewardRef.ObjectID));
		
	}
	if(BaseState != none)
	{	
		`log("Base State discovered and being updated.");
		BaseState = XComGameState_RaiderBase(NewGameState.ModifyStateObject(class'XComGameState_RaiderBase', BaseState.GetReference().ObjectID));
		BaseState.bWaitingForCovertAction = false;
		BaseState.UpdateStatus(eRB_ReadyToAssault);
	}
	else
	{
		`log("ERROR: BASE STATE UNABLE TO BE FOUND FOR COVERT ACTION TO FIND IT");
	}
}

static function GenerateDiscoverRaiderReward(XComGameState_Reward RewardState, XComGameState NewGameState, optional float RewardScalar = 1.0, optional StateObjectReference AuxRef)
{
	local XComGameState_CovertAction ActionState;
	local XComGameState_RaiderBaseManager BaseMgr;
	local array<XComGameState_RaiderBase> Bases;
	local XComGameState_RaiderBase base;
	local XComGameState_WorldRegion RegionState;

	ActionState = XComGameState_CovertAction(NewGameState.GetGameStateForObjectID(AuxRef.ObjectID));
	if (ActionState != none)
	{
		// so if we got here, this means that we know there's at least one base in the given continent that we can use for this
		// we need to save two things: our action state and the base we pick: we store our reference to the base in the action state
		BaseMgr = class'XComGameState_RaiderBaseManager'.static.GetBaseManager();
		if(BaseMgr != none)
		{
			RegionState = XComGameState_WorldRegion(`XCOMHISTORY.GetGameStateForObjectID(ActionState.LocationEntity.ObjectID));
			Bases = BaseMgr.GetBasesForContinent(RegionState.GetContinent());
			if (Bases.Length > 0)
			{
				foreach Bases(base)
				{	
					if(base.GetStatus() == eRB_Discovered && !base.bWaitingForCovertAction)
					{
						base = XComGameState_RaiderBase(NewGameState.ModifyStateObject(class'XComGameState_RaiderBase', base.GetReference().ObjectID));
						base.bWaitingForCovertAction = true;
						break;
					}

				}
			}
			else // get from anywhere in the world
			{
				Bases = BaseMgr.GetAllBases();
				foreach Bases(base)
				{
					if(base.GetStatus() == eRB_ReadyToAssault && !base.bWaitingForCovertAction)
					{
						base = XComGameState_RaiderBase(NewGameState.ModifyStateObject(class'XComGameState_RaiderBase', base.GetReference().ObjectID));
						base.bWaitingForCovertAction = true;
						break;
					}
				}
			}			
		}		
		// Save the generated card to the Action so it can easily be retrieved later
		if (base != none && base.bWaitingForCovertAction)
		{
			ActionState.StoredRewardRef = base.GetReference();
		}

		RewardState.RewardObjectReference = AuxRef;
	}
	else
	{
		`RedScreen("@realitymachina Tried to generate raider base discovery reward for non-covert action");
	}
}

// shared functions
static function string GetBaseRewardString(XComGameState_Reward RewardState)
{
	local XComGameStateHistory History;
	local XComGameState_CovertAction ActionState;
	local XComGameState_RaiderBase BaseState;

	History = `XCOMHISTORY;
	ActionState = XComGameState_CovertAction(History.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));
	BaseState = XComGameState_RaiderBase(History.GetGameStateForObjectID(ActionState.StoredRewardRef.ObjectID));
	
	return BaseState.GetDisplayName();
}

static function string GetActionRewardDetailsString(XComGameState_Reward RewardState)
{
	local XComGameStateHistory History;
	local XComGameState_CovertAction ActionState;
	local XComGameState_RaiderBase BaseState;
	local XGParamTag kTag;

	History = `XCOMHISTORY;
	ActionState = XComGameState_CovertAction(History.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));
	BaseState = XComGameState_RaiderBase(History.GetGameStateForObjectID(ActionState.StoredRewardRef.ObjectID));
	
	if(BaseState != none)
	{
		kTag = XGParamTag(`XEXPANDCONTEXT.FindTag("XGParam"));
		kTag.StrValue0 = BaseState.GetDisplayName();

		return `XEXPAND.ExpandString(default.m_strActionText); // check where this appears
	}
	return default.m_strActionText;
}

static function string GetDiscoverRewardDetailsString(XComGameState_Reward RewardState)
{
	local XComGameStateHistory History;
	local XComGameState_CovertAction ActionState;
	local XComGameState_RaiderBase BaseState;
	local XGParamTag kTag;

	History = `XCOMHISTORY;
	ActionState = XComGameState_CovertAction(History.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));
	BaseState = XComGameState_RaiderBase(History.GetGameStateForObjectID(ActionState.StoredRewardRef.ObjectID));
	if(BaseState != none)
	{
		kTag = XGParamTag(`XEXPANDCONTEXT.FindTag("XGParam"));
		kTag.StrValue0 = BaseState.GetDisplayName();

		return `XEXPAND.ExpandString(default.m_strDiscoveryText); // check where this appears
	}	
	return default.m_strDiscoveryText; // check where this appears
}


static function CleanupBaseReward(XComGameState NewGameState, XComGameState_Reward RewardState)
{
	local XComGameStateHistory History;
	local XComGameState_CovertAction ActionState;
	local XComGameState_RaiderBase BaseState;
	ActionState = XComGameState_CovertAction(NewGameState.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));
	BaseState = XComGameState_RaiderBase(NewGameState.GetGameStateForObjectID(ActionState.StoredRewardRef.ObjectID));
	if(BaseState == none)
	{
		History = `XCOMHISTORY;

		ActionState = XComGameState_CovertAction(History.GetGameStateForObjectID(RewardState.RewardObjectReference.ObjectID));
		BaseState = XComGameState_RaiderBase(History.GetGameStateForObjectID(ActionState.StoredRewardRef.ObjectID));
	}
	
	if(BaseState != none)
	{
		BaseState = XComGameState_RaiderBase(NewGameState.ModifyStateObject(class'XComGameState_RaiderBase', BaseState.GetReference().ObjectID));
		BaseState.bWaitingForCovertAction = false;
	}
}