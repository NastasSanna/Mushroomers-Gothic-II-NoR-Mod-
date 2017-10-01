
instance DIA_Bosper_EXIT(DIA_Proto_End)
{
	npc = VLK_413_Bosper;
};


/////////////////////////////////////// ТАЛБИН /////////////////////////////////////////////
//===================================================
instance DIA_Bosper_NeedFur_Talbin(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 11;
	condition = DIA_Bosper_NeedFur_Talbin_Cond;
	information = DIA_Bosper_NeedFur_Talbin_Info;
	description = "Ты купишь у меня шкуры?";
};
func int DIA_Bosper_NeedFur_Talbin_Cond()
{
	if (C_HeroIs_Talbin())	{
		return TRUE;
	};
};

func void DIA_Bosper_NeedFur_Talbin_Info()
{
		AI_Output(other,self,"DIA_Bosper_NeedFur_Talbin_07_00");	//Ты купишь у меня шкуры?
	AI_Output(self,other,"DIA_Bosper_NeedFur_Talbin_11_01");	//Мой ученик приносит мне шкуры волков и кабанов, в них у меня недостатка нет.
	AI_Output(self,other,"DIA_Bosper_NeedFur_Talbin_11_02");	//Но он еще недостаточно опытен для охоты на крупного зверя.
	AI_Output(self,other,"DIA_Bosper_NeedFur_Talbin_11_03");	//Поэтому я с удовольствием куплю у тебя шкуры и рога мракориса.
	B_LogEntry(TOPIC_Talbin_Hunt,TOPIC_Talbin_Hunt_Bosper);
	B_LogNote(TOPIC_Trader,TOPIC_Talbin_Hunt_Bosper);
};

//===================================================
instance DIA_Bosper_FurShadow_Talbin(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 12;
	condition = DIA_Bosper_FurShadow_Talbin_Cond;
	information = DIA_Bosper_FurShadow_Talbin_Info;
	permanent = TRUE;
	description = "Я принес шкуру мракориса.";
};
func int DIA_Bosper_FurShadow_Talbin_Cond()
{
	if (C_HeroIs_Talbin() && Npc_KnowsInfo(other,DIA_Bosper_NeedFur_Talbin) && Npc_HasItems(other, ItAt_ShadowFur))	{
		return TRUE;
	};
};

func void DIA_Bosper_FurShadow_Talbin_Info()
{
	if (!MIS_Talbin_Hunt_ShadowFur)	{
		if (Npc_HasItems(other, ItAt_ShadowFur) > 1)	{
			AI_Output(other,self,"DIA_Bosper_FurShadow_Talbin_07_00");	//Я принес шкуры мракориса.
			AI_Output(self,other,"DIA_Bosper_FurShadow_Talbin_11_01");	//У тебя их несколько! Отлично, возьму все.
		}
		else	{
			AI_Output(other,self,"DIA_Bosper_FurShadow_Talbin_07_02");	//Я принес шкуру мракориса.
			AI_Output(self,other,"DIA_Bosper_FurShadow_Talbin_11_03");	//Великолепно! Если добудешь еще, приноси.
		};
		B_LogEntry(TOPIC_Talbin_Hunt,TOPIC_Talbin_Hunt_ShadowFur);
		B_GivePlayerXP(XP_Talbin_Hunt_ShadowFur);
	};
	MIS_Talbin_Hunt_ShadowFur = TRUE;
	B_TradeItems(other,self,ItAt_ShadowFur,-1,Value_ShadowFur);
};

//===================================================
instance DIA_Bosper_HornShadow_Talbin(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 13;
	condition = DIA_Bosper_HornShadow_Talbin_Cond;
	information = DIA_Bosper_HornShadow_Talbin_Info;
	permanent = TRUE;
	description = "Я принес рог мракориса.";
};
func int DIA_Bosper_HornShadow_Talbin_Cond()
{
	if (C_HeroIs_Talbin() && Npc_KnowsInfo(other,DIA_Bosper_NeedFur_Talbin) && Npc_HasItems(other, ItAt_ShadowHorn))	{
		return TRUE;
	};
};

