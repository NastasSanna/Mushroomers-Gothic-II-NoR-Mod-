/**************************************************************************

								яў≈–
	
	¬аран.
	“рофеи: 2 когт€, кожа рептилии.
	
	 вестовые: на пл€же у пиратов.
	
***************************************************************************/ 

prototype Mst_Default_Waran(C_Npc)
{
	name[0] = "ящер";
	guild = GIL_WARAN;
	aivar[AIV_MM_REAL_ID] = ID_WARAN;
	level = 12;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 120;
	attribute[ATR_HITPOINTS] = 120;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WARAN;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack + BEHAV_FollowInWater;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Waran()
{
	Mdl_SetVisual(self,"Waran.mds");
	Mdl_SetVisualBody(self,"War_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Waran(Mst_Default_Waran)
{
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_Claw,2);
	CreateInvItems(self,itat_LurkerSkin,1);
};

instance BeachWaran1(Mst_Default_Waran)
{
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_Claw,2);
	CreateInvItems(self,itat_LurkerSkin,1);
};

instance BeachWaran2(Mst_Default_Waran)
{
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_Claw,2);
	CreateInvItems(self,itat_LurkerSkin,1);
};

