
instance DIA_Rengaru_EXIT(DIA_Proto_End)
{
	npc = VLK_492_Rengaru;
};

instance DIA_Rengaru_NoTalk(C_INFO)
{
	nr = 1;
	npc = VLK_492_Rengaru;
	condition = DIA_Rengaru_NoTalk_cond;
	information = DIA_Rengaru_NoTalk_info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Rengaru_NoTalk_cond()
{
	if ((Moe_Sign == FALSE) && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Rengaru_NoTalk_info()
{
	AI_Output(self,other,"DIA_Rengaru_NoTalk_07_00");	//Хей, зачем болтать? Лучше выпей!
	AI_StopProcessInfos(self);
};

//=========================================================
instance DIA_Rengaru_LetsDrink(C_INFO)
{
	nr = 2;
	npc = VLK_492_Rengaru;
	condition = DIA_Rengaru_LetsDrink_cond;
	information = DIA_Rengaru_LetsDrink_info;
	important = TRUE;
};
func int DIA_Rengaru_LetsDrink_cond()
{
	if (Moe_Sign == TRUE)	{
		return TRUE;
	};
};
func void DIA_Rengaru_LetsDrink_info()
{
	AI_Output(self,other,"DIA_Rengaru_LetsDrink_07_00");	//Эй, я тебя тут раньше не видел! Новенький?
	AI_Output(self,other,"DIA_Rengaru_LetsDrink_07_01");	//Давай выпьем, сегодня я угощаю!
	Info_ClearChoices(DIA_Rengaru_LetsDrink);
	Info_AddChoice(DIA_Rengaru_LetsDrink,"В другой раз.",DIA_Rengaru_LetsDrink_No);
	Info_AddChoice(DIA_Rengaru_LetsDrink,"Наливай!",DIA_Rengaru_LetsDrink_Yes);
	
};
func void DIA_Rengaru_LetsDrink_No()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No_03_00");	//В другой раз.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No_07_00");	//В другой раз.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No_10_00");	//В другой раз.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No_14_00");	//В другой раз.
//	} else	{							//Елена/Сара
//		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No_16_00");	//В другой раз.
	};
	AI_Output(self,other,"DIA_Rengaru_LetsDrink_No_07_01");	//Да ладно тебе, это же кабак! Что тут еще делать, как не выпить в хорошей компании?
	Info_AddChoice(DIA_Rengaru_LetsDrink,"Я же сказал - в другой раз.",DIA_Rengaru_LetsDrink_No2);
};

func void DIA_Rengaru_LetsDrink_No2()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No2_03_00");	//Я же сказал - в другой раз.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No2_07_00");	//Я же сказал - в другой раз.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No2_10_00");	//Я же сказал - в другой раз.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No2_14_00");	//Я же сказал - в другой раз.
//	} else	{							//Елена/Сара
//		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No2_16_00");	//Я же сказала - в другой раз.
	};
	AI_Output(self,other,"DIA_Rengaru_LetsDrink_No2_07_01");	//Эх, ладно. Но если передумаешь - я всегда тут.
	AI_StopProcessInfos(self);
};

func void DIA_Rengaru_LetsDrink_Yes()
{
	Rengaru_Hocus = TRUE;
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_Yes_03_00");	//Наливай!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_Yes_07_00");	//Наливай!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_Yes_10_00");	//Наливай!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_Yes_14_00");	//Наливай!
//	} else	{							//Елена/Сара
//		AI_Output(other,self,"DIA_Rengaru_LetsDrink_Yes_16_00");	//Наливай!
	};
	AI_Output(self,other,"DIA_Rengaru_LetsDrink_Yes_07_01");	//Отлично!
	AI_TurnToNpc(self,VLK_431_Kardif);
	AI_Output(self,other,"DIA_Rengaru_LetsDrink_Yes_07_02");	//Эй, Кардиф, дай нам чего-нибудь из своих запасов!
	AI_TurnToNpc(self,other);
	CreateInvItems(self,ItFo_Addon_Grog,2);
	B_GiveInvItems(self,other,ItFo_Addon_Grog,1);
	AI_Output(self,other,"DIA_Rengaru_LetsDrink_Yes_07_03");	//Твое здоровье!
	AI_UseItem(self,ItFo_Addon_Grog);
	AI_UseItem(other,ItFo_Addon_Grog);
	AI_StopProcessInfos(self);
};

//=========================================================
instance DIA_Rengaru_LetsDrinkYes(C_INFO)
{
	nr = 3;
	npc = VLK_492_Rengaru;
	condition = DIA_Rengaru_LetsDrinkYes_cond;
	information = DIA_Rengaru_LetsDrink_Yes;
	description = "Наливай!";
};
func int DIA_Rengaru_LetsDrinkYes_cond()
{
	if ((Moe_Sign == TRUE) && Npc_KnowsInfo(other,DIA_Rengaru_LetsDrink))	{
		return TRUE;
	};
};

