
instance DIA_Kardif_EXIT(DIA_Proto_End)
{
	npc = VLK_431_Kardif;
};

///////////////////////////// РУПЕРТ ///////////////////////////////
//-----------------------------------------
instance DIA_Kardif_AskDebt(C_INFO)
{
	nr = 10;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_AskDebt_cond;
	information = DIA_Kardif_AskDebt_info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Kardif_AskDebt_cond()
{
	if (C_HeroIs_Rupert() && (MIS_Rupert_Debts_Paid[Creditor_Kardif] == FALSE) 
		&& DIA_WhenAsked_cond())
	{
		return TRUE;
	};
	
};
func void DIA_Kardif_AskDebt_info()
{
	AI_Output(self,other,"DIA_Kardif_AskDebt_14_00");	//Ты ничего не получишь, пока не вершень долг.
};
//-----------------------------------------
instance DIA_Kardif_PayDebt(C_INFO)
{
	nr = 11;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_PayDebt_cond;
	information = DIA_Kardif_PayDebt_info;
	permanent = TRUE;
	description = "Я хочу вернуть долг. (60 зол.)";
};
func int DIA_Kardif_PayDebt_cond()
{
	if (C_HeroIs_Rupert() && (MIS_Rupert_Debts_Paid[Creditor_Kardif] == FALSE))
	{
		return TRUE;
	};
	
};
func void DIA_Kardif_PayDebt_info()
{
	AI_Output(other,self,"DIA_Kardif_PayDebt_03_00");	//Я хочу вернуть долг.
	if (C_NpcHasGold(other,60))	{
		B_GiveInvItems(other,self,ItMi_gold,60);
		B_RupertPayDebt(Creditor_Kardif);
		VLK_432_Moe.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
		Kardif_TellRumors = TRUE;
		B_LogNote(TOPIC_Misk,TOPIC_Misk_KardifRumors);
		AI_Output(self,other,"DIA_Kardif_PayDebt_14_00");	//Хорошо. Но теперь ты ВСЕГДА будешь платить вперед.
	}
	else	{
		AI_Output(self,other,"DIA_Kardif_PayDebt_14_01");	//Тогда принеси деньги. 60 золотых.
	};
};


/////////////////////////////////////// ЕЛЕНА //////////////////////////////////////////////

// ==============================================
instance DIA_Kardif_Elena_AboutCup(C_INFO)
{
	nr = 20;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Elena_AboutCup_cond;
	information = DIA_Kardif_Elena_AboutCup_info;
	description = "Ты ведь знаешь про все в порту?";
};
func int DIA_Kardif_Elena_AboutCup_cond()
{
	if (C_HeroIs_Elena()
		&& Npc_KnowsInfo(other,DIA_Lehmar_Elena_AboutCup)
		&& !Kardif_TellRumors
		&& !MIS_Elena_Present_CupLehmarGot && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Kardif_Elena_AboutCup_info()
{
		AI_Output(other,self,"DIA_Kardif_Elena_AboutCup_16_00");	//Ты ведь знаешь про все в порту?
	AI_Output(self,other,"DIA_Kardif_Elena_AboutCup_14_01");	//Может быть. Все зависит от того, сколько у тебя золота и что именно ты хочешь знать.
	Kardif_TellRumors = TRUE;
	B_LogNote(TOPIC_Misk,TOPIC_Misk_KardifRumors);
};

// ==============================================
instance DIA_Kardif_Elena_AboutLehmar(C_INFO)
{
	nr = 21;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Elena_AboutLehmar_cond;
	information = DIA_Kardif_Elena_AboutLehmar_info;
	description = "Я хочу спросить про Лемара (20 зол.)";
};
func int DIA_Kardif_Elena_AboutLehmar_cond()
{
	if (C_HeroIs_Elena()
		&& Kardif_TellRumors
		&& !MIS_Elena_Present_CupLehmarGot && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Kardif_Elena_AboutLehmar_info()
{
	if (C_NpcHasGold(other,20))	{
		B_GiveInvItems(other,self,ItMi_Gold,20);
			AI_Output(other,self,"DIA_Kardif_Elena_AboutLehmar_16_00");	//У ростовщика Лемара есть одна вещь, которую я хочу получить.
			AI_Output(other,self,"DIA_Kardif_Elena_AboutLehmar_16_01");	//Но продать он ее отказывается.
		AI_Output(self,other,"DIA_Kardif_Elena_AboutLehmar_14_02");	//Лемар отказывается от денег? Завтра точно конец света.
		AI_Output(self,other,"DIA_Kardif_Elena_AboutLehmar_14_03");	//Если тебе нужно достать что-то в порту, поговори с Халвором. Он не только торгует тухлой рыбой, но и имеет кое-какие связи.
		AI_Output(self,other,"DIA_Kardif_Elena_AboutLehmar_14_04");	//Скажи, что это я тебя прислал.
		MIS_Elena_Present_KardifTold = TRUE;
		B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_KardifTold);
	}
	else	{
		AI_Output(self,other,"DIA_Kardif_Elena_AboutLehmar_14_05");	//20 золотых, девочка.
	};
};

/////////////////////////////////////// САРА //////////////////////////////////////////////
var int Kardif_Sarah_Liqueur_Offer;
var int Kardif_Sarah_Liqueur_GivenOnce;

// ==============================================
instance DIA_Kardif_Sarah_Hello(C_INFO)
{
	nr = 30;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Sarah_MR_Hello_cond;
	information = DIA_Kardif_Sarah_MR_Hello_info;
	important = TRUE;
};
func int DIA_Kardif_Sarah_MR_Hello_cond()
{
	if (C_HeroIs_Sarah()
		&& DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Kardif_Sarah_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Kardif_Sarah_MR_Hello_14_00");	//Да это же девчушка Сара! Что, вернулась с небес на землю, или скучно стало?
		AI_Output(other,self,"DIA_Kardif_Sarah_MR_Hello_16_01");	//Соскучилась по старым знакомым.
	AI_Output(self,other,"DIA_Kardif_Sarah_MR_Hello_14_02");	//Ну-ну. Значит, дела-то не очень, раз о старых знакомых вспомнила?
	Info_ClearChoices(DIA_Kardif_Sarah_Hello);
	Info_AddChoice(DIA_Kardif_Sarah_Hello,"Да, жизнь там, вне Портового квартала, не такая уж сладкая.",DIA_Kardif_Sarah_MR_Hello_UARight);
	Info_AddChoice(DIA_Kardif_Sarah_Hello,"Думай, что хочешь.",DIA_Kardif_Sarah_MR_Hello_No);
};
func void DIA_Kardif_Sarah_MR_Hello_No()
{
		AI_Output(other,self,"DIA_Kardif_Sarah_MR_Hello_No_16_00");	//Думай, что хочешь.
	Info_ClearChoices(DIA_Kardif_Sarah_Hello);
};
func void DIA_Kardif_Sarah_MR_Hello_UARight()
{
		AI_Output(other,self,"DIA_Kardif_Sarah_MR_Hello_UARight_16_00");	//Да, жизнь там, вне Портового квартала, не такая уж сладкая.
	AI_Output(self,other,"DIA_Kardif_Sarah_MR_Hello_UARight_14_01");	//Вот-вот. А хочешь, подслащу немного? Есть у меня одна наливочка, здешним ребятам она что вода с медом, а тебе, пожалуй, понравится.
	Info_ClearChoices(DIA_Kardif_Sarah_Hello);
	Kardif_Sarah_Liqueur_Offer = TRUE;
};

// ==============================================
instance DIA_Kardif_Sarah_Liqueur(C_INFO)
{
	nr = 32;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Sarah_Liqueur_cond;
	information = DIA_Kardif_Sarah_Liqueur_Info;
	description = "Давай, попробую твою наливку. (20 зол.)";
	permanent = TRUE;
};
func int DIA_Kardif_Sarah_Liqueur_cond()
{
	if (C_HeroIs_Sarah()
		&& Kardif_Sarah_Liqueur_Offer && !Kardif_Sarah_Liqueur_GivenOnce)	{
		return TRUE;
	};
};
func void DIA_Kardif_Sarah_Liqueur_Info()
{

	AI_Output(other,self,"DIA_Kardif_Sarah_Liqueur_16_00");	//Давай, попробую твою наливку.
	if (C_NpcHasGold(other,Value_KardifLiqueur))	{
		B_GiveGold(other,self,Value_KardifLiqueur);
		AI_Output(self,other,"DIA_Kardif_Sarah_Liqueur_14_01");	//Угощайся.
		//(+5 HP max)
		B_GiveInvItems(self,other,ItFo_KardifLiqueur,1);
		Kardif_Sarah_Liqueur_GivenOnce = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Kardif_Sarah_Liqueur_14_02");	//Нет, красотуля, сначала надо заплатить.
	};
	Info_ClearChoices(DIA_Kardif_Sarah_Hello);
};

// ==============================================
instance DIA_Kardif_Sarah_TellRumors(C_INFO)
{
	nr = 33;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Sarah_TellRumors_cond;
	information = DIA_Kardif_Sarah_TellRumors_Info;
	description = "Есть какие-нибудь новости?";
};
func int DIA_Kardif_Sarah_TellRumors_cond()
{
	if (C_HeroIs_Sarah()
		&& !Kardif_TellRumors)	{
		return TRUE;
	};
};
func void DIA_Kardif_Sarah_TellRumors_Info()
{
	AI_Output(other,self,"DIA_Kardif_Sarah_TellRumors_16_00");	//Есть какие-нибудь новости?
	AI_Output(self,other,"DIA_Kardif_Sarah_TellRumors_14_01");	//Лапочка, ты же знаешь, как тут дела делаются - все стоит денег.
	AI_Output(self,other,"DIA_Kardif_Sarah_TellRumors_14_02");	//Если у тебя найдется пара золотых, я расскажу, что ты тут пропустила.
	Kardif_TellRumors = TRUE;
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_Kardif);
	B_LogNote(TOPIC_Misk,TOPIC_Misk_KardifRumors);
};


/////////////////////////////////////// ВСЕ /////////////////////////////////////////////
// ТОРГОВЛЯ ==============================================
var int DIA_Kardif_MRTrade_Once;
instance DIA_Kardif_MRTrade(C_INFO)
{
	nr = 90;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_MRTrade_cond;
	information = DIA_Kardif_MRTrade_info;
	description = "Налей-ка мне.";
	trade = TRUE;
	permanent = TRUE;
};
func int DIA_Kardif_MRTrade_cond()
{
	if (!C_HeroIs_Rupert() || (MIS_Rupert_Debts_Paid[Creditor_Kardif] == TRUE))
	{
		return TRUE;
	};
	
};
func void DIA_Kardif_MRTrade_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Kardif_MRTrade_03_00");	//Налей-ка мне.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Kardif_MRTrade_07_00");	//Налей-ка мне.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Kardif_MRTrade_10_00");	//Налей-ка мне.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Kardif_MRTrade_14_00");	//Налей-ка мне.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Kardif_MRTrade_16_00");	//Налей-ка мне.
	};
	if (!DIA_Kardif_MRTrade_Once)	{
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Kardif);
		DIA_Kardif_MRTrade_Once = TRUE;
	};
	B_GiveTradeInv_Kardif(self);
};

