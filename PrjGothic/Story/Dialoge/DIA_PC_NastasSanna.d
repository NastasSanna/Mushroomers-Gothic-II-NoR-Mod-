
instance DIA_NastasSanna_EXIT(DIA_Proto_End)
{
	npc = PC_NastasSanna;
};

//=====================================================
instance DIA_NastasSanna_Found1(C_INFO)
{
	npc = PC_NastasSanna;
	nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_NastasSanna_Found1_info;
	important = TRUE;
};
func void DIA_NastasSanna_Found1_info()
{
	ADMIS_NS_Found = 1;
	AI_Output(self,other,"DIA_NastasSanna_Found1_19_00");	//О, вы нашли меня. А я думала, сюда никто не полезет...
	AI_Output(self,other,"DIA_NastasSanna_Found1_19_01");	//Придется перепрятаться.
	B_StartOtherRoutine(self,"HIDE2");
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
};

//=====================================================
instance DIA_NastasSanna_Found2(C_INFO)
{
	npc = PC_NastasSanna;
	nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_NastasSanna_Found2_info;
	important = TRUE;
};
func void DIA_NastasSanna_Found2_info()
{
	ADMIS_NS_Found = 2;
	AI_Output(self,other,"DIA_NastasSanna_Found2_19_00");	//Хм, вы снова меня нашли. Где же на этом острове можно спокойно поработать?
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_StartOtherRoutine(self,"HIDE3");
};

//=====================================================
instance DIA_NastasSanna_Found3(C_INFO)
{
	npc = PC_NastasSanna;
	nr = 3;
	condition = DIA_NoCond_cond;
	information = DIA_NastasSanna_Found3_info;
	important = TRUE;
};
func void DIA_NastasSanna_Found3_info()
{
	ADMIS_NS_Found = 3;
	var int x; x = 0;
	AI_Output(self,other,"DIA_NastasSanna_Found3_19_00");	//Похоже, от вас нигде не скроешься.
	AI_Output(self,other,"DIA_NastasSanna_Found3_19_01");	//А я, пока бегала, растеряла скрипты по всей локации.
	AI_Output(self,other,"DIA_NastasSanna_Found3_19_02");	//Помогите-ка найти! Не хватает 7 скриптов.
	AI_Output(self,other,"DIA_NastasSanna_Found3_19_03");	//Да, чтобы быстрее вернуться ко мне, используйте вот это.
	x = 1;	if (x==1)	{
		B_GiveInvItems(self,other,ItWr_Script_Teleport,1);
	};
};

