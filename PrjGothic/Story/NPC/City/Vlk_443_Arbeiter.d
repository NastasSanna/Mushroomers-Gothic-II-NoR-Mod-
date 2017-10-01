
instance VLK_443_Arbeiter(Npc_Default)
{
	name[0] = "Работник";
	name[1] = "Бруно";
	guild = GIL_VLK;
	id = 443;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Mace_L_04);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak04,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_443;
};


func void Rtn_Start_443()
{
	TA_Repair_Hut(7,40,19,4,"NW_CITY_HABOUR_REPAIR_05");
	TA_Smalltalk(19,4,23,30,"NW_CITY_HABOUR_02");//VLK_442_Arbeiter
	TA_WatchConcert(23,30,3,45,"NW_CITY_HABOUR_PUFF_03");
	TA_Sit_Bench(3,45,7,40,"NW_CITY_HABOUR_06_C");
};


