
instance DIA_Brahim_EXIT(DIA_Proto_End)
{
	npc = VLK_437_Brahim;
};

/////////////////////////////////////// ЕЛЕНА /////////////////////////////////////////

//===================================================
instance DIA_Brahim_Elena_AboutPortraits(C_Info)
{
	npc = VLK_437_Brahim;					nr = 1;
	condition = DIA_Brahim_Elena_AboutPortraits_Cond;
	information = DIA_Brahim_Elena_AboutPortraits_Info;
	description = "Скажи, ты мог бы сделать копии портретов?";
};
func int DIA_Brahim_Elena_AboutPortraits_Cond()
{
	if (C_HeroIs_Elena()
		 && (Npc_KnowsInfo(other,DIA_Brian_Elena_HeardPresent))
		 && (MIS_Elena_Present == LOG_Running) && (MIS_Elena_Present_BrianReturn == FALSE))	{
		return TRUE;
	};
};

func void DIA_Brahim_Elena_AboutPortraits_Info()
{
		AI_Output(other,self,"DIA_Brahim_Elena_AboutPortraits_12_00");	//Скажи, ты мог бы сделать копии портретов?
	AI_Output(self,other,"DIA_Brahim_Elena_AboutPortraits_07_01");	//Отчего нет? Я с удовольствием возьмусь за кисть и перо. За один рисунок возьму 40 золотых.
		AI_Output(other,self,"DIA_Brahim_Elena_AboutPortraits_12_02");	//Мне нужно, чтобы ты нарисовал два маленьких портрета моих родителей, вроде тех, что вставляют в медальоны.
	AI_Output(self,other,"DIA_Brahim_Elena_AboutPortraits_07_03");	//Дай мне образец, и я нарисую его в любом размере, хоть с ноготь, хоть с площадь.
	if (!MIS_Elena_Present_KnowsBrahim)	{
		MIS_Elena_Present_KnowsBrahim = TRUE;
		B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_KnowsBrahim);
	};
	self.aivar[AIV_IgnoreFlags] = IGNORE_PortalRoom_Public;
};

//===================================================
instance DIA_Brahim_Elena_CopyPortraits(C_Info)
{
	npc = VLK_437_Brahim;					nr = 2;
	condition = DIA_Brahim_Elena_CopyPortraits_Cond;
	information = DIA_Brahim_Elena_CopyPortraits_Info;
	description = "Скопируй эти портреты. (80 золотых)";
	permanent = TRUE;
};
func int DIA_Brahim_Elena_CopyPortraits_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_KnowsInfo(other,DIA_Brahim_Elena_AboutPortraits) && Npc_HasItems(other,ItMi_PortraitOnarMaria)
		 && (MIS_Elena_Present_BrahimReadyTime == 0)
		 && (MIS_Elena_Present == LOG_Running) && (MIS_Elena_Present_BrianReturn == FALSE))	{
		return TRUE;
	};
};

func void DIA_Brahim_Elena_CopyPortraits_Info()
{
	AI_Output(other,self,"DIA_Brahim_Elena_CopyPortraits_12_00");	//Скопируй эти портреты.
	if (C_NpcHasGold(other,80))	{
		//B_GiveInvItems(other,self,ItMi_Gold,80);
		//B_GiveInvItems(other,self,ItMi_PortraitOnarMaria,1);
		ItemTrans_items[0] = ItMi_Gold;
		ItemTrans_amount[0] = 80;
		ItemTrans_items[1] = ItMi_PortraitOnarMaria;
		ItemTrans_amount[1] = 1;
		B_ItemsTransaction(other,self);
			AI_Output(self,other,"DIA_Brahim_Elena_CopyPortraits_07_01");	//Часа через три будет готово.
		MIS_Elena_Present_BrahimReadyTime = Wld_GetFullTime() + 3*60;
		B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_BrahimWorks);
	}
	else	{
		AI_Output(self,other,"DIA_Brahim_Elena_CopyPortraits_07_02");	//Две копии стоят 80 золотых.
	};
};

//===================================================
instance DIA_Brahim_Elena_PortraitsReady(C_Info)
{
	npc = VLK_437_Brahim;					nr = 3;
	condition = DIA_Brahim_Elena_PortraitsReady_Cond;
	information = DIA_Brahim_Elena_PortraitsReady_Info;
	description = "Портреты готовы?";
	permanent = TRUE;
};
func int DIA_Brahim_Elena_PortraitsReady_Cond()
{
	if (C_HeroIs_Elena()
		 && (MIS_Elena_Present_BrahimReadyTime > 0)
		 && !MIS_Elena_Present_PortraitsReady
		 && (MIS_Elena_Present == LOG_Running) && (MIS_Elena_Present_BrianReturn == FALSE))	{
		return TRUE;
	};
};

