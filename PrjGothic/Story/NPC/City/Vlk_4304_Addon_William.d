
instance VLK_4304_Addon_William(Npc_Default)
{
	name[0] = "Вильям";
	guild = GIL_VLK;
	id = 4304;
	voice = 15;
	flags = FALSE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Homer,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0.9);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4304;
};


func void Rtn_Start_4304()
{
	TA_Smalltalk(8,0,10,0,"NW_CITY_PIRATESCAMP_03");
	TA_Cook_Pan(10,0,12,10,"NW_CITY_PIRATESCAMP_04");
	TA_Smalltalk(12,10,15,0,"NW_CITY_PIRATESCAMP_04");
	TA_Pick_FP(15,0,19,30,"NW_CITY_PIRATESCAMP_05B");
	TA_Stand_Guarding(19,30,23,20,"NW_CITY_PIRATESCAMP_01");
	TA_Sleep(23,20,8,0,"NW_CITY_PIRATESCAMP_BED");
};

