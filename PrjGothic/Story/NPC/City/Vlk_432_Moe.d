
instance VLK_432_Moe(Npc_Default)
{
	name[0] = "Мо";
	guild = GIL_NONE;
	id = 432;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Scar,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_432;
	aivar[AIV_TheftDex] = 25;
	CreateInvItems(self, ItMi_Gold, 30);
};


func void Rtn_Start_432()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_HABOUR_TAVERN01_ENTRY");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_HABOUR_TAVERN01_ENTRY");
};
func void Rtn_Tot_432()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};