// СЛУХИ ===============================================================================

var int Kardif_RumorsTold[5];

// ==============================================
instance DIA_Kardif_TellRumors(C_INFO)
{
	nr = 1;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_TellRumors_cond;
	information = DIA_Kardif_TellRumors_Info;
	description = "Можешь мне кое-что рассказать?";
};
func int DIA_Kardif_TellRumors_cond()
{
	if (!C_HeroIs_Sarah()
		&& !Kardif_TellRumors)	{
		return TRUE;
	};
};
func void DIA_Kardif_TellRumors_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Kardif_TellRumors_03_00");	//Можешь мне кое-что рассказать?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Kardif_TellRumors_07_00");	//Можешь мне кое-что рассказать?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Kardif_TellRumors_10_00");	//Можешь мне кое-что рассказать?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Kardif_TellRumors_14_00");	//Можешь мне кое-что рассказать?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Kardif_TellRumors_16_00");	//Можешь мне кое-что рассказать?
	};
	AI_Output(self,other,"DIA_Kardif_TellRumors_14_01");	//Если у тебя найдется пара золотых.
	Kardif_TellRumors = TRUE;
	B_LogNote(TOPIC_Misk,TOPIC_Misk_KardifRumors);
};
//-----------------------------------------------------------------
func int DIA_Kardif_Rumors_NoMoney(var int amount)
{
	if (B_GiveGold(other,self,amount))	{
		return FALSE;
	};
	AI_Output(self,other,"DIA_Kardif_Rumors_NoMoney_14_00");	//За все надо платить.
	if (C_HeroIs_Sarah() && (Hlp_Random(3) == 0))	{
		AI_Output(self,other,"DIA_Kardif_Rumors_NoMoney_14_01");	//И тебе тоже, дорогуша.
	};
	return TRUE;
};
//-------------------------------------------------------------
instance DIA_Kardif_Rumors01(C_INFO)
{
	nr = 51;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Rumors01_cond;
	information = DIA_Kardif_Rumors01_info;
	description = "О чем говорят в порту? (5 зол.)";
	permanent = TRUE;
};
func int DIA_Kardif_Rumors01_cond()
{
	if (Kardif_TellRumors && !Kardif_RumorsTold[0])
	{
		return TRUE;
	};
};
func void DIA_Kardif_Rumors01_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Kardif_Rumors01_03_00");	//О чем говорят в порту?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Kardif_Rumors01_07_00");	//О чем говорят в порту?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Kardif_Rumors01_10_00");	//О чем говорят в порту?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Kardif_Rumors01_14_00");	//О чем говорят в порту?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Kardif_Rumors01_16_00");	//О чем говорят в порту?
	};
	if (!DIA_Kardif_Rumors_NoMoney(5))	{
		Kardif_RumorsTold[0] = TRUE;
		if (C_HeroIs_Sarah())	{
			AI_Output(self,other,"DIA_Kardif_Rumors01_14_01a");	//Помнишь Феллана?
		}
		else	{
			AI_Output(self,other,"DIA_Kardif_Rumors01_14_01b");	//В последнее время все обсуждают Феллана.
		};
		if (MIS_FellanGoHome != LOG_SUCCESS)	{
			AI_Output(self,other,"DIA_Kardif_Rumors01_14_01");	//Парень всегда был с приветом, а теперь у него совсем крыша протекла.
			AI_Output(self,other,"DIA_Kardif_Rumors01_14_02");	//Ушел из дому и поселился прямо на пристани. Говорит, что ждет корабль, чтобы уплыть с острова.
			AI_Output(self,other,"DIA_Kardif_Rumors01_14_03");	//Женушка его, Ирина, сначала уговаривала вернуться, потом кормить перестала, да все без толку.
			MIS_FellanGoHome_WifeWaits = TRUE;
			B_LogNote(TOPIC_Rumors,Topic_Rumors_Fellan);
		}
		else	{
			AI_Output(self,other,"DIA_Kardif_Rumors01_14_04");	//Пару недель назад он ушел из дому и поселился прямо на пристани. Хотел во что бы то ни стало уплыть с острова.
			AI_Output(self,other,"DIA_Kardif_Rumors01_14_05");	//Однако недавно он вернулся домой, еще более ненормальным, чем раньше. Весь день стучит молотком, не переставая.
			AI_Output(self,other,"DIA_Kardif_Rumors01_14_06");	//Если соседи узнают, кто уговорил его вернуться, то по головке точно не погладят. Ты, кстати, не в курсе, кто это?
			if (hero.voice == 3)	{			//Одо/Руперт
				AI_Output(other,self,"DIA_Kardif_Rumors01_03_07");	//Я? Нет, откуда бы?
			} else if (hero.voice == 7)	{		//Талбин
				AI_Output(other,self,"DIA_Kardif_Rumors01_07_07");	//Я? Нет, откуда бы?
			} else if (hero.voice == 10)	{	//Эрол
				AI_Output(other,self,"DIA_Kardif_Rumors01_10_07");	//Я? Нет, откуда бы?
			} else if (hero.voice == 14)	{	//Тилл
				AI_Output(other,self,"DIA_Kardif_Rumors01_14_07");	//Я? Нет, откуда бы?
			} else	{							//Елена/Сара
				AI_Output(other,self,"DIA_Kardif_Rumors01_16_07");	//Я? Нет, откуда бы?
			};
		};
	};
};
//-------------------------------------------------------------
instance DIA_Kardif_Rumors02(C_INFO)
{
	nr = 52;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Rumors02_cond;
	information = DIA_Kardif_Rumors02_info;
	description = "Какие сейчас есть развлечения? (5 зол.)";
	permanent = TRUE;
};
func int DIA_Kardif_Rumors02_cond()
{
	if (Kardif_TellRumors && !Kardif_RumorsTold[1])
	{
		return TRUE;
	};
};
func void DIA_Kardif_Rumors02_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Kardif_Rumors02_03_00");	//Какие сейчас есть развлечения?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Kardif_Rumors02_07_00");	//Какие сейчас есть развлечения?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Kardif_Rumors02_10_00");	//Какие сейчас есть развлечения?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Kardif_Rumors02_14_00");	//Какие сейчас есть развлечения?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Kardif_Rumors02_16_00");	//Какие сейчас есть развлечения?
	};
	if (!DIA_Kardif_Rumors_NoMoney(5))	{
		Kardif_RumorsTold[1] = TRUE;
		if (C_HeroIs_Sarah())	{
			AI_Output(self,other,"DIA_Kardif_Rumors02_14_01");	//Да все как обычно... Надины выступления с факелами все еще самое яркое зрелище в порту.
			AI_Output(self,other,"DIA_Kardif_Rumors02_14_02");	//И если ты хочешь на них поглядеть, надолго не откладывай.
				AI_Output(other,self,"DIA_Kardif_Rumors02_16_03");	//Почему?
			AI_Output(self,other,"DIA_Kardif_Rumors02_14_04");	//Курит она, как... Много, в общем. А на баб оно, видать, как-то отвратно действует, потому что дышит она, как рыба на суше. 
			AI_Output(self,other,"DIA_Kardif_Rumors02_14_05");	//Не знаю уж, что там у нее стряслось, но все деньги она спускает на косяки. И если так пойдет дальше, долго она не протянет.
			B_LogEntry_Create(TOPIC_Sarah_BadHabit,LOG_Mission,TOPIC_Sarah_BadHabit_Start);
			MIS_Sarah_BadHabit = LOG_Running;
		}
		else	{
			AI_Output(self,other,"DIA_Kardif_Rumors02_14_06");	//Если хочешь зрелища, приходи к полуночи к Красному фонарю - Надя будет выступать с факелами.
			AI_Output(self,other,"DIA_Kardif_Rumors02_14_07");	//Больше сейчас, пожалуй, ничего интересного нет. Если только тебе не нравится пялиться часами на море.
		};
		B_LogNote(TOPIC_Rumors,Topic_Rumors_Entertain);
	};
};
//-------------------------------------------------------------
instance DIA_Kardif_Rumors03(C_INFO)
{
	nr = 53;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Rumors03_cond;
	information = DIA_Kardif_Rumors03_info;
	description = "Давно кораблей не было? (5 зол.)";
	permanent = TRUE;
};
func int DIA_Kardif_Rumors03_cond()
{
	if (Kardif_TellRumors && !Kardif_RumorsTold[2])
	{
		return TRUE;
	};
	
};
func void DIA_Kardif_Rumors03_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Kardif_Rumors03_03_00");	//Давно кораблей не было?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Kardif_Rumors03_07_00");	//Давно кораблей не было?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Kardif_Rumors03_10_00");	//Давно кораблей не было?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Kardif_Rumors03_14_00");	//Давно кораблей не было?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Kardif_Rumors03_16_00");	//Давно кораблей не было?
	};
	if (!DIA_Kardif_Rumors_NoMoney(5))	{
		Kardif_RumorsTold[2] = TRUE;
		AI_Output(self,other,"DIA_Kardif_Rumors03_14_01");	//Кроме тех, что привозят заключенных и увозят руду, уже полгода ни одного не было.
		AI_Output(self,other,"DIA_Kardif_Rumors03_14_02");	//Последний ушел на материк недели две назад, с грузом руды и наших налогов.
		AI_Output(self,other,"DIA_Kardif_Rumors03_14_03");	//За какими-то надобностями на нем отчалил и губернатор.
		B_LogNote(TOPIC_Rumors,Topic_Rumors_Ships);
	};
};
//-------------------------------------------------------------
instance DIA_Kardif_Rumors04(C_INFO)
{
	nr = 54;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Rumors04_cond;
	information = DIA_Kardif_Rumors04_info;
	description = "Расскажи что-нибудь забавное. (5 зол.)";
	permanent = TRUE;
};
func int DIA_Kardif_Rumors04_cond()
{
	if (Kardif_TellRumors && !Kardif_RumorsTold[3])
	{
		return TRUE;
	};
	
};
func void DIA_Kardif_Rumors04_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Kardif_Rumors04_03_00");	//Расскажи что-нибудь забавное.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Kardif_Rumors04_07_00");	//Расскажи что-нибудь забавное.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Kardif_Rumors04_10_00");	//Расскажи что-нибудь забавное.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Kardif_Rumors04_14_00");	//Расскажи что-нибудь забавное.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Kardif_Rumors04_16_00");	//Расскажи что-нибудь забавное.
	};
	if (!DIA_Kardif_Rumors_NoMoney(5))	{
		Kardif_RumorsTold[3] = TRUE;
		AI_Output(self,other,"DIA_Kardif_Rumors04_14_01");	//Недавно приходил один из этих толстосумов из Верхнего квартала. Решил порыбачить с пирса. Это надо было видеть.
		AI_Output(self,other,"DIA_Kardif_Rumors04_14_02");	//Сначала он перепутал все снасти. Потом поймал себя крючком за рукав и никак не мог отцепиться.
		AI_Output(self,other,"DIA_Kardif_Rumors04_14_03");	//В итоге он подскользнулся и шлепнулся в воду. Утопил не только удочку, но и кошелек с 50 золотыми.
		AI_Output(self,other,"DIA_Kardif_Rumors04_14_04");	//Некоторые за ним ныряли, но так и не нашли. Косого Гарри в холодной воде прихватило, так он сам едва не утоп.
		B_LogNote(TOPIC_Rumors,Topic_Rumors_DrawnPocket);
	};
};
//-------------------------------------------------------------
instance DIA_Kardif_Rumors05(C_INFO)
{
	nr = 55;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Rumors05_cond;
	information = DIA_Kardif_Rumors05_info;
	description = "Что интересного слышал? (5 зол.)";
	permanent = TRUE;
};
func int DIA_Kardif_Rumors05_cond()
{
	if (Kardif_TellRumors && !Kardif_RumorsTold[4])
	{
		return TRUE;
	};
	
};
func void DIA_Kardif_Rumors05_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Kardif_Rumors05_03_00");	//Что интересного слышал?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Kardif_Rumors05_07_00");	//Что интересного слышал?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Kardif_Rumors05_10_00");	//Что интересного слышал?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Kardif_Rumors05_14_00");	//Что интересного слышал?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Kardif_Rumors05_16_00");	//Что интересного слышал?
	};
	if (!DIA_Kardif_Rumors_NoMoney(5))	{
		Kardif_RumorsTold[4] = TRUE;
		AI_Output(self,other,"DIA_Kardif_Rumors05_14_01");	//Не знаю, насколько тебе это интересно... 
		AI_Output(self,other,"DIA_Kardif_Rumors05_14_02");	//Парнишка Элврих, ученик плотника, уже месяц каждую ночь проводит у Бромора. Не у самого него, конечно, а у одной из девочек.
		Info_ClearChoices(DIA_Kardif_Rumors05);
		Info_AddChoice(DIA_Kardif_Rumors05,"Хм, это может быть не так бесполезно...",DIA_Kardif_Rumors05_Yes);
		Info_AddChoice(DIA_Kardif_Rumors05,"Ты прав, мне это СОВЕРШЕННО неинтересно.",DIA_Kardif_Rumors05_No);
		B_LogNote(TOPIC_Rumors,Topic_Rumors_Elvrich);
	};
};
func void DIA_Kardif_Rumors05_Yes()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Kardif_Rumors05_Yes_03_00");	//Хм, это может быть не так бесполезно...
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Kardif_Rumors05_Yes_07_00");	//Хм, это может быть не так бесполезно...
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Kardif_Rumors05_Yes_10_00");	//Хм, это может быть не так бесполезно...
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Kardif_Rumors05_Yes_14_00");	//Хм, это может быть не так бесполезно...
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Kardif_Rumors05_Yes_16_00");	//Хм, это может быть не так бесполезно...
	};
	Info_ClearChoices(DIA_Kardif_Rumors05);
};

