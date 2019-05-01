
instance DIA_Halvor_EXIT(DIA_Proto_End)
{
	npc = VLK_469_Halvor;
};

/////////////////////////////////////// ЕЛЕНА //////////////////////////////////////////////

// ==============================================
instance DIA_Halvor_Elena_AboutCup(C_INFO)
{
	nr = 1;
	npc = VLK_469_Halvor;
	condition = DIA_Halvor_Elena_AboutCup_cond;
	information = DIA_Halvor_Elena_AboutCup_info;
	description = "Кардиф говорит, ты можешь помочь мне достать кое-что...";
};
func int DIA_Halvor_Elena_AboutCup_cond()
{
	if (C_HeroIs_Elena()
		&& MIS_Elena_Present_KardifTold
		&& !MIS_Elena_Present_CupLehmarGot)	{
		return TRUE;
	};
};
func void DIA_Halvor_Elena_AboutCup_info()
{
		AI_Output(other,self,"DIA_Halvor_Elena_AboutCup_16_00");	//Кардиф говорит, ты можешь помочь мне достать кое-что...
	AI_Output(self,other,"DIA_Halvor_Elena_AboutCup_06_01");	//Что именно тебя интересует?
		AI_Output(other,self,"DIA_Halvor_Elena_AboutCup_16_02");	//У Лемара есть кубок Верности, но он никак не желает его продавать.
	AI_Output(self,other,"DIA_Halvor_Elena_AboutCup_06_03");	//Я могу попробовать, э... уговорить Лемара.
	AI_Output(self,other,"DIA_Halvor_Elena_AboutCup_06_04");	//Но это будет стоить 500 золотых. И деньги вперед.
	MIS_Elena_Present_HalvorAsked = TRUE;
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_HalvorAsked);
};

