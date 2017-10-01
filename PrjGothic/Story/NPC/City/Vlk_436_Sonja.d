
instance VLK_436_Sonja(Npc_Default)
{
	name[0] = "Соня";
	guild = GIL_VLK;
	id = 436;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe6",FaceBabe_L_Charlotte2,BodyTexBabe_L,ITAR_VlkBabe_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_436;
	aivar[AIV_TheftDex] = 58;
	CreateInvItems(self, ItMi_Gold, 70);
};


func void Rtn_Start_436()
{
	TA_Sleep(6,0,11,0,"NW_CITY_SONJA_BED");
	TA_Stand_ArmsCrossed(11,0,15,0,"NW_CITY_PUFF_COUNTER");
	TA_Sit_Throne(15,0,6,0,"NW_CITY_PUFF_THRONE");
};
func void Rtn_TOT_436()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};

