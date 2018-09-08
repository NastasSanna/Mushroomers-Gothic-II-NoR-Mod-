
instance DIA_Thekla_EXIT(DIA_Proto_End)
{
	npc = BAU_913_Thekla;
};

/////////////////////////////////////// ЕЛЕНА /////////////////////////////////////////////

//===================================================
instance DIA_Thekla_Elena_Help(C_Info)
{
	npc = BAU_913_Thekla;				nr = 1;
	condition = DIA_Thekla_Elena_Help_Cond;
	information = DIA_Thekla_Elena_Help_Info;
	description = "Могу я тебе чем-нибудь помочь?";
};
func int DIA_Thekla_Elena_Help_Cond()
{
	if (C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Thekla_Elena_Help_Info()
{
		AI_Output(other,self,"DIA_Thekla_Elena_Help_16_00");	//Могу я тебе чем-нибудь помочь?
	AI_Output(self,other,"DIA_Thekla_Elena_Help_17_01");	//Хочешь постоять у плиты?
		AI_Output(other,self,"DIA_Thekla_Elena_Help_16_02");	//Нет... Не сейчас. Я участвую в грибном конкурсе Константино, мне нужно успеть собрать как можно больше грибов до конца недели.
	AI_Output(self,other,"DIA_Thekla_Elena_Help_17_03");	//Грибы, говоришь? Думаю, наши трудяги были бы рады грибному супу.
	AI_Output(self,other,"DIA_Thekla_Elena_Help_17_04");	//Может быть, ты и мне грибов принесешь?
		AI_Output(other,self,"DIA_Thekla_Elena_Help_16_05");	//Ты меня вообще слушаешь? Я собираю грибы на конкурс.
	AI_Output(self,other,"DIA_Thekla_Elena_Help_17_06");	//А я и не прошу у тебя чего-то сверхъестественного, что ценят господа-алхимики.
	AI_Output(self,other,"DIA_Thekla_Elena_Help_17_07");	//Десяток самых обычных красных болтунов. Конечно, ты можешь рассчитывать на самую большую порцию.
	B_LogEntry_Create(TOPIC_Elena_TheklaSoup,LOG_MISSION,TOPIC_Elena_TheklaSoup_NeedRedMr);
	MIS_Elena_TheklaSoup = LOG_Running;
};

//===================================================
instance DIA_Thekla_Elena_GiveMr(C_Info)
{
	npc = BAU_913_Thekla;				nr = 2;
	condition = DIA_Thekla_Elena_GiveMr_Cond;
	information = DIA_Thekla_Elena_GiveMr_Info;
	description = "Я принесла тебе грибы.";
};
func int DIA_Thekla_Elena_GiveMr_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_KnowsInfo(other,DIA_Thekla_Elena_Help) && (Npc_HasItems(other,ItMr_Red) >= 10))	{
		return TRUE;
	};
};
func void DIA_Thekla_Elena_GiveMr_Info()
{
		AI_Output(other,self,"DIA_Thekla_Elena_GiveMr_16_00");	//Я принесла тебе грибы.
	AI_Output(self,other,"DIA_Thekla_Elena_GiveMr_17_01");	//Отлично! Завтра у нас будет грибной супчик.
	Thekla_MrSoup_Day = Wld_GetDay() + 1;
	B_LogEntry(TOPIC_Elena_TheklaSoup,TOPIC_Elena_TheklaSoup_MrGiven);
};

//===================================================
instance DIA_Thekla_Elena_MrSoup(C_Info)
{
	npc = BAU_913_Thekla;				nr = 3;
	condition = DIA_Thekla_Elena_MrSoup_Cond;
	information = DIA_Thekla_Elena_MrSoup_Info;
	description = "Где тут мой супчик?";
};
func int DIA_Thekla_Elena_MrSoup_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_KnowsInfo(other,DIA_Thekla_Elena_GiveMr) && (Wld_GetDay_Shifted(8) >= Thekla_MrSoup_Day))	{
		return TRUE;
	};
};
func void DIA_Thekla_Elena_MrSoup_Info()
{
		AI_Output(other,self,"DIA_Thekla_Elena_MrSoup_16_00");	//Где тут мой супчик?
	AI_Output(self,other,"DIA_Thekla_Elena_MrSoup_17_01");	//Вот, угощайся на здоровье.
	B_GiveInvItems(self,other,ItFo_MrSoup,1);
	B_LogEntry_Status(TOPIC_Elena_TheklaSoup,LOG_SUCCESS,TOPIC_Elena_TheklaSoup_GotSoup);
	MIS_Elena_TheklaSoup = LOG_SUCCESS;
};

/////////////////////////////////////// ВСЕ /////////////////////////////////////////////

