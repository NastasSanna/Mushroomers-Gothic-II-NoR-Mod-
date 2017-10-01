
instance DIA_Gaertner_EXIT(DIA_Proto_End)
{
	npc = VLK_411_Gaertner;
};

// ==============================================

instance DIA_Gaertner_HowAU(C_INFO)
{
	nr = 1;
	npc = VLK_411_Gaertner;
	condition = DIA_NoCond_cond;
	information = DIA_Gaertner_HowAU_info;
	permanent = TRUE;
	description = "Как дела?";
};
func void DIA_Gaertner_HowAU_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Gaertner_HowAU_03_00");	//Как дела?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Gaertner_HowAU_07_00");	//Как дела?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Gaertner_HowAU_10_00");	//Как дела?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Gaertner_HowAU_14_00");	//Как дела?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Gaertner_HowAU_16_00");	//Как дела?
	};
	AI_Output(self,other,"DIA_Gaertner_HowAU_14_01");	//Неплохо. Пока губернатор в отъезде, можно немного раcслабиться.
	AI_Output(self,other,"DIA_Gaertner_HowAU_14_02");	//Корнелиусу нет никакого дела до сада.
};


