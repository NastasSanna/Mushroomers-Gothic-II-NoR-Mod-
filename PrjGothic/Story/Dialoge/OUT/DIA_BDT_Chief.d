
instance DIA_Chief_EXIT(DIA_Proto_End)
{
	npc = BDT_801_Chief;
};

// ОБЩИЕ ===================================================
instance DIA_Chief_Start(C_INFO)
{
	npc = BDT_801_Chief;
	nr = 0;
	condition = DIA_NoCond_cond;
	information = DIA_Chief_Start_info;
	important = TRUE;
};

func void DIA_Chief_Start_info()
{
	AI_Output(self,other,"DIA_Chief_Start_01_00");	//Кто тут у нас? Птичка залетела в чужую клетку? Ха-ха.
	AI_Output(self,other,"DIA_Chief_Start_01_01");	//Что тебе тут нужно?
	Info_ClearChoices(DIA_Chief_Start);
	Info_AddChoice(DIA_Chief_Start,"Да я просто грибы собираю...",DIA_Chief_Start_NoReason);
	if (MIS_KhorinisPost == LOG_Running)	{
		Info_AddChoice(DIA_Chief_Start,"У меня письмо от Вино.",DIA_Chief_Start_Vino);
	};
};
//------------------------------------------------
func void DIA_Chief_Start_NoReason()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Chief_Start_NoReason_03_00");	//Да я просто грибы собираю...
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Chief_Start_NoReason_07_00");	//Да я просто грибы собираю...
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Chief_Start_NoReason_10_00");	//Да я просто грибы собираю...
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Chief_Start_NoReason_14_00");	//Да я просто грибы собираю...
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Chief_Start_NoReason_16_00");	//Да я просто грибы собираю...
	};
	AI_Output(self,other,"DIA_Chief_Start_NoReason_01_01");	//Ах, грибочки ищешь? Ну конечно!
	AI_Output(self,other,"DIA_Chief_Start_NoReason_01_02");	//Нечего мне мозги пудрить!
	AI_TurnAway(self,other);
	AI_Output(self,other,"DIA_Chief_Start_NoReason_01_03");	//Ребята, разберитесь тут!
	B_Attack(BDT_802_Bootlegger,other,AR_KILL,0);
	B_Attack(BDT_803_Bootlegger,other,AR_KILL,0);
	B_Attack(BDT_804_Bootlegger,other,AR_KILL,0);
	AI_StopProcessInfos(self);
	MIS_KhorinisPost_FailChief = TRUE;
	B_LogEntry_KhorinisPost_FailChief();
};
//------------------------------------------------
func void DIA_Chief_Start_Vino()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Chief_Start_Vino_03_00");	//У меня письмо от Вино.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Chief_Start_Vino_07_00");	//У меня письмо от Вино.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Chief_Start_Vino_10_00");	//У меня письмо от Вино.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Chief_Start_Vino_14_00");	//У меня письмо от Вино.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Chief_Start_Vino_16_00");	//У меня письмо от Вино.
	};
	AI_Output(self,other,"DIA_Chief_Start_Vino_01_01");	//Покажи!
