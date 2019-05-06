
instance DIA_Mika_EXIT(DIA_Proto_End)
{
	npc = Mil_337_Mika;
};

//==============================================
instance DIA_Mika_Head(C_INFO)
{
	npc = Mil_337_Mika;			nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_Mika_Head_info;
	permanent = TRUE;
	description = "Кто у вас тут главный?";
};
func void DIA_Mika_Head_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Mika_Head_03_00");	//Кто у вас тут главный?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Mika_Head_07_00");	//Кто у вас тут главный?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Mika_Head_10_00");	//Кто у вас тут главный?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Mika_Head_14_00");	//Кто у вас тут главный?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Mika_Head_16_00");	//Кто у вас тут главный?
	};
	AI_Output(self,other,"DIA_Mika_Head_12_01");	//Формально нами командует губернатор, но я ни разу не видел его в казармах.
	AI_Output(self,other,"DIA_Mika_Head_12_02");	//Реально всем руководит Вульфгар - назначает дежурства, проводит тренировки и все такое.
	AI_Output(self,other,"DIA_Mika_Head_12_03");	//Ему помогает Пек. Он отвечает за оружие и амуницию.
};

//==============================================
instance DIA_Mika_Training(C_INFO)
{
	npc = Mil_337_Mika;			nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_Mika_Training_info;
	permanent = TRUE;
	description = "Ты не знаешь, кто может потренировать меня?";
};
func void DIA_Mika_Training_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Mika_Training_03_00");	//Ты не знаешь, кто может потренировать меня?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Mika_Training_07_00");	//Ты не знаешь, кто может потренировать меня?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Mika_Training_10_00");	//Ты не знаешь, кто может потренировать меня?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Mika_Training_14_00");	//Ты не знаешь, кто может потренировать меня?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Mika_Training_16_00");	//Ты не знаешь, кто может потренировать меня?
	};
	AI_Output(self,other,"DIA_Mika_Training_12_01");	//Вульфгар обучает стражников, но он не будет тренировать кого-то со стороны.
	AI_Output(self,other,"DIA_Mika_Training_12_02");	//Попробуй поговорить с Пеком.
	AI_Output(self,other,"DIA_Mika_Training_12_03");	//Его можно найти в оружейной или на тренировочной площадке.
};


//==============================================
instance DIA_Mika_BodyGuard(C_INFO)
{
	npc = Mil_337_Mika;			nr = 10;
	condition = DIA_Mika_BodyGuard_cond;
	information = DIA_Mika_BodyGuard_info;
	important = TRUE;
};
func int DIA_Mika_BodyGuard_cond()
{
	if (DIA_WhenAsked_cond() && Competition_Result == Competition_Result_NONE)	{
		return TRUE;
	};
};
func void DIA_Mika_BodyGuard_info()
{
	AI_Output(self,other,"DIA_Mika_BodyGuard_12_00");	//Ей, я слышал, ты участвуешь в грибном конкурсе?
	Info_ClearChoices(DIA_Mika_BodyGuard);
	Info_AddChoice(DIA_Mika_BodyGuard,"Нет",DIA_Mika_BodyGuard_No);
	Info_AddChoice(DIA_Mika_BodyGuard,"Да",DIA_Mika_BodyGuard_Yes);
};

func void DIA_Mika_BodyGuard_Yes()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Mika_BodyGuard_03_01");	//Да, это так.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Mika_BodyGuard_07_01");	//Ты прав, участвую.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Mika_BodyGuard_10_01");	//Ты прав, участвую.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Mika_BodyGuard_14_01");	//Ты прав, участвую.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Mika_BodyGuard_16_01");	//Да, участвую.
	};
	AI_Output(self,other,"DIA_Mika_BodyGuard_12_02");	//В наших лесах небезопасно - всякое зверье, кабаны, волки...
	if (other.guild == GIL_VLK)	{
		AI_Output(self,other,"DIA_Mika_BodyGuard_12_03a");	//Я не могу оставить жителей этого города без защиты.
	}
	else if (other.guild == GIL_BAU || other.guild == GIL_BAU2)	{
		AI_Output(self,other,"DIA_Mika_BodyGuard_12_03b");	//Я не могу позволить снабжающим город крестьянам остаться без защиты.
	};
	AI_Output(self,other,"DIA_Mika_BodyGuard_12_04");	//И я мог бы ее предоставить за очень скромное вознаграждение.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Mika_BodyGuard_03_05");	//Сколько?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Mika_BodyGuard_07_05");	//Скромное - это сколько?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Mika_BodyGuard_10_05");	//Скромное - это сколько?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Mika_BodyGuard_14_05");	//Скромное - это сколько?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Mika_BodyGuard_16_05");	//Сколько?
	};
	AI_Output(self,other,"DIA_Mika_BodyGuard_12_06");	//10 золотых в день.
	Mika_MayGuard = TRUE;
	B_LogNote(TOPIC_Misk,TOPIC_Misk_MikaGuard);
	Info_ClearChoices(DIA_Mika_BodyGuard);
};
func void DIA_Mika_BodyGuard_No()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Mika_BodyGuard_03_02");	//Нет, ты ошибся.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Mika_BodyGuard_07_02");	//Нет, ты ошибся.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Mika_BodyGuard_10_02");	//Нет, ты меня с кем-то перепутал.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Mika_BodyGuard_14_02");	//Нет, ты ошибся.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Mika_BodyGuard_16_02");	//Нет, ты ошибся.
	};
	Info_ClearChoices(DIA_Mika_BodyGuard);
};

