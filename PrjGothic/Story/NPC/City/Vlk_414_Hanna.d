
instance VLK_414_Hanna(Npc_Default)
{
	name[0] = "Ханна";
	guild = GIL_VLK;
	id = 414;
	voice = 19;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_IgnoreFlags] = aivar[AIV_IgnoreFlags] | IGNORE_PortalRoom_Public;
	
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe1",FaceBabe_N_WhiteCloth,BodyTex_N,ITAR_VlkBabe_L);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	
	daily_routine = Rtn_Start_414;
	aivar[AIV_TheftDex] = 45;
	
	B_CreateAmbientInv(self);
	CreateInvItems(self, ItMi_Gold, 25);
};


func void Rtn_Start_414()
{
	if (C_HeroIs_Sarah())	{
		TA_Stand_ArmsCrossed(6,0,18,10,"NW_CITY_HANNA");
		TA_Smalltalk(18,10,21,40,"NW_CITY_HANNA");
		TA_Sit_Throne(21,40,6,0,"NW_CITY_TO_KANAL_07");
	}
	else	{
		TA_Stand_ArmsCrossed(6,0,22,0,"NW_CITY_HANNA");
		TA_Sit_Throne(22,0,6,0,"NW_CITY_TO_KANAL_07");
	};
};
func void Rtn_Tot_414()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};

