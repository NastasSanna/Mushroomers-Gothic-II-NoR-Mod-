
instance BAU_942_Randolph(Npc_Default)
{
	name[0] = NAME_Bauer;
	name[1] = "Рендольф";
	guild = GIL_BAU2;
	id = 942;
	voice = 13;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal_Kharim,BodyTex_B,ITAR_Bau_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_942;
	aivar[AIV_TheftDex] = 58;
	CreateInvItems(self, ItMi_Gold, 2);
};


func void Rtn_Start_942()
{
	TA_Pick_FP(5,0,21,0,"NW_FARM2_FIELD_04");
	TA_Roast_Scavenger(21,0,5,0,"NW_FARM2_BBQ");
};


