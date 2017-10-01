
instance VLK_425_Regis(Npc_Default)
{
	name[0] = "Регис";
	guild = GIL_VLK;
	id = 425;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Mordrag,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_425;
	aivar[AIV_TheftDex] = 40;
	CreateInvItems(self, ItMi_Gold, 35);
};


func void Rtn_preStart_425()
{
	TA_Stand_WP(7,0,22,0,"TAVERN02_B");
	TA_Stand_WP(22,0,7,0,"TAVERN02_B");
};
func void Rtn_Start_425()
{
	TA_Silenttalk(5,30,7,0,"NW_CITY_HABOUR_12");	//Джо
	TA_Stand_Eating(7,0,8,20,"NW_CITY_HABOUR_02_B");
	TA_Smalltalk(8,20,9,15,"NW_CITY_TAVERN_IN_06");	//Руперт (или никого)
	TA_Smalltalk(9,15,10,20,"NW_CITY_TAVERN_IN_06");	//Корагон
	TA_Stand_Drinking(10,20,11,0,"NW_CITY_TAVERN_IN_07");
	TA_Sit_Bench(11,0,14,0,"NW_CITY_REGIS");
	TA_Smalltalk(14,0,15,0,"NW_CITY_PLAZE_06");	//Гритта
	TA_Sit_Bench(15,0,20,30,"NW_CITY_MERCHANT_BENCH_02");
	TA_Smalltalk(20,30,22,30,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");	//Игнац
	TA_Sit_Chair(22,30,23,30,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Sit_Chair(23,30,5,30,"NW_CITY_TAVERN_IN_04");
};
//напиваемся с Рупертом
func void Rtn_Binge_425()
{
	TA_Stand_WP(7,0,22,0,"NW_CITY_TAVERN_IN_02");
	TA_Stand_WP(22,0,7,0,"NW_CITY_TAVERN_IN_02");
};
func void Rtn_TOT_425()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};

