
instance DIA_Sonja_EXIT(DIA_Proto_End)
{
	npc = VLK_436_Sonja;
};

//////////////////////////////////САРА////////////////////////////////////////
instance DIA_Sonja_Sarah_Hello(C_INFO)
{
	npc = VLK_436_Sonja;			nr = 1;
	condition = DIA_Sonja_Sarah_MR_Hello_cond;
	information = DIA_Sonja_Sarah_MR_Hello_info;
	description = "Ты Люсия?";
};
func int DIA_Sonja_Sarah_MR_Hello_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_MoeTalked)	{
		return TRUE;
	};
};
func void DIA_Sonja_Sarah_MR_Hello_info()
{
		AI_Output(other,self,"DIA_Sonja_Sarah_MR_Hello_16_00");	//Ты Люсия?
	AI_Output(self,other,"DIA_Sonja_Sarah_MR_Hello_16_01");	//Не смей путать меня с этой рыжей сучкой.
};

//////////////////////////////////ВСЕ////////////////////////////////////////
instance DIA_Sonja_MR_Perm(C_INFO)
{
	npc = VLK_436_Sonja;			nr = 10;
	condition = DIA_Sonja_MR_Perm_cond;
	information = DIA_Sonja_MR_Perm_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Sonja_MR_Perm_cond()
{
	if (DIA_WhenAsked_cond() && ((DIA_Sonja_Sarah_MR_Hello_cond() != TRUE) || Npc_KnowsInfo(other,DIA_Sonja_Sarah_Hello)))	{
		return TRUE;
	};
};
func void DIA_Sonja_MR_Perm_info()
{
	if (other.aivar[AIV_Gender] == FEMALE)	{
		AI_Output(self,other,"DIA_Sonja_Female_Hello_16_01");	//Мне не о чем говорить с тобой.
	}
	else if(C_HeroIs_Till())	{
		AI_Output(self,other,"DIA_Sonja_Till_Hello_16_01");	//Детям тут делать нечего. Иди домой, баиньки.
	}
	else	{
		AI_Output(self,other,"DIA_Sonja_Male_Hello_16_01");	//Если ты ищешь удовольствия, то сначала поговори с Бромором.
	};
	AI_StopProcessInfos(self);
};