func void DIA_Bosper_HornShadow_Talbin_Info()
{
	if (!MIS_Talbin_Hunt_ShadowHorn)	{
		if (Npc_HasItems(other, ItAt_ShadowHorn) > 1)	{
			AI_Output(other,self,"DIA_Bosper_HornShadow_Talbin_07_00");	//Я принес рога мракориса.
		}
		else	{
			AI_Output(other,self,"DIA_Bosper_HornShadow_Talbin_07_01");	//Я принес рог мракориса.
		};
		B_LogEntry(TOPIC_Talbin_Hunt,TOPIC_Talbin_Hunt_ShadowFur);
		B_GivePlayerXP(XP_Talbin_Hunt_ShadowHorn);
	};
	MIS_Talbin_Hunt_ShadowHorn = TRUE;
	B_TradeItems(other,self,ItAt_ShadowHorn,-1,Value_ShadowFur);
};

//================================================
instance DIA_Bosper_AskMandibles_Talbin(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 14;
	condition = DIA_Bosper_AskMandibles_Talbin_Cond;
	information = DIA_Bosper_AskMandibles_Talbin_Info;
	important = TRUE;
};
func int DIA_Bosper_AskMandibles_Talbin_Cond()
{
	if (C_HeroIs_Talbin() && MIS_Talbin_Hunt_ShadowFur && MIS_Talbin_Hunt_ShadowHorn)	{
		return TRUE;
	};
};
func void DIA_Bosper_AskMandibles_Talbin_Info()
{
	AI_Output(self,other,"DIA_Bosper_AskMandibles_Talbin_11_00");	//Подожди минутку. У меня для тебя есть еще один заказ.
	AI_Output(self,other,"DIA_Bosper_AskMandibles_Talbin_11_01");	//Недавно ко мне заходил Маг Воды, Ватрас. Ему для чего-то понадобились жвала ползуна.
	AI_Output(self,other,"DIA_Bosper_AskMandibles_Talbin_11_02");	//Если ты сможешь достать хотя бы три штуки, я щедро тебе заплачу.
	B_LogEntry(TOPIC_Talbin_Hunt,TOPIC_Talbin_Hunt_AskMandibles);
	MIS_Talbin_Hunt_NeedTeacherMandibles = TRUE;	
};

//================================================
instance DIA_Bosper_GiveMandibles_Talbin(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 15;
	condition = DIA_Bosper_GiveMandibles_Talbin_Cond;
	information = DIA_Bosper_GiveMandibles_Talbin_Info;
	description = "Я принес тебе жвала.";
};
func int DIA_Bosper_GiveMandibles_Talbin_Cond()
{
	if (C_HeroIs_Talbin() && Npc_KnowsInfo(other,DIA_Bosper_AskMandibles_Talbin) 
		 && (Npc_HasItems(other,ItAt_CrawlerMandibles) >= 3))	{
		return TRUE;
	};
};
func void DIA_Bosper_GiveMandibles_Talbin_Info()
{
		AI_Output(other,self,"DIA_Bosper_GiveMandibles_Talbin_07_00");	//Вот, я принес тебе жвала.
	B_GiveInvItems(other,self,ItAt_CrawlerMandibles,3);
	AI_Output(self,other,"DIA_Bosper_GiveMandibles_Talbin_11_01");	//Ты меня очень выручил! Вот, возьми 50 золотых. И еще этот лук. 
	AI_Output(self,other,"DIA_Bosper_GiveMandibles_Talbin_11_02");	//Я делал его для своего ученика, но думаю, тебе он подойдет больше. 
	//B_GiveInvItems(self,other,ItMi_Gold,50);
	//B_GiveInvItems(self,other,ItRw_Bow_M_04,1);
	ItemTrans_items[0] = ItMi_Gold;
	ItemTrans_amount[0] = 50;
	ItemTrans_items[1] = ItRw_Bow_M_04;
	ItemTrans_amount[1] = 1;
	B_ItemsTransaction(self,other);
	MIS_Talbin_Hunt_CrawlerMandibles = TRUE;
	B_LogEntry_Talbin_Hunt(TOPIC_Talbin_Hunt_Mandibles);
	B_GivePlayerXP(XP_Talbin_Hunt_Mandibles);
};

