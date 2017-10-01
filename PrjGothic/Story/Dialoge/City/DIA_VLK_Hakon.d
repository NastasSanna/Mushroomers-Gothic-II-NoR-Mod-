
instance DIA_Hakon_EXIT(DIA_Proto_End)
{
	npc = VLK_407_Hakon;
};

// Почта Хориниса ==============================================================
instance DIA_Hakon_YourPost(C_INFO)
{
	npc = VLK_407_Hakon;				nr = 10;
	condition = DIA_Hakon_YourPost_cond;
	information = DIA_Hakon_YourPost_info;
	description = "Я принес тебе руду.";
};
func int DIA_Hakon_YourPost_cond()
{
	if (MIS_KhorinisPost_Stage_FromHalvor
		&& (Npc_HasItems(other,ItMi_Nugget) >= 3))	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Hakon_YourPost.description = "Я принесла тебе руду.";
		};
		return TRUE;
	};
};
func void DIA_Hakon_YourPost_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Hakon_YourPost_03_00");	//Я принес тебе руду.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Hakon_YourPost_07_00");	//Я принес тебе руду.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Hakon_YourPost_10_00");	//Я принес тебе руду.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Hakon_YourPost_14_00");	//Я принес тебе руду.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Hakon_YourPost_16_00");	//Я принесла тебе руду.
	};
	B_GiveInvItems(other,self,ItMi_Nugget,3);
	AI_Output(self,other,"DIA_Hakon_YourPost_12_01");	//Отлично! Вот 150 золотых, как и договаривались.
	B_GiveGold(self,other,150);
	AI_Output(self,other,"DIA_Hakon_YourPost_12_02");	//Но, может быть, ты хочешь заработать еще 10 золотых?
	AI_Output(self,other,"DIA_Hakon_YourPost_12_03");	//Нужно всего лишь передать эту руду кузнецу Гараду.
	B_GivePlayerXP(XP_KhorinisPost_HakonDelivered);
	MIS_KhorinisPost_HakonDelivered = TRUE;
	B_LogEntry_HalvorPost(TOPIC_KhorinisPost_HakonDelivered);
	Info_ClearChoices(DIA_Hakon_YourPost);
	Info_AddChoice(DIA_Hakon_YourPost,"Нет, мне некогда.",DIA_Hakon_YourPost_No);
	Info_AddChoice(DIA_Hakon_YourPost,"Хорошо.",DIA_Hakon_YourPost_Yes);
};
//---------------------------------------
func void DIA_Hakon_YourPost_No()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Hakon_YourPost_No_03_00");	//Нет, мне некогда.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Hakon_YourPost_No_07_00");	//Нет, мне некогда.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Hakon_YourPost_No_10_00");	//Нет, мне некогда.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Hakon_YourPost_No_14_00");	//Нет, мне некогда.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Hakon_YourPost_No_16_00");	//Нет, мне некогда.
	};
	AI_Output(self,other,"DIA_Hakon_YourPost_No_12_01");	//Ну нет, так нет.
	Info_ClearChoices(DIA_Hakon_YourPost);
};
//---------------------------------------
func void DIA_Hakon_YourPost_Yes()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Hakon_YourPost_Yes_03_00");	//Хорошо.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Hakon_YourPost_Yes_07_00");	//Хорошо.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Hakon_YourPost_Yes_10_00");	//Хорошо.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Hakon_YourPost_Yes_14_00");	//Хорошо.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Hakon_YourPost_Yes_16_00");	//Хорошо.
	};
	AI_Output(self,other,"DIA_Hakon_YourPost_Yes_12_01");	//Тогда держи руду и золото. И не задерживайся, неси прямо сейчас!
	//B_GiveInvItems(self,other,ItMi_Nugget,3);
	//B_GiveGold(self,other,10);
	ItemTrans_items[0] = ItMi_Nugget;
	ItemTrans_amount[0] = 3;
	ItemTrans_items[1] = ItMi_Gold;
	ItemTrans_amount[1] = 10;
	B_ItemsTransaction(self,other);
	//через сутки начнет волноваться
	Info_ClearChoices(DIA_Hakon_YourPost);
	MIS_KhorinisPost_HakonTime = Wld_GetFullTime() + 24*60;
	MIS_KhorinisPost_Stage_FromHakon = TRUE;
	B_LogEntry_HalvorPost(TOPIC_KhorinisPost_HakonPost);
};

