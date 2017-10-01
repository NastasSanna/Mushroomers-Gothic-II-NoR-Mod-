
instance DIA_Lehmar_EXIT(DIA_Proto_End)
{
	npc = VLK_484_Lehmar;
};


/////////////////////////////////////// РУПЕРТ //////////////////////////////////////////////
// ==============================================
instance DIA_Lehmar_Rupert_Hello(C_INFO)
{
	nr = 1;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Rupert_MR_Hello_cond;
	information = DIA_Lehmar_Rupert_MR_Hello_info;
	important = TRUE;
};
func int DIA_Lehmar_Rupert_MR_Hello_cond()
{
	if (C_HeroIs_Rupert() && !MIS_Rupert_Debts_Paid[Creditor_Lehmar])	{
		return TRUE;
	};
};
func void DIA_Lehmar_Rupert_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_09_00");	//Явился-таки? 
		AI_Output(other,self,"DIA_Lehmar_Rupert_MR_Hello_03_01");	//Я...
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_09_02");	//(перебивает) Ты должен мне 500 золотых.
	B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Lehmar_Sum);
		AI_Output(other,self,"DIA_Lehmar_Rupert_MR_Hello_03_03");	//Пятьсот?! Но я же брал в долг сотню!
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_09_04");	//Больше двух недель назад!
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_09_05");	//Я тут не занимаюсь благотворительностью. Проценты нарастают с каждым днем. А мое терпение иссякает.
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_09_06");	//Так ты собираешься платить?
	Info_ClearChoices(DIA_Lehmar_Rupert_Hello);
	if (MIS_Rupert_Debts_Lehmar_Sword == MIS_Rupert_Debts_Lehmar_SwordKnown)	{
		Info_AddChoice(DIA_Lehmar_Rupert_Hello,"Я слышал, тебе нужен меч из магической руды.",DIA_Lehmar_Rupert_AskSword_info);
	}
	else	{
		Info_AddChoice(DIA_Lehmar_Rupert_Hello,"Может, я могу как-нибудь отработать долг?",DIA_Lehmar_Rupert_MR_Hello_AskRelief);
	};
	Info_AddChoice(DIA_Lehmar_Rupert_Hello,"Пожалуйста, дай мне еще несколько дней!",DIA_Lehmar_Rupert_MR_Hello_NoPay);
	if (C_NpcHasGold(other,500))	{
		Info_AddChoice(DIA_Lehmar_Rupert_Hello,"Вот деньги. (500 зол.)",DIA_Lehmar_Rupert_MR_Hello_Pay);
	};
	MIS_Rupert_Debts_Lehmar_Day = Wld_GetDay() + 3;
};
func void DIA_Lehmar_Rupert_MR_Hello_Pay()
{
		AI_Output(other,self,"DIA_Lehmar_Rupert_MR_Hello_Pay_03_00");	//Вот деньги.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	B_RupertPayDebt(Creditor_Lehmar);
	Info_ClearChoices(DIA_Lehmar_Rupert_Hello);
};
func void DIA_Lehmar_Rupert_MR_Hello_NoPay()
{
		AI_Output(other,self,"DIA_Lehmar_Rupert_MR_Hello_NoPay_03_00");	//Пожалуйста, дай мне еще несколько дней! Я принесу деньги, клянусь!
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_NoPay_09_01");	//Мне нужны деньги, а не твои клятвы!
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_NoPay_09_02");	//(размышляет)
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_NoPay_09_03");	//Ну, хорошо. Я даю тебе еще три дня. Под 20 процентов в день. Это 100 золотых за каждый день, если ты не умеешь считать.
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_NoPay_09_04");	//И помни - это последняя отсрочка! Если через три дня я не получу денег, придется принять меры.
	B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Lehmar_Percent);
	Info_ClearChoices(DIA_Lehmar_Rupert_Hello);
};
func void DIA_Lehmar_Rupert_MR_Hello_AskRelief()
{
		AI_Output(other,self,"DIA_Lehmar_Rupert_MR_Hello_AskRelief_03_00");	//Может, я могу как-нибудь отработать долг?
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_AskRelief_09_01");	//Нет. У меня нет ничего, с чем бы справился такой бездарь, как ты.
};

