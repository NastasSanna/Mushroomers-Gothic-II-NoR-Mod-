/**************************************************************************

								АЛЛИГАТОР
	
	Рептилия.
	Трофеи: 4 зуба.
  
***************************************************************************/

prototype Mst_Default_Addon_Alligator(C_Npc)
{
	name[0] = "Аллигатор";
	guild = GIL_Alligator;
	aivar[AIV_MM_REAL_ID] = ID_Alligator;
	level = 12;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_Alligator;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack + BEHAV_FollowInWater;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Alligator()
{
	Mdl_SetVisual(self,"Alligator.mds");
	Mdl_SetVisualBody(self,"KRO_BODY",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Alligator(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
	CreateInvItems(self, ItAt_Teeth,4);
};

instance Alligator_PortalDead(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};


