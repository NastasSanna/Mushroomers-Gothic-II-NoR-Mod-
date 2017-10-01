
instance OUT_1200_Engrom(Npc_Default)
{
	name[0] = "Энгром";
	guild = GIL_OUT;
	id = 1200;
	voice = 22;//12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	aivar[AIV_Temper] = TEMPER_BodyGuard;
	attribute[ATR_DEXTERITY] = 30;
	aivar[REAL_DEXTERITY] = 30;
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	EquipItem(self,ItRw_Mil_Crossbow);
	CreateInvItem(self,ItKe_Chest_Engrom);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart20,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,45);
	daily_routine = Rtn_Start_1200;
};


func void Rtn_preStart_1200()
{
	TA_Stand_WP(8,0,23,0,"NW_TAVERNE_HUNTERCAMP_03_FIRESIT");
	TA_Stand_WP(23,0,8,0,"NW_TAVERNE_HUNTERCAMP_03_FIRESIT");
};

func void Rtn_Start_1200()
{
	TA_Sit_Bench(8,0,12,0,"NW_TAVERNE_HUNTERCAMP_03_FIRESIT");
	TA_Stand_Eating(12,0,14,0,"NW_TAVERNE_HUNTERCAMP_07_IN");
	TA_Sit_Chair(14,0,18,0,"NW_TAVERNE_HUNTERCAMP_07_IN");
	TA_Sit_Bench(18,0,23,0,"NW_TAVERNE_HUNTERCAMP_03_FIRESIT");
	TA_Sleep(23,0,8,0,"NW_TAVERNE_HUNTERCAMP_08_BED");
};
func void Rtn_Follow_1200()
{
	TA_Follow_Player(8,0,23,0,"NW_TAVERNE_HUNTERCAMP_03_FIRESIT");
	TA_Follow_Player(23,0,8,0,"NW_TAVERNE_HUNTERCAMP_03_FIRESIT");
};

func void Rtn_DayS_1200()
{
	TA_Sit_Bench(8,0,12,0,"NW_TAVERNE_HUNTERCAMP_03_FIRESIT");
	TA_Smalltalk(11,5,14,50,"NW_TAVERNE_HUNTERCAMP_04");	//Талбин
	TA_Stand_Eating(14,50,16,10,"NW_TAVERNE_HUNTERCAMP_07_IN");
	TA_Sit_Chair(16,10,18,0,"NW_TAVERNE_HUNTERCAMP_07_IN");
	TA_Sit_Bench(18,0,23,0,"NW_TAVERNE_HUNTERCAMP_03_FIRESIT");
	TA_Sleep(23,0,8,0,"NW_TAVERNE_HUNTERCAMP_08_BED");
};
func void Rtn_After_1200()
{
	TA_Sit_Bench(8,0,9,30,"NW_TAVERNE_HUNTERCAMP_03_FIRESIT");
	TA_Smalltalk(9,30,12,5,"NW_TAVERNE_HUNTERCAMP_04");	//Талбин
	TA_Stand_Eating(12,5,14,0,"NW_TAVERNE_HUNTERCAMP_07_IN");
	TA_Sit_Chair(14,0,18,0,"NW_TAVERNE_HUNTERCAMP_07_IN");
	TA_Sit_Bench(18,0,23,0,"NW_TAVERNE_HUNTERCAMP_03_FIRESIT");
	TA_Sleep(23,0,8,0,"NW_TAVERNE_HUNTERCAMP_08_BED");
};
func void Rtn_Guard_1200()
{
	TA_Stand_Eating(7,0,7,30,"NW_TAVERNE_HUNTERCAMP_03_FIRESIT");
	TA_GuardNpc(7,30,9,0,"NW_TAVERNE_TROLLAREA_08");
	TA_GuardNpc(9,0,10,30,"NW_TAVERNE_TROLLAREA_11");
	TA_GuardNpc(10,30,11,30,"TAVERNE_TROLLAREA_MONSTER_05_02");
	TA_GuardNpc(11,30,12,30,"NW_FARM4_WOOD_MONSTER_N_5");
	TA_GuardNpc(12,30,13,30,"NW_FARM4_WOOD_NEARPEASANT7E"); 
	TA_Hunting(13,30,14,30,"NW_FARM4_WOOD_MONSTER_05"); 
	TA_GuardNpc(14,30,15,30,"NW_FARM4_WOOD_MONSTER_05"); 
	TA_GuardNpc(15,30,17,0,"NW_FARM4_WOOD_MONSTER_09"); 
	TA_GuardNpc(17,0,19,0,"NW_FARM4_WOOD_NEARPEASANT7");
	TA_Stand_WP(19,0,19,3,"NW_CITY_ENTRANCE_BACK");
	TA_Smalltalk(19,3,20,5,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Sit_Bench(20,5,23,0,"NW_TAVERNE_HUNTERCAMP_03_FIRESIT");
	TA_Sleep(23,0,7,0,"NW_TAVERNE_HUNTERCAMP_08_BED");
};

