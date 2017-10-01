/**************************************************************************

								СНЕППЕР
	
	Глорх.
	Трофеи: 2 зуба, 2 когтя, кожа рептилии.
	
	Квестовые: у Гримбальда, у шахты Фаджета, вожак стаи.
  
***************************************************************************/

prototype Mst_Default_Snapper(C_Npc)
{
	name[0] = "Снеппер";
	guild = GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID] = ID_SNAPPER;
	level = 12;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 120;
	attribute[ATR_HITPOINTS] = 120;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 60;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SNAPPER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack + BEHAV_FollowInWater + BEHAV_Packhunter;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Snapper()
{
	Mdl_SetVisual(self,"Snapper.mds");
	Mdl_SetVisualBody(self,"Sna_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Snapper(Mst_Default_Snapper)
{
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_Teeth,2);
	CreateInvItems(self,ItAt_Claw,2);
	CreateInvItems(self,itat_LurkerSkin,1);
};

instance NewMine_LeadSnapper(Mst_Default_Snapper)
{
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
	name[0] = "Вожак стаи";
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 0;
	CreateInvItems(self,ItAt_ClawLeader,1);
	CreateInvItems(self,ItAt_Teeth,2);
	CreateInvItems(self,ItAt_Claw,2);
	CreateInvItems(self,itat_LurkerSkin,1);
};


