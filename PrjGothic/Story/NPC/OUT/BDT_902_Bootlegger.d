
instance BDT_802_Bootlegger(Npc_Default)
{
	id = 802;
	name[0] = "Бандит";
	name[1] = "Друг Вино";
	name[2] = "Охранник";
	guild = GIL_BDT;
	voice = 24;//13;
	flags = 0;
	
	npcType = npctype_main;
	
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Jackal,BodyTex_L,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetAttributesToChapter(self,4);
	B_SetFightSkills(self,70);
	B_GiveNpcTalents(self);
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Bow_M_03);
	B_CreateAmbientInv(self);
	
	daily_routine = Rtn_Start_802;
};

func void Rtn_Start_802()
{
	TA_Cook_Cauldron(12,0,14,0,"NW_FOREST_VINOSKELLEREI_08");
	TA_Stand_Eating(14,0,15,0,"NW_FOREST_VINOSKELLEREI_04");
	TA_Smoke_Joint(15,0,16,0,"NW_FOREST_VINOSKELLEREI_04");
	TA_Stand_Guarding(16,0,20,0,"NW_FOREST_VINOSKELLEREI_04");
	TA_Sit_Campfire(20,0,12,0,"NW_FOREST_VINOSKELLEREI_06");
};

