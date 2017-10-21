
instance DIA_Sagitta_EXIT(DIA_Proto_End)
{
	npc = OUT_1203_Sagitta;
};

// ОБЩИЕ ==================================================================
var int DIA_Sagitta_OnHello;
instance DIA_Sagitta_Hello(C_Info)
{
	npc = OUT_1203_Sagitta;			nr = 1;
	condition = DIA_Sagitta_MR_Hello_cond;
	information = DIA_Sagitta_MR_Hello_info;
	important = TRUE;
};
func int DIA_Sagitta_MR_Hello_cond()
{
	if ((Npc_IsInState(self,ZS_Talk) == TRUE) &&
			!Npc_KnowsInfo(other,DIA_Sagitta_Till_CrossCome))	{
		return TRUE;
	};
};
func void DIA_Sagitta_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Sagitta_MR_Hello_17_00");	//Здравствуй! Что у тебя болит?
	Info_ClearChoices(DIA_Sagitta_Hello);
	Info_AddChoice(DIA_Sagitta_Hello,"Ничего",DIA_Sagitta_Healthy);
	if (other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])	{
		if (other.aivar[AIV_Gender] == MALE)	{
			Info_AddChoice(DIA_Sagitta_Hello,"Я ранен.",DIA_Sagitta_HealMe_Info);
		}
		else	{
			Info_AddChoice(DIA_Sagitta_Hello,"Я ранена.",DIA_Sagitta_HealMe_Info);
		};
	};
	if ((POISON_Foggy_Timer > 0) || (POISON_DrgTears_Timer > 0))	{
		if (other.aivar[AIV_Gender] == MALE)	{
			Info_AddChoice(DIA_Sagitta_Hello,"Я отравился грибами.",DIA_Sagitta_Poisoned_Info);
		}
		else	{
			Info_AddChoice(DIA_Sagitta_Hello,"Я отравилась грибами.",DIA_Sagitta_Poisoned_Info);
		};
	};
	DIA_Sagitta_OnHello = TRUE;
};

func void DIA_Sagitta_Healthy()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Sagitta_Healthy_03_00");	//Ничего.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Sagitta_Healthy_07_00");	//Ничего.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Sagitta_Healthy_10_00");	//Ничего.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Sagitta_Healthy_14_00");	//Ничего.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Sagitta_Healthy_16_00");	//Ничего.
	};
	AI_Output(self,other,"DIA_Sagitta_Healthy_17_01");	//Странно, обычно ко мне бегут, только если что-то болит.
	DIA_Sagitta_OnHello = FALSE;
	Info_ClearChoices(DIA_Sagitta_Hello);
};
func void DIA_Sagitta_MR_Hello_Injured()
{
};
//-----------------------------------------------
instance DIA_Sagitta_HealMe(C_Info)
{
	npc = OUT_1203_Sagitta;		nr = 50;
	condition = DIA_Sagitta_HealMe_cond;
	information = DIA_Sagitta_HealMe_info;
	description = "Я ранен.";
	permanent = TRUE;
};
func int DIA_Sagitta_HealMe_cond()
{
	if (other.aivar[AIV_Gender] == FEMALE)	{
		DIA_Sagitta_HealMe.description = "Я ранена.";
	};
	return TRUE;
};
func void DIA_Sagitta_HealMe_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Sagitta_HealMe_03_00");	//Я ранен.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Sagitta_HealMe_07_00");	//Я ранен.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Sagitta_HealMe_10_00");	//Я ранен.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Sagitta_HealMe_14_00");	//Я ранен.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Sagitta_HealMe_16_00");	//Я ранена.
	};
	if (DIA_Sagitta_OnHello)	{
		AI_Output(self,other,"DIA_Sagitta_HealMe_17_01");	//Конечно, ко мне бегут, только когда становится плохо.
	};
	if (other.attribute[ATR_HITPOINTS] == other.attribute[ATR_HITPOINTS_MAX])	{
		AI_Output(self,other,"DIA_Sagitta_HealMe_17_02");	//Да на тебе же ни царапинки! Что за шутки?
	}
	else	if (other.attribute[ATR_HITPOINTS] > other.attribute[ATR_HITPOINTS_MAX] / 2)	{
		AI_Output(self,other,"DIA_Sagitta_HealMe_17_03");	//Ничего, с этими царапинами моя мазь быстро справится.
		other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	}
	else	{
		AI_Output(self,other,"DIA_Sagitta_HealMe_17_04");	//Это серьезные раны. Придется потратить немного времени, чтобы привести тебя в порядок.
		AI_StopProcessInfos(self);
		DIA_Sagitta_OnHello = FALSE;
		Wait_AfterDia_M = other.attribute[ATR_HITPOINTS_MAX] - other.attribute[ATR_HITPOINTS] + Hlp_Random(10);	
		Sagitta_BigHeal = TRUE;
		return;
	};
	AI_StopProcessInfos(self);
	if (DIA_Sagitta_OnHello)	{
		DIA_Sagitta_OnHello = FALSE;
		Info_ClearChoices(DIA_Sagitta_Hello);
	};
};