//==============================================
instance DIA_Mika_Pay(C_INFO)
{
	npc = Mil_337_Mika;			nr = 11;
	condition = DIA_Mika_Pay_cond;
	information = DIA_Mika_Pay_info;
	description = "Я хочу нанять тебя. (10 зол.)";
	permanent = TRUE;
};
func int DIA_Mika_Pay_cond()
{
	if (Mika_MayGuard && !Mika_Guard_Active)	{
		return TRUE;
	};
};

func void DIA_Mika_Pay_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Mika_Pay_03_00");	//Я хочу нанять тебя.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Mika_Pay_07_00");	//Я хочу нанять тебя.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Mika_Pay_10_00");	//Я хочу нанять тебя.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Mika_Pay_14_00");	//Я хочу нанять тебя.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Mika_Pay_16_00");	//Я хочу нанять тебя.
	};
	if (B_GiveGold(other, self, 10))	{
		AI_Output(self,other,"DIA_Mika_Pay_12_01");	//Отлично! Пошли.
		Mika_Guard_Active = TRUE;
		Mika_Guard_EndTime = Wld_GetFullTime() + 24 * 60;
		AI_StopProcessInfos(self);
		self.aivar[AIV_Temper] = self.aivar[AIV_Temper]  | TEMPER_BodyGuard;
		self.aivar[AIV_PARTYMEMBER] = TRUE;
		B_StartOtherRoutine(self,"GUARD");
	}
	else	{
		AI_Output(self,other,"DIA_Mika_Pay_12_02");	//Тогда заплати 10 золотых.
	};
};


//==============================================
instance DIA_Mika_PayAgain(C_INFO)
{
	npc = Mil_337_Mika;			nr = 12;
	condition = DIA_Mika_PayAgain_cond;
	information = DIA_Mika_PayAgain_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Mika_PayAgain_cond()
{
	if (Mika_MayGuard && Mika_Guard_Active && (Wld_GetFullTime() > Mika_Guard_EndTime))	{
		return TRUE;
	};
};

func void DIA_Mika_PayAgain_info()
{
	AI_Output(self,other,"DIA_Mika_PayAgain_12_00");	//День прошел. Мы продлеваем наше соглашение?
	Info_ClearChoices(DIA_Mika_PayAgain);
	Info_AddChoice(DIA_Mika_PayAgain,"Нет, ты мне больше не нужен.",DIA_Mika_PayAgain_No);
	if (Npc_HasItems(other, ItMi_Gold) >= 10)	{
		Info_AddChoice(DIA_Mika_PayAgain,"Да, вот еще 10 золотых.",DIA_Mika_PayAgain_Yes);
	};
};

func void DIA_Mika_PayAgain_Yes()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Mika_PayAgain_03_01");	//Да, вот еще 10 золотых.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Mika_PayAgain_07_01");	//Да, вот еще 10 золотых.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Mika_PayAgain_10_01");	//Да, вот еще 10 золотых.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Mika_PayAgain_14_01");	//Да, вот еще 10 золотых.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Mika_PayAgain_16_01");	//Да, вот еще 10 золотых.
	};
	B_GiveGold(other, self, 10);
	Mika_Guard_EndTime = Wld_GetFullTime() + 24 * 60;
	AI_StopProcessInfos(self);
};
	
func void DIA_Mika_PayAgain_No()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Mika_PayAgain_03_02");	//Нет, ты мне больше не нужен.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Mika_PayAgain_07_02");	//Нет, ты мне больше не нужен.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Mika_PayAgain_10_02");	//Нет, ты мне больше не нужен.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Mika_PayAgain_14_02");	//Нет, ты мне больше не нужен.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Mika_PayAgain_16_02");	//Нет, ты мне больше не нужен.
	};
	AI_Output(self,other,"DIA_Mika_PayAgain_12_03");	//Как хочешь.
	AI_Output(self,other,"DIA_Mika_PayAgain_12_04");	//Тогда я возвращаюсь к своим обязанностям в городе.
	Mika_Guard_Active = FALSE;
	self.aivar[AIV_Temper] = self.aivar[AIV_Temper] & ~TEMPER_BodyGuard;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};


//==============================================
instance DIA_Mika_Won(C_INFO)
{
	npc = Mil_337_Mika;			nr = 13;
	condition = DIA_Mika_Won_cond;
	information = DIA_Mika_Won_info;
	important = TRUE;
};
func int DIA_Mika_Won_cond()
{
	if (Mika_MayGuard && (Competition_Result == Competition_Result_WON) && (Mika_Guard_EndTime > 0))	{
		return TRUE;
	};
};
func void DIA_Mika_Won_info()
{
	AI_Output(self,other,"DIA_Mika_Won_12_00");	//Поздравляю с победой!
	AI_Output(self,other,"DIA_Mika_Won_12_01");	//Согласись, без меня тебе бы не справиться!
};

