

instance DIA_Talbin_EXIT(DIA_Proto_End)
{
	npc = CMP_Talbin;
};


///////////////////////////// ЕЛЕНА ///////////////////////////////
//-----------------------------------------
instance DIA_Talbin_Elena_ShadowFur(C_INFO)
{
	npc = CMP_Talbin;			nr = 20;
	condition = DIA_Talbin_Elena_ShadowFur_cond;
	information = DIA_Talbin_Elena_ShadowFur_info;
	description = "Мне нужна шкура мракориса.";
};
func int DIA_Talbin_Elena_ShadowFur_cond()
{
	if (C_HeroIs_Elena() && (Npc_KnowsInfo(other,DIA_Talbin_MR_Hello) || Npc_KnowsInfo(other,DIA_Bosper_Elena_AskFur))
		 && MIS_Elena_Present_LuteroAskedFur
		 && (MIS_Elena_Present == LOG_Running)
		 && !MIS_Elena_Present_FurGot)	{
		return TRUE;
	};
};
func void DIA_Talbin_Elena_ShadowFur_info()
{
		AI_Output(other,self,"DIA_Talbin_Elena_ShadowFur_16_00");	//А шкуры ты продаешь? Мне нужна шкура мракориса.
	AI_Output(self,other,"DIA_Talbin_Elena_ShadowFur_12_01");	//Вот вы с Боспером заладили - мракорис, мракорис...
	AI_Output(self,other,"DIA_Talbin_Elena_ShadowFur_12_02");	//После конкурса будет вам мракорис. Может быть.
};


///////////////////////////// ВСЕ ///////////////////////////////

// ===============================================
instance DIA_Talbin_MR_Hello(C_INFO)
{
	npc = CMP_Talbin;		nr = 1;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Talbin_MR_Hello_info;
	description = "Ты тоже участвуешь в грибном конкурсе?";
};
func void DIA_Talbin_MR_Hello_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Talbin_MR_Hello_03_00");	//Ты тоже участвуешь в грибном конкурсе?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Talbin_MR_Hello_10_00");	//Ты тоже участвуешь в грибном конкурсе?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Talbin_MR_Hello_14_00");	//Ты тоже участвуешь в грибном конкурсе?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Talbin_MR_Hello_16_00");	//Ты тоже участвуешь в грибном конкурсе?
	};
	AI_Output(self,other,"DIA_Talbin_MR_Hello_07_01");	//Да, я на время сменил цель охоты.
};
// ===============================================
instance DIA_Talbin_Advice(C_INFO)
{
	npc = CMP_Talbin;		nr = 2;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Talbin_Advice_info;
	description = "Дашь мне совет?";
	permanent = TRUE;
};
func void DIA_Talbin_Advice_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Talbin_Advice_03_00");	//Дашь мне совет?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Talbin_Advice_10_00");	//Дашь мне совет?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Talbin_Advice_14_00");	//Дашь мне совет?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Talbin_Advice_16_00");	//Дашь мне совет?
	};
	AI_Output(self,other,"DIA_Talbin_Advice_07_01");	//В лесу смотри по сторонам, иначе рискуешь наткнуться на разъяренного кабана. В этом году их особенно много.
};
// ===============================================
instance DIA_Talbin_PreTrade(C_INFO)
{
	npc = CMP_Talbin;		nr = 3;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Talbin_PreTrade_info;
	description = "Продай мне свои грибы.";
};
func void DIA_Talbin_PreTrade_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Talbin_PreTrade_03_00");	//Продай мне свои грибы.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Talbin_PreTrade_10_00");	//Продай мне свои грибы.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Talbin_PreTrade_14_00");	//Продай мне свои грибы.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Talbin_PreTrade_16_00");	//Продай мне свои грибы.
	};
	AI_Output(self,other,"DIA_Talbin_PreTrade_07_01");	//Тебе так охота получить приз Константино?
	AI_Output(self,other,"DIA_Talbin_PreTrade_07_02");	//Ладно, мне нужны деньги.
	AI_Output(self,other,"DIA_Talbin_PreTrade_07_03");	//Я продам тебе некоторые грибы, если ты заплатишь за них больше, чем Константино.
	Talbin_Trade = TRUE;
	B_LogNote(TOPIC_Trader, TOPIC_Trader_Talbin);
};
// ===============================================
var int DIA_Talbin_MRTrade_MR;
var int DIA_Talbin_MRTrade_Cnt;
var int DIA_Talbin_MRTrade_Price;
var int DIA_Talbin_MRTrade_Sum;