//-----------------------------------------------
instance DIA_Sagitta_Poisoned(C_Info)
{
	npc = OUT_1203_Sagitta;			nr = 51;
	condition = DIA_Sagitta_Poisoned_cond;
	information = DIA_Sagitta_Poisoned_info;
	description = "Я отравился грибами.";
	permanent = TRUE;
};
func int DIA_Sagitta_Poisoned_cond()
{
	if ((POISON_Foggy_Timer > 0) || (POISON_DrgTears_Timer > 0))	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Sagitta_Poisoned.description = "Я отравилась грибами.";
		};
		return TRUE;
	};
};
func void DIA_Sagitta_Poisoned_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Sagitta_Poisoned_03_00");	//Я отравился грибами.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Sagitta_Poisoned_07_00");	//Я отравился грибами.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Sagitta_Poisoned_10_00");	//Я отравился грибами.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Sagitta_Poisoned_14_00");	//Я отравился грибами.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Sagitta_Poisoned_16_00");	//Я отравилась грибами.
	};
	if (DIA_Sagitta_OnHello)	{
		AI_Output(self,other,"DIA_Sagitta_Poisoned_17_01");	//Ну, конечно, ко мне бегут, только когда становится плохо.
	};
		AI_Output(self,other,"DIA_Sagitta_Poisoned_17_02");	//Что это был за гриб?
	if (POISON_DrgTears_Timer > 0)	{
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Sagitta_Poisoned_03_03");	//Как синие шарики на белой ножке. От него внутри все горит!
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Sagitta_Poisoned_07_03");	//Как синие шарики на белой ножке. От него внутри все горит!
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Sagitta_Poisoned_10_03");	//Драконовы слезы...
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Sagitta_Poisoned_14_03");	//Как синие шарики на белой ножке. От него внутри все горит!
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Sagitta_Poisoned_16_03");	//Как синие шарики на белой ножке. От него внутри все горит!
		};
		AI_Output(self,other,"DIA_Sagitta_Poisoned_17_04");	//Драконовы слезы! Так, быстро, выпей вот это!
		B_GiveInvItems(self,other,ItPo_MR_AntiDragTears,1);
		AI_UseItem(other,ItPo_MR_AntiDragTears);
		AI_Output(self,other,"DIA_Sagitta_Poisoned_17_05");	//В другой раз думай, что тянешь в рот!
	}
	else if (POISON_Foggy_Timer > 0)	{
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Sagitta_Poisoned_03_06");	//Такой белый гриб... Голова от него гудит все время.
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Sagitta_Poisoned_07_06");	//Туманник.
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Sagitta_Poisoned_10_06");	//Это был гриб белого цвета. У меня от него все плывет перед глазами.
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Sagitta_Poisoned_14_06");	//Такой белый гриб... Голова от него гудит все время.
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Sagitta_Poisoned_16_06");	//Такой белый гриб... Меня постоянно мутит из-за него.
		};
		AI_Output(self,other,"DIA_Sagitta_Poisoned_17_07");	//Так-так, туманник. Не смертельно, но крайне неприятно. Выпей-ка вот это.
		B_GiveInvItems(self,other,ItPo_MR_AntiFoggy,1);
		AI_UseItem(other,ItPo_MR_AntiFoggy);
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Sagitta_Poisoned_03_08");	//Фух, жарко!
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Sagitta_Poisoned_07_08");	//Фух, жарко!
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Sagitta_Poisoned_10_08");	//Фух, жарко!
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Sagitta_Poisoned_14_08");	//Фух, жарко!
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Sagitta_Poisoned_16_08");	//Ох, как жарко!
		};
		AI_Output(self,other,"DIA_Sagitta_Poisoned_17_09");	//Правильно. Тебе нужно хорошенько пропотеть. Лучше поспи пару часиков.
	};
	AI_StopProcessInfos(self);
	if (DIA_Sagitta_OnHello)	{
		DIA_Sagitta_OnHello = FALSE;
		Info_ClearChoices(DIA_Sagitta_Hello);
	};
};

