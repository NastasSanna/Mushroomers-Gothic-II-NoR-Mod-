
instance DIA_Himera_EXIT(DIA_Proto_End)
{
	npc = PC_Himera;
};

//=====================================================
var int DIA_Himera_Hallo_Once;
instance DIA_Himera_Hallo(C_INFO)
{
	npc = PC_Himera;		nr = 1;
	condition = DIA_WhenAsked_cond;
	information = DIA_Himera_Hallo_info;
	important = TRUE;
	permanent = TRUE;
};
func void DIA_Himera_Hallo_info()
{
	AI_Output(self,other,"DIA_Himera_Gryby");	 //Грыбы, грыбы! Давай, грыбы отсюда подобру-поздорову... Давай-давай, грыбы, давай, отсюда, давай. Давай, давай, быстрей давай. Иди грыбы, грыбы давай.
	if (!DIA_Himera_Hallo_Once) {
		DIA_Himera_Hallo_Once = TRUE;
		B_GiveAchievement_SnowStudio();
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_Himera);
	};
	AI_StopProcessInfos(self);
};

