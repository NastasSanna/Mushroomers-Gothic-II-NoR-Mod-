
instance DIA_Valentino_EXIT(DIA_Proto_End)
{
	npc = VLK_421_Valentino;
};

// Почта Хориниса ==============================================================
instance DIA_Valentino_RingFromHalvor(C_INFO)
{
	npc = VLK_421_Valentino;				nr = 20;
	condition = DIA_Valentino_RingFromHalvor_cond;
	information = DIA_Valentino_RingFromHalvor_info;
	description = "Вот кольцо, которое ты заказывал.";
};
func int DIA_Valentino_RingFromHalvor_cond()
{
	if (MIS_KhorinisPost_Stage_FromHalvor && Npc_KnowsInfo(other,DIA_Valentino_Start)
		&& Npc_HasItems(other,ItRi_ValentinosRing))	{
		return TRUE;
	};
};
func void DIA_Valentino_RingFromHalvor_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_03_00");	//Вот кольцо, которое ты заказывал.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_07_00");	//Вот кольцо, которое ты заказывал.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_10_00");	//Вот кольцо, которое ты заказывал.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_14_00");	//Вот кольцо, которое ты заказывал.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_16_00");	//Вот кольцо, которое ты заказывал.
	};
	B_GiveInvItems(other,self,ItRi_ValentinosRing,1);
	AI_Output(self,other,"DIA_Valentino_RingFromHalvor_12_01");	//Ах, да. Сколько там я должен?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_03_02");	//100 золотых.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_07_02");	//100 золотых.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_10_02");	//100 золотых.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_14_02");	//100 золотых.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_16_02");	//100 золотых.
	};
	AI_Output(self,other,"DIA_Valentino_RingFromHalvor_12_03");	//Держи 150! Я сегодня в отличном настроении.
	//если в таверне
	if (Npc_GetDistToWP(self,"NW_CITY_TAVERN_IN_06") < 500) 	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			AI_Output(self,other,"DIA_Valentino_RingFromHalvor_12_04");	//Может, выпьешь со мной, красавица?
				AI_Output(other,self,"DIA_Valentino_RingFromHalvor_16_05");	//А с крысой болотной не хочешь выпить?
			AI_Output(self,other,"DIA_Valentino_RingFromHalvor_12_06");	//Ну нет, так нет. Зачем кипятиться?
				AI_Output(other,self,"DIA_Valentino_RingFromHalvor_16_07");	//Плати давай!
			AI_Output(self,other,"DIA_Valentino_RingFromHalvor_12_08");	//Хорошо-хорошо. Держи свои 150 монет. А я поищу кого-нибудь более милого.
		}
		else	{
			B_LookAtNpc(self,VLK_420_Coragon);
			AI_Output(self,other,"DIA_Valentino_RingFromHalvor_12_09");	//Всем пива за счет Валентино!
			B_LookAtNpc(self,other);
			B_GiveInvItems(VLK_420_Coragon,other,ItFo_Beer,1);
		};
	};
	B_GiveGold(self,other,150);
	B_GivePlayerXP(XP_KhorinisPost_ValentinoDelivered);
	MIS_KhorinisPost_ValentinoDelivered = TRUE;
	B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_ValentinoDelivered);
	AI_StopProcessInfos(self);
};
// ==============================================
instance DIA_Valentino_MoneyBack(C_INFO)
{
	npc = VLK_421_Valentino;				nr = 21;
	condition = DIA_Valentino_MoneyBack_cond;
	information = DIA_Valentino_MoneyBack_info;
	description = "Забери свои 50 монет.";
};
func int DIA_Valentino_MoneyBack_cond()
{
	if (MIS_KhorinisPost_ValentinoDelivered
		&& C_NpcHasGold(other,50))	{
		return TRUE;
	};
};
func void DIA_Valentino_MoneyBack_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Valentino_MoneyBack_03_00");	//Забери свои 50 монет.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Valentino_MoneyBack_07_00");	//Забери свои 50 монет.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Valentino_MoneyBack_10_00");	//Забери свои 50 монет.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Valentino_MoneyBack_14_00");	//Забери свои 50 монет.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Valentino_MoneyBack_16_00");	//Забери свои 50 монет.
	};
	AI_Output(self,other,"DIA_Valentino_MoneyBack_12_01");	//Да ладно тебе, это такая мелочь... Мне это ничего не стоит, а для ТЕБЯ, наверное, целая куча денег.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Valentino_MoneyBack_03_02");	//Мне они не нужны.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Valentino_MoneyBack_07_02");	//Мне они не нужны.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Valentino_MoneyBack_10_02");	//Мне они не нужны.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Valentino_MoneyBack_14_02");	//Мне они не нужны.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Valentino_MoneyBack_16_02");	//Мне они не нужны.
	};
	B_GiveGold(other,self,50);
	B_GivePlayerXP(XP_KhorinisPost_ValentinoMoneyBack);
	if (other.aivar[AIV_Gender] == MALE)	{
		B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_ValentinoMoneyBack);
	}
	else	{
		B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_ValentinoMoneyBack_Fem);
	};
	AI_StopProcessInfos(self);
};