// Кулинарные изыски ==================================================================
instance DIA_Sagitta_Recipe(C_Info)
{
	npc = OUT_1203_Sagitta;			nr = 2;
	condition = DIA_Sagitta_Recipe_cond;
	information = DIA_Sagitta_Recipe_info;
	description = "А ты знаешь какие-нибудь рецепты с дамским ушком?";
};
func int DIA_Sagitta_Recipe_cond()
{
	if (MIS_Cookery == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Sagitta_Recipe_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Sagitta_Recipe_03_00");	//А ты знаешь какие-нибудь рецепты с дамским ушком?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Sagitta_Recipe_07_00");	//А ты знаешь какие-нибудь рецепты с дамским ушком?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Sagitta_Recipe_10_00");	//А ты знаешь какие-нибудь рецепты с дамским ушком?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Sagitta_Recipe_14_00");	//А ты знаешь какие-нибудь рецепты с дамским ушком?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Sagitta_Recipe_16_00");	//А ты знаешь какие-нибудь рецепты с дамским ушком?
	};
	AI_Output(self,other,"DIA_Sagitta_Recipe_17_01");	//Рецепты? Дай-ка подумать...
	AI_Output(self,other,"DIA_Sagitta_Recipe_17_02");	//Рагу можно сделать с коричневым масляком. Масляков надо взять в два раза больше, чем ушек.
	AI_Output(self,other,"DIA_Sagitta_Recipe_17_03");	//Отвариваешь полчаса в крепко соленой воде, воду сливаешь. Потом грибы обжарить на сковороде. Специи по вкусу.
	MIS_Cookery_SagittaAsked = TRUE;
	B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_Sagitta);
};

