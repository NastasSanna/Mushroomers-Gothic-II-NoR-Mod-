
instance DIA_Fellan_EXIT(DIA_Proto_End)
{
	npc = VLK_480_Fellan;
};

//============================================================
instance DIA_Fellan_HowAU(C_INFO)
{
	nr = 1;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_HowAU_cond;
	information = DIA_Fellan_HowAU_info;
	description = "Эй, как дела?";
};
func int DIA_Fellan_HowAU_cond()
{
	return TRUE;
};
func void DIA_Fellan_HowAU_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fellan_HowAU_03_00");	//Эй, как дела?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fellan_HowAU_07_00");	//Эй, как дела?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fellan_HowAU_10_00");	//Эй, как дела?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fellan_HowAU_14_00");	//Эй, как дела?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fellan_HowAU_16_00");	//Эй, как дела?
	};
	AI_Output(self,other,"DIA_Fellan_HowAU_06_01");	//Нет, нет. Я не вернусь. Скоро все, все рухнет. Здесь опасно оставаться, я просто не могу больше быть на этом острове.
	AI_Output(self,other,"DIA_Fellan_HowAU_06_02");	//И тебе не советую. Уходи, пока не поздно.
};

//============================================================
instance DIA_Fellan_WhyAUHere(C_INFO)
{
	nr = 2;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_WhyAUHere_cond;
	information = DIA_Fellan_WhyAUHere_info;
	description = "Что ты тут делаешь?";
	permanent = TRUE;
};
func int DIA_Fellan_WhyAUHere_cond()
{
	if (!MIS_FellanGoHome_Returned)	{
		return TRUE;
	};
};
func void DIA_Fellan_WhyAUHere_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fellan_WhyAUHere_03_00");	//Что ты тут делаешь?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fellan_WhyAUHere_07_00");	//Что ты тут делаешь?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fellan_WhyAUHere_10_00");	//Что ты тут делаешь?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fellan_WhyAUHere_14_00");	//Что ты тут делаешь?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fellan_WhyAUHere_16_00");	//Что ты тут делаешь?
	};
	AI_Output(self,other,"DIA_Fellan_WhyAUHere_06_01");	//Жду какой-нибудь корабль.
};

//============================================================
instance DIA_Fellan_WhatFallDown(C_INFO)
{
	nr = 3;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_WhatFallDown_cond;
	information = DIA_Fellan_WhatFallDown_info;
	description = "Объясни толком. Что рухнет?";
};
func int DIA_Fellan_WhatFallDown_cond()
{
	if (Npc_KnowsInfo(other,DIA_Fellan_HowAU))	{
		return TRUE;
	};
};
func void DIA_Fellan_WhatFallDown_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fellan_WhatFallDown_03_00");	//Объясни толком. Что рухнет?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fellan_WhatFallDown_07_00");	//Объясни толком. Что рухнет?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fellan_WhatFallDown_10_00");	//Объясни толком. Что рухнет?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fellan_WhatFallDown_14_00");	//Объясни толком. Что рухнет?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fellan_WhatFallDown_16_00");	//Объясни толком. Что рухнет?
	};
	AI_Output(self,other,"DIA_Fellan_WhatFallDown_06_01");	//Все! Горы, дома, люди... Может, само небо упадет на землю! 
	AI_Output(self,other,"DIA_Fellan_WhatFallDown_06_02");	//Я просто не хочу этого видеть. Я не выдержу.
};

//============================================================
instance DIA_Fellan_WhyFallDown(C_INFO)
{
	nr = 4;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_WhyFallDown_cond;
	information = DIA_Fellan_WhyFallDown_info;
	description = "Почему ты так уверен, что все рухнет?";
};
func int DIA_Fellan_WhyFallDown_cond()
{
	if (Npc_KnowsInfo(other,DIA_Fellan_HowAU))	{
		return TRUE;
	};
};
func void DIA_Fellan_WhyFallDown_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fellan_WhyFallDown_03_00");	//Почему ты так уверен, что все рухнет?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fellan_WhyFallDown_07_00");	//Почему ты так уверен, что все рухнет?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fellan_WhyFallDown_10_00");	//Почему ты так уверен, что все рухнет?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fellan_WhyFallDown_14_00");	//Почему ты так уверен, что все рухнет?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fellan_WhyFallDown_16_00");	//Почему ты так уверен, что все рухнет?
	};
	AI_Output(self,other,"DIA_Fellan_WhyFallDown_06_01");	//Я вижу это, каждый божий день! Снова, и снова!
	AI_Output(self,other,"DIA_Fellan_WhyFallDown_06_02");	//Я лежу в кровати, а на меня падает крыша. И за ней все... просто сыплется. Превращается в пыль.
	AI_Output(self,other,"DIA_Fellan_WhyFallDown_06_03");	//И голос... Древний монстр говорит со мной! Он пожрет все, разрушит остров до основания!
};

