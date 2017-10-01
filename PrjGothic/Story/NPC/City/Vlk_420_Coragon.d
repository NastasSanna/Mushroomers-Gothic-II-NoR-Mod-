
instance VLK_420_Coragon(Npc_Default)
{
	name[0] = "Корагон";
	guild = GIL_VLK;
	id = 420;
	voice = 2;//9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_IgnoreFlags] = IGNORE_PortalRoom_Public | IGNORE_Drunk;
	B_SetFightSkills(self,40);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald.",Face_N_Normal_Blade,BodyTex_N,ITAR_Smith);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_SetAttributesToChapter(self,3);
	B_GiveNpcTalents(self);
	daily_routine = Rtn_Start_420;
	aivar[AIV_TheftDex] = 40;
	CreateInvItems(self, ItMi_Gold, 45);
};


func void Rtn_Start_420()
{
	TA_Stand_ArmsCrossed(5,0,9,15,"NW_CITY_TAVERN_IN_03");
	TA_Smalltalk(9,15,10,20,"NW_CITY_TAVERN_IN_03");	//Регис
	TA_Stand_ArmsCrossed(10,20,5,0,"NW_CITY_TAVERN_IN_03");
};
func void Rtn_TOT_420()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};