// ТИЛЛ ================================================================
instance DIA_Sagitta_Till_CrossCome(C_Info)
{
	npc = OUT_1203_Sagitta;					nr = 10;
	condition = DIA_Sagitta_Till_CrossCome_cond;
	information = DIA_Sagitta_Till_CrossCome_info;
	important = TRUE;
};
func int DIA_Sagitta_Till_CrossCome_cond()
{
	if ((MIS_Till_Pet == LOG_Running)
			&& HasFlags(MIS_Till_Pet_BirthPlace,MIS_Till_Pet_BirthPlace_Sagitta)
			&& (Npc_GetDistToPlayer(Molerat_Cross) < PERC_DIST_INTERMEDIAT))	{
		return TRUE;
	};
};
func void DIA_Sagitta_Till_CrossCome_info()
{
	B_GivePlayerXP(XP_Till_SagittaFound);
	AI_TurnToNpc(other, Molerat_Cross);
		AI_Output(other,self,"DIA_Sagitta_Till_CrossCome_14_00");	//Крестик! Вот ты где! Ты чего убежал?
	AI_TurnToNpc(other, self);
		AI_Output(other,self,"DIA_Sagitta_Till_CrossCome_14_01");	//Что он тут делает? Он заболел?
	AI_Output(self,other,"DIA_Sagitta_Till_CrossCome_17_02");	//Ну, во-первых, не он, а она. Это девочка.
		AI_Output(other,self,"DIA_Sagitta_Till_CrossCome_14_03");	//(удивленно) Девочка?
	AI_Output(self,other,"DIA_Sagitta_Till_CrossCome_17_04");	//Да. А во-вторых, с ней все в порядке. Просто скоро у нее будут маленькие и она ищет место, где можно спокойно принести потомство.
	AI_Output(self,other,"DIA_Sagitta_Till_CrossCome_17_05");	//Похоже, моя пещера и моя солома ей приглянулась.
	B_StartOtherRoutine(self, "START");
	MIS_Till_Pet_Found = TRUE;
	MIS_Till_Pet_KnowLost = TRUE;
	B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_Female);
};
// ----------------------------------------------------------
instance DIA_Sagitta_Till_CrossWhatToDo(C_Info)
{
	npc = OUT_1203_Sagitta;				nr = 11;
	condition = DIA_Sagitta_Till_CrossWhatToDo_cond;
	information = DIA_Sagitta_Till_CrossWhatToDo_info;
	description = "И что мне с ней делать?";
};
func int DIA_Sagitta_Till_CrossWhatToDo_cond()
{
	if ((MIS_Till_Pet == LOG_Running)
			&& HasFlags(MIS_Till_Pet_BirthPlace,MIS_Till_Pet_BirthPlace_Sagitta)
			&& (Npc_KnowsInfo(other,DIA_Sagitta_Till_CrossCome)))	{
		return TRUE;
	};
};
func void DIA_Sagitta_Till_CrossWhatToDo_info()
{
		AI_Output(other,self,"DIA_Sagitta_Till_CrossWhatToDo_14_00");	//И что мне с ней делать?
	AI_Output(self,other,"DIA_Sagitta_Till_CrossWhatToDo_17_01");	//Ты можесшь оставить ее у меня. Или сам позаботься о роженице.
	Info_ClearChoices(DIA_Sagitta_Till_CrossWhatToDo);
	Info_AddChoice(DIA_Sagitta_Till_CrossWhatToDo,"Я сам!",DIA_Sagitta_Till_CrossWhatToDo_How);
	Info_AddChoice(DIA_Sagitta_Till_CrossWhatToDo,"Пусть лучше она останенся у тебя.",DIA_Sagitta_Till_CrossWhatToDo_Stay);
};
func void DIA_Sagitta_Till_CrossWhatToDo_Stay()
{
		AI_Output(other,self,"DIA_Sagitta_Till_CrossWhatToDo_Stay_14_00");	//Пусть лучше она останется у тебя. Ты лучше о ней позаботишься.
	AI_Output(self,other,"DIA_Sagitta_Till_CrossWhatToDo_Stay_17_01");	//Хорошо. Приходи навестить ее через несколько дней.
	Info_ClearChoices(DIA_Sagitta_Till_CrossWhatToDo);
	B_LogEntry_Status(TOPIC_Till_Pet,LOG_SUCCESS,TOPIC_Till_Pet_SagittaStay);
};
func void DIA_Sagitta_Till_CrossWhatToDo_How()
{
		AI_Output(other,self,"DIA_Sagitta_Till_CrossWhatToDo_How_14_00");	//Я сам! За ней столько присматривал, и с малышами справлюсь!
		AI_Output(other,self,"DIA_Sagitta_Till_CrossWhatToDo_How_14_01");	//Только скажи, что делать. Никогда раньше не видел, как родятся кротокрысята. Только овцы.
	AI_Output(self,other,"DIA_Sagitta_Till_CrossWhatToDo_How_17_02");	//В общем-то, тебе делать ничего не надо - природа все сделает сама.
	AI_Output(self,other,"DIA_Sagitta_Till_CrossWhatToDo_How_17_03");	//Только нужно найти ей безопасное место, какую-нибудь теплую сухую пещеру.
		AI_Output(other,self,"DIA_Sagitta_Till_CrossWhatToDo_How_14_04");	//Дай-ка подумать... Позади поместья Онара есть такая пещера.
		AI_Output(other,self,"DIA_Sagitta_Till_CrossWhatToDo_How_14_05");	//Только там гоблины поселились.
	AI_Output(self,other,"DIA_Sagitta_Till_CrossWhatToDo_How_17_06");	//Тогда тебе лучше их оттуда выселить.
	Info_ClearChoices(DIA_Sagitta_Till_CrossWhatToDo);
	Info_AddChoice(DIA_Sagitta_Till_CrossWhatToDo,"И как я справлюсь с оравой гоблинов?",DIA_Sagitta_Till_Gobbo_Cant);
	Info_AddChoice(DIA_Sagitta_Till_CrossWhatToDo,"Я с ними справлюсь.",DIA_Sagitta_Till_Gobbo_OK);
	B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_BirthPlace);
};
func void DIA_Sagitta_Till_Gobbo_OK()
{
		AI_Output(other,self,"DIA_Sagitta_Till_Gobbo_OK_14_00");	//Я с ними справлюсь.
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_OK_17_01");	//Желаю удачи.
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_OK_17_02");	//Только поторопись - детишки ждать не будут. Через несколько дней народятся.
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_OK_17_03");	//И еще - постели соломы на пол.
	Info_ClearChoices(DIA_Sagitta_Till_CrossWhatToDo);
	Wld_InsertItem(ItMi_Straw,"SP_STRAW_TILL");
};
func void DIA_Sagitta_Till_Gobbo_Cant()
{
	B_Spawn_BurnTea();
		AI_Output(other,self,"DIA_Sagitta_Till_Gobbo_Cant_14_00");	//И как я справлюсь с оравой гоблинов?
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_Cant_17_01");	//Так и быть, я тебе помогу.
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_Cant_17_02");	//Есть один цветок, горичай. Гоблины как огня боятся его запаха. Я варю из него отвар и обрызгиваю свою пещеру, так что эти воришки сюда носа не суют.
		AI_Output(other,self,"DIA_Sagitta_Till_Gobbo_Cant_14_03");	//Ты дашь мне этот отвар?
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_Cant_17_04");	//Дала бы, но у меня его не так много. Наберешь горичая - сварю.
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_Cant_17_05");	//Он растет только в одной долине. От фермы Лобарта поднимись в горы. Там возле озера есть вход в пещеру, она и выведет тебя в долину.
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_Cant_17_06");	//Для отвара нужно хотя бы три цветка. Они невысокие, но очень яркие, сине-оранжевые.
	Info_ClearChoices(DIA_Sagitta_Till_CrossWhatToDo);
	B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_BurnTea);
	MIS_Till_Pet_SearchBurnTea = TRUE;
	Wld_InsertItem(ItMi_Straw,"SP_STRAW_TILL");
};
// ----------------------------------------------------------
var int DIA_Sagitta_Till_Valley_Once;
instance DIA_Sagitta_Till_Valley(C_Info)
{
	npc = OUT_1203_Sagitta;				nr = 12;
	condition = DIA_Sagitta_Till_Valley_cond;
	information = DIA_Sagitta_Till_Valley_info;
	description = "Так где эта долина с горичаем?";
	permanent = TRUE;
};
func int DIA_Sagitta_Till_Valley_cond()
{
	if ((MIS_Till_Pet == LOG_Running)
			&& MIS_Till_Pet_SearchBurnTea)	{
		return TRUE;
	};
};
func void DIA_Sagitta_Till_Valley_info()
{
		AI_Output(other,self,"DIA_Sagitta_Till_Valley_14_00");	//Так где эта долина с горичаем?
	if (DIA_Sagitta_Till_Valley_Once)	{
		AI_Output(self,other,"DIA_Sagitta_Till_Valley_17_01");	//(вздыхает) Объясняю еще раз. Слушай внимательно.
	};
	DIA_Sagitta_Till_Valley_Once = TRUE;
	AI_Output(self,other,"DIA_Sagitta_Till_Valley_17_02");	//Идешь к ферме Лобарта. От нее в горы идет дорога.
	AI_Output(self,other,"DIA_Sagitta_Till_Valley_17_03");	//Эта дорога выведет тебя к горному озеру.
	AI_Output(self,other,"DIA_Sagitta_Till_Valley_17_04");	//На берегу озера есть вход в пещеру.
	AI_Output(self,other,"DIA_Sagitta_Till_Valley_17_05");	//Пройдешь пещеру насквозь - попадешь в ту самую долину.
};
// ----------------------------------------------------------
instance DIA_Sagitta_Till_BurnTea(C_Info)
{
	npc = OUT_1203_Sagitta;			nr = 13;
	condition = DIA_Sagitta_Till_BurnTea_cond;
	information = DIA_Sagitta_Till_BurnTea_info;
	description = "Я принес горичай.";
};
func int DIA_Sagitta_Till_BurnTea_cond()
{
	if ((MIS_Till_Pet == LOG_Running)
			&& MIS_Till_Pet_SearchBurnTea
			&& (Npc_HasItems(other,ItPl_BurnTea) >= 3))	{
		return TRUE;
	};
};
func void DIA_Sagitta_Till_BurnTea_info()
{
	var int x; x = 0;
	MIS_Till_Pet_SearchBurnTea = FALSE;
		AI_Output(other,self,"DIA_Sagitta_Till_BurnTea_14_00");	//Я принес горичай.
	B_GiveInvItems(other,self,ItPl_BurnTea,3);
	AI_Output(self,other,"DIA_Sagitta_Till_BurnTea_17_01");	//Хорошо, сейчас я приготовлю отвар. Подожди минутку.
	if (Npc_GetDistToWP(self,"NW_SAGITTA_CAVE_IN_03") < PERC_DIST_INTERMEDIAT)	{
		AI_UseMob(self,"LAB",1);
		AI_Wait(self,1);
		AI_UseMob(self,"LAB",-1);
		AI_GotoNpc(self,other);
		AI_TurnToNpc(self,other);
	};
	AI_Output(self,other,"DIA_Sagitta_Till_BurnTea_17_02");	//Вот, держи.
	B_GiveInvItems(self,other,ItPo_MR_AntiGobbo,1);
	B_GivePlayerXP(XP_Till_BurnteaGot);
		AI_Output(other,self,"DIA_Sagitta_Till_BurnTea_14_03");	//Спасибо.
	AI_Output(self,other,"DIA_Sagitta_Till_BurnTea_17_04");	//Хорошенько обрызгай пещеру, и гоблины в нее еще долго не сунутся.
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_OK_17_03");	//И еще - постели соломы на пол.
	B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_BurnTeaGot);	
};


