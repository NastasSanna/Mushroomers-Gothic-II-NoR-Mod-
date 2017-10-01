
instance DIA_Jora_EXIT(DIA_Proto_End)
{
	npc = VLK_408_Jora;
};

// ==============================================

instance DIA_Jora_Hello(C_INFO)
{
	nr = 0;
	npc = VLK_408_Jora;
	condition = DIA_WhenAsked_cond;
	information = DIA_Jora_MR_Hello_info;
	important = TRUE;
};
func void DIA_Jora_MR_Hello_info()
{
	if (C_HeroIs_Elena())	{
		AI_Output(self,other,"DIA_Jora_MR_Hello_08_00");	//Елена, добрый день! Мне пока больше ничего не нужно, я еще прошлую партию не распродал.
		AI_Output(other,self,"DIA_Jora_MR_Hello_13_01");	//Я к тебе как покупатель.
	}
	else	if (C_HeroIs_Rupert())	{
		AI_Output(self,other,"DIA_Jora_MR_Hello_08_02");	//Ты! Я больше ничего не дам тебе в долг!
		AI_Output(self,other,"DIA_Jora_MR_Hello_08_03");	//Верни сначала 55 золотых, которые ты уже задолжал.
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Jora_Sum);
	}
	else	{
		AI_Output(self,other,"DIA_Jora_MR_Hello_08_04");	//Свежие продукты! Полезные мелочи!
	};
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Jora);
};
// ==============================================
instance DIA_Jora_Debt_Rupert(C_INFO)
{
	nr = 1;
	npc = VLK_408_Jora;
	condition = DIA_Jora_Debt_Rupert_cond;
	information = DIA_Jora_Debt_Rupert_info;
	description = "Я пришел вернуть тебе деньги (55 зол.).";
	permanent = TRUE;
};
func int DIA_Jora_Debt_Rupert_cond()
{
	if (C_HeroIs_Rupert() && !MIS_Rupert_Debts_Paid[Creditor_Jora])	{
		return TRUE;
	};
};
func void DIA_Jora_Debt_Rupert_info()
{
	AI_Output(other,self,"DIA_Jora_Debt_Rupert_03_00");	//Я пришел вернуть тебе деньги.
	if (C_NpcHasGold(other,55))	{
		AI_Output(self,other,"DIA_Jora_Debt_Rupert_08_01");	//Да неужели? А я уж и не надеялся их получить.
		B_GiveInvItems(other,self,ItMi_Gold,55);
		B_RupertPayDebt(Creditor_Jora);
	}
	else	{
		AI_Output(self,other,"DIA_Jora_Debt_Rupert_08_02");	//И где они?
	};
};
// ТОРГОВЛЯ ==============================================
instance DIA_Jora_Trade(C_INFO)
{
	nr = 50;
	npc = VLK_408_Jora;
	condition = DIA_Jora_Trade_cond;
	information = DIA_Jora_Trade_info;
	description = "Покажи, что у тебя есть.";
	trade = TRUE;
	permanent = TRUE;
};
func int DIA_Jora_Trade_cond()
{
	if (!C_HeroIs_Rupert() || MIS_Rupert_Debts_Paid[Creditor_Jora])	{
		return TRUE;
	};
};
func void DIA_Jora_Trade_info()
{
	B_GiveTradeInv_Jora(self);
};
