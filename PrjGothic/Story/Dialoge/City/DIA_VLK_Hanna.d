
instance DIA_Hanna_EXIT(DIA_Proto_End)
{
	npc = VLK_414_Hanna;
};

/////////////////////////////////////// САРА /////////////////////////////////////////////

//===================================================
instance DIA_Hanna_Start_Sarah(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Start_Sarah_Cond;
	information = DIA_Hanna_Start_Sarah_Info;
	important = TRUE;
};
func int DIA_Hanna_Start_Sarah_Cond()
{
	if (C_HeroIs_Sarah())	{
		return TRUE;
	};
};
func void DIA_Hanna_Start_Sarah_Info()
{
	START_DIA_Finished = TRUE;
		AI_Output(other,self,"DIA_Hanna_Start_Sarah_16_00");	//Мне опять не удалось получить место на рынке. Еще немного, и я разорюсь.
	AI_Output(self,other,"DIA_Hanna_Start_Sarah_17_01");	//Не опускай руки. Ты справишься. Но может быть, тебе стоит отвлечься?
		AI_Output(other,self,"DIA_Hanna_Start_Sarah_16_02");	//О чем ты?
	AI_Output(self,other,"DIA_Hanna_Start_Sarah_17_03");	//Слышала про конкурс Константино?
		AI_Output(other,self,"DIA_Hanna_Start_Sarah_16_04");	//По сбору грибов? Ты шутишь? Мне сейчас только этого не хватало!
	AI_Output(self,other,"DIA_Hanna_Start_Sarah_17_05");	//Но он обещал щедро заплатить всем, кто принесет ему грибы в течение этой недели. А победителю выдать приз!
		AI_Output(other,self,"DIA_Hanna_Start_Sarah_16_06");	//Я не подумала об этом... Но собрать достаточно грибов будет непросто, да и небезопасно бродить по хоринисским лесам.
	AI_Output(self,other,"DIA_Hanna_Start_Sarah_17_07");	//Подруга, я знаю, что ты горазда не только продавать оружие. Иначе бы даже не предлагала. 
	AI_Output(self,other,"DIA_Hanna_Start_Sarah_17_08");	//Тебе нужно быть просто немного увереннее в себе. Тогда все грибы и прилавки будут твоими.
		AI_Output(other,self,"DIA_Hanna_Start_Sarah_16_09");	//Наверное, ты права. Решено, сегодня же иду в лес. 
	Hanna_Paid = TRUE;
	self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] | IGNORE_PortalRoom;
	AI_StopProcessInfos(self);
};
//========================================================
instance DIA_Hanna_Sarah_Final(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 2;
	condition = DIA_Hanna_Sarah_Final_Condition;
	information = DIA_Hanna_Sarah_Final_Info;
	important = TRUE;
};
func int DIA_Hanna_Sarah_Final_Condition()
{
	if ((C_HeroIs_Sarah()) && (Competition_Result != Competition_Result_NONE))	{
		return TRUE;
	};
};
func void DIA_Hanna_Sarah_Final_Info()
{
	AI_Output(self,other,"DIA_Hanna_Sarah_Final_17_01");	//Я уже в курсе!
	if (Competition_Result == Competition_Result_WON)	{
		AI_Output(self,other,"DIA_Hanna_Sarah_Final_WON_17_02");	//Поздравляю с победой! Я в тебя верила.
			AI_Output(other,self,"DIA_Hanna_Sarah_Final_WON_16_03");	//Спасибо. Это была веселая неделя.
		if (MIS_Sarah_OldFriends == LOG_SUCCESS)	{
			AI_Output(other,self,"DIA_Hanna_Sarah_Final_WON_16_04");	//Я повидалась со своими старыми друзьями в Портовом квартале.
		};
		AI_Output(self,other,"DIA_Hanna_Sarah_Final_WON_17_05");	//Так что там за приз?
			AI_Output(other,self,"DIA_Hanna_Sarah_Final_WON_16_06");	//Константино составил справочник грибов. Мне достался первый авторский экземпляр.
		AI_Output(self,other,"DIA_Hanna_Sarah_Final_WON_17_07");	//Да, чего еще ждать от грибного фанатика.
	}
	else	{
		AI_Output(self,other,"DIA_Hanna_Sarah_Final_LOST_17_01");	//Сочувствую.
			AI_Output(other,self,"DIA_Hanna_Sarah_Final_LOST_16_02");	//Да ничего. Это была веселая неделька.
		if (MIS_Sarah_OldFriends == LOG_SUCCESS)	{
			AI_Output(other,self,"DIA_Hanna_Sarah_Final_WON_16_04");	//Я повидалась со своими старыми друзьями в Портовом квартале.
		};
	};
	if(Npc_HasItems(other,ItMi_Gold) > 100)	{
			AI_Output(other,self,"DIA_Hanna_Sarah_Final_16_01");	//И мне удалось поднакопить золота.
	};
};