//============================================================
instance DIA_Fellan_WifeWaits(C_INFO)
{
	nr = 10;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_WifeWaits_cond;
	information = DIA_Fellan_WifeWaits_info;
	description = "Твоя жена ждет тебя.";
};
func int DIA_Fellan_WifeWaits_cond()
{
	if ((MIS_FellanGoHome == LOG_Running) && MIS_FellanGoHome_WifeWaits && !MIS_FellanGoHome_Returned)	{
		return TRUE;
	};
};
func void DIA_Fellan_WifeWaits_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fellan_WifeWaits_03_00");	//Твоя жена ждет тебя.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fellan_WifeWaits_07_00");	//Твоя жена ждет тебя.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fellan_WifeWaits_10_00");	//Твоя жена ждет тебя.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fellan_WifeWaits_14_00");	//Твоя жена ждет тебя.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fellan_WifeWaits_16_00");	//Твоя жена ждет тебя.
	};
	AI_Output(self,other,"DIA_Fellan_WifeWaits_06_01");	//Эта женщина! Я пытался, как мог, убедить ее пойти со мной.
	AI_Output(self,other,"DIA_Fellan_WifeWaits_06_02");	//Но это бесполезно. Она просто тупа, как пробка, она просто не может понять.
	MIS_FellanGoHome_ToldAttempts += 1;
	if (MIS_FellanGoHome_ToldAttempts == MIS_FellanGoHome_ToldAttempts_Fail)	{
		B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_TalkFail);
	};
};

//============================================================
instance DIA_Fellan_GoHome(C_INFO)
{
	nr = 11;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_GoHome_cond;
	information = DIA_Fellan_GoHome_info;
	description = "Тебе надо идти домой.";
	permanent = TRUE;
};
func int DIA_Fellan_GoHome_cond()
{
	if (MIS_FellanGoHome_WifeWaits && !MIS_FellanGoHome_Returned)	{
		return TRUE;
	};
};
func void DIA_Fellan_GoHome_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fellan_GoHome_03_00");	//Тебе надо идти домой.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fellan_GoHome_07_00");	//Тебе надо идти домой.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fellan_GoHome_10_00");	//Тебе надо идти домой.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fellan_GoHome_14_00");	//Тебе надо идти домой.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fellan_GoHome_16_00");	//Тебе надо идти домой.
	};
	AI_Output(self,other,"DIA_Fellan_GoHome_06_01");	//Нет. Ни за что!
	MIS_FellanGoHome_ToldAttempts += 1;
	if (MIS_FellanGoHome_ToldAttempts == MIS_FellanGoHome_ToldAttempts_Fail)	{
		B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_TalkFail);
	};
};

//============================================================
instance DIA_Fellan_Returned(C_INFO)
{
	nr = 12;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_Returned_cond;
	information = DIA_Fellan_Returned_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Fellan_Returned_cond()
{
	if (MIS_FellanGoHome_Returned && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Fellan_Returned_info()
{
	AI_Output(self,other,"DIA_Fellan_Returned_06_01");	//Вот увидишь, я все починю!
	AI_StopProcessInfos(self);
};

//============================================================
instance DIA_Fellan_ShowHammer(C_INFO)
{
	nr = 20;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_ShowHammer_cond;
	information = DIA_Fellan_ShowHammer_info;
	description = "Смотри, что у меня есть! (показать молоток)";
};
func int DIA_Fellan_ShowHammer_cond()
{
	if ((MIS_FellanGoHome == LOG_Running) && Npc_HasItems(other,ItMi_FellanHammer))	{
		return TRUE;
	};
};
func void DIA_Fellan_ShowHammer_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fellan_ShowHammer_03_00");	//Смотри, что у меня есть!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fellan_ShowHammer_07_00");	//Смотри, что у меня есть!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fellan_ShowHammer_10_00");	//Смотри, что у меня есть!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fellan_ShowHammer_14_00");	//Смотри, что у меня есть!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fellan_ShowHammer_16_00");	//Смотри, что у меня есть!
	};
	AI_Output(self,other,"DIA_Fellan_ShowHammer_06_01");	//(с удивлением) Мой молоток! Откуда?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fellan_ShowHammer_03_02");	//Неважно. Но сдается мне, ты про него забыл.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fellan_ShowHammer_07_02");	//Неважно. Но сдается мне, ты про него забыл.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fellan_ShowHammer_10_02");	//Неважно. Но сдается мне, ты про него забыл.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fellan_ShowHammer_14_02");	//Неважно. Но сдается мне, ты про него забыл.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fellan_ShowHammer_16_02");	//Неважно. Но сдается мне, ты про него забыл.
	};
	AI_Output(self,other,"DIA_Fellan_ShowHammer_06_03");	//Нет, я... Дай сюда!
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fellan_ShowHammer_03_04");	//Не дам, пока не вернешься.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fellan_ShowHammer_07_04");	//Не дам, пока не вернешься.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fellan_ShowHammer_10_04");	//Не дам, пока не вернешься.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fellan_ShowHammer_14_04");	//Не дам, пока не вернешься.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fellan_ShowHammer_16_04");	//Не дам, пока не вернешься.
	};
	AI_Output(self,other,"DIA_Fellan_ShowHammer_06_05");	//Я не вернусь! Забудь об этом.
	if (!Npc_KnowsInfo(other,DIA_Irene_HammerRepaired))	{
		B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerFail);
	};
};