//================================================
instance DIA_Bosper_Talbin_CanMeasureTusk(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 16;
	condition = DIA_Bosper_Talbin_CanMeasureTusk_Cond;
	information = DIA_Bosper_Talbin_CanMeasureTusk_Info;
	description = "Ты можешь измерить длину этих клыков и выписать сертификат?";
};
func int DIA_Bosper_Talbin_CanMeasureTusk_Cond()
{
	if (C_HeroIs_Talbin()
		&& Npc_KnowsInfo(other,DIA_Lutero_Talbin_TuskBig) 
		&& (Npc_HasItems(other,ItAt_KeilerHogTuskBig)))	{
		return TRUE;
	};
};
func void DIA_Bosper_Talbin_CanMeasureTusk_Info()
{
		AI_Output(other,self,"DIA_Bosper_Talbin_CanMeasureTusk_07_00");	//Ты можешь измерить длину этих клыков и выписать сертификат?
	AI_Output(self,other,"DIA_Bosper_Talbin_CanMeasureTusk_11_01");	//Разумеется! Для тебя - всего 25 золотых.
};

//================================================
var int DIA_Bosper_Talbin_MeasureTusk_Got;
instance DIA_Bosper_Talbin_MeasureTusk(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 17;
	condition = DIA_Bosper_Talbin_MeasureTusk_Cond;
	information = DIA_Bosper_Talbin_MeasureTusk_Info;
	description = "Измерь эти клыки. (25 зол.)";
	permanent = TRUE;
};
func int DIA_Bosper_Talbin_MeasureTusk_Cond()
{
	if (C_HeroIs_Talbin()
		&& Npc_KnowsInfo(other,DIA_Bosper_Talbin_CanMeasureTusk) 
		&& (Npc_HasItems(other,ItAt_KeilerHogTuskBig))
		&& (!DIA_Bosper_Talbin_MeasureTusk_Got))	{
		return TRUE;
	};
};
func void DIA_Bosper_Talbin_MeasureTusk_Info()
{
	AI_Output(other,self,"DIA_Bosper_Talbin_MeasureTusk_07_00");	//Измерь эти клыки.
	if (B_GiveGold(other,self,25))	{
		DIA_Bosper_Talbin_MeasureTusk_Got = TRUE;
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_11_01");	//Минутку... Так. Ого! Четыре и одна двенадцатая пальца!
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_11_02");	//А этот еще длиннее, четыре и одна десятая!
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_11_03");	//Похоже, это самые длинные клыки, которые мне приходилось держать в руках.
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_11_04");	//Слушай, лучше продай их мне!
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_11_05");	//Я дам тебе 300 золотых.
		Info_ClearChoices(DIA_Bosper_Talbin_MeasureTusk);
		Info_AddChoice(DIA_Bosper_Talbin_MeasureTusk,"Нет.",DIA_Bosper_Talbin_MeasureTusk_No);
		Info_AddChoice(DIA_Bosper_Talbin_MeasureTusk,"По рукам!",DIA_Bosper_Talbin_MeasureTusk_OK);
		Info_AddChoice(DIA_Bosper_Talbin_MeasureTusk,"Этого мало.",DIA_Bosper_Talbin_MeasureTusk_More);
	}
	else	{
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_11_01a");	//Сначала 25 золотых.
	};
};
func void DIA_Bosper_Talbin_MeasureTusk_No()
{
	AI_Output(other,self,"DIA_Bosper_Talbin_MeasureTusk_No_07_00");	//Нет. У меня уже есть покупатель.
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_No_11_01");	//Жаль. Тогда держи свой сертификат.
	B_GiveInvItems(self,other,ItWr_TuskCertificate,1);
	Info_ClearChoices(DIA_Bosper_Talbin_MeasureTusk);
	B_LogEntry(TOPIC_Talbin_Hunt,TOPIC_Talbin_Hunt_KeilsMeasured);
	B_GivePlayerXP(XP_Talbin_Hunt_KeilsMeasured);
};
func void DIA_Bosper_Talbin_MeasureTusk_More()
{
	AI_Output(other,self,"DIA_Bosper_Talbin_MeasureTusk_More_07_00");	//Этого мало.
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_More_11_01");	//Ну тогда давай так: 250 золотых и ягоду гоблина.
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_More_11_02");	//Это выгодная сделка, ягода стоит гораздо дороже!
	Info_ClearChoices(DIA_Bosper_Talbin_MeasureTusk);
	Info_AddChoice(DIA_Bosper_Talbin_MeasureTusk,"Нет.",DIA_Bosper_Talbin_MeasureTusk_No);
	Info_AddChoice(DIA_Bosper_Talbin_MeasureTusk,"По рукам!",DIA_Bosper_Talbin_MeasureTusk_OK2);
};
func void DIA_Bosper_Talbin_MeasureTusk_OK()
{
	AI_Output(other,self,"DIA_Bosper_Talbin_MeasureTusk_OK_07_00");	//По рукам!
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_OK_11_01");	//Держи золото.
	B_TradeItems(other,self,ItAt_KeilerHogTuskBig,1,300);
	Info_ClearChoices(DIA_Bosper_Talbin_MeasureTusk);
	MIS_Talbin_Hunt_KeilerSold = TRUE;
	B_LogEntry_Talbin_Hunt(TOPIC_Talbin_Hunt_KeilsSoldBosper);
	B_GivePlayerXP(XP_Talbin_Hunt_KeilsSold);
};
func void DIA_Bosper_Talbin_MeasureTusk_OK2()
{
	AI_Output(other,self,"DIA_Bosper_Talbin_MeasureTusk_OK_07_00");	//По рукам!
	B_GiveInvItems(other,self,ItAt_KeilerHogTuskBig,1);
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_OK2_11_01");	//Держи золото и ягоду.
	//B_TradeItems(other,self,ItAt_KeilerHogTuskBig,1,250);
	//B_GiveInvItems(self,other,ItPl_Dex_Herb_01,1);
	ItemTrans_items[0] = ItMi_Gold;
	ItemTrans_amount[0] = 250;
	ItemTrans_items[1] = ItPl_Dex_Herb_01;
	ItemTrans_amount[1] = 1;
	B_ItemsTransaction(self,other);
	Info_ClearChoices(DIA_Bosper_Talbin_MeasureTusk);
	MIS_Talbin_Hunt_KeilerSold = TRUE;
	B_LogEntry_Talbin_Hunt(TOPIC_Talbin_Hunt_KeilsSoldBosper2);
	B_GivePlayerXP(XP_Talbin_Hunt_KeilsSold);
};