// ==============================================
instance DIA_Halvor_Elena_OrderCup(C_INFO)
{
	nr = 2;
	npc = VLK_469_Halvor;
	condition = DIA_Halvor_Elena_OrderCup_cond;
	information = DIA_Halvor_Elena_OrderCup_info;
	description = "Достань мне кубок Верности. (500 зол.)";
	permanent = TRUE;
};
func int DIA_Halvor_Elena_OrderCup_cond()
{
	if (C_HeroIs_Elena()
		&& Npc_KnowsInfo(other,DIA_Halvor_Elena_AboutCup) && (MIS_Elena_Present_HalvorPayedDay == 0)
		&& !MIS_Elena_Present_CupLehmarGot && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Halvor_Elena_OrderCup_info()
{
	AI_Output(other,self,"DIA_Halvor_Elena_OrderCup_16_00");	//Достань мне кубок Верности.
	if (C_NpcHasGold(other,500))	{
		B_GiveInvItems(other,self,ItMi_Gold,500);
		AI_Output(self,other,"DIA_Halvor_Elena_OrderCup_06_01");	//Хорошо, приходи завтра после заката.
		MIS_Elena_Present_HalvorPayedDay = Wld_GetDay() + 1;
		B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_HalvorPayed);
	}
	else	{
		AI_Output(self,other,"DIA_Halvor_Elena_OrderCup_06_02");	//Деньги вперед.
	};
};

// ==============================================
instance DIA_Halvor_Elena_TakeCup(C_INFO)
{
	nr = 3;
	npc = VLK_469_Halvor;
	condition = DIA_Halvor_Elena_TakeCup_cond;
	information = DIA_Halvor_Elena_TakeCup_info;
	important = TRUE;
};
func int DIA_Halvor_Elena_TakeCup_cond()
{
	if (C_HeroIs_Elena() && DIA_WhenAsked_cond()
		&& (MIS_Elena_Present_HalvorPayedDay > 0) && (Wld_GetDay_Shifted(19) + 1 > MIS_Elena_Present_HalvorPayedDay)
		&& !MIS_Elena_Present_CupLehmarGot)	{
		return TRUE;
	};
};
func void DIA_Halvor_Elena_TakeCup_info()
{
	if (Wld_IsTime(18,0,4,0))	{
		AI_Output(self,other,"DIA_Halvor_Elena_TakeCup_06_01");	//Вот твой кубок.
	}
	else	{
		AI_Output(self,other,"DIA_Halvor_Elena_TakeCup_06_02");	//Я же сказал, приходи после заката!
		AI_Output(self,other,"DIA_Halvor_Elena_TakeCup_06_03");	//Ладно, держи свой кубок.
	};
	B_GiveInvItems(self,other,ItMi_FaithfulnessCup_02,1);
	MIS_Elena_Present_CupLehmarGot = TRUE;
	B_GivePlayerXP(XP_Elena_CupLehmarGot);
	B_LogEntry_Elena_CupGot(TOPIC_Elena_Present_CupLehmarGot);
	AI_Output(self,other,"DIA_Halvor_Elena_TakeCup_06_04");	//Да спрячь его получше! Мало ли...
	B_StartOtherRoutine(VLK_484_Lehmar,"WAIT");
	B_StartOtherRoutine(VLK_415_Meldor,"WAIT");
};

/////////////////////////////////////// САРА //////////////////////////////////////////////

// ==============================================
instance DIA_Halvor_Sarah_HaveRum(C_INFO)
{
	npc = VLK_469_Halvor;			nr = 20;
	condition = DIA_Halvor_Sarah_HaveRum_cond;
	information = DIA_Halvor_Sarah_HaveRum_info;
	description = "У тебя случайно нет белого рома?";
};
func int DIA_Halvor_Sarah_HaveRum_cond()
{
	if (C_HeroIs_Sarah()
		&& MIS_Sarah_BadHabit_MoeAsked && !MIS_Sarah_BadHabit_MoeTalked)	{
		return TRUE;
	};
};
func void DIA_Halvor_Sarah_HaveRum_info()
{
		AI_Output(other,self,"DIA_Halvor_Sarah_HaveRum_16_00");	//У тебя случайно нет белого рома?
	AI_Output(self,other,"DIA_Halvor_Sarah_HaveRum_06_01");	//А он похож на рыбу?
		AI_Output(other,self,"DIA_Halvor_Sarah_HaveRum_16_02");	//Да ладно тебе, весь порт знает, что ты не только рыбой торгуешь.
	AI_Output(self,other,"DIA_Halvor_Sarah_HaveRum_06_03");	//Ничего у меня нет!
	AI_StopProcessInfos(self);
};

// ==============================================
instance DIA_Halvor_Sarah_HaveRum2(C_INFO)
{
	npc = VLK_469_Halvor;			nr = 21;
	condition = DIA_Halvor_Sarah_HaveRum2_cond;
	information = DIA_Halvor_Sarah_HaveRum2_info;
	description = "А может все-таки найдется бутылочка? (50 зол.)";
	permanent = TRUE;
};
func int DIA_Halvor_Sarah_HaveRum2_cond()
{
	if (C_HeroIs_Sarah() && Wld_IsTime(19,30,4,0)
		 && MIS_Sarah_BadHabit_MoeAsked && Npc_KnowsInfo(other,DIA_Halvor_Sarah_HaveRum)
		 && !MIS_Sarah_BadHabit_MoeTalked && !Npc_HasItems(other,ItFo_Addon_Rum))	{
		return TRUE;
	};
};
func void DIA_Halvor_Sarah_HaveRum2_info()
{
		AI_Output(other,self,"DIA_Halvor_Sarah_HaveRum2_16_00");	//А может все-таки найдется бутылочка?
	AI_Output(self,other,"DIA_Halvor_Sarah_HaveRum2_06_01");	//Если у тебя есть 50 золотых, то я поищу.
	if (C_NpcHasGold(other,50))	{
			AI_Output(other,self,"DIA_Halvor_Sarah_HaveRum2_16_02");	//Есть.
		AI_Output(self,other,"DIA_Halvor_Sarah_HaveRum2_06_03");	//Точно, я вспомнил. У меня осталась еще бутылочка из старых запасов.
		B_GiveGold(other,self,50);
		B_GiveInvItems(self,other,ItFo_Addon_Rum,1);
	}
	else	{
			AI_Output(other,self,"DIA_Halvor_Sarah_HaveRum2_16_04");	//Нет.
		AI_Output(self,other,"DIA_Halvor_Sarah_HaveRum2_06_05");	//Значит, и рома нет.
	};
};
//*/

/////////////////////////////////////// ВСЕ /////////////////////////////////////////////

// Почта Хориниса ==============================================================
instance DIA_Halvor_YourPost(C_INFO)
{
	npc = VLK_469_Halvor;				nr = 30;
	condition = DIA_Halvor_YourPost_cond;
	information = DIA_Halvor_YourPost_info;
	description = "Эй, у меня для тебя посылка!";
};
func int DIA_Halvor_YourPost_cond()
{
	if (MIS_KhorinisPost_Stage_FromBootlegger
		&& Npc_HasItems(other,ItMi_Packet_Halvor))	{
		return TRUE;
	};
};
func void DIA_Halvor_YourPost_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_YourPost_03_00");	//Эй, у меня для тебя посылка!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_YourPost_07_00");	//Эй, у меня для тебя посылка!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_YourPost_10_00");	//Эй, у меня для тебя посылка!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_YourPost_14_00");	//Эй, у меня для тебя посылка!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_YourPost_16_00");	//Эй, у меня для тебя посылка!
	};
	AI_Output(self,other,"DIA_Halvor_YourPost_06_01");	//Посылка?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_YourPost_03_02");	//Ну да, от твоих друзей из леса.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_YourPost_07_02");	//Ну да, от твоих друзей из леса.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_YourPost_10_02");	//Ну да, от твоих друзей из леса.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_YourPost_14_02");	//Ну да, от твоих друзей из леса.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_YourPost_16_02");	//Ну да, от твоих друзей из леса.
	};
	AI_Output(self,other,"DIA_Halvor_YourPost_06_03");	//Тише! Незачем об этом кричать на весь порт.
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Halvor_YourPost_06_04");	//Давай сюда.
	Info_ClearChoices(DIA_Halvor_YourPost);
	Info_AddChoice(DIA_Halvor_YourPost,"Сначала заплати!",DIA_Halvor_YourPost_MoneyFirst);
	Info_AddChoice(DIA_Halvor_YourPost,"Держи.",DIA_Halvor_YourPost_Give);
};
//----------------------------------------------
func void DIA_Halvor_YourPost_Give()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_YourPost_Give_03_00");	//Держи.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_YourPost_Give_07_00");	//Держи.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_YourPost_Give_10_00");	//Держи.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_YourPost_Give_14_00");	//Держи.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_YourPost_Give_16_00");	//Держи.
	};
	B_GiveInvItems(other,self,ItMi_Packet_Halvor,1);
	MIS_KhorinisPost_HalvorGotPacket = TRUE;
	//смотрит посылку
	AI_UseItem(self,ItMi_Packet_Halvor);
	AI_Output(self,other,"DIA_Halvor_YourPost_Give_06_01");	//Отлично! Я давно ее ждал.
	B_GivePlayerXP(XP_KhorinisPost_HalvorDelivered);
	MIS_KhorinisPost_HalvorDelivered = TRUE;
	// а сколько заплатил?
	if (MIS_KhorinisPost_HalvorPayed == 0)	{
		B_LogEntry(TOPIC_KhorinisPost,ConcatStrings(TOPIC_KhorinisPost_HalvorDelivered,TOPIC_KhorinisPost_HalvorPayed0));
	}
	else if (MIS_KhorinisPost_HalvorPayed == 20)	{
		MIS_KhorinisPost = LOG_SUCCESS;
		B_LogEntry_Status(TOPIC_KhorinisPost,LOG_SUCCESS,ConcatStrings(TOPIC_KhorinisPost_HalvorDelivered,TOPIC_KhorinisPost_HalvorPayed20));
	}
	else if (MIS_KhorinisPost_HalvorPayed == 30)	{
		MIS_KhorinisPost = LOG_SUCCESS;
		B_LogEntry_Status(TOPIC_KhorinisPost,LOG_SUCCESS,ConcatStrings(TOPIC_KhorinisPost_HalvorDelivered,TOPIC_KhorinisPost_HalvorPayed30));
	}
	else	{	//не должно такого быть!
		MIS_KhorinisPost = LOG_SUCCESS;
		B_LogEntry_Status(TOPIC_KhorinisPost,LOG_SUCCESS,TOPIC_KhorinisPost_HalvorDelivered);
	};
	Info_ClearChoices(DIA_Halvor_YourPost);
};
//----------------------------------------------
func void DIA_Halvor_YourPost_MoneyFirst()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_03_00");	//Сначала заплати!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_07_00");	//Сначала заплати!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_10_00");	//Сначала заплати!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_14_00");	//Сначала заплати!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_16_00");	//Сначала заплати!
	};
	AI_Output(self,other,"DIA_Halvor_YourPost_MoneyFirs_06_01");	//Что?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_03_02");	//Мне сказали, что за доставку я получу награду. Один раз меня уже надули, так что сначала деньги.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_07_02");	//Мне сказали, что за доставку я получу награду. Один раз меня уже надули, так что сначала деньги.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_10_02");	//Мне сказали, что за доставку я получу награду. Один раз меня уже надули, так что сначала деньги.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_14_02");	//Мне сказали, что за доставку я получу награду. Один раз меня уже надули, так что сначала деньги.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_16_02");	//Мне сказали, что за доставку я получу награду. Один раз меня уже надули, так что сначала деньги.
	};
	AI_Output(self,other,"DIA_Halvor_YourPost_MoneyFirst_06_03");	//Ну хорошо. Я дам тебе 20 золотых. Идет?
	Info_ClearChoices(DIA_Halvor_YourPost);
	Info_AddChoice(DIA_Halvor_YourPost,"Мне обещали 100!",DIA_Halvor_YourPost_MoneyFirst100);
	Info_AddChoice(DIA_Halvor_YourPost,"Пятьдесят.",DIA_Halvor_YourPost_MoneyFirst50);
	Info_AddChoice(DIA_Halvor_YourPost,"Тридцать.",DIA_Halvor_YourPost_MoneyFirst30);
	Info_AddChoice(DIA_Halvor_YourPost,"Идет.",DIA_Halvor_YourPost_MoneyFirst20);
};
//----------------------------------------------
func void DIA_Halvor_YourPost_MoneyFirst20()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst20_03_00");	//Идет.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst20_07_00");	//Идет.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst20_10_00");	//Идет.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst20_14_00");	//Идет.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst20_16_00");	//Идет.
	};
	AI_Output(self,other,"DIA_Halvor_YourPost_MoneyFirst20_06_01");	//Вот твои 20 золотых.
	MIS_KhorinisPost_HalvorPayed = 20;
	B_GiveInvItems(self,other,ItMi_Gold,20);
	DIA_Halvor_YourPost_Give();
};
//----------------------------------------------
func void DIA_Halvor_YourPost_MoneyFirst30()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst30_03_00");	//Тридцать.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst30_07_00");	//Тридцать.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst30_10_00");	//Тридцать.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst30_14_00");	//Тридцать.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst30_16_00");	//Тридцать.
	};
	AI_Output(self,other,"DIA_Halvor_YourPost_MoneyFirst30_06_01");	//По рукам. Держи деньги.
	MIS_KhorinisPost_HalvorPayed = 30;
	B_GiveInvItems(self,other,ItMi_Gold,30);
	DIA_Halvor_YourPost_Give();
};
//----------------------------------------------
func void DIA_Halvor_YourPost_MoneyFirst50()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst50_03_00");	//Пятьдесят.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst50_07_00");	//Пятьдесят.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst50_10_00");	//Пятьдесят.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst50_14_00");	//Пятьдесят.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst50_16_00");	//Пятьдесят.
	};
	AI_Output(self,other,"DIA_Halvor_YourPost_MoneyFirst50_06_01");	//Это слишком много.
	Info_ClearChoices(DIA_Halvor_YourPost);
	Info_AddChoice(DIA_Halvor_YourPost,"Пятьдесят.",DIA_Halvor_YourPost_MoneyFirst50);
	Info_AddChoice(DIA_Halvor_YourPost,"Тридцать.",DIA_Halvor_YourPost_MoneyFirst30);
};

