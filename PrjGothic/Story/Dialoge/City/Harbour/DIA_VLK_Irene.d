
instance DIA_Irene_EXIT(DIA_Proto_End)
{
	npc = VLK_478_Irene;
};

//============================================================
instance DIA_Irene_Sarah_HowAU(C_INFO)
{
	nr = 1;
	npc = VLK_478_Irene;
	condition = DIA_Irene_Sarah_HowAU_cond;
	information = DIA_Irene_Sarah_HowAU_info;
	description = "Как дела, подруга?";
};
func int DIA_Irene_Sarah_HowAU_cond()
{
	if (C_HeroIs_Sarah()
		&& !MIS_FellanGoHome_WifeWaits)	{
		return TRUE;
	};
};
func void DIA_Irene_Sarah_HowAU_info()
{
		AI_Output(other,self,"DIA_Irene_Sarah_HowAU_16_00");	//Как дела, подруга? Ты выглядишь очень расстроенной.
	AI_Output(self,other,"DIA_Irene_Sarah_HowAU_17_01");	//Так ты еще не в курсе?
		AI_Output(other,self,"DIA_Irene_Sarah_HowAU_16_02");	//Нет. Что случилось?
	AI_Output(self,other,"DIA_Irene_Sarah_HowAU_17_03");	//Феллан, он... он ушел из дома.
	AI_Output(self,other,"DIA_Irene_Sarah_HowAU_17_04");	//Просто сидит целый день на причале... Я каждый день уговариваю его одуматься, но все бесполезно.
	AI_Output(self,other,"DIA_Irene_Sarah_HowAU_17_05");	//Я не знаю, что мне делать! Как заставить его вернуться домой?!
	MIS_FellanGoHome = LOG_Running;
	MIS_FellanGoHome_WifeWaits = TRUE;
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_Fellan);
	B_LogEntry_Create(TOPIC_FellanGoHome,LOG_MISSION,TOPIC_FellanGoHome_Start);
};

//============================================================
instance DIA_Irene_Others_HowAU(C_INFO)
{
	nr = 2;
	npc = VLK_478_Irene;
	condition = DIA_Irene_Others_HowAU_cond;
	information = DIA_Irene_Others_HowAU_info;
	description = "Что случилось? Выглядишь расстроенной.";
};
func int DIA_Irene_Others_HowAU_cond()
{
	if (!C_HeroIs_Sarah()
		&& !MIS_FellanGoHome_WifeWaits)	{
		return TRUE;
	};
};
func void DIA_Irene_Others_HowAU_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Irene_Others_HowAU_03_00");	//У тебя что-то случилось? Выглядишь очень расстроенной.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Irene_Others_HowAU_07_00");	//У тебя что-то случилось? Выглядишь очень расстроенной.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Irene_Others_HowAU_10_00");	//У тебя что-то случилось? Выглядишь очень расстроенной.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Irene_Others_HowAU_14_00");	//У тебя что-то случилось? Выглядишь очень расстроенной.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Irene_Others_HowAU_16_00");	//У тебя что-то случилось? Выглядишь очень расстроенной.
	};
	AI_Output(self,other,"DIA_Irene_Others_HowAU_17_01");	//Ох, и не спрашивай!
	AI_Output(self,other,"DIA_Irene_Others_HowAU_17_02");	//Мой муж, Феллан, ушел из дома.
	AI_Output(self,other,"DIA_Irene_Others_HowAU_17_03");	//Целыми денями сидит на причале... Я пыталась уговорить, привести в чувство, но все бесполезно.
	AI_Output(self,other,"DIA_Irene_Others_HowAU_17_04");	//Все говорят, что он сошел с ума, чтобы я его бросила... Но я просто хочу вернуть мужа домой!
	MIS_FellanGoHome = LOG_Running;
	MIS_FellanGoHome_WifeWaits = TRUE;
	B_LogEntry_Create(TOPIC_FellanGoHome,LOG_MISSION,TOPIC_FellanGoHome_Start);
};

