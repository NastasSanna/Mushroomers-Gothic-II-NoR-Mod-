
instance DIA_Harad_EXIT(DIA_Proto_End)
{
	npc = VLK_412_Harad;
};

/////////////////////////////////////// РУПЕРТ //////////////////////////////////////////////
// РУПЕРТ ==============================================
instance DIA_Harad_Rupert_AskSword(C_INFO)
{
	nr = 1;
	npc = VLK_412_Harad;
	condition = DIA_Harad_Rupert_AskSword_cond;
	information = DIA_Harad_Rupert_AskSword_info;
	description = "Мне нужен меч из магической руды.";
};
func int DIA_Harad_Rupert_AskSword_cond()
{
	if (C_HeroIs_Rupert()
		&& (MIS_Rupert_Debts_Lehmar_Sword == MIS_Rupert_Debts_Lehmar_SwordKnown)
		&& (MIS_Rupert_Debts == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Harad_Rupert_AskSword_info()
{
		AI_Output(other,self,"DIA_Harad_Rupert_AskSword_03_00");	//Мне нужен меч из магической руды.
	AI_Output(self,other,"DIA_Harad_Rupert_AskSword_12_01");	//Не только тебе! Но если ты думаешь, что у меня тут стоят ящики, полные руды, то жестоко ошибаешься.
	AI_Output(self,other,"DIA_Harad_Rupert_AskSword_12_02");	//Вся руда идет на материк, на военные нужды. Найти хотя бы кусочек, чтобы покрыть лезвие - большая удача.
	AI_Output(self,other,"DIA_Harad_Rupert_AskSword_12_03");	//А настоящие нордмарские рудные клинки теперь вообще бесценны.
	AI_Output(self,other,"DIA_Harad_Rupert_AskSword_12_04");	//Если вдруг тебе посчастливилось найти кусок руды, я с удовольствием выкую для тебя меч.
		AI_Output(other,self,"DIA_Harad_Rupert_AskSword_03_05");	//Сколько будет стоить такой меч?
	AI_Output(self,other,"DIA_Harad_Rupert_AskSword_12_06");	//Стальная заготовка, плюс работа... 220 золотых.
	B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Harad);
	if (!Harad_TradeNugget)	{
		AI_Output(self,other,"DIA_Harad_Rupert_AskSword_12_07");	//Но если у тебя есть руда - лучше продай ее мне. Я дам тебе целых 100 золотых за кусок!
		B_LogNote(TOPIC_Misk,TOPIC_Misk_HaradNugget);
		Harad_TradeNugget = TRUE;
	};
};
//-----------------------------------------
instance DIA_Harad_Rupert_Smith(C_INFO)
{
	nr = 2;
	npc = VLK_412_Harad;
	condition = DIA_Harad_Rupert_Smith_cond;
	information = DIA_Harad_Rupert_Smith_info;
	description = "Я хочу заказать меч (220 зол., 1 кусок руды).";
	permanent = TRUE;
};
func int DIA_Harad_Rupert_Smith_cond()
{
	if (C_HeroIs_Rupert()
		&& Npc_KnowsInfo(other,DIA_Harad_Rupert_AskSword) && (Harad_Rupert_Smith_Time == 0)
		&& (MIS_Rupert_Debts == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Harad_Rupert_Smith_info()
{
	AI_Output(other,self,"DIA_Harad_Rupert_Smith_03_00");	//Я хочу заказать меч.
	if (Npc_HasItems(other,ItMi_Nugget) == 0)	{
		AI_Output(self,other,"DIA_Harad_Rupert_Smith_12_01");	//Сначала принеси магическую руду.
		return;
	};
	if (!C_NpcHasGold(other, 220))	{
		AI_Output(self,other,"DIA_Harad_Rupert_Smith_12_02");	//Тогда принеси деньги. Мне тоже нужно есть, да и хорошая сталь с неба не падает.
		return;
	};
	//B_GiveInvItems(other,self,ItMi_Nugget,1);
	//B_GiveInvItems(other,self,ItMi_Gold,220);
	ItemTrans_items[0] = ItMi_Nugget;
	ItemTrans_amount[0] = 1;
	ItemTrans_items[1] = ItMi_Gold;
	ItemTrans_amount[1] = 220;
	B_ItemsTransaction(other,self);
	Harad_Rupert_Smith_Time = Wld_GetFullTime() + 3*60 + 15 + Hlp_Random(30);
	AI_Output(self,other,"DIA_Harad_Rupert_Smith_12_03");	//Через несколько часов меч будет готов.
	Info_ClearChoices(DIA_Harad_Rupert_Smith);
	Info_AddChoice(DIA_Harad_Rupert_Smith,"Я подожду (пропустить время)",DIA_Harad_Rupert_SmithWait);
	Info_AddChoice(DIA_Harad_Rupert_Smith,"Я вернусь позже (уйти).",DIA_Harad_Rupert_SmithGo);
};
func void DIA_Harad_Rupert_SmithGo()
{
	AI_Output(other,self,"DIA_Harad_Rupert_SmithGo_03_00");	//Я вернусь позже.
	AI_StopProcessInfos(self);
};
func void DIA_Harad_Rupert_SmithWait()
{
	Harad_Rupert_Smith_SpendTime = TRUE;
	AI_Output(other,self,"DIA_Harad_Rupert_SmithWait_03_00");	//Я подожду...
	B_StartOtherRoutine(self,"SMITHALWAYS");
	AI_StopProcessInfos(self);
};
//-----------------------------------------
instance DIA_Harad_Rupert_SmithReady(C_INFO)
{
	nr = 3;
	npc = VLK_412_Harad;
	condition = DIA_Harad_Rupert_SmithReady_cond;
	information = DIA_Harad_Rupert_SmithReady_info;
	important = TRUE;
};
func int DIA_Harad_Rupert_SmithReady_cond()
{
	if (C_HeroIs_Rupert() 
		&& (Harad_Rupert_Smith_Time > 0) && (Harad_Rupert_Smith_Time < Wld_GetFullTime()))	{
		return TRUE;
	};
};
func void DIA_Harad_Rupert_SmithReady_info()
{
	AI_Output(self,other,"DIA_Harad_Rupert_SmithReady_12_00");	//Твой меч готов! Береги его.
	B_StartOtherRoutine(self,"START");
	B_GiveInvItems(self,other,ItMw_1H_Sword_Lehmar,1);
	if (!MIS_Rupert_Debts_Paid[Creditor_Lehmar] && (MIS_Rupert_Debts == LOG_Running))	{
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_GotSword);
	};
};


/////////////////////////////////////// ЕЛЕНА /////////////////////////////////////////////
//===================================================
instance DIA_Harad_Elena_AskPresent(C_Info)
{
	npc = VLK_412_Harad;
	nr = 11;
	condition = DIA_Harad_Elena_AskPresent_Cond;
	information = DIA_Harad_Elena_AskPresent_Info;
	description = "Я ищу подарок.";
};
func int DIA_Harad_Elena_AskPresent_Cond()
{
	if (C_HeroIs_Elena()
		 && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};

func void DIA_Harad_Elena_AskPresent_Info()
{
		AI_Output(other,self,"DIA_Harad_Elena_AskPresent_12_00");	//Я ищу подарок для родителей. Что-то ценное и красивое.
		AI_Output(other,self,"DIA_Harad_Elena_AskPresent_12_01");	//Ты можешь сделать что-то подобное?
	if (Npc_GetDistToNpc(VLK_457_Brian,other) < PERC_DIST_INTERMEDIAT)	{
		AI_StartState(VLK_457_Brian,ZS_ObservePlayer,0,"");
		AI_GotoNpc(VLK_457_Brian,other);
	};
	AI_Output(self,other,"DIA_Harad_Elena_AskPresent_11_02");	//Я знаю все об изготовлении оружия. Меч, кинжал, рапира, топор... Что именно тебя интересует?
		AI_Output(other,self,"DIA_Harad_Elena_AskPresent_12_03");	//Я слышала, нельзя преподносить ножи и оружие в качетстве подарка - примета плохая. Мне бы что-то более... милое. Ко дню свадьбы.
	AI_Output(self,other,"DIA_Harad_Elena_AskPresent_11_04");	//Тогда ничем не могу помочь. Я не ювелир и не цветочник.
	AI_StopProcessInfos(self);
};


/////////////////////////////////////// ВСЕ /////////////////////////////////////////////

// Почта Хориниса ==============================================================
instance DIA_Harad_OreFromHakon(C_INFO)
{
	npc = VLK_412_Harad;				nr = 20;
	condition = DIA_Harad_OreFromHakon_cond;
	information = DIA_Harad_OreFromHakon_info;
	description = "Я принес тебе руду от Хакона.";
};
func int DIA_Harad_OreFromHakon_cond()
{
	if (MIS_KhorinisPost_Stage_FromHakon
		&& (Npc_HasItems(other,ItMi_Nugget) >= 3))	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Harad_OreFromHakon.description = "Я принесла тебе руду от Хакона.";
		};
		return TRUE;
	};
};
func void DIA_Harad_OreFromHakon_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Harad_OreFromHakon_03_00");	//Я принес тебе руду от Хакона.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Harad_OreFromHakon_07_00");	//Я принес тебе руду от Хакона.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Harad_OreFromHakon_10_00");	//Я принес тебе руду от Хакона.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Harad_OreFromHakon_14_00");	//Я принес тебе руду от Хакона.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Harad_OreFromHakont_16_00");	//Я принесла тебе руду от Хакона.
	};
	B_GiveInvItems(other,self,ItMi_Nugget,3);
	AI_Output(self,other,"DIA_Harad_OreFromHakon_12_01");	//Да, это она, магическая руда. Непросто было, наверное, достать целых три куска...
	B_GivePlayerXP(XP_KhorinisPost_HaradDelivered);
	MIS_KhorinisPost_HaradDelivered = TRUE;
	B_LogEntry_KhorinisPost_SuccessAll(TOPIC_KhorinisPost_HaradDelivered);
};
	
