

instance DIA_Agon_EXIT(DIA_Proto_End)
{
	npc = NOV_603_Agon;
};

/////////////////////////////////////// ОДО /////////////////////////////////////////////

//===================================================
instance DIA_Agon_NoTalk_Odo(C_Info)
{
	npc = NOV_603_Agon;
	nr = 0;
	condition = DIA_Agon_NoTalk_Odo_Cond;
	information = DIA_Agon_NoTalk_Odo_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Agon_NoTalk_Odo_Cond()
{
	if (C_HeroIs_Odo() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Agon_NoTalk_Odo_Info()
{
	AI_Output(self,other,"DIA_Agon_NoTalk_Odo_07_00");	//(холодно) Мне не о чем с тобой разговаривать.
	AI_StopProcessInfos(self);
};

