
instance DIA_Alwin_EXIT(DIA_Proto_End)
{
	npc = Vlk_424_Alwin;
};

// ==============================================
instance DIA_Alwin_NoTrade(C_INFO)
{
	nr = 1;
	npc = Vlk_424_Alwin;
	condition = DIA_NoCond_cond;
	information = DIA_Alwin_NoTrade_info;
	description = "Можно купить у тебя мясо?";
};
func void DIA_Alwin_NoTrade_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Alwin_NoTrade_03_00");	//Можно купить у тебя мясо?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Alwin_NoTrade_07_00");	//Можно купить у тебя мясо?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Alwin_NoTrade_10_00");	//Можно купить у тебя мясо?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Alwin_NoTrade_14_00");	//Можно купить у тебя мясо?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Alwin_NoTrade_16_00");	//Можно купить у тебя мясо?
	};
	if (!C_HeroIs_Sarah())	{
		AI_Output(self,other,"DIA_Alwin_NoTrade_12_01");	//Нет. Я забиваю овец для городской стражи.
		AI_Output(self,other,"DIA_Alwin_NoTrade_12_02");	//Они приводят их с ферм в качестве налогов, а потом отправляют в свои бездонные желудки.
	}
	else	{
		AI_Output(self,other,"DIA_Alwin_NoTrade_12_03");	//Сара, ты прекрасно знаешь, что если я начну продавать мясо на сторону, стражники с меня шкуру спустят!
	};
};

// ==============================================
var int DIA_Alwin_News_Once;
instance DIA_Alwin_News(C_INFO)
{
	nr = 2;
	npc = Vlk_424_Alwin;
	condition = DIA_NoCond_cond;
	information = DIA_Alwin_News_info;
	permanent = TRUE;
	description = "Какие новости?";
};
func void DIA_Alwin_News_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Alwin_News_03_00");	//Какие новости?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Alwin_News_07_00");	//Какие новости?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Alwin_News_10_00");	//Какие новости?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Alwin_News_14_00");	//Какие новости?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Alwin_News_16_00");	//Какие новости?
	};
	if (MIS_FellanGoHome_Returned)	{
		AI_Output(self,other,"DIA_Alwin_News2_12_01");	//С тех пор как мой сосед Феллан вернулся домой, у меня нет ни минуты покоя!
		AI_Output(self,other,"DIA_Alwin_News2_12_02");	//Он все стучит, и стучит, и стучит... Целый день! Когда уже это кончится?!
	}
	else	if (!DIA_Alwin_News_Once)	{
		AI_Output(self,other,"DIA_Alwin_News1_12_01");	//Мой сосед Феллан, похоже, совсем выжил из ума.
		AI_Output(self,other,"DIA_Alwin_News1_12_02");	//Пару недель ходил как в воду опущенный. Что-то бормотал, что “скоро все рухнет“.
		AI_Output(self,other,"DIA_Alwin_News1_12_03");	//А потом просто ушел посреди ночи и поселился прямо на причале. Ждет корабль, чтобы уплыть с острова.
		AI_Output(self,other,"DIA_Alwin_News1_12_04");	//Жена каждый день уговаривает его вернуться домой, но он и слушать не хочет.
		DIA_Alwin_News_Once = TRUE;
		MIS_FellanGoHome_WifeWaits = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Alwin_News0_12_01");	//В порту все по-прежнему. Только эта овечка становится все толще и толще.
	};
};

