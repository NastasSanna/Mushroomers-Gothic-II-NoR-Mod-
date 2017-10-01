
instance DIA_Nadja_EXIT(DIA_Proto_End)
{
	npc = VLK_435_Nadja;
};

/////////////////////////////// САРА //////////////////////////////////
var int Nadja_Ask_Tries;
//===================================================
instance DIA_Nadja_Sarah_Hello(C_Info)
{
	npc = VLK_435_Nadja;			nr = 1;
	condition = DIA_Nadja_Sarah_MR_Hello_Cond;
	information = DIA_Nadja_Sarah_MR_Hello_Info;
	description = "Привет!";
};
func int DIA_Nadja_Sarah_MR_Hello_Cond()
{
	if (C_HeroIs_Sarah())	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_MR_Hello_Info()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_MR_Hello_16_00");	//Привет!
	AI_Output(self,other,"DIA_Nadja_Sarah_MR_Hello_17_01");	//(хрипло) Чего тебе? Пришла похвастаться, что выплыла из нашего болота?
		AI_Output(other,self,"DIA_Nadja_Sarah_MR_Hello_16_02");	//Нет, я...
	AI_Output(self,other,"DIA_Nadja_Sarah_MR_Hello_17_03");	//Что, все-таки засосало обратно? (сухой кашель)
	AI_Output(self,other,"DIA_Nadja_Sarah_MR_Hello_17_04");	//А впрочем, ладно, забудь. Может, у тебя закурить есть?
		AI_Output(other,self,"DIA_Nadja_Sarah_MR_Hello_16_05");	//Нет. И не будет.
	AI_Output(self,other,"DIA_Nadja_Sarah_MR_Hello_17_06");	//Жалость-то какая.
	B_GivePlayerXP(XP_Sarah_NadjaHello);
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_Nadja);
};

//===================================================
instance DIA_Nadja_Sarah_Voice(C_Info)
{
	npc = VLK_435_Nadja;			nr = 2;
	condition = DIA_Nadja_Sarah_Voice_Cond;
	information = DIA_Nadja_Sarah_Voice_Info;
	description = "Что с твоим голосом?";
};
func int DIA_Nadja_Sarah_Voice_Cond()
{
	if (C_HeroIs_Sarah() && Npc_KnowsInfo(other,DIA_Nadja_Sarah_Hello))	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_Voice_Info()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_Voice_16_00");	//Что с твоим голосом?
	AI_Output(self,other,"DIA_Nadja_Sarah_Voice_17_01");	//А что с ним?
		AI_Output(other,self,"DIA_Nadja_Sarah_Voice_16_02");	//Не припомню, чтобы ты раньше хрипела, как простуженный боцман после месяца попоек.
	AI_Output(self,other,"DIA_Nadja_Sarah_Voice_17_03");	//Да не преувеличивай! Ну может, и хрипловат немного.
	AI_Output(self,other,"DIA_Nadja_Sarah_Voice_17_04");	//Ветер холодный, осень, все дела...
	Nadja_Ask_Tries += 1;
};

//===================================================
instance DIA_Nadja_Sarah_LookLikeDeath(C_Info)
{
	npc = VLK_435_Nadja;			nr = 3;
	condition = DIA_Nadja_Sarah_LookLikeDeath_Cond;
	information = DIA_Nadja_Sarah_LookLikeDeath_Info;
	description = "Плохо выглядишь.";
};
func int DIA_Nadja_Sarah_LookLikeDeath_Cond()
{
	if (C_HeroIs_Sarah() && Npc_KnowsInfo(other,DIA_Nadja_Sarah_Hello))	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_LookLikeDeath_Info()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_LookLikeDeath_16_00");	//Плохо выглядишь.
	AI_Output(self,other,"DIA_Nadja_Sarah_LookLikeDeath_17_01");	//А ты прямо цветешь и пахнешь розами.
		AI_Output(other,self,"DIA_Nadja_Sarah_LookLikeDeath_16_02");	//Я серьезно. Даже с твоей, кхм, работой, нельзя себя так запускать.
		AI_Output(other,self,"DIA_Nadja_Sarah_LookLikeDeath_16_03");	//Нет, ты только посмотри на себя! Мешки под глазами до земли висят, глаза краснющие, кожа...
	AI_Output(self,other,"DIA_Nadja_Sarah_LookLikeDeath_17_04");	//Слушай, отвали. Не твои заботы!
	Nadja_Ask_Tries += 1;
};

