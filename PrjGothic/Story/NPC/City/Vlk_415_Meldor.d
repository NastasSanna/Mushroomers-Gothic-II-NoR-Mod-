
instance VLK_415_Meldor(Npc_Default)
{
	name[0] = "Ìוכהמנ";
	guild = GIL_VLK;
	id = 415;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_NormalBald,BodyTex_P,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0.8);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_415;
	aivar[AIV_TheftDex] = 34;
	CreateInvItems(self, ItMi_Gold, 55);
};

func void Rtn_Start_415()
{
	TA_Smoke_Joint(5,45,12,35,"NW_CITY_HABOUR_POOR_AREA_PATH_20");
	TA_Smalltalk(12,35,16,5,"NW_CITY_HABOUR_HUT_08");
	TA_Smoke_Joint(16,5,18,5,"NW_CITY_HABOUR_POOR_AREA_PATH_20");
	TA_Stand_Eating(18,5,19,55,"NW_CITY_PATH_HABOUR_03");
	TA_Smoke_Joint(19,55,23,55,"NW_CITY_HABOUR_POOR_AREA_PATH_20");
	//TA_WatchConcert(23,55,3,15,"NW_CITY_HABOUR_PUFF_02");
	TA_Stand_Drinking(23,55,3,15,"NW_CITY_HABOUR_PUFF_02");
	TA_Sleep(3,15,5,45,"NW_CITY_HABOUR_HUT_04_BED_02");
};
func void Rtn_Wait_415()
{
	TA_Smoke_Joint(6,15,12,35,"NW_CITY_HABOUR_KASERN_01");
	TA_Stand_ArmsCrossed(12,35,16,5,"NW_CITY_HABOUR_KASERN_01");
	TA_Smoke_Joint(16,5,18,5,"NW_CITY_HABOUR_KASERN_01");
	TA_Stand_Eating(18,5,19,55,"NW_CITY_HABOUR_KASERN_01");
	TA_Smoke_Joint(19,55,23,55,"NW_CITY_HABOUR_KASERN_01");
	TA_Stand_Drinking(23,55,3,15,"NW_CITY_HABOUR_PUFF_02");
	TA_Sleep(3,15,6,15,"NW_CITY_HABOUR_HUT_04_BED_02");
};
func void Rtn_FreeTime_415()
{
	TA_Smoke_Joint(8,30,14,45,"NW_CITY_HABOUR_02_B");
	TA_Sit_Chair(14,45,16,55,"NW_CITY_HABOUR_TAVERN01_08");
	TA_Stand_Eating(16,55,18,55,"NW_CITY_HABOUR_TAVERN01_08");
	TA_Stand_Drinking(18,55,21,55,"NW_CITY_HABOUR_TAVERN01_08");
	TA_Stand_Drinking(21,55,2,5,"NW_CITY_HABOUR_PUFF_02");
	TA_Sleep(2,5,8,30,"NW_CITY_HABOUR_HUT_04_BED_02");
};
func void Rtn_Tot_415()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};

