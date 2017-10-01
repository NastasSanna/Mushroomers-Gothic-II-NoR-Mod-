
instance VLK_411_Gaertner(Npc_Default)
{
	name[0] = "Садовник";
	guild = GIL_VLK;
	id = 411;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_NormalBart_Graham,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_411;
	aivar[AIV_TheftDex] = 40;
	CreateInvItems(self, ItMi_Gold, 50);
};


func void Rtn_Start_411()
{
	TA_Rake_FP(7,30,8,30,"NW_CITY_CITYHALL_04");
	TA_Stand_Eating(8,30,9,30,"NW_CITY_CITYHALL_10");
	TA_Rake_FP(9,30,10,30,"NW_CITY_CITYHALL_10");
	TA_Stand_Eating(10,30,11,30,"NW_CITY_CITYHALL_12");
	TA_Rake_FP(11,30,12,30,"NW_CITY_CITYHALL_12");
	TA_Stand_Eating(12,30,13,30,"NW_CITY_CITYHALL_07");
	TA_Rake_FP(13,30,14,30,"NW_CITY_CITYHALL_07");
	TA_Rake_FP(14,30,16,30,"NW_CITY_CITYHALL_10");
	TA_Stand_Eating(16,30,17,30,"NW_CITY_CITYHALL_12");
	TA_Rake_FP(17,30,18,30,"NW_CITY_CITYHALL_12");
	TA_Smoke_Joint(18,30,19,30,"NW_CITY_CITYHALL_07");
	TA_Rake_FP(19,30,20,30,"NW_CITY_CITYHALL_07");
	TA_Rake_FP(20,30,21,0,"NW_CITY_CITYHALL_04");
	TA_Smoke_Joint(21,0,22,0,"NW_CITY_CITYHALL_04_B");
	TA_Sit_Campfire(22,0,7,30,"NW_CITY_CITYHALL_04_B");
};

