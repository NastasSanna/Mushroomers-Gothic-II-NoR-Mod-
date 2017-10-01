
instance DIA_Isgaroth_EXIT(DIA_Proto_End)
{
	npc = KDF_509_Isgaroth;
};

// ТОРГОВЛЯ ==============================================
var int DIA_Isgaroth_MRTrade_Once;
instance DIA_Isgaroth_MRTrade(C_INFO)
{
	nr = 50;
	npc = KDF_509_Isgaroth;
	condition = DIA_Isgaroth_MRTrade_cond;
	information = DIA_Isgaroth_MRTrade_info;
	description = "Могу я купить что-нибудь?";
	trade = TRUE;
	permanent = TRUE;
};
func int DIA_Isgaroth_MRTrade_cond()
{
	if(C_HeroIs_Odo())	{
		DIA_Isgaroth_MRTrade.description = "Могу я купить что-нибудь у вас?";
	};
	return TRUE;
};
func void DIA_Isgaroth_MRTrade_info()
{
	if (!DIA_Isgaroth_MRTrade_Once)	{
		if (C_HeroIs_Odo())	{				//Одо
			AI_Output(other,self,"DIA_Isgaroth_MRTrade_Odo_03_00");	//Могу я купить что-нибудь у вас?
		} else if (hero.voice == 3)	{		//Руперт
			AI_Output(other,self,"DIA_Isgaroth_MRTrade_03_00");	//Могу я купить что-нибудь?
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Isgaroth_MRTrade_07_00");	//Могу я купить что-нибудь?
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Isgaroth_MRTrade_10_00");	//Могу я купить что-нибудь?
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Isgaroth_MRTrade_14_00");	//Могу я купить что-нибудь?
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Isgaroth_MRTrade_16_00");	//Могу я купить что-нибудь?
		};	
		AI_Output(self,other,"DIA_Isgaroth_MRTrade_01_01");	//Да, у меня есть магические свитки.
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Isgaroth);
		DIA_Isgaroth_MRTrade_Once = TRUE;
	};
	B_GiveTradeInv_Isgaroth(self);
};

// ==============================================
instance DIA_Isgaroth_Advice(C_INFO)
{
	nr = 1;
	npc = KDF_509_Isgaroth;
	condition = DIA_Isgaroth_Advice_cond;
	information = DIA_Isgaroth_Advice_info;
	description = "Ты можешь дать мне совет?";
	permanent = TRUE;
};
func int DIA_Isgaroth_Advice_cond()
{
	if(C_HeroIs_Odo())	{
		DIA_Isgaroth_Advice.description = "Вы можете дать мне совет, мастер?";
	};
	return TRUE;
};
func void DIA_Isgaroth_Advice_info()
{
	if (C_HeroIs_Odo())	{				//Одо
		AI_Output(other,self,"DIA_Isgaroth_Advice_Odo_03_00");	//Вы можете дать мне совет, мастер?
	} else if (hero.voice == 3)	{		//Руперт
		AI_Output(other,self,"DIA_Isgaroth_Advice_03_00");	//Ты можешь дать мне совет?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Isgaroth_Advice_07_00");	//Ты можешь дать мне совет?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Isgaroth_Advice_10_00");	//Ты можешь дать мне совет?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Isgaroth_Advice_14_00");	//Ты можешь дать мне совет?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Isgaroth_Advice_16_00");	//Ты можешь дать мне совет?
	};	
	AI_Output(self,other,"DIA_Isgaroth_Advice_01_01");	//По всему острову расставлено множество изваяний Инноса.
	AI_Output(self,other,"DIA_Isgaroth_Advice_01_02");	//Не забывай о каждодневной молитве, и его Свет озарит тебя.
};

