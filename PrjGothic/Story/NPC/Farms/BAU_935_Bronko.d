
instance BAU_935_Bronko(Npc_Default)
{
	name[0] = "Бронко";
	guild = GIL_BAU;
	id = 935;
	voice = 24;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride | TEMPER_BodyGuard;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Bau_Axe);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItMi_Gold,35);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal_Kirgo,BodyTex_B,ITAR_Bau_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Guard_935;
};

func void Rtn_Guard_935()
{
	TA_GuardNpc(9,0,10,30,"NW_FARM4_IN_06");
	TA_GuardNpc(10,30,12,00,"NW_FARM4_WOOD_MONSTER_MORE_02");
	TA_GuardNpc(12,00,12,30,"NW_FARM4_WOOD_MONSTER_MORE_02");
	TA_GuardNpc(12,30,13,30,"NW_FARM4_WOOD_MONSTER_MORE_02");
	TA_GuardNpc(13,30,14,30,"NW_FARM4_IN_06");
	TA_GuardNpc(14,30,15,00,"NW_BIGFARM_SEKOBWAY_01");
	TA_GuardNpc(15,00,15,30,"NW_BIGFARM_LAKE_MONSTER_05_01");
	TA_GuardNpc(15,30,16,30,"NW_BIGFARM_LAKE_05");
	TA_GuardNpc(16,30,17,30,"NW_TAVERNE_BIGFARM_05");
	TA_GuardNpc(17,30,18,0,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	TA_GuardNpc(18,0,18,3,"NW_CITY_ENTRANCE_BACK");
	TA_GuardNpc(18,3,19,5,"NW_CITY_MERCHANT_SHOP04_IN");
	TA_GuardNpc(19,5,19,30,"NW_LAKE__WATER_08");	//именно так, через "__"
	TA_Sit_Campfire(19,30,8,0,"NW_FARM4_REST_02");
};

func void Rtn_After_935()
{
	TA_Stand_ArmsCrossed(9,5,22,0,"NW_FARM4_FIELD_02_A");
	TA_Sit_Campfire(19,30,9,5,"NW_FARM4_REST_02");
};

