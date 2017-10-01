
instance VLK_448_Joe(Npc_Default)
{
	name[0] = NAME_Buerger;
	name[1] = "Джо";
	guild = GIL_OUT;
	id = 448;
	voice = 1;//10;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride;
	aivar[AIV_IgnoreFlags] = IGNORE_Murder | IGNORE_Theft | IGNORE_Sheepkiller;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_ToughBald,BodyTex_P,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_448;
	aivar[AIV_TheftDex] = 25;
	CreateInvItems(self, ItMi_Gold, 25);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
};

func void Rtn_Start_448()
{
	//TA_Stand_ArmsCrossed(20,0,23,20,"NW_CITY_MERCHANT_SHOP03_FRONT_02");
	TA_Min(self,23,20,23,23,ZS_TeleportToWP,"NW_CITY_TO_KANAL_07");
	TA_Stand_ArmsCrossed(23,23,23,45,"NW_CITY_LADDER_00");
	TA_Stand_ArmsCrossed(23,45,0,2,"NW_CITY_LADDER_03");
	TA_SneakToWp(0,2,0,15,"NW_CITY_UPTOWN_HUT_04_01");
	TA_SneakToWp(0,15,0,40,"NW_CITY_UPTOWN_HUT_04_05");
	TA_SneakToWp(0,40,0,50,"NW_CITY_UPTOWN_HUT_04_01");
	TA_SneakToWp(0,50,1,15,"NW_CITY_UPTOWN_HUT_05_COOK");
//	TA_OpenChest(1,15,2,30,"NW_CITY_UPTOWN_HUT_05_COOK");
	TA_SneakToWp(1,15,2,5,"NW_CITY_SALANDRIL");
	TA_SneakToWp(2,5,2,30,"NW_CITY_LADDER_03");
	TA_Stand_ArmsCrossed(2,30,2,35,"NW_CITY_LADDER_00");
	TA_Stand_Drinking(2,35,5,30,"NW_CITY_HABOUR_TAVERN01_08");
	TA_Silenttalk(5,30,7,0,"NW_CITY_HABOUR_12");	//Руперт
	TA_Min(self,7,0,7,3,ZS_TeleportToWP,"NW_CITY_KANAL_09");
	TA_Sleep(7,3,23,20,"NW_CITY_KANAL_ROOM_05_BED_02");
};
func void Rtn_Tot_448()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};


