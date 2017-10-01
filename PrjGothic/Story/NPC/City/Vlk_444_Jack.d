
instance VLK_444_Jack(Npc_Default)
{
	name[0] = "Джек";
	guild = GIL_OUT;
	id = 444;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_ImportantOld,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_444;
	aivar[AIV_TheftDex] = 50;
	CreateInvItems(self, ItMi_Gold, 100);
};


func void Rtn_Start_444()
{
	TA_Sit_Throne(8,0,20,0,"NW_LIGHTHOUSE_IN_03");
	TA_Sleep(20,0,8,0,"NW_LIGHTHOUSE_IN_03");
};
