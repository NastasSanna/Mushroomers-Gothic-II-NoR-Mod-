
instance VLK_475_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 475;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Herek,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_475;
};


func void Rtn_Start_475()
{
	TA_Sit_Bench(10,1,17,50,"NW_CITY_HABOUR_06_C");
	TA_Smoke_Joint(17,50,20,15,"NW_CITY_HABOUR_06_B");
	TA_Sit_Bench(20,15,1,17,"NW_CITY_HABOUR_06_C");
	TA_Stand_Drinking(1,17,5,8,"NW_CITY_HABOUR_PUFF_IN_01");
	TA_Smalltalk(5,8,10,1,"NW_CITY_HABOUR_POOR_AREA_01");
};

