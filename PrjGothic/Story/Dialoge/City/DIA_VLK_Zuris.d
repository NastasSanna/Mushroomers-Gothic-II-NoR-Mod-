
instance DIA_Zuris_EXIT(DIA_Proto_End)
{
	npc = VLK_409_Zuris;
};

// ТОРГОВЛЯ ==============================================

instance DIA_Zuris_Hello(C_INFO)
{
	nr = 1;
	npc = VLK_409_Zuris;
	condition = DIA_WhenAsked_cond;
	information = DIA_Zuris_MR_Hello_info;
	important = TRUE;
};
func void DIA_Zuris_MR_Hello_info()
{
	if (C_HeroIs_Erol())	{
		AI_Output(self,other,"DIA_Zuris_MR_Hello_14_00");	//Доброго дня, уважаемый Эрол. У меня есть несколько новых свитков, не желаете ли взглянуть?
	}
	else
	{
		AI_Output(self,other,"DIA_Zuris_MR_Hello_14_01");	//Лучшие зелья! Целебные травы! Магические свитки.
	};
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Zuris);
};
//-----------------------------------------
instance DIA_Zuris_MRTrade(C_INFO)
{
	nr = 50;
	npc = VLK_409_Zuris;
	condition = DIA_NoCond_cond;
	information = DIA_Zuris_MRTrade_info;
	description = "Я хочу взглянуть на твои товары.";
	trade = TRUE;
	permanent = TRUE;
};
func void DIA_Zuris_MRTrade_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Zuris_MRTrade_03_00");	//Я хочу взглянуть на твои товары.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Zuris_MRTrade_07_00");	//Я хочу взглянуть на твои товары.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Zuris_MRTrade_10_00");	//Я хочу взглянуть на твои товары.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Zuris_MRTrade_14_00");	//Я хочу взглянуть на твои товары.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Zuris_MRTrade_16_00");	//Я хочу взглянуть на твои товары.
	};
	B_GiveTradeInv_Zuris(self);
};
