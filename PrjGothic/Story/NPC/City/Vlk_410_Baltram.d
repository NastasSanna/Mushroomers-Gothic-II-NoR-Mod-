
instance VLK_410_Baltram(Npc_Default)
{
	name[0] = "Áאכüענאל";
	guild = GIL_VLK;
	id = 410;
	voice = 2;
	flags = 0;
	npcType = npctype_main;
//	aivar[AIV_StoryFlags] = STORY_Ranger;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_ShortSword2);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Markus_Kark,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_410;
	aivar[AIV_TheftDex] = 76;
	CreateInvItems(self, ItMi_Gold, 175);
};


func void Rtn_Start_410()
{
	TA_Stand_ArmsCrossed(6,5,19,55,"NW_CITY_ZURIS");
	TA_Smalltalk(19,55,22,5,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Sleep(22,5,6,5,"NW_CITY_HOTEL_BED_02");
};
func void Rtn_Tot_410()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};