/////////////////////////////// САРА //////////////////////////////////

instance DIA_Sagitta_Sarah_AskSmokingCure(C_INFO)
{
	npc = OUT_1203_Sagitta;			nr = 20;
	condition = DIA_Sagitta_Sarah_AskSmokingCure_cond;
	information = DIA_Sagitta_Sarah_AskSmokingCure_info;
	description = "Ты могла бы очистить тело заядлого курильщика?";
};
func int DIA_Sagitta_Sarah_AskSmokingCure_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_SearchPotion)	{
		return TRUE;
	};
};
func void DIA_Sagitta_Sarah_AskSmokingCure_info()
{
		AI_Output(other,self,"DIA_Sagitta_Sarah_AskSmokingCure_16_00");	//Скажи, ты могла бы очистить тело заядлого курильщика?
	AI_Output(self,other,"DIA_Sagitta_Sarah_AskSmokingCure_17_01");	//Хм, думаю, за пару месяцев с этим можно справиться...
		AI_Output(other,self,"DIA_Sagitta_Sarah_AskSmokingCure_16_02");	//Нет, это слишко долго.
	AI_Output(self,other,"DIA_Sagitta_Sarah_AskSmokingCure_17_03");	//Тогда поговори с городскими господами-алхимиками.
};

/////////////////////////////// ОДО //////////////////////////////////

