
prototype Npc_Proto_Rupert(C_Npc)
{
	//default
	level = 11;
	exp = C_GetExp_Next(level - 1);//	exp = 22000;
	exp_next = C_GetExp_Next(level);//exp + 3000;
	damagetype = DAM_BLUNT;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = NPC_TIME_FOLLOW;
	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	bodyStateInterruptableOverride = FALSE;
	
	//–ÛÔÂÚ
	name[0] = "–ÛÔÂÚ";
	guild = GIL_VLK;
	voice = 3;

	attribute[ATR_STRENGTH]			= 50;
	attribute[ATR_DEXTERITY]		= 50;
	attribute[ATR_MANA_MAX]			= 10;
	attribute[ATR_MANA]				= 10;
	attribute[ATR_HITPOINTS_MAX]	= 160;
	attribute[ATR_HITPOINTS]		= 160;
	aivar[REAL_STRENGTH]		= attribute[ATR_STRENGTH];
	aivar[REAL_DEXTERITY]		= attribute[ATR_DEXTERITY];
	aivar[REAL_MANA_MAX]		= attribute[ATR_MANA_MAX];
	aivar[REAL_HITPOINTS_MAX]	= attribute[ATR_HITPOINTS_MAX];
	fight_tactic = FAI_HUMAN_NORMAL;
};
	
func void B_SetVisuals_Rupert()
{
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal20,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
};

func void B_SetTalents_Rupert()
{
	B_RaiseFightTalent(self,NPC_TALENT_1H,20);
	B_RaiseFightTalent(self,NPC_TALENT_2H,20);
	B_RaiseFightTalent(self,NPC_TALENT_BOW,15);
	B_RaiseFightTalent(self,NPC_TALENT_CROSSBOW,15);
	
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,0);
	Npc_SetTalentSkill(self,NPC_TALENT_ACROBAT,1);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,0);
	Npc_SetTalentSkill(self,NPC_TALENT_TAKEANIMALTROPHY,0);
	Npc_SetTalentSkill(self,NPC_TALENT_ALCHEMY,0);
	Npc_SetTalentSkill(self,NPC_TALENT_HERONAME,4);
};

func void B_HeroGiveInv_Rupert()
{
	CreateInvItem(self,ItMw_1h_Bau_Mace);

	CreateInvItems(self,ItFo_Apple,1);
	CreateInvItems(self,ItFo_Bread,1);
	CreateInvItems(self,ItFo_Beer,1);
	CreateInvItems(self,ItMi_Gold,2);
};

// √√ =============================================
instance PC_Rupert(Npc_Proto_Rupert)
{
	id = PC_Rupert_ID;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_HERO;
	aivar[AIV_IgnoreFlags] = IGNORE_All;
	
	B_SetVisuals_Rupert();
	
	B_SetTalents_Rupert();
	
	B_HeroGiveInv_Rupert();
	
	daily_routine = Rtn_Start_1605;
};

func void Rtn_Start_1605()
{
	TA_Smalltalk(8,0,22,0,"WP_START_01");
	TA_Smalltalk(22,0,8,0,"WP_START_01");
};

//  ŒÕ ”–≈Õ“ =============================================
instance CMP_Rupert(Npc_Proto_Rupert)
{
	id = CMP_Rupert_ID;
	npcType = NPCTYPE_Competitor;
	voice = 11;
	
	attribute[ATR_STRENGTH]			*= 2;
	attribute[ATR_DEXTERITY]		*= 2;
	attribute[ATR_MANA_MAX]			*= 2;
	attribute[ATR_MANA]				*= 2;
	attribute[ATR_HITPOINTS_MAX]	*= 3;
	attribute[ATR_HITPOINTS]		*= 3;

	B_SetVisuals_Rupert();
	
	B_SetTalents_Rupert();
	
	B_HeroGiveInv_Rupert();
	
	daily_routine = Rtn_Start_1655;
};

func void Rtn_Start_1655()
{
	TA_Smalltalk(8,32,9,17,"NW_CITY_TAVERN_IN_05");
	TA_Stand_Eating(9,17,10,0,"NW_CITY_TAVERN_IN_05");
	TA_PickMushrooms(10,0,10,30,"NW_CITY_SMFOREST_01");
	TA_PickMushrooms(10,30,11,30,"NW_CITY_SMFOREST_02");
	TA_PickMushrooms(11,30,14,30,"NW_CITY_SMFOREST_03");
	TA_PickMushrooms(14,30,16,30,"NW_FOREST_XROAD_01");
	TA_PickMushrooms(16,30,17,30,"NW_FOREST_PATH_35");
	TA_Stand_WP(17,30,17,33,"NW_CITY_ENTRANCE_BACK");
	TA_Smalltalk(17,33,18,35,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Stand_Eating(18,35,23,55,"NW_CITY_TAVERN_IN_05");
	TA_Sleep(23,55,8,32,"NW_CITY_HOTEL_BED_08");
};

func void Rtn_DayS_1655()
{
	TA_Smalltalk(8,32,9,17,"NW_CITY_TAVERN_IN_05");
	TA_Smalltalk(9,30,10,0,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Smalltalk(10,15,13,0,"NW_CITY_MERCHANT_SHOP02_IN_01");
	TA_Smalltalk(13,0,14,20,"NW_CITY_MERCHANT_SHOP01_IN_04");
	TA_Smalltalk(14,20,15,10,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Sit_Bench(15,10,16,30,"NW_CITY_REGIS");
	TA_Stand_Eating(16,30,22,15,"NW_CITY_TAVERN_IN_05");
	TA_Sleep(22,15,8,32,"NW_CITY_HOTEL_BED_08");
};
func void Rtn_After_1655()
{
	TA_Smalltalk(8,32,9,17,"NW_CITY_TAVERN_IN_05");
	TA_Stand_Eating(9,17,10,15,"NW_CITY_TAVERN_IN_05");
	TA_Smalltalk(10,15,13,0,"NW_CITY_MERCHANT_SHOP02_IN_01");
	TA_Smalltalk(13,0,14,20,"NW_CITY_MERCHANT_SHOP01_IN_04");
	TA_Smalltalk(14,20,15,10,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Sit_Bench(15,10,16,30,"NW_CITY_REGIS");
	TA_Stand_Eating(16,30,22,15,"NW_CITY_TAVERN_IN_05");
	TA_Sleep(22,15,8,32,"NW_CITY_HOTEL_BED_08");
};
func void Rtn_TOT_1655()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};
