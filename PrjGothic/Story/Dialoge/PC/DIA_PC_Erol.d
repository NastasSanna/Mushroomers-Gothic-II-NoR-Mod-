

instance DIA_Erol_EXIT(DIA_Proto_End)
{
	npc = CMP_Erol;
};


// ===============================================
instance DIA_Erol_MR_Hello(C_INFO)
{
	npc = CMP_Erol;		nr = 1;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Erol_MR_Hello_info;
	description = "Ты тоже участвуешь в конкурсе Константино?";
};
func void DIA_Erol_MR_Hello_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Erol_MR_Hello_03_00");	//Ты тоже участвуешь в конкурсе Константино?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Erol_MR_Hello_07_00");	//Ты тоже участвуешь в конкурсе Константино?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Erol_MR_Hello_14_00");	//Ты тоже участвуешь в конкурсе Константино?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Erol_MR_Hello_16_00");	//Ты тоже участвуешь в конкурсе Константино?
	};
	AI_Output(self,other,"DIA_Erol_MR_Hello_10_01");	//Да. Я много путешествую по острову и хорошо его знаю.
};
// ===============================================
instance DIA_Erol_Advice(C_INFO)
{
	npc = CMP_Erol;		nr = 2;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Erol_Advice_info;
	description = "Есть для меня совет?";
	permanent = TRUE;
};
func void DIA_Erol_Advice_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Erol_Advice_03_00");	//Есть для меня совет?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Erol_Advice_07_00");	//Есть для меня совет?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Erol_Advice_14_00");	//Есть для меня совет?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Erol_Advice_16_00");	//Есть для меня совет?
	};
	AI_Output(self,other,"DIA_Erol_Advice_10_01");	//Не ходи в лес без оружия, не суйся в незнакомые пещеры.
	AI_Output(self,other,"DIA_Erol_Advice_10_02");	//А если ты про грибы - просто будь внимательнее. Они могут вырастать в любой ложбинке, на любом пне.
	AI_Output(self,other,"DIA_Erol_Advice_10_03");	//Некоторые грибы хорошо видно, а другие маскируются под траву и камни.
};
// ===============================================
instance DIA_Erol_PreTrade(C_INFO)
{
	npc = CMP_Erol;		nr = 3;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Erol_PreTrade_info;
	description = "Продашь мне свои грибы?";
};
func void DIA_Erol_PreTrade_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Erol_PreTrade_03_00");	//Продашь мне свои грибы?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Erol_PreTrade_07_00");	//Продашь мне свои грибы?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Erol_PreTrade_14_00");	//Продашь мне свои грибы?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Erol_PreTrade_16_00");	//Продашь мне свои грибы?
	};
	AI_Output(self,other,"DIA_Erol_PreTrade_10_01");	//С чего вдруг?
};

// ПОСЛЕ ОКОНЧАНИЯ КОНКУРСА ===============================
instance DIA_Erol_After_HeroWon(C_INFO)
{
	npc = CMP_Erol;		nr = 10;
	condition = DIA_Erol_After_HeroWon_cond;
	information = DIA_Erol_After_HeroWon_info;
	important = TRUE;
};
func int DIA_Erol_After_HeroWon_cond()
{
	if (!DIA_WhileCompetition_cond()
		&& (Competition_Result == Competition_Result_WON))
	{
		return TRUE;
	};
};
func void DIA_Erol_After_HeroWon_info()
{
	AI_Output(self,other,"DIA_Erol_After_HeroWon_10_01");	//Ну и ну! Победитель грибного конкурса, собственной персоной.
	AI_Output(self,other,"DIA_Erol_After_HeroWon_10_02");	//Мои искренние поздравления.
};
// ===============================================
instance DIA_Erol_After_Won(C_INFO)
{
	npc = CMP_Erol;		nr = 11;
	condition = DIA_Erol_After_Won_cond;
	information = DIA_Erol_After_Won_info;
	description = "Поздравляю с победой в конкурсе.";
};
func int DIA_Erol_After_Won_cond()
{
	if (!DIA_WhileCompetition_cond())
	{
		if ((C_CountResults() == Competition_Result_LOST) && Competition_Winner == Hlp_GetInstanceID(self))	{
			return TRUE;
		};
	};
};
func void DIA_Erol_After_Won_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Erol_After_Won_03_00");	//Поздравляю с победой в конкурсе.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Erol_After_Won_07_00");	//Поздравляю с победой в конкурсе.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Erol_After_Won_14_00");	//Поздравляю с победой в конкурсе.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Erol_After_Won_16_00");	//Поздравляю с победой в конкурсе.
	};
	AI_Output(self,other,"DIA_Erol_After_Won_10_01");	//Благодарю. Небось не ожидали от старика такой прыти?
	Info_ClearChoices(DIA_Erol_After_Won);
	if (other.aivar[AIV_Gender] == MALE)	{
		Info_AddChoice(DIA_Erol_After_Won,"Нет, я сразу понял, кто главный претендент.",DIA_Erol_After_Won_No);
	}
	else	{
		Info_AddChoice(DIA_Erol_After_Won,"Нет, я сразу поняла, кто главный претендент.",DIA_Erol_After_Won_No);
	};
	Info_AddChoice(DIA_Erol_After_Won,"Да, это было сюрпризом.",DIA_Erol_After_Won_Yes);
};
func void DIA_Erol_After_Won_Yes()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Erol_After_Won_Yes_03_00");	//Да, это было сюрпризом.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Erol_After_Won_Yes_07_00");	//Да, это было сюрпризом.
	} else if (hero.voice == 14)	{		//Тилл
		AI_Output(other,self,"DIA_Erol_After_Won_Yes_14_00");	//Да, это было сюрпризом.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Erol_After_Won_Yes_16_00");	//Да, это было сюрпризом.
	};
	Info_ClearChoices(DIA_Erol_After_Won);
};
func void DIA_Erol_After_Won_No()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Erol_After_Won_No_03_00");	//Нет, я сразу понял, кто главный претендент.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Erol_After_Won_No_07_00");	//Нет, я сразу понял, кто главный претендент.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Erol_After_Won_No_14_00");	//Нет, я сразу понял, кто главный претендент.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Erol_After_Won_No_16_00");	//Нет, я сразу поняла, кто главный претендент.
	};
	Info_ClearChoices(DIA_Erol_After_Won);
};


// ===============================================
instance DIA_Erol_After_Perm(C_INFO)
{
	npc = CMP_Erol;		nr = 12;
	condition = DIA_Erol_After_Perm_cond;
	information = DIA_Erol_After_Perm_info;
	description = "Чем теперь займешься?";
	permanent = TRUE;
};
func int DIA_Erol_After_Perm_cond()
{
	if (!DIA_WhileCompetition_cond() && Npc_KnowsInfo(other,DIA_Erol_MR_Hello))
	{
		return TRUE;
	};
};
func void DIA_Erol_After_Perm_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Erol_After_Perm_03_00");	//Чем теперь займешься?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Erol_After_Perm_07_00");	//Чем теперь займешься?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Erol_After_Perm_14_00");	//Чем теперь займешься?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Erol_After_Perm_16_00");	//Чем теперь займешься?
	};
	AI_Output(self,other,"DIA_Erol_After_Perm_10_01");	//Сейчас мне нужно закончить заказ Мага Воды Ватраса. Я собираю для него разные древности.
};