//============================================================
instance DIA_Fellan_UForgot(C_INFO)
{
	nr = 21;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_UForgot_cond;
	information = DIA_Fellan_UForgot_info;
	description = "И все-таки, ты кое-что забыл.";
};
func int DIA_Fellan_UForgot_cond()
{
	if ((MIS_FellanGoHome == LOG_Running) && Npc_HasItems(other,ItMi_FellanHammer)
		&& Npc_KnowsInfo(other,DIA_Fellan_ShowHammer) && Npc_KnowsInfo(other,DIA_Irene_HammerRepaired))	{
		return TRUE;
	};
};
func void DIA_Fellan_UForgot_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fellan_UForgot_03_00");	//И все-таки, ты кое-что забыл.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fellan_UForgot_07_00");	//И все-таки, ты кое-что забыл.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fellan_UForgot_10_00");	//И все-таки, ты кое-что забыл.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fellan_UForgot_14_00");	//И все-таки, ты кое-что забыл.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fellan_UForgot_16_00");	//И все-таки, ты кое-что забыл.
	};
	AI_Output(self,other,"DIA_Fellan_UForgot_06_01");	//Что?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fellan_UForgot_03_02");	//Сломанные вещи нужно чинить, а не выбрасывать.
		AI_Output(other,self,"DIA_Fellan_UForgot_03_03");	//Говоришь, все рухнет? А почему?
		AI_Output(other,self,"DIA_Fellan_UForgot_03_04");	//Не потому ли, что никто ничего не чинит?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fellan_UForgot_07_02");	//Сломанные вещи нужно чинить, а не выбрасывать.
		AI_Output(other,self,"DIA_Fellan_UForgot_07_03");	//Говоришь, все рухнет? А почему?
		AI_Output(other,self,"DIA_Fellan_UForgot_07_04");	//Не потому ли, что никто ничего не чинит?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fellan_UForgot_10_02");	//Сломанные вещи нужно чинить, а не выбрасывать.
		AI_Output(other,self,"DIA_Fellan_UForgot_10_03");	//Говоришь, все рухнет? А почему?
		AI_Output(other,self,"DIA_Fellan_UForgot_10_04");	//Не потому ли, что никто ничего не чинит?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fellan_UForgot_14_02");	//Сломанные вещи нужно чинить, а не выбрасывать.
		AI_Output(other,self,"DIA_Fellan_UForgot_14_03");	//Говоришь, все рухнет? А почему?
		AI_Output(other,self,"DIA_Fellan_UForgot_14_04");	//Может, потому что никто ничего не чинит?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fellan_UForgot_16_02");	//Сломанные вещи нужно чинить, а не выбрасывать.
		AI_Output(other,self,"DIA_Fellan_UForgot_16_03");	//Говоришь, все рухнет? А почему?
		AI_Output(other,self,"DIA_Fellan_UForgot_16_04");	//Не потому ли, что никто ничего не чинит?
	};
	AI_Output(self,other,"DIA_Fellan_UForgot_06_05");	//Хорошо. Хорошо! Я все понял!
	AI_Output(self,other,"DIA_Fellan_UForgot_06_06");	//Дай мне мой молоток.
	B_GiveInvItems(other,self,ItMi_FellanHammer,1);
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"HAMMER");
	B_StartOtherRoutine(VLK_478_Irene,"RETURNED");
	MIS_FellanGoHome_Returned = TRUE;
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_Success);
	B_GivePlayerXP(XP_Fellan_Returned);
};

