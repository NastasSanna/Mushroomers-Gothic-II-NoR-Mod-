
instance DIA_Maleth_EXIT(DIA_Proto_End)
{
	npc = BAU_954_Maleth;
};

// ОБЩИЕ ==================================================================
instance DIA_Maleth_Hello(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_MR_Hello_cond;
	information = DIA_Maleth_MR_Hello_info;
	description = "Здравствуй, пастух.";
};
func int DIA_Maleth_MR_Hello_cond()
{
	return TRUE;
};
func void DIA_Maleth_MR_Hello_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Maleth_MR_Hello_03_00");	//Здравствуй, пастух.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Maleth_MR_Hello_07_00");	//Здравствуй, пастух.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Maleth_MR_Hello_10_00");	//Здравствуй, пастух.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Maleth_MR_Hello_14_00");	//Здравствуй, пастух.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Maleth_MR_Hello_16_00");	//Здравствуй, пастух.
	};
	AI_Output(self,other,"DIA_Maleth_MR_Hello_08_01");	//Да какое тут, к демонам, здоровье...
};


// Квест: ГОЛОДНЫЕ ВОЛКИ ==========================================================
instance DIA_Maleth_UASad(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 2;
	condition = DIA_Maleth_UASad_cond;
	information = DIA_Maleth_UASad_info;
	description = "Похоже, ты не в духе. Что-то случилось?";
};
func int DIA_Maleth_UASad_cond()
{
	if (Npc_KnowsInfo(other,DIA_Maleth_Hello))	{	return TRUE;	};
};
func void DIA_Maleth_UASad_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Maleth_UASad_03_00");	//Похоже, ты не в духе. Что-то случилось?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Maleth_UASad_07_00");	//Похоже, ты не в духе. Что-то случилось?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Maleth_UASad_10_00");	//Похоже, ты не в духе. Что-то случилось?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Maleth_UASad_14_00");	//Похоже, ты не в духе. Что-то случилось?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Maleth_UASad_16_00");	//Похоже, ты не в духе. Что-то случилось?
	};
	AI_Output(self,other,"DIA_Maleth_UASad_08_01");	//А что у пастуха может случиться? Волки!
	AI_Output(self,other,"DIA_Maleth_UASad_08_02");	//Летом еще ничего, но с приходом осени они все ближе подходят к ферме.
	AI_Output(self,other,"DIA_Maleth_UASad_08_03");	//Пару недель назад тут были охотники, они перебили целую стаю.
	AI_Output(self,other,"DIA_Maleth_UASad_08_04");	//Но не прошло и 10 дней, как появилась еще одна!
	AI_Output(self,other,"DIA_Maleth_UASad_08_06");	//Они задирают овец чуть ли не каждую ночь, а днем где-то прячутся.
	AI_Output(self,other,"DIA_Maleth_UASad_08_07");	//Если так пойдет и дальше, Лобарт с меня вместо овец шкуру спустит!
	
	if (MIS_MalethWolves != LOG_Running)	{
		MIS_MalethWolves = LOG_Running;
		B_LogEntry_Create(TOPIC_MalethWolves,LOG_MISSION,TOPIC_MalethWolves_Start);
	};
};

