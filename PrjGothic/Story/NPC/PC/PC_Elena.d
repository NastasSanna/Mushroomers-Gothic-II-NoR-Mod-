
prototype Npc_Proto_Elena(C_Npc)
{
	//default
	level= 11;
	exp = C_GetExp_Next(level - 1);//	exp = 22000;
	exp_next = C_GetExp_Next(level);//exp + 3000;
	damagetype = DAM_BLUNT;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = NPC_TIME_FOLLOW;
	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	bodyStateInterruptableOverride = FALSE;
	
	//≈ÎÂÌ‡
	name[0] = "≈ÎÂÌ‡";
	guild = GIL_BAU;
	voice = 16;
	
	attribute[ATR_STRENGTH]			= 25;
	attribute[ATR_DEXTERITY]		= 70;
	attribute[ATR_MANA_MAX]			= 20;
	attribute[ATR_MANA]				= 20;
	attribute[ATR_HITPOINTS_MAX]	= 150;
	attribute[ATR_HITPOINTS]		= 150;
	aivar[REAL_STRENGTH]		= attribute[ATR_STRENGTH];
	aivar[REAL_DEXTERITY]		= attribute[ATR_DEXTERITY];
	aivar[REAL_MANA_MAX]		= attribute[ATR_MANA_MAX];
	aivar[REAL_HITPOINTS_MAX]	= attribute[ATR_HITPOINTS_MAX];
	fight_tactic = FAI_HUMAN_NORMAL;
};

func void B_SetVisuals_Elena()
{
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe3",FaceBabe_N_GreyCloth,BodyTexBabe_N,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
};

func void B_SetTalents_Elena()
{
	B_RaiseFightTalent(self,NPC_TALENT_1H,25);
	B_RaiseFightTalent(self,NPC_TALENT_2H,10);
	B_RaiseFightTalent(self,NPC_TALENT_BOW,25);
	B_RaiseFightTalent(self,NPC_TALENT_CROSSBOW,10);
	
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,0);
	Npc_SetTalentSkill(self,NPC_TALENT_ACROBAT,1);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,0);
	Npc_SetTalentSkill(self,NPC_TALENT_TAKEANIMALTROPHY,0);
	Npc_SetTalentSkill(self,NPC_TALENT_ALCHEMY,0);
	Npc_SetTalentSkill(self,NPC_TALENT_HERONAME,1);
};

func void B_HeroGiveInv_Elena()
{
	CreateInvItem(self,ItMw_1h_Bau_Axe);

	CreateInvItems(self,ItFo_Water,2);
	CreateInvItems(self,ItPl_Health_Herb_02,1);
	CreateInvItems(self,ItMi_OldCoin,1);
	CreateInvItems(self,ItKe_Chest_Elena,1);
};

// √√ ===================================
instance PC_Elena(Npc_Proto_Elena)
{
	id = PC_ELENA_ID;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_HERO;
	aivar[AIV_IgnoreFlags] = IGNORE_All;
	
	bodyStateInterruptableOverride = TRUE;
	
	B_SetVisuals_Elena();

	B_SetTalents_Elena();
	
	B_HeroGiveInv_Elena();
	CreateInvItem(self,ItMw_1h_Elena_MySword);
	
	daily_routine = Rtn_Start_1601;
};

func void Rtn_Start_1601()
{
	TA_Smalltalk(8,0,22,0,"WP_START_BENCH_02");
	TA_Smalltalk(22,0,8,0,"WP_START_BENCH_02");
};

//  ŒÕ ”–≈Õ“ =================================

instance CMP_Elena(Npc_Proto_Elena)
{
	id = CMP_ELENA_ID;
	npcType = NPCTYPE_Competitor;
	voice = 17;
	
	attribute[ATR_STRENGTH]			*= 2;
	attribute[ATR_DEXTERITY]		*= 2;
	attribute[ATR_MANA_MAX]			*= 2;
	attribute[ATR_MANA]				*= 2;
	attribute[ATR_HITPOINTS_MAX]	*= 3;
	attribute[ATR_HITPOINTS]		*= 3;

	B_SetVisuals_Elena();

	B_SetTalents_Elena();
	
	B_HeroGiveInv_Elena();
	EquipItem(self,ItMw_1h_Elena_Sword);
	EquipItem(self,ItRw_Bow_L_04);
	
	daily_routine = Rtn_Start_1651;
};

func void Rtn_Start_1651()
{
	TA_PickMushrooms(7,6,9,0,"NW_BIGFARM_HOUSE_OUT_06");
	TA_PickMushrooms(9,0,12,0,"NW_BIGFARM_FOREST_03_NAVIGATION1");
	TA_PickMushrooms(12,0,13,30,"NW_CASTLEMINE_TROLL_01");
	TA_PickMushrooms(13,30,16,0,"NW_CASTLEMINE_TROLL_04_A");
	TA_PickMushrooms(16,0,17,30,"NW_BIGMILL_MALAKSVERSTECK_02");
	TA_PickMushrooms(17,30,18,0,"NW_BIGMILL_FIELD_MONSTER_01");
	TA_PickMushrooms(18,0,18,30,"NW_BIGMILL_PATH_05");
	TA_PickMushrooms(18,30,19,10,"NW_BIGFARM_CROSS");
	TA_Stand_WP(19,10,19,13,"NW_CITY_ENTRANCE_BACK");
	TA_Smalltalk(19,13,20,15,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Stand_Eating(20,15,20,55,"NW_BIGFARM_HOUSE_UP1_02");
	TA_Smalltalk(20,55,22,5,"NW_BIGFARM_HOUSE_UP1_02");
	TA_Silenttalk(22,5,23,15,"NW_BIGFARM_HOUSE_16_A");
	TA_Sleep(23,15,7,6,"NW_BIGFARM_HOUSE_UP2_04");
};
func void Rtn_DayS_1651()
{
	TA_Stand_ArmsCrossed(7,6,8,0,"NW_CITY_MERCHANT_PATH_13");
	TA_Smalltalk(8,0,9,0,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Stand_ArmsCrossed(9,0,10,0,"NW_BIGFARM_STABLE_OUT_04");
	TA_Smalltalk(10,0,12,0,"NW_BIGFARM_HOUSE_18");
	TA_Stand_ArmsCrossed(12,0,19,30,"NW_BIGFARM_STABLE_OUT_04");
	TA_Stand_Eating(19,30,20,45,"NW_BIGFARM_HOUSE_UP1_02");
	TA_Smalltalk(20,45,22,5,"NW_BIGFARM_HOUSE_UP1_02");
	TA_Silenttalk(22,5,23,15,"NW_BIGFARM_HOUSE_16_A");
	TA_Sleep(23,15,7,6,"NW_BIGFARM_HOUSE_UP2_04");
};
func void Rtn_After_1651()
{
	TA_Stand_ArmsCrossed(7,6,20,30,"NW_BIGFARM_STABLE_OUT_04");
	TA_Stand_Eating(19,30,20,45,"NW_BIGFARM_HOUSE_UP1_02");
	TA_Smalltalk(20,45,22,5,"NW_BIGFARM_HOUSE_UP1_02");
	TA_Silenttalk(22,5,23,15,"NW_BIGFARM_HOUSE_16_A");
	TA_Sleep(23,15,7,6,"NW_BIGFARM_HOUSE_UP2_04");
};
func void Rtn_TOT_1651()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};
