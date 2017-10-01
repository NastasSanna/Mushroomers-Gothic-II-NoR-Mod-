
prototype Npc_Proto_Talbin(C_Npc)
{
	//default
	level = 15;
	exp = C_GetExp_Next(level - 1);//	exp = 32200;
	exp_next = C_GetExp_Next(level);//exp + 3600;
	damagetype = DAM_BLUNT;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = NPC_TIME_FOLLOW;
	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	bodyStateInterruptableOverride = FALSE;
	
	//Талбин
	name[0] = "Талбин";
	guild = GIL_OUT;
	voice = 7;
	
	attribute[ATR_STRENGTH]			= 40;
	attribute[ATR_DEXTERITY]		= 90;
	attribute[ATR_MANA_MAX]			= 10;
	attribute[ATR_MANA]				= 10;
	attribute[ATR_HITPOINTS_MAX]	= 160;
	attribute[ATR_HITPOINTS]		= 160;
	aivar[REAL_STRENGTH]		= attribute[ATR_STRENGTH];
	aivar[REAL_DEXTERITY]		= attribute[ATR_DEXTERITY];
	aivar[REAL_MANA_MAX]		= attribute[ATR_MANA_MAX];
	aivar[REAL_HITPOINTS_MAX]	= attribute[ATR_HITPOINTS_MAX];
	fight_tactic = FAI_HUMAN_STRONG;
};
	
func void B_SetVisuals_Talbin()
{
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Bullit,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
};

func void B_SetTalents_Talbin()
{
	B_RaiseFightTalent(self,NPC_TALENT_1H,20);
	B_RaiseFightTalent(self,NPC_TALENT_2H,10);
	B_RaiseFightTalent(self,NPC_TALENT_BOW,60);
	B_RaiseFightTalent(self,NPC_TALENT_CROSSBOW,30);
	
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_ACROBAT,0);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,0);
	Npc_SetTalentSkill(self,NPC_TALENT_TAKEANIMALTROPHY,3);
	Npc_SetTalentSkill(self,NPC_TALENT_ALCHEMY,0);
	Npc_SetTalentSkill(self,NPC_TALENT_HERONAME,6);
};

func void B_HeroGiveInv_Talbin()
{
	CreateInvItem(self,ItMw_1H_Sword_L_03);
	CreateInvItem(self,ItRw_Bow_M_01);

	CreateInvItems(self, ItMi_Gold, 14);
	CreateInvItems(self, ItFoMuttonRaw, 5);
	CreateInvItems(self, ItAt_Teeth, 3);
	CreateInvItems(self, ItRw_Arrow, 40);
	CreateInvItems(self, ItRw_Bolt, 40);
	CreateInvItems(self, ItKe_Chest_Talbin, 1);
};

// ГГ =============================================
instance PC_Talbin(Npc_Proto_Talbin)
{
	id = PC_Talbin_ID;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_HERO;
	aivar[AIV_IgnoreFlags] = IGNORE_All;
	
	B_SetVisuals_Talbin();
	
	B_SetTalents_Talbin();
	
	B_HeroGiveInv_Talbin();
	CreateInvItem(self,ItMw_Nagelkeule);
	
	daily_routine = Rtn_Start_1606;
};

func void Rtn_Start_1606()
{
	TA_Smalltalk(8,0,22,0,"WP_START_01");
	TA_Smalltalk(22,0,8,0,"WP_START_01");
};

// КОНКУРЕНТ =============================================
instance CMP_Talbin(Npc_Proto_Talbin)
{
	id = CMP_Talbin_ID;
	npcType = NPCTYPE_Competitor;
	
	attribute[ATR_STRENGTH]			*= 2;
	attribute[ATR_DEXTERITY]		*= 2;
	attribute[ATR_MANA_MAX]			*= 2;
	attribute[ATR_MANA]				*= 2;
	attribute[ATR_HITPOINTS_MAX]	*= 3;
	attribute[ATR_HITPOINTS]		*= 3;

	B_SetVisuals_Talbin();
	
	B_SetTalents_Talbin();
	
	B_HeroGiveInv_Talbin();
	EquipItem(self, ItMw_Nagelkeule);
	
	daily_routine = Rtn_Start_1656;
};

func void Rtn_Start_1656()
{
	TA_Stand_Eating(7,0,7,30,"NW_TAVERNE_HUNTERCAMP_01");
	TA_PickMushrooms(7,30,9,0,"NW_TAVERNE_TROLLAREA_08");
	TA_PickMushrooms(9,0,10,30,"NW_TAVERNE_TROLLAREA_11");
	TA_PickMushrooms(10,30,11,30,"TAVERNE_TROLLAREA_MONSTER_05_02");
	TA_PickMushrooms(11,30,12,30,"NW_FARM4_WOOD_MONSTER_N_5");
	TA_PickMushrooms(12,30,13,30,"NW_FARM4_WOOD_NEARPEASANT7E"); 
	TA_Hunting(13,30,14,30,"NW_FARM4_WOOD_MONSTER_05"); 
	TA_PickMushrooms(14,30,15,30,"NW_FARM4_WOOD_MONSTER_05"); 
	TA_PickMushrooms(15,30,17,0,"NW_FARM4_WOOD_MONSTER_09"); 
	TA_PickMushrooms(17,0,19,0,"NW_FARM4_WOOD_NEARPEASANT7");
	TA_Stand_WP(19,0,19,3,"NW_CITY_ENTRANCE_BACK");
	TA_Smalltalk(19,3,20,5,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Sit_Bench(20,5,22,1,"NW_TAVERNE_HUNTERCAMP_02_FIRESIT");
	TA_Sleep(22,1,7,0,"NW_TAVERNE_HUNTERCAMP_09_BED");
};

func void Rtn_DayS_1656()
{
	TA_Stand_Eating(7,30,9,30,"NW_TAVERNE_HUNTERCAMP_01");
	TA_Stand_WP(9,30,9,50,"NW_CITY_MERCHANT_PATH_28_E");
	TA_Smalltalk(9,50,11,5,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Smalltalk(11,5,14,50,"NW_TAVERNE_HUNTERCAMP_04");	//Энгром
	TA_Stand_Eating(13,2,15,8,"NW_CITY_MERCHANT_SHOP03_FRONT_02");
	TA_Hunting(15,8,19,10,"NW_FARM4_WOOD_MONSTER_05");
	TA_Sit_Bench(19,10,22,1,"NW_TAVERNE_HUNTERCAMP_02_FIRESIT");
	TA_Sleep(22,1,7,30,"NW_TAVERNE_HUNTERCAMP_09_BED");
};
func void Rtn_After_1656()
{
	TA_Stand_Eating(7,30,9,30,"NW_TAVERNE_HUNTERCAMP_01");
	TA_Smalltalk(9,30,12,5,"NW_TAVERNE_HUNTERCAMP_04");	//Энгром
	TA_Stand_Eating(12,5,13,45,"NW_CITY_MERCHANT_SHOP03_FRONT_02");
	TA_Hunting(13,45,18,20,"NW_FARM4_WOOD_MONSTER_05");
	TA_Sit_Bench(18,20,22,1,"NW_TAVERNE_HUNTERCAMP_02_FIRESIT");
	TA_Sleep(22,1,7,30,"NW_TAVERNE_HUNTERCAMP_09_BED");
};
func void Rtn_TOT_1656()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};