//==========================================================
instance DIA_Maleth_IllKillWolves(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 3;
	condition = DIA_Maleth_IllKillWolves_cond;
	information = DIA_Maleth_IllKillWolves_info;
	description = "Я разберусь с твоими волками.";
};
func int DIA_Maleth_IllKillWolves_cond()
{
	if (MIS_MalethWolves == LOG_Running && (MalethWolf_Dead_Cnt < 6))	{	return TRUE;	};
};
func void DIA_Maleth_IllKillWolves_info()
{
	var int x; x = 0;
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Maleth_IllKillWolves_03_00");	//Я разберусь с твоими волками.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Maleth_IllKillWolves_07_00");	//Я разберусь с твоими волками.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Maleth_IllKillWolves_10_00");	//Я разберусь с твоими волками.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Maleth_IllKillWolves_14_00");	//Я разберусь с твоими волками.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Maleth_IllKillWolves_16_00");	//Я разберусь с твоими волками.
	};
	AI_Output(self,other,"DIA_Maleth_IllKillWolves_08_01");	//Судя по следам, их не меньше полудюжины! Был бы один или два, я бы и сам разобрался.
	x = 1; if (x == 1)	{
		B_LogEntry(TOPIC_MalethWolves,TOPIC_MalethWolves_Number);
	};
	AI_Output(self,other,"DIA_Maleth_IllKillWolves_08_02");	//Но так... Пусть лучше жрут овец, чем меня.
	if (C_HeroIs_Talbin())	{
		AI_Output(self,other,"DIA_Maleth_IllKillWolves_08_03");	//Но ты, наверное, хороший охотник  и справишься с ними.
		AI_Output(self,other,"DIA_Maleth_IllKillWolves_08_04");	//Однако я не смогу предложить тебе богатую награду.
	}
	else	{
		AI_Output(self,other,"DIA_Maleth_IllKillWolves_08_05");	//И тебе стоит больше ценить свою жизнь.
		AI_Output(self,other,"DIA_Maleth_IllKillWolves_08_06");	//Ты же не думаешь, что я смогу озолотить тебя, если ты перебьешь этих волков?
	};
	x = 2; if (x == 2)	{
		B_LogEntry(TOPIC_MalethWolves,TOPIC_MalethWolves_Payment);
	};
};

//==========================================================
instance DIA_Maleth_WolvesKilled(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 4;
	condition = DIA_Maleth_WolvesKilled_cond;
	information = DIA_Maleth_WolvesKilled_info;
	description = "Волки тебя больше не побеспокоят.";
};
func int DIA_Maleth_WolvesKilled_cond()
{
	if ((MIS_MalethWolves == LOG_Running) && Npc_KnowsInfo(other, DIA_Maleth_UASad)
		&& (MalethWolf_Dead_Cnt >= 6))	{	return TRUE;	};
};
func void DIA_Maleth_WolvesKilled_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_03_00");	//Волки тебя больше не побеспокоят.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_07_00");	//Волки тебя больше не побеспокоят.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_10_00");	//Волки тебя больше не побеспокоят.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_14_00");	//Волки тебя больше не побеспокоят.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_16_00");	//Волки тебя больше не побеспокоят.
	};
	AI_Output(self,other,"DIA_Maleth_WolvesKilled_08_01");	//Если это правда, я готов расцеловать тебя!
	if (Npc_KnowsInfo(other,DIA_Maleth_IllKillWolves))	{
		AI_Output(self,other,"DIA_Maleth_WolvesKilled_08_02");	//Но, как я и говорил, мне нечем тебя вознаградить. Разве что...
	}
	else	{
	//UNFINISHED обрезать фразу
		AI_Output(self,other,"DIA_Maleth_WolvesKilled_08_02b");	//Но мне нечем тебя вознаградить. Разве что...
	};
	AI_Output(self,other,"DIA_Maleth_WolvesKilled_08_03");	//Давай так: пока мои овцы целы, я буду каждый день делиться с тобой обедом. Идет?
	Info_ClearChoices(DIA_Maleth_WolvesKilled);
	Info_AddChoice(DIA_Maleth_WolvesKilled,"Нет, меня это не устраивает.",DIA_Maleth_WolvesKilled_No);
	if (hero.voice == 3)	{			//Одо/Руперт/Тилл
		Info_AddChoice(DIA_Maleth_WolvesKilled,"По рукам.",DIA_Maleth_WolvesKilled_Yes);
	} else	{							//остальные
		Info_AddChoice(DIA_Maleth_WolvesKilled,"Договорились.",DIA_Maleth_WolvesKilled_Yes);
	};
	MalethSheep_Dead_Cnt = 0;	//сброс счетчика
};
func void DIA_Maleth_WolvesKilled_No()
{
	Info_ClearChoices(DIA_Maleth_WolvesKilled);
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_No_03_00");	//Нет, меня это не устраивает.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_No_07_00");	//Нет, меня это не устраивает.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_No_10_00");	//Нет, меня это не устраивает.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_No_14_00");	//Нет, меня это не устраивает.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_No_16_00");	//Нет, меня это не устраивает.
	};
	AI_Output(self,other,"DIA_Maleth_WolvesKilled_No_08_01");	//Хорошо. Тогда я дам тебе 7 золотых. Это все, что у меня сейчас есть.
		B_GiveInvItems(self,other,ItMi_gold,7);
		B_GivePlayerXP(XP_MalethWolves);
		MIS_MalethWolves = LOG_SUCCESS;
		B_LogEntry_Status(TOPIC_MalethWolves,LOG_SUCCESS,TOPIC_MalethWolves_Paid);
};
func void DIA_Maleth_WolvesKilled_Yes()
{
	Info_ClearChoices(DIA_Maleth_WolvesKilled);
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_Yes_03_00");	//По рукам.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_Yes_07_00");	//Договорились.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_Yes_10_00");	//Договорились.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_Yes_14_00");	//Договорились.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_Yes_16_00");	//Договорились.
	};
	AI_Output(self,other,"DIA_Maleth_WolvesKilled_Yes_08_01");	//Отлично. Жду тебя завтра.
	MIS_MalethWolves_SheepKilled = MalethSheep_Dead_Cnt;	//перестанет кормить, если умрут еще овцы, по любой причине
	MIS_MalethWolves_FeedDay = Wld_GetDay() + 1;	//один раз в день
		B_GivePlayerXP(XP_MalethWolves);
		MIS_MalethWolves = LOG_SUCCESS;
		B_LogEntry_Status(TOPIC_MalethWolves,LOG_SUCCESS,TOPIC_MalethWolves_Food);
		B_LogNote(Topic_Misk, Topic_Misk_MalethFood);
};

