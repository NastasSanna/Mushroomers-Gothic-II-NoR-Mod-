
instance VLK_493_Nagur(Npc_Default)
{
	name[0] = "Нагур";
	guild = GIL_BDT;
	id = 493;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal17,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_493;
	aivar[AIV_TheftDex] = 75;
	CreateInvItems(self, ItMi_Gold, 150);
};


func void Rtn_Start_493()
{
	TA_Stand_WP(8,0,23,0,"WP_CITY_THIEF_ISLE_01");
	TA_Stand_WP(23,0,8,0,"WP_CITY_THIEF_ISLE_01");
};
func void Rtn_Tot_493()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};

