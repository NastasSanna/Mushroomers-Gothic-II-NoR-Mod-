
instance KDF_501_Serpentes(Npc_Default)
{
	name[0] = "Серпентес";
	guild = GIL_KDF;
	id = 501;
	voice = 5;//12;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Temper] = TEMPER_MagicUser;
	aivar[AIV_IgnoreFlags] = IGNORE_Murder | IGNORE_Theft | IGNORE_Sheepkiller;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_PSIONIC",Face_N_ImportantGrey,BodyTex_N,ItAr_KDF_H);
	Mdl_SetModelFatness(self,-2);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_501;
	aivar[AIV_TheftDex] = 86;
	CreateInvItems(self, ItMi_Gold, 380);
};


func void Rtn_Start_501()
{
	TA_Sit_Throne(7,8,23,0,"NW_MONASTERY_THRONE_02");
	TA_Sleep(23,0,7,8,"NW_MONASTERY_MAGE01_BED_02");
};

