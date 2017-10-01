
instance KDF_502_Ulthar(Npc_Default)
{
	name[0] = "Ультар";
	guild = GIL_KDF;
	id = 502;
	voice = 2;//5;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Temper] = TEMPER_MagicUser;
	aivar[AIV_IGNOREFlags] = IGNORE_Murder | IGNORE_Theft | IGNORE_Sheepkiller;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_NormalBart01,BodyTex_L,ItAr_KDF_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_502;
	aivar[AIV_TheftDex] = 74;
	CreateInvItems(self, ItMi_Gold, 320);
};


func void Rtn_Start_502()
{
	TA_Sit_Throne(7,11,23,0,"NW_MONASTERY_THRONE_03");
	TA_Sleep(23,0,7,11,"NW_MONASTERY_MAGE01_BED_03");
};

