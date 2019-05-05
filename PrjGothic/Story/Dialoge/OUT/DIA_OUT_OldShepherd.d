
instance DIA_OldShepherd_EXIT(DIA_Proto_End)
{
	npc = OUT_1201_OldShepherd;
};

//==================================================
instance DIA_OldShepherd_Hello(C_INFO)
{
	npc = OUT_1201_OldShepherd;
	condition = DIA_WhenAsked_cond;
	information = DIA_OldShepherd_MR_Hello_Info;
	important = TRUE;
};
func void DIA_OldShepherd_MR_Hello_Info()
{
	AI_Output(self,other,"DIA_OldShepherd_MR_Hello_01_00");	//Приветствую! Давненько ко мне гости не захаживали.
};


//==================================================
instance DIA_OldShepherd_HowAU(C_INFO)
{
	npc = OUT_1201_OldShepherd;							nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_OldShepherd_HowAU_Info;
	description = "Как поживаешь?";
};
func void DIA_OldShepherd_HowAU_Info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_03_00");	//Как поживаешь?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_07_00");	//Как поживаешь?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_10_00");	//Как поживаешь?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_14_00");	//Как поживаешь?
	} else	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_16_00");	//Как поживаешь?
	};
	AI_Output(self,other,"DIA_OldShepherd_HowAU_01_01");	//Не жалуюсь, пока спина не ноет. А руки-ноги еще держат и ходят.
	if (OldShepherdSheeps_Dead_Cnt <= 3)	{
		AI_Output(self,other,"DIA_OldShepherd_HowAU_01_02");	//Сырку не хочешь? У меня много, не стесняйся.
		Info_ClearChoices(DIA_OldShepherd_HowAU);
		Info_AddChoice(DIA_OldShepherd_HowAU,"Нет, спасибо.",DIA_OldShepherd_HowAU_No);
		Info_AddChoice(DIA_OldShepherd_HowAU,"Не откажусь.",DIA_OldShepherd_HowAU_Yes);
	};
};
func void DIA_OldShepherd_HowAU_No()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_No_03_00");	//Нет, спасибо.
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_No_07_00");	//Нет, спасибо.
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_No_10_00");	//Нет, спасибо.
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_No_14_00");	//Нет, спасибо.
	} else	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_No_16_00");	//Нет, спасибо.
	};
	AI_Output(self,other,"DIA_OldShepherd_HowAU_No_01_01");	//Как хочешь.
	Info_ClearChoices(DIA_OldShepherd_HowAU);
};
func void DIA_OldShepherd_HowAU_Yes()
{
	var int x; x = 0;
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_Yes_03_00");	//Не откажусь.
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_Yes_07_00");	//Не откажусь.
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_Yes_10_00");	//Не откажусь.
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_Yes_14_00");	//Не откажусь.
	} else	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_Yes_16_00");	//Не откажусь.
	};
	AI_Output(self,other,"DIA_OldShepherd_HowAU_Yes_01_01");	//Вот, угощайся.
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other,ItFo_Cheese_OldShepherd,1);
	};
	AI_Output(other,self,"XXX");	//
	B_UseItem(other,ItFo_Cheese_OldShepherd);
	AI_Output(self,other,"DIA_OldShepherd_HowAU_Yes_01_02");	//Нравится?
	Info_ClearChoices(DIA_OldShepherd_HowAU);
	Info_AddChoice(DIA_OldShepherd_HowAU,"Какой-то вкус странный...",DIA_OldShepherd_HowAU_DisLike);
	Info_AddChoice(DIA_OldShepherd_HowAU,"Да, очень.",DIA_OldShepherd_HowAU_Like);
};
func void DIA_OldShepherd_HowAU_Like()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_Like_03_00");	//Да, очень.
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_Like_07_00");	//Да, очень.
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_Like_10_00");	//Да, очень.
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_Like_14_00");	//Да, очень.
	} else	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_Like_16_00");	//Да, очень.
	};
	Mdl_StartFaceAni(self,"S_FRIENDLY",1.0,5);
	AI_Output(self,other,"DIA_OldShepherd_HowAU_Like_01_01");	//(улыбается) То-то и оно! Я варю этот сыр так, как это делали прадеды моих прадедов.
	AI_Output(self,other,"DIA_OldShepherd_HowAU_Like_01_02");	//Вряд ли кто-то еще на острове хранит эту традицию...
	Info_ClearChoices(DIA_OldShepherd_HowAU);
	OldShepherd_MaxCheese = 4;
};
func void DIA_OldShepherd_HowAU_DisLike()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_DisLike_03_00");	//Какой-то вкус странный...
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_DisLike_07_00");	//Какой-то вкус странный...
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_DisLike_10_00");	//Какой-то вкус странный...
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_DisLike_14_00");	//Какой-то вкус странный...
	} else	{
		AI_Output(other,self,"DIA_OldShepherd_HowAU_DisLike_16_00");	//Какой-то вкус странный...
	};
	Mdl_StartFaceAni(self,"T_HURT",0.5,2);
	AI_Output(self,other,"DIA_OldShepherd_HowAU_DisLike_01_01");	//Охо-хо-хо. То ли я варить разучился, то ли вкусы у людей поменялись...
	AI_Output(self,other,"DIA_OldShepherd_HowAU_DisLike_01_02");	//Я ведь, наверное, последний, кто варит сыр по старинному рецепту нашего острова.
	Mdl_StartFaceAni(self,"S_NEUTRAL",1.0,-1);
	Info_ClearChoices(DIA_OldShepherd_HowAU);
	OldShepherd_MaxCheese = 2;
};