//------------------------------------------------
	if (Npc_HasItems(other,ItWr_Letter_Vino2Chief))	{
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Chief_Start_Vino_03_02");	//Вот оно.
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Chief_Start_Vino_07_02");	//Вот оно.
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Chief_Start_Vino_10_02");	//Вот оно.
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Chief_Start_Vino_14_02");	//Вот оно.
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Chief_Start_Vino_16_02");	//Вот оно.
		};
		B_GiveInvItems(other,self,ItWr_Letter_Vino2Chief,1);
		AI_UseItemToState(self,ItWr_Letter_Vino2Chief,1);
		AI_Wait(self,1.0);
		AI_UseItemToState(self,ItWr_Letter_Vino2Chief,-1);
		AI_Output(self,other,"DIA_Chief_Start_Vino_01_03");	//Похоже, это действительно его письмо.
		AI_Output(self,other,"DIA_Chief_Start_Vino_01_04");	//Хорошо, не смею тебя больше задерживать.

		self.guild = GIL_OUT;	Npc_SetTrueGuild(self,GIL_OUT);
		BDT_802_Bootlegger.guild = GIL_OUT;	Npc_SetTrueGuild(BDT_802_Bootlegger,GIL_OUT);
		Npc_SetAttitude(BDT_802_Bootlegger, ATT_NEUTRAL);
		BDT_803_Bootlegger.guild = GIL_OUT;	Npc_SetTrueGuild(BDT_803_Bootlegger,GIL_OUT);
		Npc_SetAttitude(BDT_803_Bootlegger, ATT_NEUTRAL);
		BDT_804_Bootlegger.guild = GIL_OUT;	Npc_SetTrueGuild(BDT_804_Bootlegger,GIL_OUT);
		Npc_SetAttitude(BDT_804_Bootlegger, ATT_NEUTRAL);
		
		AI_StopProcessInfos(self);
		MIS_KhorinisPost_VinoDelivered = TRUE;
		B_GivePlayerXP(XP_KhorinisPost_BootleggerDelivered);
		if (hero.aivar[AIV_Gender] == MALE)	{
			B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_BootleggerDelivered);
		}
		else	{
			B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_BootleggerDelivered_Fem);
		};
	}
	//------------------------------------------------
	else	{
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Chief_Start_Vino_03_05");	//У меня его нет...
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Chief_Start_Vino_07_05");	//У меня его нет...
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Chief_Start_Vino_10_05");	//У меня его нет...
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Chief_Start_Vino_14_05");	//У меня его нет...
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Chief_Start_Vino_16_05");	//У меня его нет...
		};
		AI_Output(self,other,"DIA_Chief_Start_Vino_01_06");	//Э нет, со мной такие фокусы не пройдут. Я шпионов за милю чую.
		AI_Output(self,other,"DIA_Chief_Start_Vino_01_07");	//Эй, ребята, тут кое-кто создает нам проблемы!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
		B_Attack(BDT_802_Bootlegger,other,AR_KILL,0);
		B_Attack(BDT_803_Bootlegger,other,AR_KILL,0);
		B_Attack(BDT_804_Bootlegger,other,AR_KILL,0);
		B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_BootleggerUnfriendly);
	};
};