//===================================================
instance DIA_Thekla_MR_Perm(C_Info)
{
	npc = BAU_913_Thekla;				nr = 20;
	condition = DIA_NoCond_cond;
	information = DIA_Thekla_MR_Perm_Info;
	description = "Угостишь меня?";
	permanent = TRUE;
};
func void DIA_Thekla_MR_Perm_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Thekla_MR_Perm_03_00");	//Угостишь меня?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Thekla_MR_Perm_07_00");	//Угостишь меня?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Thekla_MR_Perm_10_00");	//Угостишь меня?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Thekla_MR_Perm_14_00");	//Угостишь меня?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Thekla_MR_Perm_16_00");	//Угостишь меня?
	};
	if (C_HeroIs_Elena())	{
		if (Thekla_Feed_Day > Wld_GetDay())	{
			AI_Output(self,other,"DIA_Thekla_MR_Perm_17_01");	//Ты сегодня уже обедала. Хватит, а то потолстеешь!
		}
		else if (Wld_IsTime(22,0,9,0))	{
			AI_Output(self,other,"DIA_Thekla_MR_Perm_17_02");	//Сейчас ничего нет. Приходи днем.
		}
		else	{
			AI_Output(self,other,"DIA_Thekla_MR_Perm_17_03");	//Конечно, держи тарелку.
			B_GiveInvItems(self,other,ItFo_Stew,1);
			Thekla_Feed_Day = Wld_GetDay() + 1;
		};
	}
	else if (C_HeroIs_Till())	{
		if (Thekla_Feed_Day > Wld_GetDay())	{
			AI_Output(self,other,"DIA_Thekla_MR_Perm_17_04");	//Я тебя сегодня уже угощала. Имей совесть!
		}
		else if (Wld_IsTime(22,0,9,0))	{
			AI_Output(self,other,"DIA_Thekla_MR_Perm_17_02");	//Сейчас ничего нет. Приходи днем.
		}
		else	{
			AI_Output(self,other,"DIA_Thekla_MR_Perm_17_05");	//Тебя дома совсем не кормят, что ли?
			AI_Output(self,other,"DIA_Thekla_MR_Perm_17_06");	//Ладно, держи тарелку.
			B_GiveInvItems(self,other,ItFo_Stew,1);
			Thekla_Feed_Day = Wld_GetDay() + 1;
		};
	}
	else	{
		AI_Output(self,other,"DIA_Thekla_MR_Perm_17_07");	//С чего бы это?
	};
};

// Кулинарные изыски ===================================================
instance DIA_Thekla_AskRecipe(C_Info)
{
	npc = BAU_913_Thekla;				nr = 10;
	condition = DIA_Thekla_AskRecipe_cond;
	information = DIA_Thekla_AskRecipe_Info;
	description = "А у тебя есть рецепт блюда из дамских ушей?";
};
func int DIA_Thekla_AskRecipe_cond()
{
	if (MIS_Cookery == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Thekla_AskRecipe_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Thekla_AskRecipe_03_00");	//А у тебя есть рецепт блюда из дамских ушей?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Thekla_AskRecipe_07_00");	//А у тебя есть рецепт блюда из дамских ушей?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Thekla_AskRecipe_10_00");	//А у тебя есть рецепт блюда из дамских ушей?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Thekla_AskRecipe_14_00");	//А у тебя есть рецепт блюда из дамских ушей?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Thekla_AskRecipe_16_00");	//А у тебя есть рецепт блюда из дамских ушей?
	};
	AI_Output(self,other,"DIA_Thekla_AskRecipe_17_01");	//Из чего?! Из ушей?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Thekla_AskRecipe_03_02");	//Успокойся, это гриб такой, розовый.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Thekla_AskRecipe_07_02");	//Успокойся, это гриб такой, розовый.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Thekla_AskRecipe_10_02");	//Успокойся, это гриб такой, розовый.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Thekla_AskRecipe_14_02");	//Успокойся, это гриб такой, розовый.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Thekla_AskRecipe_16_02");	//Успокойся, это гриб такой, розовый.
	};
	AI_Output(self,other,"DIA_Thekla_AskRecipe_17_03");	//Ни разу такого не видела... А он точно съедобный? Подозрительный он какой-то...
	AI_Output(self,other,"DIA_Thekla_AskRecipe_17_04");	//Выясни наверняка, тогда и про рецепт подумать можно будет.
	B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_TheklaEatable);
};

