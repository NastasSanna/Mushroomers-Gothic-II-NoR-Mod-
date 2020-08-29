
instance BAU_952_Vino(Npc_Default)
{
	name[0] = "Вино";
	guild = GIL_BAU2;
	id = 952;
	voice = 2;
	flags = 0;
	npcType = npctype_main;
	
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	aivar[AIV_Temper] = TEMPER_NoFightParker;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_N_Weak_Herek,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Drunk_952;
	aivar[AIV_TheftDex] = 34;
};
func void Rtn_Drunk_952()
{
	self.aivar[AIV_MM_Behaviour] = BEHAV_Hidden;
	TA_Stand_Drinking(8,0,22,0,"NW_FARM1_OUT_14");
	TA_Stand_Drinking(22,0,8,0,"NW_FARM1_OUT_14");
};
func void Rtn_Drunk1_952()
{
	self.aivar[AIV_MM_Behaviour] = BEHAV_Hidden;
	TA_Stand_Drinking(8,0,22,0,"NW_FARM1_UP_04");
	TA_Stand_Drinking(22,0,8,0,"NW_FARM1_UP_04");
};
func void Rtn_Drunk2_952()
{
	self.aivar[AIV_MM_Behaviour] = BEHAV_Hidden;
	TA_Stand_Drinking(8,0,22,0,"NW_XARDAS_MONSTER_UP_05");
	TA_Stand_Drinking(22,0,8,0,"NW_XARDAS_MONSTER_UP_05");
};
func void Rtn_Sleep_952()
{
	TA_Sleep_Deep(8,0,22,0,"NW_FARM1_INSTABLE_BED");
	TA_Sleep_Deep(22,0,8,0,"NW_FARM1_INSTABLE_BED");
};
func void Rtn_Start_952()
{
	self.aivar[AIV_MM_Behaviour] = self.aivar[AIV_MM_Behaviour] & ~BEHAV_Hidden;
	self.aivar[AIV_Temper] = self.aivar[AIV_Temper] & ~TEMPER_NoFightParker;
		TA_Sleep			(22,0,8,0,"NW_FARM1_INSTABLE_BED");
		TA_Stand_ArmsCrossed(8,0,9,0,"NW_FARM1_FIELD_08");
		TA_Rake_FP			(9,0,12,0,"NW_FARM1_FIELD_08");
		TA_Stand_Eating		(12,0,13,0,"NW_FARM1_FIELD_09");
		TA_Rake_FP			(13,0,16,0,"NW_FARM1_FIELD_09");
		TA_Stand_ArmsCrossed(16,0,17,0,"NW_FARM1_FIELD_10");
		TA_Rake_FP			(17,0,20,0,"NW_FARM1_FIELD_10");
		TA_Sit_Campfire		(20,0,22,0,"NW_FARM1_MILL_05");
};
