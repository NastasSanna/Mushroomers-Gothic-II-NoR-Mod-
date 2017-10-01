
instance VLK_491_Vanja(Npc_Default)
{
	name[0] = "Ваня";
	guild = GIL_VLK;
	id = 491;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabe_B_RedLocks,BodyTexBabe_B,ITAR_VlkBabe_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_491;
	aivar[AIV_TheftDex] = 20;
	CreateInvItems(self, ItMi_Gold, 10);
};


func void Rtn_Start_491()
{
	TA_Sleep(11,0,15,0,"NW_CITY_NADJA_BED");
	TA_Sweep_FP(15,0,16,0,"NW_CITY_HABOUR_PUFF_IN_08");
	TA_Sweep_FP(16,0,17,0,"NW_CITY_HABOUR_PUFF_07");
	TA_Sweep_FP(17,0,18,0,"NW_CITY_HABOUR_PUFF_IN_06");
	TA_Sweep_FP(18,0,18,30,"NW_CITY_HABOUR_PUFF_IN_03");
	TA_Sweep_FP(18,30,19,0,"NW_CITY_HABOUR_PUFF_IN_02");
	TA_Dance(19,0,20,30,"NW_PUFF_DANCE");
	TA_Stand_Drinking(20,30,22,30,"NW_PUFF_DANCE");
	TA_Dance(22,30,4,30,"NW_PUFF_DANCE");
	TA_Stand_Drinking(4,30,11,0,"NW_PUFF_DANCE");
};
func void Rtn_Work_491()
{
	TA_Stand_WP(8,0,17,0,"NW_CITY_NADJA_BED");
	TA_Stand_WP	(17,0,22,0,"NW_CITY_SONJA_BED"); //Надя спит на той кровати
	TA_Stand_WP(22,0,8,0,"NW_CITY_NADJA_BED");
};
func void Rtn_TOT_491()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};

