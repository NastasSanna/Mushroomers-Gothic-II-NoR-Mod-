
instance OUT_1220_Niclas(Npc_Default)
{
	name[0] = "Никлас";
	guild = GIL_OUT;
	id = 984;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_Sword_L_03);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_NormalBart12,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_1220;
	aivar[AIV_TheftDex] = 27;
};


func void Rtn_Start_1220()
{
	TA_Stand_Eating	(6, 0,7,4,"NW_FOREST_CAVE1_02");
	TA_Stand_Guarding	(7, 4,9,7,"NW_FOREST_CAVE1_02");
	TA_Sit_Campfire	(9, 7,14,30,"NW_FOREST_CAVE1_IN_04");
	TA_Stand_Eating	(14, 30,15,25,"NW_FOREST_CAVE1_IN_05");
	TA_Sit_Campfire	(15, 25,19,5,"NW_FOREST_CAVE1_IN_04");
	TA_Stand_Eating	(19, 5,20,15,"NW_FOREST_CAVE1_IN_05");
	TA_Sit_Campfire	(20, 15,22,30,"NW_FOREST_CAVE1_IN_04");
	TA_Sleep	(22,30, 6, 0,"NW_FOREST_CAVE1_IN_06");
};