// ----------------------------------------------
instance DIA_Lehmar_Rupert_AskSword(C_INFO)
{
	nr = 2;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Rupert_AskSword_cond;
	information = DIA_Lehmar_Rupert_AskSword_info;
	description = "Я слышал, тебе нужен меч из магической руды.";
};
func int DIA_Lehmar_Rupert_AskSword_cond()
{
	if (C_HeroIs_Rupert() && (MIS_Rupert_Debts_Lehmar_Sword == MIS_Rupert_Debts_Lehmar_SwordKnown)
		&& !MIS_Rupert_Debts_Paid[Creditor_Lehmar])	{
		return TRUE;
	};
};
func void DIA_Lehmar_Rupert_AskSword_info()
{
		AI_Output(other,self,"DIA_Lehmar_Rupert_AskSword_03_00");	//Я слышал, тебе нужен меч из магической руды. Что, если я достану тебе такой?
	AI_Output(self,other,"DIA_Lehmar_Rupert_AskSword_09_01");	//Ты?! Меч из руды? Хотя... почему бы и нет.
	AI_Output(self,other,"DIA_Lehmar_Rupert_AskSword_09_02");	//Договоримся так - если ты добудешь такой меч, то я прощу тебе все проценты. Ты снова будешь должен мне только сотню.
	B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Lehmar_Told);
	MIS_Rupert_Debts_Lehmar_Sword = MIS_Rupert_Debts_Lehmar_SwordTold;
	Info_ClearChoices(DIA_Lehmar_Rupert_Hello);
};

// ----------------------------------------------
instance DIA_Lehmar_Rupert_GiveMoney(C_INFO)
{
	nr = 3;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Rupert_GiveMoney_cond;
	information = DIA_Lehmar_Rupert_GiveMoney_info;
	description = "Я пришел вернуть долг.";
	permanent = TRUE;
};
func int DIA_Lehmar_Rupert_GiveMoney_cond()
{
	//сколько?
	if (MIS_Rupert_Debts_Lehmar_Sword == MIS_Rupert_Debts_Lehmar_SwordGiven)	{
		MIS_Rupert_Debts_Lehmar_Sum = 100;
	}
	else	{
		MIS_Rupert_Debts_Lehmar_Sum = 500 + 100 * (3 + Wld_GetDay() - MIS_Rupert_Debts_Lehmar_Day);
	};
	DIA_Lehmar_Rupert_GiveMoney.description = C_BuildPriceString("Я пришел вернуть долг ",MIS_Rupert_Debts_Lehmar_Sum);
	
	if (C_HeroIs_Rupert()
		&& !MIS_Rupert_Debts_Paid[Creditor_Lehmar])	{
		return TRUE;
	};
};
func void DIA_Lehmar_Rupert_GiveMoney_info()
{
	AI_Output(other,self,"DIA_Lehmar_Rupert_GiveMoney_03_00");	//Я пришел вернуть долг.
	if (C_NpcHasGold(other,MIS_Rupert_Debts_Lehmar_Sum))	{
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveMoney_09_01");	//Давай деньги и катись отсюда!
		B_GiveInvItems(other,self,ItMi_Gold,MIS_Rupert_Debts_Lehmar_Sum);
		B_RupertPayDebt(Creditor_Lehmar);
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveMoney_09_02");	//(себе под нос) Чтобы я еще раз связался с дологосрочным кредитом...
	}
	else	{
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveMoney_09_03");	//Тогда принеси деньги! Да поживее!
	};
	AI_StopProcessInfos(self);
};

