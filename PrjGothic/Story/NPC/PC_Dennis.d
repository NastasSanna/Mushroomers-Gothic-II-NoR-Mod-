
instance PC_Dennis(Npc_Default)
{
	name[0] = "Dennis";
	guild = GIL_NONE;	
	id = 1623;
	voice = 23;
	npcType = npctype_main;
	
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_DenisSeregin,BodyTex_N,ITAR_Governor);
	CreateInvItem(self,ItMw_Sturmbringer);
	
	B_SetAttributesToChapter(self, 6);
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	B_SetFightSkills(self,70);
	fight_tactic = FAI_HUMAN_MASTER;
	
	aivar[AIV_IgnoreFlags] = -1;
	aivar[AIV_Behaviour] = BEHAV_NeverRansack;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride;

	daily_routine = Rtn_Start_1623;
};

func void Rtn_Start_1623()
{
	TA_Play_Guitar(4,0,6,0,"NW_CITY_TAVERN_IN_04"); //Valentino 12-4
	TA_Play_Guitar(6,0,11,0,"NW_CITY_HABOUR_TAVERN01_06");
	TA_Play_Guitar(11,0,17,0,"NW_CITY_UPTOWNPARADE_HAGEN");
	TA_Play_Guitar(17,0,4,0,"NW_TAVERNE_IN_07"); //974_Bauer 
};