func void DIA_Kardif_Rumors05_No()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Kardif_Rumors05_No_03_00");	//Ты прав, мне это СОВЕРШЕННО неинтересно.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Kardif_Rumors05_No_07_00");	//Ты прав, мне это СОВЕРШЕННО неинтересно.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Kardif_Rumors05_No_10_00");	//Ты прав, мне это СОВЕРШЕННО неинтересно.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Kardif_Rumors05_No_14_00");	//Ты прав, мне это СОВЕРШЕННО неинтересно.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Kardif_Rumors05_No_16_00");	//Ты прав, мне это СОВЕРШЕННО неинтересно.
	};
	Info_ClearChoices(DIA_Kardif_Rumors05);
};

/*-------------------------------------------------------------
instance DIA_Kardif_Rumors_FellanAtHome(C_INFO)
{
	nr = 60;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Rumors_FellanAtHome_cond;
	information = DIA_Kardif_Rumors_FellanAtHome_info;
	important = TRUE;
};
func int DIA_Kardif_Rumors_FellanAtHome_cond()
{
	if (Kardif_RumorsTold[0] && (MIS_FellanGoHome == LOG_SUCCESS))
	{
		return TRUE;
	};
};
func void DIA_Kardif_Rumors_FellanAtHome_info()
{
	AI_Output(self,other,"DIA_Kardif_Rumors_FellanAtHome_14_05");	//Похоже, Феллан вернулся домой. Причем еще более ненормальным, чем раньше. Весь день стучит молотком, не переставая.
	AI_Output(self,other,"DIA_Kardif_Rumors_FellanAtHome_14_06");	//Если соседи узнают, кто уговорил его вернуться, то по головке точно не погладят. Ты, кстати, не в курсе, кто это?
	if (hero.voice == 3)	{			//Одо/Руперт/Тилл
		AI_Output(other,self,"DIA_Kardif_Rumors_FellanAtHome_03_07");	//Я? Нет, откуда бы?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Kardif_Rumors_FellanAtHome_07_07");	//Я? Нет, откуда бы?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Kardif_Rumors_FellanAtHome_10_07");	//Я? Нет, откуда бы?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Kardif_Rumors_FellanAtHome_16_07");	//Я? Нет, откуда бы?
	};
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_After);
};
//*/

