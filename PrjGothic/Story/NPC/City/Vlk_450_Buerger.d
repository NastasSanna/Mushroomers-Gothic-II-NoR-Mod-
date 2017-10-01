
instance VLK_450_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 450;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Herek,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_450;
};


func void Rtn_Start_450()
{
	TA_Stand_ArmsCrossed(6,4,12,1,"NW_CITY_MERCHANT_PATH_15");
	TA_Smalltalk(12,1,14,0,"NW_CITY_MERCHANT_PATH_14");//VLK_428_Buergerin
	TA_Smalltalk(14,0,16,0,"NW_CITY_MERCHANT_PATH_14");//VLK_454_Buerger
	TA_Pray_Innos_FP(16,0,16,15,"NW_CITY_MERCHANT_TEMPLE_IN");
	TA_Smalltalk(16,15,17,2,"NW_CITY_MERCHANT_TEMPLE_IN");//Ватрас
	TA_Smalltalk(17,2,21,15,"NW_CITY_MERCHANT_STAND_01");
	TA_Smalltalk(21,15,1,50,"NW_CITY_MERCHANT_SHOP03_FRONT_03");
	TA_Stand_Eating(1,50,4,15,"NW_CITY_TAVERN_IN_02");
	TA_Smalltalk(4,15,6,4,"NW_CITY_TAVERN_IN_06");
};


