
instance DIA_Thorben_EXIT(DIA_Proto_End)
{
	npc = VLK_462_Thorben;
};
//===================================================
instance DIA_Thorben_Hello(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_MR_Hello_Cond;
	information = DIA_Thorben_MR_Hello_Info;
	important = TRUE;
};
func int DIA_Thorben_MR_Hello_Cond()
{
	if (Wld_IsTime(7,0,19,0) && !Npc_KnowsInfo(other,DIA_Thorben_Hello2)
		&& ((Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG) || DIA_WhenAsked_cond()))	{
		return TRUE;
	};
};
//===================================================
instance DIA_Thorben_Hello2(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Hello2_Cond;
	information = DIA_Thorben_MR_Hello_Info;
	description = "Как дела? Ты выглядишь расстроенным.";
};
func int DIA_Thorben_Hello2_Cond()
{
	if (!DIA_Thorben_MR_Hello_Cond() && !Npc_KnowsInfo(other,DIA_Thorben_Hello))	{
		return TRUE;
	};
};
func void DIA_Thorben_MR_Hello_Info()
{
	if (Wld_IsTime(7,0,19,0))	{
		AI_Output(self,other,"DIA_Thorben_MR_Hello_06_00");	//Добрый день! Не желаете ли приобрести мебель?
		AI_Output(self,other,"DIA_Thorben_MR_Hello_06_01");	//Столы, комоды, сундуки... Все, что пожелаете!
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Thorben_MR_Hello_03_02");	//Эээ... нет, спасибо. Мебель мне сейчас не нужна.
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Thorben_MR_Hello_07_02");	//Нет, спасибо. Городская мебель не очень-то подходит для охотничьей избушки.
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Thorben_MR_Hello_10_02");	//Нет. Мебель мне сейчас не нужна.
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Thorben_MR_Hello_14_02");	//Эээ... нет. Мне мебель не нужна.
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Thorben_MR_Hello_16_02");	//Эээ... нет, спасибо. Мебель мне сейчас не нужна.
		};
		AI_Output(self,other,"DIA_Thorben_MR_Hello_06_03");	//Жаль. Нынче покупателей мало.
	}
	else
	{
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Thorben_MR_Hello_03_04");	//Как дела? Ты выглядишь расстроенным.
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Thorben_MR_Hello_07_04");	//Как дела? Ты выглядишь расстроенным.
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Thorben_MR_Hello_10_04");	//Как дела? Ты выглядишь расстроенным.
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Thorben_MR_Hello_14_04");	//Как дела? Ты выглядишь расстроенным.
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Thorben_MR_Hello_16_04");	//Как дела? Ты выглядишь расстроенным.
		};
		AI_Output(self,other,"DIA_Thorben_MR_Hello_06_05");	//Откровенно говоря, не очень. Нынче покупателей мало.
	};
	AI_Output(self,other,"DIA_Thorben_MR_Hello_06_06");	//Если так пойдет и дальше, я разорюсь.
};
//===================================================
instance DIA_Thorben_IsItSoBad(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 3;
	condition = DIA_Thorben_IsItSoBad_Cond;
	information = DIA_Thorben_IsItSoBad_Info;
	description = "Все так плохо?";
};
func int DIA_Thorben_IsItSoBad_Cond()
{
	if (Npc_KnowsInfo(other,DIA_Thorben_Hello) || Npc_KnowsInfo(other,DIA_Thorben_Hello2))	{
		return TRUE;
	};
};
func void DIA_Thorben_IsItSoBad_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Thorben_IsItSoBad_03_00");	//Все так плохо?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Thorben_IsItSoBad_07_00");	//Все так плохо?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Thorben_IsItSoBad_10_00");	//Все так плохо?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Thorben_IsItSoBad_14_00");	//Все так плохо?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Thorben_IsItSoBad_16_00");	//Все так плохо?
	};
	AI_Output(self,other,"DIA_Thorben_IsItSoBad_06_01");	//Боюсь, что так. За последний год я заработал столько же, сколько когда-то получал за пару месяцев.
	AI_Output(self,other,"DIA_Thorben_IsItSoBad_06_02");	//Я едва справлялся с заказами. Взял своего племянника, Элвриха, в ученики. 
	AI_Output(self,other,"DIA_Thorben_IsItSoBad_06_03");	//Но теперь мне нечем занять его и нечем ему платить.
	AI_Output(self,other,"DIA_Thorben_IsItSoBad_06_04");	//А с тех пор, как со мной живет племянница, мне нужно кормить еще и ее.
	AI_Output(self,other,"DIA_Thorben_IsItSoBad_06_05");	//И не только кормить! Одевать!
	AI_Output(self,other,"DIA_Thorben_IsItSoBad_06_06");	//Я не знаю, как свести концы с концами, а у нее каждую неделю новое платье!..
	AI_Output(self,other,"DIA_Thorben_IsItSoBad_06_07");	//Прости. Мне не следовало загружать тебя своими проблемами...
	AI_StopProcessInfos(self);
	AI_TurnAway(self, other);
};