/////////////////////////////////////// ЕЛЕНА /////////////////////////////////////////////
//===================================================
instance DIA_Bosper_Elena_AskFur(C_Info)
{
	npc = VLK_413_Bosper;		nr = 20;
	condition = DIA_Bosper_Elena_AskFur_Cond;
	information = DIA_Bosper_Elena_AskFur_Info;
	description = "У тебя есть шкура мракориса?";
};
func int DIA_Bosper_Elena_AskFur_Cond()
{
	if (C_HeroIs_Elena()
		 && MIS_Elena_Present_LuteroAskedFur
		 && (MIS_Elena_Present == LOG_Running)
		 && !MIS_Elena_Present_FurGot)	{
		return TRUE;
	};
};

func void DIA_Bosper_Elena_AskFur_Info()
{
		AI_Output(other,self,"DIA_Bosper_Elena_AskFur_07_00");	//У тебя есть шкура мракориса?
	AI_Output(self,other,"DIA_Bosper_Elena_AskFur_11_01");	//Увы, нет. Могу предложить шкуру волка или кабана...
		AI_Output(other,self,"DIA_Bosper_Elena_AskFur_07_02");	//Нет, мне нужа именно мракорисова.
	AI_Output(self,other,"DIA_Bosper_Elena_AskFur_11_03");	//Попробуй найти кого-то из охотников - Гримбальда, Талбина или Драгомира.
	AI_Output(self,other,"DIA_Bosper_Elena_AskFur_11_04");	//Я давно уже не видел никого из них, а мой ученик, Барток, еще слишком неопытен, чтобы охотиться на крупного зверя.
};

//===================================================
instance DIA_Bosper_Elena_WhereHunters(C_Info)
{
	npc = VLK_413_Bosper;		nr = 21;
	condition = DIA_Bosper_Elena_WhereHunters_Cond;
	information = DIA_Bosper_Elena_WhereHunters_Info;
	description = "Где мне искать охотников?";
	permanent = TRUE;
};
func int DIA_Bosper_Elena_WhereHunters_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_KnowsInfo(other,DIA_Bosper_Elena_AskFur))	{
		return TRUE;
	};
};

