
instance DIA_Ignaz_EXIT(DIA_Proto_End)
{
	npc = VLK_498_Ignaz;
};

instance DIA_Ignaz_Hello(C_INFO)
{
	nr = 0;
	npc = VLK_498_Ignaz;
	condition = DIA_WhenAsked_cond;
	information = DIA_Ignaz_MR_Hello_info;
	important = TRUE;
};
func void DIA_Ignaz_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Ignaz_MR_Hello_12_00");	//Что тебе нужно?
	if (Wld_IsTime(4,30,23,30))		{
		AI_Output(self,other,"DIA_Ignaz_MR_Hello_12_01");	//Ты не видишь, я занят!
	}
	else	{
		AI_Output(self,other,"DIA_Ignaz_MR_Hello_12_02");	//Ты не видишь, я отдыхаю!
	};
};

// Кулинарные изыски ===================================================
instance DIA_Ignaz_AskRecipe(C_Info)
{
	npc = VLK_498_Ignaz;				nr = 10;
	condition = DIA_Ignaz_AskRecipe_cond;
	information = DIA_Ignaz_AskRecipe_Info;
	description = "А у тебя нет рецепта для таких розовых грибов?";
};
func int DIA_Ignaz_AskRecipe_cond()
{
	if (MIS_Cookery == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Ignaz_AskRecipe_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_03_00");	//А у тебя нет рецепта для таких розовых грибов?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_07_00");	//А у тебя нет рецепта для таких розовых грибов?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_10_00");	//А у тебя нет рецепта для таких розовых грибов?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_14_00");	//А у тебя нет рецепта для таких розовых грибов?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_16_00");	//А у тебя нет рецепта для таких розовых грибов?
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_14_01");	//Дамские уши? О, ты как раз вовремя.
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_14_02");	//Я приготовил из них одно зелье, но мне нужно проверить его эффект.
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_14_03");	//Я с удовольствием предоставлю тебе эту честь!
	Info_ClearChoices(DIA_Ignaz_AskRecipe);
	Info_AddChoice(DIA_Ignaz_AskRecipe,"Нет уж, спасибо. Пей сам свое зелье!",DIA_Ignaz_AskRecipe_No);
	Info_AddChoice(DIA_Ignaz_AskRecipe,"Давай твое зелье.",DIA_Ignaz_AskRecipe_GiveMe);
	Info_AddChoice(DIA_Ignaz_AskRecipe,"А это безопасно?",DIA_Ignaz_AskRecipe_IsItSafe);
	Info_AddChoice(DIA_Ignaz_AskRecipe,"А какой у него эффект?",DIA_Ignaz_AskRecipe_WhatEffect);
};
func void DIA_Ignaz_AskRecipe_WhatEffect()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_WhatEffect_03_00");	//А какой у него эффект?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_WhatEffect_07_00");	//А какой у него эффект?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_WhatEffect_10_00");	//А какой у него эффект?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_WhatEffect_14_00");	//А какой у него эффект?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_WhatEffect_16_00");	//А какой у него эффект?
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_14_WhatEffect_01");	//Оно должно полностью исцелять любые раны.
};

