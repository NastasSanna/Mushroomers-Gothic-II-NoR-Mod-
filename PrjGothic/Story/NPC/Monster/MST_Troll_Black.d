/**************************************************************************

							ЧЕРНЫЙ ТРОЛЛЬ
	
	Трофеи: 4 клыка тролля, шкура черного тролля.
   
***************************************************************************/


prototype Mst_Default_Troll_Black(C_Npc)
{
	name[0] = "Черный тролль";
	guild = GIL_TROLL;
	aivar[AIV_MM_REAL_ID] = ID_TROLL_BLACK;
	level = 100;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 300;
	damagetype = DAM_FLY;
	fight_tactic = FAI_TROLL;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	bodyStateInterruptableOverride = TRUE;
};

func void B_SetVisuals_Troll_Black()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Troll_Black_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Troll_Black(Mst_Default_Troll_Black)
{
	B_SetVisuals_Troll_Black();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_TrollTooth,4);
	CreateInvItems(self,ItAt_TrollBlackFur,1);
};

