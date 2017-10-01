
instance DIA_Brian_EXIT(DIA_Proto_End)
{
	npc = VLK_457_Brian;
};

/////////////////////////////////////// ЕЛЕНА /////////////////////////////////////////////

//===================================================
instance DIA_Brian_Elena_HeardPresent(C_Info)
{
	npc = VLK_457_Brian;					nr = 1;
	condition = DIA_Brian_Elena_HeardPresent_Cond;
	information = DIA_Brian_Elena_HeardPresent_Info;
	important = TRUE;
};
func int DIA_Brian_Elena_HeardPresent_Cond()
{
	if (C_HeroIs_Elena()
		 && (Npc_KnowsInfo(other,DIA_Harad_Elena_AskPresent))
		 && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_HeardPresent_Info()
{
	AI_Output(self,other,"DIA_Brian_Elena_HeardPresent_04_00");	//Эй, погоди! Я слышал, тебе нужен подарок для родителей.
	AI_Output(self,other,"DIA_Brian_Elena_HeardPresent_04_01");	//Я, конечно, всего лишь ученик оружейника, но я пробовал работать и с драгоценными металлами.
	AI_Output(self,other,"DIA_Brian_Elena_HeardPresent_04_02");	//Если хочешь, я могу попробовать выковать пару колец, в каждое из которых можно вставить маленький портрет.
	AI_Output(self,other,"DIA_Brian_Elena_HeardPresent_04_03");	//Тогда они всегда смогут видеть лица друг друга.
		AI_Output(other,self,"DIA_Brian_Elena_HeardPresent_12_04");	//Ух ты! Это очень романтично. И довольно оригинально.
	AI_Output(self,other,"DIA_Brian_Elena_HeardPresent_04_05");	//Я сначала думал про медальон, но это показалось мне немного банальным.
		AI_Output(other,self,"DIA_Brian_Elena_HeardPresent_12_06");	//И сколько возьмешь за работу?
	AI_Output(self,other,"DIA_Brian_Elena_HeardPresent_04_07");	//150 золотых. И я не прошу платить вперед. Отдашь деньги, когда увидишь готовые кольца.
		AI_Output(other,self,"DIA_Brian_Elena_HeardPresent_12_08");	//А ты справишься?
	AI_Output(self,other,"DIA_Brian_Elena_HeardPresent_04_09");	//Я уверен, что смогу изготовить подходящие кольца. Но у меня нет материала и портретов.
	B_LogEntry_Elena_Present(TOPIC_Elena_Present_Brian);
};

//===================================================
instance DIA_Brian_Elena_AboutMaterials(C_Info)
{
	npc = VLK_457_Brian;					nr = 2;
	condition = DIA_Brian_Elena_AboutMaterials_Cond;
	information = DIA_Brian_Elena_AboutMaterials_Info;
	description = "Какие материалы тебе нужны?";
};
func int DIA_Brian_Elena_AboutMaterials_Cond()
{
	if (C_HeroIs_Elena()
		 && (Npc_KnowsInfo(other,DIA_Brian_Elena_HeardPresent))
		 && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_AboutMaterials_Info()
{
		AI_Output(other,self,"DIA_Brian_Elena_AboutMaterials_12_00");	//Какие материалы тебе нужны?
	AI_Output(self,other,"DIA_Brian_Elena_AboutMaterials_04_01");	//Золото, разумеется. Драгоценные камни на таких кольцах будут, на мой взгляд, излишеством.
	AI_Output(self,other,"DIA_Brian_Elena_AboutMaterials_04_02");	//Лучше всего, если у тебя есть два обычных золотых кольца.
		AI_Output(other,self,"DIA_Brian_Elena_AboutMaterials_12_03");	//А золотые монеты тебе не подойдут?
	AI_Output(self,other,"DIA_Brian_Elena_AboutMaterials_04_04");	//Нет. Ты, наверное, не знаешь, но монеты делают не из чистого золота. В них куча примесей, в первую очередь, меди. И чем истощеннее королевская казна, тем больше примесей добавляют.
	AI_Output(self,other,"DIA_Brian_Elena_AboutMaterials_04_05");	//Для работы мне нужно чистое золото.
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_NeededMaterials);
};

//===================================================
instance DIA_Brian_Elena_GiveRings(C_Info)
{
	npc = VLK_457_Brian;					nr = 3;
	condition = DIA_Brian_Elena_GiveRings_Cond;
	information = DIA_Brian_Elena_GiveRings_Info;
	description = "Я принесла кольца.";
};
func int DIA_Brian_Elena_GiveRings_Cond()
{
	if (C_HeroIs_Elena()
		 && (Npc_KnowsInfo(other,DIA_Brian_Elena_AboutMaterials))
		 && (Npc_HasItems(other,ItMi_GoldRing) >= 2)
		 && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_GiveRings_Info()
{
		AI_Output(other,self,"DIA_Brian_Elena_GiveRings_12_00");	//Я принесла кольца.
	B_GiveInvItems(other,self,ItMi_GoldRing,2);
	Npc_RemoveInvItems(self,ItMi_GoldRing,2);
	AI_Output(self,other,"DIA_Brian_Elena_GiveRings_04_01");	//Замечательно! Мне не терпится приступить к работе.
	AI_Output(self,other,"DIA_Brian_Elena_GiveRings_04_02");	//Я не уверен, сколько времени мне потребуется... Но постараюсь закончить за день.
	MIS_Elena_Present_BrianTime = (Wld_GetDay()*24 + 24) * 60;
	B_GivePlayerXP(XP_Elena_RingsGot);
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_BrianStart);
};

//===================================================
instance DIA_Brian_Elena_AskRingsReady(C_Info)
{
	npc = VLK_457_Brian;					nr = 4;
	condition = DIA_Brian_Elena_AskRingsReady_Cond;
	information = DIA_Brian_Elena_AskRingsReady_Info;
	description = "Кольца готовы?";
	permanent = TRUE;
};
func int DIA_Brian_Elena_AskRingsReady_Cond()
{
	if (C_HeroIs_Elena()
		 && (MIS_Elena_Present_BrianTime > 0)
		 && (MIS_Elena_Present_BrianTime >= Wld_GetFullTime()))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_AskRingsReady_Info()
{
		AI_Output(other,self,"DIA_Brian_Elena_AskRingsReady_12_00");	//Кольца готовы?
	AI_Output(self,other,"DIA_Brian_Elena_AskRingsReady_04_01");	//Еще нет. Я работаю как могу быстро.
};

//===================================================
var int PortraitRings_View;
instance DIA_Brian_Elena_RingsReady(C_Info)
{
	npc = VLK_457_Brian;					nr = 5;
	condition = DIA_Brian_Elena_RingsReady_Cond;
	information = DIA_Brian_Elena_RingsReady_Info;
	important = TRUE;
};
func int DIA_Brian_Elena_RingsReady_Cond()
{
	if (C_HeroIs_Elena()
		 && (MIS_Elena_Present_BrianTime > 0)
		 && (MIS_Elena_Present_BrianTime < Wld_GetFullTime()))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_RingsReady_Info()
{
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_04_00");	//Я закончил! Посмотри, по-моему, получилось неплохо.
	CreateInvItems(self,ItMi_PortraitRings_Empty,1);
	PortraitRings_View = View_CreateCenterPxl(Print_ToPixel(PS_VMax / 2, PS_X),Print_ToPixel(PS_VMax / 2, PS_Y),512,256);
	View_SetTexture(PortraitRings_View,"ElenaRings_Empty.TGA");
	View_Open(PortraitRings_View);
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_RingsReady);
	Info_ClearChoices(DIA_Brian_Elena_RingsReady);
	Info_AddChoice(DIA_Brian_Elena_RingsReady,"Так себе... Никакого изящества.",DIA_Brian_Elena_RingsReady_Bad);
	Info_AddChoice(DIA_Brian_Elena_RingsReady,"Да, неплохо. Мне нравится. Просто, но со вкусом.",DIA_Brian_Elena_RingsReady_NotBad);
	Info_AddChoice(DIA_Brian_Elena_RingsReady,"Какая прелесть!!! Просто замечательно!",DIA_Brian_Elena_RingsReady_Great);
};
func void DIA_Brian_Elena_RingsReady_Great()
{
	View_Close(PortraitRings_View);
	View_Delete(PortraitRings_View);
	PortraitRings_View = 0;
		AI_Output(other,self,"DIA_Brian_Elena_RingsReady_Great_12_00");	//Какая прелесть!!! Просто замечательно!
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_Great_04_01");	//(смущенно) Ну, не преувеличивай. Я специально сделал кольца попроще, чтобы главной изюминкой в них были портреты.
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_Great_04_02");	//Я выгравировал имена твоих родителей на внутренней стороне.
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_Great_04_03");	//Кольца твои за 150 золотых, как договаривались.
	Info_ClearChoices(DIA_Brian_Elena_RingsReady);
};
func void DIA_Brian_Elena_RingsReady_NotBad()
{
	View_Close(PortraitRings_View);
	View_Delete(PortraitRings_View);
	PortraitRings_View = 0;
		AI_Output(other,self,"DIA_Brian_Elena_RingsReady_NotBad_12_00");	//Да, неплохо. Мне нравится. Просто, но со вкусом.
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_NotBad_04_01");	//(с облегчением) Спасибо. Я боялся, тебе они покажутся грубоватыми. Я ведь только ученик кузнеца...
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_Great_04_02");	//Я выгравировал имена твоих родителей на внутренней стороне.
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_Great_04_03");	//Кольца твои за 150 золотых, как договаривались.
	Info_ClearChoices(DIA_Brian_Elena_RingsReady);
};
func void DIA_Brian_Elena_RingsReady_Bad()
{
	View_Close(PortraitRings_View);
	View_Delete(PortraitRings_View);
	PortraitRings_View = 0;
		AI_Output(other,self,"DIA_Brian_Elena_RingsReady_Bad_12_00");	//Так себе... Никакого изящества.
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_Bad_04_01");	//Ну уж извини. Я сделал все, что мог за такой срок.
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_Bad_04_02");	//Раз тебе не нравится, я просто перелью их обратно в простые кольца и верну тебе.
		AI_Output(other,self,"DIA_Brian_Elena_RingsReady_Bad_12_03");	//Ободожди пока. Я еще подумаю.
	Info_ClearChoices(DIA_Brian_Elena_RingsReady);
};

//===================================================
instance DIA_Brian_Elena_RingsBuy(C_Info)
{
	npc = VLK_457_Brian;					nr = 6;
	condition = DIA_Brian_Elena_RingsBuy_Cond;
	information = DIA_Brian_Elena_RingsBuy_Info;
	description = "Вот деньги за кольца. (150 зол.)";
	permanent = TRUE;
};
func int DIA_Brian_Elena_RingsBuy_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_KnowsInfo(other,DIA_Brian_Elena_RingsReady) && Npc_HasItems(self,ItMi_PortraitRings_Empty))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_RingsBuy_Info()
{
	AI_Output(other,self,"DIA_Brian_Elena_RingsBuy_12_00");	//Вот деньги за кольца.
	if (C_NpcHasGold(other, 150))	{
		B_GiveInvItems(other,self,ItMi_Gold,150);
		AI_Output(self,other,"DIA_Brian_Elena_RingsBuy_04_01");	//Пожалуйста.
		B_GiveInvItems(self,other,ItMi_PortraitRings_Empty,1);
		AI_Output(self,other,"DIA_Brian_Elena_RingsBuy_04_02");	//Желаю тебе и твоим родителям всего наилучшего.
		B_GivePlayerXP(XP_Elena_RingsReady);
		B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_RingsGot);
	}
	else	{
		AI_Output(self,other,"DIA_Brian_Elena_RingsBuy_04_03");	//Мы договаривались о 150 золотых, если ты не забыла.
	};
};

//===================================================
instance DIA_Brian_Elena_RingsReturn(C_Info)
{
	npc = VLK_457_Brian;					nr = 7;
	condition = DIA_Brian_Elena_RingsReturn_Cond;
	information = DIA_Brian_Elena_RingsReturn_Info;
	description = "Я подумала... Мне не нужны твои кольца. Верни мое золото.";
};
func int DIA_Brian_Elena_RingsReturn_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_KnowsInfo(other,DIA_Brian_Elena_RingsReady) && Npc_HasItems(self,ItMi_PortraitRings_Empty))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_RingsReturn_Info()
{
		AI_Output(other,self,"DIA_Brian_Elena_RingsReturn_12_00");	//Я подумала... Мне не нужны твои кольца. Верни мое золото.
	AI_Output(self,other,"DIA_Brian_Elena_RingsReturn_04_01");	//Эх, жаль. Сейчас я переплавлю их обратно, на простые ободки...
	AI_Output(self,other,"DIA_Brian_Elena_RingsReturn_04_02");	//Подожди минутку, это быстро.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	Npc_RemoveInvItem(self,ItMi_PortraitRings_Empty);
	MIS_Elena_Present_BrianReturn = TRUE;
	B_GiveAchievement_Elena_CapriciousGirl();
};

//===================================================
instance DIA_Brian_Elena_RingsReturnDone(C_Info)
{
	npc = VLK_457_Brian;					nr = 8;
	condition = DIA_Brian_Elena_RingsReturn_Cond;
	information = DIA_Brian_Elena_RingsReturn_Info;
	important = TRUE;
};
func int DIA_Brian_Elena_RingsReturnDone_Cond()
{
	if (C_HeroIs_Elena()
		 && (MIS_Elena_Present_BrianReturn == TRUE))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_RingsReturnDone_Info()
{
	AI_Output(other,self,"DIA_Brian_Elena_RingsReturnDone_12_00");	//Вот твои кольца.
	B_GiveInvItems(self,other,ItMi_GoldRing,2);
	AI_StopProcessInfos(self);
	MIS_Elena_Present_BrianReturn = -1;
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_RingsReturned);
	
};

//===================================================
instance DIA_Brian_Elena_AboutPortraits(C_Info)
{
	npc = VLK_457_Brian;					nr = 9;
	condition = DIA_Brian_Elena_AboutPortraits_Cond;
	information = DIA_Brian_Elena_AboutPortraits_Info;
	description = "Где мне взять портреты?";
};
func int DIA_Brian_Elena_AboutPortraits_Cond()
{
	if (C_HeroIs_Elena()
		 && (Npc_KnowsInfo(other,DIA_Brian_Elena_HeardPresent))
		 && (MIS_Elena_Present == LOG_Running) && (MIS_Elena_Present_BrianReturn == FALSE) && (MIS_Elena_Present_KnowsBrahim == FALSE))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_AboutPortraits_Info()
{
		AI_Output(other,self,"DIA_Brian_Elena_AboutPortraits_12_00");	//Где мне взять портреты?
	AI_Output(self,other,"DIA_Brian_Elena_AboutPortraits_04_01");	//У себя дома, очевидно.
		AI_Output(other,self,"DIA_Brian_Elena_AboutPortraits_12_02");	//Это я понимаю. Но у нас точно нет таких маленьких портретов, которые можно вставить в кольца.
		AI_Output(other,self,"DIA_Brian_Elena_AboutPortraits_12_03");	//Ты не знаешь художника, который мог бы сделать копии нужного размера?
	AI_Output(self,other,"DIA_Brian_Elena_AboutPortraits_04_04");	//Поговори с Ибрагимом, картографом. Он живет в порту, справа от кабака.
	MIS_Elena_Present_KnowsBrahim = TRUE;
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_KnowsBrahim);
};

/////////////////////////////////////// ВСЕ /////////////////////////////////////////////

//===================================================
instance DIA_Brian_Apprentice(C_Info)
{
	npc = VLK_457_Brian;					nr = 10;
	condition = DIA_NoCond_cond;
	information = DIA_Brian_Apprentice_Info;
	description = "Тяжело быть учеником кузнеца?";
	permanent = TRUE;
};
func void DIA_Brian_Apprentice_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Brian_Apprentice_03_00");	//Тяжело быть учеником кузнеца?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Brian_Apprentice_07_00");	//Тяжело быть учеником кузнеца?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Brian_Apprentice_10_00");	//Тяжело быть учеником кузнеца?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Brian_Apprentice_14_00");	//Тяжело быть учеником кузнеца?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Brian_Apprentice_16_00");	//Тяжело быть учеником кузнеца?
	};
	AI_Output(self,other,"DIA_Brian_Apprentice_04_01");	//Непросто. Зато когда-нибудь я сам стану уважаемым мастером.
};

