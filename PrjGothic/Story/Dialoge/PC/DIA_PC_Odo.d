

instance DIA_Odo_EXIT(DIA_Proto_End)
{
	npc = CMP_Odo;
};

// ===============================================
instance DIA_Odo_MR_Hello(C_INFO)
{
	npc = CMP_Odo;		nr = 1;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Odo_MR_Hello_info;
	description = "Ты участвуешь в сборе грибов для Константино?";
};
func void DIA_Odo_MR_Hello_info()
{
	if (hero.voice == 3)	{			//Руперт
		AI_Output(other,self,"DIA_Odo_MR_Hello_03_00");	//Ты участвуешь в сборе грибов для Константино?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Odo_MR_Hello_07_00");	//Ты участвуешь в сборе грибов для Константино?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Odo_MR_Hello_10_00");	//Ты участвуешь в сборе грибов для Константино?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Odo_MR_Hello_14_00");	//Ты участвуешь в сборе грибов для Константино?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Odo_MR_Hello_16_00");	//Ты участвуешь в сборе грибов для Константино?
	};
	AI_Output(self,other,"DIA_Odo_MR_Hello_03_01");	//Меня отправили на сбор целебных трав для Монастыря.
	AI_Output(self,other,"DIA_Odo_MR_Hello_03_02");	//Попутно я собираю и грибы.
	AI_Output(self,other,"DIA_Odo_MR_Hello_03_03");	//Кстати, у тебя случайно нет царского щавеля?
	Info_ClearChoices(DIA_Odo_MR_Hello);
	Info_AddChoice(DIA_Odo_MR_Hello,"Нет.",DIA_Odo_MR_Hello_No);
	If (Npc_HasItems(other,ItPl_Perm_Herb))	{
		Info_AddChoice(DIA_Odo_MR_Hello,"Есть.",DIA_Odo_MR_Hello_Yes);
	};
};
func void DIA_Odo_MR_Hello_No()
{
	if (hero.voice == 3)	{			//Руперт
		AI_Output(other,self,"DIA_Odo_MR_Hello_No_03_00");	//Нет.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Odo_MR_Hello_No_07_00");	//Нет.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Odo_MR_Hello_No_10_00");	//Нет.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Odo_MR_Hello_No_14_00");	//Нет.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Odo_MR_Hello_No_16_00");	//Нет.
	};
	Info_ClearChoices(DIA_Odo_MR_Hello);
};
func void DIA_Odo_MR_Hello_Yes()
{
	if (hero.voice == 3)	{			//Руперт
		AI_Output(other,self,"DIA_Odo_MR_Hello_Yes_03_00");	//Есть.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Odo_MR_Hello_Yes_07_00");	//Есть.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Odo_MR_Hello_Yes_10_00");	//Есть.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Odo_MR_Hello_Yes_14_00");	//Есть.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Odo_MR_Hello_Yes_16_00");	//Есть.
	};
	AI_Output(self,other,"DIA_Odo_MR_Hello_Yes_03_01");	//Может, отдашь его мне? Без знания алхимии он тебе все равно ни к чему.
	Info_ClearChoices(DIA_Odo_MR_Hello);
	Info_AddChoice(DIA_Odo_MR_Hello,"Не отдам.",DIA_Odo_MR_Hello_DontGive);
	Info_AddChoice(DIA_Odo_MR_Hello,"500 золотых.",DIA_Odo_MR_Hello_Gold);
	Info_AddChoice(DIA_Odo_MR_Hello,"Держи.",DIA_Odo_MR_Hello_Free);
};
func void DIA_Odo_MR_Hello_Free()
{
	if (hero.voice == 3)	{			//Руперт
		AI_Output(other,self,"DIA_Odo_MR_Hello_Free_03_00");	//Держи.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Odo_MR_Hello_Free_07_00");	//Держи.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Odo_MR_Hello_Free_10_00");	//Держи.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Odo_MR_Hello_Free_14_00");	//Держи.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Odo_MR_Hello_Free_16_00");	//Держи.
	};
	B_GiveInvItems(other,self,ItPl_Perm_Herb,1);
	AI_Output(self,other,"DIA_Odo_MR_Hello_Free_03_01");	//Огромное тебе спасибо! В это время года его так трудно найти.
	//Аданос вознаграждает за доброе дело
	B_Adanos_Bless4Good();
	Info_ClearChoices(DIA_Odo_MR_Hello);
};
func void DIA_Odo_MR_Hello_Gold()
{
	if (hero.voice == 3)	{			//Руперт
		AI_Output(other,self,"DIA_Odo_MR_Hello_Gold_03_00");	//500 золотых.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Odo_MR_Hello_Gold_07_00");	//500 золотых.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Odo_MR_Hello_Gold_10_00");	//500 золотых.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Odo_MR_Hello_Gold_14_00");	//Я хочу 500 золотых.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Odo_MR_Hello_Gold_16_00");	//500 золотых.
	};
	if (MR_Counter_Odo >= 500)	{
		AI_Output(self,other,"DIA_Odo_MR_Hello_Gold_03_01");	//Ну хорошо. Мне очень он нужен.
		B_GiveGold(self,other,500);
		B_GiveInvItems(other,self,ItPl_Perm_Herb,1);
	}
	else	{
		AI_Output(self,other,"DIA_Odo_MR_Hello_Gold_03_02");	//У меня нет таких денег.
	};
	Info_ClearChoices(DIA_Odo_MR_Hello);
};
func void DIA_Odo_MR_Hello_DontGive()
{
	if (hero.voice == 3)	{			//Руперт
		AI_Output(other,self,"DIA_Odo_MR_Hello_DontGive_03_00");	//Не отдам.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Odo_MR_Hello_DontGive_07_00");	//Не отдам.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Odo_MR_Hello_DontGive_10_00");	//Не отдам.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Odo_MR_Hello_DontGive_14_00");	//Не отдам.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Odo_MR_Hello_DontGive_16_00");	//Не отдам.
	};
	Info_ClearChoices(DIA_Odo_MR_Hello);
};
// ===============================================
instance DIA_Odo_Novice(C_INFO)
{
	npc = CMP_Odo;		nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_Odo_Novice_info;
	description = "Ты послушник?";
};
func void DIA_Odo_Novice_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Odo_Novice_03_00");	//Ты послушник?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Odo_Novice_07_00");	//Ты послушник?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Odo_Novice_10_00");	//Ты послушник?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Odo_Novice_14_00");	//Ты послушник?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Odo_Novice_16_00");	//Ты послушник?
	};
	AI_Output(self,other,"DIA_Odo_Novice_03_01");	//Да, разве это не очевидно?
};
// ===============================================
instance DIA_Odo_Monastery(C_INFO)
{
	npc = CMP_Odo;		nr = 3;
	condition = DIA_Odo_Monastery_cond;
	information = DIA_Odo_Monastery_info;
	description = "Трудно жить в Монастыре?";
	permanent = TRUE;
};
func int DIA_Odo_Monastery_cond()
{
	if (Npc_KnowsInfo(other,DIA_Odo_Novice))	{
		return TRUE;
	};
};
func void DIA_Odo_Monastery_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Odo_Monastery_03_00");	//Трудно жить в Монастыре?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Odo_Monastery_07_00");	//Трудно жить в Монастыре?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Odo_Monastery_10_00");	//Трудно жить в Монастыре?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Odo_Monastery_14_00");	//Трудно жить в Монастыре?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Odo_Monastery_16_00");	//Трудно жить в Монастыре?
	};
	AI_Output(self,other,"DIA_Odo_Monastery_03_01");	//Непросто, но мы все стремимся к чему-то большему.
	AI_Output(self,other,"DIA_Odo_Monastery_03_02");	//С поддержкой Инноса, это придает нам сил.
};
// ===============================================
instance DIA_Odo_PreTrade(C_INFO)
{
	npc = CMP_Odo;		nr = 4;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Odo_PreTrade_info;
	description = "Продай мне свои грибы.";
};
func void DIA_Odo_PreTrade_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Odo_PreTrade_03_00");	//Продай мне свои грибы.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Odo_PreTrade_07_00");	//Продай мне свои грибы.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Odo_PreTrade_10_00");	//Продай мне свои грибы.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Odo_PreTrade_14_00");	//Продай мне свои грибы.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Odo_PreTrade_16_00");	//Продай мне свои грибы.
	};
	AI_Output(self,other,"DIA_Odo_PreTrade_03_01");	//Нет. Не хочу мухлевать.
};

