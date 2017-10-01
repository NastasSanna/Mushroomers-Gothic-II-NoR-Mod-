
instance VLK_403_Gerbrandt(Npc_Default)
{
	name[0] = NAME_Buerger;
	name[1] = "Гербрандт";
	guild = GIL_VLK;
	id = 403;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Mace);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItSe_GoldPocket100,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_Tough_Santino,BodyTex_L,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_403;
	aivar[AIV_TheftDex] = 30;
	CreateInvItems(self, ItSe_GoldPocket100, 1);
};


func void Rtn_Start_403()
{
	TA_Sleep(22,0,8,0,"NW_CITY_GERBRANDT_BED_01");
	TA_Smalltalk(8,0,11,0,"NW_CITY_SMALLTALK_02");
	TA_Sit_Bench(11,0,15,0,"NW_CITY_UPTOWN_PATH_23_B");
	TA_Smalltalk(15,0,18,0,"NW_CITY_SMALLTALK_02");
	TA_Sit_Bench(18,0,22,0,"NW_CITY_UPTOWN_PATH_23_B");
};