func int DIA_Talbin_MRTrade_CheckMR(var string mrName, var int mrInst, var int mrIndex, var func choice)
{
	var int cnt; cnt = Npc_HasItems(self, mrInst);
	if (cnt > 0)	{
		var int price; price = MEM_ReadStatArr(MR_Price, mrIndex) * 11 / 10 + 1;
		DIA_Talbin_MRTrade_Sum += price * cnt;
		Info_AddChoice(DIA_Talbin_MRTrade, CS5(mrName, " (", IntToString(price)," зол.)", ""), choice);
		return TRUE;
	};
	return FALSE;
};

instance DIA_Talbin_MRTrade(C_INFO)
{
	npc = CMP_Talbin;		nr = 4;
	condition = DIA_Talbin_MRTrade_cond;
	information = DIA_Talbin_MRTrade_info;
	description = "(купить грибы)";
	permanent = TRUE;
};
func int DIA_Talbin_MRTrade_cond()
{
	if (Talbin_Trade && DIA_WhileCompetition_cond())	{
		return TRUE;
	};
};
func void DIA_Talbin_MRTrade_info()
{
	DIA_Talbin_MRTrade_MR = 0;
	DIA_Talbin_MRTrade_Cnt = 0;
	DIA_Talbin_MRTrade_Price = 0;
	DIA_Talbin_MRTrade_Sum = 0;
	Info_ClearChoices(DIA_Talbin_MRTrade);
	Info_AddChoice(DIA_Talbin_MRTrade,Dialog_Back,DIA_Talbin_MRTrade_Back);
	var int HasMrms;	HasMrms = FALSE;
	HasMrms = HasMrms | DIA_Talbin_MRTrade_CheckMR("Болтун", ItMr_Red, MR_Red, DIA_Talbin_MRTrade_Red);
	HasMrms = HasMrms | DIA_Talbin_MRTrade_CheckMR("Сосновик", ItMr_Piny, MR_Piny, DIA_Talbin_MRTrade_Piny);
	HasMrms = HasMrms | DIA_Talbin_MRTrade_CheckMR("Каменка", ItMr_Stone, MR_Stone, DIA_Talbin_MRTrade_Stone);
	HasMrms = HasMrms | DIA_Talbin_MRTrade_CheckMR("Масляк", ItMr_BrownOiler, MR_BrownOiler, DIA_Talbin_MRTrade_BrownOiler);
	HasMrms = HasMrms | DIA_Talbin_MRTrade_CheckMR("Дамские уши", ItMr_LadysEar, MR_LadysEar, DIA_Talbin_MRTrade_LadysEar);
	HasMrms = HasMrms | DIA_Talbin_MRTrade_CheckMR("Кабанчик", ItMr_KeilSmall, MR_Keil, DIA_Talbin_MRTrade_Keil);
	HasMrms = HasMrms | DIA_Talbin_MRTrade_CheckMR("Губернатор", ItMr_Governor, MR_Governor, DIA_Talbin_MRTrade_Governor);
	HasMrms = HasMrms | DIA_Talbin_MRTrade_CheckMR("Пища рудокопа", ItPl_Mushroom_02, MR_02, DIA_Talbin_MRTrade_MR02);
	HasMrms = HasMrms | DIA_Talbin_MRTrade_CheckMR("Темный гриб", ItPl_Mushroom_01, MR_01, DIA_Talbin_MRTrade_MR01);
	if (!HasMrms)	{
		AI_Output(self,other,"DIA_Talbin_MRTrade_No_07_01");	//У меня сейчас нет больше грибов.
	}
	else	{
		Info_AddChoice(DIA_Talbin_MRTrade,CS3("все грибы (",IntToString(DIA_Talbin_MRTrade_Sum)," зол.)"),DIA_Talbin_MRTrade_All);
	};
};
//-----------------------------
func void DIA_Talbin_MRTrade_MenuCnt()
{
	Info_ClearChoices(DIA_Talbin_MRTrade);
	Info_AddChoice(DIA_Talbin_MRTrade,Dialog_Back,DIA_Talbin_MRTrade_info);
	Info_AddChoice(DIA_Talbin_MRTrade,"1 шт.",DIA_Talbin_MRTrade_Cnt1);
	if (DIA_Talbin_MRTrade_Cnt >= 5)	{
		Info_AddChoice(DIA_Talbin_MRTrade,"5 шт.",DIA_Talbin_MRTrade_Cnt5);
	};
	if (DIA_Talbin_MRTrade_Cnt > 1)	{
		Info_AddChoice(DIA_Talbin_MRTrade,CS3("все (",IntToString(DIA_Talbin_MRTrade_Cnt)," шт.)"),DIA_Talbin_MRTrade_DoTrade);
	};
};
//-----------------------------
func void DIA_Talbin_MRTrade_Back()
{
	Info_ClearChoices(DIA_Talbin_MRTrade);
};
//-----------------------------
func void DIA_Talbin_MRTrade_DoTrade()
{
	if (B_GiveGold(other,self,DIA_Talbin_MRTrade_Cnt * DIA_Talbin_MRTrade_Price))	{
		AI_Output(self,other,"DIA_Talbin_MRTrade_07_01");	//Вот твои грибы.
		B_GiveInvItems(self,other,DIA_Talbin_MRTrade_MR,DIA_Talbin_MRTrade_Cnt);
	}
	else	{
		AI_Output(self,other,"DIA_Talbin_MRTrade_07_02");	//У тебя нет столько золота.
	};
	DIA_Talbin_MRTrade_info();
};
//-
//-----------------------------
func void DIA_Talbin_MRTrade_All()
{
	if (B_GiveGold(other,self,DIA_Talbin_MRTrade_Sum))	{
		AI_Output(self,other,"DIA_Talbin_MRTrade_07_01");	//Вот твои грибы.
		B_GiveInvItems(self,other,ItMr_Red,Npc_HasItems(self,ItMr_Red));
		B_GiveInvItems(self,other,ItMr_Piny,Npc_HasItems(self,ItMr_Piny));
		B_GiveInvItems(self,other,ItMr_Stone,Npc_HasItems(self,ItMr_Stone));
		B_GiveInvItems(self,other,ItMr_BrownOiler,Npc_HasItems(self,ItMr_BrownOiler));
		B_GiveInvItems(self,other,ItMr_LadysEar,Npc_HasItems(self,ItMr_LadysEar));
		B_GiveInvItems(self,other,ItMr_KeilSmall,Npc_HasItems(self,ItMr_KeilSmall));
		B_GiveInvItems(self,other,ItMr_Governor,Npc_HasItems(self,ItMr_Governor));
		B_GiveInvItems(self,other,ItPl_Mushroom_01,Npc_HasItems(self,ItPl_Mushroom_01));
		B_GiveInvItems(self,other,ItPl_Mushroom_02,Npc_HasItems(self,ItPl_Mushroom_02));
		DIA_Talbin_MRTrade_Sum = 0;
		DIA_Talbin_MRTrade_Cnt = 0;
		DIA_Talbin_MRTrade_MR = 0;
		Info_ClearChoices(DIA_Talbin_MRTrade);
	}
	else	{
		AI_Output(self,other,"DIA_Talbin_MRTrade_07_02");	//У тебя нет столько золота.
		DIA_Talbin_MRTrade_info();
	};
};
//-----------------------------
func void DIA_Talbin_MRTrade_Red()
{
	DIA_Talbin_MRTrade_MR = Hlp_GetInstanceID(ItMr_Red);
	DIA_Talbin_MRTrade_Cnt = Npc_HasItems(self,ItMr_Red);
	DIA_Talbin_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Red) * 11 / 10 + 1;
	DIA_Talbin_MRTrade_MenuCnt();
};
func void DIA_Talbin_MRTrade_Piny()
{
	DIA_Talbin_MRTrade_MR = Hlp_GetInstanceID(ItMr_Piny);
	DIA_Talbin_MRTrade_Cnt = Npc_HasItems(self,ItMr_Piny);
	DIA_Talbin_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Piny) * 11 / 10 + 1;
	DIA_Talbin_MRTrade_MenuCnt();
};
func void DIA_Talbin_MRTrade_Stone()
{
	DIA_Talbin_MRTrade_MR = Hlp_GetInstanceID(ItMr_Stone);
	DIA_Talbin_MRTrade_Cnt = Npc_HasItems(self,ItMr_Stone);
	DIA_Talbin_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Stone) * 11 / 10 + 1;
	DIA_Talbin_MRTrade_MenuCnt();
};
func void DIA_Talbin_MRTrade_BrownOiler()
{
	DIA_Talbin_MRTrade_MR = Hlp_GetInstanceID(ItMr_BrownOiler);
	DIA_Talbin_MRTrade_Cnt = Npc_HasItems(self,ItMr_BrownOiler);
	DIA_Talbin_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_BrownOiler) * 11 / 10 + 1;
	DIA_Talbin_MRTrade_MenuCnt();
};
func void DIA_Talbin_MRTrade_LadysEar()
{
	DIA_Talbin_MRTrade_MR = Hlp_GetInstanceID(ItMr_LadysEar);
	DIA_Talbin_MRTrade_Cnt = Npc_HasItems(self,ItMr_LadysEar);
	DIA_Talbin_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_LadysEar) * 11 / 10 + 1;
	DIA_Talbin_MRTrade_MenuCnt();
};
func void DIA_Talbin_MRTrade_Keil()
{
	DIA_Talbin_MRTrade_MR = Hlp_GetInstanceID(ItMr_KeilSmall);
	DIA_Talbin_MRTrade_Cnt = Npc_HasItems(self,ItMr_KeilSmall);
	DIA_Talbin_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Keil) * 11 / 10 + 1;
	DIA_Talbin_MRTrade_MenuCnt();
};
func void DIA_Talbin_MRTrade_Governor()
{
	DIA_Talbin_MRTrade_MR = Hlp_GetInstanceID(ItMr_Governor);
	DIA_Talbin_MRTrade_Cnt = Npc_HasItems(self,ItMr_Governor);
	DIA_Talbin_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Governor) * 11 / 10 + 1;
	DIA_Talbin_MRTrade_MenuCnt();
};
func void DIA_Talbin_MRTrade_MR02()
{
	DIA_Talbin_MRTrade_MR = Hlp_GetInstanceID(ItPl_Mushroom_02);
	DIA_Talbin_MRTrade_Cnt = Npc_HasItems(self,ItPl_Mushroom_02);
	DIA_Talbin_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_02) * 11 / 10 + 1;
	DIA_Talbin_MRTrade_MenuCnt();
};
func void DIA_Talbin_MRTrade_MR01()
{
	DIA_Talbin_MRTrade_MR = Hlp_GetInstanceID(ItPl_Mushroom_01);
	DIA_Talbin_MRTrade_Cnt = Npc_HasItems(self,ItPl_Mushroom_01);
	DIA_Talbin_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_01) * 11 / 10 + 1;
	DIA_Talbin_MRTrade_MenuCnt();
};
//-----------------------------
func void DIA_Talbin_MRTrade_Cnt1()
{
	DIA_Talbin_MRTrade_Cnt = 1;
	DIA_Talbin_MRTrade_DoTrade();
};
func void DIA_Talbin_MRTrade_Cnt5()
{
	DIA_Talbin_MRTrade_Cnt = 5;
	DIA_Talbin_MRTrade_DoTrade();
};

