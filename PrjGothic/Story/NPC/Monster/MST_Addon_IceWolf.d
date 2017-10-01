/**************************************************************************

							ЛЕДЯНОЙ ВОЛК
	
	Снежный волк, белый волк. Крупнее и сильнее обычного.
	Трофеи: мясо, 2 клыка, шкура.
  
***************************************************************************/

prototype Mst_Default_Icewolf(C_Npc)
{
	name[0] = "Ледяной волк";
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_Icewolf;
	level = 15;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack + BEHAV_FollowInWater + BEHAV_Packhunter;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Icewolf()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"SnoWol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Icewolf(Mst_Default_Icewolf)
{
	B_SetVisuals_Icewolf();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
	CreateInvItems(self,ItAt_Teeth,2);
	CreateInvItems(self,ItAt_IceWolfFur,1);
};

instance Icewolf_Talbin(Mst_Default_Icewolf)
{
	name[0] = "Белый волк";
	B_SetVisuals_Icewolf();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
	CreateInvItems(self,ItAt_Teeth,2);
	CreateInvItems(self,ItAt_IceWolfFur,1);
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	attribute[ATR_HITPOINTS] = 200;
};


