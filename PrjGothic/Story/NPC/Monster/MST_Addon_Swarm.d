/**************************************************************************

							РОЙ САРАНЧИ
	
	Выглядит как огонек, ведет себя как шершень. Можно вызывать.
	Трофеи: нет.
  
***************************************************************************/

prototype Mst_Default_Swarm(C_Npc)
{
	name[0] = "Рой саранчи";
	guild = GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID] = ID_BLOODFLY;
	level = 6;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 60;
	attribute[ATR_HITPOINTS] = 60;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_FLY;
	fight_tactic = FAI_BLOODFLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack + BEHAV_FollowInWater;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MaxDistToWp] = 700;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
	/*CreateInvItems(slf,ItAt_Wing,2);
	CreateInvItems(slf,ItAt_Sting,1);*/
};

func void B_SetVisuals_Swarm()
{
	Mdl_SetVisual(self,"Swarm.mds");
	Mdl_SetVisualBody(self,"Irrlicht_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Swarm(Mst_Default_Swarm)
{
	fight_tactic = FAI_BLOODFLY;
	B_SetVisuals_Swarm();
	Npc_SetToFistMode(self);
};

instance Swarm_Detector(Mst_Default_Swarm)
{
	level = 0;
	npcType = npctype_main;
	B_SetVisuals_Swarm();
	senses_range = 3000;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	Npc_SetToFistMode(self);
	aivar[AIV_Temper] = TEMPER_NoFightParker;
	start_aistate = ZS_MM_Rtn_Summoned;
};

