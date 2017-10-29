
prototype Npc_Proto_Till(C_Npc)
{
	//default
	level = 10;
	exp = C_GetExp_Next(level - 1);//	exp = 19000;
	exp_next = C_GetExp_Next(level);//exp + 2800;
	damagetype = DAM_BLUNT;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = NPC_TIME_FOLLOW;
	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	bodyStateInterruptableOverride = FALSE;
	
	//“ËÎÎ
	name[0] = "“ËÎÎ";
	guild = GIL_BAU;
	voice = 14;
	
	attribute[ATR_STRENGTH]			= 30;
	attribute[ATR_DEXTERITY]		= 15;
	attribute[ATR_MANA_MAX]			= 10;
	attribute[ATR_MANA]				= 10;
	attribute[ATR_HITPOINTS_MAX]	= 220;
	attribute[ATR_HITPOINTS]		= 220;
	aivar[REAL_STRENGTH]		= attribute[ATR_STRENGTH];
	aivar[REAL_DEXTERITY]		= attribute[ATR_DEXTERITY];
	aivar[REAL_MANA_MAX]		= attribute[ATR_MANA_MAX];
	aivar[REAL_HITPOINTS_MAX]	= attribute[ATR_HITPOINTS_MAX];
	fight_tactic = FAI_HUMAN_COWARD;
};
	
func void B_SetVisuals_Till()
{
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",163/*Face_P_Weak_Cutter*/,BodyTex_P,ITAR_Bau_L);
	Mdl_SetModelFatness(self,-1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Flee.mds");
};

func void B_SetTalents_Till()
{
	B_RaiseFightTalent(self,NPC_TALENT_1H,15);
	B_RaiseFightTalent(self,NPC_TALENT_2H,10);
	B_RaiseFightTalent(self,NPC_TALENT_BOW,10);
	B_RaiseFightTalent(self,NPC_TALENT_CROSSBOW,10);
	
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,0);
	Npc_SetTalentSkill(self,NPC_TALENT_ACROBAT,0);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,0);
	Npc_SetTalentSkill(self,NPC_TALENT_TAKEANIMALTROPHY,1);
	Npc_SetTalentSkill(self,NPC_TALENT_ALCHEMY,0);
	Npc_SetTalentSkill(self,NPC_TALENT_HERONAME,7);
};

func void B_HeroGiveInv_Till()
{
	CreateInvItem(self,ItMw_1h_Vlk_Axe);

	CreateInvItems(self,ItFo_Milk,1);
	CreateInvItems(self,ItFo_Sausage,1);
	CreateInvItems(self,ItFo_Stew,1);
	CreateInvItems(self,ItFo_Bread,1);
	CreateInvItems(self,ItFo_Cheese,1);
	CreateInvItems(self,ItFo_Water,1);
	CreateInvItems(self,ItMi_Gold,8);
};

// √√ =============================================
instance PC_Till(Npc_Proto_Till)
{
	id = PC_Till_ID;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_HERO;
	aivar[AIV_IgnoreFlags] = IGNORE_All;
	
	bodyStateInterruptableOverride = TRUE;
	
	/* “≈—“
	aivar[AIV_IgnoreFlags] = IGNORE_All;
	aivar[AIV_Behaviour] = BEHAV_NoDamageReaction | BEHAV_NeverRansack;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride | TEMPER_NoFightParker;
	//*/
	
	B_SetVisuals_Till();

	B_SetTalents_Till();

	B_HeroGiveInv_Till();
	
	daily_routine = Rtn_Start_1607;
};

func void Rtn_Start_1607()
{
	TA_Stand_WP(8,0,22,0,"WP_START_02");
	TA_Stand_WP(22,0,8,0,"WP_START_02");
};

//  ŒÕ ”–≈Õ“ =============================================
instance CMP_Till(Npc_Proto_Till)
{
	id = CMP_Till_ID;
	npcType = NPCTYPE_Competitor;
	
	attribute[ATR_STRENGTH]			*= 2;
	attribute[ATR_DEXTERITY]		*= 2;
	attribute[ATR_MANA_MAX]			*= 2;
	attribute[ATR_MANA]				*= 2;
	attribute[ATR_HITPOINTS_MAX]	*= 3;
	attribute[ATR_HITPOINTS]		*= 3;

	B_SetVisuals_Till();
	EquipItem(self,ItMw_Sense);

	B_SetTalents_Till();

	B_HeroGiveInv_Till();
	
	daily_routine = Rtn_Start_1657;
};

func void Rtn_Start_1657()
{
	TA_Stand_Eating(9,0,10,30,"NW_FARM4_IN_06");
	TA_PickMushrooms(10,30,12,00,"NW_FARM4_WOOD_MONSTER_MORE_02");
	TA_Stand_WP(12,00,12,30,"NW_FARM4_WOOD_MONSTER_MORE_02");
	TA_PickMushrooms(12,30,13,30,"NW_FARM4_WOOD_MONSTER_MORE_02");
	TA_Stand_Eating(13,30,14,30,"NW_FARM4_IN_06");
	TA_Stand_WP(14,30,15,00,"NW_BIGFARM_SEKOBWAY_01");
	TA_PickMushrooms(15,00,15,30,"NW_BIGFARM_LAKE_MONSTER_05_01");
	TA_PickMushrooms(15,30,16,30,"NW_BIGFARM_LAKE_05");
	TA_PickMushrooms(16,30,17,30,"NW_TAVERNE_BIGFARM_05");
	TA_PickMushrooms(17,30,18,0,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	TA_Stand_WP(18,0,18,3,"NW_CITY_ENTRANCE_BACK");
	TA_Smalltalk(18,3,19,5,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Stand_WP(19,5,19,30,"NW_LAKE__WATER_08");	//ËÏÂÌÌÓ Ú‡Í, ˜ÂÂÁ "__"
	TA_Stand_Eating(19,30,21,0,"NW_FARM4_IN_06");
	TA_Sit_Chair(21,0,22,0,"NW_FARM4_IN_06");
	TA_Sleep(22,0,9,0,"NW_FARM4_IN_BED");
};
func void Rtn_DayS_1657()
{
	TA_Stand_Eating(9,0,10,30,"NW_FARM4_IN_06");
	TA_Smalltalk(10,30,11,30,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Stand_Eating(11,30,13,0,"NW_FARM4_WOOD_MONSTER_MORE_02");
	TA_Stand_Eating(13,0,15,30,"NW_FARM4_IN_06");
	TA_Stand_WP(15,30,18,30,"NW_FARM4_BRONKO");
	TA_Stand_Eating(18,30,20,0,"NW_FARM4_IN_06");
	TA_Sit_Chair(20,0,22,0,"NW_FARM4_IN_06");
	TA_Sleep(22,0,9,0,"NW_FARM4_IN_BED");
};
func void Rtn_After_1657()
{
	TA_Stand_Eating(9,0,10,30,"NW_FARM4_IN_06");
	TA_Stand_Eating(10,30,13,00,"NW_FARM4_WOOD_MONSTER_MORE_02");
	TA_Stand_Eating(13,0,14,30,"NW_FARM4_IN_06");
	TA_Stand_WP(14,30,16,00,"NW_FARM4_TILL");
	TA_Stand_WP(16,0,18,30,"NW_FARM4_BRONKO");
	TA_Stand_Eating(18,30,20,0,"NW_FARM4_IN_06");
	TA_Sit_Chair(20,0,22,0,"NW_FARM4_IN_06");
	TA_Sleep(22,0,9,0,"NW_FARM4_IN_BED");
};
func void Rtn_TOT_1657()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};
