
instance VLK_4302_Addon_Elvrich(Npc_Default)
{
	name[0] = "Элврих";
	guild = GIL_NONE;
	id = 4302;
	voice = 12;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_B_Normal01,BodyTex_B,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4302;
	aivar[AIV_TheftDex] = 62;
	CreateInvItems(self, ItMi_Gold, 110);
};


func void Rtn_Start_4302()
{
	TA_Sit_Bench(4,30,8,30,"NW_CITY_MERCHANT_HUT_01_FRONT");
	TA_Saw(8,30,13,25,"NW_CITY_MERCHANT_BAUMSAEGE");
	TA_Sit_Bench(13,5,14,0,"NW_CITY_MERCHANT_HUT_01_FRONT");
	TA_Saw(14,0,18,30,"NW_CITY_MERCHANT_BAUMSAEGE");
	TA_Stand_Sweeping(18,30,19,30,"NW_CITY_MERCHANT_BAUMSAEGE");
	TA_Stand_Sweeping(19,30,20,30,"NW_CITY_MERCHANT_SHOP01_FRONT_01B");
	TA_Stand_Sweeping(20,30,21,30,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Stand_Eating(21,30,22,45,"NW_CITY_MERCHANT_HUT_01_FRONT");
	TA_Sit_Bench(22,45,0,10,"NW_CITY_MERCHANT_HUT_01_FRONT");
	TA_Smalltalk(0,10,0,40,"NW_CITY_HABOUR_PUFF_IN_07");
	TA_Smalltalk(0,40,2,30,"NW_CITY_HABOUR_PUFF_PECK");
	TA_Sleep(2,30,4,30,"NW_CITY_HABOUR_PUFF_PECK");
};
func void Rtn_Punished_4302()
{
	TA_Saw(6,30,13,25,"NW_CITY_MERCHANT_BAUMSAEGE");
	TA_Sit_Bench(13,5,14,0,"NW_CITY_MERCHANT_HUT_01_FRONT");
	TA_Saw(14,0,18,30,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Stand_Sweeping(18,30,19,30,"NW_CITY_MERCHANT_BAUMSAEGE");
	TA_Stand_Sweeping(19,30,20,30,"NW_CITY_MERCHANT_SHOP01_FRONT_01B");
	TA_Stand_Sweeping(20,30,21,30,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Stand_Eating(21,30,22,45,"NW_CITY_MERCHANT_HUT_01_FRONT");
	TA_Sit_Bench(22,45,6,30,"NW_CITY_MERCHANT_HUT_01_FRONT");
};
func void Rtn_TOT_4302()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};