//===================================================
instance DIA_Chief_Payment(C_INFO)
{
	npc = BDT_801_Chief;
	nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_Chief_Payment_info;
	description = "Как насчет награды?";
};
func void DIA_Chief_Payment_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Chief_Payment_03_00");	//Как насчет награды?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Chief_Payment_07_00");	//Эй, как насчет моей награды?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Chief_Payment_10_00");	//Эй, как насчет моей награды?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Chief_Payment_14_00");	//Эй, как насчет моей награды?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Chief_Payment_16_00");	//Эй, как насчет моей награды?
	};
	AI_Output(self,other,"DIA_Chief_Payment_01_01");	//Ха, а ты своего не упустишь! Мне это нравится.
	AI_Output(self,other,"DIA_Chief_Payment_01_02");	//Но, понимаешь, я сейчас на мели... Дела идут совсем плохо. Боюсь, что я не смогу заплатить тебе.
	AI_Output(self,other,"DIA_Chief_Payment_01_03");	//Но если хочешь подзаработать - у меня есть для тебя предложение.
	AI_Output(self,other,"DIA_Chief_Payment_01_04");	//Мне нужно кое-что доставить в город. Получатель тебе щедро заплатит. Ну как, возьмешься?
	Info_ClearChoices(DIA_Chief_Payment);
	Info_AddChoice(DIA_Chief_Payment,"Нет, мне это неинтересно.",DIA_Chief_Payment_No);
	Info_AddChoice(DIA_Chief_Payment,"Давай сюда мои деньги!",DIA_Chief_Payment_GiveMyMoney);
	Info_AddChoice(DIA_Chief_Payment,"Хорошо, я возьмусь за это дело.",DIA_Chief_Payment_Yes);
};
//------------------------------------------------
func void DIA_Chief_Payment_No()
{
	var int x;	x = 0;
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Chief_Payment_No_03_00");	//Нет, мне это неинтересно.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Chief_Payment_No_07_00");	//Нет, мне это неинтересно.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Chief_Payment_No_10_00");	//Нет, мне это неинтересно.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Chief_Payment_No_14_00");	//Нет, мне это неинтересно.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Chief_Payment_No_16_00");	//Нет, мне это неинтересно.
	};
	AI_Output(self,other,"DIA_Chief_Payment_No_01_01");	//Как хочешь.
	AI_StopProcessInfos(self);
	x = 1;	if (x == 1)	{
		MIS_KhorinisPost = LOG_FAILED;
		B_LogEntry_Status(TOPIC_KhorinisPost,LOG_FAILED,TOPIC_KhorinisPost_BootleggerNoPay);
	};
};
//------------------------------------------------
func void DIA_Chief_Payment_GiveMyMoney()
{
	var int x;	x = 0;
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_03_00");	//Давай сюда мои деньги!
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_03_01");	//Ты не похож на бедняка, и Вино обещал, что мне заплатят, если я отнесу письмо.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_07_00");	//Давай сюда мои деньги!
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_07_01");	//Ты не похож на бедняка, и Вино обещал, что мне заплатят, если я отнесу письмо.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_10_00");	//Давай сюда мои деньги!
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_10_01");	//Ты не похож на бедняка, и Вино обещал, что мне заплатят, если я отнесу письмо.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_14_00");	//Давай сюда мои деньги!
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_14_01");	//Ты не похож на бедняка, и Вино обещал, что мне заплатят, если я отнесу письмо.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_16_00");	//Давай сюда мои деньги!
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_16_01");	//Ты не похож на бедняка, и Вино обещал, что мне заплатят, если я отнесу письмо.
	};
	AI_Output(self,other,"DIA_Chief_Payment_GiveMyMoney_01_02");	//Не стоит давить на меня. Мы же не хотим грубости?
	AI_Output(self,other,"DIA_Chief_Payment_GiveMyMoney_01_03");	//А если Вино что-то тебе обещал, то пусть он и платит.
	AI_StopProcessInfos(self);
	x = 1;	if (x == 1)	{
		B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_BootleggerVinoPay);
	};
};
//------------------------------------------------
func void DIA_Chief_Payment_Yes()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Chief_Payment_Yes_03_00");	//Хорошо, я возьмусь за это дело.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Chief_Payment_Yes_07_00");	//Хорошо, я возьмусь за это дело.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Chief_Payment_Yes_10_00");	//Хорошо, я возьмусь за это дело.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Chief_Payment_Yes_14_00");	//Хорошо, я возьмусь за это дело.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Chief_Payment_Yes_16_00");	//Хорошо, я возьмусь за это дело.
	};
	AI_Output(self,other,"DIA_Chief_Payment_Yes_01_01");	//По рукам! Смотри, вот пакет с товаром.
	AI_Output(self,other,"DIA_Chief_Payment_Yes_01_02");	//Найди в порту торговца рыбой Халвора и передай этот пакет ему. Он тебе заплатит.
	Info_ClearChoices(DIA_Chief_Payment);
	MIS_KhorinisPost_Stage_FromBootlegger = TRUE;
	B_GiveInvItems(self,other,ItMi_Packet_Halvor,1);
	B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_BootleggerNewJob);
};

