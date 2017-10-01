
instance VLK_4941_Thug(Npc_Default)
{
	name[0] = "Громила";
	guild = GIL_None;
	id = 4941;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Tough_Pacho,BodyTex_B,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,55);
	daily_routine = Rtn_Start_4941;
	aivar[AIV_TheftDex] = 55;
};


func void Rtn_Start_4941()
{
	TA_Stand_WP(6,10,10,3,"NW_CITY_HABOUR_POOR_AREA_PATH_19");
	TA_Stand_WP(10,3,11,14,"NW_CITY_HABOUR_POOR_AREA_PATH_12");
	TA_Stand_WP(11,14,13,27,"NW_CITY_HABOUR_POOR_AREA_PATH_19");
	TA_Stand_WP(13,27,14,16,"NW_CITY_HABOUR_POOR_AREA_PATH_12");
	TA_Stand_WP(14,16,18,42,"NW_CITY_HABOUR_POOR_AREA_PATH_19");
	TA_Stand_WP(18,42,20,1,"NW_CITY_HABOUR_POOR_AREA_PATH_12");
	TA_Stand_WP(20,1,4,2,"NW_CITY_HABOUR_POOR_AREA_PATH_19");
	TA_Stand_WP(4,2,6,10,"NW_CITY_HABOUR_POOR_AREA_PATH_12");
};

func void Rtn_TOT_4941()
{
	TA_Stand_WP(6,0,22,0,"TOT");
	TA_Stand_WP(22,0,6,0,"TOT");
};

