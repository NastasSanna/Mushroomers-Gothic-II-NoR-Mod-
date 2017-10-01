
instance VLK_439_Vatras(Npc_Default)
{
	name[0] = "Ватрас";
	guild = GIL_VLK;
	id = 439;
	voice = 2;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_MagicUser;
	aivar[AIV_IgnoreFlags] = IGNORE_Armor | IGNORE_FakeGuild;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,ItSc_LightHeal,2);
	CreateInvItems(self,ItSc_Zap,2);
	CreateInvItems(self,ItSc_Icebolt,2);
	CreateInvItems(self,ItSc_Light,2);
	CreateInvItems(self,ItSc_TrfScavenger,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_B_Saturas,BodyTex_B,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_439;
	aivar[AIV_TheftDex] = 91;
	CreateInvItems(self, ItMi_Gold, 250);
};


func void Rtn_Start_439()
{
	TA_Stand_WP(5,50,6,15,"NW_CITY_MERCHANT_TEMPLE_FRONT");
	TA_Preach_Vatras(6,15,12,0,"NW_CITY_MERCHANT_TEMPLE_FRONT");
	TA_Stand_WP(12,0,12,15,"NW_CITY_MERCHANT_TEMPLE_STAND");
	TA_Smalltalk(12,15,13,0,"NW_CITY_MERCHANT_TEMPLE_STAND");
	TA_Stand_WP(13,0,13,15,"NW_CITY_MERCHANT_TEMPLE_STAND");
	TA_Smalltalk(13,15,14,0,"NW_CITY_MERCHANT_TEMPLE_STAND");
	TA_Stand_WP(14,0,14,15,"NW_CITY_MERCHANT_TEMPLE_STAND");
	TA_Smalltalk(14,15,15,0,"NW_CITY_MERCHANT_TEMPLE_STAND");
	TA_Stand_WP(15,0,15,15,"NW_CITY_MERCHANT_TEMPLE_STAND");
	TA_Smalltalk(15,15,16,0,"NW_CITY_MERCHANT_TEMPLE_STAND");
	TA_Stand_WP(16,0,16,15,"NW_CITY_MERCHANT_TEMPLE_STAND");
	TA_Smalltalk(16,15,17,0,"NW_CITY_MERCHANT_TEMPLE_STAND");
	TA_Stand_WP(17,0,19,0,"NW_CITY_MERCHANT_TEMPLE_STAND");
	TA_Smalltalk(19,0,20,0,"NW_CITY_MERCHANT_TEMPLE_STAND");	//Торбен
	TA_Potion_Alchemy(20,0,23,30,"NW_CITY_MERCHANT_HUT_02_IN_02");
	TA_Sleep(23,30,4,15,"NW_CITY_BED_DARON");
	TA_Pray_Innos_FP(4,15,5,50,"NW_CITY_MERCHANT_TEMPLE_IN");
};
func void Rtn_Tot_439()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};