func void DIA_Bosper_Elena_WhereHunters_Info()
{
		AI_Output(other,self,"DIA_Bosper_Elena_WhereHunters_07_00");	//Ты не подскажешь, где мне искать охотников?
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_11_01");	//Кто именно тебе нужен?
	Info_ClearChoices(DIA_Bosper_Elena_WhereHunters);
	Info_AddChoice(DIA_Bosper_Elena_WhereHunters,Dialog_Back,DIA_Bosper_Elena_WhereHunters_Back);
	Info_AddChoice(DIA_Bosper_Elena_WhereHunters,"Барток.",DIA_Bosper_Elena_WhereHunters_Bartok);
	Info_AddChoice(DIA_Bosper_Elena_WhereHunters,"Драгомир.",DIA_Bosper_Elena_WhereHunters_Dragomir);
	Info_AddChoice(DIA_Bosper_Elena_WhereHunters,"Гримбальд.",DIA_Bosper_Elena_WhereHunters_Grimbald);
	Info_AddChoice(DIA_Bosper_Elena_WhereHunters,"Талбин.",DIA_Bosper_Elena_WhereHunters_Talbin);
};
func void DIA_Bosper_Elena_WhereHunters_Talbin()
{
		AI_Output(other,self,"DIA_Bosper_Elena_WhereHunters_Talbin_07_00");	//Талбин.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Talbin_11_01");	//Он и его друг Энгром живут в хижине неподалеку от “Мертвой гарпии“.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Talbin_11_02");	//Но я не знаю, застанешь ли ты его там.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Talbin_11_03");	//Ему вздумалось поучаствовать в этом дурацком конкурсе, и теперь он думает только о грибах.
};
func void DIA_Bosper_Elena_WhereHunters_Grimbald()
{
		AI_Output(other,self,"DIA_Bosper_Elena_WhereHunters_Grimbald_07_00");	//Гримбальд.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Grimbald_11_01");	//У Гримбальда с товарищами стоянка в горах за фермой Лобарта. Просто выходи через Южные ворота и иди по дороге.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Grimbald_11_02");	//Честно говоря, я немного волнуюсь за них.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Grimbald_11_03");	//Они уже давно должны были вернуться в город с партией шкур, но от них нет никаких новостей.
};
func void DIA_Bosper_Elena_WhereHunters_Dragomir()
{
		AI_Output(other,self,"DIA_Bosper_Elena_WhereHunters_Dragomir_07_00");	//Драгомир.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Dragomir_11_01");	//Драгомир - одиночка, и редко бывает в городе.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Dragomir_11_02");	//Зато он чаще остальных поднимается высоко в горы на северо-востоке. Не имею представления куда именно он отправился.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Dragomir_11_03");	//Драгомир мастер арбалета, лучший из всех, кого я встречал. Но он редко охотится на крупного зверя, предпочитает синицу в руке.
};
func void DIA_Bosper_Elena_WhereHunters_Bartok()
{
		AI_Output(other,self,"DIA_Bosper_Elena_WhereHunters_Bartok_07_00");	//Барток.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Bartok_11_01");	//Как я говорил, Барток - мой ученик, и он часто заходит в мою лавку.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Bartok_11_02");	//Он еще не слишком опытный охотник, но приносит мне шкуры волков и кабанов.
};
func void DIA_Bosper_Elena_WhereHunters_Back()
{
		AI_Output(other,self,"DIA_Bosper_Elena_WhereHunters_Back_07_00");	//Спасибо, это все.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Back_11_01");	//Обращайся.
	Info_ClearChoices(DIA_Bosper_Elena_WhereHunters);
};

//===================================================
instance DIA_Bosper_Elena_GotFur(C_Info)
{
	npc = VLK_413_Bosper;		nr = 22;
	condition = DIA_Bosper_Elena_GotFur_Cond;
	information = DIA_Bosper_Elena_GotFur_Info;
	description = "У меня есть для тебя заказ.";
};
func int DIA_Bosper_Elena_GotFur_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_HasItems(other,ItAt_ShadowFur)
		 && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};

func void DIA_Bosper_Elena_GotFur_Info()
{
	AI_Output(other,self,"DIA_Bosper_Elena_GotFur_07_00");	//У меня есть для тебя заказ.
	AI_Output(other,self,"DIA_Bosper_Elena_GotFur_07_01");	//Можешь выделать эту шкуру так, чтобы и королю было не стыдно подарить?
	if (Npc_KnowsInfo(other,DIA_Bosper_Elena_AskFur))	{
		AI_Output(self,other,"DIA_Bosper_Elena_GotFur_11_02");	//Так тебе удалось достать шкуру мракориса!
	}
	else	{
		AI_Output(self,other,"DIA_Bosper_Elena_GotFur_11_03");	//Это же шкура мракориса!
	};
	AI_Output(self,other,"DIA_Bosper_Elena_GotFur_11_04");	//Я с радостью обработаю ее. Это займет не меньше трех дней и будет стоить 300 золотых.
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_BosperFurPrice);
};

