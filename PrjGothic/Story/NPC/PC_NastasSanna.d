
instance PC_NastasSanna(Npc_Default)
{
	name[0] = "НастасьСанна";
	guild = GIL_NONE;	
	id = 1616;
	voice = 19;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self, 4);
	B_SetFightSkills(self,50);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_SM_BABE9",Face_N_NastasSanna,BodyTexBabe_L,ITAR_Leather_Baby);
	Mdl_SetModelFatness(self, 0.8);
	CreateInvItem(self,ItMw_Schwert1);
	CreateInvItem(self,ItRw_Bow_M_04);
	
	aivar[AIV_IgnoreFlags] = -1;
	aivar[AIV_Behaviour] = BEHAV_NoDamageReaction | BEHAV_NeverRansack;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride | TEMPER_NoFightParker;

	daily_routine = Rtn_Hide1_1616;
};

func void Rtn_Hide1_1616()
{
	TA_Study_WP(8,0,22,0,"NW_NASTASSANNA_01");
	TA_Study_WP(22,0,8,0,"NW_NASTASSANNA_01");
};

func void Rtn_Hide2_1616()
{
	TA_Study_WP(8,0,22,0,"NW_NASTASSANNA_02");
	TA_Study_WP(22,0,8,0,"NW_NASTASSANNA_02");
};

func void Rtn_Hide3_1616()
{
	TA_Study_WP(8,0,22,0,"NW_NASTASSANNA_03");
	TA_Study_WP(22,0,8,0,"NW_NASTASSANNA_03");
};


instance PC_NastasSanna_Snow(Npc_Default)
{
	name[0] = "НастасьСанна";
	guild = GIL_NONE;	
	id = 16161;
	voice = 19;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self, 4);
	B_SetFightSkills(self,50);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_SM_BABE9",Face_N_NastasSanna,BodyTexBabe_L,ITAR_Leather_Baby);
	Mdl_SetModelFatness(self, 0.8);
	CreateInvItem(self,ItMw_Schwert1);
	CreateInvItem(self,ItRw_Bow_M_04);
	
	aivar[AIV_IgnoreFlags] = -1;
	aivar[AIV_Behaviour] = BEHAV_NoDamageReaction | BEHAV_NeverRansack;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride | TEMPER_NoFightParker;

	start_aistate = ZS_Follow_Player;
};

func void Rtn_Snow_16161()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_MAGECAVE_NS_OUT");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_MAGECAVE_NS_OUT");
};
func void Rtn_TOT_16161()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"TOT");
	TA_Stand_ArmsCrossed(22,0,8,0,"TOT");
};
