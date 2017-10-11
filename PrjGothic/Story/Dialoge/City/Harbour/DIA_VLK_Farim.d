
instance DIA_Farim_EXIT(DIA_Proto_End)
{
	npc = VLK_4301_Addon_Farim;
};

//===================================================
instance DIA_Farim_Hello(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_Farim_MR_Hello_Info;
	permanent = TRUE;
	description = "Как рыбалка?";
};
func void DIA_Farim_MR_Hello_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Farim_MR_Hello_03_00");	//Как рыбалка?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Farim_MR_Hello_07_00");	//Как рыбалка?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Farim_MR_Hello_10_00");	//Как рыбалка?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Farim_MR_Hello_14_00");	//Как рыбалка?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Farim_MR_Hello_16_00");	//Как рыбалка?
	};
	if (Fishers_Rain_Day == 0)	{
		AI_Output(self,other,"DIA_Farim_MR_Hello_11_01");	//После шторма вся рыба ушла на глубину и не возвращается. Ветер вечером с моря. Вода просто ледяная.
		AI_Output(self,other,"DIA_Farim_MR_Hello_11_02");	//Вильям хочет выйти в открытое море, а я говорю, что это бесполезно, да и опасно. Погода может испортиться в любую минуту.
		AI_Output(self,other,"DIA_Farim_MR_Hello_11_03");	//В результате мы спорим большую часть дня.
		Fishers_Rain_Day = Wld_GetDay() + 1;
		/* DISABLED сегодня дождя больше не будет
		MEM_InitGlobalInst();
		MEM_SkyController.rainFX_timeStartRain = FLOATNULL;
		if (Wld_IsRaining())	{
			var int h;	h = C_GetHour()+1;
			if (h >= 12)	{h = h - 12;}	else {h = h + 12;};
			MEM_SkyController.rainFX_timeStopRain = fracf(h,24);
		}
		else	{
			MEM_SkyController.rainFX_timeStopRain = FLOATNULL;
		};
		//*/
	}
	else if (Wld_GetDay() > Fishers_Rain_Day)	{
		AI_Output(self,other,"DIA_Farim_MR_Hello_11_04");	//Через пару дней море успокоится и можно будет спокойно рыбачить.
		if (!DIA_Farim_TellTales)	{
			AI_Output(self,other,"DIA_Farim_MR_Hello_11_05");	//Если, конечно, не наткнемся на морского змея.
			DIA_Farim_TellTales = TRUE;
		};
	}
	else	{
		AI_Output(self,other,"DIA_Farim_MR_Hello_11_06");	//Мы остаемся на берегу. И точка.
	};
};

//===================================================
instance DIA_Farim_TrueRain(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 2;
	condition = DIA_Farim_TrueRain_cond;
	information = DIA_Farim_TrueRain_Info;
	important = TRUE;
};
func int DIA_Farim_TrueRain_cond()
{
	if (Fishers_Rain_Started == TRUE)	{
		return TRUE;
	};
};
func void DIA_Farim_TrueRain_Info()
{
	AI_Output(self,other,"DIA_Farim_TrueRain_11_00");	//Я же говорил, что погода испортится!
};

