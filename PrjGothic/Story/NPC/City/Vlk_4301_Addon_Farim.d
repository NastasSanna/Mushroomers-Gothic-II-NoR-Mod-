
instance VLK_4301_Addon_Farim(Npc_Default)
{
	name[0] = "Фарим";
	guild = GIL_VLK;
	id = 4301;
	voice = 13;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,2);
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	fight_tactic = FAI_HUMAN_NORMAL;
	CreateInvItems(self,ItMi_Aquamarine,1);
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart08,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4301;
	aivar[AIV_TheftDex] = 20;
	CreateInvItems(self, ItMi_Gold, 11);
};


func void Rtn_Start_4301()
{
	TA_Smalltalk(8,0,10,0,"NW_CITY_PIRATESCAMP_03");
	TA_Stand_Guarding(10,0,12,10,"NW_CITY_PIRATESCAMP_01");
	TA_Smalltalk(12,10,15,0,"NW_CITY_PIRATESCAMP_03");
	TA_Repair_Hut(15,0,19,0,"NW_CITY_PIRATESCAMP_REPAIR");
	TA_Sit_Campfire(19,0,23,30,"NW_CITY_PIRATESCAMP_03");
	TA_Sleep(23,30,8,0,"NW_CITY_PIRATESCAMP_BED");
};

