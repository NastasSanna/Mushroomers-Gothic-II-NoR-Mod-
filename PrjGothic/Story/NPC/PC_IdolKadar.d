
instance PC_IdolKadar(Npc_Default)
{
	name[0] = "Идол Кадар";
	guild = GIL_NONE;	
	id = 1631;
	voice = 1;
	npcType = npctype_main;
	
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_IdolKadar,BodyTex_N,ITAR_Dementor);
	CreateInvItem(self,ItMW_Addon_Stab02);
	
	B_SetAttributesToChapter(self, 6);
	B_SetFightSkills(self,70);
	fight_tactic = FAI_HUMAN_MASTER;
	
	aivar[AIV_IgnoreFlags] = -1;
	aivar[AIV_Behaviour] = BEHAV_NeverRansack | BEHAV_Invisible;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride | TEMPER_NoFightParker;

	daily_routine = Rtn_Start_1631;
};

func void Rtn_Start_1631()
{
	TA_Stand_Dementor(8,0,12,0,"NW_TO_PASS_03");
	TA_Stand_Dementor(22,0,8,0,"NW_TO_PASS_03");
};

func void Rtn_Rest_1631()
{
	TA_Stand_ArmsCrossed(8,0,11,0,"NW_PASS_GATEGUARD_01");
	TA_Smoke_Joint(11,0,13,0,"NW_PASS_GATEGUARD_01");
	TA_Stand_ArmsCrossed(13,0,15,0,"NW_PASS_GATEGUARD_01");
	TA_Smoke_Joint(15,0,17,0,"NW_PASS_GATEGUARD_01");
	TA_Stand_ArmsCrossed(17,0,19,0,"NW_PASS_GATEGUARD_01");
	TA_Smoke_Joint(19,0,23,0,"NW_PASS_GATEGUARD_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_PASS_GATEGUARD_01");
};
