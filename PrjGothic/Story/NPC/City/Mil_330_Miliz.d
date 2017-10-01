
instance Mil_330_Miliz(Npc_Default)
{
	name[0] = NAME_Miliz;
	guild = GIL_MIL;
	id = 330;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Mordrag,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_330;
};


func void Rtn_Start_330()
{
	TA_Practice_Sword(7,0,15,1,"NW_CITY_HABOUR_KASERN_CENTRE_03");
	TA_Practice_RangedWeapon(15,1,16,0,"NW_CITY_HABOUR_KASERN_SHOOT");
	TA_Practice_Sword(16,0,21,1,"NW_CITY_HABOUR_KASERN_CENTRE_03");
	TA_Smalltalk(21,1,0,0,"NW_CITY_KASERN_BARRACK02_02");
	TA_Sleep(0,0,7,0,"NW_CITY_BARRACK01_BED_06");
};
func void Rtn_Court_330()
{
	TA_Stand_Guarding(9,0,22,0,"NW_CITY_HABOUR_KASERN_MAIN_IN");
	TA_Stand_Guarding(22,0,9,0,"NW_CITY_HABOUR_KASERN_MAIN_IN");
};
