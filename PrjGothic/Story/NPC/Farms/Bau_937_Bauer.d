
instance BAU_937_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	guild = GIL_BAU;
	id = 937;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Weak05,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = Rtn_Start_937;
};


func void Rtn_Start_937()
{
	TA_Rake_FP(8,2,22,0,"NW_FARM4_FIELD_02_A");
	TA_Sit_Campfire(22,0,8,2,"NW_FARM4_REST_01");
};


