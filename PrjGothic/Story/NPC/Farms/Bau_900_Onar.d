
instance Bau_900_Onar(Npc_Default)
{
	name[0] = "Онар";
	name[1] = "Отец";	//Елена
	guild = GIL_BAU;
	id = 900;
	voice = 24; //14;
	npcType = npctype_main;
	flags = NPC_FLAG_IMMORTAL;
	aivar[AIV_IgnoreFlags] = IGNORE_PortalRoom_Public | IGNORE_Murder | IGNORE_Theft | IGNORE_Sheepkiller;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_OldBald_Jeremiah,BodyTex_N,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_900;
};


func void Rtn_PreStart_900()
{
	TA_Stand_WP(9,0,21,0,"NW_BIGFARM_HOUSE_02");
	TA_Stand_WP(21,0,9,0,"NW_BIGFARM_HOUSE_02");
};
func void Rtn_Start_900()
{
	TA_Sit_Throne(9,0,10,0,"NW_BIGFARM_HOUSE_ONAR_SIT");
	TA_Smalltalk(10,0,12,0,"NW_BIGFARM_HOUSE_18");
	TA_Sit_Throne(12,0,21,0,"NW_BIGFARM_HOUSE_ONAR_SIT");
	TA_Sleep(21,0,9,0,"NW_BIGFARM_HOUSE_UP1_04");
};
func void Rtn_COURT_900()
{
	TA_Sit_Throne(9,0,21,0,"NW_BIGFARM_HOUSE_02");
	TA_Sit_Throne(21,0,9,0,"NW_BIGFARM_HOUSE_02");
};

instance Bau_9001_Onar_Young(Npc_Default)
{
	name[0] = "Онар";
	guild = GIL_BAU;
	id = 9001;
	voice = 24; //14;
	npcType = npctype_main;
	aivar[AIV_IgnoreFlags] = IGNORE_PortalRoom_Public;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_P_NormalBart_Riordian,BodyTex_P,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
};
