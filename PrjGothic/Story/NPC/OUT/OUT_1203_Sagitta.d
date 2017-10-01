
instance OUT_1203_Sagitta(Npc_Default)
{
	name[0] = "Сагитта";
	guild = GIL_NONE;
	id = 1203;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabe_N_PinkHair,BodyTexBabe_N,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_1203;
	aivar[AIV_TheftDex] = 103;
	CreateInvItems(self, ItMi_Gold, 360);
};


func void Rtn_Start_1203()
{
	TA_Sit_Throne(6,0,8,0,"NW_SAGITTA_CAVE_IN_02");
	TA_Potion_Alchemy(8,0,12,0,"NW_SAGITTA_CAVE_IN_03");
	TA_Sit_Throne(16,0,20,0,"NW_SAGITTA_CAVE_IN_02");
	TA_Potion_Alchemy(20,0,2,0,"NW_SAGITTA_CAVE_IN_03");
	TA_Sleep(2,0,6,0,"NW_SAGITTA_CAVE_IN_BED");
};

func void Rtn_ToCross_1203()
{
	TA_Stand_WP(8,0,23,0,"NW_SAGITTA_CAVE_08");
	TA_Stand_WP(23,0,8,0,"NW_SAGITTA_CAVE_08");
};

