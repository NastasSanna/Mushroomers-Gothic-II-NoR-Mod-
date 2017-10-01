
instance MIL_324_Peck(Npc_Default)
{
	name[0] = "Пек";
	guild = GIL_MIL;
	id = 324;
	voice = 5;//12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	aivar[AIV_OriginalFightTactic] = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItKe_City_Tower_05,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal_Orik,BodyTex_B,ITAR_Mil_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_324;
	aivar[AIV_TheftDex] = 60;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride;
	aivar[AIV_MM_FollowTime] = 1000;
	aivar[AIV_FightDistCancel] = 700;
	aivar[AIV_MaxDistToWp] = FIGHT_DIST_RANGED_INNER - 50;
};


func void Rtn_Start_324()
{
	TA_Stand_ArmsCrossed(7,0,10,0,"NW_CITY_ARMORY_PECK");
	TA_Stand_ArmsCrossed(10,0,16,15,"NW_CITY_HABOUR_KASERN_CENTRE_01");
	TA_Stand_ArmsCrossed(16,15,22,0,"NW_CITY_ARMORY_PECK");
	TA_Sleep(22,0,7,0,"NW_CITY_BARRACK02_BED_PECK");
};
func void Rtn_Training_324()
{
	TA_Stand_ArmsCrossed(7,0,10,0,"NW_CITY_ARMORY_PECK");
	TA_Stand_ArmsCrossed(10,0,16,15,"NW_CITY_HABOUR_KASERN_CENTRE_01");
	TA_Stand_ArmsCrossed(16,15,18,0,"NW_CITY_ARMORY_PECK");
	TA_Stand_ArmsCrossed(18,00,22,0,"NW_CITY_HABOUR_KASERN_05_01");
	TA_Sleep(22,0,7,0,"NW_CITY_BARRACK02_BED_PECK");
};