//===================================================
instance DIA_Nadja_Sarah_WhatHappened(C_Info)
{
	npc = VLK_435_Nadja;			nr = 4;
	condition = DIA_Nadja_Sarah_WhatHappened_Cond;
	information = DIA_Nadja_Sarah_WhatHappened_Info;
	description = "Да что с тобой творится?";
	permanent = TRUE;
};
func int DIA_Nadja_Sarah_WhatHappened_Cond()
{
	if (C_HeroIs_Sarah()
		 && Npc_KnowsInfo(other,DIA_Nadja_Sarah_Voice) && Npc_KnowsInfo(other,DIA_Nadja_Sarah_LookLikeDeath)
		 && !MIS_Sarah_BadHabit_NadjaAgreed)	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_WhatHappened_Info()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_WhatHappened_16_00");	//Да что с тобой творится?
	AI_Output(self,other,"DIA_Nadja_Sarah_WhatHappened_17_01");	//Я же сказала - не твое дело. Не лезь в мою жизнь!
	Nadja_Ask_Tries += 1;
};
//===================================================
instance DIA_Nadja_Sarah_TellAsIs(C_Info)
{
	npc = VLK_435_Nadja;			nr = 5;
	condition = DIA_Nadja_Sarah_TellAsIs_Cond;
	information = DIA_Nadja_Sarah_TellAsIs_Info;
	description = "Скажу прямо - продолжишь курить эту дрянь, скоро концы отдашь!";
};
func int DIA_Nadja_Sarah_TellAsIs_Cond()
{
	if (C_HeroIs_Sarah() && (Nadja_Ask_Tries >= 3) && Kardif_RumorsTold[1])	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_TellAsIs_Info()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_TellAsIs_16_00");	//Скажу прямо - продолжишь курить эту дрянь, скоро концы отдашь!
	AI_Output(self,other,"DIA_Nadja_Sarah_TellAsIs_17_03");	//А тебе какое дело? Отвяжись от меня!
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_NadjaNotListen);
};
//===================================================
instance DIA_Nadja_Sarah_ItsMe(C_Info)
{
	npc = VLK_435_Nadja;			nr = 6;
	condition = DIA_Nadja_Sarah_ItsMe_Cond;
	information = DIA_Nadja_Sarah_ItsMe_Info;
	description = "Эй, это же я, Сара, твоя подруга детства.";
	permanent = TRUE;
};
func int DIA_Nadja_Sarah_ItsMe_Cond()
{
	if (C_HeroIs_Sarah()
		&& Npc_KnowsInfo(other,DIA_Nadja_Sarah_WhatHappened) && !MIS_Sarah_BadHabit_NadjaAgreed)	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_ItsMe_Info()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_ItsMe_16_00");	//Эй, это же я, Сара, твоя подруга детства.
		AI_Output(other,self,"DIA_Nadja_Sarah_ItsMe_16_01");	//Помнишь, как мы часами чесали языками	про все подряд?
		AI_Output(other,self,"DIA_Nadja_Sarah_ItsMe_16_02");	//Давай, расскажи, что с тобой происходит.
	AI_Output(self,other,"DIA_Nadja_Sarah_ItsMe_17_03");	//Что было, то прошло. Да и ты не была такой занозой в заднице.
};

