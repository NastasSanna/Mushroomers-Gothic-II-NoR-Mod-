
instance OUT_1230_Trocar(Npc_Default)
{
	name[0] = "Трокар";
	guild = GIL_OUT;
	id = 1230;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItRw_Bow_H_02);
	EquipItem(self,ItMw_Schiffsaxt);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItRw_Arrow,40);
	CreateInvItems(self,ItPo_Health_02,2);
	CreateInvItems(self,ItPl_Health_Herb_01,4);
	CreateInvItems(self,ItAt_Teeth,2);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Normal_Erpresser,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_preStart_1230;
};

func void Rtn_preStart_1230()
{
	TA_Follow_Player(8,0,22,0,"NW_TROLLAREA_RITUAL_11A");
	TA_Follow_Player(22,0,8,0,"NW_TROLLAREA_RITUAL_11A");
};

func void Rtn_Start_1230()
{
	/*
	TA_Stand_Drinking(7,0,9,35,"NW_TAVERNE_IN_RANGERMEETING_LARES");
	TA_Smalltalk(9,35,10,15,"NW_TAVERNE_IN_RANGERMEETING_LARES");	//Барток
	TA_Stand_Drinking(10,15,12,30,"NW_TAVERNE_IN_RANGERMEETING_LARES");
	TA_Smalltalk(12,30,15,20,"NW_TAVERNE_IN_RANGERMEETING_LARES");	//Барток
	TA_Stand_Drinking(15,20,16,10,"NW_TAVERNE_IN_RANGERMEETING_LARES");
	TA_Smalltalk(16,10,19,30,"NW_TAVERNE_IN_RANGERMEETING_LARES");	//Барток
	//*/
		TA_Smalltalk_Drinking(5,25,19,0,"NW_TAVERNE_IN_RANGERMEETING");	//Барток
	TA_Stand_Drinking(19,0,21,15,"NW_TAVERNE_IN_RANGERMEETING_LARES");
	TA_Sit_Bench(21,15,5,25,"NW_TAVERNE_GREGSBENCH");
};
func void Rtn_TOT_1230()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};
