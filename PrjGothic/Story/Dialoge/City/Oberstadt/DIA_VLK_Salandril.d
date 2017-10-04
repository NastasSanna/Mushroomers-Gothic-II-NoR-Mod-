
instance DIA_Salandril_EXIT(DIA_Proto_End)
{
	npc = VLK_422_Salandril;
};

/////////////////////////////// САРА //////////////////////////////////

instance DIA_Salandril_Sarah_AskSmokingCure(C_INFO)
{
	npc = VLK_422_Salandril;			nr = 1;
	condition = DIA_Salandril_Sarah_AskSmokingCure_cond;
	information = DIA_Salandril_Sarah_AskSmokingCure_info;
	description = "У тебя нет зелья, которое помогло бы курильщику?";
};
func int DIA_Salandril_Sarah_AskSmokingCure_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_SearchPotion)	{
		return TRUE;
	};
};
func void DIA_Salandril_Sarah_AskSmokingCure_info()
{
		AI_Output(other,self,"DIA_Salandril_Sarah_AskSmokingCure_16_00");	//У тебя нет зелья, которое помогло бы курильщику?
	AI_Output(self,other,"DIA_Salandril_Sarah_AskSmokingCure_13_01");	//Что, еще кто-то связался с болотной травой? Впрочем, это не мое дело.
	AI_Output(self,other,"DIA_Salandril_Sarah_AskSmokingCure_13_02");	//Мне удалось создать очень сильный состав, который может очистить организм буквально за несколько дней.
	AI_Output(self,other,"DIA_Salandril_Sarah_AskSmokingCure_13_03");	//Но мне нужны кое-какие ингредиенты.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_SalandrilKnowsPotion);
	MIS_Sarah_BadHabit_SearchPotion = FALSE;	//больше не ищем
};

// ==============================================
instance DIA_Salandril_Sarah_WhatIngredients(C_INFO)
{
	npc = VLK_422_Salandril;			nr = 2;
	condition = DIA_Salandril_Sarah_WhatIngredients_cond;
	information = DIA_Salandril_Sarah_WhatIngredients_info;
	description = "Какие ингредиенты тебе нужны?";
};
func int DIA_Salandril_Sarah_WhatIngredients_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && (Npc_KnowsInfo(other,DIA_Salandril_Sarah_AskSmokingCure)))	{
		return TRUE;
	};
};
func void DIA_Salandril_Sarah_WhatIngredients_info()
{
		AI_Output(other,self,"DIA_Salandril_Sarah_WhatIngredients_16_00");	//Какие ингредиенты тебе нужны?
	AI_Output(self,other,"DIA_Salandril_Sarah_WhatIngredients_13_01");	//Во-первых, подобное будем лечить подобным.
	AI_Output(self,other,"DIA_Salandril_Sarah_WhatIngredients_13_02");	//Нужны три стебля болотной травы. Она иногда вырастает возле озер и в сырых низинах.
	AI_Output(self,other,"DIA_Salandril_Sarah_WhatIngredients_13_03");	//Во-вторых, мне нужен довольно редкий гриб - драконовы слезы.
	AI_Output(self,other,"DIA_Salandril_Sarah_WhatIngredients_13_04");	//Он похож на гроздь синих шариков и вызывает сильное жжение.
	AI_Output(self,other,"DIA_Salandril_Sarah_WhatIngredients_13_05");	//И третье - красный лишайник. Он вырастает на старой каменной кладке, но только на высоте и в тени.
	AI_Output(self,other,"DIA_Salandril_Sarah_WhatIngredients_13_06");	//К сожалению, на городских башнях его больше не осталось.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_SalandrilIngredients);
	MIS_Sarah_BadHabit_PotionIngredients = TRUE;	//теперь ищем ингредиенты
	_SpawnBySPName("SP_REDMOSS_01_NP",ItPl_RedMoss);
	_SpawnBySPName("SP_REDMOSS_02_NP",ItPl_RedMoss);
};

