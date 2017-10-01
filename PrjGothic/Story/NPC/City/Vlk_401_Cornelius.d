
instance VLK_401_Cornelius(Npc_Default)
{
	name[0] = "Корнелиус";
	guild = GIL_NONE;
	id = 401;
	voice = 8;//13;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Weak_Ulf_Wohlers,BodyTex_P,ITAR_Governor);
	Mdl_SetModelFatness(self,0.9);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_401;
	aivar[AIV_TheftDex] = 60;
};


func void Rtn_Start_401()
{
	TA_Read_Bookstand(8,0,15,7,"NW_CITY_ALBRECHT");
	TA_Smalltalk(15,7,17,30,"NW_CITYHALL_UPSTAIRS_01");
	TA_Sit_Throne(17,30,22,30,"NW_CITYHALL_PRIVATE_THRONE");
	TA_Sleep(22,30,8,0,"NW_CITY_LARIUS_BED");
};