//==========================================================
instance DIA_Maleth_Feed(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 5;
	condition = DIA_Maleth_Feed_cond;
	information = DIA_Maleth_Feed_info;
	description = "А не пора ли перекусить?";
	permanent = TRUE;
};
func int DIA_Maleth_Feed_cond()
{
	if ((MIS_MalethWolves == LOG_SUCCESS) && (MIS_MalethWolves_FeedDay > 0))	{	return TRUE;	};
};
func void DIA_Maleth_Feed_info()
{
	var int x;	x = 0;
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Maleth_Feed_03_00");	//А не пора ли перекусить?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Maleth_Feed_07_00");	//А не пора ли перекусить?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Maleth_Feed_10_00");	//А не пора ли перекусить?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Maleth_Feed_14_00");	//А не пора ли перекусить?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Maleth_Feed_16_00");	//А не пора ли перекусить?
	};
	if ((MIS_MalethWolves_FeedDay > Wld_getDay()) || Wld_IsTime(23,0,7,0))	{
		AI_Output(self,other,"DIA_Maleth_Feed_08_01");	//Сейчас у меня нет для тебя еды. Приходи завтра днем.
	}
	else 	if (MalethSheep_Dead_Cnt > MIS_MalethWolves_SheepKilled)	{
		AI_Output(self,other,"DIA_Maleth_Feed_08_02");	//У меня опять начали пропадать овцы. Я обещал кормить тебя, только пока они в порядке.
		B_LogNote(Topic_Misk,Topic_Misk_MalethStop);
	}
	else {
		AI_Output(self,other,"DIA_Maleth_Feed_08_03");	//Конечно, угощайся.
		MIS_MalethWolves_FeedDay = Wld_GetDay() + 1;
		x = 1; if (x == 1)	{
			//дает еду
			x = C_Random(4);
			if (x == 0)	{	B_GiveInvItems(self,other,ItFo_Bread,1);	}	else
			if (x == 1)	{	B_GiveInvItems(self,other,ItFo_Stew,1);	}	else
			if (x == 2)	{	B_GiveInvItems(self,other,ItFo_Cheese,1);	}	else
						{	B_GiveInvItems(self,other,ItFo_Apple,1);	};
			//иногда ест сам
			if (C_Random(24) > C_GetHour())	{
				if (x == 0)	{CreateInvItem(self,ItFo_Bread);B_UseItem(self,ItFo_Apple);}	else
				if (x == 2)	{CreateInvItem(self,ItFo_Bread);B_UseItem(self,ItFo_Stew);}	else
							{CreateInvItem(self,ItFo_Bread);B_UseItem(self,ItFo_Bread);};
			};
			//дает напиток
			x = C_Random(4);
			if (x == 0)	{	B_GiveInvItems(self,other,ItFo_Water,1);	}	else
			if (x == 1)	{	B_GiveInvItems(self,other,ItFo_Wine,1);	}	else
			if (x == 2)	{	B_GiveInvItems(self,other,ItFo_Milk,1);	}	else
						{	B_GiveInvItems(self,other,ItFo_Booze,1);	};
		};
	};
};


