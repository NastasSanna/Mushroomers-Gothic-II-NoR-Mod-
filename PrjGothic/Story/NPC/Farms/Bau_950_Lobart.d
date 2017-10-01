
instance BAU_950_Lobart(Npc_Default)
{
	name[0] = "Лобарт";
	guild = GIL_BAU2;
	id = 950;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_IgnoreFlags] = IGNORE_PortalRoom_Public;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Senyan,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_950;
	aivar[AIV_TheftDex] = 65;
	CreateInvItems(self, ItMi_Gold, 80);
};


func void Rtn_Start_950()
{
	TA_Stand_Guarding(8,1,10,0,"NW_FARM1_LOBART");
	TA_Stand_Guarding(10,0,16,0,"NW_FARM1_FIELD_01");
	TA_Stand_Guarding(16,0,19,0,"NW_FARM1_LOBART");
	TA_Sit_Throne(19,0,20,0,"NW_FARM1_INHOUSE_03_SIT");
	TA_Sit_Throne(20,0,22,0,"NW_FARM1_INHOUSE_03_SIT");
	TA_Sleep(22,0,8,1,"NW_FARM1_INHOUSE_BED_01");
};
