
instance VLK_435_Nadja(Npc_Default)
{
	name[0] = "Надя";
	guild = GIL_VLK;
	id = 435;
	voice = 16;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_Hure,BodyTexBabe_F,ITAR_VlkBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_435;
	aivar[AIV_TheftDex] = 40;
	CreateInvItems(self, ItMi_Gold, 40);
};


func void Rtn_Start_435()
{
	AI_EquipBestArmor(self);
	TA_Smalltalk	( 3,45, 4,30,"NW_CITY_HABOUR_PUFF_ENTRANCE");
	TA_Smoke_Joint	( 4,30, 6, 0,"NW_CITY_PALCAMP_02");
	TA_Sit_Throne	( 6, 0, 9, 0,"NW_CITY_PUFF_THRONE");
	TA_Smoke_Joint	( 9, 0,10, 0,"NW_CITY_PALCAMP_02");
	TA_Sit_Throne	(10, 0,14, 0,"NW_CITY_PUFF_THRONE");
	TA_Smoke_Joint	(14, 0,15, 0,"NW_CITY_PALCAMP_02");
	TA_Sit_Throne	(15, 0,17, 0,"NW_CITY_PUFF_THRONE");
	TA_Sleep		(17, 0,21,45,"NW_CITY_NADJA_BED");
	TA_Smalltalk	(21,45,22,30,"NW_CITY_HABOUR_PUFF_ENTRANCE");
	TA_Smoke_Joint	(22,30,23,30,"NW_CITY_PALCAMP_02");
	TA_Spit_Fire	(23,30, 3,45,"NW_CITY_HARBOUR_PUFF_SPIT");
};

func void Rtn_NoSmoking_435()
{
	AI_EquipBestArmor(self);
	TA_Spit_Fire(23,30,3,55,"NW_CITY_HARBOUR_PUFF_SPIT");
	TA_Smalltalk(3,55,4,10,"NW_CITY_HABOUR_PUFF_ENTRANCE");
	TA_Stand_ArmsCrossed(4,10,6,0,"NW_CITY_PALCAMP_02");
	TA_Sit_Throne(6,0,9,0,"NW_CITY_PUFF_THRONE");
	TA_Stand_ArmsCrossed(9,0,10,0,"NW_CITY_PALCAMP_02");
	TA_Sit_Throne(10,0,14,0,"NW_CITY_PUFF_THRONE");
	TA_Stand_ArmsCrossed(14,0,15,0,"NW_CITY_PALCAMP_02");
	TA_Sit_Throne(15,0,17,0,"NW_CITY_PUFF_THRONE");
	TA_Sleep(17,0,22,30,"NW_CITY_NADJA_BED");
	TA_Stand_ArmsCrossed(22,30,23,30,"NW_CITY_PALCAMP_02");
};
func void Rtn_NoFireSpit_435()
{
	AI_EquipBestArmor(self);
	TA_Dance(23,30,3,45,"NW_CITY_HARBOUR_PUFF_SPIT");
	TA_Smalltalk(3,45,4,30,"NW_CITY_HABOUR_PUFF_ENTRANCE");
	TA_Stand_ArmsCrossed(4,30,6,0,"NW_CITY_PALCAMP_02");
	TA_Sit_Throne(6,0,9,0,"NW_CITY_PUFF_THRONE");
	TA_Stand_ArmsCrossed(9,0,10,0,"NW_CITY_PALCAMP_02");
	TA_Sit_Throne(10,0,14,0,"NW_CITY_PUFF_THRONE");
	TA_Stand_ArmsCrossed(14,0,15,0,"NW_CITY_PALCAMP_02");
	TA_Sit_Throne(15,0,17,0,"NW_CITY_PUFF_THRONE");
	TA_Sleep(17,0,22,30,"NW_CITY_NADJA_BED");
	TA_Stand_ArmsCrossed(22,30,23,30,"NW_CITY_PALCAMP_02");
};
func void Rtn_Tot_435()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};