instance DIA_Sagitta_Odo_HasPermHerb(C_INFO)
{
	npc = OUT_1203_Sagitta;			nr = 30;
	condition = DIA_Sagitta_Odo_HasPermHerb_cond;
	information = DIA_Sagitta_Odo_HasPermHerb_info;
	description = "У тебя случайно нет царского щавеля?";
};
func int DIA_Sagitta_Odo_HasPermHerb_cond()
{
	if (C_HeroIs_Odo()
		 && (MIS_Odo_Herbs == LOG_Running) && (MIS_Odo_Herbs_PermCnt < 3))	{
		return TRUE;
	};
};
func void DIA_Sagitta_Odo_HasPermHerb_info()
{
		AI_Output(other,self,"DIA_Sagitta_Odo_HasPermHerb_03_00");	//У тебя случайно нет царского щавеля?
	AI_Output(self,other,"DIA_Sagitta_Odo_HasPermHerb_17_01");	//Немного. Как ты понимаешь, сейчас для него не сезон.
		AI_Output(other,self,"DIA_Sagitta_Odo_HasPermHerb_03_02");	//Продай мне хотя бы один, а?
	AI_Output(self,other,"DIA_Sagitta_Odo_HasPermHerb_17_03");	//(с сарказмом) Разве может лесная ведьма требовать золото от слуги Инноса?
	AI_Output(self,other,"DIA_Sagitta_Odo_HasPermHerb_17_04");	//Продать не продам, а поменяться можно.
		AI_Output(other,self,"DIA_Sagitta_Odo_HasPermHerb_03_05");	//Чего же ты хочешь?
	AI_Output(self,other,"DIA_Sagitta_Odo_HasPermHerb_17_06");	//Ваше монастырское вино славится далеко за пределами Хориниса.
	AI_Output(self,other,"DIA_Sagitta_Odo_HasPermHerb_17_07");	//Не сладкое, но и не кислое, не слишком крепкое, и не водянистое.
	AI_Output(self,other,"DIA_Sagitta_Odo_HasPermHerb_17_08");	//А главное, хорошо хранится даже без погреба и не превращается в уксус, не боится ни винной цвели, ни плесени.
		AI_Output(other,self,"DIA_Sagitta_Odo_HasPermHerb_03_09");	//Так тебе нужно наше вино?
	AI_Output(self,other,"DIA_Sagitta_Odo_HasPermHerb_17_10");	//Нет. Я хочу узнать, как оно получается таким.
	AI_Output(self,other,"DIA_Sagitta_Odo_HasPermHerb_17_11");	//В чем ваш секрет? Особый виноград, магия или какие-то добавки?
	B_LogEntry(TOPIC_Odo_Wine,TOPIC_Odo_Wine_PermSagitta);
	MIS_Odo_Wine_SecretAsk = TRUE;
};
//------------------------------------------------------
instance DIA_Sagitta_Odo_WhyWine(C_INFO)
{
	npc = OUT_1203_Sagitta;			nr = 31;
	condition = DIA_Sagitta_Odo_WhyWine_cond;
	information = DIA_Sagitta_Odo_WhyWine_info;
	description = "Зачем тебе секрет нашего вина?";
};
func int DIA_Sagitta_Odo_WhyWine_cond()
{
	if (C_HeroIs_Odo()
		 && (MIS_Odo_Herbs == LOG_Running) && MIS_Odo_Wine_SecretAsk)	{
		return TRUE;
	};
};
func void DIA_Sagitta_Odo_WhyWine_info()
{
		AI_Output(other,self,"DIA_Sagitta_Odo_WhyWine_03_00");	//Зачем тебе секрет нашего вина?
		AI_Output(other,self,"DIA_Sagitta_Odo_WhyWine_03_01");	//Я думал ты знахарка, а не винодел.
	AI_Output(self,other,"DIA_Sagitta_Odo_WhyWine_17_02");	//Ах, я и знахарка, и алхимик, и кухарка - всего понемножку. А прежде всего - я любопытная женщина.
	AI_Output(self,other,"DIA_Sagitta_Odo_WhyWine_17_03");	//Я просто хочу узнать то, чего еще не знаю, и добиться успеха в том, что у мне не удается.
};
//------------------------------------------------------
instance DIA_Sagitta_Odo_TellWine(C_INFO)
{
	npc = OUT_1203_Sagitta;			nr = 32;
	condition = DIA_Sagitta_Odo_TellWine_cond;
	information = DIA_Sagitta_Odo_TellWine_info;
	description = "Я расскажу тебе секрет нашего вина.";
};
func int DIA_Sagitta_Odo_TellWine_cond()
{
	if (C_HeroIs_Odo() && MIS_Odo_Wine_SecretGot)	{
		return TRUE;
	};
};
func void DIA_Sagitta_Odo_TellWine_info()
{
		AI_Output(other,self,"DIA_Sagitta_Odo_TellWine_03_00");	//Я расскажу тебе секрет нашего вина.
		AI_Output(other,self,"DIA_Sagitta_Odo_TellWine_03_01");	//Перед закаткой вина бочку нужно тщательно окуривать серным фителем. Сера не дает расти плесени и киснуть вину.
	AI_Output(self,other,"DIA_Sagitta_Odo_TellWine_17_02");	//Сера! Подумать только, все это пьют и нахваливают...
	AI_Output(self,other,"DIA_Sagitta_Odo_TellWine_17_03");	//Хотя от одного фитиля на целую бочку серы будет немного. Я попробую.
	AI_Output(self,other,"DIA_Sagitta_Odo_TellWine_17_04");	//Вот твой царский щавель, как я и обещала.
	B_GiveInvItems(self,other,ItPl_Perm_Herb,1);
	B_LogEntry_Status(TOPIC_Odo_Wine, LOG_SUCCESS, TOPIC_Odo_Wine_Success);
};