func void DIA_Brahim_Elena_PortraitsReady_Info()
{
	AI_Output(other,self,"DIA_Brahim_Elena_PortraitsReady_12_00");	//Портреты готовы?
	if (MIS_Elena_Present_BrahimReadyTime < Wld_GetFullTime())	{
		AI_Output(self,other,"DIA_Brahim_Elena_PortraitsReady_07_01");	//Да. Вот твои копии и оригинал.
		//B_GiveInvItems(self,other,ItMi_PortraitOnarMaria,1);
		//B_GiveInvItems(self,other,ItMi_PortraitOnarMariaDouble,1);
		ItemTrans_items[0] = ItMi_PortraitOnarMaria;
		ItemTrans_amount[0] = 1;
		ItemTrans_items[1] = ItMi_PortraitOnarMariaDouble;
		ItemTrans_amount[1] = 1;
		B_ItemsTransaction(self,other);
		MIS_Elena_Present_PortraitsReady = TRUE;
		B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_PortretsReady);
	}
	else	{
		AI_Output(self,other,"DIA_Brahim_Elena_AboutPortraits_07_02");	//Еще нет. Не дергай меня, иначе я никогда не закончу.
		//+ несколько минут работы
		MIS_Elena_Present_BrahimReadyTime += Hlp_Random(3);
	};
};

/////////////////////////////////////// САРА /////////////////////////////////////////////

//===================================================
instance DIA_Brahim_Sarah_Hello(C_Info)
{
	npc = VLK_437_Brahim;				nr = 10;
	condition = DIA_Brahim_Sarah_MR_Hello_cond;
	information = DIA_Brahim_Sarah_MR_Hello_Info;
	description = "Ибрагим, как здоровье?";
};
func int DIA_Brahim_Sarah_MR_Hello_cond()
{
	if (C_HeroIs_Sarah())	{
		return TRUE;
	};
};
func void DIA_Brahim_Sarah_MR_Hello_Info()
{
		AI_Output(other,self,"DIA_Brahim_Sarah_MR_Hello_16_00");	//Ибрагим, как здоровье?
	AI_Output(self,other,"DIA_Brahim_Sarah_MR_Hello_13_01");	//Не жалуюсь.
	AI_Output(self,other,"DIA_Brahim_Sarah_MR_Hello_13_02");	//Конечно, с тех пор, как в порт перестали заходить корабли, мои карты почти никто не покупает.
	AI_Output(self,other,"DIA_Brahim_Sarah_MR_Hello_13_03");	//Но мне удается сводить концы с концами.
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_Brahim);
};
//===================================================
instance DIA_Brahim_Sarah_WhereIsBerny(C_Info)
{
	npc = VLK_437_Brahim;				nr = 11;
	condition = DIA_Brahim_Sarah_WhereIsBerny_cond;
	information = DIA_Brahim_Sarah_WhereIsBerny_Info;
	description = "А где старик Берни?";
};
func int DIA_Brahim_Sarah_WhereIsBerny_cond()
{
	if (C_HeroIs_Sarah() && Npc_KnowsInfo(other,DIA_Brahim_Sarah_Hello))	{
		return TRUE;
	};
};
func void DIA_Brahim_Sarah_WhereIsBerny_Info()
{
		AI_Output(other,self,"DIA_Brahim_Sarah_WhereIsBerny_16_00");	//А где старик Берни?
		AI_Output(other,self,"DIA_Brahim_Sarah_WhereIsBerny_16_01");	//Сколько себя помню, он всегда грел кости на той лавочке, да смотрел на море.
	AI_Output(self,other,"DIA_Brahim_Sarah_WhereIsBerny_13_02");	//Нет больше старика Берни, отдал Богам душу в прошлую зиму.
	AI_Output(self,other,"DIA_Brahim_Sarah_WhereIsBerny_13_03");	//Утром сел, как всегда, на свою лавочку, да так и помер, глядя на горизонт.
	AI_Output(self,other,"DIA_Brahim_Sarah_WhereIsBerny_13_04");	//Мы только к закату, когда он уже окоченел, почуяли неладное.
	AI_Output(self,other,"DIA_Brahim_Sarah_WhereIsBerny_13_05");	//Так и похоронили его в море. В земле не смог бы он спокойно лежать, зуб даю, не смог бы.
	B_LogEntry(TOPIC_Sarah_OldFriends,TOPIC_Sarah_OldFriends_BernyDead);
	MIS_Sarah_OldFriends_BernyPray = TRUE;
};




/////////////////////////////////////// ВСЕ ///////////////////////////////////////

// ТОРГОВЛЯ ==============================================
var int DIA_Brahim_MRTrade_Once;
instance DIA_Brahim_MRTrade(C_INFO)
{
	nr = 50;
	npc = VLK_437_Brahim;
	condition = DIA_NoCond_cond;
	information = DIA_Brahim_MRTrade_info;
	description = "Я хочу купить карту.";
	trade = TRUE;
	permanent = TRUE;
};
func void DIA_Brahim_MRTrade_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Brahim_MRTrade_03_00");	//Я хочу купить карту.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Brahim_MRTrade_07_00");	//Я хочу купить карту.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Brahim_MRTrade_10_00");	//Я хочу купить карту.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Brahim_MRTrade_14_00");	//Я хочу купить карту.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Brahim_MRTrade_16_00");	//Я хочу купить карту.
	};
	if (!DIA_Brahim_MRTrade_Once)	{
		AI_Output(self,other,"DIA_Brahim_MRTrade_13_01");	//Да, конечно.
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Brahim);
		DIA_Brahim_MRTrade_Once = TRUE;
	};
	B_GiveTradeInv_Brahim(self);
};
