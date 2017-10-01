
instance NOV_604_Dyrian(Npc_Default)
{
	name[0] = "Дуриан";
	guild = GIL_NOV;
	id = 604;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItSc_Sleep,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_Tough_Torrez,BodyTex_P,ItAr_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_604;
	aivar[AIV_TheftDex] = 10;
	CreateInvItems(self, ItMi_Gold, 15);
};


func void Rtn_Start_604()
{
	TA_Stand_Sweeping(6,0,8,15,"NW_MONASTERY_CORRIDOR_11");
	TA_Stand_Sweeping(8,15,9,30,"NW_MONASTERY_MAGE02_BED_01");
	TA_Stand_Sweeping(9,30,11,0,"NW_MONASTERY_MAGE02_01");
	TA_Stand_Sweeping(11,0,12,30,"NW_MONASTERY_MAGE02_BED_02");
	TA_Pray_Innos_FP(12,30,14,10,"NW_MONASTERY_CHAPELL_01");
	TA_Stand_Sweeping(14,10,16,20,"NW_MONASTERY_MAGE01_013");
	TA_Stand_Sweeping(16,20,18,5,"NW_MONASTERY_MAGE01_011");
	TA_Stand_Sweeping(18,5,21,30,"NW_MONASTERY_CORRIDOR_06");
	TA_Sleep(21,30,6,0,"NW_MONASTERY_NOVICE01_04");
};


