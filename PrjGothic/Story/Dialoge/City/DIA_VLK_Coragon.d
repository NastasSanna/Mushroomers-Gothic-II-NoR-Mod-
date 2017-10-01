
instance DIA_Coragon_EXIT(DIA_Proto_End)
{
	npc = VLK_420_Coragon;
};

// ТОРГОВЛЯ ==============================================

instance DIA_Coragon_Beer_Rupert(C_INFO)
{
	nr = 50;
	npc = VLK_420_Coragon;
	condition = DIA_Coragon_Beer_Rupert_cond;
	information = DIA_Coragon_Beer_Rupert_info;
	important = TRUE;
};
func int DIA_Coragon_Beer_Rupert_cond()
{
	if (C_HeroIs_Rupert() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
	
};
func void DIA_Coragon_Beer_Rupert_info()
{
	AI_Output(self,other,"DIA_Coragon_Beer_Rupert_09_00");	//Как насчет кружки пива?
	Info_ClearChoices(DIA_Coragon_Beer_Rupert);
	Info_AddChoice(DIA_Coragon_Beer_Rupert,"В кредит?",DIA_Coragon_Beer_Rupert_No);
	if (C_NpcHasGold(other,Value_Beer))	{
		Info_AddChoice(DIA_Coragon_Beer_Rupert,C_BuildPriceString("Налей кружечку ",Value_Beer),DIA_Coragon_Beer_Rupert_Yes);
	};
};
func void DIA_Coragon_Beer_Rupert_No()
{
	AI_Output(other,self,"DIA_Coragon_Beer_Rupert_No_03_00");	//В кредит?
	AI_Output(self,other,"DIA_Coragon_Beer_Rupert_No_09_01");	//В кредит только вода.
	Info_ClearChoices(DIA_Coragon_Beer_Rupert);
};
func void DIA_Coragon_Beer_Rupert_Yes()
{
	AI_Output(other,self,"DIA_Coragon_Beer_Rupert_Yes_03_00");	//Налей кружечку.
	B_GiveInvItems(other,self,ItMi_Gold,Value_Beer);
	AI_Output(self,other,"DIA_Coragon_Beer_Rupert_Yes_09_01");	//О, ты сегодня при деньгах. Прошу.
	B_GiveInvItems(self,other,ItFo_Beer,1);
	Info_ClearChoices(DIA_Coragon_Beer_Rupert);
};
//-----------------------------------------
var int DIA_Coragon_MRTrade_Once;
instance DIA_Coragon_MRTrade(C_INFO)
{
	nr = 50;
	npc = VLK_420_Coragon;
	condition = DIA_NoCond_cond;
	information = DIA_Coragon_MRTrade_info;
	description = "Что у тебя сегодня есть?";
	trade = TRUE;
	permanent = TRUE;
};
func void DIA_Coragon_MRTrade_info()
{
	if (!DIA_Coragon_MRTrade_Once)	{
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Coragon_MRTrade_03_00");	//Что у тебя сегодня есть?
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Coragon_MRTrade_07_00");	//Что у тебя сегодня есть?
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Coragon_MRTrade_10_00");	//Что у тебя сегодня есть?
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Coragon_MRTrade_14_00");	//Что у тебя сегодня есть?
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Coragon_MRTrade_16_00");	//Что у тебя сегодня есть?
		};
		AI_Output(self,other,"DIA_Coragon_MRTrade_09_01");	//Все самое свежее.
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Coragon);
		DIA_Coragon_MRTrade_Once = TRUE;
	};
	B_GiveTradeInv_Coragon(self);
};
