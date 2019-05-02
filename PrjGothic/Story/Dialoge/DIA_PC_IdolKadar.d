
instance DIA_IdolKadar_EXIT(DIA_Proto_End)
{
	npc = PC_IdolKadar;
};

//=====================================================
var int DIA_IdolKadar_Hallo_Once;
instance DIA_IdolKadar_Hallo(C_INFO)
{
	npc = PC_IdolKadar;		nr = 1;
	condition = DIA_WhenAsked_cond;
	information = DIA_IdolKadar_Hallo_info;
	important = TRUE;
	permanent = TRUE;
};
func void DIA_IdolKadar_Hallo_info()
{
	AI_Output(self,other,"DIA_IdolKadar_Hallo");	 //Смертный! Запомни: чтобы найти грибы, ты должен действовать как гриб, ты должен думать как гриб, ты должен СТАТЬ грибом! Теперь ступай!
	if (!DIA_IdolKadar_Hallo_Once) {
		DIA_IdolKadar_Hallo_Once = TRUE;
		CreateInvItem(self, ItAr_Guru_M);
		AI_EquipArmor(self, ItAr_Guru_M);
		B_GiveAchievement_SnowStudio();
		B_StartOtherRoutine(self, "REST");
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_IdolKadar);
	};
	DIA_IdolKadar_Hallo.important = FALSE;
	AI_StopProcessInfos(self);
};