func void DIA_Ignaz_AskRecipe_IsItSafe()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_IsItSafe_03_00");	//А это безопасно?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_IsItSafe_07_00");	//А это безопасно?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_IsItSafe_10_00");	//А это безопасно?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_IsItSafe_14_00");	//А это безопасно?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_IsItSafe_16_00");	//А это безопасно?
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_14_IsItSafe_01");	//О, не волнуйся. В зелье нет ни одного смертельно опасного ингредиента.
};
func void DIA_Ignaz_AskRecipe_No()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_No_03_00");	//Нет уж, спасибо. Пей сам свое зелье!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_No_07_00");	//Нет уж, спасибо. Пей сам свое зелье!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_No_10_00");	//Нет уж, спасибо. Пей сам свое зелье!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_No_14_00");	//Нет уж, спасибо. Пей сам свое зелье!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_No_16_00");	//Нет уж, спасибо. Пей сам свое зелье!
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_14_No_01");	//Очень жаль. Ты упускаешь редкий шанс послужить науке!
	Info_ClearChoices(DIA_Ignaz_AskRecipe);
};
func void DIA_Ignaz_AskRecipe_GiveMe()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_GiveMe_03_00");	//Давай твое зелье.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_GiveMe_07_00");	//Давай твое зелье.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_GiveMe_10_00");	//Давай твое зелье.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_GiveMe_14_00");	//Давай твое зелье.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_GiveMe_16_00");	//Давай твое зелье.
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_GiveMe_14_01");	//Вот.
	B_GiveInvItems(self,other,ItPo_MR_IgnazEar,1);
	// если не ранены - Игнац все устроит
	if (other.attribute[ATR_HITPOINTS] > other.attribute[ATR_HITPOINTS_MAX] - 5)	{
		AI_Output(self,other,"DIA_Ignaz_AskRecipe_GiveMe_14_02");	//Только у тебя нет ран, которые могло бы исцелить зелье... Сейчас мы это исправим.
		//бьет ГГ серпом
		if (!Npc_HasEquippedMeleeWeapon(self))	{
			CreateInvItem(self,ItMw_1h_Bau_Axe);
		};
		AI_EquipBestMeleeWeapon(self);
		AI_SetWalkmode(self,NPC_RUN);
		AI_GotoNpc(self,other);
		AI_ReadyMeleeWeapon(self);
		AI_PlayAniBS(self,"T_1HATTACKMOVE",BS_PARADE);
		AI_RemoveWeapon(self);
		other.attribute[ATR_HITPOINTS] -= 15;
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_GiveMe_14_03");	//Теперь пей скорее, мне не терпится увидеть результат!
	Info_ClearChoices(DIA_Ignaz_AskRecipe);
	Info_AddChoice(DIA_Ignaz_AskRecipe,"(отказаться)",DIA_Ignaz_AskRecipe_NoDrink);
	Info_AddChoice(DIA_Ignaz_AskRecipe,"(выпить)",DIA_Ignaz_AskRecipe_Drink);
};
func void DIA_Ignaz_AskRecipe_NoDrink()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_NoDrink_03_00");	//Знаешь, я передумал. Выглядит как-то подозрительно...
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_NoDrink_07_00");	//Знаешь, я передумал. Выглядит как-то подозрительно...
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_NoDrink_10_00");	//Знаешь, я передумал. Выглядит как-то подозрительно...
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_NoDrink_14_00");	//Знаешь, я передумал. Выглядит как-то подозрительно...
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_NoDrink_16_00");	//Знаешь, я передумала. Выглядит как-то подозрительно...
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_NoDrink_14_01");	//Твое недоверие оскорбляет меня до глубины души.
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_NoDrink_14_02");	//Но раз ты сомневаешься, верни мне зелье. Я найду другого счастливчика.
	B_GiveInvItems(other,self,ItPo_MR_IgnazEar,1);
	AI_StopProcessInfos(self);
};
func void DIA_Ignaz_AskRecipe_Drink()
{
	B_GivePlayerXP(XP_IgnazEarPotion);
	AI_Output(other,self,"XXX");	//
	B_UseItem(other,ItPo_MR_IgnazEar);
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_Drink_14_00");	//(восторженно) Работает! Раны затягиваются на глазах!..
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_03_01");	//Оох, ну и гадость... Голова раскалывается... И все тело ломит!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_07_01");	//Оох, ну и гадость... Голова раскалывается... И все тело ломит!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_10_01");	//Оох, ну и гадость... Голова раскалывается... И все тело ломит!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_14_01");	//Оох, ну и гадость... Голова раскалывается... И все тело ломит!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_16_01");	//Оох, ну и гадость... Голова раскалывается... И все тело ломит!
	};
	//что-то страшное происходит
	AI_PlayAni(other,"T_STUMBLE");
	B_Say(other,self,"$AARGH_1");
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_03_02");	//(кашляя) Отравитель! Чем ты меня напоил?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_07_02");	//(кашляя) Отравитель! Чем ты меня напоил?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_10_02");	//(кашляя) Отравитель! Чем ты меня напоил?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_14_02");	//(кашляя) Отравитель! Чем ты меня напоил?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_16_02");	//(кашляя) Отравитель! Чем ты меня напоил?
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_Drink_14_03");	//Ничего-ничего. Сейчас пройдет. Выпей водички.
	B_GiveInvItems(self,other,ItFo_Water,1);
	AI_Output(other,self,"XXX");	//
	B_UseItem(other,ItFo_Water);
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_Drink_14_04");	//Полегчало?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_03_05");	//Кажется.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_07_05");	//Кажется.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_10_05");	//Кажется.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_14_05");	//Кажется.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_16_05");	//Кажется.
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_Drink_14_06");	//Неожиданный побочный эффект... Но ведь раны затянулись, все сработало!
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_Drink_14_07");	//Видимо, раненый организм слишком слаб для такого мощного лекарства.
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_Drink_14_08");	//Придется еще поработать над составом.
	Info_ClearChoices(DIA_Ignaz_AskRecipe);
};


