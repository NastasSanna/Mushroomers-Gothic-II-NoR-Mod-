
instance BAU_907_Wasili(Npc_Default)
{
	name[0] = "Василий";
	guild = GIL_BAU;
	id = 907;
	voice = 24;//1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart02,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_907;
	aivar[AIV_TheftDex] = 55;
	CreateInvItems(self, ItMi_Gold, 90);
};


func void Rtn_Start_907()
{
	TA_Stand_Guarding(7,55,19,35,"NW_BIGFARM_HOUSE_09");
	TA_Stand_Guarding(19,35,22,5,"NW_BIGFARM_HOUSE_16");
	TA_Silenttalk(22,5,23,15,"NW_BIGFARM_HOUSE_16");
	TA_Sit_Chair(23,15,1,0,"NW_BIGFARM_HOUSE_16");
	TA_Sleep(1,0,4,30,"NW_BIGFARM_HOUSE_15");
	TA_Sit_Chair(4,30,7,55,"NW_BIGFARM_HOUSE_16");
};

