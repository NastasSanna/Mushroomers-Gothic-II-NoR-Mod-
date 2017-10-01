
instance VLK_433_Bromor(Npc_Default)
{
	name[0] = "Бромор";
	guild = GIL_VLK;
	id = 433;
	voice = 22;//7;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_IgnoreFlags] = IGNORE_Drunk;
	aivar[AIV_Temper] = TEMPER_ToughGuy;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Fingers,BodyTex_N,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,45);
	daily_routine = Rtn_Start_433;
	aivar[AIV_TheftDex] = 50;
};


func void Rtn_Start_433()
{
	TA_Sleep(11,5,14,55,"NW_CITY_BED_BROMOR");
	TA_Stand_ArmsCrossed(14,55,11,5,"NW_CITY_PUFF_COUNTER");
};
func void Rtn_TOT_433()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};