// ПОСЛЕ ОКОНЧАНИЯ КОНКУРСА ===============================
instance DIA_Odo_After_HeroWon(C_INFO)
{
	npc = CMP_Odo;		nr = 10;
	condition = DIA_Odo_After_HeroWon_cond;
	information = DIA_Odo_After_HeroWon_info;
	important = TRUE;
};
func int DIA_Odo_After_HeroWon_cond()
{
	if (!DIA_WhileCompetition_cond()
		&& (Competition_Result == Competition_Result_WON))
	{
		return TRUE;
	};
};
func void DIA_Odo_After_HeroWon_info()
{
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Odo_After_HeroWon_03_01m");	//(с уважением) Ты победил в конкурсе, насколько я знаю.
	}
	else	{
		AI_Output(self,other,"DIA_Odo_After_HeroWon_03_01f");	//(с уважением) Ты победила в конкурсе, насколько я знаю.
	};
	AI_Output(self,other,"DIA_Odo_After_HeroWon_03_02");	//Мои поздравления.
};
// ===============================================
instance DIA_Odo_After_Won(C_INFO)
{
	npc = CMP_Odo;		nr = 11;
	condition = DIA_Odo_After_Won_cond;
	information = DIA_Odo_After_Won_info;
	description = "Это ты послушник, который выиграл конкурс?";
};
func int DIA_Odo_After_Won_cond()
{
	if (!DIA_WhileCompetition_cond())
	{
		if ((C_CountResults() == Competition_Result_LOST) && Competition_Winner == Hlp_GetInstanceID(self))	{
			return TRUE;
		};
	};
};
func void DIA_Odo_After_Won_info()
{
	if (hero.voice == 3)	{			//Руперт
		AI_Output(other,self,"DIA_Odo_After_Won_03_00");	//Это ты послушник, который выиграл конкурс?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Odo_After_Won_07_00");	//Это ты послушник, который выиграл конкурс?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Odo_After_Won_10_00");	//Это ты послушник, который выиграл конкурс?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Odo_After_Won_14_00");	//Это ты послушник, который выиграл конкурс?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Odo_After_Won_16_00");	//Это ты послушник, который выиграл конкурс?
	};
	AI_Output(self,other,"DIA_Odo_After_Won_10_01");	//(сдержанно) Да, это я.
	if (hero.voice == 3)	{			//Руперт
		AI_Output(other,self,"DIA_Odo_After_Won_03_02");	//Тогда поздравляю!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Odo_After_Won_07_02");	//Тогда поздравляю!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Odo_After_Won_10_02");	//Тогда поздравляю!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Odo_After_Won_14_02");	//Тогда поздравляю!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Odo_After_Won_16_02");	//Тогда поздравляю!
	};
	AI_Output(self,other,"DIA_Odo_After_Won_10_03");	//Спасибо.
};