//===================================================
instance DIA_Nadja_Sarah_MoeTalked(C_Info)
{
	npc = VLK_435_Nadja;			nr = 7;
	condition = DIA_Nadja_Sarah_MoeTalked_Cond;
	information = DIA_Nadja_Sarah_MoeTalked_Info;
	important = TRUE;
};
func int DIA_Nadja_Sarah_MoeTalked_Cond()
{
	if (C_HeroIs_Sarah()
		&& MIS_Sarah_BadHabit_MoeTalked)	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_MoeTalked_Info()
{
	AI_Output(self,other,"DIA_Nadja_Sarah_MoeTalked_17_01");	//Это ты  подослала того увальня, который вечно торчит перед таверной Кардифа?
		AI_Output(other,self,"DIA_Nadja_Sarah_MoeTalked_16_02");	//Да, я хочу тебе помочь!
	AI_Output(self,other,"DIA_Nadja_Sarah_MoeTalked_17_03");	//Гляжу, ты взялась за дело всерьез.
		AI_Output(other,self,"DIA_Nadja_Sarah_MoeTalked_16_04");	//С чего ты взяла?
	AI_Output(self,other,"DIA_Nadja_Sarah_MoeTalked_17_05");	//(с сарказмом) И правда, с чего бы?
};

//===================================================
instance DIA_Nadja_Sarah_ItWorked(C_Info)
{
	npc = VLK_435_Nadja;			nr = 8;
	condition = DIA_Nadja_Sarah_ItWorked_Cond;
	information = DIA_Nadja_Sarah_ItWorked_Info;
	important = TRUE;
};
func int DIA_Nadja_Sarah_ItWorked_Cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit_LuciaTalkDay > 0)
		 && (MIS_Sarah_BadHabit_LuciaTalkDay <= Wld_GetDay_Shifted(17) || DIA_WhenAsked_cond()))	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_ItWorked_Info()
{
	B_GivePlayerXP(XP_Sarah_Nadja_ItWorked);
	AI_Output(self,other,"DIA_Nadja_Sarah_ItWorked_17_01");	//Эй, ты, подруга! Добилась-таки своего?
		AI_Output(other,self,"DIA_Nadja_Sarah_ItWorked_16_02");	//Ты о чем?
	AI_Output(self,other,"DIA_Nadja_Sarah_ItWorked_17_03");	//Правда думаешь, что я такая тупая и не догадаюсь, кто подговорил эту стерву Люси?
	AI_Output(self,other,"DIA_Nadja_Sarah_ItWorked_17_04");	//Но я и правда не намерена ей уступать. Твоя взяла, я бро... (глухой кашель)
	AI_Output(self,other,"DIA_Nadja_Sarah_ItWorked_17_05");	//Демоны Белиара!!! Я ни косячка не выкурила с самого рассвета!
	AI_Output(self,other,"DIA_Nadja_Sarah_ItWorked_17_06");	//Кажется, что в груди мыши скребутся! Понятия не имею, сколько я продержусь.
		AI_Output(other,self,"DIA_Nadja_Sarah_ItWorked_16_07");	//Я попытаюсь придумать, как тебе помочь.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_ItWorked);
	MIS_Sarah_BadHabit_NadjaAgreed = TRUE;
	MIS_Sarah_BadHabit_SearchPotion = TRUE;
};