// БАЙКИ ОХОТНИКОВ ====================================
// Про морского змея
//=====================================================
instance DIA_Farim_Tell_WhatSerpent(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 10;
	condition = DIA_Farim_Tell_WhatSerpent_cond;
	information = DIA_Farim_Tell_WhatSerpent_Info;
	description = "Какого змея?";
};
func int DIA_Farim_Tell_WhatSerpent_cond()
{
	if (DIA_Farim_TellTales)	{
		return TRUE;
	};
};
func void DIA_Farim_Tell_WhatSerpent_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Farim_Tell_WhatSerpent_03_00");	//Какого змея?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Farim_Tell_WhatSerpent_07_00");	//Какого змея?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Farim_Tell_WhatSerpent_10_00");	//Какого змея?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Farim_Tell_WhatSerpent_14_00");	//Какого змея?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Farim_Tell_WhatSerpent_16_00");	//Какого змея?
	};
	AI_Output(self,other,"DIA_Farim_Tell_WhatSerpent_11_01");	//Отплыви подальше от берега, и узнаешь.
	AI_Output(self,other,"DIA_Farim_Tell_WhatSerpent_11_02");	//Хотя обычно эти твари не нападают на корабли и лодки.
	AI_Output(self,other,"DIA_Farim_Tell_WhatSerpent_11_03");	//Но я слыхал историю о том, как гигантский морской змей чуть не потопил целую шхуну.
};
//---------------------------------------------------
instance DIA_Farim_Tell_SeaSerpent(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 10;
	condition = DIA_Farim_Tell_SeaSerpent_cond;
	information = DIA_Farim_Tell_SeaSerpent_Info;
	description = "Расскажи про морского змея.";
	permanent = TRUE;
};
func int DIA_Farim_Tell_SeaSerpent_cond()
{
	if (DIA_Farim_TellTales && Npc_KnowsInfo(other,DIA_Farim_Tell_WhatSerpent))	{
		return TRUE;
	};
};
func void DIA_Farim_Tell_SeaSerpent_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_03_00");	//Расскажи про морского змея.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_07_00");	//Расскажи про морского змея.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_10_00");	//Расскажи про морского змея.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_14_00");	//Расскажи про морского змея.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_16_00");	//Расскажи про морского змея.
	};
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_01");	//Один мой знакомый рыбак рассказывал, что раньше, когда еще в Долине Рудников не было каторги, там работали вольные старатели.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_02");	//И вот однажды какой-то купец вез руду из Долины. На юге орудовала шайка пиратов, и потому он решил обогнуть остров с севера.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_03");	//Говорят, места там нехорошие - повсюду скалы, мели, очень сильный прибой, к побережью подойти невозможно. Но купец взял подальше в море и благополучно обошел остров.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_04");	//Вот только, как только они отошли от берега, что-то сильно ударило в днище корабля. А потом из воды показалась башка морского дракона.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_05");	//Она была большая, словно бочка, а в приоткрытой пасти виднелись несколько рядов загнутых назад зубов, как у щуки. Такими если цапнет - уже не вырвешься.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_06");	//Змей застыл и вылупился на корабль своими выпученными и огромными, что твои яблоки, глазищами.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_07");	//Моряки всполошились, забегали по палубе. Но это только привлекло внимание монстра.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_08");	//Он бросился на юнгу, который оказался ближе всех. Но мальчишка увернулся, а дракон клацнул зубами и вцепился в борт.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_09");	//Древесина оказалась достаточно прочной, и загнутые зубы завязли в ней.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_10");	//Змей тряс башкой, лупил хвостом по воде и сильно раскачивал шхуну, но ни вырваться, ни перевернуть тяжело нагруженное судно не мог.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_11");	//Когда моряки это поняли, они стали бить его по голове топорами, баграми, саблями и вообще всем, что попадалось под руку.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_03_12");	//И что? Убили?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_07_12");	//И что? Убили?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_10_12");	//И что? Убили?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_14_12");	//И что? Убили?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_16_12");	//И что? Убили?
	};
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_13");	//Конечно, убили. Но из-за повисшей на борту туши шхуна сильно накренилась и потеряла ход. Они еле добрались до Хоринисского порта.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_14");	//Змея при помощи портовых кранов кое-как втащили на причал - в длину он занял его весь, а туловище не могли обхватить даже три человека.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_15");	//Кусок борта, в котором засели зубы, пришлось вырубить - никто так и не смог отцепить от него змея.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_16");	//Потом тушу разделали. Мясо купец раздал всем, кто помогал доставать змея, а от продажи шкуры, костей и зубов выручил даже больше, чем за привезенную руду!
	if (!Tale_SeaDragon_Once)	{
		Tale_SeaDragon_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};