// ===================================================
instance DIA_Thekla_TellEatable(C_Info)
{
	npc = BAU_913_Thekla;				nr = 11;
	condition = DIA_Thekla_TellEatable_cond;
	information = DIA_Thekla_TellEatable_Info;
	description = "Алхимик Константино сказал, что грибы-уши можно есть.";
};
func int DIA_Thekla_TellEatable_cond()
{
	if ((MIS_Cookery == LOG_Running)
		 && MIS_Cookery_ConstantinoAsked && Npc_KnowsInfo(other,DIA_Thekla_AskRecipe))	{
		return TRUE;
	};
};
func void DIA_Thekla_TellEatable_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Thekla_TellEatable_03_00");	//Алхимик Константино сказал, что грибы-уши можно есть.
		AI_Output(other,self,"DIA_Thekla_TellEatable_03_01");	//Но их надо вымачивать в холодной воде три раза по три часа.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Thekla_TellEatable_07_00");	//Алхимик Константино сказал, что грибы-уши можно есть.
		AI_Output(other,self,"DIA_Thekla_TellEatable_07_01");	//Но их надо вымачивать в холодной воде три раза по три часа.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Thekla_TellEatable_10_00");	//Алхимик Константино сказал, что грибы-уши можно есть.
		AI_Output(other,self,"DIA_Thekla_TellEatable_10_01");	//Но их надо вымачивать в холодной воде три раза по три часа.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Thekla_TellEatable_14_00");	//Алхимик Константино сказал, что грибы-уши можно есть.
		AI_Output(other,self,"DIA_Thekla_TellEatable_14_01");	//Но их надо вымачивать в холодной воде три раза по три часа.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Thekla_TellEatable_16_00");	//Алхимик Константино сказал, что грибы-уши можно есть.
		AI_Output(other,self,"DIA_Thekla_TellEatable_16_02");	//Но их надо вымачивать в холодной воде три раза по три часа.
	};
	AI_Output(self,other,"DIA_Thekla_TellEatable_17_03");	//Ох, возни-то сколько! Ладно, давай твои... уши. Штуки 3 для пробы хватит.
	B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_TheklaNeed3);
};
// ===================================================
instance DIA_Thekla_TryCook(C_Info)
{
	npc = BAU_913_Thekla;				nr = 12;
	condition = DIA_Thekla_TryCook_cond;
	information = DIA_Thekla_TryCook_Info;
	description = "Возьми грибы. (отдать 3 дамских ушка)";
	permanent = TRUE;
};
func int DIA_Thekla_TryCook_cond()
{
	if ((MIS_Cookery == LOG_Running) && Npc_KnowsInfo(other,DIA_Thekla_TellEatable) && Npc_HasItems(other,ItMr_LadysEar)
		 && MIS_Cookery_ConstantinoAsked && (MIS_Cookery_TheklaTime == 0))	{
		return TRUE;
	};
};
func void DIA_Thekla_TryCook_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Thekla_TryCook_03_00");	//Возьми грибы.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Thekla_TryCook_07_00");	//Возьми грибы.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Thekla_TryCook_10_00");	//Возьми грибы.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Thekla_TryCook_14_00");	//Возьми грибы.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Thekla_TryCook_16_00");	//Возьми грибы.
	};
	if (Npc_HasItems(other,ItMr_LadysEar) >= 3)	{
		B_GiveInvItems(other,self,ItMr_LadysEar,3);
		AI_Output(self,other,"DIA_Thekla_TryCook_17_01");	//Приходи завтра после полудня, попробую что-нибудь состряпать.
		B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_TheklaTry);
		MIS_Cookery_TheklaTime = ((Wld_GetDay() + 1) * 24 + 12) * 60;
	}
	else	{
		AI_Output(self,other,"DIA_Thekla_TryCook_17_02");	//Мне нужно три штуки.
	};
};
// ===================================================
instance DIA_Thekla_EarsReady(C_Info)
{
	npc = BAU_913_Thekla;				nr = 13;
	condition = DIA_Thekla_EarsReady_cond;
	information = DIA_Thekla_EarsReady_Info;
	description = "Ну как, уши готовы?";
};
func int DIA_Thekla_EarsReady_cond()
{
	if ((MIS_Cookery == LOG_Running)
		 && (MIS_Cookery_TheklaTime > 0) && (MIS_Cookery_TheklaTime < Wld_GetFullTime()))	{
		return TRUE;
	};
};
func void DIA_Thekla_EarsReady_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Thekla_EarsReady_03_00");	//Ну как, уши готовы?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Thekla_EarsReady_07_00");	//Ну как, уши готовы?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Thekla_EarsReady_10_00");	//Ну как, уши готовы?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Thekla_EarsReady_14_00");	//Ну как, уши готовы?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Thekla_EarsReady_16_00");	//Ну какК, уши готовы?
	};
	AI_Output(self,other,"DIA_Thekla_EarsReady_17_01");	//Готовы. (улыбается) Бодо, когда в сковородку заглянул, аж подпрыгнул.
	AI_Output(self,other,"DIA_Thekla_EarsReady_17_02");	//А на вкус ничего получилось. Вот, я рецепт записала.
	B_GiveInvItems(self,other,ItWr_EarRecipe_Thekla,1);
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Thekla_EarsReady_03_03");	//Спасибо. А попробовать можно?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Thekla_EarsReady_07_03");	//Спасибо. А попробовать можно?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Thekla_EarsReady_10_03");	//Спасибо. А попробовать можно?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Thekla_EarsReady_14_03");	//Спасибо. А попробовать можно?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Thekla_EarsReady_16_03");	//Спасибо. А попробовать можно?
	};
	AI_Output(self,other,"DIA_Thekla_EarsReady_17_04");	//Конечно. Держи, последняя порция тебя ждала.
	B_GiveInvItems(self,other,ItFo_FriedEars,1);
	B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_TheklaReady);
};

