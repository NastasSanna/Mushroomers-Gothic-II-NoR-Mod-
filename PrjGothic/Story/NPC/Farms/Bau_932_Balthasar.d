
instance BAU_932_Balthasar(Npc_Default)
{
	name[0] = "Бальтазар";
	guild = GIL_BAU;
	id = 932;
	voice = 15;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_NormalBart01,BodyTex_P,ITAR_Bau_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_932;
	aivar[AIV_TheftDex] = 10;
	CreateInvItems(self, ItMi_Gold, 10);
};


func void Rtn_Start_932()
{
	TA_Stand_Eating(8,0,22,0,"NW_BIGMILL_FARM3_BALTHASAR");
	TA_Stand_Eating(22,0,8,0,"NW_BIGMILL_FARM3_BALTHASAR");
};

