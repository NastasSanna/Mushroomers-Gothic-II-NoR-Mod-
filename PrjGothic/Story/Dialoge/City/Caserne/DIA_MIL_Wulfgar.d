
instance DIA_Wulfgar_EXIT(DIA_Proto_End)
{
	npc = MIL_312_Wulfgar;
};

// ==============================================
instance DIA_Wulfgar_Start(C_INFO)
{
	nr = 1;
	npc = MIL_312_Wulfgar;
	condition = DIA_WhenAsked_cond;
	information = DIA_Wulfgar_Start_info;
	important = TRUE;
};
func void DIA_Wulfgar_Start_info()
{
	AI_Output(self,other,"DIA_Wulfgar_Start_04_00");	//Что привело тебя в казармы?
};
//==============================================
var int DIA_Wulfgar_Training_Once;
instance DIA_Wulfgar_Training(C_INFO)
{
	nr = 2;
	npc = MIL_312_Wulfgar;
	condition = DIA_NoCond_cond;
	information = DIA_Wulfgar_Training_info;
	permanent = TRUE;
	description = "Научи меня сражаться!";
};
func void DIA_Wulfgar_Training_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Wulfgar_Training_03_00");	//Научи меня сражаться!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Wulfgar_Training_07_00");	//Научи меня сражаться!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Wulfgar_Training_10_00");	//Научи меня сражаться!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Wulfgar_Training_14_00");	//Научи меня сражаться!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Wulfgar_Training_16_00");	//Научи меня сражаться!
	};
	AI_Output(self,other,"DIA_Wulfgar_Training_04_01");	//Я обучаю только городских стражников.
	if (other.aivar[AIV_Gender] == FEMALE)	{
		AI_Output(self,other,"DIA_Wulfgar_Training_04_02");	//И только мужчин.
	};
	if (!DIA_Wulfgar_Training_Once)	{
		B_LogNote(TOPIC_Teacher,TOPIC_Teacher_Wulfgar);
	};
	AI_Output(self,other,"DIA_Wulfgar_Training_04_03");	//Но ты можешь многого добиться и своими силами. Главное - практика.
	AI_Output(self,other,"DIA_Wulfgar_Training_04_04");	//Чем больше ты сражаешься с каким-либо оружием, тем лучше им владеешь.
	AI_Output(self,other,"DIA_Wulfgar_Training_04_05");	//Ближний бой позволяет стать сильнее, стрельба увеличивает ловкость.
	AI_Output(self,other,"DIA_Wulfgar_Training_04_06");	//Даже магические способности поддаются тренировке.
	AI_Output(self,other,"DIA_Wulfgar_Training_04_07");	//(с презрением) Ну а для тех, кому нужен быстрый результат, существуют зелья и травы.
	if (!DIA_Wulfgar_Training_Once)	{
		DIA_Wulfgar_Training_Once = TRUE;
		B_LogNote(TOPIC_Teacher,TOPIC_Teacher_Self);
	};
};