/////////////////////////////////////// РУПЕРТ /////////////////////////////////////////////

//===================================================
instance DIA_Hanna_Start_Rupert(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 10;
	condition = DIA_Hanna_Start_Rupert_Cond;
	information = DIA_Hanna_Start_Rupert_Info;
	important = TRUE;
};
func int DIA_Hanna_Start_Rupert_Cond()
{
	if (C_HeroIs_Rupert())	{
		return TRUE;
	};
};
func void DIA_Hanna_Start_Rupert_Info()
{
	AI_Output(self,other,"DIA_Hanna_MR_Hello_Rupert_17_00");	//А, это ты, мистер Опять-нет-денег.
	AI_Output(self,other,"DIA_Hanna_MR_Hello_Rupert_17_01");	//Ты все еще должен мне 40 золотых. И если хочешь здесь ночевать, плати вперед.
	B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Hanna_Sum);
};
//-----------------------------------------------
instance DIA_Hanna_Pay_Rupert(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 11;
	condition = DIA_Hanna_Pay_Rupert_Cond;
	information = DIA_Hanna_Pay_Rupert_Info;
	description = "Я хочу вернуть долг (40 зол.).";
	permanent = TRUE;
};
func int DIA_Hanna_Pay_Rupert_Cond()
{
	if (C_HeroIs_Rupert() && Npc_KnowsInfo(other,DIA_Hanna_Start_Rupert)
		&& (MIS_Rupert_Debts_Paid[Creditor_Hanna] == FALSE))	{
		return TRUE;
	};
};
func void DIA_Hanna_Pay_Rupert_Info()
{
	AI_Output(other,self,"DIA_Hanna_Pay_Rupert_03_00");	//Я хочу вернуть долг.
	if (B_GiveGold(other,self,40))	{
		AI_Output(self,other,"DIA_Hanna_Pay_Rupert_17_01");	//Выбрался из ямы, а? Добро пожаловать в трактир.
		B_RupertPayDebt(Creditor_Hanna);
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Pay_Rupert_17_02");	//Если ты забыл, ты должен мне 40 золотых.
	};
};

/////////////////////////////////////// ОСТАЛЬНЫЕ /////////////////////////////////////////////

//===================================================
instance DIA_Hanna_MR_Hello_Others(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 50;
	condition = DIA_Hanna_MR_Hello_Others_Cond;
	information = DIA_Hanna_MR_Hello_Others_Info;
	important = TRUE;
};
func int DIA_Hanna_MR_Hello_Others_Cond()
{
	if (!C_HeroIs_Sarah() && !C_HeroIs_Rupert())	{
		return TRUE;
	};
};
func void DIA_Hanna_MR_Hello_Others_Info()
{
	AI_Output(self,other,"DIA_Hanna_MR_Hello_Others_17_00");	//Добро пожаловать! Двери моего трактира всегда открыты!
};

//-----------------------------------------------
instance DIA_Hanna_HowMuchCost(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 51;
	condition = DIA_Hanna_HowMuchCost_Cond;
	information = DIA_Hanna_HowMuchCost_Info;
	description = "Сколько стоит ночлег?";
};
func int DIA_Hanna_HowMuchCost_Cond()
{
	if (!C_HeroIs_Sarah() && !C_HeroIs_Rupert() && Npc_KnowsInfo(other,DIA_Hanna_MR_Hello_Others))	{
		return TRUE;
	};
};
func void DIA_Hanna_HowMuchCost_Info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Hanna_HowMuchCost_03_00");	//Сколько стоит ночлег?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Hanna_HowMuchCost_07_00");	//Сколько стоит ночлег?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Hanna_HowMuchCost_10_00");	//Сколько стоит ночлег?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Hanna_HowMuchCost_14_00");	//Сколько стоит ночлег?
	} else	{
		AI_Output(other,self,"DIA_Hanna_HowMuchCost_16_00");	//Сколько стоит ночлег?
	};
	AI_Output(self,other,"DIA_Hanna_HowMuchCost_17_01");	//20 золотых в неделю - и любая кровать на втором этаже будет в твоем распоряжении.
	B_LogNote(Topic_Sleep,TOPIC_Sleep_CityHotelPrice);
};