//===================================================
instance DIA_Chief_WhoAU(C_INFO)
{
	npc = BDT_801_Chief;
	nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_Chief_WhoAU_info;
	description = "А кто вы такие?";
};
func void DIA_Chief_WhoAU_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Chief_WhoAU_03_00");	//А кто вы такие?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Chief_WhoAU_07_00");	//А кто вы такие?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Chief_WhoAU_10_00");	//А кто вы такие?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Chief_WhoAU_14_00");	//А кто вы такие?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Chief_WhoAU_16_00");	//А кто вы такие?
	};
	AI_Output(self,other,"DIA_Chief_WhoAU_01_01");	//Простые честные торговцы.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Chief_WhoAU_03_01");	//Тогда что вы тут делаете? Почему вы не в городе, я имею в виду?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Chief_WhoAU_07_01");	//Тогда что вы тут делаете? Почему вы не в городе, я имею в виду?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Chief_WhoAU_10_01");	//Тогда что вы тут делаете? Почему вы не в городе, я имею в виду?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Chief_WhoAU_14_01");	//Тогда что вы тут делаете? Почему вы не в городе, я имею в виду?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Chief_WhoAU_16_01");	//Тогда что вы тут делаете? Почему вы не в городе, я имею в виду?
	};
	AI_Output(self,other,"DIA_Chief_WhoAU_01_02");	//Цены на жилье в городе слишком высокие. А аренда места на складе? Это же чистая обдираловка!
	AI_Output(self,other,"DIA_Chief_WhoAU_01_03");	//Так что приходится ютиться в лесной пещере. Для честных торговцев нынче тяжелые времена!
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Chief_WhoAU_03_04");	//А эти ребята?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Chief_WhoAU_07_04");	//А эти ребята?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Chief_WhoAU_10_04");	//А эти ребята?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Chief_WhoAU_14_04");	//А эти ребята?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Chief_WhoAU_16_04");	//А эти ребята?
	};
	AI_Output(self,other,"DIA_Chief_WhoAU_01_05");	//А что с ними? Это мои парни. Нужно же кому-то охранять все, нажитое честным трудом.
	AI_Output(self,other,"DIA_Chief_WhoAU_01_06");	//С ними шутки плохи... Но вообще, это добрейшей души люди, честное слово!
	B_SetNameByIndex(BDT_801_Chief,2);
	B_SetNameByIndex(BDT_802_Bootlegger,2);
	B_SetNameByIndex(BDT_803_Bootlegger,2);
	B_SetNameByIndex(BDT_804_Bootlegger,2);
};


// ТОРГОВЛЯ ===================================================
instance DIA_Chief_PreTrade(C_INFO)
{
	npc = BDT_801_Chief;
	nr = 50;
	condition = DIA_Chief_PreTrade_cond;
	information = DIA_Chief_PreTrade_info;
	description = "Может, поторгуем?";
	trade = TRUE;
};
func int DIA_Chief_PreTrade_cond()
{
	if (Npc_KnowsInfo(other,DIA_Chief_WhoAU))	{	return TRUE;	};
};
func void DIA_Chief_PreTrade_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Chief_PreTrade_03_00");	//Может, поторгуем?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Chief_PreTrade_07_00");	//Может, поторгуем?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Chief_PreTrade_10_00");	//Может, поторгуем?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Chief_PreTrade_14_00");	//Может, поторгуем?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Chief_PreTrade_16_00");	//Может, поторгуем?
	};
	AI_Output(self,other,"DIA_Chief_PreTrade_01_01");	//А почему бы и нет? У меня есть разные товары, которых не найдешь в городе.
	B_GiveTradeInv_Bootlegger(self);
	B_LogNote(Topic_Trader,TOPIC_Trader_Chief);
};
//===================================================
instance DIA_Chief_MRTrade(C_INFO)
{
	npc = BDT_801_Chief;
	nr = 51;
	condition = DIA_Chief_MRTrade_cond;
	information = DIA_Chief_MRTrade_info;
	description = "Покажи мне свои товары.";
	permanent = TRUE;
	trade = TRUE;
};
func int DIA_Chief_MRTrade_cond()
{
	if (Npc_KnowsInfo(other,DIA_Chief_PreTrade))	{	return TRUE;	};
};
func void DIA_Chief_MRTrade_info()
{
	AI_Output(self,other,"DIA_Chief_MRTrade_01_01");	//Смотри, выбирай, плати.
	B_GiveTradeInv_Bootlegger(self);
};

//*/