// ПОСЛЕ ОКОНЧАНИЯ КОНКУРСА ===============================
instance DIA_Talbin_After_HeroWon(C_INFO)
{
	npc = CMP_Talbin;		nr = 10;
	condition = DIA_Talbin_After_HeroWon_cond;
	information = DIA_Talbin_After_HeroWon_info;
	important = TRUE;
};
func int DIA_Talbin_After_HeroWon_cond()
{
	if (!DIA_WhileCompetition_cond()
		&& (Competition_Result == Competition_Result_WON))
	{
		return TRUE;
	};
};
func void DIA_Talbin_After_HeroWon_info()
{
	AI_Output(self,other,"DIA_Talbin_After_HeroWon_10_01");	//Ух ты, смотри, кто идет!
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Talbin_After_HeroWon_10_02m");	//Лучший грибник Хориниса!
	}
	else	{
		AI_Output(self,other,"DIA_Talbin_After_HeroWon_10_02f");	//Лучшая грибниха... грибница... В общем - главная по грибам!
	};
};
// ===============================================
instance DIA_Talbin_After_Won(C_INFO)
{
	npc = CMP_Talbin;		nr = 11;
	condition = DIA_Talbin_After_Won_cond;
	information = DIA_Talbin_After_Won_info;
	description = "Поздравляю первого охотника!";
};
func int DIA_Talbin_After_Won_cond()
{
	if (!DIA_WhileCompetition_cond())
	{
		if ((C_CountResults() == Competition_Result_LOST) && Competition_Winner == Hlp_GetInstanceID(self))	{
			return TRUE;
		};
	};
};
func void DIA_Talbin_After_Won_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Talbin_After_Won_03_00");	//Поздравляю первого охотника! Охотника за грибами.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Talbin_After_Won_10_00");	//Поздравляю первого охотника! Охотника за грибами.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Talbin_After_Won_14_00");	//Поздравляю первого охотника! Охотника за грибами.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Talbin_After_Won_16_00");	//Поздравляю первого охотника! Охотника за грибами.
	};
	AI_Output(self,other,"DIA_Talbin_After_Won_10_01");	//Спасибо на добром слове.
};

