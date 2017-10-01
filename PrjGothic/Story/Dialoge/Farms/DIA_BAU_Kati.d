
// Кулинарные изыски ===================================================
instance DIA_Kati_AskRecipe(C_Info)
{
	npc = BAU_941_Kati;				nr = 10;
	condition = DIA_Kati_AskRecipe_cond;
	information = DIA_Kati_AskRecipe_Info;
	description = "Ты случайно не знаешь, как приготовить грибы “дамские уши“, розовые такие?";
};
func int DIA_Kati_AskRecipe_cond()
{
	if (MIS_Cookery == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Kati_AskRecipe_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Kati_AskRecipe_03_00");	//Ты случайно не знаешь, как приготовить грибы “дамские уши“, розовые такие?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Kati_AskRecipe_07_00");	//Ты случайно не знаешь, как приготовить грибы “дамские уши“, розовые такие?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Kati_AskRecipe_10_00");	//Ты случайно не знаешь, как приготовить грибы “дамские уши“, розовые такие?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Kati_AskRecipe_14_00");	//Ты случайно не знаешь, как приготовить грибы “дамские уши“, розовые такие?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Kati_AskRecipe_16_00");	//Ты случайно не знаешь, как приготовить грибы “дамские уши“, розовые такие?
	};
	AI_Output(self,other,"DIA_Kati_AskRecipe_16_01");	//Понятия не имею.
};