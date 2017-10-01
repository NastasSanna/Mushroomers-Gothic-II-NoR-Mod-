
instance VLK_484_Lehmar(Npc_Default)
{
	name[0] = "Лемар";
	guild = GIL_VLK;
	id = 484;
	voice = 5;//12;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	aivar[AIV_IgnoreFlags] = IGNORE_PortalRoom_Public;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItWr_Schuldenbuch,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Whistler,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_484;
	aivar[AIV_TheftDex] = 20;
};


func void Rtn_Start_484()
{
	TA_Sit_Throne(6,30,0,30,"NW_CITY_HABOUR_HUT_08_IN_C");
	TA_Sleep(0,30,6,30,"NW_CITY_HABOUR_HUT_08_BED_02");
};

func void Rtn_Wait_484()
{
	TA_Sit_Throne(6,30,7,15,"NW_CITY_HABOUR_HUT_08_IN_C");
	TA_Stand_ArmsCrossed(7,15,20,30,"NW_CITY_HABOUR_POOR_AREA_PATH_20");
	TA_Sit_Throne(20,35,0,30,"NW_CITY_HABOUR_HUT_08_IN_C");
	TA_Sleep(0,30,6,30,"NW_CITY_HABOUR_HUT_08_BED_02");
};

func void Rtn_Tot_484()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};

