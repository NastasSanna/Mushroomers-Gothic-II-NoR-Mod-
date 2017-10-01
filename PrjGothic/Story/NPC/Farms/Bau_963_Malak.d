
instance BAU_963_Malak(Npc_Default)
{
	name[0] = "Пастух";
	name[1] = "Малак";
	guild = GIL_BAU;
	id = 963;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal_Sly,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_963;
	aivar[AIV_TheftDex] = 43;
	CreateInvItems(self, ItMi_Gold, 40);
};


func void Rtn_preStart_963()
{
	TA_Smalltalk(6,0,22,0,"NW_FARM3_PATH_03");
	TA_Smalltalk(22,0,6,0,"NW_FARM3_PATH_03");
};
func void Rtn_Start_963()
{
	TA_Stand_Eating(6,0,22,0,"NW_FARM3_MALAK");
	TA_Sit_Campfire(22,0,6,0,"NW_FARM3_OUT_03");
};


