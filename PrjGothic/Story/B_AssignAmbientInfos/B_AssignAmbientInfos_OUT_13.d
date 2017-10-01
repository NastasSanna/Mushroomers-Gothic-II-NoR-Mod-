
instance DIA_OUT_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OUT_13_EXIT_Condition;
	information = DIA_OUT_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OUT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OUT_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_OUT_13_HowAU(C_Info)
{
	nr = 101;
	condition = DIA_OUT_13_HowAU_Condition;
	information = DIA_OUT_13_HowAU_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_OUT_13_HowAU_Condition()
{
	return TRUE;
};

func void DIA_OUT_13_HowAU_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_OUT_HowAU_03_00");	//Как дела?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_OUT_HowAU_07_00");	//Как дела?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_OUT_HowAU_10_00");	//Как дела?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_OUT_HowAU_14_00");	//Как дела?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_OUT_HowAU_16_00");	//Как дела?
	};
	var int rnd;	rnd = Hlp_Random(3);
	if (rnd == 0)	{
		AI_Output(self,other,"DIA_OUT_13_HowAU_13_01");	//А тебе какое дело?
	}
	else if (rnd == 1)	{
		AI_Output(self,other,"DIA_OUT_13_HowAU_13_02");	//Не твоя забота.
	}
	else if (rnd == 2)	{
		AI_Output(self,other,"DIA_OUT_13_HowAU_13_03");	//Нормально.
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_OUT_13(var C_Npc slf)
{
	dia_OUT_13_exit.npc = Hlp_GetInstanceID(slf);
	DIA_OUT_13_HowAU.npc = Hlp_GetInstanceID(slf);
};

