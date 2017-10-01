

instance DIA_Rupert_EXIT(DIA_Proto_End)
{
	npc = CMP_Rupert;
};

// ===============================================
instance DIA_Rupert_MR_Hello(C_INFO)
{
	npc = CMP_Rupert;		nr = 1;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Rupert_MR_Hello_info;
	description = "Ты тоже участвуешь в конкурсе грибов?";
};
func void DIA_Rupert_MR_Hello_info()
{
	if (hero.voice == 3)	{			//Одо
		AI_Output(other,self,"DIA_Rupert_MR_Hello_03_00");	//Ты тоже участвуешь в конкурсе грибов?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rupert_MR_Hello_07_00");	//Ты тоже участвуешь в конкурсе грибов?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rupert_MR_Hello_10_00");	//Ты тоже участвуешь в конкурсе грибов?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Rupert_MR_Hello_14_00");	//Ты тоже участвуешь в конкурсе грибов?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Rupert_MR_Hello_16_00");	//Ты тоже участвуешь в конкурсе грибов?
	};
	AI_Output(self,other,"DIA_Rupert_MR_Hello_03_01");	//Да. Мне позарез нужны деньги.
};
// ===============================================
instance DIA_Rupert_Advice(C_INFO)
{
	npc = CMP_Rupert;		nr = 2;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Rupert_Advice_info;
	description = "Может, поможешь хотя бы советом?";
};
func void DIA_Rupert_Advice_info()
{
	if (hero.voice == 3)	{			//Одо
		AI_Output(other,self,"DIA_Rupert_Advice_03_00");	//Может, поможешь хотя бы советом?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rupert_Advice_07_00");	//Может, поможешь хотя бы советом?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rupert_Advice_10_00");	//Может, поможешь хотя бы советом?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Rupert_Advice_14_00");	//Может, поможешь хотя бы советом?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Rupert_Advice_16_00");	//Может, поможешь хотя бы советом?
	};
	AI_Output(self,other,"DIA_Rupert_Advice_03_01");	//Ничем не могу помочь.
};
// ===============================================
instance DIA_Rupert_Debt(C_INFO)
{
	npc = CMP_Rupert;		nr = 3;
	condition = DIA_Rupert_Debt_cond;
	information = DIA_Rupert_Debt_info;
	description = "Говорят, ростовщик Лемар дает деньги в долг.";
};
func int DIA_Rupert_Debt_cond()
{
	if (Npc_KnowsInfo(other,DIA_Rupert_MR_Hello))	{
		return TRUE;
	};
};
func void DIA_Rupert_Debt_info()
{
	if (hero.voice == 3)	{			//Одо
		AI_Output(other,self,"DIA_Rupert_Debt_03_00");	//Говорят, ростовщик Лемар дает деньги в долг.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rupert_Debt_07_00");	//Говорят, ростовщик Лемар дает деньги в долг.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rupert_Debt_10_00");	//Говорят, ростовщик Лемар дает деньги в долг.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Rupert_Debt_14_00");	//Говорят, ростовщик Лемар дает деньги в долг.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Rupert_Debt_16_00");	//Говорят, ростовщик Лемар дает деньги в долг.
	};
	AI_Output(self,other,"DIA_Rupert_Debt_03_01");	//Ха, ему-то я и задолжал. Вот тебе мой совет - никогда не связывайся с ростовщиками!
};
// ===============================================
instance DIA_Rupert_PreTrade(C_INFO)
{
	npc = CMP_Rupert;		nr = 4;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Rupert_PreTrade_info;
	description = "Продай мне свои грибы.";
};
func void DIA_Rupert_PreTrade_info()
{
	if (hero.voice == 3)	{			//Одо
		AI_Output(other,self,"DIA_Rupert_PreTrade_03_00");	//Продай мне свои грибы.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rupert_PreTrade_07_00");	//Продай мне свои грибы.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rupert_PreTrade_10_00");	//Продай мне свои грибы.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Rupert_PreTrade_14_00");	//Продай мне свои грибы.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Rupert_PreTrade_16_00");	//Продай мне свои грибы.
	};
	AI_Output(self,other,"DIA_Rupert_PreTrade_03_01");	//Хм, ладно, но я хочу получить не меньше, чем у Константино.
	Rupert_Trade = TRUE;
	B_LogNote(TOPIC_Trader, TOPIC_Trader_Rupert);
};

