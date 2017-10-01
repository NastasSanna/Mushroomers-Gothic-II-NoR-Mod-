
instance VLK_441_Garvell(Npc_Default)
{
	//name[0] = "Гарвелл";
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 441;
	voice =3;//4;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItSe_GoldPocket25,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Lefty,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_441;
	aivar[AIV_TheftDex] = 10;
	CreateInvItems(self, ItSe_GoldPocket25, 1);
};


func void Rtn_Start_441()
{
	TA_Sit_Bench(9,50,16,45,"NW_CITY_HABOUR_06_C");
	TA_Stand_Drinking(16,45,19,7,"NW_CITY_HABOUR_TAVERN01_07");
	TA_Sit_Chair(19,7,4,50,"NW_CITY_HABOUR_TAVERN01_05");
};