// ==============================================================
instance DIA_Hakon_Delivered(C_INFO)
{
	npc = VLK_407_Hakon;				nr = 11;
	condition = DIA_Hakon_Delivered_cond;
	information = DIA_Hakon_Delivered_info;
	important = TRUE;
};
func int DIA_Hakon_Delivered_cond()
{
	if (MIS_KhorinisPost_Stage_FromHakon
		&& !MIS_KhorinisPost_HaradDelivered
		&& (Wld_GetFullTime() > MIS_KhorinisPost_HakonTime))	{
		return TRUE;
	};
};
func void DIA_Hakon_Delivered_info()
{
	AI_Output(self,other,"DIA_Hakon_Delivered_12_00");	//Эй! Почему руда все еще не у Гарада?
	AI_Output(self,other,"DIA_Hakon_Delivered_12_01");	//Я бы уже 10 раз сам отнес!
	AI_Output(self,other,"DIA_Hakon_Delivered_12_02");	//Немедленно верни мне руду и деньги, или я сообщу стражникам, что ты пытаешься меня ограбить!
	B_GivePlayerXP(XP_KhorinisPost_HakonAnti);
	MIS_KhorinisPost_Stage_FromHakon = FALSE;
	B_LogEntry_KhorinisPost_SuccessAll(TOPIC_KhorinisPost_HaradBack);
	Info_ClearChoices(DIA_Hakon_Delivered);
	Info_AddChoice(DIA_Hakon_Delivered,"У меня их нет...",DIA_Hakon_Delivered_No);
	if ((Npc_HasItems(other,ItMi_Nugget) >= 3) && C_NpcHasGold(other,10))	{
		Info_AddChoice(DIA_Hakon_Delivered,"Возьми.",DIA_Hakon_Delivered_Yes);
	};
};
func void DIA_Hakon_Delivered_Yes()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Hakon_Delivered_Yes_03_00");	//Возьми.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Hakon_Delivered_Yes_07_00");	//Возьми.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Hakon_Delivered_Yes_10_00");	//Возьми.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Hakon_Delivered_Yes_14_00");	//Возьми.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Hakon_Delivered_Yes_16_00");	//Возьми.
	};
	B_GiveInvItems(other,self,ItMi_Nugget,3);
	B_GiveGold(other,self,10);
	AI_Output(self,other,"DIA_Hakon_Delivered_Yes_12_01");	//(себе под нос) Ни на кого нельзя положиться...
	AI_StopProcessInfos(self);
};
func void DIA_Hakon_Delivered_No()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Hakon_Delivered_No_03_00");	//У меня их нет...
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Hakon_Delivered_No_07_00");	//У меня их нет...
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Hakon_Delivered_No_10_00");	//У меня их нет...
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Hakon_Delivered_No_14_00");	//У меня их нет...
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Hakon_Delivered_No_16_00");	//У меня их нет...
	};
	AI_Output(self,other,"DIA_Hakon_Delivered_No_12_01");	//Да как ты смеешь?.. СТРАЖА!!!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_Theft,0);
};



// ТОРГОВЛЯ ==============================================

instance DIA_Hakon_Hello(C_INFO)
{
	nr = 1;
	npc = VLK_407_Hakon;
	condition = DIA_WhenAsked_cond;
	information = DIA_Hakon_MR_MR_Hello_info;
	important = TRUE;
};
func void DIA_Hakon_MR_MR_Hello_info()
{
	if (C_HeroIs_Erol())	{
		AI_Output(self,other,"DIA_Hakon_MR_MR_Hello_12_00");	//Почтенный Эрол! Не желаете ли чего-нибудь купить?
		AI_Output(other,self,"DIA_Hakon_MR_MR_Hello_10_01");	//А у тебя есть из чего выбрать?
		AI_Output(self,other,"DIA_Hakon_MR_MR_Hello_12_02");	//Судите сами.
	}
	else
	if (C_HeroIs_Sarah())	{
		AI_Output(self,other,"DIA_Hakon_MR_MR_Hello_12_03");	//Сара! Продаешь или покупаешь?
	}
	else
	if (C_HeroIs_Rupert())	{
		AI_Output(self,other,"DIA_Hakon_MR_MR_Hello_12_04");	//Деньги вперед!
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_MR_MR_Hello_12_05");	//Оружие на любой вкус и кошелек!
	};
};
//-----------------------------------------
var int DIA_Hakon_MRTrade_Once;
instance DIA_Hakon_MRTrade(C_INFO)
{
	nr = 50;
	npc = VLK_407_Hakon;
	condition = DIA_Hakon_MRTrade_cond;
	information = DIA_Hakon_MRTrade_info;
	description = "Покажи свое оружие.";
	trade = TRUE;
	permanent = TRUE;
};

func int DIA_Hakon_MRTrade_cond()
{
	if (Npc_KnowsInfo(other,DIA_Hakon_Hello))	{
		return TRUE;
	};
};

func void DIA_Hakon_MRTrade_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Hakon_MRTrade_03_00");	//Покажи свое оружие.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Hakon_MRTrade_07_00");	//Покажи свое оружие.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Hakon_MRTrade_10_00");	//Покажи свое оружие.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Hakon_MRTrade_14_00");	//Покажи свое оружие.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Hakon_MRTrade_16_00");	//Покажи свое оружие.
	};
	if (!DIA_Hakon_MRTrade_Once)	{
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Hakon);
		DIA_Hakon_MRTrade_Once = TRUE;
	};
	B_GiveTradeInv_Hakon(self);
};
