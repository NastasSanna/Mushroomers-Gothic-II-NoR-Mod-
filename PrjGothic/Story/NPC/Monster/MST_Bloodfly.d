/**************************************************************************

							КРОВАВАЯ МУХА
	
	Шершень.
	Трофеи: 2 крыла, жало.
  
***************************************************************************/

prototype Mst_Default_Bloodfly(C_Npc)
{
	name[0] = "Кровавая муха";
	guild = GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID] = ID_BLOODFLY;
	level = 4;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_BLOODFLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack + BEHAV_FollowInWater;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = 8;
	aivar[AIV_MM_RoamEnd] = 10;
	aivar[AIV_MM_WuselStart] = 10;
	aivar[AIV_MM_WuselEnd] = 17;
	aivar[AIV_MM_RestStart] = 17;
	aivar[AIV_MM_RestEnd] = 8;
};


func void B_SetVisuals_Bloodfly()
{
	Mdl_SetVisual(self,"Bloodfly.mds");
	Mdl_SetVisualBody(self,"Blo_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Bloodfly(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_Wing,2);
	CreateInvItems(self,ItAt_Sting,1);
};

instance YBloodfly(Mst_Default_Bloodfly)
{
	name[0] = "Малая кровавая муха";
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
	B_SetVisuals_Bloodfly();
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_Wing,2);
	CreateInvItems(self,ItAt_Sting,1);
};

instance Sleepfly(Mst_Default_Bloodfly)
{
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = OnlyRoutine;
	B_SetVisuals_Bloodfly();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_Wing,2);
	CreateInvItems(self,ItAt_Sting,1);
};

