/**************************************************************************

							ЗЕЛЕНЫЙ ГОБЛИН
	
	Наиболее слабый гоблин.
	Трофеи: случайно.
  
***************************************************************************/

prototype Mst_Default_Gobbo_Green(C_Npc)
{
	name[0] = "Гоблин";
	guild = GIL_GOBBO;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_GREEN;
	level = 4;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_HITPOINTS_MAX] = 20;
	attribute[ATR_HITPOINTS] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack + BEHAV_Packhunter;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Gobbo_Green()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",0,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Gobbo_Green(Mst_Default_Gobbo_Green)
{
	B_SetVisuals_Gobbo_Green();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
};

instance YGobbo_Green(Mst_Default_Gobbo_Green)
{
	level = 3;
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 5;
	attribute[ATR_HITPOINTS_MAX] = 20;
	attribute[ATR_HITPOINTS] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	fight_tactic = FAI_MONSTER_COWARD;
	B_SetVisuals_Gobbo_Green();
	Mdl_SetModelScale(self,0.85,0.85,0.85);
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
};

//======== ГРИБНИКИ =========

instance Gobbo_Green_Stealer(Mst_Default_Gobbo_Green)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Gobbo_Green();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
};

instance Gobbo_Green_Till_1(Mst_Default_Gobbo_Green)
{
	B_SetVisuals_Gobbo_Green();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
};

instance Gobbo_Green_Till_2(Mst_Default_Gobbo_Green)
{
	B_SetVisuals_Gobbo_Green();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
};

