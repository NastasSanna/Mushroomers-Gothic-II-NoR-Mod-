
instance VLK_418_Gritta(Npc_Default)
{
	name[0] = "Гритта";
	guild = GIL_VLK;
	id = 418;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 5;
	attribute[ATR_HITPOINTS] = 5;
	fight_tactic = FAI_HUMAN_MASTER;
	CreateInvItems(self,ItMi_Gold,100);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_YoungBlonde,BodyTex_N,ITAR_VlkBabe_M);
	Mdl_SetModelFatness(self,0);
//	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_418;
	aivar[AIV_TheftDex] = 20;
	CreateInvItems(self, ItMi_Gold, 20);
};


func void Rtn_Start_418()
{
	TA_Stand_Sweeping(8,0,11,0,"NW_CITY_MERCHANT_HUT_01_IN");
	TA_Cook_Stove(11,0,13,2,"NW_CITY_BED_BOSPER_B");
	TA_Smalltalk(13,2,14,5,"NW_CITY_MERCHANT_SHOP02_IN_01");//Маттео
	TA_Smalltalk(14,5,14,30,"NW_CITY_PLAZE_06");//Регис
	TA_Smalltalk(14,30,15,30,"NW_CITY_MAINSTREET_04");//VLK_427_Buergerin
	TA_Smalltalk(15,30,16,35,"NW_CITY_MERCHANT_SHOP02_IN_01");//Маттео
	TA_Smalltalk(16,35,18,0,"NW_CITY_MERCHANT_SHOP01_FRONT_03_E");//VLK_427_Buergerin
	TA_Cook_Stove(18,0,21,0,"NW_CITY_BED_BOSPER_B");
	TA_Read_Bookstand(21,0,22,30,"NW_CITY_MERCHANT_HUT_01_IN");
	TA_Sleep(22,30,8,0,"NW_CITY_BED_BOSPER_B");
};

