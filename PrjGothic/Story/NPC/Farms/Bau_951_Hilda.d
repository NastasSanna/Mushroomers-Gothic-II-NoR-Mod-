
instance BAU_951_Hilda(Npc_Default)
{
	name[0] = "Хильда";
	guild = GIL_BAU2;
	id = 951;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_WhiteCloth,BodyTexBabe_N,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_951;
	aivar[AIV_TheftDex] = 26;
	CreateInvItems(self, ItMi_Gold, 35);
};


func void Rtn_Start_951()
{
	TA_Cook_Stove(7,25,10,0,"NW_FARM1_INHOUSE_02");
	TA_Pray_Innos_FP(10,0,12,0,"NW_FARM1_PATH_CITY_INNOS");
	TA_Cook_Stove(12,0,15,0,"NW_FARM1_INHOUSE_02");
	TA_Stand_Sweeping(15,0,16,0,"NW_FARM1_INHOUSE_02");
	TA_Stand_Sweeping(16,0,17,0,"NW_FARM1_INHOUSE_01");
	TA_Stand_Sweeping(17,0,18,0,"NW_FARM1_INHOUSE_03");
	TA_Cook_Stove(18,0,20,0,"NW_FARM1_INHOUSE_02");
	TA_Cook_Stove(20,0,22,15,"NW_FARM1_INHOUSE_02");
	TA_Sleep(22,15,7,25,"NW_FARM1_INHOUSE_BED_02");
};


