
instance DIA_Canthar_EXIT(DIA_Proto_End)
{
	npc = VLK_468_Canthar;
};


// САРА ==============================================
var int DIA_Canthar_MR_Hello_Sarah_Counter;
instance DIA_Canthar_MR_Hello_Sarah(C_INFO)
{
	nr = 1;
	npc = VLK_468_Canthar;
	condition = DIA_Canthar_MR_Hello_Sarah_cond;
	information = DIA_Canthar_MR_Hello_Sarah_info;
	important = TRUE;
};
func int DIA_Canthar_MR_Hello_Sarah_cond()
{
	if (DIA_WhenAsked_cond() && C_HeroIs_Sarah())	{
		return TRUE;
	};
};
func void DIA_Canthar_MR_Hello_Sarah_info()
{
	DIA_Canthar_MR_Hello_Sarah_Counter += 1;
	AI_Output(self,other,"DIA_Canthar_MR_Hello_Sarah_09_00");	//(с издевкой) Здравствуй, Сара! Неужели хочешь что-то купить?
	AI_Output(other,self,"DIA_Canthar_MR_Hello_Sarah_16_01");	//Нет, пришла полюбоваться на СВОЙ прилавок!
	AI_StopProcessInfos(self);
};
//-----------------------------------------
instance DIA_Canthar_MR_Perm_Sarah(C_INFO)
{
	nr = 2;
	npc = VLK_468_Canthar;
	condition = DIA_Canthar_MR_Perm_Sarah_cond;
	information = DIA_Canthar_MR_Perm_Sarah_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Canthar_MR_Perm_Sarah_cond()
{
	if (DIA_WhenAsked_cond() && C_HeroIs_Sarah()
		&& Npc_KnowsInfo(other,DIA_Canthar_MR_Hello_Sarah))	{
		return TRUE;
	};
};func void DIA_Canthar_MR_Perm_Sarah_info()
{
	DIA_Canthar_MR_Hello_Sarah_Counter += 1;
	B_GiveAchievement_Sarah_Thorn();
	if (Hlp_Random(100) < 50)	{
		AI_Output(self,other,"DIA_Canthar_MR_Perm_Sarah_09_00");	//Проходи, не мешай торговле!
	}
	else	{
		AI_Output(self,other,"DIA_Canthar_MR_Perm_Sarah_09_01");	//Отойди от МОЕГО прилавка!
	};
	AI_StopProcessInfos(self);
};

// РУПЕРТ ==============================================
instance DIA_Canthar_Rupert_MR_Hello(C_INFO)
{
	nr = 10;
	npc = VLK_468_Canthar;
	condition = DIA_Canthar_Rupert_MR_Hello_cond;
	information = DIA_Canthar_Rupert_MR_Hello_info;
	important = TRUE;
};
func int DIA_Canthar_Rupert_MR_Hello_cond()
{
	if (C_HeroIs_Rupert())	{
		return TRUE;
	};
};
func void DIA_Canthar_Rupert_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Canthar_Rupert_MR_Hello_09_00");	//Ей! Ты не забыл, что должен мне 150 золотых?
	AI_Output(self,other,"DIA_Canthar_Rupert_MR_Hello_09_01");	//Твое время истекает. Если не вернешь долг в течение недели, ты об этом сильно пожалеешь.
	B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Canthar_Sum);
	Info_ClearChoices(DIA_Canthar_MR_Hello);
	Info_AddChoice(DIA_Canthar_MR_Hello, "(спокойно) Это угроза?",DIA_Canthar_MR_Hello_Rupert_Threat);
	Info_AddChoice(DIA_Canthar_MR_Hello, "(с вызовом) И что мне тогда будет?",DIA_Canthar_MR_Hello_Rupert_OrWhat);
	Info_AddChoice(DIA_Canthar_MR_Hello, "(миролюбиво) Не волнуйся, я скоро верну деньги.",DIA_Canthar_MR_Hello_Rupert_OK);
};
func void DIA_Canthar_MR_Hello_Rupert_OK()
{
	AI_Output(other,self,"DIA_Canthar_MR_Hello_Rupert_OK_03_00");	//(миролюбиво) Не волнуйся, я скоро верну деньги.
		AI_Output(self,other,"DIA_Canthar_MR_Hello_Rupert_OK_09_01");	//(скептически) Очень надеюсь на это. 
	Info_ClearChoices(DIA_Canthar_MR_Hello);
};
func void DIA_Canthar_MR_Hello_Rupert_OrWhat()
{
	AI_Output(other,self,"DIA_Canthar_MR_Hello_Rupert_OrWhat_03_00");	//(с вызовом) И что мне тогда будет?
		AI_Output(self,other,"DIA_Canthar_MR_Hello_Rupert_OrWhat_09_01");	//(ядовито) Ничего, что тебе бы понравилось! 
	Info_ClearChoices(DIA_Canthar_MR_Hello);
};
func void DIA_Canthar_MR_Hello_Rupert_Threat()
{
	AI_Output(other,self,"DIA_Canthar_MR_Hello_Rupert_Threat_03_00");	//(спокойно) Это угроза?
		AI_Output(self,other,"DIA_Canthar_MR_Hello_Rupert_Threat_09_01");	//Дружеское предупреждение. Пока. 
	Info_ClearChoices(DIA_Canthar_MR_Hello);
};

