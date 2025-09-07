class X2Action_DecoyBeaconVFX extends X2Action;

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
	ApplyMITV("SavDecoyBeacon.M_Decoy_Hologram_Main_MITV");
	Sleep(0.5f);

	CompleteAction();
}