//----------------------------------------------
func void DIA_Halvor_YourPost_MoneyFirst100()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst100_03_00");	//Мне обещали 100!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst100_07_00");	//Мне обещали 100!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst100_10_00");	//Мне обещали 100!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst100_14_00");	//Мне обещали 100!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst100_16_00");	//Мне обещали 100!
	};
	AI_Output(self,other,"DIA_Halvor_YourPost_MoneyFirst100_06_01");	//(взбешенно) Сколько?!
	AI_Output(self,other,"DIA_Halvor_YourPost_MoneyFirst100_06_02");	//(остывая) Ладно. Приходи через пару часов, я что-нибудь придумаю.
	MIS_KhorinisPost_HalvorPayed = 100;	//только пообещал
	MIS_KhorinisPost_HalvorTime100 = Wld_GetFullTime() + 2*60;
	Info_ClearChoices(DIA_Halvor_YourPost);
	B_StartOtherRoutine(self,"MONEY");
	self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] | IGNORE_PortalRoom_Public;
	B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_HalvorWait);
};

// ==============================================================
var int DIA_Halvor_Money100_Once;
instance DIA_Halvor_Money100(C_INFO)
{
	npc = VLK_469_Halvor;				nr = 31;
	condition = DIA_Halvor_Money100_cond;
	information = DIA_Halvor_Money100_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Halvor_Money100_cond()
{
	if (DIA_WhenAsked_cond() 
		 && (Npc_GetDistToWp(self,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_02") > TA_DIST_SELFWP_MAX)
		 && (MIS_KhorinisPost_HalvorTime100 < Wld_GetFullTime()) && (MIS_KhorinisPost_HalvorPayed == 100)
		 && !DIA_Halvor_GreedIsBad_Once && !MIS_KhorinisPost_HalvorGotPacket)	{
		return TRUE;
	};
};
func void DIA_Halvor_Money100_info()
{
	if (!DIA_Halvor_Money100_Once)	{
		AI_Output(self,other,"DIA_Halvor_Money100_06_00");	//Я достал 100 золотых.
		DIA_Halvor_Money100_Once = TRUE;
	};
	AI_Output(self,other,"DIA_Halvor_Money100_06_01");	//Посылка при тебе?
	if (Npc_HasItems(other,ItMi_Packet_Halvor))	{
		B_StartOtherRoutine(VLK_494_Attila,"TOHALVOR");
		AI_Teleport(VLK_494_Attila,VLK_494_Attila.wp);//"NW_CITY_HABOUR_POOR_AREA_PATH_01_01");
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Halvor_Money100_03_02");	//Да.
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Halvor_Money100_07_02");	//Да.
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Halvor_Money100_10_02");	//Да.
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Halvor_Money100_14_02");	//Да.
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Halvor_Money100_16_02");	//Да.
		};
		AI_Output(self,other,"DIA_Halvor_Money100_06_03");	//Отлично.
		AI_Output(self,other,"DIA_Halvor_Money100_06_04");	//Иди за мной.
		AI_StopProcessInfos(self);
		MIS_KhorinisPost_HalvorGoWithMe = TRUE;
		AI_StartState(self,ZS_Guide_Player,1,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_02");
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
	}
	else	{
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Halvor_Money100_03_07");	//Нет.
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Halvor_Money100_07_07");	//Нет.
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Halvor_Money100_10_07");	//Нет.
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Halvor_Money100_14_07");	//Нет.
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Halvor_Money100_16_07");	//Нет.
		};
		MIS_KhorinisPost_HalvorGoWithMe = FALSE;
		AI_Output(self,other,"DIA_Halvor_Money100_06_08");	//Так принеси!
		AI_StopProcessInfos(self);
	};
};

// ==============================================================
var int DIA_Halvor_GreedIsBad_Once;
instance DIA_Halvor_GreedIsBad(C_INFO)
{
	npc = VLK_469_Halvor;				nr = 32;
	condition = DIA_Halvor_GreedIsBad_cond;
	information = DIA_Halvor_GreedIsBad_info;
	important = TRUE;
};
func int DIA_Halvor_GreedIsBad_cond()
{
	if (MIS_KhorinisPost_HalvorGoWithMe
		 && (Npc_GetDistToWp(self,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_02") <= TA_DIST_SELFWP_MAX))	{
		return TRUE;
	};
};
func void DIA_Halvor_GreedIsBad_info()
{
	DIA_Halvor_GreedIsBad_Once = TRUE;
	self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] & ~IGNORE_PortalRoom_Public;
		AI_Output(self,other,"DIA_Halvor_GreedIsBad_06_00");	//Тебе никогда не говорили, что жадность - это плохо? 100 золотых за доставку пакета, ха!
		AI_Output(self,other,"DIA_Halvor_GreedIsBad_06_01");	//А теперь ты отдашь товары, которые тебе не принадлежат, и мы тихо разойдемся. А иначе я все равно получу их, но тебе это не понравится!
		Info_ClearChoices(DIA_Halvor_GreedIsBad);
	MIS_KhorinisPost_HalvorGoWithMe = FALSE;
	if (Npc_HasItems(other,ItMi_Packet_Halvor))	{
		Info_AddChoice(DIA_Halvor_GreedIsBad,"Да подавись ты своим пакетом!",DIA_Halvor_GreedIsBad_Yes);
	}
	else	{
		Info_AddChoice(DIA_Halvor_GreedIsBad,"Какой пакет? Нет у меня никакого пакета!",DIA_Halvor_GreedIsBad_NoPacket);
	};
		Info_AddChoice(DIA_Halvor_GreedIsBad,"Ничего я тебе не отдам!",DIA_Halvor_GreedIsBad_No);
};
func void DIA_Halvor_GreedIsBad_Yes()
{
	B_StartOtherRoutine(self,"START");
	B_StartOtherRoutine(VLK_494_Attila,"START");
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_Yes_03_00");	//Да подавись ты своим пакетом!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_Yes_07_00");	//Да подавись ты своим пакетом!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_Yes_10_00");	//Да подавись ты своим пакетом!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_Yes_14_00");	//Да подавись ты своим пакетом!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_Yes_16_00");	//Да подавись ты своим пакетом!
	};
	B_GiveInvItems(other,self,ItMi_Packet_Halvor,1);
	MIS_KhorinisPost_HalvorGotPacket = TRUE;
	AI_Output(self,other,"DIA_Halvor_GreedIsBad_Yes_06_01");	//Ну-ну! Обойдемся без грубости.
	AI_Output(self,other,"DIA_Halvor_GreedIsBad_Yes_06_02");	//А теперь проваливай!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,7);
	Npc_SetRefuseTalk(VLK_494_Attila,20);
	MIS_KhorinisPost = LOG_FAILED;
	B_LogEntry_Status(TOPIC_KhorinisPost,LOG_FAILED,TOPIC_KhorinisPost_Halvor100Give);
};
func void DIA_Halvor_GreedIsBad_NoPacket()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_NoPacket_03_00");	//Какой пакет? Нет у меня никакого пакета!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_NoPacket_07_00");	//Какой пакет? Нет у меня никакого пакета!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_NoPacket_10_00");	//Какой пакет? Нет у меня никакого пакета!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_NoPacket_14_00");	//Какой пакет? Нет у меня никакого пакета!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_NoPacket_16_00");	//Какой пакет? Нет у меня никакого пакета!
	};
	//игрок бросил пакет на землю в пределах видимости?
	If (Npc_CanSeeItem(self, ItMi_Packet_Halvor) || Npc_CanSeeItem(VLK_494_Attila, ItMi_Packet_Halvor)
		|| Npc_GetDistToItem(self, ItMi_Packet_Halvor) < PERC_DIST_INTERMEDIAT
	)	{
		AI_Output(self,other,"DIA_Halvor_GreedIsBad_NoPacket_06_01");	//За идиота меня держишь?
		//подбирает пакет
		AI_StopLookAt(self);
		AI_GotoItem(self, ItMi_Packet_Halvor);
		AI_TakeItem(self, ItMi_Packet_Halvor);
		AI_GotoNpc(self, other);
		AI_TurnToNpc(self,other);
		AI_LookAtNpc(self,other);
		AI_Output(self,other,"DIA_Halvor_GreedIsBad_NoPacket_06_02");	//Вали отсюда, пока я добрый.
		Npc_SetRefuseTalk(self,7);
		MIS_KhorinisPost = LOG_FAILED;
		MIS_KhorinisPost_HalvorGotPacket = TRUE;
		B_LogEntry_Status(TOPIC_KhorinisPost,LOG_FAILED,TOPIC_KhorinisPost_Halvor100Give);
		Npc_SetRefuseTalk(VLK_494_Attila,20);
		B_StartOtherRoutine(VLK_494_Attila,"START");
	}
	else {
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Halvor_GreedIsBad_NoPacket_06_03m");	//Думаешь, такой умный?
		}
		else	{
			AI_Output(self,other,"DIA_Halvor_GreedIsBad_NoPacket_06_03f");	//Думаешь, такая умная?
		};
		AI_Output(self,other,"DIA_Halvor_GreedIsBad_NoPacket_06_04");	//Я все равно найду его, можешь не сомневаться. Но сначала преподам тебе урок.
		Wld_RemoveItem(ItMi_Packet_Halvor);
		MIS_KhorinisPost = LOG_FAILED;
		MIS_KhorinisPost_HalvorFight = TRUE;
		B_LogEntry_Status(TOPIC_KhorinisPost,LOG_FAILED,TOPIC_KhorinisPost_Halvor100Fight);
	};
	AI_StopProcessInfos(self);
};
func void DIA_Halvor_GreedIsBad_No()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_No_03_00");	//Ничего я тебе не отдам.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_No_07_00");	//Ничего я тебе не отдам.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_No_10_00");	//Ничего я тебе не отдам.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_No_14_00");	//Ничего я тебе не отдам.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_No_16_00");	//Ничего я тебе не отдам.
	};
	AI_Output(self,other,"DIA_Halvor_GreedIsBad_No_06_01");	//Вижу, мозгов у тебя совсем нет. Придется вдолбить немного ума в твою пустую башку.
	AI_StopProcessInfos(self);
	MIS_KhorinisPost = LOG_FAILED;
	MIS_KhorinisPost_HalvorFight = TRUE;
	B_LogEntry_Status(TOPIC_KhorinisPost,LOG_FAILED,TOPIC_KhorinisPost_Halvor100Fight);
};