//=====================================================
instance DIA_NastasSanna_Scripts(C_INFO)
{
	npc = PC_NastasSanna;
	nr = 4;
	condition = DIA_NastasSanna_Scripts_cond;
	information = DIA_NastasSanna_Scripts_info;
	permanent = TRUE;
	description = "(отдать скрипты)";
};
func int DIA_NastasSanna_Scripts_cond()
{
	if ((Npc_HasItems(other, ItWr_Script1) || Npc_HasItems(other, ItWr_Script2) 
		|| Npc_HasItems(other, ItWr_Script3) || Npc_HasItems(other, ItWr_Script4) 
		|| Npc_HasItems(other, ItWr_Script5) || Npc_HasItems(other, ItWr_Script6) 
		|| Npc_HasItems(other, ItWr_Script7)) && (NastasSanna_Scripts_Cnt < 7))
	{	return TRUE;	};
};
func void DIA_NastasSanna_Scripts_info()
{
	var int rnd;	rnd = Hlp_Random(30);
	if ((rnd < 10) || (NastasSanna_Scripts_Cnt == 0))	{ 
		AI_Output(self,other,"DIA_NastasSanna_Scripts_19_00");	//Чудно.
	}
	else if (rnd < 20)	{
		AI_Output(self,other,"DIA_NastasSanna_Scripts_19_01");	//Замечательно.
	}
	else	{
		AI_Output(self,other,"DIA_NastasSanna_Scripts_19_02");	//Прелестно.
	};
	if (Npc_HasItems(other, ItWr_Script1))	{
		Npc_RemoveInvItem(other, ItWr_Script1);
		NastasSanna_Scripts_Cnt += 1;
	};
	if (Npc_HasItems(other, ItWr_Script2))	{
		Npc_RemoveInvItem(other, ItWr_Script2);
		NastasSanna_Scripts_Cnt += 1;
	};
	if (Npc_HasItems(other, ItWr_Script3))	{
		Npc_RemoveInvItem(other, ItWr_Script3);
		NastasSanna_Scripts_Cnt += 1;
	};
	if (Npc_HasItems(other, ItWr_Script4))	{
		Npc_RemoveInvItem(other, ItWr_Script4);
		NastasSanna_Scripts_Cnt += 1;
	};
	if (Npc_HasItems(other, ItWr_Script5))	{
		Npc_RemoveInvItem(other, ItWr_Script5);
		NastasSanna_Scripts_Cnt += 1;
	};
	if (Npc_HasItems(other, ItWr_Script6))	{
		Npc_RemoveInvItem(other, ItWr_Script6);
		NastasSanna_Scripts_Cnt += 1;
	};
	if (Npc_HasItems(other, ItWr_Script7))	{
		Npc_RemoveInvItem(other, ItWr_Script7);
		NastasSanna_Scripts_Cnt += 1;
	};
	if (NastasSanna_Scripts_Cnt >= 7)	{
		AI_Output(self,other,"DIA_NastasSanna_Scripts_19_03");	//Наконец-то, все скрипты на месте!
		AI_Output(self,other,"DIA_NastasSanna_Scripts_19_04");	//А это вам.
		
		AI_Output(other,self,"XXX");
		//след. уровень сразу
		LevelUp();
	};
};
//=====================================================
instance DIA_NastasSanna_HowManyScripts(C_INFO)
{
	npc = PC_NastasSanna;
	nr = 5;
	condition = DIA_NastasSanna_HowManyScripts_cond;
	information = DIA_NastasSanna_HowManyScripts_info;
	permanent = TRUE;
	description = "Сколько еще нужно найти скриптов?";
};
func int DIA_NastasSanna_HowManyScripts_cond()
{
	if ((NastasSanna_Scripts_Cnt < 7) && Npc_KnowsInfo(other,DIA_NastasSanna_Found3))
	{	return TRUE;	};
};
func void DIA_NastasSanna_HowManyScripts_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_NastasSanna_HowManyScripts_03_00");	//Сколько еще нужно найти скриптов?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_NastasSanna_HowManyScripts_07_00");	//Сколько еще нужно найти скриптов?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_NastasSanna_HowManyScripts_10_00");	//Сколько еще нужно найти скриптов?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_NastasSanna_HowManyScripts_14_00");	//Сколько еще нужно найти скриптов?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_NastasSanna_HowManyScripts_16_00");	//Сколько еще нужно найти скриптов?
	};

	if (NastasSanna_Scripts_Cnt == 0)	{
		AI_Output(self,other,"DIA_NastasSanna_HowManyScripts_19_01");	//Семь.
	}
	else	if (NastasSanna_Scripts_Cnt == 1)	{
		AI_Output(self,other,"DIA_NastasSanna_HowManyScripts_19_02");	//Шесть.
	}
	else	if (NastasSanna_Scripts_Cnt == 2)	{
		AI_Output(self,other,"DIA_NastasSanna_HowManyScripts_19_03");	//Пять.
	}
	else	if (NastasSanna_Scripts_Cnt == 3)	{
		AI_Output(self,other,"DIA_NastasSanna_HowManyScripts_19_04");	//Четыре.
	}
	else	if (NastasSanna_Scripts_Cnt == 4)	{
		AI_Output(self,other,"DIA_NastasSanna_HowManyScripts_19_05");	//Три.
	}
	else	if (NastasSanna_Scripts_Cnt == 5)	{
		AI_Output(self,other,"DIA_NastasSanna_HowManyScripts_19_06");	//Два.
	}
	else	if (NastasSanna_Scripts_Cnt == 6)	{
		AI_Output(self,other,"DIA_NastasSanna_HowManyScripts_19_07");	//Всего один.
	};
};

//=====================================================
instance DIA_NastasSanna_WhatIsScript(C_INFO)
{
	npc = PC_NastasSanna;
	nr = 6;
	condition = DIA_NastasSanna_WhatIsScript_cond;
	information = DIA_NastasSanna_WhatIsScript_info;
	permanent = TRUE;
	description = "А что такое скрипт?";
};
func int DIA_NastasSanna_WhatIsScript_cond()
{
	if (Npc_KnowsInfo(other,DIA_NastasSanna_Found3))	{
		return TRUE;
	};
};
func void DIA_NastasSanna_WhatIsScript_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_NastasSanna_WhatIsScript_03_00");	//А что такое скрипт?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_NastasSanna_WhatIsScript_07_00");	//А что такое скрипт?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_NastasSanna_WhatIsScript_10_00");	//А что такое скрипт?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_NastasSanna_WhatIsScript_14_00");	//А что такое скрипт?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_NastasSanna_WhatIsScript_16_00");	//А что такое скрипт?
	};
	AI_Output(self,other,"DIA_NastasSanna_WhatIsScript_19_01");	//О, это моя страсть и гордость - особый вид магии, свитки на языке, неизвестном большинству людей и даже магов.
	AI_Output(self,other,"DIA_NastasSanna_WhatIsScript_19_02");	//Он называется Дедалус. И лишь единицы постигли его диалекты - Икарус и ЛеГо.
	AI_Output(self,other,"DIA_NastasSanna_WhatIsScript_19_03");	//Я изучала эти языки на просторах worldofplayers.ru, worldofplayers.de и magic-team.net.ru. 
	AI_Output(self,other,"DIA_NastasSanna_WhatIsScript_19_04");	//Там, и в других далеких краях, можно встретить многих мастеров скриптописания, а также моделеров, вобберов, писателей, поэтов, художников, музыкантов и просто хороших людей.
	AI_Output(self,other,"DIA_NastasSanna_WhatIsScript_19_05");	//И любой желающий, наделенный упорством и терпением, может присоединиться к их числу.
};

