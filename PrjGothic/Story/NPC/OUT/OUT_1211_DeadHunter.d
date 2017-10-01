
instance OUT_1211_DeadHunter(Npc_Default)
{
	name[0] = "Мертвый охотник";
	guild = GIL_OUT;
	id = 1211;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItAt_Addon_KeilerFur,3);
	CreateInvItems(self,ItAt_Teeth,1);
	CreateInvItems(self,ItAt_Claw,1);
	CreateInvItems(self,ItFoMutton,2);
	CreateInvItems(self,ItPl_Health_Herb_02,2);
	CreateInvItems(self,ItPl_Forestberry,8);
	CreateInvItems(self,ItMi_Gold,20+Hlp_Random(5)*10);
	CreateInvItems(self,ItMi_OldCoin,1);
	CreateInvItems(self,ItRw_Arrow,22);
	attribute[ATR_HITPOINTS] = 0;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Ratford,BodyTex_L,ITAR_Leather_L);
	Mdl_SetModelFatness(self,1);
	B_SetFightSkills(self,70);
	start_aistate = ZS_Stand_WP;
};

instance OUT_1212_DeadHunter(Npc_Default)
{
	name[0] = "Мертвый охотник";
	guild = GIL_OUT;
	id = 1212;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	CreateInvItems(self,ItAt_Addon_KeilerFur,5);
	CreateInvItems(self,ItAt_Wing,2);
	CreateInvItems(self,ItFoMutton,1);
	CreateInvItems(self,ItFoMuttonRaw,1);
	CreateInvItems(self,ItFo_Water,1);
	CreateInvItems(self,ItRw_Arrow,17);
	CreateInvItems(self,ItMi_Gold,10+Hlp_Random(3)*10);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_B_Normal_Sharky,BodyTex_B,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	B_SetFightSkills(self,70);
	start_aistate = ZS_Stand_WP;
};