//===================================================
instance DIA_Brian_AboutTrade(C_Info)
{
	npc = VLK_457_Brian;					nr = 11;
	condition = DIA_NoCond_cond;
	information = DIA_Brian_AboutTrade_Info;
	description = "Ты что-нибудь продаешь?";
	permanent = TRUE;
};
func void DIA_Brian_AboutTrade_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Brian_AboutTrade_03_00");	//Ты что-нибудь продаешь?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Brian_AboutTrade_07_00");	//Ты что-нибудь продаешь?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Brian_AboutTrade_10_00");	//Ты что-нибудь продаешь?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Brian_AboutTrade_14_00");	//Ты что-нибудь продаешь?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Brian_AboutTrade_16_00");	//Ты что-нибудь продаешь?
	};
	if ((Npc_GetDistToNpc(VLK_412_Harad,self) < PERC_DIST_INTERMEDIAT) || (Npc_GetDistToNpc(VLK_412_Harad,other) < PERC_DIST_DIALOG))	{
		AI_Output(self,other,"DIA_Brian_AboutTrade_04_01");	//Нет. Мастер пока не разрешает мне торговать.
	}
	else	{
		AI_Output(self,other,"DIA_Brian_AboutTrade_04_02");	//Я могу продать тебе охотничий нож, который выковал по заданию мастера.
		AI_Output(self,other,"DIA_Brian_AboutTrade_04_03");	//У него удлиненное лезвие и отличный баланс. Для разделки туши тоже подойдет.
		AI_Output(self,other,"DIA_Brian_AboutTrade_04_04");	//Моя цена - 400 золотых.
		AI_Output(self,other,"DIA_Brian_AboutTrade_04_05");	//Только чтобы мастер Гарад не знал. Он, вообще-то, не давал разрешения его продавать.
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Brian);
		Brian_KnifeSell = TRUE;
	};
};

