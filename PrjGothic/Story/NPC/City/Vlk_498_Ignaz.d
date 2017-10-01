
instance VLK_498_Ignaz(Npc_Default)
{
	name[0] = "Игнац";
	guild = GIL_VLK;
	id = 498;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	aivar[AIV_IgnoreFlags] = IGNORE_PortalRoom_Public;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Corristo,BodyTex_N,ITAR_Smith);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_498;
	aivar[AIV_TheftDex] = 38;
	CreateInvItems(self, ItMi_Gold, 50);
};


func void Rtn_Start_498()
{
	TA_Potion_Alchemy(4,30,10,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Read_Bookstand(10,0,13,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Sit_Chair(13,0,14,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Potion_Alchemy(14,0,20,30,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Smalltalk(20,30,22,30,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Read_Bookstand(22,30,23,30,"NW_CITY_HABOUR_POOR_AREA_HUT_08_READ");
	TA_Sleep(23,30,4,30,"NW_CITY_HABOUR_POOR_AREA_HUT_08_IN_BED");
};
func void Rtn_Tot_498()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};


