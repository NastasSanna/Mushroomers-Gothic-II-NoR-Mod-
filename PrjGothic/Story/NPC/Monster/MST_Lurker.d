/**************************************************************************

								�����
	
	����.
	������: ���� ��������, ����� ������.
  
***************************************************************************/

prototype Mst_Default_Lurker(C_Npc)
{
	name[0] = "����";
	guild = GIL_LURKER;
	aivar[AIV_MM_REAL_ID] = ID_LURKER;
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
	fight_tactic = FAI_LURKER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack + BEHAV_FollowInWater;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Lurker()
{
	Mdl_SetVisual(self,"Lurker.mds");
	Mdl_SetVisualBody(self,"Lur_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Lurker(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_LurkerClaw,1);
	CreateInvItems(self,itat_LurkerSkin,1);
};