//============================================================
instance DIA_Irene_HusbandLeft(C_INFO)
{
	nr = 10;
	npc = VLK_478_Irene;
	condition = DIA_Irene_HusbandLeft_cond;
	information = DIA_Irene_HusbandLeft_info;
	description = "Говорят, твой муж ушел из дома.";
};
func int DIA_Irene_HusbandLeft_cond()
{
	if (MIS_FellanGoHome_WifeWaits
		&& (MIS_FellanGoHome == 0))	{
		return TRUE;
	};
};
func void DIA_Irene_HusbandLeft_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Irene_HusbandLeft_03_00");	//Говорят, твой муж ушел из дома.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Irene_HusbandLeft_07_00");	//Говорят, твой муж ушел из дома.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Irene_HusbandLeft_10_00");	//Говорят, твой муж ушел из дома.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Irene_HusbandLeft_14_00");	//Говорят, твой муж ушел из дома.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Irene_HusbandLeft_16_00");	//Говорят, твой муж ушел из дома.
	};
	AI_Output(self,other,"DIA_Irene_HusbandLeft_17_01");	//(со вздохом) Так и есть. Здесь редко что-то происходит, так что об этом судачат на каждом углу.
	MIS_FellanGoHome = LOG_Running;
	if (C_HeroIs_Sarah())	{
		B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_Fellan);
	};
	B_LogEntry_Create(TOPIC_FellanGoHome,LOG_MISSION,TOPIC_FellanGoHome_Start);
};

//============================================================
instance DIA_Irene_WhatHappened(C_INFO)
{
	nr = 11;
	npc = VLK_478_Irene;
	condition = DIA_Irene_WhatHappened_cond;
	information = DIA_Irene_WhatHappened_info;
	description = "Расскажи, что произошло.";
};
func int DIA_Irene_WhatHappened_cond()
{
	if (MIS_FellanGoHome == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Irene_WhatHappened_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Irene_WhatHappened_03_00");	//Расскажи, что произошло.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Irene_WhatHappened_07_00");	//Расскажи, что произошло.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Irene_WhatHappened_10_00");	//Расскажи, что произошло.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Irene_WhatHappened_14_00");	//Расскажи, что произошло.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Irene_WhatHappened_16_00");	//Расскажи, что произошло.
	};
	if (C_HeroIs_Sarah())	{
		AI_Output(self,other,"DIA_Irene_WhatHappened_17_01a");	//Ты же знаешь, Феллан с детства был немного странным, но добрым и отзывчивым. Я тогда думала, что его странности даже милые.
	}
	else	{
		AI_Output(self,other,"DIA_Irene_WhatHappened_17_01");	//Феллан всегда был немного странным, но добрым и отзывчивым парнем. Его странности даже бывали милыми.
	};
	AI_Output(self,other,"DIA_Irene_WhatHappened_17_02");	//Но в последнее время его будто подменили. Он стал мрачным, грубым.
	AI_Output(self,other,"DIA_Irene_WhatHappened_17_03");	//А на прошлой неделе он разбудил меня посреди ночи, бормотал что-то бессвязное, что все рушится, что нужно скорее уехать отсюда.
	AI_Output(self,other,"DIA_Irene_WhatHappened_17_04");	//Кажется, ему приснился кошмар, уже не в первый раз.
	AI_Output(self,other,"DIA_Irene_WhatHappened_17_05");	//Но он все никак не успокаивался, потащил меня на пристань... Кораблей же ни одного нет, но он все равно пошел туда.
	AI_Output(self,other,"DIA_Irene_WhatHappened_17_06");	//Я даже испугалась, что он прыгнет в воду и попытается уплыть на материк.
	AI_Output(self,other,"DIA_Irene_WhatHappened_17_07");	//В итоге он просто остался там, на причале, ждать кораблей.
	AI_Output(self,other,"DIA_Irene_WhatHappened_17_08");	//Как я его ни уговариваю, он наотрез отказывается возвращаться домой.
};


//============================================================
instance DIA_Irene_TalkToFellan(C_INFO)
{
	nr = 12;
	npc = VLK_478_Irene;
	condition = DIA_Irene_TalkToFellan_cond;
	information = DIA_Irene_TalkToFellan_info;
	description = "Я поговорю с твоим мужем.";
};
func int DIA_Irene_TalkToFellan_cond()
{
	if (Npc_KnowsInfo(other,DIA_Irene_WhatHappened)
		&& (MIS_FellanGoHome == LOG_Running)
		&& (MIS_FellanGoHome_ToldAttempts < MIS_FellanGoHome_ToldAttempts_Fail))	{
		return TRUE;
	};
};
func void DIA_Irene_TalkToFellan_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Irene_TalkToFellan_03_00");	//Я поговорю с твоим мужем.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Irene_TalkToFellan_07_00");	//Я поговорю с твоим мужем.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Irene_TalkToFellan_10_00");	//Я поговорю с твоим мужем.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Irene_TalkToFellan_14_00");	//Я поговорю с твоим мужем.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Irene_TalkToFellan_16_00");	//Я поговорю с твоим мужем.
	};
	AI_Output(self,other,"DIA_Irene_TalkToFellan_17_01");	//Попробуй. Меня он не слушает.
};