// ==============================================================
instance DIA_Halvor_AboutMoney(C_INFO)
{
	npc = VLK_469_Halvor;				nr = 33;
	condition = DIA_Halvor_AboutMoney_cond;
	information = DIA_Halvor_AboutMoney_info;
	description = "А что насчет денег?";
};
func int DIA_Halvor_AboutMoney_cond()
{
	if (MIS_KhorinisPost_HalvorDelivered && (MIS_KhorinisPost_HalvorPayed == 0))	{
		return TRUE;
	};
};
func void DIA_Halvor_AboutMoney_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_AboutMoney_03_00");	//А что насчет денег?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_AboutMoney_07_00");	//А что насчет денег?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_AboutMoney_10_00");	//А что насчет денег?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_AboutMoney_14_00");	//А что насчет денег?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_AboutMoney_16_00");	//А что насчет денег?
	};
	AI_Output(self,other,"DIA_Halvor_AboutMoney_06_01");	//Каких денег?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_AboutMoney_03_02");	//Плата за доставку посылки.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_AboutMoney_07_02");	//Плата за доставку посылки.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_AboutMoney_10_02");	//Плата за доставку посылки.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_AboutMoney_14_02");	//Плата за доставку посылки.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_AboutMoney_16_02");	//Плата за доставку посылки.
	};
	AI_Output(self,other,"DIA_Halvor_AboutMoney_06_03");	//Ну, понимаешь, я не рассчитывал, что придется платить еще и за доставку. У меня сейчас совсем нет денег.
	AI_Output(self,other,"DIA_Halvor_AboutMoney_06_04");	//Но если хочешь, я могу предложить тебе одно дело. В убытке не останешься.
	Info_ClearChoices(DIA_Halvor_YourPost);
	Info_AddChoice(DIA_Halvor_AboutMoney,"Нет, это не для меня.",DIA_Halvor_AboutMoney_NoJob);
	if (other.aivar[AIV_Gender] == MALE)	{
		Info_AddChoice(DIA_Halvor_AboutMoney,"Я согласен. Что за дело?",DIA_Halvor_AboutMoney_WhatJob);
	}
	else	{
		Info_AddChoice(DIA_Halvor_AboutMoney,"Я согласна. Что за дело?",DIA_Halvor_AboutMoney_WhatJob);
	};
};
func void DIA_Halvor_AboutMoney_NoJob()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_AboutMoney_NoJob_03_00");	//Нет, это не для меня.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_AboutMoney_NoJob_07_00");	//Нет, это не для меня.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_AboutMoney_NoJob_10_00");	//Нет, это не для меня.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_AboutMoney_NoJob_14_00");	//Нет, это не для меня.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_AboutMoney_NoJob_16_00");	//Нет, это не для меня.
	};
	AI_Output(self,other,"DIA_Halvor_AboutMoney_NoJob_06_01");	//Ну, тогда до свидания.
	Info_ClearChoices(DIA_Halvor_AboutMoney);
	MIS_KhorinisPost = LOG_SUCCESS;
	B_LogEntry_Status(TOPIC_KhorinisPost, LOG_FAILED, TOPIC_KhorinisPost_HalvorNoJob);
};
func void DIA_Halvor_AboutMoney_WhatJob()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_AboutMoney_WhatJob_03_00");	//Я согласен. Что за дело?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_AboutMoney_WhatJob_07_00");	//Я согласен. Что за дело?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_AboutMoney_WhatJob_10_00");	//Я согласен. Что за дело?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_AboutMoney_WhatJob_14_00");	//Я согласен. Что за дело?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_AboutMoney_WhatJob_16_00");	//Я согласна. Что за дело?
	};
	AI_Output(self,other,"DIA_Halvor_AboutMoney_WhatJob_06_01");	//Я дам тебе кое-какие товары, и ты отнесешь их покупателям.
	B_GiveInvItems(self,other,ItRi_ValentinosRing,1);
	AI_Output(self,other,"DIA_Halvor_AboutMoney_WhatJob_06_02");	//Это кольцо отнесешь Валентино из Верхнего квартала. Он заплатит тебе 100 золотых.
	B_GiveInvItems(self,other,ItAt_SharkSkin,1);
	AI_Output(self,other,"DIA_Halvor_AboutMoney_WhatJob_06_03");	//Кожу болотной акулы - Фернандо. Он давно ее ждет, мы договаривались о 250 золотых.
	B_GiveInvItems(self,other,ItMi_Nugget,3);
	AI_Output(self,other,"DIA_Halvor_AboutMoney_WhatJob_06_04");	//И три куска магической руды торговцу Хакону с рыночной площади. Он должен 50 золотых за каждый.
	AI_Output(self,other,"DIA_Halvor_AboutMoney_WhatJob_06_05");	//Итого 500 золотых. 50 из них твои.
