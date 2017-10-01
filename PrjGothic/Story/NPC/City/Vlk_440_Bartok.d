
instance VLK_440_Bartok(Npc_Default)
{
	name[0] = "Барток";
	guild = GIL_VLK;
	id = 440;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItRw_Bow_M_03);
	EquipItem(self,ItMW_Addon_Hacker_1h_01);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItRw_Arrow,40);
	CreateInvItems(self,ItPo_Health_03,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Important_Arto,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_440;
};


func void Rtn_Start_440()
{
	if (Wld_GetDay() % 3 == 0)	
	{
		TA_Hunting( 7, 0,12, 0,"NW_FARM1_CITYWALL_FOREST_02");
		TA_Hunting(12, 0,19,30,"NW_FARM1_CITYWALL_FOREST_15");
	}
	else if (Wld_GetDay() % 3 == 1)	
	{
		TA_Hunting( 7, 0,11, 0,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER2");
		TA_Hunting(11, 0,16, 0,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER7");
		TA_Hunting(16, 0,19,30,"NW_CITY_JAEGER_08");
	}
	else
	{
		TA_Stand_WP			( 7, 0,12,30,"NW_FARM2_TO_TAVERN_09_MONSTER");
		TA_Stand_Drinking	(12,30,16,50,"NW_TAVERNE_IN_RANGERMEETING");
		TA_Pee				(16,50,17,20,"NW_FARM2_TO_TAVERN_09_MONSTER");
		TA_Stand_Drinking	(17,20,19,30,"NW_TAVERNE_IN_RANGERMEETING");
	};

	TA_Smalltalk(19,30,20,15,"NW_CITY_MERCHANT_SHOP01_IN_04");
	TA_Sit_Bench(20,15,21,45,"NW_CITY_MERCHANT_TAVERN01_FRONT");
	TA_Stand_Drinking(21,45,23,30,"NW_CITY_MERCHANT_TAVERN01_FRONT");
	TA_Sit_Chair(23,30,4,45,"TAVERN02_B");
	TA_Sit_Bench(4,45,7,0,"NW_CITY_MERCHANT_TAVERN01_FRONT");
};

func void Rtn_TrocarMeet_440()
{
	/*
		TA_Stand_Eating(7,0,9,35,"NW_TAVERNE_IN_RANGERMEETING");
		TA_Smalltalk(9,35,10,15,"NW_TAVERNE_IN_RANGERMEETING");	//Трокар
		TA_Stand_Drinking(10,15,12,30,"NW_TAVERNE_IN_RANGERMEETING");
		TA_Smalltalk(12,30,15,20,"NW_TAVERNE_IN_RANGERMEETING");	//Трокар
		TA_Stand_Eating(15,20,16,10,"NW_TAVERNE_IN_RANGERMEETING");
		TA_Smalltalk(16,10,17,20,"NW_TAVERNE_IN_RANGERMEETING");	//Трокар
		TA_Stand_Drinking	(17,20,19,30,"NW_TAVERNE_IN_RANGERMEETING");
	/*/
		TA_Smalltalk_Drinking(5,25,19,0,"NW_TAVERNE_IN_RANGERMEETING");	//Трокар
	//*/
	TA_Smalltalk(19,0,21,15,"NW_CITY_MERCHANT_SHOP01_IN_04");
	TA_Sit_Bench(21,15,5,25,"NW_TAVERNE_GREGSBENCH");
};
func void Rtn_TOT_440()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};



