/**************************************************************************

							ПОЛЕВОЙ ХИЩНИК
	
	Полевой жук. гигантский жук.
	Трофеи: мандибулы полевого хищника.
	
***************************************************************************/

prototype Mst_Default_Giant_Bug(C_Npc)
{
	name[0] = "Полевой хищник";
	guild = GIL_GIANT_BUG;
	aivar[AIV_MM_REAL_ID] = ID_GIANT_BUG;
	level = 8;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GIANT_BUG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Giant_Bug()
{
	Mdl_SetVisual(self,"Giant_Bug.mds");
	Mdl_SetVisualBody(self,"Giant_Bug_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Giant_Bug(Mst_Default_Giant_Bug)
{
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	CreateInvItems(self,ItAt_BugMandibles,1);
};
instance Giant_Bug_Cave(Mst_Default_Giant_Bug)
{
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	CreateInvItems(self,ItAt_BugMandibles,1);
};

instance YGiant_Bug(Mst_Default_Giant_Bug)
{
	name[0] = "Молодой полевой хищник";
	level = 2;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 20;
	attribute[ATR_HITPOINTS] = 20;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	fight_tactic = FAI_GIANT_BUG;
	B_SetVisuals_Giant_Bug();
	Mdl_SetModelScale(self,0.7,0.7,0.7);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_BugMandibles,1);
};