//============================================================
instance DIA_Irene_FailTalk(C_INFO)
{
	nr = 13;
	npc = VLK_478_Irene;
	condition = DIA_Irene_FailTalk_cond;
	information = DIA_Irene_FailTalk_info;
	description = "Мне не удалось уговорить Феллана вернуться домой.";
};
func int DIA_Irene_FailTalk_cond()
{
	if ((MIS_FellanGoHome_ToldAttempts >= MIS_FellanGoHome_ToldAttempts_Fail)
		&& (MIS_FellanGoHome == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Irene_FailTalk_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Irene_FailTalk_03_00");	//Мне не удалось уговорить Феллана вернуться домой.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Irene_FailTalk_07_00");	//Мне не удалось уговорить Феллана вернуться домой.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Irene_FailTalk_10_00");	//Мне не удалось уговорить Феллана вернуться домой.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Irene_FailTalk_14_00");	//Мне не удалось уговорить Феллана вернуться домой.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Irene_FailTalk_16_00");	//Мне не удалось уговорить Феллана вернуться домой.
	};
	AI_Output(self,other,"DIA_Irene_FailTalk_17_01");	//Я и не надеялась. Когда ему что-то взбредает в голову, он никого не слушает.
	if (hero.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Irene_FailTalk_17_02m");	//Но спасибо, что попытался.
	}
	else	{
		AI_Output(self,other,"DIA_Irene_FailTalk_17_02f");	//Но спасибо, что попыталась.
	};
};

//============================================================
instance DIA_Irene_OtherWay(C_INFO)
{
	nr = 14;
	npc = VLK_478_Irene;
	condition = DIA_Irene_OtherWay_cond;
	information = DIA_Irene_OtherWay_info;
	description = "Думаю, надо изменить подход.";
};
func int DIA_Irene_OtherWay_cond()
{
	if ((Npc_KnowsInfo(other,DIA_Irene_FailTalk))
		&& (MIS_FellanGoHome == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Irene_OtherWay_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Irene_OtherWay_03_00");	//Думаю, надо изменить подход.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Irene_OtherWay_07_00");	//Думаю, надо изменить подход.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Irene_OtherWay_10_00");	//Думаю, надо изменить подход.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Irene_OtherWay_14_00");	//Думаю, надо изменить подход.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Irene_OtherWay_16_00");	//Думаю, надо изменить подход.
	};
	AI_Output(self,other,"DIA_Irene_OtherWay_17_01");	//Что ты имеешь в виду?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Irene_OtherWay_03_02");	//Не надо уговаривать его. Надо сделать так, чтобы он сам решил вернуться.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Irene_OtherWay_07_02");	//Не надо уговаривать его. Надо сделать так, чтобы он сам решил вернуться.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Irene_OtherWay_10_02");	//Не надо уговаривать его. Надо сделать так, чтобы он сам решил вернуться.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Irene_OtherWay_14_02");	//Не надо уговаривать его. Надо сделать так, чтобы он сам решил вернуться.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Irene_OtherWay_16_02");	//Не надо уговаривать его. Надо сделать так, чтобы он сам решил вернуться.
	};
	AI_Output(self,other,"DIA_Irene_OtherWay_17_03");	//(с сомнением) И как ты планируешь это сделать?
};

