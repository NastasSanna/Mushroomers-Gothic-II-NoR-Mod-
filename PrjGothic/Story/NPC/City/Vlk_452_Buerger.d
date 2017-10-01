
instance VLK_452_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 452;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Asghan,BodyTex_N,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_452;
};


func void Rtn_Start_452()
{
	TA_Smalltalk(9,5,14,15,"NW_CITY_UPTOWN_PATH_05_B");
	TA_Sit_Chair(14,15,16,0,"NW_CITY_LEOMAR_CHAIR_01");
	TA_Stand_Drinking(16,0,18,0,"NW_CITY_UPTOWN_HUT_03_STAIRS_ENTRY");
	TA_Sit_Throne(18,0,20,15,"NW_CITY_LEOMAR_THRONE_02");
	TA_Sleep(20,15,9,5,"NW_CITY_LEOMAR_BED_02");
};

