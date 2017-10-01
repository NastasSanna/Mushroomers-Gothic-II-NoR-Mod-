

instance DIA_Elena_EXIT(DIA_Proto_End)
{
	npc = CMP_Elena;
};

// ===============================================
instance DIA_Elena_MR_Hello_Till(C_INFO)
{
	npc = CMP_Elena;		nr = 1;
	condition = DIA_Elena_MR_Hello_Till_cond;
	information = DIA_Elena_MR_Hello_Till_info;
	description = "Привет, Лен!";
};
func int DIA_Elena_MR_Hello_Till_cond()
{
	if (C_HeroIs_Till())	{
		return TRUE;
	};
};
func void DIA_Elena_MR_Hello_Till_info()
{
		AI_Output(other,self,"DIA_Elena_MR_Hello_Till_14_00");	//Привет, Лен!
	AI_Output(self,other,"DIA_Elena_MR_Hello_Till_16_01");	//Привет, Тилл! А ты вырос.
		AI_Output(other,self,"DIA_Elena_MR_Hello_Till_14_02");	//Ты тоже грибы собираешь?
	AI_Output(self,other,"DIA_Elena_MR_Hello_Till_16_03");	//Ага.
};
// ===============================================
instance DIA_Elena_MR_Hello(C_INFO)
{
	npc = CMP_Elena;		nr = 2;
	condition = DIA_Elena_MR_Hello_cond;
	information = DIA_Elena_MR_Hello_info;
	description = "Ты участвуешь в грибном конкурсе?";
};
func int DIA_Elena_MR_Hello_cond()
{
	if (!C_HeroIs_Till() && DIA_WhileCompetition_cond())	{
		return TRUE;
	};
};
func void DIA_Elena_MR_Hello_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Elena_MR_Hello_03_00");	//Ты участвуешь в грибном конкурсе?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Elena_MR_Hello_07_00");	//Ты участвуешь в грибном конкурсе?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Elena_MR_Hello_10_00");	//Ты участвуешь в грибном конкурсе?
	} else	{							//Сара
		AI_Output(other,self,"DIA_Elena_MR_Hello_16_00");	//Ты участвуешь в грибном конкурсе?
	};
	AI_Output(self,other,"DIA_Elena_MR_Hello_16_01");	//Да. Я неплохо знаю лес вокруг нашей фермы.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Elena_MR_Hello_03_02");	//Ты же дочь землевладельца Онара?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Elena_MR_Hello_07_02");	//Ты же дочь землевладельца Онара?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Elena_MR_Hello_10_02");	//Ты же дочь землевладельца Онара?
	} else	{							//Сара
		AI_Output(other,self,"DIA_Elena_MR_Hello_16_02");	//Ты же дочь землевладельца Онара?
	};
	AI_Output(self,other,"DIA_Elena_MR_Hello_16_03");	//Верно.
};
// ===============================================
instance DIA_Elena_Advice(C_INFO)
{
	npc = CMP_Elena;		nr = 3;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Elena_Advice_info;
	description = "Есть для меня совет?";
	permanent = TRUE;
};
func void DIA_Elena_Advice_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Elena_Advice_03_00");	//Есть для меня совет?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Elena_Advice_07_00");	//Есть для меня совет?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Elena_Advice_10_00");	//Есть для меня совет?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Elena_Advice_14_00");	//Есть для меня совет?
	} else	{							//Сара
		AI_Output(other,self,"DIA_Elena_Advice_16_00");	//Есть для меня совет?
	};
	AI_Output(self,other,"DIA_Elena_Advice_16_01");	//Внимательно смотри в траве и под деревьями. Грибы обычно не растут посреди дороги.
};
// ===============================================
instance DIA_Elena_PreTrade(C_INFO)
{
	npc = CMP_Elena;		nr = 4;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Elena_PreTrade_info;
	description = "Продашь мне свои грибы?";
};
func void DIA_Elena_PreTrade_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Elena_PreTrade_03_00");	//Продашь мне свои грибы?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Elena_PreTrade_07_00");	//Продашь мне свои грибы?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Elena_PreTrade_10_00");	//Продашь мне свои грибы?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Elena_PreTrade_14_00");	//Продашь мне свои грибы?
	} else	{							//Сара
		AI_Output(other,self,"DIA_Elena_PreTrade_16_00");	//Продашь мне свои грибы?
	};
	AI_Output(self,other,"DIA_Elena_PreTrade_16_01");	//Нет. Это будет нечестно.
};

