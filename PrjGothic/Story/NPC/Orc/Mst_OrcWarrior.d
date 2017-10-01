
prototype Mst_Default_OrcWarrior(C_Npc)
{
	name[0] = "Орк-воин";
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCWARRIOR;
	voice = 18;
	level = 30;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 20;
	HitChance[NPC_TALENT_1H] = 60;
	HitChance[NPC_TALENT_2H] = 60;
	HitChance[NPC_TALENT_BOW] = 60;
	HitChance[NPC_TALENT_CROSSBOW] = 60;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = 0;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
};

func void B_SetVisuals_OrcWarrior()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_HeadWarrior",DEFAULT,DEFAULT,-1);
};


instance OrcWarrior_Roam(Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance OrcWarrior_Rest(Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem(self,ItMw_2H_OrcAxe_02);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcWarrior_Sit(Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance OrcWarrior_Harad(Mst_Default_OrcWarrior)
{
	name[0] = "Орк-разведчик";
	level = 15;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 75;
	protection[PROT_FLY] = 75;
	B_SetVisuals_OrcWarrior();
	EquipItem(self,ItMw_2H_OrcAxe_01);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcWarrior_Grimbald1(Mst_Default_OrcWarrior)
{
	name[0] = "Орк";
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 200;
	B_SetVisuals_OrcWarrior();
	EquipItem(self,ItMw_2H_OrcAxe_01);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcWarrior_Grimbald2(Mst_Default_OrcWarrior)
{
	name[0] = "Орк";
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 200;
	B_SetVisuals_OrcWarrior();
	EquipItem(self,ItMw_2H_OrcAxe_01);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcWarrior_Grimbald3(Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	Mdl_SetModelFatness(self,1.0);
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 250;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};


