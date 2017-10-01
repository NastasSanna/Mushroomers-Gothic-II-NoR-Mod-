
instance OUT_1201_OldShepherd(Npc_Default)
{
	name[0] = "Старый пастух";
	guild = GIL_OUT;
	id = 1201;
	voice = 9;//12;
	flags = 0;
	npcType = npctype_main;
	
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetFightSkills(self,80);
	B_GiveNpcTalents(self);
	EquipItem(self,ItMw_1h_Vlk_Axe);
	
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_P_OldMan_Gravo,BodyTex_P,ITAR_Bau_L);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	
	aivar[AIV_TheftDex] = 85;
	CreateInvItems(self, ItFo_Cheese, 5);
	CreateInvItems(self, ItFo_Milk, 2);
	
	daily_routine = Rtn_Start_1201;
};


func void Rtn_Start_1201()
{
	TA_Stand_ArmsCrossed	(5,0,7,0,"NW_SHEPHERD_01");
	TA_Smalltalk			(7,0,7,30,"NW_FARM2_TO_SHEPHERD_03");
	TA_Sit_Chair			(7,30,8,0,"NW_SHEPARD_HOUSE_03");
	TA_Stand_Sweeping		(8,0,8,20,"NW_SHEPARD_HOUSE_03");
	TA_Stand_Sweeping		(8,20,8,40,"NW_SHEPARD_HOUSE_02");
	TA_Stand_Sweeping		(8,40,9,0,"NW_SHEPARD_HOUSE_01");
	TA_Stand_ArmsCrossed	(9,0,10,0,"NW_SHEPHERD_01");
	TA_Stand_ArmsCrossed	(10,0,11,0,"NW_SHEPHERD_04");
	TA_Stand_ArmsCrossed	(11,0,12,0,"NW_SHEPHERD_01");
	TA_Stand_WP				(12,0,13,0,"NW_SHEPHERD_ENTER_03");
	TA_Sit_Chair			(13,0,14,0,"NW_SHEPARD_HOUSE_03");
	TA_Sit_Bench			(14,0,18,0,"NW_SHEPHERD_BENCH_02");
	TA_Stand_Guarding		(18,0,19,0,"NW_SHEPHERD_ENTER_03");
	TA_Sit_Chair			(19,0,20,0,"NW_SHEPARD_HOUSE_03");
	TA_Sit_Bench			(19,0,21,0,"NW_SHEPHERD_ENTER_03");
	TA_Sleep				(22,0,5,0,"NW_SHEPHERD_BED_02");
};