//===================================================
instance DIA_Bosper_Elena_ProcessFur(C_Info)
{
	npc = VLK_413_Bosper;		nr = 23;
	condition = DIA_Bosper_Elena_ProcessFur_Cond;
	information = DIA_Bosper_Elena_ProcessFur_Info;
	description = "Обработай шкуру мракориса. (300 зол.)";
	permanent = TRUE;
};
func int DIA_Bosper_Elena_ProcessFur_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_HasItems(other,ItAt_ShadowFur) && (MIS_Elena_Present_FurReadyTime == 0) && Npc_KnowsInfo(other,DIA_Bosper_Elena_GotFur)
		 && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};

func void DIA_Bosper_Elena_ProcessFur_Info()
{
	AI_Output(other,self,"DIA_Bosper_Elena_ProcessFur_07_00");	//Обработай шкуру мракориса.
	if (C_NpcHasGold(other,300))	{
		//B_GiveInvItems(other,self,ItMi_Gold,300);
		//B_GiveInvItems(other,self,ItAt_ShadowFur,1);
		ItemTrans_items[0] = ItMi_Gold;
		ItemTrans_amount[0] = 300;
		ItemTrans_items[1] = ItAt_ShadowFur;
		ItemTrans_amount[1] = 1;
		B_ItemsTransaction(other,self);
		AI_Output(self,other,"DIA_Bosper_Elena_ProcessFur_11_01");	//Немедленно принимаюсь за работу. Но выделка шкур требует времени. Быстрее, чем за три дня, я никак не управлюсь.
		MIS_Elena_Present_FurReadyTime = ((Wld_GetDay() + 3)*24 + 11)*60;
		B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_BosperWorks);
	}
	else	{
		AI_Output(self,other,"DIA_Bosper_Elena_ProcessFur_11_02");	//Сначала 300 золотых.
	};
};

//===================================================
instance DIA_Bosper_Elena_FurReady(C_Info)
{
	npc = VLK_413_Bosper;		nr = 24;
	condition = DIA_Bosper_Elena_FurReady_Cond;
	information = DIA_Bosper_Elena_FurReady_Info;
	description = "Шкура готова?";
	permanent = TRUE;
};
func int DIA_Bosper_Elena_FurReady_Cond()
{
	if (C_HeroIs_Elena()
		 && (MIS_Elena_Present_FurReadyTime > 0)
		 && !MIS_Elena_Present_ReadyFurGot)	{
		return TRUE;
	};
};

func void DIA_Bosper_Elena_FurReady_Info()
{
	AI_Output(other,self,"DIA_Bosper_Elena_FurReady_07_00");	//Шкура готова?
	if (MIS_Elena_Present_FurReadyTime < Wld_GetDay_Shifted(5))	{
		AI_Output(self,other,"DIA_Bosper_Elena_FurReady_11_01");	//Вот, полюбуйся. Кожа мягкая, как у младенца, а мех гладкий и блестящий.
		AI_Output(self,other,"DIA_Bosper_Elena_FurReady_11_02");	//Такую и правда не стыдно подарить хоть королю.
		B_GiveInvItems(self,other,ItAt_ShadowFur_Dressed,1);
		MIS_Elena_Present_ReadyFurGot = TRUE;
		B_GivePlayerXP(XP_Elena_ShadowFurReady);
		B_LogEntry_Elena_PresentGot(TOPIC_Elena_Present_FurReady);
	}
	else	{
		AI_Output(self,other,"DIA_Bosper_Elena_FurReady_11_03");	//Еще нет. И торопиться не надо.
	};
};


/////////////////////////////////////// ВСЕ /////////////////////////////////////////////
//===================================================
var int DIA_Bosper_Trade_Once;
instance DIA_Bosper_Trade(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 90;
	condition = DIA_Bosper_Trade_Cond;
	information = DIA_Bosper_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи свои товары.";
};
func int DIA_Bosper_Trade_Cond()
{
	return TRUE;
};

