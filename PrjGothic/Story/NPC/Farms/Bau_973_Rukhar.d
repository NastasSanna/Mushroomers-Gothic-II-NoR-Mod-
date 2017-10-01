
instance BAU_973_Rukhar(Npc_Default)
{
	name[0] = NAME_Bauer;
	name[1] = "Рухар";
	guild = GIL_BAU2;
	id = 973;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_L_NormalBart02,BodyTex_L,ITAR_Bau_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_973;
	aivar[AIV_TheftDex] = 26;
	CreateInvItems(self, ItMi_Gold, 30);
};


func void Rtn_Start_973()
{
	TA_Pick_FP(5,0,21,0,"NW_FARM2_FIELD_04_D");
	TA_Stand_Drinking(21,0,5,0,"NW_FARM2_OUT_07");
};


