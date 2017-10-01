
instance NOV_607_Novize(Npc_Default)
{
	name[0] = NAME_Novize;
	guild = GIL_NOV;
	id = 607;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_NormalBart_Dexter,BodyTex_N,ItAr_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_607;
};


func void Rtn_Start_607()
{
	TA_Pray_Innos_FP(8,30,9,0,"NW_MONASTERY_CHURCH_03");
	TA_Smalltalk(9,0,22,15,"NW_MONASTERY_GRASS_01");
	TA_Sleep(22,15,8,30,"NW_MONASTERY_NOVICE03_05");
};

