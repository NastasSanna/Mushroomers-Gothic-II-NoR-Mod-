
instance PC_BloodwinSnow(Npc_Default)
{
	name[0] = "BloodwinSnow";
	guild = GIL_NONE;	
	id = 1618;
	voice = 11;
	npcType = npctype_main;
	
	B_SetNpcVisual(self,MALE,"Hum_Head_Snow",Face_N_BloodwinSnow,BodyTex_N,ITAR_OreBaron_Addon);
	CreateInvItem(self,ItMw_1H_Special_03);
	
	B_SetAttributesToChapter(self, 6);
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	B_SetFightSkills(self,70);
	fight_tactic = FAI_HUMAN_MASTER;
	
	aivar[AIV_IgnoreFlags] = -1;
	aivar[AIV_Behaviour] = BEHAV_NeverRansack;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride | TEMPER_NoFightParker;

	daily_routine = Rtn_Start_1618;
};

func void Rtn_Start_1618()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_MAGECAVE_RUNE");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_MAGECAVE_RUNE");
};

//==========================================
instance PC_SnowStudioActor_01(Npc_Default)
{
	name[0] = "Актер SnowStudio";
	guild = GIL_NONE;	
	id = 1620;
	voice = 2;
	npcType = npctype_main;
	B_SetAttributesToChapter(self, 6);
	B_SetFightSkills(self,50);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Mud,BodyTex_N,ITAR_RANGER_Addon);
	CreateInvItem(self,ItMw_2H_Blessed_03);
	
	fight_tactic = FAI_HUMAN_MASTER;
	aivar[AIV_IgnoreFlags] = -1;
	aivar[AIV_Behaviour] = BEHAV_NeverRansack;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride;

	start_aistate = ZS_Follow_Player;
};

func void Rtn_Start_1620()
{
	TA_Follow_Player(8,0,22,0,"NW_MAGECAVE_13");
	TA_Follow_Player(22,0,8,0,"NW_MAGECAVE_13");
};


//==========================================
instance PC_SnowStudioActor_02(Npc_Default)
{
	name[0] = "Актер SnowStudio";
	guild = GIL_NONE;	
	id = 1621;
	voice = 9;
	npcType = npctype_main;
	B_SetAttributesToChapter(self, 6);
	B_SetFightSkills(self,50);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_ToughBald_Nek,BodyTex_P,ITAR_RANGER_Addon);
	CreateInvItem(self,ItMw_Barbarenstreitaxt);
	
	fight_tactic = FAI_HUMAN_MASTER;
	aivar[AIV_IgnoreFlags] = -1;
	aivar[AIV_Behaviour] = BEHAV_NeverRansack;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride;

	start_aistate = ZS_Follow_Player;
};

func void Rtn_Start_1621()
{
	TA_Follow_Player(8,0,22,0,"NW_MAGECAVE_10");
	TA_Follow_Player(22,0,8,0,"NW_MAGECAVE_10");
};
