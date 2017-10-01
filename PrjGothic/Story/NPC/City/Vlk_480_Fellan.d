
instance VLK_480_Fellan(Npc_Default)
{
	name[0] = "Феллан";
	guild = GIL_VLK;
	id = 480;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_ShortSword2);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal19,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_480;
	aivar[AIV_TheftDex] = 40;
	CreateInvItems(self, ItMi_Gold, 40);
};


func void Rtn_Start_480()
{
	TA_Stand_Guarding(6,0,10,0,"NW_CITY_WAY_TO_SHIP_26");
	TA_Sit_Bench(10,0,14,0,"NW_CITY_WAY_TO_SHIP_BENCH_01");
	TA_Repair_Hut(14,0,16,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Smalltalk(16,0,18,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_ArmsCrossed(18,0,20,0,"NW_CITY_WAY_TO_SHIP_26");
	TA_Sit_Bench(20,0,23,0,"NW_CITY_WAY_TO_SHIP_BENCH_01");
	TA_Sleep(23,0,6,0,"NW_CITY_WAY_TO_SHIP_SLEEP");
};

func void Rtn_Hammer_480()
{
	TA_Repair_Hut(4,30,8,0,"NW_CITY_PATH_HABOUR_09");
	TA_Repair_Hut(8,0,12,0,"NW_CITY_HABOUR_REPAIR_04");
	TA_Repair_Hut(12,0,16,0,"NW_CITY_PATH_HABOUR_09");
	TA_Repair_Hut(16,0,20,0,"NW_CITY_HABOUR_REPAIR_04");
	TA_Repair_Hut(20,0,1,30,"NW_CITY_PATH_HABOUR_09");
	TA_Sleep(1,30,4,30,"NW_CITY_HABOUR_HUT_05_BED_01");
};
func void Rtn_Tot_480()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};

