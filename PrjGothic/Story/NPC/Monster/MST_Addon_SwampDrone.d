/**************************************************************************

							БОЛОТНЫЙ ДРОН
	
	Болотная вонючка. Летает. После смерти обрызгивает всех окружающих ядом.
	Трофеи: нет.
  
***************************************************************************/

const int SwampDronePoisonDamage	= 50;
const int SwampDronePoisonDist		= 300;

prototype Mst_Default_SwampDrone(C_Npc)
{
	name[0] = "Болотный дрон";
	guild = GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID] = ID_SWAMPDRONE;
	level = 10;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_BLOODFLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack + BEHAV_FollowInWater;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};

func void B_SetVisuals_SwampDrone()
{
	Mdl_SetVisual(self,"SwampDrone.mds");
	Mdl_SetVisualBody(self,"SwampDrone_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SwampDrone(Mst_Default_SwampDrone)
{
	B_SetVisuals_SwampDrone();
	Npc_SetToFistMode(self);
};

// получить повреждение от яда убитого дрона

func void ZS_DeadSwampDroneDamage()
{
	if (self.guild != GIL_BLOODFLY)
	{
		Npc_ChangeAttribute(self, ATR_HITPOINTS, -SwampDronePoisonDamage);
	};
};

func int ZS_DeadSwampDroneDamage_Loop()
{
	return LOOP_END;
};

func void ZS_DeadSwampDroneDamage_End()
{
};

func void PoisonDeadSwampDrone()
{
	if(Npc_GetDistToNpc(hero, self) < SwampDronePoisonDist)
	{
		Npc_ChangeAttribute(hero, ATR_HITPOINTS, -SwampDronePoisonDamage);
	};
	AI_SetNpcsToState(self, ZS_DeadSwampDroneDamage, SwampDronePoisonDist);
};
