
instance VLK_442_Arbeiter(Npc_Default)
{
	name[0] = "Работник";
	name[1] = "Фабио";
	guild = GIL_VLK;
	id = 442;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Senyan,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_442;
};


func void Rtn_Start_442()
{
	TA_Stand_Sweeping(7,0,13,0,"NW_CITY_HABOUR_WERFT_ENTRY");
	TA_Stand_Eating(13,0,15,0,"NW_CITY_HABOUR_WERFT_ENTRY");
	TA_Stand_Sweeping(15,0,19,5,"NW_CITY_HABOUR_WERFT_ENTRY");
	TA_Smalltalk(19,5,23,30,"NW_CITY_PATH_HABOUR_01");//VLK_443_Arbeiter
	TA_Sleep(23,30,5,40,"WP_CITY_FISHERS_BED_02");
	TA_Cook_Pan(5,40,7,0,"WP_CITY_FISHERS_CAMPFIRE_01");
};

