/**************************************************************************

								“–ќЋЋ№
	
	“рофеи: 2 клыка тролл€, шкура тролл€.
  
	 вестовые: пещерный тролль на »рдорате, тролли в яркендаре.
  
***************************************************************************/


prototype Mst_Default_Troll(C_Npc)
{
	name[0] = "“ролль";
	guild = GIL_TROLL;
	aivar[AIV_MM_REAL_ID] = ID_TROLL;
	level = 50;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 250;
	damagetype = DAM_FLY;
	fight_tactic = FAI_TROLL;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	bodyStateInterruptableOverride = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Troll()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Tro_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Troll(Mst_Default_Troll)
{
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_TrollTooth,2);
	CreateInvItems(self,ItAt_TrollFur,1);
};