//============================================================
instance DIA_Irene_SwitchAtttention(C_INFO)
{
	nr = 15;
	npc = VLK_478_Irene;
	condition = DIA_Irene_SwitchAtttention_cond;
	information = DIA_Irene_SwitchAtttention_info;
	description = "Нужно переключить его внимание.";
};
func int DIA_Irene_SwitchAtttention_cond()
{
	if ((Npc_KnowsInfo(other,DIA_Irene_OtherWay))
		&& (MIS_FellanGoHome == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Irene_SwitchAtttention_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_03_00");	//Нужно переключить его внимание.
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_03_01");	//Как у маленького ребенка. Если он плачет и капризничает - дать ему яркую погремушку.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_07_00");	//Нужно переключить его внимание.
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_07_01");	//Как у маленького ребенка. Если он плачет и капризничает - дать ему яркую погремушку.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_10_00");	//Нужно переключить его внимание.
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_10_01");	//Как у маленького ребенка. Если он плачет и капризничает - дать ему яркую погремушку.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_14_00");	//Нужно переключить его внимание.
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_14_01");	//Как у маленького ребенка. Если он плачет и капризничает - дать ему яркую погремушку.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_16_00");	//Нужно переключить его внимание.
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_16_01");	//Как у маленького ребенка. Если он плачет и капризничает - дать ему яркую погремушку.
	};
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_02");	//Погремушку?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_03_03");	//Образно говоря. Нужно что-то ценное, что-то дорогое ему, ради чего бы он вернулся.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_07_03");	//Образно говоря. Нужно что-то ценное, что-то дорогое ему, ради чего бы он вернулся.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_10_03");	//Образно говоря. Нужно что-то ценное, что-то дорогое ему, ради чего бы он вернулся.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_14_03");	//Образно говоря. Нужно что-то ценное, что-то дорогое ему, ради чего бы он вернулся.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_16_03");	//Образно говоря. Нужно что-то ценное, что-то дорогое ему, ради чего бы он вернулся.
	};
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_04");	//Дай-ка подумать... Вообще, он легко привязывается к разным вещицам, не дает их выбросить, даже если они совсем сломаны.
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_05");	//У него целый сундук всякого барахла.
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_06");	//Быть может... Его молоток!
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_03_07");	//Молоток?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_07_07");	//Молоток?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_10_07");	//Молоток?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_14_07");	//Молоток?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_16_07");	//Молоток?
	};
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_08");	//Да. Молоток принадлежал еще деду Феллана, а он был хорошим плотником.
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_09");	//Феллан тоже любил строгать и пилить, да у него не особо получалось - крыши протекали, двери не закрывались, из табуреток торчали острые гвозди...
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_10");	//Но он продолжал пытаться, пока пару лет назад у его любимого молотка не сломалась рукоятка.
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_11");	//Тогда он все забросил, но молоток хранит до сих пор. Попробуй починить его.
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_12");	//Вот, возьми ключ от его сундука. 
	//PUBLIC
	B_GiveInvItems(self,other,ItKe_Chest_Fellan,1);
	self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] | IGNORE_PortalRoom_Public;
	Fellan_ChestKeyGot = TRUE;
	MOBNAME_Chest_Fellan = MOBNAME_Chest_Fellan_Full;
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerTold);
};

//============================================================
instance DIA_Irene_WhoRepairHammer(C_INFO)
{
	nr = 16;
	npc = VLK_478_Irene;
	condition = DIA_Irene_WhoRepairHammer_cond;
	information = DIA_Irene_WhoRepairHammer_info;
	description = "Кто может починить молоток?";
};
func int DIA_Irene_WhoRepairHammer_cond()
{
	if ((MIS_FellanGoHome == LOG_Running) && Npc_KnowsInfo(other,DIA_Irene_SwitchAtttention))	{
		return TRUE;
	};
};
func void DIA_Irene_WhoRepairHammer_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Irene_WhoRepairHammer_03_00");	//Кто может починить молоток?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Irene_WhoRepairHammer_07_00");	//Кто может починить молоток?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Irene_WhoRepairHammer_10_00");	//Кто может починить молоток?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Irene_WhoRepairHammer_14_00");	//Кто может починить молоток?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Irene_WhoRepairHammer_16_00");	//Кто может починить молоток?
	};
	AI_Output(self,other,"DIA_Irene_WhoRepairHammer_17_01");	//Поговори с кузнецом Карлом.
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerSmith);
};

