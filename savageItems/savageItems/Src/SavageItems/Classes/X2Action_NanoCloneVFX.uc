class X2Action_NanoCloneVFX extends X2Action;

event bool BlocksAbilityActivation()
{
	return false;
}

function Init()
{
	super.Init();
}

simulated function ApplyMITV(String MITVPath)
{
	local MaterialInstanceTimeVarying	MITV;

	MITV = MaterialInstanceTimeVarying(DynamicLoadObject(MITVPath, class'MaterialInstanceTimeVarying'));
	UnitPawn.ApplyMITV(MITV);
}

simulated state Executing
{
	
Begin:
	ApplyMITV("SavNanoWarfare.M_NanoCloneSkin_MITV");
	Sleep(0.5f);

	CompleteAction();
}