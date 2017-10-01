
//===================================================
instance DIA_Fabio_HasYew(C_Info)
{
	npc = VLK_442_Arbeiter;
	nr = 1;
	condition = DIA_Fabio_HasYew_Cond;
	information = DIA_Fabio_HasYew_Info;
	description = "Скажи, у вас есть тис?";
};
func int DIA_Fabio_HasYew_Cond()
{
	if ((MIS_FellanGoHome == LOG_Running)
		&& Npc_KnowsInfo(other,DIA_Thorben_HammerWood))	{
		return TRUE;
	};
};

func void DIA_Fabio_HasYew_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fabio_HasYew_03_00");	//Скажи, у вас есть тис?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fabio_HasYew_07_00");	//Скажи, у вас есть тис?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fabio_HasYew_10_00");	//Скажи, у вас есть тис?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fabio_HasYew_14_00");	//Скажи, у вас есть тис?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fabio_HasYew_16_00");	//Скажи, у вас есть тис?
	};
	AI_Output(self,other,"DIA_Fabio_HasYew_06_01");	//Есть еще. Нынче работы немного, и мы его почти не тратим.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fabio_HasYew_03_02");	//Можешь продать? Для рукоятки молотка.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fabio_HasYew_07_02");	//Можешь продать? Для рукоятки молотка.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fabio_HasYew_10_02");	//Можешь продать? Для рукоятки молотка.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fabio_HasYew_14_02");	//Можешь продать? Для рукоятки молотка.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fabio_HasYew_16_02");	//Можешь продать? Для рукоятки молотка.
	};
	AI_Output(self,other,"DIA_Fabio_HasYew_06_03");	//Почему бы и нет. За 50 золотых этот чурбак будет твоим.
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerHafen);
};

//===================================================
instance DIA_Fabio_BuyYew(C_Info)
{
	npc = VLK_442_Arbeiter;
	nr = 2;
	condition = DIA_Fabio_BuyYew_Cond;
	information = DIA_Fabio_BuyYew_Info;
	description = "Держи 50 золотых.";
	permanent = TRUE;
};
func int DIA_Fabio_BuyYew_Cond()
{
	if ((MIS_FellanGoHome == LOG_Running)
		&& Npc_KnowsInfo(other,DIA_Fabio_HasYew)
		&& !MIS_FellanGoHome_YewGot)	{
		return TRUE;
	};
};

func void DIA_Fabio_BuyYew_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fabio_BuyYew_03_00");	//Держи 50 золотых.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fabio_BuyYew_07_00");	//Держи 50 золотых.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fabio_BuyYew_10_00");	//Держи 50 золотых.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fabio_BuyYew_14_00");	//Держи 50 золотых.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fabio_BuyYew_16_00");	//Держи 50 золотых.
	};
	if (B_GiveGold(other,self,50))	{
		AI_Output(self,other,"DIA_Fabio_BuyYew_06_01");	//Приятно иметь с тобой дело.
		B_GiveInvItems(self,other,ItMi_YewPiece,1);
		MIS_FellanGoHome_YewGot = TRUE;
		B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerYew);
		B_GivePlayerXP(XP_Fellan_YewGot);
	}
	else	{
		AI_Output(self,other,"DIA_Fabio_BuyYew_06_02");	//Где? Я еще не разучился считать.
	};
};

//===================================================
instance DIA_Fabio_TooExpensive(C_Info)
{
	npc = VLK_442_Arbeiter;
	nr = 3;
	condition = DIA_Fabio_TooExpensive_Cond;
	information = DIA_Fabio_TooExpensive_Info;
	description = "50 золотых? Это грабеж!";
};
func int DIA_Fabio_TooExpensive_Cond()
{
	if ((MIS_FellanGoHome == LOG_Running)
		&& Npc_KnowsInfo(other,DIA_Fabio_HasYew)
		&& !MIS_FellanGoHome_YewGot)	{
		return TRUE;
	};
};

func void DIA_Fabio_TooExpensive_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fabio_TooExpensive_03_00");	//50 золотых? Это грабеж!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fabio_TooExpensive_07_00");	//50 золотых? Это грабеж!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fabio_TooExpensive_10_00");	//50 золотых? Это грабеж!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fabio_TooExpensive_14_00");	//50 золотых? Это грабеж!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fabio_TooExpensive_16_00");	//50 золотых? Это грабеж!
	};
	AI_Output(self,other,"DIA_Fabio_TooExpensive_06_01");	//Да, и грабитель здесь ты.
	AI_Output(self,other,"DIA_Fabio_TooExpensive_06_02");	//Тис нынче редок, я бы ни за что не продал его, будь у нас работа.
	AI_Output(self,other,"DIA_Fabio_TooExpensive_06_03");	//Но мы имеем то, что имеем, поэтому я отдаю его тебе почти за бесценок.
};