//==================================================
var int OldShepherd_Cheese_Day;
instance DIA_OldShepherd_MoreCheese(C_INFO)
{
	npc = OUT_1201_OldShepherd;							nr = 10;
	condition = DIA_OldShepherd_MoreCheese_Cond;
	information = DIA_OldShepherd_MoreCheese_Info;
	description = "У тебя есть еще сыр?";
};
func int DIA_OldShepherd_MoreCheese_Cond()
{
	if (Npc_KnowsInfo(other,DIA_OldShepherd_HowAU))	{return TRUE;};
};
func int DIA_OldShepherd_NoSheeps()
{
	if (OldShepherdSheeps_Dead_Cnt > 3)	{
		AI_Output(self,other,"DIA_OldShepherd_NoSheeps_01_01");	//Прости, но у меня теперь недостаточно молока. Мои овцы, мои кормилицы...
		AI_TurnAway(self,other);
		AI_StopProcessInfos(self);
		return TRUE;
	};
	return FALSE;
};
func void DIA_OldShepherd_MoreCheese_Info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_OldShepherd_MoreCheese_03_00");	//У тебя есть еще сыр?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_OldShepherd_MoreCheese_07_00");	//У тебя есть еще сыр?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_OldShepherd_MoreCheese_10_00");	//У тебя есть еще сыр?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_OldShepherd_MoreCheese_14_00");	//У тебя есть еще сыр?
	} else	{
		AI_Output(other,self,"DIA_OldShepherd_MoreCheese_16_00");	//У тебя есть еще сыр?
	};
	//нет овец - нет сыра
	if (!DIA_OldShepherd_NoSheeps())	{
		AI_Output(self,other,"DIA_OldShepherd_MoreCheese_01_01");		//Конечно, держи.
		B_GiveInvItems(self,other,ItFo_Cheese_OldShepherd,1 + C_Random(OldShepherd_MaxCheese));
		AI_Output(self,other,"DIA_OldShepherd_MoreCheese_01_02");		//Можешь приходить хоть каждый день, я с удовольствием с тобой поделюсь.
		B_LogNote(Topic_Misk,TOPIC_Misk_OldShepherdCheese);
		OldShepherd_Cheese_Day = Wld_GetDay() + 1;
	};
};
//==================================================
instance DIA_OldShepherd_AskCheese(C_INFO)
{
	npc = OUT_1201_OldShepherd;							nr = 11;
	condition = DIA_OldShepherd_AskCheese_Cond;
	information = DIA_OldShepherd_AskCheese_Info;
	description = "Ты дашь мне еще сыра?";
	permanent = TRUE;
};
func int DIA_OldShepherd_AskCheese_Cond()
{
	if (Npc_KnowsInfo(other,DIA_OldShepherd_MoreCheese))	{return TRUE;};
};
func void DIA_OldShepherd_AskCheese_Info()
{
	var int x; x = 0;
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_OldShepherd_AskCheese_03_00");	//Ты дашь мне еще сыра?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_OldShepherd_AskCheese_07_00");	//Ты дашь мне еще сыра?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_OldShepherd_AskCheese_10_00");	//Ты дашь мне еще сыра?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_OldShepherd_AskCheese_14_00");	//Ты дашь мне еще сыра?
	} else	{
		AI_Output(other,self,"DIA_OldShepherd_AskCheese_16_00");	//Ты дашь мне еще сыра?
	};
	//нет овец - нет сыра
	if (!DIA_OldShepherd_NoSheeps())	{
		if (OldShepherd_Cheese_Day <= Wld_GetDay())	{
			AI_Output(self,other,"DIA_OldShepherd_AskCheese_01_01");	//Угощайся.
			B_GiveInvItems(self,other,ItFo_Cheese_OldShepherd,1 + C_Random(OldShepherd_MaxCheese));
		}
		else
		{
			AI_Output(self,other,"DIA_OldShepherd_AskCheese_01_02");	//Что, понравился? Извини, но сегодня сыр закончился. Приходи завтра.
		};
		OldShepherd_Cheese_Day = Wld_GetDay() + 1;
	};
};