// ==============================================
instance DIA_Salandril_Sarah_HowMuchCosts(C_INFO)
{
	npc = VLK_422_Salandril;			nr = 3;
	condition = DIA_Salandril_Sarah_HowMuchCosts_cond;
	information = DIA_Salandril_Sarah_HowMuchCosts_info;
	description = "Сколько ты хочешь за свое лекарство?";
};
func int DIA_Salandril_Sarah_HowMuchCosts_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && (Npc_KnowsInfo(other,DIA_Salandril_Sarah_AskSmokingCure)))	{
		return TRUE;
	};
};
func void DIA_Salandril_Sarah_HowMuchCosts_info()
{
		AI_Output(other,self,"DIA_Salandril_Sarah_HowMuchCosts_16_00");	//Сколько ты хочешь за свое лекарство?
	AI_Output(self,other,"DIA_Salandril_Sarah_HowMuchCosts_13_01");	//Полторы тысячи золотых монет.
		AI_Output(other,self,"DIA_Salandril_Sarah_HowMuchCosts_16_02");	//Полторы тысячи?!
	AI_Output(self,other,"DIA_Salandril_Sarah_HowMuchCosts_13_03");	//Это очень сложный состав. Если он тебе нужен - плати.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_SalandrilPrice);
};

// ==============================================
instance DIA_Salandril_Sarah_GiveIngredients(C_INFO)
{
	npc = VLK_422_Salandril;			nr = 4;
	condition = DIA_Salandril_Sarah_GiveIngredients_cond;
	information = DIA_Salandril_Sarah_GiveIngredients_info;
	description = "Я принесла игредиенты.";
};
func int DIA_Salandril_Sarah_GiveIngredients_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_PotionIngredients
		 && (Npc_HasItems(other,ItPl_SwampHerb) >= 3) && (Npc_HasItems(other,ItMr_DragonTears) >= 1) && (Npc_HasItems(other,ItPl_RedMoss) >= 1))	{
		return TRUE;
	};
};
func void DIA_Salandril_Sarah_GiveIngredients_info()
{
		AI_Output(other,self,"DIA_Salandril_Sarah_GiveIngredients_16_00");	//Я принесла игредиенты.
	//B_GiveInvItems(other,self,ItPl_SwampHerb,3);
	//B_GiveInvItems(other,self,ItMr_DragonTears,1);
	//B_GiveInvItems(other,self,ItPl_RedMoss,1);
	ItemTrans_items[0] = ItPl_SwampHerb;
	ItemTrans_amount[0] = 3;
	ItemTrans_items[1] = ItMr_DragonTears;
	ItemTrans_amount[1] = 1;
	ItemTrans_items[2] = ItPl_RedMoss;
	ItemTrans_amount[2] = 1;
	B_ItemsTransaction(other,self);
	AI_Output(self,other,"DIA_Salandril_Sarah_GiveIngredients_13_01");	//Немедленно приступлю к изготовлению. А ты приготовь золото.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_SalandrilProduction);
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,3);
	MIS_Sarah_BadHabit_PotionIngredientsGiven = TRUE;
};

// ==============================================
instance DIA_Salandril_Sarah_BuyPotion(C_INFO)
{
	npc = VLK_422_Salandril;			nr = 5;
	condition = DIA_Salandril_Sarah_BuyPotion_cond;
	information = DIA_Salandril_Sarah_BuyPotion_info;
	description = "Вот деньги за лекарство. (1500 зол.)";
	permanent = TRUE;
};
func int DIA_Salandril_Sarah_BuyPotion_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && Npc_KnowsInfo(other,DIA_Salandril_Sarah_HowMuchCosts) && MIS_Sarah_BadHabit_PotionIngredientsGiven
		 && !MIS_Sarah_BadHabit_PotionGot)	{
		return TRUE;
	};
};
func void DIA_Salandril_Sarah_BuyPotion_info()
{
	AI_Output(other,self,"DIA_Salandril_Sarah_BuyPotion_16_00");	//Вот деньги за лекарство.
	if (B_GiveGold(other,self,1500))	{
		AI_Output(self,other,"DIA_Salandril_Sarah_BuyPotion_13_01");	//А вот твой эликсир.
		B_GiveInvItems(self,other,ItMi_AntismokingPotion,1);
	AI_Output(other,self,"DIA_Salandril_Sarah_BuyPotion_16_02");	//Такая маленькая бутылочка?
		AI_Output(self,other,"DIA_Salandril_Sarah_BuyPotion_13_03");	//Осторожно с ним, он очень сильный! Принимать по одному глотку в день, не больше.
		AI_Output(self,other,"DIA_Salandril_Sarah_BuyPotion_13_04");	//Иначе можно обжечь внутренности.
		B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_GotPotion);
		MIS_Sarah_BadHabit_PotionGot = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Salandril_Sarah_BuyPotion_13_05");	//Где? Оно стоит 1500 золотых, и ни монетой меньше!
	};
};

