
instance VLK_434_Borka(Npc_Default)
{
	name[0] = "Борка";
	guild = GIL_VLK;
	id = 434;
	voice = 15;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Mace);
	CreateInvItems(self,ItMi_Joint,20);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_L_Ian,BodyTex_L,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_434;
	aivar[AIV_TheftDex] = 80;
	CreateInvItems(self, ItMi_Gold, 120);
};


func void Rtn_Start_434()
{
	TA_Stand_Guarding(8,0,22,0,"NW_CITY_HABOUR_PUFF_ENTRANCE");
	TA_Stand_Guarding(22,0,8,0,"NW_CITY_HABOUR_PUFF_ENTRANCE");
};
func void Rtn_TOT_434()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};


