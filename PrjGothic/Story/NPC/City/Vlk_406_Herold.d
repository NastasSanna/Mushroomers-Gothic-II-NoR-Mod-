
instance VLK_406_Herold(Npc_Default)
{
	name[0] = "ֳונמכüה";
	guild = GIL_VLK;
	id = 406;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal_Sly,BodyTex_N,ITAR_Governor);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_406;
};


func void Rtn_Start_406()
{
	TA_Read_Bookstand(9,0,12,30,"NW_CITY_LEOMAR_BED_01");
	TA_Stand_Eating(12,30,15,2,"NW_CITY_LEOMAR_CHAIR_03");
	TA_Smalltalk(15,2,17,30,"NW_CITYHALL_UPSTAIRS_01");
	TA_Stand_Eating(17,30,18,30,"NW_CITY_LEOMAR_CHAIR_03");
	TA_Sit_Chair(18,30,12,30,"NW_CITY_LEOMAR_CHAIR_03");
	TA_Sit_Throne(20,30,23,0,"NW_CITY_LEOMAR_TRONE_01");
	TA_Sleep(23,0,9,0,"NW_CITY_LEOMAR_BED_01");
};