//==================================================
var int DIA_OldShepherd_Tries;
instance DIA_OldShepherd_AUAlone(C_INFO)
{
	npc = OUT_1201_OldShepherd;							nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_OldShepherd_AUAlone_Info;
	description = "Ты живешь здесь один?";
};
func void DIA_OldShepherd_AUAlone_Info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_OldShepherd_AUAlone_03_00");	//Ты живешь здесь один?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_OldShepherd_AUAlone_07_00");	//Ты живешь здесь один?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_OldShepherd_AUAlone_10_00");	//Ты живешь здесь один?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_OldShepherd_AUAlone_14_00");	//Ты живешь здесь один?
	} else	{
		AI_Output(other,self,"DIA_OldShepherd_AUAlone_16_00");	//Ты живешь здесь один?
	};
	AI_Output(self,other,"DIA_OldShepherd_AUAlone_01_01");			//Да, с тех пор как старушку свою в последний путь проводил.
	if (OldShepherdSheeps_Dead_Cnt == 0)	{
		AI_Output(self,other,"DIA_OldShepherd_AUAlone_01_02");		//Правда, со мной всегда мои овцы. Знаешь, сколько их у меня?
		Info_ClearChoices(DIA_OldShepherd_AUAlone);
		Info_AddChoice(DIA_OldShepherd_AUAlone,"Не знаю.",DIA_OldShepherd_CountSheepDontKnow);
		Info_AddChoice(DIA_OldShepherd_AUAlone,"Восемь.",DIA_OldShepherd_CountSheep8);
		Info_AddChoice(DIA_OldShepherd_AUAlone,"Семь.",DIA_OldShepherd_CountSheep7);
		Info_AddChoice(DIA_OldShepherd_AUAlone,"Шесть.",DIA_OldShepherd_CountSheep6);
		Info_AddChoice(DIA_OldShepherd_AUAlone,"Пять.",DIA_OldShepherd_CountSheep5);
		Info_AddChoice(DIA_OldShepherd_AUAlone,"Четыре.",DIA_OldShepherd_CountSheep4);
	};		
};
var int OldShepherd_Count_Attempts;
func void DIA_OldShepherd_CountSheepWrong()
{
	AI_Output(self,other,"DIA_OldShepherd_AUAlone_Wrong_01_01");	//Эх ты. До стольки годов дожить, и до семи считать не научиться...
	AI_Output(self,other,"DIA_OldShepherd_AUAlone_Wrong_01_02");	//Шесть овечек и один барашек, все тут.
	Info_ClearChoices(DIA_OldShepherd_AUAlone);
};
func void DIA_OldShepherd_CountSheepDontKnow()
{
	OldShepherd_Count_Attempts += 1;
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheepDontKnow_03_00");	//Не знаю.
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheepDontKnow_07_00");	//Не знаю.
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheepDontKnow_10_00");	//Не знаю.
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheepDontKnow_14_00");	//Не знаю.
	} else	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheepDontKnow_16_00");	//Не знаю.
	};
	if (OldShepherd_Count_Attempts >= 2)	{
		DIA_OldShepherd_CountSheepWrong();
	}
	else {		
		AI_Output(self,other,"DIA_OldShepherd_CountSheepDontKnow_01_01");	//А ты попробуй угадать.
	};
};
func void DIA_OldShepherd_CountSheep4()
{
	OldShepherd_Count_Attempts += 1;
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep4_03_00");	//Четыре.
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep4_07_00");	//Четыре.
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep4_10_00");	//Четыре.
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep4_14_00");	//Четыре.
	} else	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep4_16_00");	//Четыре.
	};
	if (OldShepherd_Count_Attempts >= 2)	{
		DIA_OldShepherd_CountSheepWrong();
	}
	else {		
		AI_Output(self,other,"DIA_OldShepherd_CountSheep4_01_01");	//Неправильно. Бери выше.
	};
};
func void DIA_OldShepherd_CountSheep5()
{
	OldShepherd_Count_Attempts += 1;
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep5_03_00");	//Пять.
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep5_07_00");	//Пять.
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep5_10_00");	//Пять.
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep5_14_00");	//Пять.
	} else	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep5_16_00");	//Пять.
	};
	if (OldShepherd_Count_Attempts >= 2)	{
		DIA_OldShepherd_CountSheepWrong();
	}
	else {		
		AI_Output(self,other,"DIA_OldShepherd_CountSheep5_01_01");	//Нет. Чуть-чуть побольше.
	};
};
func void DIA_OldShepherd_CountSheep6()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep6_03_00");	//Шесть.
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep6_07_00");	//Шесть.
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep6_10_00");	//Шесть.
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep6_14_00");	//Шесть.
	} else	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep6_16_00");	//Шесть.
	};
	AI_Output(self,other,"DIA_OldShepherd_CountSheep6_01_01");	//Точно. Шесть овец и один баран.
	B_GivePlayerXP(XP_OldShepherd_Count6 - (OldShepherd_Count_Attempts - 1) * XP_OldShepherd_Count_NiceTry);
	Info_ClearChoices(DIA_OldShepherd_AUAlone);
};
func void DIA_OldShepherd_CountSheep7()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep7_03_00");	//Семь.
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep7_07_00");	//Семь.
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep7_10_00");	//Семь.
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep7_14_00");	//Семь.
	} else	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep7_16_00");	//Семь.
	};
	AI_Output(self,other,"DIA_OldShepherd_CountSheep7_01_01");	//Правильно. Только одна из этих овец - баран (подмигивает).
	B_GivePlayerXP(XP_OldShepherd_Count7 - (OldShepherd_Count_Attempts - 1) * XP_OldShepherd_Count_NiceTry);
	Info_ClearChoices(DIA_OldShepherd_AUAlone);
};
func void DIA_OldShepherd_CountSheep8()
{
	OldShepherd_Count_Attempts += 1;
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep8_03_00");	//Восемь.
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep8_07_00");	//Восемь.
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep8_10_00");	//Восемь.
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep8_14_00");	//Восемь.
	} else	{
		AI_Output(other,self,"DIA_OldShepherd_CountSheep8_16_00");	//Восемь.
	};
	if (OldShepherd_Count_Attempts >= 2)	{
		DIA_OldShepherd_CountSheepWrong();
	}
	else {		
		AI_Output(self,other,"DIA_OldShepherd_CountSheep8_01_01");	//Многовато будет.
	};
};


