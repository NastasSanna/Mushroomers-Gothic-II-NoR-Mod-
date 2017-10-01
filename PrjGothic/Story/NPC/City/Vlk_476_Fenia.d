
instance VLK_476_Fenia(Npc_Default)
{
	name[0] = "Ôåíÿ";
	guild = GIL_VLK;
	id = 476;
	voice = 18;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe1",FaceBabe_N_GreyCloth,BodyTex_N,ITAR_VlkBabe_L);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_476;
	aivar[AIV_TheftDex] = 50;
	CreateInvItems(self, ItMi_Gold, 75);
};


func void Rtn_Start_476()
{
	TA_Stand_Guarding(4,55,20,5,"NW_CITY_PATH_HABOUR_03_01");
	TA_Stomp_Herb(20,5,22,5,"NW_CITY_HABOUR_POOR_AREA_PATH_01");
	TA_Sleep(22,5,4,55,"NW_CITY_BED_HALVOR_WEIB");
};