// ----------------------------------------------
instance DIA_Lehmar_Rupert_GiveSword(C_INFO)
{
	nr = 4;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Rupert_GiveSword_cond;
	information = DIA_Lehmar_Rupert_GiveSword_info;
	description = "Я принес тебе рудный меч.";
};
func int DIA_Lehmar_Rupert_GiveSword_cond()
{
	if (C_HeroIs_Rupert() &&
		((MIS_Rupert_Debts_Lehmar_Sword == MIS_Rupert_Debts_Lehmar_SwordKnown) || (MIS_Rupert_Debts_Lehmar_Sword == MIS_Rupert_Debts_Lehmar_SwordTold))
		&& !MIS_Rupert_Debts_Paid[Creditor_Lehmar]
		&& (Npc_HasItems(other,ItMw_1H_Sword_Lehmar) > 0))	{
		return TRUE;
	};
};
func void DIA_Lehmar_Rupert_GiveSword_info()
{
	AI_Output(other,self,"DIA_Lehmar_Rupert_GiveSword_03_00");	//Я принес тебе рудный меч.
	if (MIS_Rupert_Debts_Lehmar_Sword == MIS_Rupert_Debts_Lehmar_SwordTold)	{
		B_GiveInvItems(other,self,ItMw_1H_Sword_Lehmar,1);
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveSword_09_01");	//Хм, похоже иногда ты не просто бросаешь слова на ветер.
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveSword_09_02");	//Как мы и договаривались, я спишу твои проценты. Ты снова должен мне только 100 золотых.
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveSword_09_03");	//И лучше, если ты вернешь их вовремя. Бизнес есть бизнес.
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Lehmar_Sword);
		B_GivePlayerXP(XP_Rupert_Debts_Lehmar_Sword);
	}
	else	{
	AI_Output(other,self,"DIA_Lehmar_Rupert_GiveSword_03_04");	//Слышал, тебе такой нужен.
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveSword_09_05");	//Что? Откуда ты?.. А, не важно.
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveSword_09_06");	//Я действительно давно ищу такой меч. 
	AI_Output(other,self,"DIA_Lehmar_Rupert_GiveSword_03_07");	//Сгодится в качестве уплаты долга?
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveSword_09_08");	//Да, задери меня орк! Давай его сюда, и катись, пока я не передумал!
		B_GiveInvItems(other,self,ItMw_1H_Sword_Lehmar,1);
		B_RupertPayDebt(Creditor_Lehmar);
		AI_StopProcessInfos(self);
	};
	MIS_Rupert_Debts_Lehmar_Sword = MIS_Rupert_Debts_Lehmar_SwordGiven;
};

// ----------------------------------------------
instance DIA_Lehmar_Rupert_Punishment(C_INFO)
{
	nr = 5;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Rupert_Punishment_cond;
	information = DIA_Lehmar_Rupert_Punishment_info;
	important = TRUE;
};
func int DIA_Lehmar_Rupert_Punishment_cond()
{
	if (C_HeroIs_Rupert() && 
		((MIS_Rupert_Debts_Lehmar_Day < Wld_GetDay()) && !MIS_Rupert_Debts_Paid[Creditor_Lehmar]))	{
		return TRUE;
	};
};
func void DIA_Lehmar_Rupert_Punishment_info()
{
	AI_GotoNpc(VLK_415_Meldor,other);
	AI_GotoNpc(VLK_4941_Thug,other); 
		AI_Output(self,other,"DIA_Lehmar_Rupert_Punishment_09_00");	//Ты! Посмел заявиться сам!
	AI_Output(other,self,"DIA_Lehmar_Rupert_Punishment_03_01");	//Я хотел...
		AI_Output(self,other,"DIA_Lehmar_Rupert_Punishment_09_02");	//Мне плевать, что ты там хотел! Я ждал более, чем достаточно.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_Theft,0);
	B_Attack(VLK_415_Meldor,other,AR_NONE,0);
	B_Attack(VLK_4941_Thug,other,AR_NONE,0);
	MIS_Rupert_Debts_Paid[Creditor_Lehmar] = TRUE;
};