//	AI_Output(self,other,"DIA_Halvor_AboutMoney_WhatJob_06_06");	//И не задерживайся. Завтра вечером я жду от тебя 450 золотых.
	Info_ClearChoices(DIA_Halvor_AboutMoney);
	MIS_KhorinisPost_Stage_FromHalvor = TRUE;
	B_LogEntry(TOPIC_KhorinisPost, TOPIC_KhorinisPost_HalvorJob);
	//все живы?
	if (Npc_IsDead(VLK_421_Valentino)) {
		B_CloseLogOnDeath(VLK_421_Valentino);
	};

	if (Npc_IsDead(VLK_405_Fernando)) {
		B_CloseLogOnDeath(VLK_405_Fernando);
	};

	if (Npc_IsDead(VLK_407_Hakon)) {
		B_CloseLogOnDeath(VLK_407_Hakon);
	};

};

// ==============================================================
instance DIA_Halvor_MissionAccomplished(C_INFO)
{
	npc = VLK_469_Halvor;				nr = 34;
	condition = DIA_Halvor_MissionAccomplished_cond;
	information = DIA_Halvor_MissionAccomplished_info;
	description = "Я отнес товары.";
};
func int DIA_Halvor_MissionAccomplished_cond()
{
	if (MIS_KhorinisPost_Stage_FromHalvor
		 && MIS_KhorinisPost_ValentinoDelivered && MIS_KhorinisPost_FernandoDelivered && MIS_KhorinisPost_HakonDelivered)	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Halvor_MissionAccomplished.description = "Я отнесла товары.";
		};
		return TRUE;
	};
};
func void DIA_Halvor_MissionAccomplished_GiveGold()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_GiveGold_03_00");	//Вот твои 450 золотых.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_GiveGold_07_00");	//Вот твои 450 золотых.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_GiveGold_10_00");	//Вот твои 450 золотых.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_GiveGold_14_00");	//Вот твои 450 золотых.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_GiveGold_16_00");	//Вот твои 450 золотых.
	};
	B_GiveInvItems(other,self,ItMi_Gold,450);
	if (MIS_KhorinisPost_HalvorShareDay >= Wld_GetDay())	{
		AI_Output(self,other,"DIA_Halvor_MissionAccomplished_GiveGold_06_01");	//Приятно иметь с тобой дело.
	}
	else	{
		AI_Output(self,other,"DIA_Halvor_MissionAccomplished_GiveGold_06_02");	//Наконец-то.
	};
	B_GivePlayerXP(XP_KhorinisPost_HalvorShare);
	MIS_KhorinisPost_HalvorShareGiven = TRUE;
	//закончили?
	B_LogEntry_KhorinisPost_SuccessAll(TOPIC_KhorinisPost_HalvorGive250);
};
func void DIA_Halvor_MissionAccomplished_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_03_00");	//Я отнес товары.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_07_00");	//Я отнес товары.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_10_00");	//Я отнес товары.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_14_00");	//Я отнес товары.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_16_00");	//Я отнесла товары.
	};
	if (C_NpcHasGold(other, 450))	{
		DIA_Halvor_MissionAccomplished_GiveGold();
	}
	else	{
		AI_Output(self,other,"DIA_Halvor_MissionAccomplished_06_01");	//А где мои деньги?!
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Halvor_MissionAccomplished_03_02");	//Я... Сейчас принесу.
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Halvor_MissionAccomplished_07_02");	//Я... Сейчас принесу.
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Halvor_MissionAccomplished_10_02");	//Я... Сейчас принесу.
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Halvor_MissionAccomplished_14_02");	//Я... Сейчас принесу.
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Halvor_MissionAccomplished_16_02");	//Я... Сейчас принесу.
		};
		AI_StopProcessInfos(self);
	};
};
// ==============================================================
instance DIA_Halvor_Give450(C_INFO)
{
	npc = VLK_469_Halvor;				nr = 35;
	condition = DIA_Halvor_Give450_cond;
	information = DIA_Halvor_MissionAccomplished_GiveGold;
	description = "Вот твои 450 золотых.";
};
func int DIA_Halvor_Give450_cond()
{
	if (MIS_KhorinisPost_Stage_FromHalvor 
		 && Npc_KnowsInfo(other,DIA_Halvor_MissionAccomplished) && !MIS_KhorinisPost_HalvorShareGiven
		 && C_NpcHasGold(other,450))	{
		return TRUE;
	};
};

