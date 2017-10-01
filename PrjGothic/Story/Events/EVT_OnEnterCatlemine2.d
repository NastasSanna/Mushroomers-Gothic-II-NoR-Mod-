
var int OnEnterCastleMine2_Once;
func void EVT_ONENTERCASTLEMINE2_S1()
{
//	MEM_Debug("EVT_ONENTERCASTLEMINE2_S1");
	if (OnEnterCastleMine2_Once == FALSE)	{
		Wld_InsertNpc(Giant_Rat_MineFlee,"NW_CASTLEMINE2_IN_01");
		B_StartOtherRoutine(self,"DEATHFLEE");
		Wld_InsertNpc(Giant_Rat_MineFlee,"NW_CASTLEMINE2_IN_01");
		B_StartOtherRoutine(self,"DEATHFLEE");
		Wld_InsertNpc(Giant_Rat_MineFlee,"NW_CASTLEMINE2_IN_01");
		B_StartOtherRoutine(self,"DEATHFLEE");
		Wld_InsertNpc(Giant_Rat_MineFlee,"NW_CASTLEMINE2_IN_02");
		B_StartOtherRoutine(self,"DEATHFLEE");
		Wld_InsertNpc(Giant_Rat_MineFlee,"NW_CASTLEMINE2_IN_02");
		B_StartOtherRoutine(self,"DEATHFLEE");
		OnEnterCastleMine2_Once = TRUE;
	};
};


var int OnOutCastleMine2_Once;
func void EVT_ONOUTCASTLEMINE2_FUNC()
{
//	MEM_Debug("EVT_ONOUTCASTLEMINE2_FUNC");
	if (OnOutCastleMine2_Once == FALSE)	{
		Snd_Play("SKE_DIE");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_CASTLEMINE2_03");
		Wld_InsertNpc(Skeleton,"FP_ROAM_CASTLEMINE2_04");
		Wld_InsertNpc(Skeleton,"FP_ROAM_CASTLEMINE2_05");
		
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_CASTLEMINE2_01");
		Wld_InsertNpc(Skeleton,"FP_ROAM_CASTLEMINE2_02");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_CASTLEMINE2_12");
		
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_CASTLEMINE2_10");
		
		OnOutCastleMine2_Once = TRUE;
	};
};

