
instance PC_Himera(Npc_Default)
{
	name[0] = MOBNAME_Himera;
	guild = GIL_NONE;	
	id = 1631;
	voice = 2;
	npcType = npctype_main;
	
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Bartholo,BodyTex_N,ItAr_BDT_H);
	CreateInvItem(self,ItMW_Addon_Hacker_2h_01);
	
	B_SetAttributesToChapter(self, 6);
	B_SetFightSkills(self,70);
	fight_tactic = FAI_HUMAN_MASTER;
	
	aivar[AIV_IgnoreFlags] = -1;
	aivar[AIV_Behaviour] = BEHAV_NeverRansack | BEHAV_Invisible;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride | TEMPER_NoFightParker;

	daily_routine = Rtn_Start_1632;
};

func void Rtn_Start_1632()
{
	TA_PickMushrooms(8,0,10,0,"NW_FOREST_PATH_79");
	TA_PickMushrooms(10,0,12,0,"NW_FOREST_PATH_78");
	TA_PickMushrooms(12,0,14,0,"NW_FOREST_PATH_79");
	TA_PickMushrooms(14,0,16,0,"NW_FOREST_PATH_80");
	TA_PickMushrooms(16,0,18,0,"NW_FOREST_PATH_79");
	TA_PickMushrooms(18,0,20,0,"NW_FOREST_PATH_78");
	TA_Smalltalk(20,0,8,0,"NW_FOREST_PATH_79");
};
