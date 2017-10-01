
instance KDF_511_Daron(Npc_Default)
{
	name[0] = "Дарон";
	guild = GIL_KDF;
	id = 511;
	voice = 2;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_MagicUser;
	aivar[AIV_StoryFlags] = STORY_OutOfCamp;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Raven,BodyTex_N,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_511;
	aivar[AIV_TheftDex] = 47;
	CreateInvItems(self, ItMi_Gold, 80);
};


func void Rtn_Start_511()
{
	TA_Stand_ArmsCrossed(6,35,13,35,"NW_BIGFARM_TORLOF");
	TA_Stand_Eating(13,35,15,5,"NW_BIGFARM_KITCHEN_03");
	TA_Stand_Guarding(15,5,20,5,"NW_BIGFARM_TORLOF");
	TA_Sit_Throne(20,5,23,45,"NW_BIGFARM_HOUSE_UP1_THRONE");
	TA_Sleep(23,45,6,35,"NW_BIGFARM_HOUSE_UP1_01_BED");
};

