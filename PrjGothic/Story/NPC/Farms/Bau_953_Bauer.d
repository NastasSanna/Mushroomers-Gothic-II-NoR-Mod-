
instance BAU_953_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	guild = GIL_BAU2;
	id = 953;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart04,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_953;
};


func void Rtn_Start_953()
{
	TA_Rake_FP(8,3,13,5,"NW_FARM1_FIELD_03");
	TA_Pick_FP(13,5,14,15,"NW_FARM1_FIELD_06");
	TA_Rake_FP(14,15,18,7,"NW_FARM1_FIELD_03");
	TA_Rake_FP(18,7,21,50,"NW_FARM1_FIELD_06");
	TA_Sit_Campfire(21,50,8,3,"NW_FARM1_MILL_05");
};


