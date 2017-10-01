
instance OUT_1210_Grimbald(Npc_Default)
{
	name[0] = "ֳנטלבאכüה";
	guild = GIL_OUT;
	id = 1210;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_B_Normal_Kirgo,BodyTex_B,ITAR_Leather_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_preStart_1210;
	aivar[AIV_TheftDex] = 85;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride;
	
	CreateInvItems(self,ItKe_Chest_Hunters,1);	
};


func void Rtn_preStart_1210()
{
//	TA(self,8,23,ZS_AimTo,"NW_XARDAS_BANDITS_05");
//	TA(self,23,8,ZS_AimTo,"NW_XARDAS_BANDITS_05");
	TA_Stand_WP( 8,0,23,0,"NW_XARDAS_BANDITS_05");
	TA_Stand_WP(23,0, 8,0,"NW_XARDAS_BANDITS_05");
};

func void Rtn_Start_1210()
{
	TA_Sit_Campfire(8,0,23,0,"NW_XARDAS_BANDITS_07_CAMPFIRE");
	TA_Sleep(23,0,8,0,"NW_XARDAS_BANDITS_06_BED");
};

func void Rtn_Check_1210()
{
	TA_RunToWP(8,0,23,0,"NW_XARDAS_GOBBO_01");
	TA_RunToWP(23,0,8,0,"NW_XARDAS_GOBBO_01");
};

func void Rtn_Ready_1210()
{
	TA_Hide(8,0,23,0,"NW_XARDAS_STAIRS_04");
	TA_Hide(23,0,8,0,"NW_XARDAS_STAIRS_04");
};

func void Rtn_GetBow_1210()
{
	Mdl_ApplyOverlayMds(self,"HUMANS_FLEE.MDS");
	TA_RunToWP(8,0,23,0,"NW_XARDAS_GOBBO_01");
	TA_RunToWP(23,0,8,0,"NW_XARDAS_GOBBO_01");
};

func void Rtn_Return_1210()
{
	Mdl_RemoveOverlayMDS(self,"HUMANS_FLEE.MDS");
	TA_Hide(8,0,23,0,"NW_XARDAS_BANDITS_05");
	TA_Hide(23,0,8,0,"NW_XARDAS_BANDITS_05");
};

func void Rtn_GoEast_1210()
{
	TA_Sit_Bench(8,0,15,0,"NW_TAVERNE_HUNTERCAMP_04_FIRESIT");
	TA_Practice_RangedWeapon(15,0,17,30,"NW_TAVERNE_HUNTERCAMP_PRACTICE");
	TA_Sit_Bench(17,30,8,0,"NW_TAVERNE_HUNTERCAMP_04_FIRESIT");
};