//===================================================
instance DIA_Brian_BuyKnife(C_Info)
{
	npc = VLK_457_Brian;					nr = 12;
	condition = DIA_Brian_BuyKnife_cond;
	information = DIA_Brian_BuyKnife_Info;
	description = "Я куплю твой нож. (400 зол., сила 20, урон 40, +5 к однор.оружию)";
	permanent = TRUE;
};
func int DIA_Brian_BuyKnife_cond()
{
	if (Brian_KnifeSell == TRUE)	{
		return TRUE;
	};
};
func void DIA_Brian_BuyKnife_Info()
{
	if ((Npc_GetDistToNpc(VLK_412_Harad,self) < PERC_DIST_INTERMEDIAT) || (Npc_GetDistToNpc(VLK_412_Harad,other) < PERC_DIST_DIALOG))	{
		PrintScreen("Сейчас неподходящий момент",-1,25,FONT_Screen,3);
	}
	else	{
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Brian_BuyKnife_03_00");	//Я куплю твой нож.
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Brian_BuyKnife_07_00");	//Я куплю твой нож.
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Brian_BuyKnife_10_00");	//Я куплю твой нож.
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Brian_BuyKnife_14_00");	//Я куплю твой нож.
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Brian_BuyKnife_16_00");	//Я куплю твой нож.
		};
		if (C_NpcHasGold(other,Value_BrianKnife))	{
			B_GiveInvItems(other,self,ItMi_Gold,Value_BrianKnife);
			AI_Output(self,other,"DIA_Brian_BuyKnife_04_01");	//Держи. Это правда отличный нож.
			B_GiveInvItems(self,other,ItMW_MR_1h_BrianKnife,1);
			B_GivePlayerXP(XP_Ambient);
			Brian_KnifeSell = -1;
		}
		else	{
			AI_Output(self,other,"DIA_Brian_BuyKnife_04_02");	//Я продам его только за 400 золотых.
		};
	};
};