// ----------------------------------------------
instance DIA_Lehmar_Rupert_GetOut(C_INFO)
{
	nr = 6;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Rupert_GetOut_cond;
	information = DIA_Lehmar_Rupert_GetOut_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Lehmar_Rupert_GetOut_cond()
{
	if (C_HeroIs_Rupert() && DIA_WhenAsked_cond()
		&& MIS_Rupert_Debts_Paid[Creditor_Lehmar])	{
		return TRUE;
	};
};
func void DIA_Lehmar_Rupert_GetOut_info()
{
		AI_Output(self,other,"DIA_Lehmar_Rupert_GetOut_09_00");	//Пошел вон!
	AI_StopProcessInfos(self);
};



/////////////////////////////////////// ЕЛЕНА //////////////////////////////////////////////
// ==============================================
instance DIA_Lehmar_Elena_AboutCup(C_INFO)
{
	nr = 10;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Elena_AboutCup_cond;
	information = DIA_Lehmar_Elena_AboutCup_info;
	description = "Я слыхала, у тебя есть кубок Верности.";
};
func int DIA_Lehmar_Elena_AboutCup_cond()
{
	if (C_HeroIs_Elena()
		 && MIS_Elena_Present_KnowsLehmar
		 && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Lehmar_Elena_AboutCup_info()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_AboutCup_16_00");	//Здравствуй. Я слыхала, у тебя есть кубок Верности.
	AI_Output(self,other,"DIA_Lehmar_Elena_AboutCup_09_01");	//И что?
		AI_Output(other,self,"DIA_Lehmar_Elena_AboutCup_16_02");	//Я бы хотела его выкупить.
	AI_Output(self,other,"DIA_Lehmar_Elena_AboutCup_09_03");	//Нет.
		AI_Output(other,self,"DIA_Lehmar_Elena_AboutCup_16_04");	//Но почему?
	AI_Output(self,other,"DIA_Lehmar_Elena_AboutCup_09_05");	//Я не обязан перед тобой объясняться!
	AI_Output(self,other,"DIA_Lehmar_Elena_AboutCup_09_06");	//Это мой кубок - хочу продаю, хочу не продаю!
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_LehmarNo);
	AI_StopProcessInfos(self);
};
// ==============================================
instance DIA_Lehmar_Elena_AboutCupPerm(C_INFO)
{
	nr = 11;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Elena_AboutCupPerm_cond;
	information = DIA_Lehmar_Elena_AboutCupPerm_info;
	description = "Я заплачу, сколько захочешь.";
	permanent = TRUE;
};
func int DIA_Lehmar_Elena_AboutCupPerm_cond()
{
	if (C_HeroIs_Elena()
		&& Npc_KnowsInfo(other,DIA_Lehmar_Elena_AboutCup)
		&& !MIS_Elena_Present_CupLehmarGot && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Lehmar_Elena_AboutCupPerm_info()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_AboutCupPerm_16_00");	//Я заплачу, сколько захочешь.
	AI_Output(self,other,"DIA_Lehmar_Elena_AboutCupPerm_09_01");	//Нет. Он не продается.
	AI_StopProcessInfos(self);
};

// ==============================================
instance DIA_Lehmar_Elena_CupLost(C_INFO)
{
	npc = VLK_484_Lehmar;				nr = 12;
	condition = DIA_Lehmar_Elena_CupLost_cond;
	information = DIA_Lehmar_Elena_CupLost_info;
	important = TRUE;
};
func int DIA_Lehmar_Elena_CupLost_cond()
{
	if (C_HeroIs_Elena()
		&& MIS_Elena_Present_CupLehmarGot)	{
		return TRUE;
	};
};
func void DIA_Lehmar_Elena_CupLost_info()
{
	MIS_Elena_Present_LehamarAskedCupBack = MIS_Elena_Present_Lehamar_Mad;
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_09_00");	//Эй ты, девка! Да, я тебе!
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_09_01");	//У меня пропал кубок Верности, после того, как ты о нем распрашивала.
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_09_02");	//Думаешь, я тупой? Верни мне кубок, воровка!
	Info_ClearChoices(DIA_Lehmar_Elena_CupLost);
	Info_AddChoice(DIA_Lehmar_Elena_CupLost,"(с искренним удивлением) Так его у тебя украли? Я просто выкупила его...",DIA_Lehmar_Elena_CupLost_Bought);
	Info_AddChoice(DIA_Lehmar_Elena_CupLost,"(сухо) У меня его нет.",DIA_Lehmar_Elena_CupLost_No);
	B_StartOtherRoutine(self,"START");
	B_StartOtherRoutine(VLK_415_Meldor,"START");
};
func void DIA_Lehmar_Elena_CupLost_No()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_CupLost_No_17_00");	//(сухо) У меня его нет.
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_No_09_01");	//(с угрозой) А если я тебя обыщу?
		AI_Output(other,self,"DIA_Lehmar_Elena_CupLost_No_17_02");	//Ну, попробуй.
	//атакует как вора. Если кубок в инвентаре, забирает
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
	B_LogEntry(TOPIC_Elena_Present,ConcatStrings(TOPIC_Elena_Present_LehmarCupTheft,TOPIC_Elena_Present_LehmarCupMine));
};
func void DIA_Lehmar_Elena_CupLost_Bought()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_CupLost_Bought_17_00");	//(искренне) Так его у тебя украли? Я просто выкупила его...
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_Bought_09_01");	//(задыхаясь) И у тебя хватает наглости...
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_Bought_09_02");	//Верни кубок сейчас же!
	Info_ClearChoices(DIA_Lehmar_Elena_CupLost);
	Info_AddChoice(DIA_Lehmar_Elena_CupLost,"Я за него честно заплатила! Ничего не знаю.",DIA_Lehmar_Elena_CupLost_MyCup);
	if (Npc_HasItems(other,ItMi_FaithfulnessCup_02))	{
		Info_AddChoice(DIA_Lehmar_Elena_CupLost,"Вот, возьми. Я правда не знала, прости.",DIA_Lehmar_Elena_CupLost_Return);
	}
	else	{
		Info_AddChoice(DIA_Lehmar_Elena_CupLost,"У меня нет его с собой. Подожди, я принесу.",DIA_Lehmar_Elena_CupLost_NoCup);
	};
};
func void DIA_Lehmar_Elena_CupLost_Return()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_CupLost_Return_17_00");	//Вот, возьми. Я правда не знала, прости.
	B_GiveInvItems(other,self,ItMi_FaithfulnessCup_02,1);
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_Return_09_01");	//Ладно, я тебе верю.
	B_GivePlayerXP(XP_Elena_CupReterned);
	MIS_Elena_Present_LehamarAskedCupBack = MIS_Elena_Present_Lehamar_Returned;
	MIS_Elena_Present_ReadyCnt -= 1;
	if (MIS_Elena_Present_ReadyCnt == 0)	{
		MIS_Elena_Present = LOG_Running;
		B_LogEntry_Status(TOPIC_Elena_Present,LOG_Running,ConcatStrings(TOPIC_Elena_Present_LehmarCupTheft,TOPIC_Elena_Present_LehmarReturned));
	}
	else	{
		B_LogEntry(TOPIC_Elena_Present,ConcatStrings(TOPIC_Elena_Present_LehmarCupTheft,TOPIC_Elena_Present_LehmarReturned));
	};
	Info_ClearChoices(DIA_Lehmar_Elena_CupLost);
	Info_AddChoice(DIA_Lehmar_Elena_CupLost,"Чем тебе так дорог этот кубок?",DIA_Lehmar_Elena_WhyTreasure_info);
};
func void DIA_Lehmar_Elena_WhyTreasure_info()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_WhyTreasure_17_00");	//Чем тебе так дорог этот кубок?
	AI_Output(self,other,"DIA_Lehmar_Elena_WhyTreasure_09_01");	//До чего же ты любопытная... Прямо как моя дочурка.
	AI_Output(self,other,"DIA_Lehmar_Elena_WhyTreasure_09_02");	//Ей на свадьбу я эти кубки готовил, такого жениха подобрал, а она сбежала с каким-то проходимцем на материк!
	AI_Output(self,other,"DIA_Lehmar_Elena_WhyTreasure_09_03");	//Семь лет о ней ни слуху, ни духу. Может, и сгинула уже.
	Info_ClearChoices(DIA_Lehmar_Elena_CupLost);
};