// ==============================================
var int DIA_Harad_WorkHard_Once;
instance DIA_Harad_WorkHard(C_INFO)
{
	nr = 30;
	npc = VLK_412_Harad;
	condition = DIA_NoCond_cond;
	information = DIA_Harad_WorkHard_info;
	permanent = TRUE;
	description = "Как работается?";
};
func void DIA_Harad_WorkHard_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Harad_WorkHard_03_00");	//Как работается?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Harad_WorkHard_07_00");	//Как работается?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Harad_WorkHard_10_00");	//Как работается?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Harad_WorkHard_14_00");	//Как работается?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Harad_WorkHard_16_00");	//Как работается?
	};
	if (!DIA_Harad_WorkHard_Once)	{
		
		AI_Output(self,other,"DIA_Harad_WorkHard_12_01");	//Сейчас, когда вся магическая руда идет на военные нужды, выковать что-нибудь стоящее почти невозможно.
		AI_Output(self,other,"DIA_Harad_WorkHard_12_02");	//Как бы я ни старался, самый лучший меч из обычного железа едва ли сравнится с обычным тесаком, покрытым магической рудой.
		AI_Output(self,other,"DIA_Harad_WorkHard_12_03");	//Я уж не говорю о клинках, выходящих из-под молотов нордмарских кузнецов...
		AI_Output(self,other,"DIA_Harad_WorkHard_12_04");	//Но, в конечном счете, важно не какое оружие, а кто его держит.
		AI_Output(self,other,"DIA_Harad_WorkHard_12_05");	//Никакой клинок не спасет труса!
		DIA_Harad_WorkHard_Once = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Harad_WorkHard_12_06");	//Хорошо, пока всякие бездельники не отвлекают.
		AI_StopProcessInfos(self);
	};
};