//===================================================
instance DIA_Nadja_Sarah_GivePotion(C_Info)
{
	npc = VLK_435_Nadja;			nr = 9;
	condition = DIA_Nadja_Sarah_GivePotion_Cond;
	information = DIA_Nadja_Sarah_GivePotion_Info;
	description = "У меня есть зелье, которое поможет тебе.";
};
func int DIA_Nadja_Sarah_GivePotion_Cond()
{
	if (C_HeroIs_Sarah() && (MIS_Sarah_BadHabit == LOG_Running)
		&& MIS_Sarah_BadHabit_NadjaAgreed && (Npc_HasItems(other,ItMi_AntismokingPotion)))	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_GivePotion_Info()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_GivePotiond_16_00");	//У меня есть зелье, которое поможет тебе.
		AI_Output(other,self,"DIA_Nadja_Sarah_GivePotiond_16_01");	//Ты бы знала, чего мне стоило его достать!
	AI_Output(self,other,"DIA_Nadja_Sarah_GivePotion_17_02");	//Что ты за него хочешь?
	Info_ClearChoices(DIA_Nadja_Sarah_GivePotion);
	Info_AddChoice(DIA_Nadja_Sarah_GivePotion,"1500 золотых.",DIA_Nadja_Sarah_GivePotion_Gold);
	Info_AddChoice(DIA_Nadja_Sarah_GivePotion,"Достаточно двух волшебных слов.",DIA_Nadja_Sarah_GivePotion_Thanks);
};
func void DIA_Nadja_Sarah_GivePotion_DoGive()
{
	B_GiveInvItems(other,self,ItMi_AntismokingPotion,1);
	MIS_Sarah_BadHabit_GivePotionDay = Wld_GetDay_Shifted(4) + 1;
		AI_Output(other,self,"DIA_Nadja_Sarah_GivePotiond_DoGive_16_00");	//Пей по глоточку в день. Больше не надо, или сожжешь себе глотку.
	AI_Output(self,other,"DIA_Nadja_Sarah_GivePotion_DoGive_17_01");	//Поняла.
	Info_ClearChoices(DIA_Nadja_Sarah_GivePotion);
};
func void DIA_Nadja_Sarah_GivePotion_Thanks()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_GivePotiond_Thanks_16_00");	//Достаточно двух волшебных слов.
	B_GivePlayerXP(XP_Sarah_Nadja_PotionFree);
	AI_Output(self,other,"DIA_Nadja_Sarah_GivePotion_Thanks_17_01");	//А ты ничуть не изменилась, подруга.
	AI_Output(self,other,"DIA_Nadja_Sarah_GivePotion_Thanks_17_02");	//ПОЖАЛУЙСТА, дай мне свое зелье. И СПАСИБО, что достала его.
		AI_Output(other,self,"DIA_Nadja_Sarah_GivePotiond_Thanks_16_03");	//На здоровье. Держи.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_PotionGotThanks);
	MIS_Sarah_BadHabit_NadjaPrize = MIS_Sarah_BadHabit_NadjaPrize_Thanks;
	DIA_Nadja_Sarah_GivePotion_DoGive();
};
func void DIA_Nadja_Sarah_GivePotion_Gold()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_GivePotiond_Gold_16_00");	//1500 золотых.
	B_GivePlayerXP(XP_Sarah_Nadja_Potion);
	AI_Output(self,other,"DIA_Nadja_Sarah_GivePotion_Gold_17_01");	//А ты сильно изменилась. Это все мои сбережения.
	B_GiveGold(self,other,1500);
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_PotionGotGold);
	MIS_Sarah_BadHabit_NadjaPrize = MIS_Sarah_BadHabit_NadjaPrize_Gold;
	DIA_Nadja_Sarah_GivePotion_DoGive();
};

