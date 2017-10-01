/**************************************************************************

							ГИГАНТСКАЯ КРЫСА

	Трофеи: мясо.
	
***************************************************************************/

prototype Mst_Default_Giant_Rat(C_Npc)
{
	name[0] = "Гигантская крыса";
	guild = GIL_Giant_Rat;
	aivar[AIV_MM_REAL_ID] = ID_Giant_Rat;
	level = 3;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_HITPOINTS_MAX] = 30;
	attribute[ATR_HITPOINTS] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 15;
	protection[PROT_EDGE] = 15;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 15;
	protection[PROT_FLY] = 15;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GIANT_RAT;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack + BEHAV_FollowInWater + BEHAV_Packhunter;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Giant_Rat()
{
	Mdl_SetVisual(self,"Giant_Rat.mds");
	Mdl_SetVisualBody(self,"Giant_Rat_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Giant_Rat(Mst_Default_Giant_Rat)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,1);
};

instance YGiant_Rat(Mst_Default_Giant_Rat)
{
	name[0] = "Молодая крыса";
	level = 2;
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 5;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 5;
	protection[PROT_EDGE] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_FLY] = 5;
	protection[PROT_MAGIC] = 0;
	fight_tactic = FAI_MONSTER_COWARD;
	B_SetVisuals_Giant_Rat();
	Mdl_SetModelScale(self,0.6,0.6,0.6);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,1);
};


instance Giant_Rat_MineFlee(Mst_Default_Giant_Rat)
{
	id = 210801;
	aivar[AIV_Temper] = TEMPER_NoFightParker;
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	CreateInvItems(self,ItFoMuttonRaw,1);
};

func void ZS_MM_DeathFlee()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,		B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,		B_AssessDamage_MagicFlee);
	AI_SetWalkMode(self,NPC_RUN);
	B_MM_DeSynchronize();
	NS_GotoMyWP(self);
};
func int ZS_MM_DeathFlee_Loop()
{
	return LOOP_CONTINUE;
};

func void ZS_MM_DeathFlee_End()
{
};

func void Rtn_DEATHFLEE_210801()
{
	TA_Min(self,8,0,22,0,ZS_MM_DeathFlee,"NW_CASTLEMINE2_OUT_JUMP");
	TA_Min(self,8,0,22,0,ZS_MM_DeathFlee,"NW_CASTLEMINE2_OUT_JUMP");
};

