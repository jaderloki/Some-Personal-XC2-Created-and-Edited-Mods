class XComGameState_MissionSiteRaiderAmbush extends XComGameState_MissionSiteChosenAmbush;

function bool RequiresAvenger()
{
	// skyranger travel times may be too long
	return false;
}


function SelectSquad()
{
	local XGStrategy StrategyGame;
	
	BeginInteraction();
	
	StrategyGame = `GAME;
	StrategyGame.PrepareTacticalBattle(ObjectID);


	`HQPRES.UISquadSelect(true);
}



function StartMission()
{
	// for now, nothing
}

// we go here after squad select, since our risk missions will have the Avenger travel
function ConfirmMission()
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local XGStrategy StrategyGame;
	local XComGameState NewGameState;
	local XComGameState_CovertAction ActionState;
	local XComGameState_StaffSlot SlotState;
	local array<StateObjectReference> MissionSoldiers;
	local XComGameState_Unit SoldierState;
	local int idx, i;
	History = `XCOMHISTORY;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Launch Mission Selected");
	ActionState = XComGameState_CovertAction(History.GetGameStateForObjectID(CovertActionRef.ObjectID));
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	for (idx = 0; idx < ActionState.StaffSlots.Length; idx++)
	{
		// If the Covert Action has a soldier in one of its staff slots, add them to the Ambush soldier list
			SlotState = ActionState.GetStaffSlot(idx);
			if (SlotState != none && SlotState.IsSoldierSlot() && SlotState.IsSlotFilled())
			{
				MissionSoldiers.AddItem(SlotState.GetAssignedStaffRef());
				SoldierState = SlotState.GetAssignedStaff();
				if(SoldierState != none)
				{
					SoldierState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', SoldierState.ObjectID));
					SoldierState.SetUnitFloatValue('IsCovertOp', 1, eCleanup_Never);
				}
			}

		
	}
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	for (idx = 0; idx < MissionSoldiers.Length; idx++)
	{
		XComHQ.Squad.AddItem(MissionSoldiers[idx]);

	}
	`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);


	StrategyGame = `GAME;

	if(StrategyGame.SimCombatNextMission)
	{
		StrategyGame.SimCombatNextMission = false;
		`HQPRES.m_bExitFromSimCombat = true;
		`HQPRES.ExitStrategyMap();
		class'X2StrategyGame_SimCombat'.static.SimCombat();
	}
	else
	{
		// Launch this Mission!
		StrategyGame.LaunchTacticalBattle(ObjectID);
	}
}


function string GetUIButtonIcon()
{
		return "img:///UILibrary_XPACK_Common.MissionIcon_SupplyExtraction";

}