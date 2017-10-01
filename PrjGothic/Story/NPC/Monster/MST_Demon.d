/**************************************************************************

								ДЕМОН
	
	Трофеи: сердце демона.
	
	Квестовые: в башне Ксардаса.
  
***************************************************************************/

prototype Mst_Default_Demon(C_Npc)
{
	name[0] = "Демон";
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON;
	level = 50;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 175;
	protection[PROT_EDGE] = 175;
	protection[PROT_POINT] = 175;
	protection[PROT_FIRE] = 175;
	protection[PROT_FLY] = 175;
	protection[PROT_MAGIC] = 175;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_DEMON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_FollowInWater;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Demon()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Demon(Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_DemonHeart,1);
};

instance Demon_Small(Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.9,0.8,0.9);
	CreateInvItems(self,ItAt_DemonHeart,1);
};


instance Summoned_Demon(Mst_Default_Demon)
{
	name[0] = "Вызванный демон";
	guild = gil_summoned_demon;
	aivar[AIV_MM_REAL_ID] = id_summoned_demon;
	level = 0;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Demon();
	Mdl_SetModelScale(self,0.8,0.6,0.8);
	Npc_SetToFistMode(self);
};