//==================================================
instance DIA_OldShepherd_HowIsUrBack(C_INFO)
{
	npc = OUT_1201_OldShepherd;							nr = 3;
	condition = DIA_OldShepherd_HowIsUrBack_Cond;
	information = DIA_OldShepherd_HowIsUrBack_Info;
	description = "Как твоя спина?";
	permanent = TRUE;
};
func int DIA_OldShepherd_HowIsUrBack_Cond()
{
	if (Npc_KnowsInfo(other,DIA_OldShepherd_HowAU))	{	return TRUE;};
};
func void DIA_OldShepherd_HowIsUrBack_Info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_OldShepherd_HowIsUrBack_03_00");	//Как твоя спина?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_OldShepherd_HowIsUrBack_07_00");	//Как твоя спина?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_OldShepherd_HowIsUrBack_10_00");	//Как твоя спина?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_OldShepherd_HowIsUrBack_14_00");	//Как твоя спина?
	} else	{
		AI_Output(other,self,"DIA_OldShepherd_HowIsUrBack_16_00");	//Как твоя спина?
	};
	if (Wld_IsRaining())	{
		AI_Output(self,other,"DIA_OldShepherd_HowIsUrBack_01_01");	//Ох, и не спрашивай. Как дождь, так я на куски разваливаюсь.
	}
	else	{
		AI_Output(self,other,"DIA_OldShepherd_HowIsUrBack_01_02");	//В порядке, спасибо.
	};
};
