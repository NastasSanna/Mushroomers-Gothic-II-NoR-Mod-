
instance DIA_Elvrich_EXIT(DIA_Proto_End)
{
	npc = VLK_4302_Addon_Elvrich;
};
//===================================================
instance DIA_Elvrich_InPuff(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 1;
	condition = DIA_Elvrich_InPuff_Cond;
	information = DIA_Elvrich_InPuff_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Elvrich_InPuff_Cond()
{
	if (Npc_IsInState(self,ZS_Talk) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_HABOUR_PUFF_PECK") && !Npc_KnowsInfo(other,DIA_Elvrich_ToldThorben))
	{
		return TRUE;
	};
};
func void DIA_Elvrich_InPuff_Info()
{
	AI_Output(self,other,"DIA_Elvrich_InPuff_09_01");	//Извини, я сейчас немного занят...
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Elvrich_WhatAUDoing(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 2;
	condition = DIA_Elvrich_WhatAUDoing_Cond;
	information = DIA_Elvrich_WhatAUDoing_Info;
	description = "Чем ты занимаешься?";
};
func int DIA_Elvrich_WhatAUDoing_Cond()
{
	return TRUE;
};
func void DIA_Elvrich_WhatAUDoing_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Elvrich_WhatAUDoing_03_00");	//Чем ты занимаешься?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Elvrich_WhatAUDoing_07_00");	//Чем ты занимаешься?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Elvrich_WhatAUDoing_10_00");	//Чем ты занимаешься?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Elvrich_WhatAUDoing_14_00");	//Чем ты занимаешься?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Elvrich_WhatAUDoing_16_00");	//Чем ты занимаешься?
	};
	AI_Output(self,other,"DIA_Elvrich_WhatAUDoing_09_01");	//Я ученик плотника Торбена.
	AI_Output(self,other,"DIA_Elvrich_WhatAUDoing_09_02");	//Но сейчас я просто пилю бревна и мету опилки целыми днями.
	AI_Output(self,other,"DIA_Elvrich_WhatAUDoing_09_03");	//Вообще-то, дядя... то есть мастер Торбен велел мне изготовить кровать. Для себя.
	AI_Output(self,other,"DIA_Elvrich_WhatAUDoing_09_04");	//Недавно к нам переехала кузина и Торбен отдал мою кровать ей.
	AI_Output(self,other,"DIA_Elvrich_WhatAUDoing_09_05");	//Но мне и так неплохо.
};
//===================================================
instance DIA_Elvrich_WhereAUSleep(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 3;
	condition = DIA_Elvrich_WhereAUSleep_Cond;
	information = DIA_Elvrich_WhereAUSleep_Info;
	description = "Где же ты спишь?";
};
func int DIA_Elvrich_WhereAUSleep_Cond()
{
	if (Npc_KnowsInfo(other,DIA_Elvrich_WhatAUDoing))
	{
		return TRUE;
	};
};
func void DIA_Elvrich_WhereAUSleep_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Elvrich_WhereAUSleep_03_00");	//Где же ты спишь?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Elvrich_WhereAUSleep_07_00");	//Где же ты спишь?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Elvrich_WhereAUSleep_10_00");	//Где же ты спишь?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Elvrich_WhereAUSleep_14_00");	//Где же ты спишь?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Elvrich_WhereAUSleep_16_00");	//Где же ты спишь?
	};
	AI_Output(self,other,"DIA_Elvrich_WhereAUSleep_09_01");	//(уклончиво) Ну, в этом городе много мест, где можно прикорнуть...
};
//===================================================
instance DIA_Elvrich_BedIsReady(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 4;
	condition = DIA_Elvrich_BedIsReady_Cond;
	information = DIA_Elvrich_BedIsReady_Info;
	permanent = TRUE;
	description = "Ну как, кровать готова?";
};
func int DIA_Elvrich_BedIsReady_Cond()
{
	if (Npc_KnowsInfo(other,DIA_Elvrich_WhatAUDoing))
	{
		return TRUE;
	};
};
func void DIA_Elvrich_BedIsReady_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Elvrich_BedIsReady_03_00");	//Ну как, кровать готова?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Elvrich_BedIsReady_07_00");	//Ну как, кровать готова?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Elvrich_BedIsReady_10_00");	//Ну как, кровать готова?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Elvrich_BedIsReady_14_00");	//Ну как, кровать готова?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Elvrich_BedIsReady_16_00");	//Ну как, кровать готова?
	};
	AI_Output(self,other,"DIA_Elvrich_BedIsReady_09_01");	//(смеется) Еще нет! И не скоро будет.
};
//===================================================
instance DIA_Elvrich_USleepInPuff(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Elvrich_USleepInPuff_Cond;
	information = DIA_Elvrich_USleepInPuff_Info;
	description = "Так значит, ты ночуешь в борделе?";
};
func int DIA_Elvrich_USleepInPuff_Cond()
{
	if (Npc_KnowsInfo(other,DIA_Elvrich_InPuff) && Npc_KnowsInfo(other,DIA_Elvrich_WhereAUSleep))
	{
		return TRUE;
	};
};
func void DIA_Elvrich_USleepInPuff_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_03_00");	//Так значит, ты ночуешь в...
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_07_00");	//Так значит, ты ночуешь в...
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_10_00");	//Так значит, ты ночуешь в...
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_14_00");	//Так значит, ты ночуешь в...
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_16_00");	//Так значит, ты ночуешь в...
	};
	if (Npc_GetDistToNpc(self,VLK_462_Thorben) < PERC_DIST_ACTIVE_MAX)	{
		AI_Output(self,other,"DIA_Elvrich_USleepInPuff_09_01");	//Тише! Не надо об этом кричать.
		AI_TurnToNpc(self,VLK_462_Thorben);
		AI_TurnToNpc(self,other);
	}
	else	{
		AI_Output(self,other,"DIA_Elvrich_USleepInPuff_09_03");	//(перебивает) Да, и что с того?
	};
	AI_Output(self,other,"DIA_Elvrich_USleepInPuff_09_04");	//Но я хожу туда не ради развлечения.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_03_05");	//А для чего же?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_07_05");	//А для чего же?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_10_05");	//А для чего же?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_14_05");	//А для чего же?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_16_05");	//А для чего же?
	};
	AI_Output(self,other,"DIA_Elvrich_USleepInPuff_09_06");	//Я люблю одну девушку и прихожу к ней на свидания.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_03_07");	//Ну если она там работает... Думаю не ты один ее любишь.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_07_07");	//Ну если она там работает... Думаю не ты один ее любишь.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_10_07");	//Ну если она там работает... Думаю не ты один ее любишь.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_14_07");	//Ну если она там работает... Думаю не ты один ее любишь.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_16_08");	//Она там... работает? И ты к ней приходишь...
	};
	AI_Output(self,other,"DIA_Elvrich_USleepInPuff_09_09");	//Ты не понимаешь! Я правда люблю ее! И мне все равно, чем она занимается.
	AI_Output(self,other,"DIA_Elvrich_USleepInPuff_09_10");	//Сейчас это единственная возможность видеться с ней. Но мы обязательно найдем способ быть вместе.
	AI_Output(self,other,"DIA_Elvrich_USleepInPuff_09_11");	//Прошу, только не рассказывай моему дяде. Он не поймет.
};
//===================================================
instance DIA_Elvrich_ToldThorben(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 6;
	condition = DIA_Elvrich_ToldThorben_Cond;
	information = DIA_Elvrich_ToldThorben_Info;
	important = TRUE;
};
func int DIA_Elvrich_ToldThorben_Cond()
{
	if (Npc_KnowsInfo(other,DIA_Thorben_ElvrichInPuff))
	{
		return TRUE;
	};
};
func void DIA_Elvrich_ToldThorben_Info()
{
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Elvrich_ToldThorben_09_00");	//Ты! Это иы рассказал дяде! Как ты мог так поступить со мной?
	}
	else	{
		AI_Output(self,other,"DIA_Elvrich_ToldThorben_09_00b");	//Ты! Ты все же рассказала дяде! Как ты могла?
	};
	AI_Output(self,other,"DIA_Elvrich_ToldThorben_09_01");	//Не подходи ко мне больше. Видеть тебя не хочу.
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Elvrich_StopTalk(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 7;
	condition = DIA_Elvrich_StopTalk_Cond;
	information = DIA_Elvrich_StopTalk_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Elvrich_StopTalk_Cond()
{
	if (Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Elvrich_ToldThorben))
	{
		return TRUE;
	};
};
func void DIA_Elvrich_StopTalk_Info()
{
	AI_Output(self,other,"DIA_Elvrich_StopTalk_09_00");	//Уйди! Я не желаю с тобой разговаривать.
	AI_StopProcessInfos(self);
};

