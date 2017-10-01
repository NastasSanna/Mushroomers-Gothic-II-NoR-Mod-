
instance BAU_955_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	guild = GIL_BAU2;
	id = 955;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal06,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_955;
};


func void Rtn_Start_955()
{
	TA_Rake_FP(8,01,12,10,"NW_FARM1_FIELD_07");
	TA_Rake_FP(12,10,16,22,"NW_FARM1_FIELD_02");
	TA_Pick_FP(16,22,17,10,"NW_FARM1_FIELD_07");
	TA_Rake_FP(17,10,22,02,"NW_FARM1_FIELD_02");
	TA_Sit_Campfire(22,02,8,01,"NW_FARM1_MILL_05");
};