//===================================================
instance DIA_Thorben_ElvrichInPuff(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 20;
	condition = DIA_Thorben_ElvrichInPuff_Cond;
	information = DIA_Thorben_ElvrichInPuff_Info;
	description = "Ты знаешь, где ночует твой племянник?";
};
func int DIA_Thorben_ElvrichInPuff_Cond()
{
	if (Npc_KnowsInfo(other,DIA_Elvrich_USleepInPuff) || Kardif_RumorsTold[4])	{
		return TRUE;
	};
};
func void DIA_Thorben_ElvrichInPuff_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_03_00");	//Ты знаешь, где ночует твой племянник?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_07_00");	//Ты знаешь, где ночует твой племянник?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_10_00");	//Ты знаешь, где ночует твой племянник?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_14_00");	//Ты знаешь, где ночует твой племянник?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_16_00");	//Ты знаешь, где ночует твой племянник?
	};
	AI_Output(self,other,"DIA_Thorben_ElvrichInPuff_06_01");	//Я знаю, что он уходит куда-то. Но я ему не мать и не нянька, чтобы следить, куда именно.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_03_02");	//Он встречается с девушкой в Красном Фонаре...
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_07_02");	//Он встречается с девушкой в Красном Фонаре...
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_10_02");	//Он встречается с девушкой в Красном Фонаре...
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_14_02");	//Он встречается с девушкой в Красном Фонаре...
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_16_02");	//Он встречается с девушкой в Красном Фонаре...
	};
	AI_Output(self,other,"DIA_Thorben_ElvrichInPuff_06_03");	//Что?! Он тратит деньги, которые я ему плачу, на портовых девок?
	AI_Output(self,other,"DIA_Thorben_ElvrichInPuff_06_04");	//Этот разгильдяй! Я устрою ему жаркие ночи!
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Thorben_ElvrichInPuff_06_05");	//Спасибо, что рассказал мне.
	}
	else	{
		AI_Output(self,other,"DIA_Thorben_ElvrichInPuff_06_05b");	//Спасибо, что рассказала мне.
	};
	AI_Output(self,other,"DIA_Thorben_ElvrichInPuff_06_06");	//Я хотел бы вознаградить тебя, но у меня совсем нет денег...
	AI_Output(self,other,"DIA_Thorben_ElvrichInPuff_06_07");	//Я поговорю с торговцами на этой улице, чтобы они сделали тебе скидки.
	THORBEN_Discount = TRUE;
	B_StartOtherRoutine(VLK_4302_Addon_Elvrich,"PUNISHED");
};
//===================================================
instance DIA_Thorben_HammerWood(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 30;
	condition = DIA_Thorben_HammerWood_Cond;
	information = DIA_Thorben_HammerWood_Info;
	description = "Из какого дерева сделана рукоятка этого молотка?";
};
func int DIA_Thorben_HammerWood_Cond()
{
	if ((MIS_FellanGoHome == LOG_Running)
		&& Npc_HasItems(other,ItMi_FellanHammer_Broken)
		&& Npc_KnowsInfo(other,DIA_Carl_CanRepairHummer))	{
		return TRUE;
	};
};
func void DIA_Thorben_HammerWood_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Thorben_HammerWood_03_00");	//Можешь сказать, из какого дерева сделана рукоятка этого молотка?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Thorben_HammerWood_07_00");	//Можешь сказать, из какого дерева сделана рукоятка этого молотка?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Thorben_HammerWood_10_00");	//Можешь сказать, из какого дерева сделана рукоятка этого молотка?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Thorben_HammerWood_14_00");	//Можешь сказать, из какого дерева сделана рукоятка этого молотка?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Thorben_HammerWood_16_00");	//Можешь сказать, из какого дерева сделана рукоятка этого молотка?
	};
	AI_Output(self,other,"DIA_Thorben_HammerWood_06_01");	//Позволь взглянуть... Это тис.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Thorben_HammerWood_03_02");	//Тис?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Thorben_HammerWood_07_02");	//Тис?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Thorben_HammerWood_10_02");	//Тис?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Thorben_HammerWood_14_02");	//Тис?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Thorben_HammerWood_16_02");	//Тис?
	};
	AI_Output(self,other,"DIA_Thorben_HammerWood_06_03");	//Да, такое хвойное дерево, его еще называют негной-дерево, потому что он не портится в воде.
	AI_Output(self,other,"DIA_Thorben_HammerWood_06_04");	//Насколько я знаю, он больше не растет на Хоринисе, но раньше им активно пользовались, его древесина и красива, и практична.
	AI_Output(self,other,"DIA_Thorben_HammerWood_06_05");	//Из него изготавливают и луки, но об этом тебе лучше расскажет мастер Боспер.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Thorben_HammerWood_03_06");	//А у тебя нет тиса?
		AI_Output(other,self,"DIA_Thorben_HammerWood_03_07");	//Мне нужно совсем немного, для рукояти молота.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Thorben_HammerWood_07_06");	//А у тебя нет тиса?
		AI_Output(other,self,"DIA_Thorben_HammerWood_07_07");	//Мне нужно совсем немного, для рукояти молота.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Thorben_HammerWood_10_06");	//А у тебя нет тиса?
		AI_Output(other,self,"DIA_Thorben_HammerWood_10_07");	//Мне нужно совсем немного, для рукояти молота.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Thorben_HammerWood_14_06");	//А у тебя нет тиса?
		AI_Output(other,self,"DIA_Thorben_HammerWood_14_07");	//Мне нужно совсем немного, для рукояти молота.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Thorben_HammerWood_16_06");	//А у тебя нет тиса?
		AI_Output(other,self,"DIA_Thorben_HammerWood_16_07");	//Мне нужно совсем немного, для рукояти молота.
	};
	AI_Output(self,other,"DIA_Thorben_HammerWood_06_08");	//К сожалению, нет. Попробуй поспрашивать в городе, возможно, тебе повезет.
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerThorben);
	if (Npc_IsDead(VLK_442_Arbeiter))	{
		B_CloseLogOnDeath(VLK_442_Arbeiter);
	};
};

