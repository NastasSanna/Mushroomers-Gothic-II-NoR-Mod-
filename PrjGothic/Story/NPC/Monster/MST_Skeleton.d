/**************************************************************************

								СКЕЛЕТ
	
	Нежить. Можно призывать.
	Трофеи: кость скелета.
	
	Квестовые: в склепе, у Архола, у Марио.
  
***************************************************************************/

prototype Mst_Default_Skeleton(C_Npc)
{
	name[0] = "Скелет";
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 30;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 175;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = 0;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Skeleton()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body2",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Lesser_Skeleton()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Skeleton(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

instance Summoned_Skeleton(Mst_Default_Skeleton)
{
	name[0] = "Вызванный скелет";
	guild = gil_summoned_skeleton;
	aivar[AIV_MM_REAL_ID] = id_summoned_skeleton;
	level = 0;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetVisuals_Lesser_Skeleton();
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	EquipItem(self,ItMw_2H_Sword_M_01);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

instance Lesser_Skeleton(Mst_Default_Skeleton)
{
	name[0] = "Малый скелет";
	level = 15;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 70;
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetVisuals_Lesser_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

instance Crypt_Skeleton_Room_01(Mst_Default_Skeleton)
{
	name[0] = "Страж склепа";
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
	CreateInvItem(self,ItKe_EVT_CRYPT_01);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

instance Crypt_Skeleton_Room_02(Mst_Default_Skeleton)
{
	name[0] = "Страж склепа";
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
	CreateInvItem(self,ItKe_EVT_CRYPT_02);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

instance Crypt_Skeleton_Room_03(Mst_Default_Skeleton)
{
	name[0] = "Страж склепа";
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
	CreateInvItem(self,ItKe_EVT_CRYPT_03);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

instance Skeleton_Archol1(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

instance Skeleton_Archol2(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

instance Skeleton_Archol3(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

instance Skeleton_Archol4(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

instance Skeleton_Archol5(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

instance Skeleton_Archol6(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

// =========================================================================

func void ZS_SkeletonDown()
{
	B_ClearPerceptions(self);
	self.noFocus = TRUE;
	self.bodyStateInterruptableOverride = TRUE;
	Npc_SetPercTime(self,1);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self, self.wp);
	};
};

func int ZS_SkeletonDown_LOOP()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_DEAD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	self.noFocus = TRUE;
	self.bodyStateInterruptableOverride = TRUE;
	return LOOP_CONTINUE;
};

func void ZS_SkeletonDown_END()
{
	AI_PlayAni(self,"T_RISE");
	self.noFocus = FALSE;
	self.bodyStateInterruptableOverride = FALSE;
};


// ГРИБНИКИ =====================================================

instance Skeleton_Tower_Sit(Mst_Default_Skeleton)
{
	name[0] = "Костяной кулак";
	level = 35;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	B_SetVisuals_Skeleton();
	start_aistate = ZS_Sit_Chair;
	CreateInvItems(self,ItAt_SkeletonBone,1);
	CreateInvItems(self,ItAm_Strg_01,1);
};

instance Skeleton_Bow(Mst_Default_Skeleton)
{
	name[0] = "Скелет-лучник";
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow, 10);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

instance Skeleton_CBow(Mst_Default_Skeleton)
{
	name[0] = "Скелет-арбалетчик";
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_Misc_Axe);
	EquipItem(self,ItRw_Crossbow_M_01);
	CreateInvItems(self,ItRw_Bolt, 10);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

instance Skeleton_Miner(Mst_Default_Skeleton)
{
	name[0] = "Скелет шахтера";
	protection[PROT_BLUNT] += 20;
	protection[PROT_EDGE] += 20;
	protection[PROT_POINT] += 20;
	B_SetVisuals_Lesser_Skeleton();
	Mdl_SetVisualBody(self,"Ske_Prisoner",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	EquipItem(self,ItMw_2H_Axe_L_01);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

//скелет древнего лекаря
instance Skeleton_Healer(Mst_Default_Skeleton)
{
	name[0] = "Малый скелет";
	level = 15;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 70;
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetVisuals_Lesser_Skeleton();
	EquipItem(self,ItMw_1h_Bau_Axe);
	CreateInvItem(self,ItWr_Stoneplate_Gold);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

//призванный скелет Одо
instance Summoned_Skeleton_Odo(Mst_Default_Skeleton)
{
	name[0] = "Йорик";
	id = 6401;
	guild = GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID] = id_summoned_skeleton;
	level = 15;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetVisuals_Lesser_Skeleton();
	B_SetAttitude(self,ATT_ANGRY);
	EquipItem(self,ItMw_1h_MISC_Sword);
	CreateInvItems(self,ItAt_SkeletonBone,1);
	daily_routine = Rtn_Guard_6401;
};
func void Rtn_Guard_6401()
{
	TA_GuardNpc(8,0,9,0,"NW_PATH_TO_MONASTERY_10");
	TA_GuardNpc(9,0,10,0,"NW_PATH_TO_MONASTERY_09");
	TA_GuardNpc(10,0,11,0,"NW_PATH_TO_MONASTERY_06");
	TA_GuardNpc(11,0,12,0,"NW_SHRINE_TO_PATH");
	TA_GuardNpc(12,30,13,0,"NW_SHRINE_01");
	TA_GuardNpc(13,0,14,30,"NW_TAVERNE_TROLLAREA_08");
	TA_GuardNpc(14,30,16,30,"NW_TAVERNE_TROLLAREA_11");
	TA_GuardNpc(16,30,17,0,"NW_TAVERNE_TROLLAREA_11_A");
	TA_GuardNpc(17,0,18,20,"NW_TAVERN_TO_FOREST_03");
	TA_GuardNpc(18,20,18,23,"NW_CITY_ENTRANCE_BACK");
	TA_GuardNpc(18,23,19,30,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Min(self,19,30,8,0,ZS_SkeletonDown,"NW_PATH_TO_MONASTERY_10");
};