// ===============================================
var int DIA_Rupert_MRTrade_MR;
var int DIA_Rupert_MRTrade_Cnt;
var int DIA_Rupert_MRTrade_Price;
var int DIA_Rupert_MRTrade_AllSum;

func int DIA_Rupert_MRTrade_CheckMR(var string mrName, var int mrInst, var int mrIndex, var func choice)
{
	var int cnt; cnt = Npc_HasItems(self, mrInst);
	if (cnt > 0)	{
		var int price; price = MEM_ReadStatArr(MR_Price, mrIndex);
		DIA_Rupert_MRTrade_AllSum += price * cnt;
		Info_AddChoice(DIA_Rupert_MRTrade, CS5(mrName, " (", IntToString(price)," зол.)", ""), choice);
		return TRUE;
	};
	return FALSE;
};

instance DIA_Rupert_MRTrade(C_INFO)
{
	npc = CMP_Rupert;		nr = 4;
	condition = DIA_Rupert_MRTrade_cond;
	information = DIA_Rupert_MRTrade_info;
	description = "(купить грибы)";
	permanent = TRUE;
	trade = TRUE;
};
func int DIA_Rupert_MRTrade_cond()
{
	if (Rupert_Trade && DIA_WhileCompetition_cond())	{
		return TRUE;
	};
};
func void DIA_Rupert_MRTrade_info()
{
	DIA_Rupert_MRTrade_MR = 0;
	DIA_Rupert_MRTrade_Cnt = 0;
	DIA_Rupert_MRTrade_Price = 0;
	Info_ClearChoices(DIA_Rupert_MRTrade);
	Info_AddChoice(DIA_Rupert_MRTrade,Dialog_Back,DIA_Rupert_MRTrade_Back);
	var int HasMrms;	HasMrms = FALSE;
	DIA_Rupert_MRTrade_AllSum = 0;
	HasMrms = HasMrms | DIA_Rupert_MRTrade_CheckMR("Болтун", ItMr_Red, MR_Red, DIA_Rupert_MRTrade_Red);
	HasMrms = HasMrms | DIA_Rupert_MRTrade_CheckMR("Сосновик", ItMr_Piny, MR_Piny, DIA_Rupert_MRTrade_Piny);
	HasMrms = HasMrms | DIA_Rupert_MRTrade_CheckMR("Каменка", ItMr_Stone, MR_Stone, DIA_Rupert_MRTrade_Stone);
	HasMrms = HasMrms | DIA_Rupert_MRTrade_CheckMR("Масляк", ItMr_BrownOiler, MR_BrownOiler, DIA_Rupert_MRTrade_BrownOiler);
	HasMrms = HasMrms | DIA_Rupert_MRTrade_CheckMR("Зорьник", ItMr_Sunrise, MR_Sunrise, DIA_Rupert_MRTrade_Sunrise);
	HasMrms = HasMrms | DIA_Rupert_MRTrade_CheckMR("Губернатор", ItMr_Governor, MR_Governor, DIA_Rupert_MRTrade_Governor);
	HasMrms = HasMrms | DIA_Rupert_MRTrade_CheckMR("Трезубец", ItMr_Trident, MR_Trident, DIA_Rupert_MRTrade_Trident);
	HasMrms = HasMrms | DIA_Rupert_MRTrade_CheckMR("Пища рудокопа", ItPl_Mushroom_02, MR_02, DIA_Rupert_MRTrade_MR02);
	HasMrms = HasMrms | DIA_Rupert_MRTrade_CheckMR("Темный гриб", ItPl_Mushroom_01, MR_01, DIA_Rupert_MRTrade_MR01);
	//
	var int cnt;
	var int price;
	cnt = Npc_HasItems(self,ItMr_Red);
	if (cnt)	{
		price = MEM_ReadStatArr(MR_Price,MR_Red);
		DIA_Rupert_MRTrade_AllSum += price * cnt;
		Info_AddChoice(DIA_Rupert_MRTrade,CS3("Болтун (",IntToString(price)," зол.)"),DIA_Rupert_MRTrade_Red);
		HasMrms = TRUE;
	};
	cnt = Npc_HasItems(self,ItMr_Piny);
	if (cnt)	{
		price = MEM_ReadStatArr(MR_Price,MR_Piny);
		DIA_Rupert_MRTrade_AllSum += price * cnt;
		Info_AddChoice(DIA_Rupert_MRTrade,CS3("Сосновик (",IntToString(price)," зол.)"),DIA_Rupert_MRTrade_Piny);
		HasMrms = TRUE;
	};
	cnt = Npc_HasItems(self,ItMr_Stone);
	if (cnt)	{
		price = MEM_ReadStatArr(MR_Price,MR_Stone);
		DIA_Rupert_MRTrade_AllSum += price * cnt;
		Info_AddChoice(DIA_Rupert_MRTrade,CS3("Каменка (",IntToString(price)," зол.)"),DIA_Rupert_MRTrade_Stone);
		HasMrms = TRUE;
	};
	cnt = Npc_HasItems(self,ItMr_BrownOiler);
	if (cnt)	{
		price = MEM_ReadStatArr(MR_Price,MR_BrownOiler);
		DIA_Rupert_MRTrade_AllSum += price * cnt;
		Info_AddChoice(DIA_Rupert_MRTrade,CS3("Масляк (",IntToString(price)," зол.)"),DIA_Rupert_MRTrade_BrownOiler);
		HasMrms = TRUE;
	};
	cnt = Npc_HasItems(self,ItMr_Sunrise);
	if (cnt)	{
		price = MEM_ReadStatArr(MR_Price,MR_Sunrise);
		DIA_Rupert_MRTrade_AllSum += price * cnt;
		Info_AddChoice(DIA_Rupert_MRTrade,CS3("Зорьник (",IntToString(price)," зол.)"),DIA_Rupert_MRTrade_Sunrise);
		HasMrms = TRUE;
	};
	cnt = Npc_HasItems(self,ItMr_Governor);
	if (cnt)	{
		price = MEM_ReadStatArr(MR_Price,MR_Governor);
		DIA_Rupert_MRTrade_AllSum += price * cnt;
		Info_AddChoice(DIA_Rupert_MRTrade,CS3("Губернатор (",IntToString(price)," зол.)"),DIA_Rupert_MRTrade_Governor);
		HasMrms = TRUE;
	};
	cnt = Npc_HasItems(self,ItMr_Trident);
	if (cnt)	{
		price = MEM_ReadStatArr(MR_Price,MR_Trident);
		DIA_Rupert_MRTrade_AllSum += price * cnt;
		Info_AddChoice(DIA_Rupert_MRTrade,CS3("Трезубец (",IntToString(price)," зол.)"),DIA_Rupert_MRTrade_Trident);
		HasMrms = TRUE;
	};
	cnt = Npc_HasItems(self,ItPl_Mushroom_02);
	if (cnt)	{
		price = MEM_ReadStatArr(MR_Price,MR_02);
		DIA_Rupert_MRTrade_AllSum += price * cnt;
		Info_AddChoice(DIA_Rupert_MRTrade,CS3("Пища рудокопа (",IntToString(price)," зол.)"),DIA_Rupert_MRTrade_MR02);
		HasMrms = TRUE;
	};
	cnt = Npc_HasItems(self,ItPl_Mushroom_01);
	if (cnt)	{
		price = MEM_ReadStatArr(MR_Price,MR_01);
		DIA_Rupert_MRTrade_AllSum += price * cnt;
		Info_AddChoice(DIA_Rupert_MRTrade,CS3("Темный гриб (",IntToString(price)," зол.)"),DIA_Rupert_MRTrade_MR01);
		HasMrms = TRUE;
	};
	///
	if (!HasMrms)	{
		AI_Output(self,other,"DIA_Rupert_MRTrade_No_03_01");	//У меня сейчас больше нет грибов на продажу.
		Info_ClearChoices(DIA_Rupert_MRTrade);
	}
	else	{
		Info_AddChoice(DIA_Rupert_MRTrade,CS3("все грибы (всего ",IntToString(DIA_Rupert_MRTrade_AllSum)," зол.)"),DIA_Rupert_MRTrade_All);
	};
};
//-----------------------------
func void DIA_Rupert_MRTrade_MenuCnt()
{
	Info_ClearChoices(DIA_Rupert_MRTrade);
	Info_AddChoice(DIA_Rupert_MRTrade,Dialog_Back,DIA_Rupert_MRTrade_info);
	Info_AddChoice(DIA_Rupert_MRTrade,"1 шт.",DIA_Rupert_MRTrade_Cnt1);
	if (DIA_Rupert_MRTrade_Cnt >= 5)	{
		Info_AddChoice(DIA_Rupert_MRTrade,"5 шт.",DIA_Rupert_MRTrade_Cnt5);
	};
	if (DIA_Rupert_MRTrade_Cnt > 1)	{
		Info_AddChoice(DIA_Rupert_MRTrade,CS3("все (",IntToString(DIA_Rupert_MRTrade_Cnt)," шт.)"),DIA_Rupert_MRTrade_DoTrade);
	};
};
//-----------------------------
func void DIA_Rupert_MRTrade_Back()
{
	Info_ClearChoices(DIA_Rupert_MRTrade);
};
//-----------------------------
func void DIA_Rupert_MRTrade_DoTrade()
{
	if (B_GiveGold(other,self,DIA_Rupert_MRTrade_Cnt * DIA_Rupert_MRTrade_Price))	{
		AI_Output(self,other,"DIA_Rupert_MRTrade_03_01");	//Грибы - тебе, а золото - мне.
		B_GiveInvItems(self,other,DIA_Rupert_MRTrade_MR,DIA_Rupert_MRTrade_Cnt);
	}
	else	{
		AI_Output(self,other,"DIA_Rupert_MRTrade_03_02");	//Я продаю грибы только за золото.
	};
	DIA_Rupert_MRTrade_info();
};
//-----------------------------
func void DIA_Rupert_MRTrade_Red()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItMr_Red);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItMr_Red);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Red);
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_Piny()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItMr_Piny);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItMr_Piny);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Piny);
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_Stone()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItMr_Stone);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItMr_Stone);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Stone);
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_BrownOiler()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItMr_BrownOiler);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItMr_BrownOiler);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_BrownOiler);
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_Sunrise()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItMr_Sunrise);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItMr_Sunrise);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Sunrise);
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_Governor()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItMr_Governor);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItMr_Governor);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Governor);
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_Trident()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItMr_Trident);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItMr_Trident);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Trident);
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_MR02()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItPl_Mushroom_02);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItPl_Mushroom_02);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_02);
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_MR01()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItPl_Mushroom_01);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItPl_Mushroom_01);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_01);
	DIA_Rupert_MRTrade_MenuCnt();
};
//-----------------------------
func void DIA_Rupert_MRTrade_Cnt1()
{
	DIA_Rupert_MRTrade_Cnt = 1;
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_Cnt5()
{
	DIA_Rupert_MRTrade_Cnt = 5;
	DIA_Rupert_MRTrade_MenuCnt();
};
//-----------------------------
func void DIA_Rupert_MRTrade_All()
{
	if (B_GiveGold(other,self,DIA_Rupert_MRTrade_AllSum))	{
		AI_Output(self,other,"DIA_Rupert_MRTrade_03_01");	//Грибы - тебе, а золото - мне.
		B_GiveInvItems(self,other,ItPl_Mushroom_01,Npc_HasItems(self,ItPl_Mushroom_01));
		B_GiveInvItems(self,other,ItPl_Mushroom_02,Npc_HasItems(self,ItPl_Mushroom_02));
		B_GiveInvItems(self,other,ItMr_Red,Npc_HasItems(self,ItMr_Red));
		B_GiveInvItems(self,other,ItMr_Piny,Npc_HasItems(self,ItMr_Piny));
		B_GiveInvItems(self,other,ItMr_Stone,Npc_HasItems(self,ItMr_Stone));
		B_GiveInvItems(self,other,ItMr_Sunrise,Npc_HasItems(self,ItMr_Sunrise));
		B_GiveInvItems(self,other,ItMr_BrownOiler,Npc_HasItems(self,ItMr_BrownOiler));
		B_GiveInvItems(self,other,ItMr_Governor,Npc_HasItems(self,ItMr_Governor));
		B_GiveInvItems(self,other,ItMr_Trident,Npc_HasItems(self,ItMr_Trident));
		
	}
	else	{
		AI_Output(self,other,"DIA_Rupert_MRTrade_03_02");	//Я продаю грибы только за золото.
	};
	Info_ClearChoices(DIA_Rupert_MRTrade);
};
// ПОСЛЕ ОКОНЧАНИЯ КОНКУРСА ===============================
instance DIA_Rupert_After_HeroWon(C_INFO)
{
	npc = CMP_Rupert;		nr = 10;
	condition = DIA_Rupert_After_HeroWon_cond;
	information = DIA_Rupert_After_HeroWon_info;
	important = TRUE;
};
func int DIA_Rupert_After_HeroWon_cond()
{
	if (!DIA_WhileCompetition_cond()
		&& (Competition_Result == Competition_Result_WON))
	{
		return TRUE;
	};
};
func void DIA_Rupert_After_HeroWon_info()
{
	AI_Output(self,other,"DIA_Rupert_After_HeroWon_03_01");	//Это правда, что за победу Константино вручил тебе свою книженцию?
	Info_ClearChoices(DIA_Rupert_After_HeroWon);
	Info_AddChoice(DIA_Rupert_After_HeroWon,"Вранье.",DIA_Rupert_After_HeroWon_False);
	Info_AddChoice(DIA_Rupert_After_HeroWon,"Не книженцию, а отличную книгу!",DIA_Rupert_After_HeroWon_GoodBook);
	Info_AddChoice(DIA_Rupert_After_HeroWon,"Правда.",DIA_Rupert_After_HeroWon_True);
};
func void DIA_Rupert_After_HeroWon_True()
{
	if (hero.voice == 3)	{			//Одо
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_True_03_00");	//Правда.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_True_07_00");	//Правда.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_True_10_00");	//Правда.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_True_14_00");	//Правда.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_True_16_00");	//Правда.
	};
	AI_Output(self,other,"DIA_Rupert_After_HeroWon_True_10_01");	//Да, чего еще ждать от помешаного на грибах алхимика.
	Info_ClearChoices(DIA_Rupert_After_HeroWon);
};
func void DIA_Rupert_After_HeroWon_GoodBook()
{
	if (hero.voice == 3)	{			//Одо
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_GoodBook_03_00");	//Не книженцию, а отличную книгу!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_GoodBook_07_00");	//Не книженцию, а отличную книгу!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_GoodBook_10_00");	//Не книженцию, а отличную книгу!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_GoodBook_14_00");	//Не книженцию, а отличную книгу!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_GoodBook_16_00");	//Не книженцию, а отличную книгу!
	};
	AI_Output(self,other,"DIA_Rupert_After_HeroWon_GoodBook_10_01");	//Ну, тебе виднее.
	Info_ClearChoices(DIA_Rupert_After_HeroWon);
};
func void DIA_Rupert_After_HeroWon_False()
{
	if (hero.voice == 3)	{			//Одо
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_False_03_00");	//Вранье.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_False_07_00");	//Вранье.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_False_10_00");	//Вранье.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_False_14_00");	//Вранье.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_False_16_00");	//Вранье.
	};
	AI_Output(self,other,"DIA_Rupert_After_HeroWon_False_10_01");	//Так и знал! Так что там на самом деле за приз?
	Info_ClearChoices(DIA_Rupert_After_HeroWon);
	Info_AddChoice(DIA_Rupert_After_HeroWon,"Шучу. Это и правда была книга.",DIA_Rupert_After_HeroWon_Joke);
	Info_AddChoice(DIA_Rupert_After_HeroWon,"Баллада о грибах.",DIA_Rupert_After_HeroWon_Song);
	Info_AddChoice(DIA_Rupert_After_HeroWon,"Гриб из чистого золота!",DIA_Rupert_After_HeroWon_Gold);
	Info_AddChoice(DIA_Rupert_After_HeroWon,"Целый чан целебного эликсира.",DIA_Rupert_After_HeroWon_Elixier);
};
func void DIA_Rupert_After_HeroWon_Elixier()
{
	if (hero.voice == 3)	{			//Одо
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Elixier_03_00");	//Целый чан целебного эликсира.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Elixier_07_00");	//Целый чан целебного эликсира.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Elixier_10_00");	//Целый чан целебного эликсира.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Elixier_14_00");	//Целый чан целебного эликсира.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Elixier_16_00");	//Целый чан целебного эликсира.
	};
	AI_Output(self,other,"DIA_Rupert_After_HeroWon_Elixier_10_01");	//Как прозаично.
	Info_ClearChoices(DIA_Rupert_After_HeroWon);
};
func void DIA_Rupert_After_HeroWon_Gold()
{
	if (hero.voice == 3)	{			//Одо
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_03_00");	//Гриб из чистого золота!
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_03_01");	//(заговорщическим шепотом) Знаешь, зачем НА САМОМ ДЕЛЕ Константино объявил конкурс?
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_03_02");	//Он нашел грибософский камень! Который превращает все грибы в золото!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_07_00");	//Гриб из чистого золота!
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_07_01");	//(заговорщическим шепотом) Знаешь, зачем НА САМОМ ДЕЛЕ Константино объявил конкурс?
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_07_02");	//Он нашел грибософский камень! Который превращает все грибы в золото!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_10_00");	//Гриб из чистого золота!
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_10_01");	//(заговорщическим шепотом) Знаешь, зачем НА САМОМ ДЕЛЕ Константино объявил конкурс?
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_10_02");	//Он нашел грибософский камень! Который превращает все грибы в золото!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_14_00");	//Гриб из чистого золота!
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_14_01");	//(заговорщическим шепотом) Знаешь, зачем НА САМОМ ДЕЛЕ Константино объявил конкурс?
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_14_02");	//Он нашел грибософский камень! Который превращает все грибы в золото!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_16_00");	//Гриб из чистого золота!
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_16_01");	//(заговорщическим шепотом) Знаешь, зачем НА САМОМ ДЕЛЕ Константино объявил конкурс?
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_16_02");	//Он нашел грибософский камень! Который превращает все грибы в золото!
	};
	AI_Output(self,other,"DIA_Rupert_After_HeroWon_Gold_10_03");	//А я все гадал - откуда у него столько денег, чтобы нам всем платить?
	AI_Output(self,other,"DIA_Rupert_After_HeroWon_Gold_10_04");	//Мне бы не помешал такой камушек...
	Rupert_LiedGold = TRUE;
	Info_ClearChoices(DIA_Rupert_After_HeroWon);
};
func void DIA_Rupert_After_HeroWon_Song()
{
	if (hero.voice == 3)	{			//Одо
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_03_00");	//Баллада о грибах.
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_03_01");	//Знаешь, у Константино довольно приятный тенор. Только он очень стесняется петь на людях.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_07_00");	//Баллада о грибах.
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_07_01");	//Знаешь, у Константино довольно приятный тенор. Только он очень стесняется петь на людях.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_10_00");	//Баллада о грибах.
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_10_01");	//Знаешь, у Константино довольно приятный тенор. Только он очень стесняется петь на людях.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_14_00");	//Баллада о грибах.
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_14_01");	//Знаешь, у Константино довольно приятный тенор. Только он очень стесняется петь на людях.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_16_00");	//Баллада о грибах.
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_16_01");	//Знаешь, у Константино довольно приятный тенор. Только он очень стесняется петь на людях.
	};
	AI_Output(self,other,"DIA_Rupert_After_HeroWon_Song_10_02");	//Никогда бы не подумал.
	Rupert_LiedSong = True;
	Info_ClearChoices(DIA_Rupert_After_HeroWon);
};
func void DIA_Rupert_After_HeroWon_Joke()
{
	if (hero.voice == 3)	{			//Одо
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Joke_03_00");	//Шучу. Это и правда была книга.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Joke_07_00");	//Шучу. Это и правда была книга.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Joke_10_00");	//Шучу. Это и правда была книга.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Joke_14_00");	//Шучу. Это и правда была книга.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Joke_16_00");	//Шучу. Это и правда была книга.
	};
	Info_ClearChoices(DIA_Rupert_After_HeroWon);
};