// ==============================================
instance DIA_Valentino_Start(C_INFO)
{
	nr = 1;
	npc = VLK_421_Valentino;
	condition = DIA_NoCond_cond;
	information = DIA_Valentino_Start_info;
	description = "Ты ведь Валентино, да?";
};
func void DIA_Valentino_Start_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Valentino_Start_03_00");	//Ты ведь Валентино, да?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Valentino_Start_07_00");	//Ты ведь Валентино, да?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Valentino_Start_10_00");	//Ты ведь Валентино, да?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Valentino_Start_14_00");	//Ты ведь Валентино, да?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Valentino_Start_16_00");	//Ты ведь Валентино, да?
	};
	AI_Output(self,other,"DIA_Valentino_Start_12_01");	//Да, это я, Валентино Великолепный. Слава обо мне летит далеко, ха-ха.
	AI_Output(self,other,"DIA_Valentino_Start_12_02");	//И сегодня ночью я опять буду блистать, сжимая в объятьях красотку.
	if (other.aivar[AIV_Gender] == FEMALE)	{
		AI_Output(self,other,"DIA_Valentino_Start_12_03");	//И это можешь быть ты...
			AI_Output(other,self,"DIA_Valentino_Start_16_04");	//(резко) Мечтать не вредно.
	};
};

// ==============================================
instance DIA_Valentino_MR_Perm(C_INFO)
{
	nr = 50;
	npc = VLK_421_Valentino;
	condition = DIA_Valentino_MR_Perm_cond;
	information = DIA_Valentino_MR_Perm_info;
	description = "Я хотел спросить...";
	permanent = TRUE;
};
func int DIA_Valentino_MR_Perm_cond()
{
	if (Npc_KnowsInfo(other,DIA_Valentino_Start))	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Valentino_MR_Perm.description = "Я хотела спросить...";
		};
		return TRUE;
	};
};
func void DIA_Valentino_MR_Perm_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Valentino_MR_Perm_03_00");	//Я хотел спросить...
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Valentino_MR_Perm_07_00");	//Я хотел спросить...
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Valentino_MR_Perm_10_00");	//Я хотел спросить...
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Valentino_MR_Perm_14_00");	//Я хотел спросить...
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Valentino_MR_Perm_16_00");	//Я хотела спросить...
	};
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Valentino_MR_Perm_12_01");	//Нет-нет, не напрягай меня своими проблемами.
		AI_Output(self,other,"DIA_Valentino_MR_Perm_12_02");	//Лучше выпей, и все проблемы исчезнут сами собой!
	}
	Else	{
		AI_Output(self,other,"DIA_Valentino_MR_Perm_12_03");	//(подмигивая) Конечно, милая барышня, я решу любые твои проблемы.
		if (Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TAVERN01_BACKROOM") < 500)	{
			AI_Output(self,other,"DIA_Valentino_MR_Perm_12_04");	//Садись поближе, и мы все обсудим.
		}
		else	{
			AI_Output(self,other,"DIA_Valentino_MR_Perm_12_05");	//Приходи в таверну Корагона сегодня вечером, и мы все обсудим.
		};
		AI_Output(other,self,"DIA_Valentino_MR_Perm_16_06");	//Э-э нет, лучше не надо...
	};
	AI_StopProcessInfos(self);
};
