
instance BDT_804_Bootlegger(Npc_Default)
{
	id = 804;
	name[0] = "Бандит";
	name[1] = "Друг Вино";
	name[2] = "Охранник";
	guild = GIL_BDT;
	voice = 24;//13;
	flags = 0;
	
	npcType = npctype_main;
	
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal06,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetAttributesToChapter(self,4);
	B_SetFightSkills(self,50);
	B_GiveNpcTalents(self);
	EquipItem(self,ItMw_Schwert3);
	B_CreateAmbientInv(self);
	
	daily_routine = Rtn_Start_804;
};

func void Rtn_Start_804()
{
	TA_Smoke_Joint(8,0,9,0,"NW_FOREST_VINOSKELLEREI_04");
	TA_Stand_Guarding(9,0,14,0,"NW_FOREST_VINOSKELLEREI_04");
	TA_Stand_Eating(14,0,15,0,"NW_FOREST_VINOSKELLEREI_08");
	TA_Sit_Campfire(15,0,8,0,"NW_FOREST_VINOSKELLEREI_08");
};