// ==============================================
instance DIA_Salandril_Sarah_BloodyCough(C_INFO)
{
	npc = VLK_422_Salandril;			nr = 6;
	condition = DIA_Salandril_Sarah_BloodyCough_cond;
	information = DIA_Salandril_Sarah_BloodyCough_info;
	description = "От твоего лекарства моя подруга начала кашлять кровью!";
};
func int DIA_Salandril_Sarah_BloodyCough_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_KnowBloodyCough)	{
		return TRUE;
	};
};
func void DIA_Salandril_Sarah_BloodyCough_info()
{
		AI_Output(other,self,"DIA_Salandril_Sarah_BloodyCough_16_00");	//От твоего лекарства моя подруга начала кашлять кровью!
		AI_Output(other,self,"DIA_Salandril_Sarah_BloodyCough_16_01");	//Что ты с ней сделал, мошенник?!
	AI_Output(self,other,"DIA_Salandril_Sarah_BloodyCough_13_02");	//Не кричи на меня! Так действует зелье - с кашлем выводит скопившиеся яды.
	AI_Output(self,other,"DIA_Salandril_Sarah_BloodyCough_13_03");	//Не моя вина, что она насквозь прокурила себе легкие, и теперь выплевывает и их вместе с сажей.
	AI_Output(self,other,"DIA_Salandril_Sarah_BloodyCough_13_04");	//Но я могу продать тебе еще мазь, которая укрепит ее внутренности. Всего 100 золотых.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_SalandrilSalve);
};

// ==============================================
instance DIA_Salandril_Sarah_BuySalve(C_INFO)
{
	npc = VLK_422_Salandril;			nr = 7;
	condition = DIA_Salandril_Sarah_BuySalve_cond;
	information = DIA_Salandril_Sarah_BuySalve_info;
	description = "Я возьму эту мазь. (100 зол.)";
	permanent = TRUE;
};
func int DIA_Salandril_Sarah_BuySalve_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && Npc_KnowsInfo(other,DIA_Salandril_Sarah_BloodyCough)
		 && !Npc_HasItems(other,ItMi_BuildUpSalve))	{
		return TRUE;
	};
};
func void DIA_Salandril_Sarah_BuySalve_info()
{
	AI_Output(other,self,"DIA_Salandril_Sarah_BuySalve_16_00");	//Я возьму эту мазь.
	if (C_NpcHasGold(other,100))	{
		B_GiveGold(other,self,100);
		AI_Output(self,other,"DIA_Salandril_Sarah_BuySalve_13_01");	//Держи. Она уменьшит кровотечение, но не знаю, восстановятся ли легкие когда-нибудь.
		AI_Output(self,other,"DIA_Salandril_Sarah_BuySalve_13_02");	//Во всяком случае, твоя подруга должна выжить.
		B_GiveInvItems(self,other,ItMi_BuildUpSalve,1);
		B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_SalandrilSalveGot);
	}
	else	{
		AI_Output(self,other,"DIA_Salandril_Sarah_BuySalve_13_03");	//Мазь стоит 100 золотых.
	};
};


/////////////////////////////// ВСЕ //////////////////////////////////
// ТОРГОВЛЯ ==============================================
var int DIA_Salandril_MRTrade_Once;
instance DIA_Salandril_MRTrade(C_INFO)
{
	nr = 50;
	npc = VLK_422_Salandril;
	condition = DIA_NoCond_cond;
	information = DIA_Salandril_MRTrade_info;
	description = "Покажи мне свои товары.";
	trade = TRUE;
	permanent = TRUE;
};
func void DIA_Salandril_MRTrade_info()
{
	if (!DIA_Salandril_MRTrade_Once)	{
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Salandril_MRTrade_03_00");	//Покажи мне свои товары.
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Salandril_MRTrade_07_00");	//Покажи мне свои товары.
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Salandril_MRTrade_10_00");	//Покажи мне свои товары.
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Salandril_MRTrade_14_00");	//Покажи мне свои товары.
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Salandril_MRTrade_16_00");	//Покажи мне свои товары.
		};
		AI_Output(self,other,"DIA_Salandril_MRTrade_13_01");	//Разумеется! У меня круглый год лучшие зелья и травы в этом городе.
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Salandril);
		DIA_Salandril_MRTrade_Once = TRUE;
	};
	B_GiveTradeInv_Salandril(self);
};
