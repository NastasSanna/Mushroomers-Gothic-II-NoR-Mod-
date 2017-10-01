
instance DIA_Daron_EXIT(DIA_Proto_End)
{
	npc = KDF_511_Daron;
};

/////////////////////////////////////// ОДО /////////////////////////////////////////////
instance DIA_Daron_Start_Odo(C_INFO)
{
	nr = 1;
	npc = KDF_511_Daron;
	condition = DIA_Daron_Start_Odo_cond;
	information = DIA_Daron_Start_Odo_info;
	description = "Могу я узнать, почему вы здесь, мастер?";
};
func int DIA_Daron_Start_Odo_cond()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Daron_Start_Odo_info()
{
		AI_Output(other,self,"DIA_Daron_Start_Odo_03_00");	//Могу я узнать, почему вы здесь, мастер?
	AI_Output(self,other,"DIA_Daron_Start_Odo_10_01");	//Я несу слова Инноса людям и собираю пожертвования.
	AI_Output(self,other,"DIA_Daron_Start_Odo_10_02");	//Из-за своих обязанностей я редко появляюсь в стенах Монастыря.
};
//---------------------------------
instance DIA_Daron_MR_Perm_Odo(C_INFO)
{
	nr = 2;
	npc = KDF_511_Daron;
	condition = DIA_Daron_MR_Perm_Odo_cond;
	information = DIA_Daron_MR_Perm_Odo_info;
	description = "Я могу помочь вам?";
	permanent = TRUE;
};
func int DIA_Daron_MR_Perm_Odo_cond()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Daron_MR_Perm_Odo_info()
{
		AI_Output(other,self,"DIA_Daron_MR_Perm_Odo_03_00");	//Я могу помочь вам?
	AI_Output(self,other,"DIA_Daron_MR_Perm_Odo_10_01");	//Нет, послушник. Занимайся своими обязанностями.
};

// ==============================================
instance DIA_Daron_Donate(C_INFO)
{
	nr = 3;
	npc = KDF_511_Daron;
	condition = DIA_Daron_Donate_cond;
	information = DIA_Daron_Donate_info;
	description = "Я хочу пожертвоваmь...";
	permanent = TRUE;
};
func int DIA_Daron_Donate_cond()
{
	return TRUE;
};
func void DIA_Daron_Donate_info()
{
	if (hero.voice == 3)	{		//Руперт/Одо
		AI_Output(other,self,"DIA_Daron_Donate_03_00");	//Я хочу пожертвоваmь...
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Daron_Donate_07_00");	//Я хочу пожертвоваmь...
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Daron_Donate_10_00");	//Я хочу пожертвоваmь...
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Daron_Donate_14_00");	//Я хочу пожертвоваmь...
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Daron_Donate_16_00");	//Я хочу пожертвоваmь...
	};
	Info_ClearChoices(DIA_Daron_Donate);
	Info_AddChoice(DIA_Daron_Donate,"...когда у меня будут деньги.",DIA_Daron_Donate0);
	if (C_NpcHasGold(other,10))	{
		Info_AddChoice(DIA_Daron_Donate,"...10 золотых.",DIA_Daron_Donate10);
	};
	if (C_NpcHasGold(other,50))	{
		Info_AddChoice(DIA_Daron_Donate,"...50 золотых.",DIA_Daron_Donate50);
	};
	if (C_NpcHasGold(other,100))	{
		Info_AddChoice(DIA_Daron_Donate,"...100 золотых.",DIA_Daron_Donate100);
	};
};
func void DIA_Daron_Donate0()
{
	if (hero.voice == 3)	{		//Руперт/Одо
		AI_Output(other,self,"DIA_Daron_Donate0_03_00");	//...когда у меня будут деньги.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Daron_Donate0_07_00");	//...когда у меня будут деньги.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Daron_Donate0_10_00");	//...когда у меня будут деньги.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Daron_Donate0_14_00");	//...когда у меня будут деньги.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Daron_Donate0_16_00");	//...когда у меня будут деньги.
	};
	AI_Output(self,other,"DIA_Daron_Donate0_10_01");	//Возвращайся и помни - Иннос всегда рядом.
	Info_ClearChoices(DIA_Daron_Donate);
};

func void DIA_Daron_Donate10()
{
	PrayCounter_Innos += 1;
	Info_ClearChoices(DIA_Daron_Donate);
	B_GiveInvItems(other,self,ItMi_Gold,10);
	if (hero.voice == 3)	{		//Руперт/Одо
		AI_Output(other,self,"DIA_Daron_Donate10_03_00");	//...10 золотых.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Daron_Donate10_07_00");	//...10 золотых.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Daron_Donate10_10_00");	//...10 золотых.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Daron_Donate10_14_00");	//...10 золотых.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Daron_Donate10_16_00");	//...10 золотых.
	};
	AI_Output(self,other,"DIA_Daron_Donate10_10_01");	//Даже скромное пожертвование приближает тебя к Инносу.
	PC_PrayInnos_PatronGod(1);
};

func void DIA_Daron_Donate50()
{
	PrayCounter_Innos += 1;
	Info_ClearChoices(DIA_Daron_Donate);
	B_GiveInvItems(other,self,ItMi_Gold,50);
	if (hero.voice == 3)	{		//Руперт/Одо
		AI_Output(other,self,"DIA_Daron_Donate50_03_00");	//...50 золотых.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Daron_Donate50_07_00");	//...50 золотых.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Daron_Donate50_10_00");	//...50 золотых.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Daron_Donate50_14_00");	//...50 золотых.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Daron_Donate50_16_00");	//...50 золотых.
	};
	AI_Output(self,other,"DIA_Daron_Donate50_10_01");	//Твое пожертвование вернется к тебе сторицей.
	PC_PrayInnos_PatronGod(2);
};

func void DIA_Daron_Donate100()
{
	PrayCounter_Innos += 1;
	Info_ClearChoices(DIA_Daron_Donate);
	B_GiveInvItems(other,self,ItMi_Gold,100);
	if (hero.voice == 3)	{		//Руперт/Одо
		AI_Output(other,self,"DIA_Daron_Donate100_03_00");	//...100 золотых.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Daron_Donate100_07_00");	//...100 золотых.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Daron_Donate100_10_00");	//...100 золотых.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Daron_Donate100_14_00");	//...100 золотых.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Daron_Donate100_16_00");	//...100 золотых.
	};
	AI_Output(self,other,"DIA_Daron_Donate100_10_01");	//С благословлением Инноса ступай по своему пути!
	PC_PrayInnos_PatronGod(3);
};

