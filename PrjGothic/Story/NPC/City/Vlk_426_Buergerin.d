
instance VLK_426_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 426;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_Lilo,BodyTex_N,ITAR_VlkBabe_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_426;
};


func void Rtn_Start_426()
{
	TA_Stand_ArmsCrossed(6,5,12,5,"NW_CITY_MERCHANT_PATH_15");
	TA_Smalltalk(12,5,15,0,"NW_CITY_MERCHANT_STAND_01");
	TA_Pray_Innos_FP(15,0,15,15,"NW_CITY_MERCHANT_TEMPLE_IN");
	TA_Smalltalk(15,15,16,0,"NW_CITY_MERCHANT_TEMPLE_IN");//Ватрас
	TA_Smalltalk(16,0,23,55,"NW_CITY_MERCHANT_TAVERN01_01");
	TA_Smalltalk(23,55,6,5,"NW_CITY_TAVERN_IN_05");//VLK_421_Valentino, VLK_450_Buerger
};

