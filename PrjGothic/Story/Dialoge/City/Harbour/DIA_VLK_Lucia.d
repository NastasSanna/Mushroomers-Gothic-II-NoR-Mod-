
instance DIA_Lucia_EXIT(DIA_Proto_End)
{
	npc = VLK_4361_Lucia;
};

//////////////////////////////////САРА////////////////////////////////////////
instance DIA_Lucia_Sarah_Hello(C_INFO)
{
	npc = VLK_4361_Lucia;			nr = 1;
	condition = DIA_Lucia_Sarah_MR_Hello_cond;
	information = DIA_Lucia_Sarah_MR_Hello_info;
	description = "Эй, ты Люсия?";
	permanent = TRUE;
};
func int DIA_Lucia_Sarah_MR_Hello_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && Borka_Sarah_AgreedToTell
		 && !MIS_Sarah_BadHabit_LuciaAsked
	   )	
	{
		return TRUE;
	};
};
func void DIA_Lucia_Sarah_MR_Hello_info()
{
	if ((Npc_GetDistToNpc(self, VLK_435_Nadja) < PERC_DIST_DIALOG) || (Npc_GetDistToNpc(other, VLK_435_Nadja) < PERC_DIST_DIALOG))	{
		AI_PrintScreen(PRINT_NadjaTooClose, -1, -1, FONT_Screen, 3);
		return;
	};
		AI_Output(other,self,"DIA_Lucia_Sarah_MR_Hello_16_00");	//Эй, ты Люсия?
	AI_Output(self,other,"DIA_Lucia_Sarah_MR_Hello_16_01");	//Ну я.
		AI_Output(other,self,"DIA_Lucia_Sarah_MR_Hello_16_02");	//Есть деловое предложение. Я хочу, чтобы Надя бросила курить.
	AI_Output(self,other,"DIA_Lucia_Sarah_MR_Hello_16_03");	//А мне какое дело?
		AI_Output(other,self,"DIA_Lucia_Sarah_MR_Hello_16_04");	//Поспорь с ней, что она не сможет бросить.
		AI_Output(other,self,"DIA_Lucia_Sarah_MR_Hello_16_05");	//Если выиграешь - получишь деньги от нее, если проиграешь - я заплачу тебе вдвое сверх проигрыша.
		AI_Output(other,self,"DIA_Lucia_Sarah_MR_Hello_16_06");	//В любом случае, в накладе не останешься.
	AI_Output(self,other,"DIA_Lucia_Sarah_MR_Hello_16_07");	//Хм, поиздеваться над Надей и мне за это еще и заплатят? Звучит заманчиво.
	AI_Output(self,other,"DIA_Lucia_Sarah_MR_Hello_16_08");	//Но золото у меня есть. Я хочу кое-что другое.
	AI_Output(self,other,"DIA_Lucia_Sarah_MR_Hello_16_09");	//Недавно у Бромора пропал ключ. Одна птичка шепнула мне, что этот ключ спрятан где-то в порту, неподалеку.
	AI_Output(self,other,"DIA_Lucia_Sarah_MR_Hello_16_10");	//Найди его и принеси мне. Это большой стальной ключ, а на рукоятке выцарапана буква Б.
	MIS_Sarah_BadHabit_LuciaAsked = TRUE;
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_AskedLucia);
};
//------------------------------------------------------------
instance DIA_Lucia_Sarah_GiveKey(C_INFO)
{
	npc = VLK_4361_Lucia;			nr = 2;
	condition = DIA_Lucia_Sarah_GiveKey_cond;
	information = DIA_Lucia_Sarah_GiveKey_info;
	description = "Этот ключ?";
	permanent = TRUE;
};
func int DIA_Lucia_Sarah_GiveKey_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_LuciaAsked
		 && Npc_HasItems(other, ItKe_Bromor)
		 && MIS_Sarah_BadHabit_LuciaTalkTime == 0)	{
		return TRUE;
	};
};
func void DIA_Lucia_Sarah_GiveKey_info()
{
	if ((Npc_GetDistToNpc(self, VLK_435_Nadja) < PERC_DIST_DIALOG) || (Npc_GetDistToNpc(other, VLK_435_Nadja) < PERC_DIST_DIALOG))	{
		AI_PrintScreen(PRINT_NadjaTooClose, -1, -1, FONT_Screen, 3);
		return;
	};
		AI_Output(other,self,"DIA_Lucia_Sarah_GiveKey_16_00");	//Этот ключ?
	B_GiveInvItems(other,self,ItKe_Bromor,1);
	AI_Output(self,other,"DIA_Lucia_Sarah_GiveKey_16_01");	//Да, это он. Что ж, уговор есть уговор - я сегодня же пообщаюсь с Надей.
	AI_Output(self,other,"DIA_Lucia_Sarah_GiveKey_16_02");	//Но если она проспорит, это не мои проблемы.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_GiveLuciaKey);
	B_GivePlayerXP(XP_Sarah_Nadja_LuciaTalked);
	if (C_GetHour() < 7)	{
		MIS_Sarah_BadHabit_LuciaTalkTime = (Wld_GetDay() * 24 - 3) * 60; //разговор по расписанию 21:30-21:45
	}
	else {
		MIS_Sarah_BadHabit_LuciaTalkTime = (Wld_GetDay() * 24 + 21) * 60; //разговор по расписанию 21:30-21:45
	};
};

//////////////////////////////////ОСТАЛЬНЫЕ////////////////////////////////////////
instance DIA_Lucia_MR_Perm(C_INFO)
{
	npc = VLK_4361_Lucia;			nr = 10;
	condition = DIA_Lucia_MR_Perm_cond;
	information = DIA_Lucia_MR_Perm_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Lucia_MR_Perm_cond()
{
	if (DIA_WhenAsked_cond()
		 && !(C_HeroIs_Sarah() && (DIA_Lucia_Sarah_GiveKey_cond() == TRUE || DIA_Lucia_Sarah_MR_Hello_cond() == TRUE)) || Npc_KnowsInfo(other,DIA_Lucia_Sarah_GiveKey))
	{
		return TRUE;
	};
};
func void DIA_Lucia_MR_Perm_info()
{
	if (other.aivar[AIV_Gender] == FEMALE)	{
		AI_Output(self,other,"DIA_Lucia_Female_Hello_16_01");	//А ты тут что забыла?
	}
	else if(C_HeroIs_Till())	{
		AI_Output(self,other,"DIA_Lucia_Till_Hello_16_01");	//Мальчик, ты заблудился?
	}
	else	{
		AI_Output(self,other,"DIA_Lucia_Male_Hello_16_01");	//Я занята, милый.
	};
	AI_StopProcessInfos(self);
};

