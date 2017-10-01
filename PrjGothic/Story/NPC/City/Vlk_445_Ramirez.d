
instance VLK_445_Ramirez(Npc_Default)
{
	name[0] = "Рамирез";
	guild = GIL_BDT;
	id = 445;
	voice = 8;//14;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
//	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Meisterdegen);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Tough_Okyl,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_445;
	aivar[AIV_TheftDex] = 90;
	CreateInvItems(self, ItMi_Gold, 300);
};


func void Rtn_Start_445()
{
	TA_Stand_WP(8,0,23,0,"WP_CITY_THIEF_ISLE_02");
	TA_Stand_WP(23,0,8,0,"WP_CITY_THIEF_ISLE_02");
};

