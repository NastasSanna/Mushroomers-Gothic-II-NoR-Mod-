
instance DIA_Lobart_EXIT(DIA_Proto_End)
{
	npc = BAU_950_Lobart;
};

// ОДО ==================================================================
instance DIA_Lobart_Odo_Straw(C_INFO)
{
	npc = BAU_950_Lobart;	nr = 20;
	condition = DIA_Lobart_Odo_Straw_cond;
	information = DIA_Lobart_Odo_Straw_info;
	description = "Почем у тебя сено?";
};
func int DIA_Lobart_Odo_Straw_cond()
{
	if (C_HeroIs_Odo() && (MIS_Odo_Straw == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Lobart_Odo_Straw_info()
{
		AI_Output(other,self,"DIA_Lobart_Odo_Straw_03_00");	//Почем у тебя сено?
	AI_Output(self,other,"DIA_Lobart_Odo_Straw_13_01");	//С удовольствием продам Монастырю свое сено по 16 золотых. 
		AI_Output(other,self,"DIA_Lobart_Odo_Straw_03_02");	//А хорошее?
	AI_Output(self,other,"DIA_Lobart_Odo_Straw_13_03");	//Сам посмотри в сарае.
	B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Lobart_Price);
	MIS_Odo_Straw_Lobart[Straw_Price] = 1;
};

// ОБЩИЕ ==================================================================
instance DIA_Lobart_Start(C_INFO)
{
	npc = BAU_950_Lobart;	nr = 30;
	condition = DIA_WhenAsked_cond;
	information = DIA_Lobart_Start_info;
	important = TRUE;
};
func void DIA_Lobart_Start_info()
{
	var int x; x = 0;
	if (C_HeroIs_Elena())	{		//Елена
		AI_Output(self,other,"DIA_Lobart_Start_Elena_05_00");	//А, Елена, я тебя не узнал. Давно не виделись.
		AI_Output(self,other,"DIA_Lobart_Start_Elena_05_01");	//Что ты тут делаешь? Что-то случилось?
			AI_Output(other,self,"DIA_Lobart_Start_Elena_16_02");	//Нет, все в порядке. Просто грибы собираю.
	}
	else if (C_HeroIs_Till())	{	//Тилл
		AI_Output(self,other,"DIA_Lobart_Start_Till_05_00");	//А ты кто еще такой?
			AI_Output(other,self,"DIA_Lobart_Start_Till_14_01");	//Меня зовут Тилл. Мой отец - землевладелец Секоб.
		AI_Output(self,other,"DIA_Lobart_Start_Till_05_02");	//Сын Секоба, малыш Тилл? Я-то думал, что ты еще мальчуган, а ты повыше меня будешь.
		AI_Output(self,other,"DIA_Lobart_Start_Till_05_03");	//Что ты хотел?
			AI_Output(other,self,"DIA_Lobart_Start_Till_14_04");	//Просто поздороваться. Меня отец за грибами отправил.
	} 
	else if (C_HeroIs_Erol())	{	//Эрол
		AI_Output(self,other,"DIA_Lobart_Start_Erol_03_00");	//Здравствуй, почтенный Эрол. Ты все путешествуешь?
			AI_Output(other,self,"DIA_Lobart_Start_Erol_10_01");	//Да, на этот раз за грибами.
	} 
	else if (C_HeroIs_Odo() && C_NpcWears(other, ItAr_NOV_L))	{	//Одо
		AI_Output(self,other,"DIA_Lobart_Start_Odo_03_00");	//Приветствую тебя, послушник! Но если ты пришел просить пожертвований, сразу говорю - у меня ничего нет.
			AI_Output(other,self,"DIA_Lobart_Start_Odo_10_01");	//Нет-нет! Я просто собираю грибы.
	} 
	else if (C_HeroIs_Sarah())	{	//Сара
		AI_Output(self,other,"DIA_Lobart_Start_Sarah_03_00");	//Сара, здравствуй! Ты хочешь что-то купить?
			AI_Output(other,self,"DIA_Lobart_Start_Sarah_10_01");	//Пока нет. Я тут за грибами отправилась.
	} 
	else	{
		AI_Output(self,other,"DIA_Lobart_Start_05_00");	//Что ты делаешь на моей ферме? Не топчи траву, иди своей дорогой.
		if (hero.voice == 3)	{			//Руперт/Одо без робы
			AI_Output(other,self,"DIA_Lobart_Start_03_00");	//Я просто собираю грибы.
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Lobart_Start_07_00");	//Я просто собираю грибы.
		};
	};
	AI_Output(self,other,"DIA_Lobart_Start_05_10");	//Вот как? Желаю удачи. Но ты вряд ли найдешь грибы на моей ферме. А дальше идти не советую.
	AI_Output(self,other,"DIA_Lobart_Start_05_11");	//Недавно с гор спустились орки и уничтожили стоянку охотников.	Возможно, они все еще там.
	AI_Output(self,other,"DIA_Lobart_Start_05_12");	//Я третью ночь не сплю, а городской страже, похоже, плевать! Они приходят сюда, только чтобы собирать налоги!
	if (!Vino_Found)	{
		AI_Output(self,other,"DIA_Lobart_Start_05_20");	//Еще и Вино куда-то пропал... Это один из моих работников.
		IF (other.aivar[AIV_Gender] == FEMALE || C_HeroIs_Erol())	{
			AI_Output(self,other,"DIA_Lobart_Start_05_21");	//Пожалуйста, если встретишь его, передай, чтобы немедленно шел ко мне.
		}
		else	{
			AI_Output(self,other,"DIA_Lobart_Start_05_21a");	//Если встретишь этого остолопа, передай, чтобы немедленно тащил свою задницу ко мне.
		};
		Vino_Search = TRUE;
		B_LogEntry_Create(TOPIC_LostBau,LOG_MISSION,TOPIC_LostBau_Lobart);
		MIS_LostBau = LOG_Running;
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_Start_05_30");	//Слава Инносу, Вино вернулся. Я боялся, что и до него орки добрались...
		AI_Output(self,other,"DIA_Lobart_Start_05_31");	//Но если он не бросит пить, я его сам выставлю. Сколько можно терпеть его загулы?
		x = 1;	if (x == 1)	{
			B_GivePlayerXP(XP_VinoFound);
		};
	};
};

// ==================================================================
instance DIA_Lobart_FoundVino(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_FoundVino_cond;
	information = DIA_Lobart_FoundVino_info;
	description = "Вино вернулся.";
};
func int DIA_Lobart_FoundVino_cond()
{
	if ((Vino_Search == TRUE) && Vino_Found)	{	return TRUE;	};
};
func void DIA_Lobart_FoundVino_info()
{
	var int x; x = 0;
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Lobart_FoundVino_03_00");	//Вино вернулся.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Lobart_FoundVino_07_00");	//Вино вернулся.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Lobart_FoundVino_10_00");	//Вино вернулся.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Lobart_FoundVino_14_00");	//Вино вернулся.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Lobart_FoundVino_16_00");	//Вино вернулся.
	};
	AI_Output(self,other,"DIA_Lobart_FoundVino_05_01");	//Да, я видел... Я его чуть не придушил!
	AI_Output(self,other,"DIA_Lobart_FoundVino_05_02");	//Пропадать в такое время! Я же его уже почти похоронил!
	x = 1;	if (x == 1)	{
		B_GivePlayerXP(XP_VinoFound);
	};
	B_LogEntry(TOPIC_LostBau,TOPIC_LostBau_Told);
};


