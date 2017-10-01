
instance DIA_Mika_EXIT(DIA_Proto_End)
{
	npc = Mil_337_Mika;
};

//==============================================
instance DIA_Mika_Head(C_INFO)
{
	nr = 1;
	npc = Mil_337_Mika;
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
	nr = 2;
	npc = Mil_337_Mika;
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

/*UNFINISHED
DIA_Mika_BodyGuard_12_00 //Ей, я слышал, ты участвуешь в грибном конкурсе?
DIA_Mika_BodyGuard_03_01 //Да, это так.
DIA_Mika_BodyGuard_10_01 //Ты прав, участвую.
DIA_Mika_BodyGuard_14_01 //Ты прав, участвую.
DIA_Mika_BodyGuard_16_01 //Да, участвую.
DIA_Mika_BodyGuard_03_02 //Нет, ты ошибся.
DIA_Mika_BodyGuard_10_02 //Нет, ты меня с кем-то перепутал.
DIA_Mika_BodyGuard_14_02 //Нет, ты ошибся.
DIA_Mika_BodyGuard_16_02 //Нет, ты ошибся.
DIA_Mika_BodyGuard_12_02 //В наших лесах небезопасно - всякое зверье, кабаны, волки...
DIA_Mika_BodyGuard_12_03a //Я не могу оставить жителей этого города без защиты.
DIA_Mika_BodyGuard_12_03b //Я не могу позволить снабжающим город крестьянам остаться без защиты.
DIA_Mika_BodyGuard_12_04 //И я мог бы ее предоставить за очень скромное вознаграждение.
DIA_Mika_BodyGuard_03_05 //Сколько?
DIA_Mika_BodyGuard_10_05 //Скромное - это сколько?
DIA_Mika_BodyGuard_14_05 //Скромное - это сколько?
DIA_Mika_BodyGuard_16_05 //Сколько?
DIA_Mika_BodyGuard_12_06 //10 золотых в день.
 
DIA_Mika_Pay_03_00 //Я хочу нанять тебя.
DIA_Mika_Pay_10_00 //Я хочу нанять тебя.
DIA_Mika_Pay_14_00 //Я хочу нанять тебя.
DIA_Mika_Pay_16_00 //Я хочу нанять тебя.
DIA_Mika_Pay_12_01 //Отлично! Пошли.
DIA_Mika_Pay_12_02 //Тогда заплати 10 золотых.
DIA_Mika_PayAgain_12_00 //День прошел. Мы продлеваем наше соглашение?
DIA_Mika_PayAgain_03_01 //Да, вот еще 10 золотых.
DIA_Mika_PayAgain_10_01 //Да, вот еще 10 золотых.
DIA_Mika_PayAgain_14_01 //Да, вот еще 10 золотых.
DIA_Mika_PayAgain_16_01 //Да, вот еще 10 золотых.
DIA_Mika_PayAgain_03_02 //Нет, ты мне больше не нужен.
DIA_Mika_PayAgain_10_02 //Нет, ты мне больше не нужен.
DIA_Mika_PayAgain_14_02 //Нет, ты мне больше не нужен.
DIA_Mika_PayAgain_16_02 //Нет, ты мне больше не нужен.
DIA_Mika_PayAgain_12_03 //Как хочешь.
DIA_Mika_PayAgain_12_04 //Тогда я возвращаюсь к своим обязанностям в городе.
 
DIA_Mika_Won_12_00 //Поздравляю с победой!
DIA_Mika_Won_12_01 //Согласись, без меня тебе бы не справиться!
*/

