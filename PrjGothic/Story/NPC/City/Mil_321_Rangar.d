
instance MIL_321_Rangar(Npc_Default)
{
	name[0] = NAME_Miliz;
	name[1] = "Рангар";
	guild = GIL_MIL;
	id = 321;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	CreateInvItems(self,ItKe_City_Tower_02,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Tough_Skip,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_321;
	aivar[AIV_TheftDex] = 30;
};


func void Rtn_Start_321()
{
	TA_Stand_Guarding(8,0,11,0,"NW_CITY_MERCHANT_PATH_29_B");
	TA_Stand_Drinking(11,0,14,0,"NW_CITY_MERCHANT_PATH_07");
	TA_Stand_Guarding(14,0,17,0,"NW_CITY_MERCHANT_PATH_01");
	TA_Stand_Guarding(17,0,8,0,"NW_CITY_PLAZE_02");
};


