class SeqAct_GetCovertOp extends SequenceAction;

var XComGameState_Unit Unit;

event Activated()
{
	local XComGameStateHistory History;
	local UnitValue SoldierValue;
	History = `XCOMHISTORY;


	foreach History.IterateByClassType(class'XComGameState_Unit', Unit)
	{
		if(Unit.GetUnitValue('IsCovertOp', SoldierValue))
		{
			if(SoldierValue.fValue > 0)
				return;
		}
	}

	// no such unit template was found
	`Redscreen("SeqAct_GetCovertOp: Could not find a unit that was a covert operative");
	Unit = none;
}

static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

defaultproperties
{
	ObjName="Get Covert Operative"
	ObjCategory="Unit"
	bCallHandler=false
	bAutoActivateOutputLinks=true

	bConvertedForReplaySystem=true
	bCanBeUsedForGameplaySequence=true

	VariableLinks.Empty;
	VariableLinks(0)=(ExpectedType=class'SeqVar_String',LinkDesc="Template",PropertyName=CharacterTemplateNameString)
	VariableLinks(1)=(ExpectedType=class'SeqVar_GameUnit',LinkDesc="Unit",PropertyName=Unit,bWriteable=true)
}