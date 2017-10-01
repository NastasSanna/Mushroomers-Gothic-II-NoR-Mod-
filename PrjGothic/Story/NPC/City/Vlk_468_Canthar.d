
instance VLK_468_Canthar(Npc_Default)
{
	name[0] = "Кантар";
	guild = GIL_NONE;
	id = 468;
	voice = 5;//12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	CreateInvItems(self,ItMi_Gold,50);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Orry,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,1.8);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_468;
	aivar[AIV_TheftDex] = 20;
	CreateInvItems(self, ItMi_Gold, 25);
};


func void Rtn_Start_468()
{
	TA_Stand_ArmsCrossed(7,45,19,45,"NW_CITY_KANTAR");
	TA_Sit_Bench(19,45,22,45,"NW_CITY_MERCHANT_PATH_30");
	TA_Sleep(22,45,7,45,"NW_CITY_HOTEL_BED_01");
};