//============================================================
instance DIA_Irene_HammerRepaired(C_INFO)
{
	nr = 17;
	npc = VLK_478_Irene;
	condition = DIA_Irene_HammerRepaired_cond;
	information = DIA_Irene_HammerRepaired_info;
	description = "Я починил молоток.";
};
func int DIA_Irene_HammerRepaired_cond()
{
	if ((MIS_FellanGoHome == LOG_Running) && Npc_HasItems(other,ItMi_FellanHammer))	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Irene_HammerRepaired.description = "Я починила молоток.";
		};
		return TRUE;
	};
};
func void DIA_Irene_HammerRepaired_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Irene_HammerRepaired_03_00");	//Я починил молоток.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Irene_HammerRepaired_07_00");	//Я починил молоток.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Irene_HammerRepaired_10_00");	//Я починил молоток.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Irene_HammerRepaired_14_00");	//Я починил молоток.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Irene_HammerRepaired_16_00");	//Я починила молоток.
	};
	AI_Output(self,other,"DIA_Irene_HammerRepaired_17_01");	//Смотри-ка, как новенький.
	AI_Output(self,other,"DIA_Irene_HammerRepaired_17_02");	//Я тут еще кое-что вспомнила. Его дед и бабка вместе прожили душа в душу без малого 60 лет.
	AI_Output(self,other,"DIA_Irene_HammerRepaired_17_03");	//Они говорили, что человеческие отношения, как и старые вещи, нужно всегда чинить, а не выбрасывать.
	AI_Output(self,other,"DIA_Irene_HammerRepaired_17_04");	//И мне Феллан, когда делал предложение, сказал, что какой бы старой, больной и страшной я ни стала с годами, он меня никогда не бросит.
	AI_Output(self,other,"DIA_Irene_HammerRepaired_17_05");	//Немного неуклюже, но искренне.
	AI_Output(self,other,"DIA_Irene_HammerRepaired_17_06");	//Может, если ему напомнить об этом, он вернется?
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_Clue);
};

//============================================================
instance DIA_Irene_Returned(C_INFO)
{
	nr = 18;
	npc = VLK_478_Irene;
	condition = DIA_Irene_Returned_cond;
	information = DIA_Irene_Returned_info;
	important = TRUE;
};
func int DIA_Irene_Returned_cond()
{
	if ((MIS_FellanGoHome_Returned))	{
		return TRUE;
	};
};
func void DIA_Irene_Returned_info()
{
	AI_Output(self,other,"DIA_Irene_Returned_17_00");	//Тебе удалось! Он вернулся.
	AI_Output(self,other,"DIA_Irene_Returned_17_01");	//Спасибо, спасибо огромное.
	//если не забрали из сундука
	if (Mob_HasItems("CHEST_FELLAN",ItAm_MR_SharkTooth_Broken))	{
		AI_Output(self,other,"DIA_Irene_Returned_17_02");	//Вот. Возьми этот амулет на удачу.
		AI_Output(self,other,"DIA_Irene_Returned_17_03");	//Феллан первым делом починил его, но, думаю, он не обидится, что я отдала его тебе.
		//амулет из акульего зуба - амулет на удачу +10% опыта
		B_GiveInvItems(self,other,ItAm_MR_SharkTooth,1);
		MobContainer_RemoveItem("CHEST_FELLAN",ItAm_MR_SharkTooth_Broken);
		B_LogEntry_Status(TOPIC_FellanGoHome,LOG_SUCCESS,ConcatStrings(TOPIC_FellanGoHome_SuccessIrene, TOPIC_FellanGoHome_SuccessAmul));
	}
	else	{
		AI_Output(self,other,"DIA_Irene_Returned_17_04");	//К сожалению, у меня нет ничего ценного, чтобы подарить тебе.
		AI_Output(self,other,"DIA_Irene_Returned_17_05");	//Вот, возьми хотя бы несколько монет.
		//20 зол.
		B_GiveGold(self,other,20);
		B_LogEntry_Status(TOPIC_FellanGoHome,LOG_SUCCESS,TOPIC_FellanGoHome_SuccessIrene);
	};
	B_GivePlayerXP(XP_Fellan_Success);
};

//============================================================
instance DIA_Irene_PermHowAU(C_INFO)
{
	nr = 18;
	npc = VLK_478_Irene;
	condition = DIA_NoCond_cond;
	information = DIA_Irene_PermHowAU_info;
	description = "Как настроение?";
	permanent = TRUE;
};
func void DIA_Irene_PermHowAU_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Irene_PermHowAU_03_00");	//Как настроение?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Irene_PermHowAU_07_00");	//Как настроение?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Irene_PermHowAU_10_00");	//Как настроение?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Irene_PermHowAU_14_00");	//Как настроение?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Irene_PermHowAU_16_00");	//Как настроение?
	};
	if (!MIS_FellanGoHome_Returned)	{
		AI_Output(self,other,"DIA_Irene_PermHowAU_17_01");	//Я начинаю отчаиваться.
	}
	else	{
		AI_Output(self,other,"DIA_Irene_PermHowAU_17_02");	//Теперь, когда Феллан вернулся, у меня на душе спокойно.
		AI_Output(self,other,"DIA_Irene_PermHowAU_17_03");	//Вот только соседи, кажется, не так рады его возвращению.
		AI_Output(self,other,"DIA_Irene_PermHowAU_17_04");	//Но это неважно. Скоро все утрясется, я думаю.
	};
};

