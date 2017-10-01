
instance BAU_960_Bengar(Npc_Default)
{
	name[0] = "Бенгар";
	guild = GIL_BAU;
	id = 960;
	voice = 9;//12;
//	aivar[AIV_IgnoreFlags] = IGNORE_PortalRoom_Public;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal_Olli_Kahn,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_Start_960;
	aivar[AIV_TheftDex] = 28;
	CreateInvItems(self, ItMi_Gold, 50);
};


func void Rtn_Start_960()
{
	TA_Stand_Guarding(8,10,22,0,"NW_FARM3_BENGAR");
	TA_Sleep(22,0,8,10,"NW_FARM3_HOUSE_IN_BED");
};

func void Rtn_MilComing_960()
{
	TA_Smalltalk(8,0,22,0,"NW_FARM3_BENGAR");
	TA_Smalltalk(22,0,8,0,"NW_FARM3_BENGAR");
};