func void DIA_Lehmar_Elena_CupLost_NoCup()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_CupLost_NoCup_17_00");	//У меня нет его с собой. Подожди, я принесу.
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_NoCup_09_01");	//С какой стати я должен тебе верить?
		AI_Output(other,self,"DIA_Lehmar_Elena_CupLost_NoCup_17_02");	//Можешь обыскать меня, но это тебе ничего не даст.
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_NoCup_09_03");	//Ну и катись отсюда, стерва! И чтобы я тебя больше не видел.
	MIS_Elena_Present_LehamarAskedCupBack = MIS_Elena_Present_Lehamar_Waits;
	B_LogEntry(TOPIC_Elena_Present,ConcatStrings(TOPIC_Elena_Present_LehmarCupTheft,TOPIC_Elena_Present_LehmarWaits));
	AI_StopProcessInfos(self);
};

func void DIA_Lehmar_Elena_CupLost_MyCup()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_CupLost_MyCup_17_00");	//Я за него честно заплатила! Ничего не знаю.
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_MyCup_09_01");	//Ах ты, сучка! Только попробуй еще показаться тут!
	B_LogEntry(TOPIC_Elena_Present,ConcatStrings(TOPIC_Elena_Present_LehmarCupTheft,TOPIC_Elena_Present_LehmarCupMine));
	AI_StopProcessInfos(self);
};

