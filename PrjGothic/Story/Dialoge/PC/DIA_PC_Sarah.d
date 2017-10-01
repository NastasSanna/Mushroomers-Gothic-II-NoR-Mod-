

instance DIA_Sarah_EXIT(DIA_Proto_End)
{
	npc = CMP_Sarah;
};


// ===============================================
instance DIA_Sarah_MR_Hello(C_INFO)
{
	npc = CMP_Sarah;		nr = 1;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Sarah_MR_Hello_info;
	description = "Так ты тоже участвушь в конкурсе Константино?";
};
func void DIA_Sarah_MR_Hello_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Sarah_MR_Hello_03_00");	//Так ты тоже участвушь в конкурсе Константино?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Sarah_MR_Hello_07_00");	//Так ты тоже участвушь в конкурсе Константино?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Sarah_MR_Hello_10_00");	//Так ты тоже участвушь в конкурсе Константино?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Sarah_MR_Hello_14_00");	//Так ты тоже участвушь в конкурсе Константино?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Sarah_MR_Hello_16_00");	//Так ты тоже участвушь в конкурсе Константино?
	};
	AI_Output(self,other,"DIA_Sarah_MR_Hello_16_01");	//Да, я решила, что мне не повредит развеяться.
};
// ===============================================
instance DIA_Sarah_Advice(C_INFO)
{
	npc = CMP_Sarah;		nr = 2;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Sarah_Advice_info;
	description = "Можешь дать совет?";
	permanent = TRUE;
};
func void DIA_Sarah_Advice_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Sarah_Advice_03_00");	//Можешь дать совет?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Sarah_Advice_07_00");	//Можешь дать совет?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Sarah_Advice_10_00");	//Можешь дать совет?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Sarah_Advice_14_00");	//Можешь дать совет?
	} else	{							//Елена
		AI_Output(other,self,"DIA_Sarah_Advice_16_00");	//Можешь дать совет?
	};
	AI_Output(self,other,"DIA_Sarah_Advice_16_01");	//Если тебе где-то попался гриб - попробуй вернуться на то же место через несколько дней.
	AI_Output(self,other,"DIA_Sarah_Advice_16_02");	//Он может вырасти снова.
};
// ===============================================
instance DIA_Sarah_PreTrade(C_INFO)
{
	npc = CMP_Sarah;		nr = 3;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Sarah_PreTrade_info;
	description = "Продай мне свои грибы.";
};
func void DIA_Sarah_PreTrade_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Sarah_PreTrade_03_00");	//Продай мне свои грибы.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Sarah_PreTrade_07_00");	//Продай мне свои грибы.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Sarah_PreTrade_10_00");	//Продай мне свои грибы.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Sarah_PreTrade_14_00");	//Продай мне свои грибы.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Sarah_PreTrade_16_00");	//Продай мне свои грибы.
	};
	AI_Output(self,other,"DIA_Sarah_PreTrade_16_01");	//Нет. Я тоже хочу победить!
};

