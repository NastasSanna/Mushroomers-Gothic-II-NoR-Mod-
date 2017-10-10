
instance VLK_4361_Lucia(Npc_Default)
{
	name[0] = "Люсия";
	guild = GIL_VLK;
	id = 4361;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,5);
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_GreyCloth,BodyTexBabe_N,ITAR_VlkBabe_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_Start_4361;
};


func void Rtn_Start_4361()
{
	TA_Dance(4,30,8,0,"NW_PUFF_DANCE");
	TA_Stand_Drinking(8,0,11,0,"NW_CITY_HABOUR_PUFF_IN_07");
	TA_Stand_Sweeping(11,0,13,0,"NW_CITY_HABOUR_PUFF_IN_07");
	TA_Stand_Sweeping(13,0,14,0,"NW_CITY_PUFF_ROOM_02");
	TA_Stand_Sweeping(14,0,15,0,"NW_CITY_PUFF_THRONE");
	TA_Sleep(16,0,19,0,"NW_CITY_HABOUR_PUFF_VANJA");
	TA_Sit_Throne(19,0,21,40,"NW_CITY_PUFF_THRONE");
	TA_Smalltalk(21,40,21,45,"NW_CITY_PUFF_THRONE"); //Надя
	TA_Dance(21,45,0,40,"NW_PUFF_DANCE");
};
func void Rtn_TOT_4361()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};

