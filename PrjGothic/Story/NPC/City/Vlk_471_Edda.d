
instance VLK_471_Edda(Npc_Default)
{
	name[0] = "Ýההא";
	guild = GIL_VLK;
	id = 471;
	voice = 16;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe.",FaceBabe_B_RedLocks,BodyTex_B,ITAR_VlkBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_471;
	aivar[AIV_TheftDex] = 20;
};


func void Rtn_Start_471()
{
	TA_Cook_Cauldron(6,0,22,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
	TA_Sleep(22,0,6,0,"NW_CITY_HABOUR_POOR_AREA_HUT_06_BED_01");
};
func void Rtn_Tot_471()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};

