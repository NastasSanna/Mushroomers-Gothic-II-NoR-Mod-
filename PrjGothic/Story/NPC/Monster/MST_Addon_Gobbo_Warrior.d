/**************************************************************************

							ГОБЛИН-ВОИН
	
	Крупный, лучше вооруженный черный гоблин.
	Трофеи: случайно.
  
***************************************************************************/

prototype Mst_Default_Gobbo_Warrior(C_Npc)
{
	name[0] = "Гоблин-воин";
	guild = GIL_GOBBO;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_BLACK;
	level = 15;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 75;
	attribute[ATR_HITPOINTS] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 75;
	protection[PROT_FLY] = 75;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack + BEHAV_Packhunter;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Gobbo_Warrior()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",2,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Gobbo_Warrior_Visir()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",3,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Gobbo_Warrior(Mst_Default_Gobbo_Warrior)
{
	B_SetVisuals_Gobbo_Warrior();
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
};

instance Gobbo_Warrior_Visir(Mst_Default_Gobbo_Warrior)
{
	B_SetVisuals_Gobbo_Warrior_Visir();
	Npc_SetToFightMode(self,ItMw_1h_Misc_Axe);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
};

//======== ГРИБНИКИ =========

instance Gobbo_Warrior_Till_1(Mst_Default_Gobbo_Warrior)
{
	B_SetVisuals_Gobbo_Warrior();
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
};

instance Gobbo_Warrior_Till_2(Mst_Default_Gobbo_Warrior)
{
	B_SetVisuals_Gobbo_Warrior();
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
};

instance Gobbo_Warrior_Visir_Till(Mst_Default_Gobbo_Warrior)
{
	B_SetVisuals_Gobbo_Warrior_Visir();
	Npc_SetToFightMode(self,ItMw_1h_Misc_Axe);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
};
instance Gobbo_Warrior_Visir_Erol(Mst_Default_Gobbo_Warrior)
{
	B_SetVisuals_Gobbo_Warrior_Visir();
	Npc_SetToFightMode(self,ItMw_1h_Misc_Axe);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
	CreateInvItems(Gobbo_Warrior_Visir_Erol,ItWr_Stoneplate_SilverPiece,1);
};

