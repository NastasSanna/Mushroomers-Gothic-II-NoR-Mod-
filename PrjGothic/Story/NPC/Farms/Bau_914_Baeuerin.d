
instance BAU_914_Baeuerin(Npc_Default)
{
	name[0] = NAME_Magd;
	name[1] = "Жанна";
	guild = GIL_BAU;
	id = 914;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabe_N_BlackHair,BodyTexBabe_N,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_914;
};


func void Rtn_Start_914()
{
	TA_Stand_Sweeping(6,30,7,0,"NW_BIGFARM_HOUSE_03");
	TA_Stand_Sweeping(7,0,7,20,"NW_BIGFARM_HOUSE_02");
	TA_Stand_Sweeping(7,20,8,15,"NW_BIGFARM_HOUSE_10");
	TA_Cook_Stove(8,15,20,0,"NW_BIGFARM_HOUSE_UP1_COOK");
	TA_Stand_Eating(20,0,22,0,"NW_BIGFARM_PATH_HODGES");
	TA_Sleep(22,0,6,30,"NW_BIGFARM_HOUSE_UP2_BED_02");
};

