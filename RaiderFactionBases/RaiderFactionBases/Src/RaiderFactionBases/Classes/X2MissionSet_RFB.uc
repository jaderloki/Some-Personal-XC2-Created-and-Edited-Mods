
class X2MissionSet_RFB extends X2MissionSet config(GameCore);

static function array<X2DataTemplate> CreateTemplates()
{
    local array<X2MissionTemplate> Templates;

        // Data Retrieval
        Templates.AddItem(AddMissionTemplate('RM_CovertOp_DataRetrieval'));
        
		// Sweep
		Templates.AddItem(AddMissionTemplate('RM_CovertOp_BaseTakedown'));

		// Multi Objective
		Templates.AddItem(AddMissionTemplate('RM_CovertOp_Datamine'));

    return Templates;
}