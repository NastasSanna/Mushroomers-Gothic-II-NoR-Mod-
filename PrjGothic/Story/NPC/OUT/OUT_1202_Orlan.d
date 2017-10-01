
instance OUT_1202_Orlan(Npc_Default)
{
	name[0] = "Орлан";
	guild = GIL_NONE;
	id = 1202;
	voice = 24;//5;
	aivar[AIV_IgnoreFlags] = IGNORE_PortalRoom_Public | IGNORE_Drunk;
	npcType = npctype_main;
//	aivar[AIV_StoryFlags] = STORY_Ranger;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_B_Normal_Sharky,BodyTex_B,ITAR_Bau_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_1202;
	aivar[AIV_TheftDex] = 89;
	CreateInvItems(self, ItMi_Gold, 360);
};


func void Rtn_preStart_1202()
{
	TA_Stand_WP		(8,0,22,0,"NW_TAVERNE_IN_04");
	TA_Stand_WP		(22,0,8,0,"NW_TAVERNE_IN_04");
};
func void Rtn_Start_1202()
{
	TA_Smalltalk	(7,0,7,30,"NW_FARM2_TO_SHEPHERD_03");
	TA_Stand_WP		(7,30,20,0,"NW_TAVERNE_IN_04");
	TA_Stand_Sweeping(20,0,20,30,"NW_TAVERNE_IN_01");
	TA_Stand_Sweeping(20,30,21,0,"NW_TAVERNE_IN_06");
	TA_Stand_WP		(21,0,7,30,"NW_TAVERNE_IN_04");
};