// ==============================================
instance DIA_Lehmar_Elena_ReturnCup(C_INFO)
{
	npc = VLK_484_Lehmar;				nr = 13;
	condition = DIA_Lehmar_Elena_ReturnCup_cond;
	information = DIA_Lehmar_Elena_ReturnCup_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Lehmar_Elena_ReturnCup_cond()
{
	if (C_HeroIs_Elena() && DIA_WhenAsked_cond()
		&& (MIS_Elena_Present_LehamarAskedCupBack == MIS_Elena_Present_Lehamar_Waits))	{
		return TRUE;
	};
};
func void DIA_Lehmar_Elena_ReturnCup_info()
{
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnCup_09_00");	//Ты принесла кубок?
	if (Npc_HasItems(other,ItMi_FaithfulnessCup_02))	{
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnCup_17_01");	//Да, вот он.
		DIA_Lehmar_Elena_CupLost_Return();
	}
	else	{
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnCup_17_02");	//Еще нет...
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnCup_09_03");	//Тогда вали отсюда!
		AI_StopProcessInfos(self);
	};
};

// ==============================================
var int DIA_Lehmar_Elena_AfterReturnPerm_Once;
instance DIA_Lehmar_Elena_AfterReturnPerm(C_INFO)
{
	npc = VLK_484_Lehmar;				nr = 14;
	condition = DIA_Lehmar_Elena_AfterReturnPerm_cond;
	information = DIA_Lehmar_Elena_AfterReturnPerm_info;
	description = "Еще раз прости за кубок.";
	permanent = TRUE;
};
func int DIA_Lehmar_Elena_AfterReturnPerm_cond()
{
	if (C_HeroIs_Elena()
		&& (MIS_Elena_Present_LehamarAskedCupBack == MIS_Elena_Present_Lehamar_Returned))	{
		return TRUE;
	};
};
func void DIA_Lehmar_Elena_AfterReturnPerm_info()
{
	AI_Output(other,self,"DIA_Lehmar_Elena_AfterReturnPerm_17_00");	//Еще раз прости за кубок.
	if (!DIA_Lehmar_Elena_AfterReturnPerm_Once)	{
		AI_Output(self,other,"DIA_Lehmar_Elena_AfterReturnPerm_09_01");	//Извинения приняты. Но я его тебе все равно не продам.
		DIA_Lehmar_Elena_AfterReturnPerm_Once = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Lehmar_Elena_AfterReturnPerm_09_02");	//Просто оставь меня в покое.
	};
};

// ==============================================
instance DIA_Lehmar_Elena_ReturnOtherCup(C_INFO)
{
	npc = VLK_484_Lehmar;				nr = 15;
	condition = DIA_Lehmar_Elena_ReturnOtherCup_cond;
	information = DIA_Lehmar_Elena_ReturnOtherCup_info;
	description = "Тебе нужен второй Кубок верности?";
};
func int DIA_Lehmar_Elena_ReturnOtherCup_cond()
{
	if (C_HeroIs_Elena()
		 && (MIS_Elena_Present_LehamarAskedCupBack == MIS_Elena_Present_Lehamar_Returned)
		 && Npc_HasItems(other,ItMi_FaithfulnessCup_01))	{
		return TRUE;
	};
};
func void DIA_Lehmar_Elena_ReturnOtherCup_info()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnOtherCup_17_00");	//Тебе нужен второй кубок Верности?
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup_09_01");	//Да, черт побери! Где он?
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnOtherCup_17_02");	//Он у меня.
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup_09_03");	//Сколько ты за него хочешь?
	Info_ClearChoices(DIA_Lehmar_Elena_ReturnOtherCup);
	Info_AddChoice(DIA_Lehmar_Elena_ReturnOtherCup,"Забирай так.",DIA_Lehmar_Elena_ReturnOtherCup0);
	Info_AddChoice(DIA_Lehmar_Elena_ReturnOtherCup,"1000 золотых.",DIA_Lehmar_Elena_ReturnOtherCup1000);
	Info_AddChoice(DIA_Lehmar_Elena_ReturnOtherCup,"850 золотых.",DIA_Lehmar_Elena_ReturnOtherCup850);
	Info_AddChoice(DIA_Lehmar_Elena_ReturnOtherCup,"500 золотых.",DIA_Lehmar_Elena_ReturnOtherCup500);
	Info_AddChoice(DIA_Lehmar_Elena_ReturnOtherCup,"350 золотых.",DIA_Lehmar_Elena_ReturnOtherCup350);
};
func void DIA_Lehmar_Elena_ReturnOtherCup350()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnOtherCup350_17_00");	//350 золотых.
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup350_09_01");	//Хорошо. Вот твое золото. А теперь уходи, я хочу побыть один.
	B_GiveInvItems(other,self,ItMi_FaithfulnessCup_01,1);
	B_GiveInvItems(self,other,ItMi_Gold,350);
	B_GivePlayerXP(XP_Elena_Cup2ReternedPayed);
	AI_StopProcessInfos(self);
};
func void DIA_Lehmar_Elena_ReturnOtherCup500()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnOtherCup500_17_00");	//500 золотых.
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup500_09_01");	//Ладно. Держи деньги и убирайся с глаз моих!
	B_GiveInvItems(other,self,ItMi_FaithfulnessCup_01,1);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_StopProcessInfos(self);
};
func void DIA_Lehmar_Elena_ReturnOtherCup850()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnOtherCup850_17_00");	//850 золотых.
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup850_09_01");	//Сколько?!
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnOtherCup850_17_02");	//Ровно во столько мне обошлись оба кубка. Я просто хочу вернуть мои деньги.
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup850_09_03");	//(скрипя зубами) Хорошо. Держи деньги и катись отсюда.
	B_GiveInvItems(other,self,ItMi_FaithfulnessCup_01,1);
	B_GiveInvItems(self,other,ItMi_Gold,850);
	AI_StopProcessInfos(self);
};
func void DIA_Lehmar_Elena_ReturnOtherCup1000()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnOtherCup1000_17_00");	//1000 золотых.
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup1000_09_01");	//Что?! Да ты совсем сдурела?
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup1000_09_02");	//Думаешь, если я ростовщик, то у меня любые деньги есть?
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup1000_09_03");	//Да мне тебя убить дешевле. Уйди от греха!
	AI_StopProcessInfos(self);
};
func void DIA_Lehmar_Elena_ReturnOtherCup0()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnOtherCup0_17_00");	//Забирай так.
	B_GiveInvItems(other,self,ItMi_FaithfulnessCup_01,1);
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup0_09_01");	//Не пойму, ты совсем дура или святая?
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup0_09_02");	//Вот, возьми 500 золотых. Бери, и больше не появляйся!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	B_GivePlayerXP(XP_Elena_Cup2ReternedFree);
	AI_StopProcessInfos(self);
	//Аданос
	B_Adanos_Bless4Good();
};

