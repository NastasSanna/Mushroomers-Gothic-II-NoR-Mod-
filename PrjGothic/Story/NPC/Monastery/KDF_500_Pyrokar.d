
instance KDF_500_Pyrokar(Npc_Default)
{
	name[0] = "Пирокар";
	guild = GIL_KDF;
	id = 500;
	voice = 20;//11;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Temper] = TEMPER_MagicUser;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_ImportantOld,BodyTex_N,ItAr_KDF_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_500;
	aivar[AIV_TheftDex] = 108;
	aivar[AIV_IgnoreFlags] = IGNORE_All;
	CreateInvItems(self, ItMi_Gold, 550);
};


func void Rtn_Start_500()
{
	TA_Sit_Throne(7,10,23,0,"NW_MONASTERY_THRONE_01");
	TA_Sleep(23,0,7,10,"NW_MONASTERY_MAGE01_BED_01");
};


