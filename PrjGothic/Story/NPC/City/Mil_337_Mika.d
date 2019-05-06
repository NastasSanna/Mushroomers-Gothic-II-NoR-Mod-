
instance Mil_337_Mika(Npc_Default)
{
	name[0] = "Мика";
	guild = GIL_MIL;
	id = 337;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	CreateInvItems(self,ItPo_Health_01,4);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_L_ToughBart_Quentin,BodyTex_L,ITAR_Mil_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_337;
	aivar[AIV_TheftDex] = 65;
	CreateInvItems(self, ItMi_Gold, 75);
};


func void Rtn_Start_337()
{
	TA_Stand_Guarding(7,35,15,0,"NW_CITY_HABOUR_KASERN_18");
	TA_Practice_Sword(15,0,17,0,"NW_CITY_HABOUR_KASERN_CENTRE_01");
	TA_Stand_Eating(17,0,18,0,"NW_CITY_HABOUR_KASERN_18");
	TA_Stand_Guarding(18,0,22,0,"NW_CITY_HABOUR_KASERN_18");
	TA_Sleep(22,0,7,35,"NW_CITY_BARRACK01_BED_ALRICK");
};
func void Rtn_Guard_337()
{
	TA_Follow_Player(7,0,22,0,"NW_CITY_HABOUR_KASERN_18");
	TA_Follow_Player(22,0,7,0,"NW_CITY_HABOUR_KASERN_18");
};



