
instance Molerat_Cross(C_NPC)
{
	name[0] = "Крестик";
	guild = GIL_SHEEP;
	aivar[AIV_MM_REAL_ID] = ID_MOLERAT;
	id = 194301;
	level = 5;
	
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_HITPOINTS_MAX] = 70;
	attribute[ATR_HITPOINTS] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 50;
	
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MOLERAT;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_Behaviour] = BEHAV_FollowInWater | BEHAV_ThreatenBeforeAttack | BEHAV_MM_Talk | BEHAV_Hidden;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	
	daily_routine = Rtn_Start_194301;
	CreateInvItems(self,ItFoMuttonRaw,2);

	Mdl_SetVisual(self,"Molerat.mds");
	Mdl_SetVisualBody(self,"Mol_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_SetModelFatness(self,1);
	Npc_SetToFistMode(self);
};

func void Rtn_Start_194301()
{
	TA(self,8,2,ZS_MM_Rtn_Roam,"NW_FARM4_WOOD_MONSTER_MORE_02");
	TA(self,2,8,ZS_MM_Rtn_Rest,"NW_FARM4_WOOD_MONSTER_MORE_02");
};

func void Rtn_Follow_194301()
{
	if (Hlp_IsValidNpc(hero))	{
		var string WP;	WP = Npc_GetNearestWP(hero);
		TA(self,8,2,ZS_MM_Rtn_Follow_Cross,WP);
		TA(self,2,8,ZS_MM_Rtn_Follow_Cross,WP);
	}
	else	{
		TA(self,8,2,ZS_MM_Rtn_Follow_Cross,"NW_FARM4_WOOD_MONSTER_MORE_02");
		TA(self,2,8,ZS_MM_Rtn_Follow_Cross,"NW_FARM4_WOOD_MONSTER_MORE_02");
	};
};

func void Rtn_ToSagitta_194301()
{
	TA(self,8,2,ZS_MM_Rtn_Rest,"NW_SAGITTA_CAVE_CROSS");
	TA(self,2,8,ZS_MM_Rtn_Rest,"NW_SAGITTA_CAVE_CROSS");
};

func void Rtn_GiveBirth_194301()
{
	TA(self,8,2,ZS_MM_Rtn_Rest,"NW_BIGFARM_FOREST_CROSS");
	TA(self,2,8,ZS_MM_Rtn_Rest,"NW_BIGFARM_FOREST_CROSS");
};

//===========================================

instance Molerat_Cub(C_NPC)
{
	name[0] = "Детеныш";
	guild = GIL_SHEEP;
	aivar[AIV_MM_REAL_ID] = ID_MOLERAT;
	id = 194302;
	level = 1;
	
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
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
	
	damagetype = DAM_BLUNT;
	fight_tactic = FAI_MOLERAT;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;

	B_SetVisuals_Molerat();
	Mdl_SetModelScale(self,0.35,0.35,0.35);
	Mdl_SetModelFatness(self,-2);
	Npc_SetToFistMode(self);
};