// РАЗНОЕ ==========================================================
instance DIA_Maleth_HowAU(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 10;
	condition = DIA_Maleth_HowAU_cond;
	information = DIA_Maleth_HowAU_info;
	description = "Как дела?";
	permanent = TRUE;
};
func int DIA_Maleth_HowAU_cond()
{
	if (Npc_KnowsInfo(other,DIA_Maleth_UASad))	{	return TRUE;	};
};
func void DIA_Maleth_HowAU_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Maleth_HowAU_03_00");	//Как дела?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Maleth_HowAU_07_00");	//Как дела?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Maleth_HowAU_10_00");	//Как дела?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Maleth_HowAU_14_00");	//Как дела?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Maleth_HowAU_16_00");	//Как дела?
	};
	if ((MIS_MalethWolves != LOG_SUCCESS) || (MalethSheep_Dead_Cnt > MIS_MalethWolves_SheepKilled))	{
		AI_Output(self,other,"DIA_Maleth_HowAU_08_01");	//Если овцы продолжат пропадать, то я скоро поседею!
	}
	else	{
		AI_Output(self,other,"DIA_Maleth_HowAU_08_02");	//Пока овцы целы, и у меня все в порядке.
	};
};
//==============================================
instance DIA_Maleth_News(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 11;
	condition = DIA_Maleth_News_cond;
	information = DIA_Maleth_News_info;
	description = "Какие новости?";
};
func int DIA_Maleth_News_cond()
{
	if (Npc_KnowsInfo(other,DIA_Maleth_Hello))	{	return TRUE;	};
};
func void DIA_Maleth_News_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Maleth_News_03_00");	//Какие новости?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Maleth_News_07_00");	//Какие новости?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Maleth_News_10_00");	//Какие новости?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Maleth_News_14_00");	//Какие новости?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Maleth_News_16_00");	//Какие новости?
	};
	AI_Output(self,other,"DIA_Maleth_News_08_01");	//Я слышал, с гор спустились орки и напали на охотников. Почти никто не выжил.
	AI_Output(self,other,"DIA_Maleth_News_08_02");	//Но я не думаю, что они придут сюда. Меня больше заботят волки!
};

//==============================================
// если погибли все овцы под надзором Малета
var int DIA_Maleth_NoSheep_Once;
instance DIA_Maleth_NoSheep(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 0;
	condition = DIA_Maleth_NoSheep_cond;
	information = DIA_Maleth_NoSheep_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Maleth_NoSheep_cond()
{
	if (Npc_IsInState(self, ZS_Talk))	{
		if ((!Hlp_IsValidNpc(Hammel_Maleth) && !Hlp_IsValidNpc(Sheep_Maleth)) || (MalethSheep_Dead_Cnt >= 9))
		{	return TRUE;	};
	};
};
func void DIA_Maleth_NoSheep_info()
{
	if (DIA_Maleth_NoSheep_Once == FALSE)	{
		AI_Output(self,other,"DIA_Maleth_NoSheep_08_00");	//Овцы! Все стадо! Ни одной не осталось!
	};
		AI_Output(self,other,"DIA_Maleth_NoSheep_08_01");	//Что мне теперь делать?
	if (!Npc_IsDead(BAU_950_Lobart) && (DIA_Maleth_NoSheep_Once == FALSE))	{
		AI_Output(self,other,"DIA_Maleth_NoSheep_08_02");	//Лобарт меня точно убьет. Или еще хуже - заставит за них заплатить...
	};
	DIA_Maleth_NoSheep_Once = TRUE;
	AI_StopProcessInfos(self);
};