//-----------------------------------------------
instance DIA_Hanna_Pay(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 52;
	condition = DIA_Hanna_Pay_Cond;
	information = DIA_Hanna_Pay_Info;
	description = "Я хочу остановиться на ночь. (20 зол.)";
	permanent = TRUE;
};
func int DIA_Hanna_Pay_Cond()
{
	if (Hanna_Paid == FALSE)	{
		if (C_HeroIs_Rupert() && MIS_Rupert_Debts_Paid[Creditor_Hanna])	{
			return TRUE;
		};
		if (!C_HeroIs_Sarah() && Npc_KnowsInfo(other,DIA_Hanna_HowMuchCost))	{
			return TRUE;
		};
	};
};
func void DIA_Hanna_Pay_Info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Hanna_Pay_03_00");	//Я хочу остановиться на ночь.
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Hanna_Pay_07_00");	//Я хочу остановиться на ночь.
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Hanna_Pay_10_00");	//Я хочу остановиться на ночь.
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Hanna_Pay_14_00");	//Я хочу остановиться на ночь.
	} else	{
		AI_Output(other,self,"DIA_Hanna_Pay_16_00");	//Я хочу остановиться на ночь.
	};
	if (B_GiveGold(other,self,20))	{
		AI_Output(self,other,"DIA_Hanna_Pay_17_01");	//Чувствуй себя как дома.
		self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] | IGNORE_PortalRoom;
		Hanna_Paid = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Pay_17_02");	//Деньги вперед. 20 золотых за неделю.
	};
};

//-----------------------------------------------
VAR INT DIA_Hanna_Perm_Num;
instance DIA_Hanna_Perm(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 53;
	condition = DIA_Hanna_MR_Perm_Cond;
	information = DIA_Hanna_MR_Perm_Info;
	description = "Какие новости?";
	permanent = TRUE;
};
func int DIA_Hanna_MR_Perm_Cond()
{
	return TRUE;
};
func void DIA_Hanna_MR_Perm_Info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Hanna_MR_Perm_03_00");	//Какие новости?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Hanna_MR_Perm_07_00");	//Какие новости?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Hanna_MR_Perm_10_00");	//Какие новости?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Hanna_MR_Perm_14_00");	//Какие новости?
	} else	{
		AI_Output(other,self,"DIA_Hanna_MR_Perm_16_00");	//Какие новости?
	};
	if (DIA_Hanna_Perm_Num == 0)	{
		AI_Output(self,other,"DIA_Hanna_MR_Perm_17_01");	//Все обсуждают грибной конкурс Константино. Но желающих отправиться в лес немного.
	}
	else if (DIA_Hanna_Perm_Num == 1)	{
		AI_Output(self,other,"DIA_Hanna_MR_Perm_17_02");	//Пока губернатор на материке, главным в городе считается Корнелиус.
		AI_Output(self,other,"DIA_Hanna_MR_Perm_17_03");	//Но реально всеми делами заправляют судья и начальник городской стражи.
	}
	else	{
		AI_Output(self,other,"DIA_Hanna_MR_Perm_17_04");	//Пару недель назад у Гербрандта из Верхнего квартала украли какое-то очень редкое кольцо.
		AI_Output(self,other,"DIA_Hanna_MR_Perm_17_05");	//Он тут же поднял тревогу и стражники бросились за вором в погоню.
		AI_Output(self,other,"DIA_Hanna_MR_Perm_17_06");	//Убегая, тот попытался перелезть через городскую стену по дереву, прямо тут, на рыночной площади.
		AI_Output(self,other,"DIA_Hanna_MR_Perm_17_07");	//Он даже сумел забраться на самый верх, но вдруг оступился и упал на мостовую, головой вниз. Жуткое было зрелище, я тебе скажу.
		AI_Output(self,other,"DIA_Hanna_MR_Perm_17_08");	//Стражники обыскали тело, но кольца на нем не оказалось. Его так и не нашли.
	};
	DIA_Hanna_Perm_Num = (DIA_Hanna_Perm_Num + 1) % 3;
};


