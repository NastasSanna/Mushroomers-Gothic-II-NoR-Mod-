
instance VLK_416_Matteo(Npc_Default)
{
	name[0] = "Маттео";
	guild = GIL_VLK;
	id = 416;
	voice = 2;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_IgnoreFlags] = IGNORE_PortalRoom_Public;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Gomez,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,1.8);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_416;
	aivar[AIV_TheftDex] = 80;
	CreateInvItems(self, ItMi_Gold, 150);
};


func void Rtn_Start_416()
{
	TA_Cook_Stove(7,30,8,30,"NW_CITY_SHOP02_COOK");
	TA_Stand_ArmsCrossed(8,30,10,10,"NW_CITY_MATTEO");
	TA_Smalltalk(10,10,13,0,"NW_CITY_MATTEO");//VLK_451_Buerger
	TA_Smalltalk(13,0,14,0,"NW_CITY_MATTEO");//Гритта
	TA_Stand_ArmsCrossed(14,0,15,30,"NW_CITY_MATTEO");
	TA_Smalltalk(15,30,16,35,"NW_CITY_MATTEO");//Гритта
	TA_Stand_ArmsCrossed(16,35,20,0,"NW_CITY_MATTEO");
	TA_Sit_Throne(20,0,22,0,"NW_CITY_SHOP02_ARMCHAIR");
	TA_Sleep(22,0,7,30,"NW_CITY_BED_MATTEO");
};
func void Rtn_TOT_416()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};

