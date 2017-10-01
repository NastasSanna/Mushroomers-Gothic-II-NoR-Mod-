
prototype Npc_Proto_Erol(C_Npc)
{
	//default
	level = 13;
	exp = C_GetExp_Next(level - 1);//	exp = 28600;
	exp_next = C_GetExp_Next(level);//exp + 3400;
	damagetype = DAM_BLUNT;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = NPC_TIME_FOLLOW;
	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	bodyStateInterruptableOverride = FALSE;
	
	//›ÓÎ
	name[0] = "›ÓÎ";
	guild = GIL_NONE;
	voice = 10;
	
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride;
	
	attribute[ATR_STRENGTH]			= 90;
	attribute[ATR_DEXTERITY]		= 15;
	attribute[ATR_MANA_MAX]			= 20;
	attribute[ATR_MANA]				= 20;
	attribute[ATR_HITPOINTS_MAX]	= 170;
	attribute[ATR_HITPOINTS]		= 170;
	aivar[REAL_STRENGTH]		= attribute[ATR_STRENGTH];
	aivar[REAL_DEXTERITY]		= attribute[ATR_DEXTERITY];
	aivar[REAL_MANA_MAX]		= attribute[ATR_MANA_MAX];
	aivar[REAL_HITPOINTS_MAX]	= attribute[ATR_HITPOINTS_MAX];
	fight_tactic = FAI_HUMAN_STRONG;
};
	
func void B_SetVisuals_Erol()
{
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Corristo,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
};

func void B_SetTalents_Erol()
{
	B_RaiseFightTalent(self,NPC_TALENT_1H,30);
	B_RaiseFightTalent(self,NPC_TALENT_2H,30);
	B_RaiseFightTalent(self,NPC_TALENT_BOW,10);
	B_RaiseFightTalent(self,NPC_TALENT_CROSSBOW,15);
	
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,0);
	Npc_SetTalentSkill(self,NPC_TALENT_ACROBAT,0);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,0);
	Npc_SetTalentSkill(self,NPC_TALENT_TAKEANIMALTROPHY,1);
	Npc_SetTalentSkill(self,NPC_TALENT_ALCHEMY,0);
	Npc_SetTalentSkill(self,NPC_TALENT_HERONAME,2);
};

func void B_HeroGiveInv_Erol()
{
	CreateInvItem(self,ItMw_Steinbrecher);

	CreateInvItems(self,ItMi_Gold,62);
	CreateInvItems(self,ItPo_Health_01,3);
	CreateInvItems(self,ItFo_Apple,1);
	CreateInvItems(self,ItFo_Sausage,1);
	CreateInvItems(self,ItFo_Wine,1);
	CreateInvItems(self,ItSc_Icebolt,1);
	CreateInvItems(self,ITKE_ORLAN_HOTELZIMMER,1);
	CreateInvItems(self,ItMi_OldCoin,5);
};

// √√ =============================================
instance PC_Erol(Npc_Proto_Erol)
{
	id = PC_Erol_ID;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_HERO;
	aivar[AIV_IgnoreFlags] = IGNORE_All;
	
	bodyStateInterruptableOverride = TRUE;
	
	B_SetVisuals_Erol();

	B_SetTalents_Erol();
	
	B_HeroGiveInv_Erol();
	
	daily_routine = Rtn_Start_1603;
};

func void Rtn_Start_1603()
{
	TA_Sit_Bench(8,0,22,0,"WP_START_BENCH_01");
	TA_Sit_Bench(22,0,8,0,"WP_START_BENCH_01");
};

//  ŒÕ ”–≈Õ“ =============================================
instance CMP_Erol(Npc_Proto_Erol)
{
	id = CMP_Erol_ID;
	npcType = NPCTYPE_Competitor;
	
	attribute[ATR_STRENGTH]			*= 2;
	attribute[ATR_DEXTERITY]		*= 2;
	attribute[ATR_MANA_MAX]			*= 2;
	attribute[ATR_MANA]				*= 2;
	attribute[ATR_HITPOINTS_MAX]	*= 3;
	attribute[ATR_HITPOINTS]		*= 3;

	B_SetVisuals_Erol();

	B_SetTalents_Erol();
	
	B_HeroGiveInv_Erol();
	
	daily_routine = Rtn_Start_1653;
};

