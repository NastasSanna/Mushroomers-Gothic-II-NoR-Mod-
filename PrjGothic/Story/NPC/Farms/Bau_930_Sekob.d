// DONE
instance BAU_930_Sekob(Npc_Default)
{
	name[0] = "Секоб";
	name[1] = "Отец";	//Тилл
	guild = GIL_BAU;
	id = 930;
	voice = 2;
	npcType = npctype_main;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	aivar[AIV_IgnoreFlags] = IGNORE_PortalRoom_Public;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_P_OldMan_Gravo,BodyTex_P,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_930;
	aivar[AIV_TheftDex] = 75;
	CreateInvItems(self, ItMi_Gold, 230);
};


func void Rtn_Start_930()
{
	TA_Sit_Throne(8,0,22,0,"NW_FARM4_SEKOB");
	TA_Sleep(22,0,8,0,"NW_FARM4_IN_BED_01");
};

