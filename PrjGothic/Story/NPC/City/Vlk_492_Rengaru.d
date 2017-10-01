
instance VLK_492_Rengaru(Npc_Default)
{
	//name[0] = "Ренгару";
	name[0] = "Завсегдатай";
	guild = GIL_VLK;
	id = 492;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	CreateInvItems(self,ItMi_Gold,50);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_ToughBart01,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_492;
	aivar[AIV_TheftDex] = 20;
	CreateInvItems(self, ItMi_Gold, 5);
};


func void Rtn_Start_492()
{
	TA_Stand_Drinking(6,0,20,0,"NW_CITY_HABOUR_TAVERN01_STAND_01");
	TA_Stand_Drinking(20,0,6,0,"NW_CITY_HABOUR_TAVERN01_STAND_01");
};
func void Rtn_Tot_492()
{
	TA_Stand_WP(6,0,20,0,"TOT");
	TA_Stand_WP(20,0,6,0,"TOT");
};