//===================================================
instance DIA_Nadja_Sarah_BloodyCough(C_Info)
{
	npc = VLK_435_Nadja;			nr = 10;
	condition = DIA_Nadja_Sarah_BloodyCough_Cond;
	information = DIA_Nadja_Sarah_BloodyCough_Info;
	important = TRUE;
};
func int DIA_Nadja_Sarah_BloodyCough_Cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit_GivePotionDay > 0) && (MIS_Sarah_BadHabit_GivePotionDay <= Wld_GetDay_Shifted(7)))	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_BloodyCough_Info()
{
	AI_Output(self,other,"DIA_Nadja_Sarah_BloodyCough_17_01");	//Что за дрянь ты мне подсунула?
		AI_Output(other,self,"DIA_Nadja_Sarah_BloodyCough_16_02");	//Что такое? Не помогает?
	AI_Output(self,other,"DIA_Nadja_Sarah_BloodyCough_17_03");	//Кх-кха... О курении я и правда думать не могу, но мне стало гораздо хуже!
	AI_Output(self,other,"DIA_Nadja_Sarah_BloodyCough_17_04");	//Я постоянно кашляю, с кровью! И еще какой-то черной дрянью.
		AI_Output(other,self,"DIA_Nadja_Sarah_BloodyCough_16_05");	//Я поговорю с алхимиком, который приготовил зелье.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_BloodyCough);
	MIS_Sarah_BadHabit_KnowBloodyCough = TRUE;
};
//===================================================
instance DIA_Nadja_Sarah_GiveSalve(C_Info)
{
	npc = VLK_435_Nadja;			nr = 11;
	condition = DIA_Nadja_Sarah_GiveSalve_Cond;
	information = DIA_Nadja_Sarah_GiveSalve_Info;
	description = "Вот тебе мазь.";
};
func int DIA_Nadja_Sarah_GiveSalve_Cond()
{
	if (C_HeroIs_Sarah()
		&& MIS_Sarah_BadHabit_KnowBloodyCough && Npc_HasItems(other,ItMi_BuildUpSalve))	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_GiveSalve_Info()
{
	B_GivePlayerXP(XP_Sarah_Nadja_Salve);
	AI_Output(other,self,"DIA_Nadja_Sarah_GiveSalve_16_00");	//Вот тебе мазь. Она уменьшит кровотечение, но тебе все равно придется прочистить легкие кашлем.
	B_GiveInvItems(other,self,ItMi_BuildUpSalve,1);
		AI_Output(self,other,"DIA_Nadja_Sarah_GiveSalve_17_01");	//Спасибо и на том.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_SalveGiven);
	MIS_Sarah_BadHabit_SalveGivenDay = Wld_GetDay_Shifted(8);
};

//===================================================
instance DIA_Nadja_Sarah_HowAreU(C_Info)
{
	npc = VLK_435_Nadja;			nr = 12;
	condition = DIA_Nadja_Sarah_HowAreU_Cond;
	information = DIA_Nadja_Sarah_HowAreU_Info;
	description = "Ну, как ты?";
	permanent = TRUE;
};
func int DIA_Nadja_Sarah_HowAreU_Cond()
{
	if (C_HeroIs_Sarah()
		&& (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_NadjaAgreed)	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_HowAreU_Info()
{
	AI_Output(other,self,"DIA_Nadja_Sarah_HowAreU_16_00");	//Ну, как ты?
	if (MIS_Sarah_BadHabit_NadjaPrize == 0)	{	//пока не нашли зелье
		AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_01");	//Если ты не найдешь лекарство, я, наверное, скоро повешусь.
	}
	//нашли зелье + 1 день с мазью
	else	if (MIS_Sarah_BadHabit_SalveGivenDay == 0 || MIS_Sarah_BadHabit_SalveGivenDay + 1 < Wld_GetDay_Shifted(8))	{
		AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_02");	//Лучше не спрашивай.
	}
	//мазь подействовала
	else	{
		AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_03");	//Кажется, отпустило. По крайней мере, мне уже не хочется повеситься на ближайшем суку.
		AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_04");	//Но мне постоянно не хватает дыхания. Даже говорить тяжело, не то что дышать огнем.
		AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_05");	//Как я теперь буду выступать? Это было единственное, что позволяло мне держаться на плаву в этой трясине.
			AI_Output(other,self,"DIA_Nadja_Sarah_HowAreU_16_06");	//Прости, но ты сама довела себя. Если бы ты столько не курила, лечиться было бы проще!
		//если не просили деньги за зелье
		if (MIS_Sarah_BadHabit_NadjaPrize == MIS_Sarah_BadHabit_NadjaPrize_Thanks)	{
			AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_07");	//Ладно, ты права. Я знаю, что ты хотела мне помочь и ничего не просила взамен.
			AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_08");	//Похоже, хоть кто-то бы плакал, если бы я сыграла в ящик.
			AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_09");	//У меня есть кое-какие сбережения, которые помогут мне выжить.
			AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_10");	//Заходи как-нибудь просто так. Но сейчас я хочу побыть одна.
			B_LogEntry_Status(TOPIC_Sarah_BadHabit,LOG_SUCCESS,TOPIC_Sarah_BadHabit_SuccessFriendly);
		}
		else	{	//иначе - все сбережения Надя отдала нам
			AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_11");	//Да лучше бы я от этого сдохла! Никто бы не плакал, разве что Бромор о потерянных денежках.
			AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_12");	//А теперь он заставит меня отрабатывать их по полной!
				AI_Output(other,self,"DIA_Nadja_Sarah_HowAreU_16_13");	//Я могу помочь...
			AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_14");	//Я сыта по горло твоей помощью. Исчезни с глаз моих.
			B_LogEntry_Status(TOPIC_Sarah_BadHabit,LOG_SUCCESS,TOPIC_Sarah_BadHabit_SuccessAngry);
			B_GivePlayerXP(XP_Sarah_BadHabit_Success);
		};
		MIS_Sarah_BadHabit = LOG_SUCCESS;
		AI_StopProcessInfos(self);
	};
};
//===================================================
instance DIA_Nadja_Sarah_LiveMeAlone(C_Info)
{
	npc = VLK_435_Nadja;			nr = 13;
	condition = DIA_Nadja_Sarah_LiveMeAlone_Cond;
	information = DIA_Nadja_Sarah_LiveMeAlone_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Nadja_Sarah_LiveMeAlone_Cond()
{
	if (C_HeroIs_Sarah() && DIA_WhenAsked_cond()
		&& (MIS_Sarah_BadHabit == LOG_SUCCESS))	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_LiveMeAlone_Info()
{
	AI_Output(self,other,"DIA_Nadja_Sarah_LiveMeAlone_16_01");	//Оставь меня.
	AI_StopProcessInfos(self);
};



/////////////////////////////// ОСТАЛЬНЫЕ //////////////////////////////////
//===================================================
instance DIA_Nadja_GiveJoint(C_Info)
{
	npc = VLK_435_Nadja;			nr = 50;
	condition = DIA_Nadja_GiveJoint_Cond;
	information = DIA_Nadja_GiveJoint_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Nadja_GiveJoint_Cond()
{
	if (!C_HeroIs_Sarah() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};

func void DIA_Nadja_GiveJoint_Info()
{
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Nadja_GiveJoint_17_00m");	//(хрипло) Привет, красавчик! Не найдется косячка для девушки?
	}
	else	{
		AI_Output(self,other,"DIA_Nadja_GiveJoint_17_00f");	//(хрипло) Эй, подруга! Не найдется косячка?
	};
	Info_ClearChoices(DIA_Nadja_GiveJoint);
	Info_AddChoice(DIA_Nadja_GiveJoint,"Нет.",DIA_Nadja_GiveJoint_No);
	if (Npc_HasItems(other,ItMi_Joint))	{
		Info_AddChoice(DIA_Nadja_GiveJoint,"Держи.",DIA_Nadja_GiveJoint_Yes);
	};
};
func void DIA_Nadja_GiveJoint_Yes()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Nadja_GiveJoint_Yes_03_02");	//Держи.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Nadja_GiveJoint_Yes_07_02");	//Держи.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Nadja_GiveJoint_Yes_10_02");	//Держи.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Nadja_GiveJoint_Yes_14_02");	//Держи.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Nadja_GiveJoint_Yes_16_02");	//Держи.
	};
	B_GiveInvItems(other,self,ItMi_Joint,1);
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Nadja_GiveJoint_Yes_17_03m");	//Ммм, спасибо! Ты заходи к нам, на огонек...
	}
	else	{
		AI_Output(self,other,"DIA_Nadja_GiveJoint_Yes_17_03f");	//Ай, спасибо! 
	};
	Info_ClearChoices(DIA_Nadja_GiveJoint);
	AI_StopProcessInfos(self);
};
func void DIA_Nadja_GiveJoint_No()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Nadja_GiveJoint_No_03_02");	//Нет.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Nadja_GiveJoint_No_07_02");	//Нет.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Nadja_GiveJoint_No_10_02");	//Нет.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Nadja_GiveJoint_No_14_02");	//Нет.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Nadja_GiveJoint_No_16_02");	//Нет.
	};
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Nadja_GiveJoint_No_17_03m");	//Ты заходи, если будет...
	}
	else	{
		AI_Output(self,other,"DIA_Nadja_GiveJoint_No_17_03f");	//Ну и катись куда шла!
	};
	Info_ClearChoices(DIA_Nadja_GiveJoint);
	AI_StopProcessInfos(self);
};

