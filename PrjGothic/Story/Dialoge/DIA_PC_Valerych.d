
instance DIA_Valerych_EXIT(DIA_Proto_End)
{
	npc = PC_Valerych;
};

//=====================================================
var int DIA_Valerych_Hallo_Once;
instance DIA_Valerych_Hallo(C_INFO)
{
	npc = PC_Valerych;		nr = 1;
	condition = DIA_WhenAsked_cond;
	information = DIA_Valerych_Hallo_info;
	important = TRUE;
	permanent = TRUE;
};
func void DIA_Valerych_Hallo_info()
{
	AI_Output(self,other,"DIA_Mortis_MR_Perm_13_00");	//Найди кого-нибудь другого, кого ты сможешь доставать своими вопросами.
	if (!DIA_Valerych_Hallo_Once) {
		DIA_Valerych_Hallo_Once = TRUE;
		B_GiveAchievement_SnowStudio();
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_Valerych);
	};
	AI_StopProcessInfos(self);
};

