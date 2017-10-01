/**************************************************************************

								КАБАН
	
	Трофеи: мясо, шкура.
  
***************************************************************************/

prototype Mst_Default_Keiler(C_Npc)
{
	name[0] = "Кабан";
	guild = GIL_Keiler;
	aivar[AIV_MM_REAL_ID] = ID_Keiler;
	level = 8;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack + BEHAV_Packhunter;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	aivar[AIV_Temper] = TEMPER_ToughGuy; //не сбегает, когда ранен
};

func void B_SetVisuals_Keiler()
{
	Mdl_SetVisual(self,"Keiler.mds");
	Mdl_SetVisualBody(self,"Keiler_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Keiler_Hog()
{
	Mdl_SetVisual(self,"Keiler.mds");
	Mdl_SetVisualBody(self,"Keiler_Hog_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Keiler(Mst_Default_Keiler)
{
	B_SetVisuals_Keiler();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
	CreateInvItems(self,ItAt_Addon_KeilerFur,1);
	CreateInvItems(self,ItAt_KeilerJawRaw,1);
};

instance Keiler_Hog(Mst_Default_Keiler)
{
	level = 15;
	name[0] = "Секач";
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 40;
	B_SetVisuals_Keiler_Hog();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,4);
	CreateInvItems(self,ItAt_Addon_KeilerFur,1);
	CreateInvItems(self,ItAt_KeilerHogJawRaw,1);
};
instance Keiler_Hog_Trocar(Mst_Default_Keiler)
{
	level = 15;
	id = 5301;
	name[0] = "Раненый секач";
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 200;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 40;
	B_SetVisuals_Keiler_Hog();
	Mdl_SetModelFatness(self,1);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,4);
	//шкуру как бы забрал Трокар
};


