
instance DIA_Mortis_EXIT(DIA_Proto_End)
{
	npc = Mil_314_Mortis;
};

//==============================================
instance DIA_Mortis_Start(C_INFO)
{
	nr = 1;
	npc = Mil_314_Mortis;
	condition = DIA_NoCond_cond;
	information = DIA_Mortis_Start_info;
	description = "Ты кузнец?";
};
func void DIA_Mortis_Start_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Mortis_Start_03_00");	//Ты кузнец?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Mortis_Start_07_00");	//Ты кузнец?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Mortis_Start_10_00");	//Ты кузнец?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Mortis_Start_14_00");	//Ты кузнец?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Mortis_Start_16_00");	//Ты кузнец?
	};
	AI_Output(self,other,"DIA_Mortis_Start_12_01");	//(раздраженно) А по мне не видно?
	AI_Output(self,other,"DIA_Mortis_Start_12_02");	//Я обеспечиваю оружием всех стражников в городе.
	AI_Output(self,other,"DIA_Mortis_Start_12_03");	//Если тебе нужно оружие, обратись к торговцам в городе, или сходи к Хакону. А я занят.
	AI_StopProcessInfos(self);
};

//==============================================
instance DIA_Mortis_Training(C_INFO)
{
	nr = 2;
	npc = Mil_314_Mortis;
	condition = DIA_NoCond_cond;
	information = DIA_Mortis_Training_info;
	description = "Ты не мог бы меня потренировать?";
};
func int DIA_Mortis_Training_cond()
{
	return TRUE;
};
func void DIA_Mortis_Training_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Mortis_Training_03_00");	//Ты не мог бы меня потренировать?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Mortis_Training_07_00");	//Ты не мог бы меня потренировать?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Mortis_Training_10_00");	//Ты не мог бы меня потренировать?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Mortis_Training_14_00");	//Ты не мог бы меня потренировать?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Mortis_Training_16_00");	//Ты не мог бы меня потренировать?
	};
	AI_Output(self,other,"DIA_Mortis_Training_12_01");	//Нет, если ты не состоишь в городской страже.
	AI_Output(self,other,"DIA_Mortis_Training_12_02");	//А ты определенно в ней не состоишь.
	AI_StopProcessInfos(self);
};
//==============================================
instance DIA_Mortis_Perm(C_INFO)
{
	nr = 3;
	npc = Mil_314_Mortis;
	condition = DIA_Mortis_MR_Perm_cond;
	information = DIA_Mortis_MR_Perm_info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Mortis_MR_Perm_cond()
{
	if (Npc_KnowsInfo(other,DIA_Mortis_Training) && Npc_KnowsInfo(other,DIA_Mortis_Start) && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Mortis_MR_Perm_info()
{
	AI_Output(self,other,"DIA_Mortis_MR_Perm_13_00");	//Найди кого-нибудь другого, кого ты сможешь доставать своими вопросами.
	if (Wld_IsTime(7,0,21,0))	{
		AI_Output(self,other,"DIA_Mortis_MR_Perm_13_01");	//А я занят.
	}
	else	{
		AI_Output(self,other,"DIA_Mortis_MR_Perm_13_02");	//А я устал.
	};
	AI_StopProcessInfos(self);
};