// ===============================================
instance DIA_Talbin_After_Perm(C_INFO)
{
	npc = CMP_Talbin;		nr = 12;
	condition = DIA_Talbin_After_Perm_cond;
	information = DIA_Talbin_After_Perm_info;
	description = "Что теперь будешь делать?";
	permanent = TRUE;
};
func int DIA_Talbin_After_Perm_cond()
{
	if (!DIA_WhileCompetition_cond())
	{
		return TRUE;
	};
};
func void DIA_Talbin_After_Perm_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Talbin_After_Perm_03_00");	//Что теперь будешь делать?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Talbin_After_Perm_10_00");	//Что теперь будешь делать?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Talbin_After_Perm_14_00");	//Что теперь будешь делать?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Talbin_After_Perm_16_00");	//Что теперь будешь делать?
	};
	AI_Output(self,other,"DIA_Talbin_After_Perm_10_01");	//Как обычно - охотиться.
};

// ===============================================
instance DIA_Talbin_After_ShadowFur(C_INFO)
{
	npc = CMP_Talbin;		nr = 13;
	condition = DIA_Talbin_After_ShadowFur_cond;
	information = DIA_Talbin_After_ShadowFur_info;
	description = "Тебе шкура мракориса не нужна?";
};
func int DIA_Talbin_After_ShadowFur_cond()
{
	if (Npc_KnowsInfo(other,DIA_Talbin_MR_Hello)
		&& Npc_HasItems(other,ItAt_ShadowFur))
	{
		return TRUE;
	};
};
func void DIA_Talbin_After_ShadowFur_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Talbin_After_ShadowFur_03_00");	//Тебе шкура мракориса не нужна?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Talbin_After_ShadowFur_10_00");	//Тебе шкура мракориса не нужна?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Talbin_After_ShadowFur_14_00");	//Тебе шкура мракориса не нужна?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Talbin_After_ShadowFur_16_00");	//Тебе шкура мракориса не нужна?
	};
	AI_Output(self,other,"DIA_Talbin_After_ShadowFur_10_01");	//Пригодится. Могу дать за нее 75 золотых. 
	AI_Output(self,other,"DIA_Talbin_After_ShadowFur_10_02");	//Это больше, чем ты получишь у Боспера или другого торговца.
};


// ===============================================
instance DIA_Talbin_After_ShadowFur_Sell(C_INFO)
{
	npc = CMP_Talbin;		nr = 14;
	condition = DIA_Talbin_After_ShadowFur_Sell_cond;
	information = DIA_Talbin_After_ShadowFur_Sell_info;
	description = "Я продам тебе шкуру. (75 зол.)";
	permanent = TRUE;
};
func int DIA_Talbin_After_ShadowFur_Sell_cond()
{
	if (Npc_KnowsInfo(other,DIA_Talbin_After_ShadowFur)
		&& Npc_HasItems(other,ItAt_ShadowFur))
	{
		return TRUE;
	};
};
func void DIA_Talbin_After_ShadowFur_Sell_info()
{
	B_TradeItems(other,self,ItAt_ShadowFur,1,75);
};
