
instance DIA_Akil_EXIT(DIA_Proto_End)
{
	npc = BAU_940_Akil;
};

// ОДО ==================================================================
instance DIA_Akil_Odo_Straw(C_INFO)
{
	npc = BAU_940_Akil;		nr = 20;
	condition = DIA_Akil_Odo_Straw_cond;
	information = DIA_Akil_Odo_Straw_info;
	description = "Ты продаешь сено?";
};
func int DIA_Akil_Odo_Straw_cond()
{
	if (C_HeroIs_Odo() && (MIS_Odo_Straw == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Akil_Odo_Straw_info()
{
		AI_Output(other,self,"DIA_Akil_Odo_Straw_03_00");	//Ты продаешь сено?
	AI_Output(self,other,"DIA_Akil_Odo_Straw_13_01");	//Да. Отдам по 14 золотых. Ни у кого дешевле не найдешь!
	B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Akil_Price);
	MIS_Odo_Straw_Akil[Straw_Price] = 1;
};

// ОБЩИЕ ==================================================================
instance DIA_Akil_MR_Perm(C_INFO)
{
	npc = BAU_940_Akil;		nr = 50;
	condition = DIA_NoCond_cond;
	information = DIA_Akil_MR_Perm_info;
	description = "Как дела на твоей ферме?";
	permanent = TRUE;
};
func void DIA_Akil_MR_Perm_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Akil_MR_Perm_03_00");	//Как дела на твоей ферме?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Akil_MR_Perm_07_00");	//Как дела на твоей ферме?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Akil_MR_Perm_10_00");	//Как дела на твоей ферме?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Akil_MR_Perm_14_00");	//Как дела на твоей ферме?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Akil_MR_Perm_16_00");	//Как дела на твоей ферме?
	};
	AI_Output(self,other,"DIA_Akil_MR_Perm_13_01");	//Кабаны разрыли и затоптали часть поля.
	AI_Output(self,other,"DIA_Akil_MR_Perm_13_02");	//Но в остальном все в порядке.
};

