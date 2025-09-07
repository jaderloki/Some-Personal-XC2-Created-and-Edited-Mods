class SeqAct_IsUnitCovertOp extends SequenceAction;

var XComGameState_Unit Unit;

event Activated()
{
	local UnitValue SoldierValue;
	local float value;
	if(Unit == none)
	{
		`Redscreen("Warning: SeqAct_IsUnitCovertOp was called without specifying a unit.");
		OutputLinks[0].bHasImpulse = false;
		OutputLinks[1].bHasImpulse = true;
		return;
	}

	if(Unit.IsSoldier())
	{
		if(Unit.GetUnitValue('IsCovertOp', SoldierValue))
		{
			value = SoldierValue.fValue;
		}
		else
		{
			value = 0;
		}
	}

	OutputLinks[0].bHasImpulse = value > 0; // 1 means this is our covert op
	OutputLinks[1].bHasImpulse = !OutputLinks[0].bHasImpulse;
}

defaultproperties
{
	ObjName="Is Unit Covert Op"
	ObjCategory="Unit"
	bCallHandler=false

	bConvertedForReplaySystem=true
	bCanBeUsedForGameplaySequence=true

	OutputLinks(0)=(LinkDesc="Yes")
	OutputLinks(1)=(LinkDesc="No")

	VariableLinks(0)=(ExpectedType=class'SeqVar_GameUnit', LinkDesc="Unit", PropertyName=Unit)
}