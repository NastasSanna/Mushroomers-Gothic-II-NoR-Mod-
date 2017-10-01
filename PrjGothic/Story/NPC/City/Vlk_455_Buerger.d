
instance VLK_455_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 455;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_NormalBart06,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_455;
};


func void Rtn_Start_455()
{
	TA_Stand_ArmsCrossed(5,50,12,0,"NW_CITY_MERCHANT_PATH_14_C");
	TA_Pray_Innos_FP(12,0,12,15,"NW_CITY_MERCHANT_TEMPLE_IN");
	TA_Smalltalk(12,15,13,0,"NW_CITY_MERCHANT_TEMPLE_IN");//Ватрас
	TA_Sit_Bench(13,0,20,35,"NW_CITY_MERCHANT_TAVERN01_FRONT");
	TA_Smalltalk(20,35,0,25,"NW_CITY_MERCHANT_PATH_14");//VLK_457_Brian
	TA_Sit_Bench(0,25,5,50,"NW_CITY_MERCHANT_PATH_15");
};


