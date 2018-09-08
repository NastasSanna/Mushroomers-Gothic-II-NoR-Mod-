
instance VLK_417_Constantino(Npc_Default)
{
	name[0] = "Константино";
	guild = GIL_VLK;
	id = 417;
	voice = 4;//12;
	npcType = npctype_main;
	flags = NPC_FLAG_IMMORTAL;
	aivar[AIV_IgnoreFlags] = IGNORE_PortalRoom_Public;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic.",Face_N_OldBald_Jeremiah,BodyTex_N,ITAR_Smith);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_417;
	aivar[AIV_TheftDex] = 59;
	CreateInvItems(self, ItMi_Gold, 90);
};


func void Rtn_Start_417()
{
	TA_Potion_Alchemy(8,0,17,45,"NW_CITY_ALCHEMY_VELAX");
	TA_Smalltalk(17,45,20,50,"NW_CITY_ALCHEMY_VELAX");
	TA_Read_Bookstand(20,50,22,0,"NW_CITY_BOOK_VELAX");
	TA_Sleep(22,0,8,0,"NW_CITY_BED_VELAX");
};
func void Rtn_DayS_417()
{
	TA_Smalltalk(8,0,12,0,"NW_CITY_ALCHEMY_VELAX");
	TA_Potion_Alchemy(12,0,13,20,"NW_CITY_ALCHEMY_VELAX");
	TA_Smalltalk(13,20,16,17,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Potion_Alchemy(16,17,20,0,"NW_CITY_ALCHEMY_VELAX");
	TA_Read_Bookstand(20,0,22,0,"NW_CITY_BOOK_VELAX");
	TA_Sleep(22,0,8,0,"NW_CITY_BED_VELAX");
};
func void Rtn_TOT_417()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};