// ПОСЛЕ ОКОНЧАНИЯ КОНКУРСА ===============================
instance DIA_Elena_After_HeroWon(C_INFO)
{
	npc = CMP_Elena;		nr = 10;
	condition = DIA_Elena_After_HeroWon_cond;
	information = DIA_Elena_After_HeroWon_info;
	important = TRUE;
};
func int DIA_Elena_After_HeroWon_cond()
{
	if (!DIA_WhileCompetition_cond()
		&& (Competition_Result == Competition_Result_WON))
	{
		return TRUE;
	};
};
func void DIA_Elena_After_HeroWon_info()
{
	AI_Output(self,other,"DIA_Elena_After_HeroWon_16_01");	//Тебе удалось обойти меня в конкурсе!
	//если еще у кого-то больше очков, чем у нее
	if ((MR_Counter_Elena < MR_Counter_Erol) || (MR_Counter_Elena < MR_Counter_Odo) || (MR_Counter_Elena < MR_Counter_Rupert)
		|| (MR_Counter_Elena < MR_Counter_Sarah) || (MR_Counter_Elena < MR_Counter_Talbin) || (MR_Counter_Elena < MR_Counter_Till))
	{
		AI_Output(self,other,"DIA_Elena_After_HeroWon_16_02");	//И не только тебе.
	};
	AI_Output(self,other,"DIA_Elena_After_HeroWon_16_03");	//А я-то думала, что лучше всех знаю грибные местечки в наших лесах.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Elena_After_HeroWon_03_04");	//Не хочешь меня поздравить?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Elena_After_HeroWon_07_04");	//Не хочешь меня поздравить?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Elena_After_HeroWon_10_04");	//Не хочешь меня поздравить?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Elena_After_HeroWon_14_04");	//Не хочешь меня поздравить?
	} else	{							//Сара
		AI_Output(other,self,"DIA_Elena_After_HeroWon_16_04");	//Не хочешь меня поздравить?
	};
	AI_Output(self,other,"DIA_Elena_After_HeroWon_16_05");	//Ладно уж, поздравляю.
};
// ===============================================
instance DIA_Elena_After_Won(C_INFO)
{
	npc = CMP_Elena;		nr = 11;
	condition = DIA_Elena_After_Won_cond;
	information = DIA_Elena_After_Won_info;
	description = "Это ты победила в конкурсе?";
};
func int DIA_Elena_After_Won_cond()
{
	if (!DIA_WhileCompetition_cond())
	{
		if ((C_CountResults() == Competition_Result_LOST) && Competition_Winner == Hlp_GetInstanceID(self))	{
			return TRUE;
		};
	};
};
func void DIA_Elena_After_Won_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Elena_After_Won_03_00");	//Это ты победила в конкурсе?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Elena_After_Won_07_00");	//Это ты победила в конкурсе?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Elena_After_Won_10_00");	//Это ты победила в конкурсе?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Elena_After_Won_14_00");	//Это ты победила в конкурсе?
	} else	{							//Сара
		AI_Output(other,self,"DIA_Elena_After_Won_16_00");	//Это ты победила в конкурсе?
	};
	AI_Output(self,other,"DIA_Elena_After_Won_16_01");	//Да. Я часто хожу за грибами и отлично знаю окрестные леса.
	Info_ClearChoices(DIA_Elena_After_Won);
	Info_AddChoice(DIA_Elena_After_Won,"Да ладно, тебе просто повезло.",DIA_Elena_After_Won_Tease);
	Info_AddChoice(DIA_Elena_After_Won,"Тогда поздравляю с заслуженной победой!",DIA_Elena_After_Won_Cheer);
};
func void DIA_Elena_After_Won_Cheer()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Elena_After_Won_Cheer_03_00");	//Тогда поздравляю с заслуженной победой!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Elena_After_Won_Cheer_07_00");	//Тогда поздравляю с заслуженной победой!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Elena_After_Won_Cheer_10_00");	//Тогда поздравляю с заслуженной победой!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Elena_After_Won_Cheer_14_00");	//(кисло) Тогда поздравляю с победой!
	} else	{							//Сара
		AI_Output(other,self,"DIA_Elena_After_Won_Cheer_16_00");	//Тогда поздравляю с заслуженной победой!
	};
	AI_Output(self,other,"DIA_Elena_After_Won_Cheer_16_01");	//Спасибо!
	Info_ClearChoices(DIA_Elena_After_Won);
};
func void DIA_Elena_After_Won_Tease()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Elena_After_Won_Tease_03_00");	//Да ладно, тебе просто повезло.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Elena_After_Won_Tease_07_00");	//Да ладно, тебе просто повезло.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Elena_After_Won_Tease_10_00");	//Да ладно, тебе просто повезло.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Elena_After_Won_Tease_14_00");	//Да ладно, тебе просто повезло.
	} else	{							//Сара
		AI_Output(other,self,"DIA_Elena_After_Won_Tease_16_00");	//Да ладно, тебе просто повезло.
	};
	AI_Output(self,other,"DIA_Elena_After_Won_Tease_16_01");	//Думай, что хочешь.
	Info_ClearChoices(DIA_Elena_After_Won);
};

// ===============================================
instance DIA_Elena_After_Perm(C_INFO)
{
	npc = CMP_Elena;		nr = 12;
	condition = DIA_Elena_After_Perm_cond;
	information = DIA_Elena_After_Perm_info;
	description = "Чем теперь будешь заниматься?";
	permanent = TRUE;
};
func int DIA_Elena_After_Perm_cond()
{
	if (!DIA_WhileCompetition_cond() && (Npc_KnowsInfo(other,DIA_Elena_MR_Hello) || Npc_KnowsInfo(other,DIA_Elena_MR_Hello_Till)))
	{
		return TRUE;
	};
};
func void DIA_Elena_After_Perm_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Elena_After_Perm_03_00");	//Чем теперь будешь заниматься?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Elena_After_Perm_07_00");	//Чем теперь будешь заниматься?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Elena_After_Perm_10_00");	//Чем теперь будешь заниматься?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Elena_After_Perm_14_00");	//Чем теперь будешь заниматься?
	} else	{							//Сара
		AI_Output(other,self,"DIA_Elena_After_Perm_16_00");	//Чем теперь будешь заниматься?
	};
	AI_Output(self,other,"DIA_Elena_After_Perm_16_01");	//Да уж без дела не останусь. На ферме всегда полно работы.
};
