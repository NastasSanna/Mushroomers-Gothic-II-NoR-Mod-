
instance Bau_903_Bodo(Npc_Default)
{
	name[0] = "Бодо";
	//name[0] = NAME_Bauer;
	guild = GIL_BAU;
	id = 903;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Sense);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal16,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_903;
	aivar[AIV_TheftDex] = 30;
	CreateInvItems(self, ItMi_Gold, 60);
};

func void Rtn_Start_903()
{
	TA_Smalltalk(7,45,21,45,"NW_BIGFARM_HOUSE_OUT_04"); //BAU_920_Bauer
	TA_Sit_Bench(21,45,7,45,"NW_BIGFARM_PATH_03");
};

func void Rtn_Guard_903()
{
	TA_GuardNpc(8,45,9,0,"NW_BIGFARM_HOUSE_OUT_06");
	TA_GuardNpc(9,0,12,0,"NW_BIGFARM_FOREST_03_NAVIGATION1");
	TA_GuardNpc(12,0,13,30,"NW_CASTLEMINE_TROLL_01");
	TA_GuardNpc(13,30,16,0,"NW_CASTLEMINE_TROLL_04_A");
	TA_GuardNpc(16,0,17,30,"NW_BIGMILL_MALAKSVERSTECK_02");
	TA_GuardNpc(17,30,18,0,"NW_BIGMILL_FIELD_MONSTER_01");
	TA_GuardNpc(18,0,18,30,"NW_BIGMILL_PATH_05");
	TA_GuardNpc(18,30,19,10,"NW_BIGFARM_CROSS");
	TA_GuardNpc(19,10,19,13,"NW_CITY_ENTRANCE_BACK");
	TA_GuardNpc(19,13,20,15,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Smalltalk(20,15,21,45,"NW_BIGFARM_HOUSE_OUT_04");
	TA_Sit_Bench(21,45,8,45,"NW_BIGFARM_PATH_03");
};

