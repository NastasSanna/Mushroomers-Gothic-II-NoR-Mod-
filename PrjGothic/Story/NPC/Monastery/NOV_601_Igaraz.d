
instance NOV_601_Igaraz(Npc_Default)
{
	name[0] = "Игарац";
	guild = GIL_NOV;
	id = 601;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItKe_IgarazChest_Mis,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Normal_Stone,BodyTex_N,ItAr_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_601;
	aivar[AIV_TheftDex] = 40;
};


func void Rtn_Start_601()
{
	TA_Pray_Innos_FP(8,0,8,30,"NW_MONASTERY_CHURCH_03");
	TA_Stomp_Herb(8,30,22,7,"NW_MONASTERY_WINEMAKER_05");
	TA_Sleep(22,7,8,0,"NW_MONASTERY_NOVICE02_05");
};