// ПОСЛЕ ОКОНЧАНИЯ КОНКУРСА ===============================
instance DIA_Sarah_After_HeroWon(C_INFO)
{
	npc = CMP_Sarah;		nr = 10;
	condition = DIA_Sarah_After_HeroWon_cond;
	information = DIA_Sarah_After_HeroWon_info;
	important = TRUE;
};
func int DIA_Sarah_After_HeroWon_cond()
{
	if (!DIA_WhileCompetition_cond()
		&& (Competition_Result == Competition_Result_WON))
	{
		return TRUE;
	};
};
func void DIA_Sarah_After_HeroWon_info()
{
	AI_Output(self,other,"DIA_Sarah_After_HeroWon_10_01");	//(бодро) Салют победителю конкурса!
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Sarah_After_HeroWon_03_02");	//Ты что, совсем не расстроилась из-за проигрыша?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Sarah_After_HeroWon_07_02");	//Ты что, совсем не расстроилась из-за проигрыша?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Sarah_After_HeroWon_10_02");	//Ты что, совсем не расстроилась из-за проигрыша?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Sarah_After_HeroWon_14_02");	//Ты что, совсем не расстроилась из-за проигрыша?
	} else	{							//Елена
		AI_Output(other,self,"DIA_Sarah_After_HeroWon_16_02");	//Ты что, совсем не расстроилась из-за проигрыша?
	};

	if (other.aivar[AIV_Gender] == FEMALE)	{
		AI_Output(self,other,"DIA_Sarah_After_HeroWon_10_03");	//Расстроилась, конечно. Но это не отменяет того факта, что ты молодец!
	}
	else	{
		AI_Output(self,other,"DIA_Sarah_After_HeroWon_10_04");	//Было бы из-за чего! Да и мы все неплохо подзаработали.
	};
};
// ===============================================
instance DIA_Sarah_After_Won(C_INFO)
{
	npc = CMP_Sarah;		nr = 11;
	condition = DIA_Sarah_After_Won_cond;
	information = DIA_Sarah_After_Won_info;
	description = "Это ты выиграла конкурс?";
};
func int DIA_Sarah_After_Won_cond()
{
	if (!DIA_WhileCompetition_cond())
	{
		if ((C_CountResults() == Competition_Result_LOST) && Competition_Winner == Hlp_GetInstanceID(self))	{
			return TRUE;
		};
	};
};
func void DIA_Sarah_After_Won_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Sarah_After_Won_03_00");	//Это ты выиграла конкурс?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Sarah_After_Won_07_00");	//Это ты выиграла конкурс?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Sarah_After_Won_10_00");	//Это ты выиграла конкурс?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Sarah_After_Won_14_00");	//Это ты выиграла конкурс?
	} else	{							//Елена
		AI_Output(other,self,"DIA_Sarah_After_Won_16_00");	//Это ты выиграла конкурс?
	};
	AI_Output(self,other,"DIA_Sarah_After_Won_10_01");	//(гордо) Да, я. А что?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Sarah_After_Won_03_02");	//Просто хотел поздравить.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Sarah_After_Won_07_02");	//Просто хотел поздравить.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Sarah_After_Won_10_02");	//Просто хотел поздравить.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Sarah_After_Won_14_02");	//Просто хотел поздравить.
	} else	{							//Елена
		AI_Output(other,self,"DIA_Sarah_After_Won_16_02");	//Просто хотела поздравить.
	};
	AI_Output(self,other,"DIA_Sarah_After_Won_10_03");	//Спасибо.
};

// ===============================================
instance DIA_Sarah_After_preTrade(C_INFO)
{
	npc = CMP_Sarah;		nr = 12;
	condition = DIA_Sarah_After_preTrade_cond;
	information = DIA_Sarah_After_preTrade_info;
	description = "Что будешь теперь делать?";
};
func int DIA_Sarah_After_preTrade_cond()
{
	if (!DIA_WhileCompetition_cond() && Npc_KnowsInfo(other,DIA_Sarah_MR_Hello))
	{
		return TRUE;
	};
};
func void DIA_Sarah_After_preTrade_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Sarah_After_preTrade_03_00");	//Что будешь теперь делать?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Sarah_After_preTrade_07_00");	//Что будешь теперь делать?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Sarah_After_preTrade_10_00");	//Что будешь теперь делать?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Sarah_After_preTrade_14_00");	//Что будешь теперь делать?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Sarah_After_preTrade_16_00");	//Что будешь теперь делать?
	};
	AI_Output(self,other,"DIA_Sarah_After_preTrade_10_01");	//Вернусь к торговле. Кстати, хочешь чего-нибудь купить?
	Sarah_Trade = TRUE;
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Sarah);
};

// ===============================================
instance DIA_Sarah_After_Trade(C_INFO)
{
	npc = CMP_Sarah;		nr = 50;
	condition = DIA_Sarah_After_Trade_cond;
	information = DIA_Sarah_After_Trade_info;
	description = "(торговать)";
	permanent = TRUE;
	trade = TRUE;
};
func int DIA_Sarah_After_Trade_cond()
{
	if (Sarah_Trade)
	{
		return TRUE;
	};
};
func void DIA_Sarah_After_Trade_info()
{
	B_GiveTradeInv_Sarah(self);
};
