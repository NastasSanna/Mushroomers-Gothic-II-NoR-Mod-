/**************************************************************************

							КАМЕННЫЙ ЧАСОВОЙ
	
	Каменный страж. Можно призывать. Многие не могут уходить далеко от поста.
	Трофеи: квестовые.
	
	Квестовые: с фрагментами орнамента, отдельные инстанции для каждого района. 
  
***************************************************************************/

prototype Mst_Addon_Stoneguardian(C_Npc)
{
	name[0] = "Каменный часовой";
	guild = GIL_Stoneguardian;
	aivar[AIV_MM_REAL_ID] = ID_Stoneguardian;
	level = 18;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 180;
	attribute[ATR_HITPOINTS] = 180;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 90;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_Stoneguardian;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = 0;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	Npc_SetToFistMode(self);
};

func void B_SetVisuals_Stoneguardian()
{
	Mdl_SetVisual(self,"StoneGuardian.mds");
	Mdl_SetVisualBody(self,"StG_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Summoned_Guardian(Mst_Addon_Stoneguardian)
{
	name[0] = NAME_Addon_Summoned_Guardian;
	guild = GIL_SummonedGuardian;
	aivar[AIV_MM_REAL_ID] = ID_SummonedGuardian;
	level = 0;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 175;
	protection[PROT_FIRE] = 125;
	protection[PROT_FLY] = 125;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Stoneguardian();
};

instance Stoneguardian(Mst_Addon_Stoneguardian)
{
	B_SetVisuals_Stoneguardian();
};


