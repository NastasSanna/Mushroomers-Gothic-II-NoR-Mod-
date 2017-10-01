
instance KDF_510_Hyglas(Npc_Default)
{
	name[0] = "Хиглас";
	guild = GIL_KDF;
	id = 510;
	voice = 11;//14;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_NormalBart09,BodyTex_N,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_510;
	aivar[AIV_TheftDex] = 73;
	CreateInvItems(self, ItMi_Gold, 200);
};


func void Rtn_Start_510()
{
	TA_Read_Bookstand(8,0,23,0,"NW_MONASTERY_RUNEMAKER_08");
	TA_Read_Bookstand(23,0,8,0,"NW_MONASTERY_RUNEMAKER_08");
};

