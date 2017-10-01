
instance OUT_4900_DeadCitizen(Npc_Default)
{
	name[0] = "Труп горожанина";
	guild = GIL_VLK;
	id = 4900;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Vlk_Mace);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Cipher_neu,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,1);
	B_SetFightSkills(self,20);
	start_aistate = ZS_Stand_WP;
	attribute[ATR_HITPOINTS] = 1;
	
	CreateInvItem(self,ItMi_OldCoin);
};