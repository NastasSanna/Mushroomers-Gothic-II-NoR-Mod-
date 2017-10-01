
instance DIA_Dennis_EXIT(DIA_Proto_End)
{
	npc = PC_Dennis;
};

//=====================================================
var int DIA_Dennis_Hallo_Once;
instance DIA_Dennis_Hallo(C_INFO)
{
	npc = PC_Dennis;		nr = 1;
	condition = DIA_WhenAsked_cond;
	information = DIA_Dennis_Hallo_info;
	important = TRUE;
	permanent = TRUE;
};
func void DIA_Dennis_Hallo_info()
{
	AI_Output(self,other,"DIA_Dennis_Hallo");	 //Привет!
	if (!DIA_Dennis_Hallo_Once) {
		DIA_Dennis_Hallo_Once = TRUE;
		B_GiveAchievement_SnowStudio();
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_DenisSeregin);
	};
	AI_StopProcessInfos(self);
};

