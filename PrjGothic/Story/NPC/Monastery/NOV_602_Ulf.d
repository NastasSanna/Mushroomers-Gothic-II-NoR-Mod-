
instance NOV_602_Ulf(Npc_Default)
{
	name[0] = "”Î¸Ù";
	guild = GIL_NOV;
	id = 602;
	voice = 23;//2;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak05,BodyTex_N,ItAr_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_602;
	aivar[AIV_TheftDex] = 34;
	CreateInvItems(self, ItMi_Gold, 50);
};


func void Rtn_preStart_602()
{
	TA_Stand_WP(8,0,20,0,"NW_MONASTERY_PLACE_01");
	TA_Stand_WP(20,0,8,0,"NW_MONASTERY_PLACE_01");
};

func void Rtn_Start_602()
{
	TA_Stand_Guarding(8,0,14,0,"NW_MONASTERY_CHAPELL_03");
	TA_Stand_Sweeping(14,0,19,0,"NW_MONASTERY_CHAPELL_02");
	TA_Pray_Innos_FP(19,0,18,0,"NW_MONASTERY_CHAPELL_01");
	TA_Sleep(22,0,8,0,"NW_MONASTERY_NOVICE01_06");
};

