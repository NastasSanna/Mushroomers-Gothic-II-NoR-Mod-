
instance OUT_1204_Grom(Npc_Default)
{
	name[0] = "Гром";
	guild = GIL_OUT;
	id = 981;
	voice = 2;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Gilbert,BodyTex_P,ITAR_Bau_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_1204;
	aivar[AIV_TheftDex] = 75;
	CreateInvItems(self, ItMi_Gold, 40);
};


func void Rtn_Start_1204()
{
	TA_Stand_Eating(7,3,8,9,"NW_CASTLEMINE_TROLL_02");
	TA_Saw(8,9,21,0,"NW_CASTLEMINE_TROLL_02_A");
	TA_Sit_Campfire(7,3,8,9,"NW_CASTLEMINE_TROLL_02");
	TA_Sleep(23,0,7,3,"NW_CASTLEMINE_TROLL_02_C");
};