// ==============================================================


// ТОРГОВЛЯ =====================================================
instance DIA_Halvor_Hello(C_INFO)
{
	nr = 50;
	npc = VLK_469_Halvor;
	condition = DIA_WhenAsked_cond;
	information = DIA_Halvor_MR_Hello_info;
	important = TRUE;
};
func void DIA_Halvor_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Halvor_MR_Hello_06_00");	//Рыба, рыба! РЫБА!!!
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Halvor);
};
//-----------------------------------------
instance DIA_Halvor_Trade(C_INFO)
{
	nr = 52;
	npc = VLK_469_Halvor;
	condition = DIA_NoCond_cond;
	information = DIA_Halvor_Trade_info;
	description = "Покажи свою рыбу.";
	trade = TRUE;
	permanent = TRUE;
};
func void DIA_Halvor_Trade_info()
{
	B_GiveTradeInv_Halvor(self);
};
//-----------------------------------------
instance DIA_Halvor_FreshFish(C_INFO)
{
	nr = 51;
	npc = VLK_469_Halvor;
	condition = DIA_Halvor_FreshFish_cond;
	information = DIA_Halvor_FreshFish_info;
	description = "А рыба-то у тебя свежая?";
	permanent = TRUE;
};
func int DIA_Halvor_FreshFish_cond()
{
	return TRUE;
};
func void DIA_Halvor_FreshFish_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Halvor_FreshFish_03_00");	//А рыба-то у тебя свежая?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Halvor_FreshFish_07_00");	//А рыба-то у тебя свежая?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Halvor_FreshFish_10_00");	//А рыба-то у тебя свежая?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Halvor_FreshFish_14_00");	//А рыба-то у тебя свежая?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Halvor_FreshFish_16_00");	//А рыба-то у тебя свежая?
	};
	AI_Output(self,other,"DIA_Halvor_FreshFish_06_01");	//Конечно! Наисвежайшая. Только выловили.
};
