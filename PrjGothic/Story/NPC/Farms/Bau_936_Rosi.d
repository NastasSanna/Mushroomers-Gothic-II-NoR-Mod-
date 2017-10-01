// DONE
instance BAU_936_Rosi(Npc_Default)
{
	name[0] = "Рози";
	name[1] = "Мама";	//Тилл
	guild = GIL_BAU;
	id = 936;
	voice = 19;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_Hure,BodyTexBabe_N,ITAR_BauBabe_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_936;
	aivar[AIV_TheftDex] = 30;
	CreateInvItems(self, ItMi_Gold, 75);
};


func void Rtn_PreStart_936()
{
	TA_Stand_WP(8,0,22,0,"NW_FARM4_IN_03");
	TA_Stand_WP(22,0,8,0,"NW_FARM4_IN_03");
};

func void Rtn_Start_936()
{
	TA_Cook_Stove(6,0,12,0,"NW_FARM4_ROSI");
	TA_Stand_Sweeping(12,0,12,30,"NW_FARM4_ROSI");
	TA_Stand_Sweeping(12,30,13,0,"NW_FARM4_IN_06");
	TA_Stand_Sweeping(13,0,13,30,"NW_FARM4_IN_04");
	TA_Stand_Sweeping(13,30,14,0,"NW_FARM4_IN_03");
	TA_Cook_Stove(16,0,19,0,"NW_FARM4_ROSI");
	TA_Sweep_FP(19,0,19,30,"NW_FARM4_IN_06");
	TA_Sweep_FP(19,30,20,0,"NW_FARM4_IN_04");
	TA_Sweep_FP(20,0,20,30,"NW_FARM4_IN_03");
	TA_Sweep_FP(20,30,21,0,"NW_FARM4_IN_02");
	TA_Cook_Stove(21,0,22,5,"NW_FARM4_ROSI");
	TA_Sleep(22,5,6,0,"NW_FARM4_IN_02");
};

