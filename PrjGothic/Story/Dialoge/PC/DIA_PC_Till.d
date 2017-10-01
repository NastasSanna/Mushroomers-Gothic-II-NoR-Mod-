

instance DIA_Till_EXIT(DIA_Proto_End)
{
	npc = CMP_Till;
};


// ===============================================
instance DIA_Till_MR_Hello(C_INFO)
{
	npc = CMP_Till;		nr = 1;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Till_MR_Hello_info;
	description = "И ты грибы собираешь?";
};
func void DIA_Till_MR_Hello_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Till_MR_Hello_03_00");	//И ты грибы собираешь?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Till_MR_Hello_07_00");	//И ты грибы собираешь?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Till_MR_Hello_10_00");	//И ты грибы собираешь?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Till_MR_Hello_16_00");	//И ты грибы собираешь?
	};
	AI_Output(self,other,"DIA_Till_MR_Hello_14_01");	//Да. Не то, чтобы я очень хотел, но отец настоял.
	if (!C_HeroIs_Elena())	{
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Till_MR_Hello_03_02");	//А кто твой отец?
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Till_MR_Hello_07_02");	//А кто твой отец?
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Till_MR_Hello_10_02");	//А кто твой отец?
		} else	{							//Сара
			AI_Output(other,self,"DIA_Till_MR_Hello_16_02");	//А кто твой отец?
		};
		AI_Output(self,other,"DIA_Till_MR_Hello_14_03");	//Секоб. Он владеет одной из самых крупных ферм на острове.
	};
};
// ===============================================
instance DIA_Till_Advice(C_INFO)
{
	npc = CMP_Till;		nr = 2;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Till_Advice_info;
	description = "Знаешь что-нибудь о грибах?";
	permanent = TRUE;
};
func void DIA_Till_Advice_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Till_Advice_03_00");	//Знаешь что-нибудь о грибах?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Till_Advice_07_00");	//Знаешь что-нибудь о грибах?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Till_Advice_10_00");	//Знаешь что-нибудь о грибах?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Till_Advice_16_00");	//Знаешь что-нибудь о грибах?
	};
	AI_Output(self,other,"DIA_Till_Advice_14_01");	//Что их лучше не брать в рот, если не знаешь наверняка.
};
// ===============================================
instance DIA_Till_PreTrade(C_INFO)
{
	npc = CMP_Till;		nr = 3;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Till_PreTrade_info;
	description = "Продай мне свои грибы!";
};
func void DIA_Till_PreTrade_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Till_PreTrade_03_00");	//Продай мне свои грибы!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Till_PreTrade_07_00");	//Продай мне свои грибы!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Till_PreTrade_10_00");	//Продай мне свои грибы!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Till_PreTrade_16_00");	//Продай мне свои грибы!
	};
	AI_Output(self,other,"DIA_Till_PreTrade_14_01");	//Нет! Отец мне голову оторвет, если я не получу приз.
};

// ПОСЛЕ ОКОНЧАНИЯ КОНКУРСА ===============================
instance DIA_Till_After_HeroWon(C_INFO)
{
	npc = CMP_Till;		nr = 10;
	condition = DIA_Till_After_HeroWon_cond;
	information = DIA_Till_After_HeroWon_info;
	important = TRUE;
};
func int DIA_Till_After_HeroWon_cond()
{
	if (!DIA_WhileCompetition_cond()
		&& (Competition_Result == Competition_Result_WON))
	{
		return TRUE;
	};
};
func void DIA_Till_After_HeroWon_info()
{
	AI_Output(self,other,"DIA_Till_After_HeroWon_14_01");	//(кисло) Поздравляю с победой.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Till_After_HeroWon_03_00");	//Да ты не расстраивайся.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Till_After_HeroWon_07_00");	//Да ты не расстраивайся.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Till_After_HeroWon_10_00");	//Да ты не расстраивайся.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Till_After_HeroWon_16_00");	//Да ты не расстраивайся.
	};
	AI_Output(self,other,"DIA_Till_After_HeroWon_14_02");	//Легко тебе говорить!
};
// ===============================================
instance DIA_Till_After_Won(C_INFO)
{
	npc = CMP_Till;		nr = 11;
	condition = DIA_Till_After_Won_cond;
	information = DIA_Till_After_Won_info;
	important = TRUE;
};
func int DIA_Till_After_Won_cond()
{
	if (!DIA_WhileCompetition_cond())
	{
		if ((C_CountResults() == Competition_Result_LOST) && Competition_Winner == Hlp_GetInstanceID(self))	{
			return TRUE;
		};
	};
};
func void DIA_Till_After_Won_info()
{
	AI_Output(self,other,"DIA_Till_After_Won_14_01");	//Знаешь? Я выиграл конкурс! Я лучший грибник Хориниса!
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Till_After_Won_03_02");	//И как оно - быть лучшим грибником?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Till_After_Won_07_02");	//И как оно - быть лучшим грибником?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Till_After_Won_10_02");	//И как оно - быть лучшим грибником?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Till_After_Won_16_02");	//И как оно - быть лучшим грибником?
	};
	AI_Output(self,other,"DIA_Till_After_Won_14_03");	//Ну, это... Как обычно, только ты лучше остальных.
};

// ===============================================
instance DIA_Till_After_Perm(C_INFO)
{
	npc = CMP_Till;		nr = 12;
	condition = DIA_Till_After_Perm_cond;
	information = DIA_Till_After_Perm_info;
	description = "Что ты теперь будешь делать?";
	permanent = TRUE;
};
func int DIA_Till_After_Perm_cond()
{
	if (!DIA_WhileCompetition_cond() && Npc_KnowsInfo(other,DIA_Till_MR_Hello))
	{
		return TRUE;
	};
};
func void DIA_Till_After_Perm_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Till_After_Perm_03_00");	//Что ты теперь будешь делать?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Till_After_Perm_07_00");	//Что ты теперь будешь делать?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Till_After_Perm_10_00");	//Что ты теперь будешь делать?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Till_After_Perm_16_00");	//Что ты теперь будешь делать?
	};
	if (!C_HeroIs_Elena())	{
		AI_Output(self,other,"DIA_Till_After_Perm_14_01");	//А тебе какое дело?
	}
	else	{
		AI_Output(self,other,"DIA_Till_After_Perm_14_02");	//Отец опять заставит работать на ферме. Но когда-нибудь я буду сам тут командовать!
	};
};
