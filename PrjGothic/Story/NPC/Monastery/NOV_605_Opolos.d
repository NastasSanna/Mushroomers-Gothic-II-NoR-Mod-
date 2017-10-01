
instance NOV_605_Opolos(Npc_Default)
{
	name[0] = "Ополос";
	guild = GIL_NOV;
	id = 605;
	voice = 15;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Tough_Silas,BodyTex_B,ItAr_NOV_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_605;
	aivar[AIV_TheftDex] = 54;
	CreateInvItems(self, ItMi_Gold, 70);
};


func void Rtn_Start_605()
{
	TA_Stand_Guarding(5,30,23,30,"NW_MONASTERY_SHEEP_05");
	TA_Sleep(23,30,5,30,"NW_MONASTERY_NOVICE01_05");
};