//===================================================
instance DIA_Kardif_WhereBuyYew(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 61;
	condition = DIA_Kardif_WhereBuyYew_Cond;
	information = DIA_Kardif_WhereBuyYew_Info;
	description = "У кого можно купить тис? (5 зол.)";
};
func int DIA_Kardif_WhereBuyYew_Cond()
{
	if ((MIS_FellanGoHome == LOG_Running) && Kardif_TellRumors
		&& Npc_KnowsInfo(other,DIA_Thorben_HammerWood) && !(Npc_KnowsInfo(other,DIA_Bruno_HasYew) || Npc_KnowsInfo(other,DIA_Fabio_HasYew)))	{
		return TRUE;
	};
};

func void DIA_Kardif_WhereBuyYew_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Kardif_WhereBuyYew_03_00");	//У кого можно купить тис?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Kardif_WhereBuyYew_07_00");	//У кого можно купить тис?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Kardif_WhereBuyYew_10_00");	//У кого можно купить тис?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Kardif_WhereBuyYew_14_00");	//У кого можно купить тис?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Kardif_WhereBuyYew_16_00");	//У кого можно купить тис?
	};
	if (!DIA_Kardif_Rumors_NoMoney(5))	{
		AI_Output(self,other,"DIA_Kardif_WhereBuyYew_06_01");	//Поговори с Фабио и Бруно, рабочими на верфи.
		B_SetNameByIndex(VLK_442_Arbeiter,1);
		B_SetNameByIndex(VLK_443_Arbeiter,1);
		B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerHafenAsked);
	};
};

