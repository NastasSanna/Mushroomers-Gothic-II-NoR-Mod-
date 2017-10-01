
instance VLK_421_Valentino(Npc_Default)
{
	name[0] = "Валентино";
	guild = GIL_VLK;
	id = 421;
	voice = 23;//3;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Vlk_Mace);
	CreateInvItems(self,ItMi_Gold,200);
	CreateInvItems(self,ItKe_Valentino,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald.",Face_N_Normal03,BodyTex_N,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_421;
	aivar[AIV_TheftDex] = 30;
};


func void Rtn_Start_421()
{
	TA_Stand_ArmsCrossed(9,0,12,0,"NW_CITY_MERCHANT_PATH_16");
	TA_Smalltalk(12,0,17,0,"NW_CITY_MERCHANT_TAVERN01_01");
	TA_Sit_Chair(17,0,23,57,"NW_CITY_TAVERN_IN_06");
	TA_Smalltalk(23,57,4,5,"NW_CITY_TAVERN_IN_06");//VLK_426_Buergerin
	TA_Pee(4,5,4,10,"NW_CITY_MERCHANT_PATH_09");
	TA_Sleep(4,10,9,0,"NW_CITY_REICH03_BED_01");
};
func void Rtn_Tot_421()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};

