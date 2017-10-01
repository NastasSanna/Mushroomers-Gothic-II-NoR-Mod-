
instance VLK_469_Halvor(Npc_Default)
{
	name[0] = "Халвор";
	guild = GIL_VLK;
	id = 469;
	voice = 21;//6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_Mace_L_03);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart11,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_469;
	aivar[AIV_TheftDex] = 78;
	CreateInvItems(self, ItMi_Gold, 150);
};


func void Rtn_Start_469()
{
	TA_Stand_ArmsCrossed(5,0,20,0,"NW_CITY_HABOUR_POOR_AREA_PATH_01");
	TA_Stand_Drinking(20,0,1,0,"NW_CITY_HABOUR_PUFF_IN_07");
	TA_Sleep(1,0,5,0,"NW_CITY_BED_HALVOR");
};

func void Rtn_Money_469()
{
	TA_Stand_ArmsCrossed(5,0,20,0,"NW_CITY_HABOUR_POOR_AREA_PATH_01");
	TA_Sit_Chair(20,0,0,5,"NW_CITY_BED_HALVOR");
	TA_Sleep(0,5,5,0,"NW_CITY_BED_HALVOR");
};