//===================================================
instance DIA_Brian_SharpKnife(C_Info)
{
	npc = VLK_457_Brian;			nr = 13;
	condition = DIA_Brian_SharpKnife_Cond;
	information = DIA_Brian_SharpKnife_Info;
	description = "Ты можешь заточить кухонный нож?";
	permanent = TRUE;
};
func int DIA_Brian_SharpKnife_Cond()
{
	if (Npc_HasItems(other,ItMW_MR_1h_KitchenKnife_Unsharpen))	{
		return TRUE;
	};
};
func void DIA_Brian_SharpKnife_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Brian_SharpKnife_03_00");	//Ты можешь заточить кухонный нож?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Brian_SharpKnife_07_00");	//Ты можешь заточить кухонный нож?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Brian_SharpKnife_10_00");	//Ты можешь заточить кухонный нож?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Brian_SharpKnife_14_00");	//Ты можешь заточить кухонный нож?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Brian_SharpKnife_16_00");	//Ты можешь заточить кухонный нож?
	};
	if (Npc_GetDistToWP(self,"NW_CITY_SMITH_SHARP") < PERC_DIST_INTERMEDIAT)	{
		AI_Output(self,other,"DIA_Brian_SharpKnife_04_01");	//Да, за 15 золотых. Давай твой нож.
		Info_ClearChoices(DIA_Brian_SharpKnife);
		Info_AddChoice(DIA_Brian_SharpKnife,"Позже.",DIA_Brian_SharpKnife_Back);
		if (C_NpcHasGold(other,10))	{
			Info_AddChoice(DIA_Brian_SharpKnife,"Держи деньги. (15 зол.)",DIA_Brian_SharpKnife_DoIt);
		};
	}
	else	{
		AI_Output(self,other,"DIA_Brian_SharpKnife_05_02");	//Да, за 15 золотых. Когда буду в кузнице. Приходи днем.
	};
};
func void DIA_Brian_SharpKnife_Back()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Brian_SharpKnife_Back_03_00");	//Позже.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Brian_SharpKnife_Back_07_00");	//Позже.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Brian_SharpKnife_Back_10_00");	//Позже.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Brian_SharpKnife_Back_14_00");	//Позже.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Brian_SharpKnife_Back_16_00");	//Позже.
	};
	Info_ClearChoices(DIA_Brian_SharpKnife);
};
func void DIA_Brian_SharpKnife_DoIt()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Brian_SharpKnife_DoIt_03_00");	//Держи деньги.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Brian_SharpKnife_DoIt_07_00");	//Держи деньги.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Brian_SharpKnife_DoIt_10_00");	//Держи деньги.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Brian_SharpKnife_DoIt_14_00");	//Держи деньги.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Brian_SharpKnife_DoIt_16_00");	//Держи деньги.
	};
	//B_GiveGold(other,self,15);
	//B_GiveInvItems(other,self,ItMW_MR_1h_KitchenKnife_Unsharpen,1);
	ItemTrans_items[0] = ItMW_MR_1h_KitchenKnife_Unsharpen;
	ItemTrans_amount[0] = 1;
	ItemTrans_items[1] = ItMi_Gold;
	ItemTrans_amount[1] = 15;
	B_ItemsTransaction(other,self);
	AI_Output(self,other,"DIA_Brian_SharpKnife_DoIt_04_01");	//Одну минутку.
	AI_UseMob(self,"BSSHARP",1);
	AI_Wait(self,2.5);
	AI_UseMob(self,"BSSHARP",-1);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"DIA_Brian_SharpKnife_DoIt_04_03");	//Вот твой нож.	
	B_GiveInvItems(self,other,ItMW_MR_1h_KitchenKnife,1);
	Info_ClearChoices(DIA_Brian_SharpKnife);
};

