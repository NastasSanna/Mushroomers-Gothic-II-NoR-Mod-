
instance Mil_335_Rumbold(Npc_Default)
{
	name[0] = "Румболд";
	guild = GIL_MIL;
	id = 335;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride | TEMPER_BodyGuard;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Important_Arto,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Guard_335;
	aivar[AIV_TheftDex] = 24;
	CreateInvItems(self, ItMi_Gold, 45);
};


func void Rtn_Guard_335()
{
	TA_GuardNpc(8,32,9,17,"NW_CITY_TAVERN_IN_05");
	TA_GuardNpc(9,17,10,0,"NW_CITY_TAVERN_IN_05");
	TA_GuardNpc(10,0,10,30,"NW_CITY_DITCH_10");
	TA_GuardNpc(10,30,11,30,"NW_CITY_SMFOREST_01");
	TA_GuardNpc(11,30,14,30,"NW_CITY_SMFOREST_03");
	TA_GuardNpc(14,30,17,30,"NW_FOREST_XROAD_01");
	TA_GuardNpc(17,30,17,33,"NW_CITY_ENTRANCE_BACK");
	TA_GuardNpc(17,33,18,35,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_Sit_Chair(18,35,8,32,"NW_CITY_HABOUR_KASERN_BARRACK01_ENTRY_01");
};

func void Rtn_Start_335()
{
	TA_Smalltalk(8,40,11,14,"NW_CITY_KASERN_BARRACK02_02"); //Рик
	TA_Smalltalk(11,14,13,14,"NW_CITY_TAVERN_IN_05");
	TA_Stand_ArmsCrossed(13,14,16,55,"NW_CITY_HABOUR_KASERN_10");
	TA_Stand_ArmsCrossed(16,55,21,40,"NW_CITY_PLAZE_03");
	TA_Sit_Chair(21,40,8,40,"NW_CITY_HABOUR_KASERN_BARRACK01_ENTRY_01");
};