// ==============================================
instance DIA_Harad_NoTrade(C_INFO)
{
	npc = VLK_412_Harad;			nr = 31;
	condition = DIA_NoCond_cond;
	information = DIA_Harad_NoTrade_info;
	description = "Могу я купить у тебя что-нибудь?";
};
func void DIA_Harad_NoTrade_info()
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
	AI_Output(self,other,"DIA_Harad_NoTrade_12_01");	//Все, что я изготавливаю, ты можешь купить у торговца Хакона на рыночной площади. А я не занимаюсь торговлей.
};

//===================================================
instance DIA_Harad_SharpKnife(C_Info)
{
	npc = VLK_412_Harad;			nr = 32;
	condition = DIA_Harad_SharpKnife_Cond;
	information = DIA_Harad_SharpKnife_Info;
	description = "Ты можешь заточить нож?";
};
func int DIA_Harad_SharpKnife_Cond()
{
	if (Npc_HasItems(other,ItMW_MR_1h_KitchenKnife_Unsharpen))	{
		return TRUE;
	};
};
func void DIA_Harad_SharpKnife_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Harad_SharpKnife_03_00");	//Ты можешь заточить нож?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Harad_SharpKnife_07_00");	//Ты можешь заточить нож?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Harad_SharpKnife_10_00");	//Ты можешь заточить нож?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Harad_SharpKnife_14_00");	//Ты можешь заточить нож?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Harad_SharpKnife_16_00");	//Ты можешь заточить нож?
	};
	AI_Output(self,other,"DIA_Harad_SharpKnife_12_01");	//Я что, похож на точильщика?
	if (Wld_IsTime(7,0,22,0))	{
		AI_Output(self,other,"DIA_Harad_SharpKnife_12_02");	//Не мешай работать.
	};
	AI_StopProcessInfos(self);
};