/////////////////////////////// САРА //////////////////////////////////

instance DIA_Ignaz_Sarah_AskSmokingCure(C_INFO)
{
	npc = VLK_498_Ignaz;			nr = 21;
	condition = DIA_Ignaz_Sarah_AskSmokingCure_cond;
	information = DIA_Ignaz_Sarah_AskSmokingCure_info;
	description = "У тебя есть очищающее зелье?";
};
func int DIA_Ignaz_Sarah_AskSmokingCure_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_SearchPotion)	{
		return TRUE;
	};
};
func void DIA_Ignaz_Sarah_AskSmokingCure_info()
{
		AI_Output(other,self,"DIA_Ignaz_Sarah_AskSmokingCure_16_00");	//У тебя есть очищающее зелье, которое поможет от курения?
	AI_Output(self,other,"DIA_Ignaz_Sarah_AskSmokingCure_12_01");	//Очищющее зелье? Могу предложить хорошее слабительное.
	AI_Output(self,other,"DIA_Ignaz_Sarah_AskSmokingCure_12_02");	//Очищает от всего и сразу.
		AI_Output(other,self,"DIA_Ignaz_Sarah_AskSmokingCure_16_03");	//Нет, это не то, что мне нужно.
};


// ТОРГОВЛЯ ==============================================
//-----------------------------------------
instance DIA_Ignaz_preTrade(C_INFO)
{
	npc = VLK_498_Ignaz;		nr = 50;
	condition = DIA_NoCond_cond;
	information = DIA_Ignaz_preTrade_info;
	description = "Могу я купить у тебя что-нибудь?";
	trade = TRUE;
};
func void DIA_Ignaz_preTrade_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Harad_NoTrade_03_00");	//Могу я купить у тебя что-нибудь?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Harad_NoTrade_07_00");	//Могу я купить у тебя что-нибудь?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Harad_NoTrade_10_00");	//Могу я купить у тебя что-нибудь?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Harad_NoTrade_14_00");	//Можно купить у тебя что-нибудь?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Harad_NoTrade_16_00");	//Могу я купить у тебя что-нибудь?
	};
	AI_Output(self,other,"DIA_Ignaz_preTrade_12_00");	//У меня есть зелья и кое-какие редкие свитки.
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Ignaz);
	B_GiveTradeInv_Ignaz(self);
};
//-----------------------------------------
instance DIA_Ignaz_Trade(C_INFO)
{
	npc = VLK_498_Ignaz;		nr = 51;
	condition = DIA_Ignaz_Trade_cond;
	information = DIA_Ignaz_Trade_info;
	description = "Я хочу купить кое-что.";
	trade = TRUE;
	permanent = TRUE;
};
func int DIA_Ignaz_Trade_cond()
{
	if (Npc_KnowsInfo(other, DIA_Ignaz_preTrade))	{
		return TRUE;
	};
};
func void DIA_Ignaz_Trade_info()
{
	B_GiveTradeInv_Ignaz(self);
};
