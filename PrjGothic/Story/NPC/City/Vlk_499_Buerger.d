
instance VLK_499_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 499;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_BaalNetbek,BodyTex_N,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_499;
};


func void Rtn_Start_499()
{
	TA_Stand_Eating(6,0,7,0,"NW_CITY_MERCHANT_TRADE_04");
	TA_Stand_Drinking(7,0,9,10,"NW_CITY_UPTOWN_PATH_27");
	TA_Smalltalk(9,10,14,0,"NW_CITY_UPTOWN_PATH_05_B");
	TA_Stand_Eating(14,0,16,0,"NW_CITY_MERCHANT_TRADE_04");
	TA_Sit_Bench(16,0,18,0,"NW_CITY_GUARD_01");
	TA_Smalltalk(18,0,20,10,"NW_CITY_MERCHANT_SHOP01_FRONT_03");//VLK_451_Buerger
	TA_Sit_Bench(20,10,22,0,"NW_CITY_GUARD_01");
	TA_Sleep(22,0,6,0,"NW_CITY_UPTOWN_HUT_BED_02");
};

