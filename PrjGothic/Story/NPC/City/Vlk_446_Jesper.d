
instance VLK_446_Jesper(Npc_Default)
{
	name[0] = "Джеспер";
	guild = GIL_BDT;
	id = 446;
	voice = 6;//9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItKe_Fingers,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Normal07,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_446;
	aivar[AIV_TheftDex] = 80;
	CreateInvItems(self, ItMi_Gold, 180);
};

func void Rtn_Start_446()
{
	TA_Cook_Stove(6,0,14,0,"NW_CITY_KANAL_ROOM_05_03_COOK");
	TA_Sit_Throne(14,0,18,0,"NW_CITY_KANAL_ROOM_05_02");
	TA_Cook_Stove(18,0,21,0,"NW_CITY_KANAL_ROOM_05_03_COOK");
	TA_Sit_Throne(21,0,23,0,"NW_CITY_KANAL_ROOM_05_02");
	TA_Sleep(23,0,6,0,"NW_CITY_KANAL_ROOM_05_BED_02");
};

