
instance KDF_503_Karras(Npc_Default)
{
	name[0] = "Каррас";
	guild = GIL_KDF;
	id = 503;
	voice = 11;//10;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Temper] = TEMPER_MagicUser;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	CreateInvItem(self,ItMi_Pliers);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_L_NormalBart02,BodyTex_L,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_503;
	aivar[AIV_TheftDex] = 49;
	CreateInvItems(self, ItMi_Gold, 35);
};


func void Rtn_Start_503()
{
	TA_Read_Bookstand(8,0,23,0,"NW_MONASTERY_RUNEMAKER_02");
	TA_Read_Bookstand(8,0,23,0,"NW_MONASTERY_RUNEMAKER_02");
};

