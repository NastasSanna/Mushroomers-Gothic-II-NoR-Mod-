
instance OUT_1212_Dragomir(Npc_Default)
{
	name[0] = "Äðàãîìèð";
	guild = GIL_OUT;
	id = 983;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_DragomirsArmbrust_MIS);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Tough_Lee_ähnlich,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_1212;
	aivar[AIV_TheftDex] = 47;
	CreateInvItems(self, ItKe_Chest_Dragomir, 1);
};


func void Rtn_Start_1212()
{
	TA_Stand_ArmsCrossed(8,0,14,6,"NW_TROLLAREA_RUINS_UP_IN");
	TA_Stand_Eating(14,6,15,18,"NW_TROLLAREA_RUINS_UP_IN");
	TA_Stand_ArmsCrossed(15,18,23,0,"NW_TROLLAREA_RUINS_UP_IN");
	TA_Sit_Campfire(23,0,8,0,"NW_TROLLAREA_RUINS_UP_IN");
};

