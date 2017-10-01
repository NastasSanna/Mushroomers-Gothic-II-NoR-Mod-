
instance DIA_HelenDream_EXIT(DIA_Proto_End)
{
	npc = PC_HelenDream;
};

//=====================================================
var int DIA_HelenDream_MadPerm_Once;
var int DIA_HelenDream_MadPerm_Time;

instance DIA_HelenDream_MadPerm(C_INFO)
{
	npc = PC_HelenDream;		nr = 2;
	condition = DIA_HelenDream_MadPerm_cond;
	information = DIA_HelenDream_MadPerm_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_HelenDream_MadPerm_cond()
{
	if (!DIA_HelenDream_MadPerm_Once) {
		return TRUE;
	};
	if (!Npc_RefuseTalk(self)) {
		return TRUE;
	};
};
func void DIA_HelenDream_MadPerm_info()
{
	if (!DIA_HelenDream_MadPerm_Once) {
		B_GiveAchievement_SnowStudio();
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_HelenDream);
	};
	DIA_HelenDream_MadPerm_Once += 1;
	if (DIA_HelenDream_MadPerm_Once == 1) {
		AI_Output(self,other,"DIA_HelenDream_MadPerm_1");	 //Привет! Ты новенький? Я тебя раньше здесь не видела.
	}
	else if (DIA_HelenDream_MadPerm_Once == 2) {
		AI_Output(self,other,"DIA_HelenDream_MadPerm_2");	 //Я пройду с тобой немного?
	}
	else if (DIA_HelenDream_MadPerm_Once == 3) {
		AI_Output(self,other,"DIA_HelenDream_MadPerm_3");	 //Скажи, а куда мы идем? Или это будет сюрприз? Ты знаешь, я люблю сюрпризы!
	}
	else  {
		AI_Output(self,other,"DIA_HelenDream_MadPerm_4");	 //Веришь кому-то и в результате попадаешь в неприятности. Так всегда и бывает.
		DIA_HelenDream_MadPerm_Once = 1;
	};
	var int rnd;	rnd = 15 + Hlp_Random(10);
	Npc_SetRefuseTalk(self, rnd);
	AI_StopProcessInfos(self);
};
//=====================================================
instance DIA_HelenDream_WhenAsked(C_INFO)
{
	npc = PC_HelenDream;		nr = 1;
	condition = DIA_WhenAsked_cond;
	information = DIA_HelenDream_WhenAsked_info;
	important = TRUE;
	permanent = TRUE;
};
func void DIA_HelenDream_WhenAsked_info()
{
	AI_Output(self,other,"DIA_HelenDream_WhenAsked");	 //Не обращай на меня внимания.
	Npc_SetRefuseTalk(self, 15 + Hlp_Random(10));
	AI_StopProcessInfos(self);
};
