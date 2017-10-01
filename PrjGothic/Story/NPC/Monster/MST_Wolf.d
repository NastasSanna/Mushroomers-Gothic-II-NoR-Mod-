/**************************************************************************

								ВОЛК
	
	Можно призывать.
	Трофеи: мясо, 2 клыка, шкура волка.
	
	Квестовые: волки Пепе.
  
***************************************************************************/

prototype Mst_Default_Wolf(C_Npc)
{
	name[0] = "Волк";
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_WOLF;
	level = 6;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 60;
	attribute[ATR_HITPOINTS] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack + BEHAV_FollowInWater + BEHAV_Packhunter;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Wolf()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Wol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Wolf(Mst_Default_Wolf)
{
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
	CreateInvItems(self, ItAt_Teeth,2);
	CreateInvItems(self,ItAt_WolfFur,1);
};

instance Summoned_Wolf(Mst_Default_Wolf)
{
	name[0] = "Вызванный волк";
	guild = gil_summoned_wolf;
	aivar[AIV_MM_REAL_ID] = id_summoned_wolf;
	level = 0;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 75;
	protection[PROT_FLY] = 75;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
	CreateInvItems(self, ItAt_Teeth,2);
	CreateInvItems(self,ItAt_WolfFur,1);
};

instance YWolf(Mst_Default_Wolf)
{
	level = 3;
	name[0] = "Молодой волк";
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 20;
	attribute[ATR_HITPOINTS] = 20;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 10;
	fight_tactic = FAI_MONSTER_COWARD;
	B_SetVisuals_Wolf();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,1);
	CreateInvItems(self,ItAt_WolfFur,1);
};

// ГРИБНИКИ ================================================

instance Wolf_Maleth(Mst_Default_Wolf)
{
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
	CreateInvItems(self, ItAt_Teeth,2);
	CreateInvItems(self,ItAt_WolfFur,1);
	daily_routine = Rtn_Wolf_Maleth;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
};

func void Rtn_Wolf_Maleth()
{
	TA_Min(self,4,5,4,30,ZS_TeleportToWP,"TOT");
	TA_Stand_WP(4,30,21,55,"TOT");
	TA_Min(self,21,55,22,0,ZS_TeleportToWP,"NW_XARDAS_MONSTER_INSERT_01");
		TA(self,22,1,ZS_MM_Rtn_Rest_Loop,"NW_FARM1_PATH_SPAWN_02");
		TA(self,1,2,ZS_MM_Rtn_Rest_Loop,"NW_FARM1_PATH_CITY_SHEEP_07");
		TA(self,2,4,ZS_MM_Rtn_Rest_Loop,"NW_FARM1_PATH_SPAWN_02");
	TA_Min(self,4,0,4,5,ZS_RunToWP,"NW_XARDAS_MONSTER_INSERT_01");
};

// ---------------------------------------

instance Wolf_Till(Mst_Default_Wolf)
{
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
	CreateInvItems(self, ItAt_Teeth,2);
	CreateInvItems(self,ItAt_WolfFur,1);
};