// ТОРГОВЛЯ ===================================================
instance DIA_Lobart_PreTrade(C_INFO)
{
	npc = BAU_950_Lobart;
	nr = 50;
	condition = DIA_Lobart_PreTrade_cond;
	information = DIA_Lobart_PreTrade_info;
	description = "Могу я купить у тебя продукты?";
};
func int DIA_Lobart_PreTrade_cond()
{
	if (Npc_KnowsInfo(other,DIA_Lobart_Start))	{	return TRUE;	};
};
func void DIA_Lobart_PreTrade_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Lobart_PreTrade_03_00");	//Могу я купить у тебя продукты?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Lobart_PreTrade_07_00");	//Могу я купить у тебя продукты?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Lobart_PreTrade_10_00");	//Могу я купить у тебя продукты?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Lobart_PreTrade_14_00");	//Могу я купить у тебя продукты?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Lobart_PreTrade_16_00");	//Могу я купить у тебя продукты?
	};
	AI_Output(self,other,"DIA_Lobart_PreTrade_05_01");	//Конечно. Но только за золото, я не собираюсь выменивать их на разное барахло.
	B_LogNote(Topic_Trader,TOPIC_Trader_Lobart);
};
//===================================================
instance DIA_Lobart_MRTrade(C_INFO)
{
	npc = BAU_950_Lobart;
	nr = 51;
	condition = DIA_Lobart_MRTrade_cond;
	information = DIA_Lobart_MRTrade_info;
	description = "(купить продукты)";
	permanent = TRUE;
	trade = TRUE;
};
func int DIA_Lobart_MRTrade_cond()
{
	if (Npc_KnowsInfo(other,DIA_Lobart_PreTrade))	{	return TRUE;	};
};
func void DIA_Lobart_MRTrade_info()
{
	B_GiveTradeInv_Lobart(self);
	B_Trade_BuyOnly();
	/*Info_ClearChoices(DIA_Lobart_MRTrade);
	Info_AddChoice(DIA_Lobart_MRTrade,Dialog_Back,DIA_Lobart_MRTrade_Back);
	Info_AddChoice(DIA_Lobart_MRTrade,B_GetPriceString("Сыр",Value_Cheese),DIA_Lobart_MRTrade_Cheese);
	Info_AddChoice(DIA_Lobart_MRTrade,B_GetPriceString("Колбаса",Value_Sausage),DIA_Lobart_MRTrade_Sausage);
	Info_AddChoice(DIA_Lobart_MRTrade,B_GetPriceString("Молоко",Value_Milk),DIA_Lobart_MRTrade_Milk);
	Info_AddChoice(DIA_Lobart_MRTrade,B_GetPriceString("Хлеб",Value_Bread),DIA_Lobart_MRTrade_Bread);
	*/
};
func void DIA_Lobart_MRTrade_Back()
{
	Info_ClearChoices(DIA_Lobart_MRTrade);
};
func void DIA_Lobart_MRTrade_NoGold()
{
	AI_Output(self,other,"DIA_Lobart_MRTrade_05_00");	//У тебя недостаточно золота.
};
func void DIA_Lobart_MRTrade_Bread()
{
	if (B_GiveGold(other,self, Value_Bread))	{
		B_GiveInvItems(self,other,ItFo_Bread,1);
	}
	else	{
		DIA_Lobart_MRTrade_NoGold();
	};
	Info_ClearChoices(DIA_Lobart_MRTrade);
};
func void DIA_Lobart_MRTrade_Milk()
{
	if (B_GiveGold(other,self, Value_Milk))	{
		B_GiveInvItems(self,other,ItFo_Milk,1);
	}
	else	{
		DIA_Lobart_MRTrade_NoGold();
	};
	Info_ClearChoices(DIA_Lobart_MRTrade);
};
func void DIA_Lobart_MRTrade_Sausage()
{
	if (B_GiveGold(other,self, Value_Sausage))	{
		B_GiveInvItems(self,other,ItFo_Sausage,1);
	}
	else	{
		DIA_Lobart_MRTrade_NoGold();
	};
	Info_ClearChoices(DIA_Lobart_MRTrade);
};
func void DIA_Lobart_MRTrade_Cheese()
{
	if (B_GiveGold(other,self, Value_Cheese))	{
		B_GiveInvItems(self,other,ItFo_Cheese,1);
	}
	else	{
		DIA_Lobart_MRTrade_NoGold();
	};
	Info_ClearChoices(DIA_Lobart_MRTrade);
};

//*/
