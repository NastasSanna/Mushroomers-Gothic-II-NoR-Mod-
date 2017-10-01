
instance KDF_507_Talamon(Npc_Default)
{
	name[0] = "Таламон";
	guild = GIL_KDF;
	id = 507;
	voice = 9;//12;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	CreateInvItem(self,ItMi_Pliers);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Saturas,BodyTex_B,ItAr_KDF_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_507;
	aivar[AIV_TheftDex] = 87;
	CreateInvItems(self, ItMi_Gold, 140);
};


func void Rtn_Start_507()
{
	TA_Guard_Passage(8,0,23,0,"NW_MONASTERY_CELLAR_15");
	TA_Guard_Passage(23,0,8,0,"NW_MONASTERY_CELLAR_15");
};

