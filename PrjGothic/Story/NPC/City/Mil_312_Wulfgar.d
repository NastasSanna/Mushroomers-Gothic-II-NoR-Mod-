
instance MIL_312_Wulfgar(Npc_Default)
{
	name[0] = "Âףכüפדאנ";
	guild = GIL_MIL;
	id = 312;
	voice = 15;
	flags = 0;
	npcType = npctype_main;
	flags = NPC_FLAG_IMMORTAL;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart06,BodyTex_N,ItAr_MIL_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_312;
	aivar[AIV_TheftDex] = 58;
	CreateInvItems(self, ItMi_Gold, 80);
};

func void Rtn_Start_312()
{
	TA_Practice_Sword(5,0,6,55,"NW_CITY_HABOUR_KASERN_CENTRE_01");
	TA_Read_Bookstand(6,55,10,30,"NW_CITY_ANDRE");
	TA_Stand_ArmsCrossed(10,30,12,40,"NW_CITY_HABOUR_KASERN_MAIN_ENTRY");
	TA_Read_Bookstand(12,40,16,15,"NW_CITY_ANDRE");
	TA_Stand_ArmsCrossed(16,15,21,0,"NW_CITY_HABOUR_KASERN_CENTRE_01");
	TA_Sit_Throne(21,0,5,0,"NW_CITY_KASERN_BARRACK02_02");
};
func void Rtn_Court_312()
{
	TA_Stand_ArmsCrossed(9,0,21,0,"NW_CITY_ANDRE_01");
	TA_Stand_ArmsCrossed(21,0,9,0,"NW_CITY_ANDRE_01");
};

