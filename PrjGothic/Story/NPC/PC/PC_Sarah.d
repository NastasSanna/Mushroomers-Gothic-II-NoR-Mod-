
prototype Npc_Proto_Sarah(C_Npc)
{
	//default
	level = 12;
	exp = C_GetExp_Next(level - 1);//	exp = 25200;
	exp_next = C_GetExp_Next(level);//exp + 3200;
	damagetype = DAM_BLUNT;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = NPC_TIME_FOLLOW;
	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	bodyStateInterruptableOverride = FALSE;
	
	//—‡‡
	name[0] = "—‡‡";
	guild = GIL_VLK;
	voice = 16;
	
	attribute[ATR_STRENGTH]			= 30;
	attribute[ATR_DEXTERITY]		= 35;
	attribute[ATR_MANA_MAX]			= 30;
	attribute[ATR_MANA]				= 30;
	attribute[ATR_HITPOINTS_MAX]	= 130;
	attribute[ATR_HITPOINTS]		= 130;
	aivar[REAL_STRENGTH]		= attribute[ATR_STRENGTH];
	aivar[REAL_DEXTERITY]		= attribute[ATR_DEXTERITY];
	aivar[REAL_MANA_MAX]		= attribute[ATR_MANA_MAX];
	aivar[REAL_HITPOINTS_MAX]	= attribute[ATR_HITPOINTS_MAX];
	fight_tactic = FAI_HUMAN_MASTER;
};
	
func void B_SetVisuals_Sarah()
{
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabe_N_Blondie,BodyTexBabe_N,ITAR_VlkBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
};

func void B_SetTalents_Sarah()
{
	B_RaiseFightTalent(self,NPC_TALENT_1H,70);
	B_RaiseFightTalent(self,NPC_TALENT_2H,25);
	B_RaiseFightTalent(self,NPC_TALENT_BOW,30);
	B_RaiseFightTalent(self,NPC_TALENT_CROSSBOW,10);
	
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,0);
	Npc_SetTalentSkill(self,NPC_TALENT_ACROBAT,0);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,0);
	Npc_SetTalentSkill(self,NPC_TALENT_TAKEANIMALTROPHY,0);
	Npc_SetTalentSkill(self,NPC_TALENT_ALCHEMY,0);
	Npc_SetTalentSkill(self,NPC_TALENT_HERONAME,5);
};

func void B_HeroGiveInv_Sarah()
{
	CreateInvItem(self,ItMw_1h_Vlk_Sword);

	CreateInvItems(self, ItMi_Gold, 20);
	CreateInvItems(self, ItFo_Cheese, 1);
	CreateInvItems(self, ItFo_Water, 1);
};

// √√ =============================================
instance PC_Sarah(Npc_Proto_Sarah)
{
	id = PC_Sarah_ID;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_HERO;
	aivar[AIV_IgnoreFlags] = IGNORE_All;
	
	B_SetVisuals_Sarah();

	B_SetTalents_Sarah();
	
	B_HeroGiveInv_Sarah();
	
	daily_routine = Rtn_Start_1602;
};

func void Rtn_Start_1602()
{
	TA_Smalltalk(8,0,22,0,"WP_START_BENCH_02");
	TA_Smalltalk(22,0,8,0,"WP_START_BENCH_02");
};

//  ŒÕ ”–≈Õ“ =============================================
instance CMP_Sarah(Npc_Proto_Sarah)
{
	id = CMP_Sarah_ID;
	npcType = NPCTYPE_Competitor;
	voice = 16;
	
	attribute[ATR_STRENGTH]			*= 2;
	attribute[ATR_DEXTERITY]		*= 2;
	attribute[ATR_MANA_MAX]			*= 2;
	attribute[ATR_MANA]				*= 2;
	attribute[ATR_HITPOINTS_MAX]	*= 3;
	attribute[ATR_HITPOINTS]		*= 3;

	B_SetVisuals_Sarah();

	B_SetTalents_Sarah();
	
	B_HeroGiveInv_Sarah();
	
	daily_routine = Rtn_Start_1652;
};

func void Rtn_Start_1652()
{
	TA_Stand_Eating(6,20,7,5,"NW_CITY_MERCHANT_SHOP03_FRONT_02");
	TA_PickMushrooms(7,5,8,30,"NW_CITY_TO_FOREST_04");
	TA_PickMushrooms(8,30,9,15,"NW_CITY_TO_FOREST_13");
	TA_PickMushrooms(9,15,10,30,"NW_CITY_TO_FARM2_04");
	TA_PickMushrooms(10,30,12,0,"NW_CITY_TO_FARM2_05_MOV5");
	TA_PickMushrooms(12,0,13,20,"NW_FOREST_PATH_05");
	TA_PickMushrooms(13,20,14,40,"FOREST");
	TA_PickMushrooms(14,40,16,0,"NW_FOREST_PATH_25");
	TA_PickMushrooms(16,0,17,0,"NW_FOREST_PATH_35");
	TA_PickMushrooms(17,0,18,20,"NW_CITY_SMFOREST_01");
	TA_Stand_WP(18,20,18,23,"NW_CITY_ENTRANCE_BACK");
	TA_Smalltalk(18,23,19,30,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Smalltalk(19,30,21,40,"NW_CITY_MERCHANT_SHOP03_IN_01");
	TA_Sleep(21,40,6,20,"NW_CITY_HOTEL_BED_06");
};

func void Rtn_DayS_1652()
{
	TA_Stand_Eating(6,20,8,15,"NW_CITY_MERCHANT_SHOP03_FRONT_02");
	TA_Smalltalk(8,15,9,5,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Smalltalk(9,5,13,2,"NW_CITY_MERCHANT_SHOP03_IN_01");
	TA_Stand_Eating(13,2,15,8,"NW_CITY_MERCHANT_SHOP03_FRONT_02");
	TA_Stand_Guarding(15,8,15,53,"NW_CITY_MERCHANT_PATH_30");
	TA_Stand_ArmsCrossed(15,53,16,28,"NW_CITY_MERCHANT_PATH_36_C");
	TA_Stand_Eating(16,28,17,14,"NW_CITY_MERCHANT_PATH_28_E");
	TA_Stand_WP(17,14,18,35,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Stand_ArmsCrossed(18,35,20,55,"NW_CITY_HABOUR_02_B");
	TA_Sit_Throne(20,55,21,40,"NW_CITY_HOTEL_UPTSAIRS_05");
	TA_Sleep(21,40,6,20,"NW_CITY_HOTEL_BED_06");
};
func void Rtn_After_1652()
{
	TA_Stand_Eating(6,40,8,55,"NW_CITY_MERCHANT_SHOP03_FRONT_02");
	TA_Smalltalk(8,55,13,2,"NW_CITY_MERCHANT_SHOP03_IN_01");
	TA_Stand_Eating(13,2,15,8,"NW_CITY_MERCHANT_SHOP03_FRONT_02");
	TA_Stand_Guarding(15,8,15,53,"NW_CITY_MERCHANT_PATH_30");
	TA_Stand_ArmsCrossed(15,53,16,28,"NW_CITY_MERCHANT_PATH_36_C");
	TA_Stand_Eating(16,28,17,14,"NW_CITY_MERCHANT_PATH_28_E");
	TA_Stand_WP(17,14,18,35,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Stand_ArmsCrossed(18,35,20,55,"NW_CITY_HABOUR_02_B");
	TA_Sit_Throne(20,55,21,40,"NW_CITY_HOTEL_UPTSAIRS_05");
	TA_Sleep(21,40,6,40,"NW_CITY_HOTEL_BED_06");
};
func void Rtn_TOT_1652()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};
