
instance BAU_941_Kati(Npc_Default)
{
	name[0] = "Кати";
	guild = GIL_BAU2;
	id = 941;
	voice = 18;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_Lilo,BodyTexBabe_N,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_941;
	aivar[AIV_TheftDex] = 13;
	CreateInvItems(self, ItMi_Gold, 15);
};


func void Rtn_Start_941()
{
	TA_Cook_Stove(5,0,10,0,"NW_FARM2_HOUSE_IN_04");
	TA_Sit_Bench(10,0,12,0,"NW_FARM2_BENCH_02");
	TA_Cook_Stove(12,0,22,55,"NW_FARM2_HOUSE_IN_04");
	TA_Sleep(22,55,5,0,"NW_FARM2_HOUSE_IN_02");
};

