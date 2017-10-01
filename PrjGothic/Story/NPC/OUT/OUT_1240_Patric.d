
instance OUT_1240_Patric(Npc_Default)
{
	name[0] = "Патрик";
	guild = GIL_OUT;
	id = 1240;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride | TEMPER_BodyGuard;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_NORMAL;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Normal_Fletcher,BodyTex_P,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Guard_1240;
};

func void Rtn_Guard_1240()
{
	TA_Stand_Eating(5,10,5,30,"NW_BIGFARM_HUT_BENCH");
	TA_GuardNpc(5,30,5,32,"NW_BIGFARM_ALLEE_10");
	TA_GuardNpc(5,32,5,34,"NW_BIGFARM_LAKE_01");
	TA_GuardNpc(5,34,5,37,"NW_BIGFARM_LAKE_02");
	TA_GuardNpc(5,37,5,40,"NW_BIGFARM_LAKE_03");
	TA_GuardNpc(5,40,5,42,"NW_BIGFARM_LAKE_04");
	TA_GuardNpc(5,42,5,44,"NW_BIGFARM_LAKE_05");
	TA_GuardNpc(5,44,5,46,"NW_BIGFARM_LAKE_06");
	TA_GuardNpc(5,46,5,48,"NW_BIGFARM_LAKE_07");
	TA_GuardNpc(5,48,5,50,"NW_BIGFARM_LAKE_08");
	TA_GuardNpc(5,50,5,52,"NW_BIGFARM_LAKE_09");
	TA_GuardNpc(5,52,5,54,"NW_TAVERNE_BIGFARM_05");
	TA_GuardNpc(5,54,5,56,"NW_TAVERNE_BIGFARM_05");
	TA_GuardNpc(5,56,5,58,"NW_TAVERNE_BIGFARM_04");
	TA_GuardNpc(5,58,6,0,"NW_TAVERNE_04");
	TA_GuardNpc(6,0,6,2,"NW_TAVERNE_05");
	TA_GuardNpc(6,2,6,5,"NW_TAVERNE_06");
	TA_GuardNpc(6,5,6,10,"NW_FOREST_CROSS_MONASTERY");
	TA_GuardNpc(6,10,6,15,"NW_TAVERN_TO_FOREST_03");
	TA_GuardNpc(6,15,6,22,"NW_CITY_TO_FOREST_17");
	TA_GuardNpc(6,22,6,25,"NW_CITY_TO_FARM2_04");
	TA_GuardNpc(6,25,6,30,"NW_FOREST_PATH_02");
	TA_GuardNpc(6,30,9,0,"NW_FOREST_PATH_05");
	TA_GuardNpc(9,0,11,0,"NW_FOREST_PATH_54");
	TA_GuardNpc(11,0,11,30,"NW_FOREST_PATH_66");
	TA_GuardNpc(11,30,13,0,"NW_TROLLAREA_RITUALFOREST_01");
	TA_GuardNpc(13,0,14,30,"NW_TROLLAREA_PATH_72");
	TA_GuardNpc(14,30,16,0,"NW_TROLLAREA_PATH_13");
	TA_GuardNpc(16,0,17,0,"NW_TROLLAREA_RUINS_15");
	TA_GuardNpc(17,0,19,0,"NW_TROLLAREA_PATH_50");
	TA_GuardNpc(19,0,19,10,"NW_TROLLAREA_PATH_57");
	TA_GuardNpc(19,10,19,15,"NW_TROLLAREA_PATH_60");
	TA_GuardNpc(19,15,19,20,"NW_TROLLAREA_PATH_62");
	TA_GuardNpc(19,20,19,25,"NW_TROLLAREA_PATH_66");
	TA_GuardNpc(19,25,19,30,"NW_TAVERNE_TROLLAREA_13");
	TA_GuardNpc(19,30,19,35,"NW_TT_ADD_01");
	TA_GuardNpc(19,35,19,40,"NW_TAVERNE_TROLLAREA_08");
	TA_GuardNpc(19,40,19,45,"NW_TAVERNE_TROLLAREA_04");
	TA_GuardNpc(19,45,19,48,"NW_CITY_ENTRANCE_BACK");
	TA_GuardNpc(19,48,20,50,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Sit_Bench(20,50,5,10,"NW_BIGFARM_HUT_BENCH_02");
};

func void Rtn_After_1240()
{
	TA_Stand_Eating(8,10,9,30,"NW_BIGFARM_HUT_BENCH");
	TA_Stand_Sweeping(9,30,14,30,"NW_BIGFARM_HUTINSIDE");
	TA_Stand_Eating(14,30,16,30,"NW_BIGFARM_HUT_BENCH");
	TA_Sit_Bench(16,30,8,10,"NW_BIGFARM_HUT_BENCH_02");
};
