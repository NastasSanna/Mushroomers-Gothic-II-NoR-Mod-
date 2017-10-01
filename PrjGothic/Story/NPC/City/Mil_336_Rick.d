
instance Mil_336_Rick(Npc_Default)
{
	name[0] = "Рик";
	guild = GIL_MIL;
	id = 336;
	voice = 2;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride | TEMPER_BodyGuard;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_N_Ricelord,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Guard_336;
	aivar[AIV_TheftDex] = 10;
	CreateInvItems(self, ItMi_Gold, 45);
};


func void Rtn_Guard_336()
{
	TA_GuardNpc(6,50,7,5,"NW_CITY_MERCHANT_SHOP03_FRONT_02");
	TA_GuardNpc(7,5,8,30,"NW_CITY_TO_FOREST_04");
	TA_GuardNpc(8,30,9,15,"NW_CITY_TO_FOREST_13");
	TA_GuardNpc(9,15,10,30,"NW_CITY_TO_FARM2_04");
	TA_GuardNpc(10,30,12,0,"NW_CITY_TO_FARM2_05_MOV5");
	TA_GuardNpc(12,0,13,20,"NW_FOREST_PATH_05");
	TA_GuardNpc(13,20,14,40,"FOREST");
	TA_GuardNpc(14,40,16,0,"NW_FOREST_PATH_25");
	TA_GuardNpc(16,0,17,0,"NW_FOREST_PATH_35");
	TA_GuardNpc(17,0,18,20,"NW_CITY_SMFOREST_01");
	TA_GuardNpc(18,20,18,23,"NW_CITY_ENTRANCE_BACK");
	TA_GuardNpc(18,23,19,30,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_GuardNpc(19,30,21,40,"NW_CITY_MERCHANT_SHOP03_IN_01");
	TA_Sit_Chair(21,40,6,50,"NW_CITY_HABOUR_KASERN_BARRACK01_IN_B");
};

func void Rtn_Start_336()
{
	TA_Smalltalk(8,40,11,14,"NW_CITY_KASERN_BARRACK02_03"); //Румбольд
	TA_Smalltalk(11,14,13,14,"NW_CITY_TAVERN_IN_06");
	TA_Stand_ArmsCrossed(13,14,16,55,"NW_CITY_PLAZE_03");
	TA_Stand_ArmsCrossed(16,55,21,40,"NW_CITY_HABOUR_KASERN_13");
	TA_Sit_Chair(21,40,8,40,"NW_CITY_HABOUR_KASERN_BARRACK01_ENTRY_01");
};
