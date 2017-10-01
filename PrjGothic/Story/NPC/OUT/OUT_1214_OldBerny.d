

instance OUT_1214_OldBerny(Npc_Default)
{
	name[0] = "Берни";
	guild = GIL_OUT;
	id = 1214;
	voice = 2;//1;
	flags = NPC_FLAG_GHOST | NPC_FLAG_FRIEND | NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Corristo,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1214;
};

func void Rtn_Start_1214()
{
	var string wp;	wp = Npc_GetNearestWP(hero);
	if(Hlp_StrCmp(wp,""))	{
		wp = "NW_CITYFOREST_CAVE_06";
	};
	TA_Follow_Player(6,0,22,0,wp);
	TA_Follow_Player(22,0,6,0,wp);
};

func void Rtn_Remove_1214()
{
	TA_Ghost(6,0,22,0,"");
	TA_Ghost(22,0,6,0,"");
};

func void Rtn_TOT_1214()
{
	TA_Stand_WP(6,0,22,0,"TOT");
	TA_Stand_WP(22,0,6,0,"TOT");
};

