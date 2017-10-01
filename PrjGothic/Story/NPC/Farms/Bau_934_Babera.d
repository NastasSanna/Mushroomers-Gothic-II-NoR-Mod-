
instance BAU_934_Babera(Npc_Default)
{
	name[0] = "Бабера";
	guild = GIL_BAU;
	id = 934;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabe_N_BauBlonde,BodyTexBabe_N,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_934;
	aivar[AIV_TheftDex] = 20;
	CreateInvItems(self, ItMi_Gold, 30);
};


func void Rtn_Start_934()
{
	TA_Pick_FP(8,5,22,0,"NW_FARM4_FIELD_02_A");
	TA_Sit_Campfire(22,0,8,5,"NW_FARM4_REST_02");
};


