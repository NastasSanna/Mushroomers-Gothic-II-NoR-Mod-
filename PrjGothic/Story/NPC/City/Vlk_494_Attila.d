
instance VLK_494_Attila(Npc_Default)
{
	name[0] = "Вышибала";//"Аттила";
	guild = GIL_None;
	id = 494;
	voice = 2;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_Mace_L_03);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough_Santino,BodyTex_L,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,55);
	daily_routine = Rtn_Start_494;
	aivar[AIV_TheftDex] = 55;
};


func void Rtn_Start_494()
{
	TA(self,8,22,ZS_TeleportToWP,"NW_CITY_KANAL_ROOM_04_02");
	TA(self,22,8,ZS_TeleportToWP,"NW_CITY_KANAL_ROOM_04_02");
//	TA_Stand_Guarding(4,0,22,0,"NW_CITY_KANAL_ROOM_04_02");
//	TA_Stand_Guarding(22,0,4,0,"NW_CITY_KANAL_ROOM_04_02");
};

func void Rtn_Punishment_494()
{
	if (Hlp_IsValidNpc(hero))	{
		TA_Stand_WP(22,0,4,0,Npc_GetNearestWP(hero));
		TA_Stand_WP(4,0,22,0,Npc_GetNearestWP(hero));
	}
	else	{
		TA_Stand_WP(22,0,4,0,"NW_CITY_MERCHANT_SHOP03_IN_06");
		TA_Stand_WP(4,0,22,0,"NW_CITY_MERCHANT_SHOP03_IN_06");
	};
};

func void Rtn_ToHalvor_494()
{
	TA_Stand_ArmsCrossed(22,0,4,0,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_01");//"NW_CITY_HABOUR_HUT_02_IN");
	TA_Stand_ArmsCrossed(4,0,22,0,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_01");//"NW_CITY_HABOUR_HUT_02_IN");
};

