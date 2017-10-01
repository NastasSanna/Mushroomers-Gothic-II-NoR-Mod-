
instance VLK_408_Jora(Npc_Default)
{
	name[0] = "Йора";
	guild = GIL_VLK;
	id = 408;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Mace_L_01);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal02,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_408;
	aivar[AIV_TheftDex] = 31;
	CreateInvItems(self, ItMi_Gold, 45);
};


func void Rtn_Start_408()
{
	TA_Stand_ArmsCrossed(5,3,20,4,"NW_CITY_MERCHANT_PATH_38");
	TA_Stand_Drinking(20,4,0,6,"NW_CITY_MERCHANT_TAVERN01_BACKROOM");
	TA_Sleep(0,6,5,3,"NW_CITY_HOTEL_BED_03");
};
func void Rtn_Tot_408()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};