// Продажа руды ==============================================================
instance DIA_Harad_NeedOre(C_INFO)
{
	npc = VLK_412_Harad;				nr = 50;
	condition = DIA_Harad_NeedOre_cond;
	information = DIA_Harad_NeedOre_info;
	description = "Тебе нужна магическая руда?";
};
func int DIA_Harad_NeedOre_cond()
{
	if (MIS_KhorinisPost_HaradDelivered && !Harad_TradeNugget)	{
		return TRUE;
	};
};
func void DIA_Harad_NeedOre_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Harad_NeedOre_03_00");	//Тебе нужна магическая руда?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Harad_NeedOre_07_00");	//Тебе нужна магическая руда?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Harad_NeedOre_10_00");	//Тебе нужна магическая руда?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Harad_NeedOre_14_00");	//Тебе нужна магическая руда?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Harad_NeedOret_16_00");	//Тебе нужна магическая руда?
	};
	AI_Output(self,other,"DIA_Harad_NeedOre_12_01");	//Ты еще спрашиваешь! Да я готов выложить 100 золотых за маленький кусочек!
	B_LogNote(TOPIC_Misk,TOPIC_Misk_HaradNugget);
	Harad_TradeNugget = TRUE;
};

// ====================================================
instance DIA_Harad_TradeNugget(C_INFO)
{
	nr = 51;
	npc = VLK_412_Harad;
	condition = DIA_Harad_TradeNugget_cond;
	information = DIA_Harad_TradeNugget_info;
	description = "(продать 1 кусок руды)";
	permanent = TRUE;
};
func int DIA_Harad_TradeNugget_cond()
{
	if (Harad_TradeNugget && Npc_HasItems(other,ItMi_Nugget))	{
		return TRUE;
	};
};
func void DIA_Harad_TradeNugget_info()
{
	if (Harad_TradeNugget_Cnt == 0)	{
		AI_Output(self,other,"DIA_Harad_TradeNugget_12_00");	//У тебя есть руда? Отлично! Держи 100 золотых.
	};
	if (Harad_TradeNugget_Cnt == 3)	{
		AI_Output(self,other,"DIA_Harad_TradeNugget_12_01");	//Где ты ее достаешь? Уже третий кусок!
	};
	if (Harad_TradeNugget_Cnt == 5)	{
		AI_Output(self,other,"DIA_Harad_TradeNugget_12_03");	//У тебя что, личная шахта есть?
		B_GiveAchievement_Orentalist();
	};
	B_TradeItems(other,self,ItMi_Nugget,1,100);
	Harad_TradeNugget_Cnt += 1;
	B_GivePlayerXP(XP_Harad_Nugget);
};


