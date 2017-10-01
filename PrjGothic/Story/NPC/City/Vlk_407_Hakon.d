
instance VLK_407_Hakon(Npc_Default)
{
	name[0] = "Хакон";
	guild = GIL_VLK;
	id = 407;
	voice = 2;//12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_ShortSword2);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart20,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_407;
	aivar[AIV_TheftDex] = 45;
	CreateInvItems(self, ItMi_Gold, 65);
};


func void Rtn_Start_407()
{
	TA_Stand_ArmsCrossed(5,10,19,50,"NW_CITY_HAKON");
	TA_Smalltalk(19,50,22,5,"MARKT_02");
	TA_Sit_Throne(22,5,23,10,"NW_CITY_HOTEL_UPTSAIRS_05");
	TA_Sleep(23,10,5,10,"NW_CITY_HOTEL_BED_04");
};
func void Rtn_Tot_407()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};