// ==============================================
instance DIA_Lehmar_Elena_GetOut(C_INFO)
{
	npc = VLK_484_Lehmar;				nr = 16;
	condition = DIA_Lehmar_Elena_GetOut_cond;
	information = DIA_Lehmar_Elena_GetOut_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Lehmar_Elena_GetOut_cond()
{
	if (C_HeroIs_Elena() && DIA_WhenAsked_cond()
		&& ((MIS_Elena_Present_LehamarAskedCupBack == MIS_Elena_Present_Lehamar_GotByForce)
			|| (MIS_Elena_Present_LehamarAskedCupBack == MIS_Elena_Present_Lehamar_Mad)
			|| Npc_KnowsInfo(other,DIA_Lehmar_Elena_ReturnOtherCup)))
	{
		return TRUE;
	};
};
func void DIA_Lehmar_Elena_GetOut_info()
{
	AI_Output(self,other,"DIA_Lehmar_Elena_GetOut_09_00");	//Оставь меня в покое!
	AI_StopProcessInfos(self);
};

/////////////////////////////////////// ОСТАЛЬНЫЕ /////////////////////////////////////////////
// ==============================================
instance DIA_Lehmar_Others_Hello(C_INFO)
{
	nr = 50;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Others_MR_Hello_cond;
	information = DIA_Lehmar_Others_MR_Hello_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Lehmar_Others_MR_Hello_cond()
{
	var C_NPC owner;	owner = Wld_GetPlayerPortalOwner();
	if (!C_HeroIs_Rupert()
		&& !(C_HeroIs_Elena() && MIS_Elena_Present_KnowsLehmar)
		&& (C_NpcIs(owner,self))
		&& DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Lehmar_Others_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Lehmar_Others_MR_Hello_09_00");	//Хочешь занять денег?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Lehmar_Others_MR_Hello_03_01");	//Нет.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Lehmar_Others_MR_Hello_07_01");	//Нет.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Lehmar_Others_MR_Hello_10_01");	//Нет.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Lehmar_Others_MR_Hello_14_01");	//Нет.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Lehmar_Others_MR_Hello_16_01");	//Нет.
	};
	AI_Output(self,other,"DIA_Lehmar_Others_MR_Hello_09_02");	//Тогда не мельтеши перед глазами.
	AI_StopProcessInfos(self);
};

