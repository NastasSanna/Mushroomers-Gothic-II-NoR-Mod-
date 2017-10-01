
prototype Npc_Proto_Odo(C_Npc)
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
	
	//Œ‰Ó
	name[0] = "Œ‰Ó";
	guild = GIL_NOV;
	voice = 3;
	
	attribute[ATR_STRENGTH]			= 40;
	attribute[ATR_DEXTERITY]		= 15;
	attribute[ATR_MANA_MAX]			= 100;
	attribute[ATR_MANA]				= 100;
	attribute[ATR_HITPOINTS_MAX]	= 150;
	attribute[ATR_HITPOINTS]		= 150;
	aivar[REAL_STRENGTH]		= attribute[ATR_STRENGTH];
	aivar[REAL_DEXTERITY]		= attribute[ATR_DEXTERITY];
	aivar[REAL_MANA_MAX]		= attribute[ATR_MANA_MAX];
	aivar[REAL_HITPOINTS_MAX]	= attribute[ATR_HITPOINTS_MAX];
	fight_tactic = FAI_HUMAN_NORMAL;
};
	
func void B_SetVisuals_Odo()
{
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal06,BodyTex_N,ItAr_NOV_L);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
};

func void B_SetTalents_Odo()
{
	B_RaiseFightTalent(self,NPC_TALENT_1H,10);
	B_RaiseFightTalent(self,NPC_TALENT_2H,25);
	B_RaiseFightTalent(self,NPC_TALENT_BOW,10);
	B_RaiseFightTalent(self,NPC_TALENT_CROSSBOW,10);
	
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,0);
	Npc_SetTalentSkill(self,NPC_TALENT_ACROBAT,0);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,0);
	Npc_SetTalentSkill(self,NPC_TALENT_TAKEANIMALTROPHY,0);
	Npc_SetTalentSkill(self,NPC_TALENT_ALCHEMY,1);
	Npc_SetTalentSkill(self,NPC_TALENT_HERONAME,3);
};

func void B_HeroGiveInv_Odo()
{
	CreateInvItem(self,ItMw_1h_Nov_Mace);

	CreateInvItems(self, ItMi_Gold, 24);
	CreateInvItems(self, ItPo_Health_01, 1);
	CreateInvItems(self, ItPo_Mana_01, 1);
	CreateInvItems(self, ItSc_Firebolt, 2);
	CreateInvItems(self, ItSc_MediumHeal, 1);
	CreateInvItems(self, ItSc_Light, 1);
	CreateInvItems(self, ItFo_Schafswurst, 1);
};

// √√ =============================================
instance PC_Odo(Npc_Proto_Odo)
{
	id = PC_Odo_ID;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_HERO;
	aivar[AIV_IgnoreFlags] = IGNORE_All;
	
	B_SetVisuals_Odo();
	
	B_SetTalents_Odo();
	
	B_HeroGiveInv_Odo();
	
	daily_routine = Rtn_Start_1604;
};

func void Rtn_Start_1604()
{
	TA_Pray_Innos_FP(8,0,22,0,"WP_START_INNOS");
	TA_Pray_Innos_FP(22,0,8,0,"WP_START_INNOS");
};

//  ŒÕ ”–≈Õ“ =============================================
instance CMP_Odo(Npc_Proto_Odo)
{
	id = CMP_Odo_ID;
	npcType = NPCTYPE_Competitor;
	voice = 11;
	
	attribute[ATR_STRENGTH]			*= 2;
	attribute[ATR_DEXTERITY]		*= 2;
	attribute[ATR_MANA_MAX]			*= 2;
	attribute[ATR_MANA]				*= 2;
	attribute[ATR_HITPOINTS_MAX]	*= 3;
	attribute[ATR_HITPOINTS]		*= 3;

	B_SetVisuals_Odo();
	
	B_SetTalents_Odo();
	
	B_HeroGiveInv_Odo();
	
	daily_routine = Rtn_Start_1654;
};

func void Rtn_Start_1654()
{
	TA_Pray_Innos_FP(7,0,8,0,"NW_MONASTERY_CHURCH_03");
	TA_PickMushrooms(8,0,9,0,"NW_PATH_TO_MONASTERY_10");
	TA_PickMushrooms(9,0,10,0,"NW_PATH_TO_MONASTERY_09");
	TA_PickMushrooms(10,0,11,0,"NW_PATH_TO_MONASTERY_06");
	TA_PickMushrooms(11,0,12,0,"NW_SHRINE_TO_PATH");
	TA_Pray_Innos(12,30,13,0,"NW_SHRINE_01");
	TA_PickMushrooms(13,0,14,30,"NW_TAVERNE_TROLLAREA_08");
	TA_PickMushrooms(14,30,16,30,"NW_TAVERNE_TROLLAREA_11");
	TA_Pray_Innos(16,30,17,0,"NW_TAVERNE_TROLLAREA_11_A");
	TA_PickMushrooms(17,0,18,20,"NW_TAVERN_TO_FOREST_03");
	TA_Stand_WP(18,20,18,23,"NW_CITY_ENTRANCE_BACK");
	TA_Smalltalk(18,23,19,30,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Stand_Sweeping(19,30,22,0,"NW_MONASTERY_PLACE_01");
	TA_Sleep(22,0,7,0,"NW_MONASTERY_NOVICE03_06");
};

func void Rtn_DayS_1654()
{
	TA_Pray_Innos_FP(7,0,8,30,"NW_MONASTERY_CHURCH_03");
	TA_Stand_WP(8,30,8,50,"NW_CITY_MERCHANT_PATH_28_E");
	TA_Smalltalk(8,50,9,30,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Stand_Sweeping(9,30,21,0,"NW_MONASTERY_PLACE_01");
	TA_Sleep(21,0,7,0,"NW_MONASTERY_NOVICE03_06");
};
func void Rtn_After_1654()
{
	TA_Pray_Innos_FP(7,0,9,0,"NW_MONASTERY_CHURCH_03");
	TA_Stand_Sweeping(9,0,21,0,"START_ODO");
	TA_Sleep(21,0,7,0,"NW_MONASTERY_NOVICE03_06");
};
func void Rtn_TOT_1654()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};
