
var string BDT_801_Chief_Name;

instance BDT_801_Chief(Npc_Default)
{
	id = 801;
	name[0] = "Контрабандист";
	name[1] = "Друг Вино";
	name[2] = "Честный торговец";
	guild = GIL_BDT;
	voice = 5;//12;
	flags = 0;
	
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Bartholo,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetAttributesToChapter(self,3);
	B_SetFightSkills(self,60);
	B_GiveNpcTalents(self);
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Crossbow_M_01);
	B_CreateAmbientInv(self);
	
	daily_routine = Rtn_Start_801;
	
};

func void Rtn_Start_801()
{
	TA_Smoke_Joint(8,0,8,30,"NW_FOREST_VINOSKELLEREI_07");
	TA_Potion_Alchemy(8,30,10,0,"NW_FOREST_VINOSKELLEREI_05");
	TA_Cook_Cauldron(10,0,11,0,"NW_FOREST_VINOSKELLEREI_06");
	TA_Potion_Alchemy(11,0,14,0,"NW_FOREST_VINOSKELLEREI_05");
	TA_Potion_Alchemy(14,0,22,0,"NW_FOREST_VINOSKELLEREI_06");
	TA_Stand_Drinking(22,0,23,0,"NW_FOREST_VINOSKELLEREI_07");
	TA_Smoke_Joint(23,0,23,0,"NW_FOREST_VINOSKELLEREI_07");
	TA_Sit_Throne(23,30,8,0,"NW_FOREST_VINOSKELLEREI_07");
};