func void DIA_Bosper_Trade_Info()
{
	if (!DIA_Bosper_Trade_Once)	{
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Bosper);
		DIA_Bosper_Trade_Once = TRUE;
	};
	B_GiveTradeInv_Bosper(self);
};

//===================================================
instance DIA_Bosper_HasYew(C_Info)
{
	npc = VLK_413_Bosper;		nr = 30;
	condition = DIA_Bosper_HasYew_Cond;
	information = DIA_Bosper_HasYew_Info;
	description = "Скажи, у тебя нет тиса?";
};
func int DIA_Bosper_HasYew_Cond()
{
	if ((MIS_FellanGoHome == LOG_Running)
		&& Npc_HasItems(other,ItMi_FellanHammer_Broken)
		&& Npc_KnowsInfo(other,DIA_Thorben_HammerWood))	{
		return TRUE;
	};
};

func void DIA_Bosper_HasYew_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Bosper_HasYew_03_00");	//Скажи, у тебя нет тиса?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Bosper_HasYew_07_00");	//Скажи, у тебя нет тиса?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Bosper_HasYew_10_00");	//Скажи, у тебя нет тиса?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Bosper_HasYew_14_00");	//Скажи, у тебя нет тиса?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Bosper_HasYew_16_00");	//Скажи, у тебя нет тиса?
	};
	AI_Output(self,other,"DIA_Bosper_HasYew_11_01");	//Чего нет, того нет. А тебе для чего?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Bosper_HasYew_03_02");	//Вот, хочу починить этот молоток.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Bosper_HasYew_07_02");	//Вот, хочу починить этот молоток.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Bosper_HasYew_10_02");	//Вот, хочу починить этот молоток.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Bosper_HasYew_14_02");	//Вот, хочу починить этот молоток.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Bosper_HasYew_16_02");	//Вот, хочу починить этот молоток.
	};
	AI_Output(self,other,"DIA_Bosper_HasYew_11_03");	//Так-так. Древесина темная, твердая и прочная. Это сердцевина.
	AI_Output(self,other,"DIA_Bosper_HasYew_11_04");	//Для лука потребовалась бы еще гибкая заболонь, это светлая древесина верхнего слоя.
	AI_Output(self,other,"DIA_Bosper_HasYew_11_05");	//Попробуй поспрашивать в порту. Тис используют для свай и при постройке лодок, так как он не гниет в воде.
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerBosper);
};

//===================================================
instance DIA_Bosper_ThorbenDiscount(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 40;
	condition = DIA_Bosper_ThorbenDiscount_Cond;
	information = DIA_Bosper_ThorbenDiscount_Info;
	important = TRUE;
};
func int DIA_Bosper_ThorbenDiscount_Cond()
{
	if (Npc_IsInState(self,ZS_Talk) && (THORBEN_Discount == TRUE))	{
		return TRUE;
	};
};

func void DIA_Bosper_ThorbenDiscount_Info()
{
	AI_Output(self,other,"DIA_Bosper_ThorbenDiscount_11_00");	//Уважаемый мастер Торбен очень хорошо о тебе отзывался.
	AI_Output(self,other,"DIA_Bosper_ThorbenDiscount_11_01");	//Поэтому я хочу предложить тебе отличный пояс всего за полцены.
};
//===================================================
instance DIA_Bosper_Belt(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 41;
	condition = DIA_Bosper_Belt_Cond;
	information = DIA_Bosper_Belt_Info;
	permanent = TRUE;
	description = "Купить пояс ловкости (+10, 500 зол.)";
};
func int DIA_Bosper_Belt_Cond()
{
	if (Npc_KnowsInfo(other,DIA_Bosper_ThorbenDiscount) && (THORBEN_Discount == TRUE)
		&& (Bosper_BeltBought == FALSE))	{
		return TRUE;
	};
};

func void DIA_Bosper_Belt_Info()
{
	if (C_NpcHasGold(other,500))	{
		B_GiveInvItems(self,other,ItBe_Addon_DEX_10,1);
		B_GiveInvItems(other,self,ItMi_Gold,500);
		Bosper_BeltBought = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Bosper_Belt_NoGold_11_00");	//Сначала деньги. Я и так делаю тебе очень щедрое предложение.
	};
};