//=====================================================
instance DIA_NastasSanna_WhatAUDoing(C_INFO)
{
	npc = PC_NastasSanna;
	nr = 7;
	condition = DIA_NastasSanna_WhatAUDoing_cond;
	information = DIA_NastasSanna_WhatAUDoing_info;
	permanent = TRUE;
	description = "Чем ты занимаешься?";
};
func int DIA_NastasSanna_WhatAUDoing_cond()
{
	return TRUE;
};
func void DIA_NastasSanna_WhatAUDoing_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_03_00");	//Чем ты занимаешься?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_07_00");	//Чем ты занимаешься?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_10_00");	//Чем ты занимаешься?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_14_00");	//Чем ты занимаешься?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_16_00");	//Чем ты занимаешься?
	};
	AI_Output(self,other,"DIA_NastasSanna_WhatAUDoing_19_01");	//Сейчас - изучаю движение Солнца и Луны. Небесные светила на Хоринисе всегда удивляли меня.
	Info_ClearChoices(DIA_NastasSanna_WhatAUDoing);
	Info_AddChoice(DIA_NastasSanna_WhatAUDoing,"Понятно.",DIA_NastasSanna_WhatAUDoing_Clear);
	Info_AddChoice(DIA_NastasSanna_WhatAUDoing,"А что с ними не так?",DIA_NastasSanna_WhatAUDoing_WhatsWrong);
};

func void DIA_NastasSanna_WhatAUDoing_Clear()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_Clear_03_00");	//Понятно.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_Clear_07_00");	//Понятно.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_Clear_10_00");	//Понятно.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_Clear_14_00");	//Понятно.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_Clear_16_00");	//Понятно.
	};
	Info_ClearChoices(DIA_NastasSanna_WhatAUDoing);
};

func void DIA_NastasSanna_WhatAUDoing_WhatsWrong()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_03_00");	//А что с ними не так?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_07_00");	//А что с ними не так?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_10_00");	//А что с ними не так?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_14_00");	//А что с ними не так?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_16_00");	//А что с ними не так?
	};
	AI_Output(self,other,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_19_01");	//Ну, во-первых, они движутся не так, как на материке. Встают по правую руку от зенита, а садятся по левую.
	AI_Output(self,other,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_19_02");	//Такое движение светил наблюдается в южных широтах, и это не так уж удивительно.
	AI_Output(self,other,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_19_03");	//Настоящая загадка связана с полуденным солнцем. Просто подними глаза к небу ровно в 12 часов, и все увидишь.
	AI_Output(self,other,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_19_04");	//Наблюдать это чудо можно лишь на Хоринисе и некоторых близлежащих землях... Я даже не надеюсь понять причину, просто хочу описать его.
	Info_ClearChoices(DIA_NastasSanna_WhatAUDoing);
};

//+++++++++++++++++++++++++++++++++++++++++++++++++++++

instance DIA_NastasSanna_Snow_EXIT(DIA_Proto_End)
{
	npc = PC_NastasSanna_Snow;
};

//=====================================================
instance DIA_NastasSanna_Snow_EmptyFrames(C_INFO)
{
	npc = PC_NastasSanna_Snow;	nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_NastasSanna_EmptyFrames_info;
	important = TRUE;
};
func void DIA_NastasSanna_EmptyFrames_info()
{
	AI_Output(self,other,"DIA_NastasSanna_EmptyFrames_19_00");	//Вам, наверное, интересно, почему некоторые рамки пустые?
	AI_Output(self,other,"DIA_NastasSanna_EmptyFrames_19_01");	//Просто не всем актерам охота было спокойно висеть на стенке, некоторые решили погулять по острову. 
	AI_Output(self,other,"DIA_NastasSanna_EmptyFrames_19_02");	//Да и мне тут сидеть недосуг.
	AI_StopProcessInfos(self);
};
