
instance Mil_310_Stadtwache(Npc_Default)
{
	name[0] = NAME_Stadtwache;
	guild = GIL_MIL;
	id = 310;
	voice = 2;//7;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_Temper] = TEMPER_NewsOverride;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Raven,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_310;
};


func void Rtn_Start_310()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_CITY_ENTRANCE_GUARD_02");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_CITY_ENTRANCE_GUARD_02");
};