func void Rtn_Start_1653()
{
	TA_Stand_Eating(5,2,5,30,"NW_BIGFARM_HUT_OUT_01");
	TA_PickMushrooms(5,30,5,32,"NW_BIGFARM_ALLEE_10");
	TA_PickMushrooms(5,32,5,34,"NW_BIGFARM_LAKE_01");
	TA_PickMushrooms(5,34,5,37,"NW_BIGFARM_LAKE_02");
	TA_PickMushrooms(5,37,5,40,"NW_BIGFARM_LAKE_03");
	TA_PickMushrooms(5,40,5,42,"NW_BIGFARM_LAKE_04");
	TA_PickMushrooms(5,42,5,44,"NW_BIGFARM_LAKE_05");
	TA_PickMushrooms(5,44,5,46,"NW_BIGFARM_LAKE_06");
	TA_PickMushrooms(5,46,5,48,"NW_BIGFARM_LAKE_07");
	TA_PickMushrooms(5,48,5,50,"NW_BIGFARM_LAKE_08");
	TA_PickMushrooms(5,50,5,52,"NW_BIGFARM_LAKE_09");
	TA_PickMushrooms(5,52,5,54,"NW_TAVERNE_BIGFARM_05");
	TA_PickMushrooms(5,54,5,56,"NW_TAVERNE_BIGFARM_05");
	TA_PickMushrooms(5,56,5,58,"NW_TAVERNE_BIGFARM_04");
	TA_PickMushrooms(5,58,6,0,"NW_TAVERNE_04");
	TA_PickMushrooms(6,0,6,2,"NW_TAVERNE_05");
	TA_PickMushrooms(6,2,6,5,"NW_TAVERNE_06");
	TA_PickMushrooms(6,5,6,10,"NW_FOREST_CROSS_MONASTERY");
	TA_PickMushrooms(6,10,6,15,"NW_TAVERN_TO_FOREST_03");
	TA_PickMushrooms(6,15,6,22,"NW_CITY_TO_FOREST_17");
	TA_PickMushrooms(6,22,6,25,"NW_CITY_TO_FARM2_04");
	TA_PickMushrooms(6,25,6,30,"NW_FOREST_PATH_02");
	TA_PickMushrooms(6,30,9,0,"NW_FOREST_PATH_05");
	TA_PickMushrooms(9,0,11,0,"NW_FOREST_PATH_54");
	TA_PickMushrooms(11,0,11,30,"NW_FOREST_PATH_66");
	TA_PickMushrooms(11,30,13,0,"NW_TROLLAREA_RITUALFOREST_01");
	TA_PickMushrooms(13,0,14,30,"NW_TROLLAREA_PATH_72");
	TA_PickMushrooms(14,30,16,0,"NW_TROLLAREA_PATH_13");
	TA_PickMushrooms(16,0,17,0,"NW_TROLLAREA_RUINS_15");
	TA_PickMushrooms(17,0,19,0,"NW_TROLLAREA_PATH_50");
	TA_PickMushrooms(19,0,19,10,"NW_TROLLAREA_PATH_57");
	TA_PickMushrooms(19,10,19,15,"NW_TROLLAREA_PATH_60");
	TA_PickMushrooms(19,15,19,20,"NW_TROLLAREA_PATH_62");
	TA_PickMushrooms(19,20,19,25,"NW_TROLLAREA_PATH_66");
	TA_PickMushrooms(19,25,19,30,"NW_TAVERNE_TROLLAREA_13");
	TA_PickMushrooms(19,30,19,35,"NW_TT_ADD_01");
	TA_PickMushrooms(19,35,19,40,"NW_TAVERNE_TROLLAREA_08");
	TA_PickMushrooms(19,40,19,45,"NW_TAVERNE_TROLLAREA_04");
	TA_Stand_WP(19,45,19,48,"NW_CITY_ENTRANCE_BACK");
	TA_Smalltalk(19,48,20,50,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Stand_Eating(20,50,21,20,"NW_TAVERNE_IN_05");
	TA_Stand_Drinking(21,20,21,50,"NW_TAVERNE_IN_05");
	TA_Sleep(21,50,5,2,"NW_BIGFARM_HUTINSIDE_BED");
};
func void Rtn_DayS_1653()
{
	TA_Sit_Chair(8,16,10,0,"NW_BIGFARM_HUT_IN_01");
	TA_Smalltalk(10,0,11,0,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Smalltalk(11,0,13,0,"NW_TAVERNE_IN_05");
	TA_Stand_Drinking(13,0,15,0,"NW_TAVERNE_IN_05");
	TA_Stand_ArmsCrossed(15,0,19,30,"NW_BIGFARM_STABLE_OUT_04");
	TA_Stand_Eating(19,30,20,45,"NW_BIGFARM_HOUSE_UP1_02");
	TA_Smalltalk(20,45,22,5,"NW_BIGFARM_HOUSE_UP1_02");
	TA_Silenttalk(22,5,23,15,"NW_BIGFARM_HOUSE_16_A");
	TA_Sleep(23,15,8,16,"NW_BIGFARM_HUTINSIDE_BED");
};
func void Rtn_After_1653()
{
	TA_Stand_Guarding(8,32,19,0,"NW_BIGFARM_HUT_OUT_01");
	TA_Stand_Eating(19,0,20,40,"NW_TAVERNE_IN_05");
	TA_Stand_Drinking(20,40,21,50,"NW_TAVERNE_IN_05");
	TA_Sit_Chair(21,50,23,4,"NW_BIGFARM_HUT_IN_01");
	TA_Sleep(23,4,8,32,"NW_BIGFARM_HUTINSIDE_BED");
};
func void Rtn_TOT_1653()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};
