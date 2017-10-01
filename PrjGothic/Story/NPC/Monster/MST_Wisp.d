/**************************************************************************

							ПРИЗРАЧНЫЙ СВЕТ
	
	Призрачный огонек. Можно вызывать ищущий огонек.
	Трофеи: нет.
  
***************************************************************************/

prototype Mst_Default_Wisp(C_Npc)
{
	name[0] = "Призрачный свет";
	guild = GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID] = ID_WISP;
	level = 4;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_MAGIC;
	damage[DAM_INDEX_MAGIC] = 20;
	fight_tactic = FAI_BLOODFLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack + BEHAV_FollowInWater;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
	
	//возрождается в течение 1-3 игровых суток
	SpawnDelay = 5 * 60 * (24 + Hlp_Random(48));
};

func void B_SetVisuals_Wisp()
{
	Mdl_SetVisual(self,"Irrlicht.mds");
	Mdl_SetVisualBody(self,"Irrlicht_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Wisp(Mst_Default_Wisp)
{
	B_SetVisuals_Wisp();
	Npc_SetToFistMode(self);
};

instance Wisp_Detector(Mst_Default_Wisp)
{
	level = 0;
	npcType = npctype_main;
	B_SetVisuals_Wisp();
	senses_range = 3000;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	Npc_SetToFistMode(self);
	aivar[AIV_Temper] = TEMPER_NoFightParker;
	start_aistate = ZS_MM_Rtn_Summoned;
};

