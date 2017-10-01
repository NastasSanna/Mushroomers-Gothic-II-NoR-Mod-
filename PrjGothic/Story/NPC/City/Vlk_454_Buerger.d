
instance VLK_454_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 454;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_OldMan_Gravo,BodyTex_P,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_454;
};


func void Rtn_Start_454()
{
	TA_Stand_ArmsCrossed(6,7,12,2,"NW_CITY_MERCHANT_PATH_14_C");
	TA_Sit_Bench(12,2,13,0,"NW_CITY_MERCHANT_TAVERN01_FRONT");
	TA_Pray_Innos_FP(13,0,13,15,"NW_CITY_MERCHANT_TEMPLE_IN");
	TA_Smalltalk(13,15,14,0,"NW_CITY_MERCHANT_TEMPLE_IN");//Ватрас
	TA_Smalltalk(14,0,16,0,"NW_CITY_MERCHANT_PATH_14_A");//VLK_450_Buerger
	TA_Smalltalk(16,0,21,15,"NW_CITY_MERCHANT_SHOP03_FRONT_03");
	TA_Sit_Chair(21,15,6,7,"NW_CITY_TAVERN_IN_01");
};