// ===============================================
instance DIA_Odo_After_Perm(C_INFO)
{
	npc = CMP_Odo;		nr = 12;
	condition = DIA_Odo_After_Perm_cond;
	information = DIA_Odo_After_Perm_info;
	description = "Что теперь будешь делать?";
	permanent = TRUE;
};
func int DIA_Odo_After_Perm_cond()
{
	if (!DIA_WhileCompetition_cond() && Npc_KnowsInfo(other,DIA_Odo_MR_Hello))
	{
		return TRUE;
	};
};
func void DIA_Odo_After_Perm_info()
{
	if (hero.voice == 3)	{			//Руперт
		AI_Output(other,self,"DIA_Odo_After_Perm_03_00");	//Что теперь будешь делать?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Odo_After_Perm_07_00");	//Что теперь будешь делать?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Odo_After_Perm_10_00");	//Что теперь будешь делать?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Odo_After_Perm_14_00");	//Что теперь будешь делать?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Odo_After_Perm_16_00");	//Что теперь будешь делать?
	};
	AI_Output(self,other,"DIA_Odo_After_Perm_10_01");	//Я стал учеником нашего мастера-алхимика, Неораса. Теперь я буду изучать изготовление зелий под его руководством.
	AI_Output(self,other,"DIA_Odo_After_Perm_10_02");	//У других магов тоже найдется для меня работа.
};
