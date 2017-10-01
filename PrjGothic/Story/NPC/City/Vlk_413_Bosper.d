
instance VLK_413_Bosper(Npc_Default)
{
	name[0] = "Боспер";
	guild = GIL_VLK;
	id = 413;
	voice = 20;//11;
	npcType = npctype_main;
	aivar[AIV_IgnoreFlags] = IGNORE_PortalRoom_Public;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	EquipItem(self,ItRw_Sld_Bow);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald.",Face_L_Tough_Santino,BodyTex_L,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0.8);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_413;
	aivar[AIV_TheftDex] = 67;
	CreateInvItems(self, ItMi_Gold, 120);
};


func void Rtn_Start_413()
{
	TA_Stand_Guarding(5,0,0,0,"NW_CITY_MERCHANT_SHOP01_IN_02");
	TA_Sleep(0,0,5,0,"NW_CITY_BED_BOSPER");
};
func void Rtn_TOT_413()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};

