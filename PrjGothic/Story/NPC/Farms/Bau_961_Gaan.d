
instance BAU_961_Gaan(Npc_Default)
{
	name[0] = "√‡‡Ì";
	guild = GIL_OUT;
	id = 961;
	voice = 2;
	flags = 0;
	npcType = NPCTYPE_MAIN;
//	aivar[AIV_StoryFlags] = STORY_Ranger;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_ShortSword2);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal02,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_Start_961;
	aivar[AIV_TheftDex] = 23;
	CreateInvItems(self, ItMi_Gold, 35);
};

func void Rtn_preStart_961()
{
	TA_Smalltalk(6,0,22,0,"NW_FARM3_PATH_03");
	TA_Smalltalk(22,0,6,0,"NW_FARM3_PATH_03");
};
func void Rtn_Start_961()
{
	TA_Stand_ArmsCrossed(7,30,12,0,"NW_BIGMILL_FARM3_09");
	TA_Stand_ArmsCrossed(12,0,17,0,"NW_FARM3_PATH_05");
	TA_Stand_ArmsCrossed(17,0,22,0,"NW_FARM3_PATH_11_SMALLRIVER_17");
	TA_Sit_Campfire(22,0,7,30,"NW_FARM3_OUT_03");
};