// ==============================================
instance DIA_Canthar_Rupert_Debt(C_INFO)
{
	nr = 11;
	npc = VLK_468_Canthar;
	condition = DIA_Canthar_Rupert_Debt_cond;
	information = DIA_Canthar_Rupert_Debt_info;
	description = "Я хочу вернуть долг (150 зол.).";
	permanent = TRUE;
};
func int DIA_Canthar_Rupert_Debt_cond()
{
	if (C_HeroIs_Rupert() && !MIS_Rupert_Debts_Paid[Creditor_Canthar])	{
		return TRUE;
	};
};
func void DIA_Canthar_Rupert_Debt_info()
{
	AI_Output(other,self,"DIA_Canthar_Rupert_Debt_03_00");	//Я хочу вернуть долг.
	if (C_NpcHasGold(other,150))	{
		AI_Output(self,other,"DIA_Canthar_Rupert_Debt_01_01");	//Мудро. Долги нужно возвращать в срок.
		AI_Output(self,other,"DIA_Canthar_Rupert_Debt_01_02");	//Хочешь что-нибудь купить?
		B_GiveInvItems(other,self,ItMi_Gold,150);
		B_RupertPayDebt(Creditor_Canthar);
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Canthar);
	}
	else	{
		AI_Output(self,other,"DIA_Canthar_Rupert_Debt_01_03");	//Тогда тебе лучше поторопиться и принести мне 150 золотых!
	};
};


// ОСТАЛЬНЫЕ ==============================================
instance DIA_Canthar_MR_Hello(C_INFO)
{
	nr = 50;
	npc = VLK_468_Canthar;
	condition = DIA_Canthar_MR_Hello_cond;
	information = DIA_Canthar_MR_Hello_info;
	important = TRUE;
};
func int DIA_Canthar_MR_Hello_cond()
{
	if (!C_HeroIs_Sarah() && !C_HeroIs_Rupert()
		&& (DIA_WhenAsked_cond() || Wld_IsTime(7,50,20,0)))	{
		return TRUE;
	};
};
func void DIA_Canthar_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Canthar_MR_Hello_09_00");	//Прошу, выбирай! У меня лучший ассортимент оружия и самые низкие цены на этой площади!
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Canthar);
};


// ТОРГОВЛЯ ==============================================
instance DIA_Canthar_Trade(C_INFO)
{
	nr = 51;
	npc = VLK_468_Canthar;
	condition = DIA_Canthar_Trade_cond;
	information = DIA_Canthar_Trade_info;
	description = "Покажи свои товары.";
	trade = TRUE;
	permanent = TRUE;
};
func int DIA_Canthar_Trade_cond()
{
	if (!C_HeroIs_Rupert() || MIS_Rupert_Debts_Paid[Creditor_Canthar])	{
		return TRUE;
	};
};
func void DIA_Canthar_Trade_info()
{
	B_GiveTradeInv_Canthar(self);
};
