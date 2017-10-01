
instance BDT_803_Bootlegger(Npc_Default)
{
	id = 803;
	name[0] = "Бандит";
	name[1] = "Друг Вино";
	name[2] = "Охранник";
	guild = GIL_BDT;
	voice = 24;//13;
	flags = 0;
	
	npcType = npctype_main;
	
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Normal01,BodyTex_P,ItAr_BDT_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetAttributesToChapter(self,4);
	B_SetFightSkills(self,50);
	B_GiveNpcTalents(self);
	EquipItem(self,ItMw_Spicker);
	B_CreateAmbientInv(self);
	
	daily_routine = Rtn_Start_803;
};

func void Rtn_Start_803()
{
	TA_Sit_Campfire(8,0,14,0,"NW_FOREST_VINOSKELLEREI_06");
	TA_Stand_Eating(14,0,15,0,"NW_FOREST_VINOSKELLEREI_06");
	TA_Sit_Chair(14,0,20,0,"NW_FOREST_VINOSKELLEREI_08");
	TA_Smoke_Joint(20,0,21,0,"NW_FOREST_VINOSKELLEREI_04");
	TA_Stand_Guarding(21,0,8,0,"NW_FOREST_VINOSKELLEREI_04");
};
