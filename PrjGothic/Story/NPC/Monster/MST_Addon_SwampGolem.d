/**************************************************************************

							БОЛОТНЫЙ ГОЛЕМ
	
	Трофеи: нет.
  
***************************************************************************/

prototype Mst_Default_Addon_SwampGolem(C_Npc)
{
	name[0] = "Болотный голем";
	guild = GIL_SWAMPGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_Swampgolem;
	level = 25;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 125;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 500;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 125;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_FLY;
	fight_tactic = FAI_STONEGOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_FollowInWater;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Swampgolem()
{
	Mdl_SetVisual(self,"SwampGolem.mds");
	Mdl_SetVisualBody(self,"Gol_Sumpf_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SwampGolem(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode(self);
};

instance SwampGolem_Valley(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp] = 1500;
	aivar[AIV_OriginalFightTactic] = FAI_STONEGOLEM;
};