// ===============================================
instance DIA_Rupert_After_Won(C_INFO)
{
	npc = CMP_Rupert;		nr = 11;
	condition = DIA_Rupert_After_Won_cond;
	information = DIA_Rupert_After_Won_info;
	description = "Это ты тут победитель конкурса?";
};
func int DIA_Rupert_After_Won_cond()
{
	if (!DIA_WhileCompetition_cond())
	{
		if ((C_CountResults() == Competition_Result_LOST) && Competition_Winner == Hlp_GetInstanceID(self))	{
			return TRUE;
		};
	};
};
func void DIA_Rupert_After_Won_info()
{
	if (hero.voice == 3)	{			//Одо
		AI_Output(other,self,"DIA_Rupert_After_Won_03_00");	//Это ты тут победитель конкурса?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rupert_After_Won_07_00");	//Это ты тут победитель конкурса?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rupert_After_Won_10_00");	//Это ты тут победитель конкурса?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Rupert_After_Won_14_00");	//Это ты тут победитель конкурса?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Rupert_After_Won_16_00");	//Это ты тут победитель конкурса?
	};
	AI_Output(self,other,"DIA_Rupert_After_Won_03_01");	//Ага! Сам от себя такого не ожидал.
};

// ===============================================
instance DIA_Rupert_After_Perm(C_INFO)
{
	npc = CMP_Rupert;		nr = 12;
	condition = DIA_Rupert_After_Perm_cond;
	information = DIA_Rupert_After_Perm_info;
	description = "Чем теперь займешься?";
	permanent = TRUE;
};
func int DIA_Rupert_After_Perm_cond()
{
	if (!DIA_WhileCompetition_cond() && Npc_KnowsInfo(other,DIA_Rupert_MR_Hello))
	{
		return TRUE;
	};
};
func void DIA_Rupert_After_Perm_info()
{
	if (hero.voice == 3)	{			//Одо
		AI_Output(other,self,"DIA_Rupert_After_Perm_03_00");	//Чем теперь займешься?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rupert_After_Perm_07_00");	//Чем теперь займешься?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rupert_After_Perm_10_00");	//Чем теперь займешься?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Rupert_After_Perm_14_00");	//Чем теперь займешься?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Rupert_After_Perm_16_00");	//Чем теперь займешься?
	};
	if (MR_Counter_Rupert < 3000)	{
		AI_Output(self,other,"DIA_Rupert_After_Perm_03_01");	//Постараюсь найти работу.
		if (MR_Counter_Rupert < 1000)	{
			AI_Output(self,other,"DIA_Rupert_After_Perm_03_02");	//(мрачно) Буду возвращать оставшиеся долги.
		};
	}
	else	{
		AI_Output(self,other,"DIA_Rupert_After_Perm_03_03");	//Теперь у меня полно денег, можно и погулять от души!
	};
};
