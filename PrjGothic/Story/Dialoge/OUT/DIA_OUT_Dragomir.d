
instance DIA_Dragomir_EXIT(DIA_Proto_End)
{
	npc = OUT_1212_Dragomir;
};


///////////////////////////// ЕЛЕНА ///////////////////////////////
//-----------------------------------------
instance DIA_Dragomir_Elena_ShadowFur(C_INFO)
{
	npc = OUT_1212_Dragomir;			nr = 10;
	condition = DIA_Dragomir_Elena_ShadowFur_cond;
	information = DIA_Dragomir_Elena_ShadowFur_info;
	description = "Ты продаешь шкуры? Я ищу шкуру мракориса.";
};
func int DIA_Dragomir_Elena_ShadowFur_cond()
{
	if (C_HeroIs_Elena() && (Npc_KnowsInfo(other,DIA_Dragomir_WhatAUDoingHere) || Npc_KnowsInfo(other,DIA_Bosper_Elena_AskFur))
		 && MIS_Elena_Present_LuteroAskedFur
		 && (MIS_Elena_Present == LOG_Running)
		 && !MIS_Elena_Present_FurGot)	{
		return TRUE;
	};
};
func void DIA_Dragomir_Elena_ShadowFur_info()
{
		AI_Output(other,self,"DIA_Dragomir_Elena_ShadowFur_16_00");	//Ты продаешь шкуры? Я ищу шкуру мракориса.
	AI_Output(self,other,"DIA_Dragomir_Elena_ShadowFur_12_01");	//Нет, шкуры мракориса у меня сейчас нет.
	AI_Output(self,other,"DIA_Dragomir_Elena_ShadowFur_12_02");	//Есть шкура варга, волчьи, кабаньи, если интересует.
		AI_Output(other,self,"DIA_Dragomir_Elena_ShadowFur_16_03");	//Нет, мне нужна именно мракориса.
};


///////////////////////////// ВСЕ ///////////////////////////////
//-----------------------------------------
instance DIA_Dragomir_Hello(C_INFO)
{
	nr = 1;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_MR_Hello_cond;
	information = DIA_Dragomir_MR_Hello_info;
	important = TRUE;
};
func int DIA_Dragomir_MR_Hello_cond()
{
	if (DIA_WhenAsked_cond())
	{
		return TRUE;
	};
	
};
func void DIA_Dragomir_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Dragomir_MR_Hello_12_00");	//Приветствую! Далеко же тебя занесло.
	AI_Output(self,other,"DIA_Dragomir_MR_Hello_12_01");	//Здесь, в горах, нечасто можно встретить живого человека.
	AI_Output(self,other,"DIA_Dragomir_MR_Hello_12_02");	//Садись к огню, ночи становятся холодными.
};
//-----------------------------------------
instance DIA_Dragomir_WhatAUDoingHere(C_INFO)
{
	nr = 2;
	npc = OUT_1212_Dragomir;
	condition = DIA_NoCond_cond;
	information = DIA_Dragomir_WhatAUDoingHere_info;
	description = "Что ты здесь делаешь?";
};

func void DIA_Dragomir_WhatAUDoingHere_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_WhatAUDoingHere_03_00");	//Что ты здесь делаешь?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_WhatAUDoingHere_07_00");	//Что ты здесь делаешь?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_WhatAUDoingHere_10_00");	//Что ты здесь делаешь?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_WhatAUDoingHere_14_00");	//Что ты здесь делаешь?
	} else 	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_WhatAUDoingHere_16_00");	//Что ты здесь делаешь?
	};
	AI_Output(self,other,"DIA_Dragomir_WhatAUDoingHere_12_01");	//Я охотник и большую часть времени провожу в дикой местности со своим арбалетом.
	AI_Output(self,other,"DIA_Dragomir_WhatAUDoingHere_12_02");	//Но в такую погоду, как в последние дни, хочется иметь хоть какую-то крышу над головой.
};
//-----------------------------------------
instance DIA_Dragomir_WhyNotHotel(C_INFO)
{
	nr = 3;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_WhyNotHotel_cond;
	information = DIA_Dragomir_WhyNotHotel_info;
	description = "Почему бы тогда не пожить в трактире?";
};
func int DIA_Dragomir_WhyNotHotel_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_WhatAUDoingHere))
	{
		return TRUE;
	};
	
};
func void DIA_Dragomir_WhyNotHotel_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_WhyNotHotel_03_00");	//Почему бы тогда не пожить в трактире?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_WhyNotHotel_07_00");	//Почему бы тогда не пожить в трактире?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_WhyNotHotel_10_00");	//Почему бы тогда не пожить в трактире?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_WhyNotHotel_14_00");	//Почему бы тогда не пожить в трактире?
	} else 	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_WhyNotHotel_16_00");	//Почему бы тогда не пожить в трактире?
	};
	AI_Output(self,other,"DIA_Dragomir_WhyNotHotel_12_01");	//У меня нет золота, чтобы заплатить за ночлег.
	AI_Output(self,other,"DIA_Dragomir_WhyNotHotel_12_02");	//К тому же, в хорошую погоду я предпочитаю ночевать на свежем воздухе.
};
//-----------------------------------------
instance DIA_Dragomir_UAWelcome(C_INFO)
{
	nr = 4;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_UAWelcome_cond;
	information = DIA_Dragomir_UAWelcome_info;
	description = "Если потребуется, можешь переночевать у меня.";
};
func int DIA_Dragomir_UAWelcome_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_WhatAUDoingHere)
		&& (C_HeroIs_Elena() || C_HeroIs_Erol() || C_HeroIs_Talbin()))
	{
		return TRUE;
	};
	
};
func void DIA_Dragomir_UAWelcome_info()
{
	if (C_HeroIs_Talbin())	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_UAWelcome_07_00");	//Если потребуется, можешь переночевать у меня.
		AI_Output(other,self,"DIA_Dragomir_UAWelcome_07_01");	//Наша стоянка находится недалеко от Мертвой гарпии.
	} else if (C_HeroIs_Erol())	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_UAWelcome_10_00");	//Если потребуется, можешь переночевать у меня.
		AI_Output(other,self,"DIA_Dragomir_UAWelcome_10_01");	//Мой дом находится на берегу озера, по дороге к лендлорду Онару.
	} else if (C_HeroIs_Elena())	{	//Елена 
		AI_Output(other,self,"DIA_Dragomir_UAWelcome_16_00");	//Если потребуется, можешь переночевать у меня.
		AI_Output(other,self,"DIA_Dragomir_UAWelcome_16_01");	//Я дочь лендлорда Онара. У нас в сарае стоит несколько запасных кроватей для работников.
		AI_Output(other,self,"DIA_Dragomir_UAWelcome_16_02");	//Это, конечно, не царские покои, но лучше старых развалин.
	};
	AI_Output(self,other,"DIA_Dragomir_UAWelcome_12_03");	//Спасибо за предложение, но я пока не собираюсь спускаться в долину.
};
//-----------------------------------------
instance DIA_Dragomir_IsItDangerousHere(C_INFO)
{
	nr = 5;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_IsItDangerousHere_cond;
	information = DIA_Dragomir_IsItDangerousHere_info;
	description = "Здесь опасно?";
	permanent = TRUE;
};
func int DIA_Dragomir_IsItDangerousHere_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_WhatAUDoingHere))
	{
		return TRUE;
	};
	
};
func void DIA_Dragomir_IsItDangerousHere_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_IsItDangerousHere_03_00");	//Здесь опасно?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_IsItDangerousHere_07_00");	//Здесь опасно?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_IsItDangerousHere_10_00");	//Здесь опасно?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_IsItDangerousHere_14_00");	//Здесь опасно?
	} else	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_IsItDangerousHere_16_00");	//Здесь опасно?
	};
	AI_Output(self,other,"DIA_Dragomir_IsItDangerousHere_12_01");	//Да, для случайного путника, и нет, если сумеешь за себя постоять. Главное - смотри, куда идешь.
	AI_Output(self,other,"DIA_Dragomir_IsItDangerousHere_12_02");	//Например, если поднимешься к пустоши над горным озером, то наткнешься на огромного тролля.
	AI_Output(self,other,"DIA_Dragomir_IsItDangerousHere_12_03");	//Эта громадина быстро превратит тебя в котлету. Но не заметить его трудно.
	AI_Output(self,other,"DIA_Dragomir_IsItDangerousHere_12_04");	//Еще не советую соваться в пещеры. В темноте можно неожиданно наткнуться на выводок ползунов, а то и на кого похуже.
	AI_Output(self,other,"DIA_Dragomir_IsItDangerousHere_12_05");	//На дорогах относительно безопасно, если не считать волков, кабанов и гоблинов.
	AI_Output(self,other,"DIA_Dragomir_IsItDangerousHere_12_06");	//Неподалеку даже есть алтарь Инноса, если для тебя это важно.
};
// БАЙКИ ОХОТНИКОВ ====================================
// О древних руинах
//-----------------------------------------
instance DIA_Dragomir_AboutRuins(C_INFO)
{
	nr = 10;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_AboutRuins_cond;
	information = DIA_Dragomir_AboutRuins_info;
	description = "Интересно, кто построил эти здания?";
};
func int DIA_Dragomir_AboutRuins_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_WhatAUDoingHere))
	{
		return TRUE;
	};
};
func void DIA_Dragomir_AboutRuins_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_03_00");	//Интересно, кто построил эти здания?
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_03_01");	//На вид им лет сто, не меньше.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_07_00");	//Интересно, кто построил эти здания?
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_07_01");	//Им, наверно, пара сотен лет.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_10_00");	//Интересно, кто построил эти здания?
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_10_01");	//Им, должно быть, много сотен лет.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_14_00");	//Интересно, кто построил эти здания?
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_14_01");	//На вид им лет сто, не меньше.
	} else	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_16_00");	//Интересно, кто построил эти здания?
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_16_01");	//На вид такие старые, им, наверное, сотни лет.
	};
	AI_Output(self,other,"DIA_Dragomir_AboutRuins_12_02");	//Да уж, им лет побольше, чем нашим с тобой дедам вместе взятым...
	AI_Output(self,other,"DIA_Dragomir_AboutRuins_12_03");	//А кто их построил - теперь уж никто скажет. Хотя я слыхал разные истории...
};
//-----------------------------------------
instance DIA_Dragomir_Tell_AboutRuins(C_INFO)
{
	nr = 11;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_Tell_AboutRuins_cond;
	information = DIA_Dragomir_Tell_AboutRuins_info;
	description = "Расскажи, что ты слышал о пирамидах.";
};
func int DIA_Dragomir_Tell_AboutRuins_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_AboutRuins))
	{
		return TRUE;
	};
};
func void DIA_Dragomir_Tell_AboutRuins_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_Tell_AboutRuins_03_00");	//Расскажи, что ты слышал о пирамидах.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_Tell_AboutRuins_07_00");	//Расскажи, что ты слышал о пирамидах.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_Tell_AboutRuins_10_00");	//Расскажи, что ты слышал о пирамидах.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_Tell_AboutRuins_14_00");	//Расскажи, что ты слышал о пирамидах.
	} else	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_Tell_AboutRuins_16_00");	//Расскажи, что ты слышал о пирамидах.
	};
	AI_Output(self,other,"DIA_Dragomir_Tell_AboutRuins_12_01");	//Правда или нет - не знаю, но один бородатый странник с огромной дубиной рассказал мне эту историю.
	if (C_NpcWears(other,ItAr_NOV_L))	{
		AI_Output(self,other,"DIA_Dragomir_Tell_AboutRuins_12_02");	//Ты только Магам не говори, а то мало ли... Неохота на каторгу.
		AI_Output(other,self,"DIA_Dragomir_Tell_AboutRuins_03_03");	//Да ладно тебе. Рассказывай!
	};
	AI_Output(self,other,"DIA_Dragomir_Tell_AboutRuins_12_04");	//Когда-то, в давние времена, было не три, а целых пять богов.
	AI_Output(self,other,"DIA_Dragomir_Tell_AboutRuins_12_05");	//Кроме Инноса, Аданоса и Белиара миром правили еще Бог камня и Бог земли.
	AI_Output(self,other,"DIA_Dragomir_Tell_AboutRuins_12_06");	//Боги вечно ищут кого-нибудь, кто бы им поклонялся, чтобы получить силу из молитв и жертвоприношений.
	AI_Output(self,other,"DIA_Dragomir_Tell_AboutRuins_12_07");	//Пока три брата делили между собой людей и орков, Бог камня создал для себя каменных чудовищ, а Бог земли слепил последователей из грязи.
	AI_Output(self,other,"DIA_Dragomir_Tell_AboutRuins_12_08");	//Как тогда называли тех богов и их тварей - нынче уж никто не помнит. А теперь люди зовут их големами. 
	AI_Output(self,other,"DIA_Dragomir_Tell_AboutRuins_12_09");	//Големы строили города и святилища для своих богов. Тут-то и стоял Каменный город, а в этих пирамидах големы день и ночь славили Бога камня.
};
//-----------------------------------------
instance DIA_Dragomir_Tell_DirtCity(C_INFO)
{
	nr = 12;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_Tell_DirtCity_cond;
	information = DIA_Dragomir_Tell_DirtCity_info;
	description = "А Земляной город?";
};
func int DIA_Dragomir_Tell_DirtCity_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_Tell_AboutRuins))
	{
		return TRUE;
	};
};
func void DIA_Dragomir_Tell_DirtCity_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_Tell_DirtCity_03_00");	//А Земляной город?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_Tell_DirtCity_07_00");	//А что насчет Земляного города?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_Tell_DirtCity_10_00");	//А что насчет Земляного города?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_Tell_DirtCity_14_00");	//А что насчет Земляного города?
	} else	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_Tell_DirtCity_16_00");	//А Земляной город был?
	};
	AI_Output(self,other,"DIA_Dragomir_Tell_DirtCity_12_01");	//Вроде бы, был и Земляной город где-то на острове. Может, в Рудниковой долине, а может на юге.
	AI_Output(self,other,"DIA_Dragomir_Tell_DirtCity_12_02");	//Только земля - материал непрочный. За сотни лет земляные дома размыло и все заросло лесами.
	AI_Output(self,other,"DIA_Dragomir_Tell_DirtCity_12_03");	//Так что любой холм может оказаться вершиной древнего святилища.
};
//-----------------------------------------
instance DIA_Dragomir_Tell_Golems(C_INFO)
{
	nr = 13;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_Tell_Golems_cond;
	information = DIA_Dragomir_Tell_Golems_info;
	description = "Големы?";
};
func int DIA_Dragomir_Tell_Golems_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_Tell_AboutRuins))
	{
		return TRUE;
	};
};
func void DIA_Dragomir_Tell_Golems_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_03_00");	//Големы?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_07_00");	//Големы?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_10_00");	//Големы?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_14_00");	//Големы?
	} else	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_16_00");	//Големы?
	};
	AI_Output(self,other,"DIA_Dragomir_Tell_Golems_12_01");	//Да, представь себе ходячую кучу камней или глины в два человеческих роста.
	AI_Output(self,other,"DIA_Dragomir_Tell_Golems_12_02");	//Они сильнее тролля и никогда не устают. Такой одним ударом расколет тебе череп, как яйцо. Могут годами стоять и не шевелиться.
	AI_Output(self,other,"DIA_Dragomir_Tell_Golems_12_03");	//Еще говорят, Аданос и Иннос могут создавать ледяных и огненных големов, которые еще жутче, потому что владеют магией.
	AI_Output(self,other,"DIA_Dragomir_Tell_Golems_12_04");	//Хорошо хоть бегают они не лучше камней, и умом не блещут.
	AI_Output(self,other,"DIA_Dragomir_Tell_Golems_12_05");	//Один каменный голем стоит возле дороги, ведущей от ферм в горы. Если идти по ней - ни за что не пройдешь мимо.
	Info_ClearChoices(DIA_Dragomir_Tell_Golems);
	if (other.aivar[AIV_Gender] == MALE)	{
		Info_AddChoice(DIA_Dragomir_Tell_Golems, "Как же, видал такого...", DIA_Dragomir_Tell_Golems_Seen);
		Info_AddChoice(DIA_Dragomir_Tell_Golems, "Никогда такого не видел.", DIA_Dragomir_Tell_Golems_NeverSeen);
	}
	else	{
		Info_AddChoice(DIA_Dragomir_Tell_Golems, "Видала такого...", DIA_Dragomir_Tell_Golems_Seen);
		Info_AddChoice(DIA_Dragomir_Tell_Golems, "Никогда такого не видела.", DIA_Dragomir_Tell_Golems_NeverSeen);
	};
};
func void DIA_Dragomir_Tell_Golems_NeverSeen()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_NeverSeen_03_00");	//Никогда такого не видел.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_NeverSeen_07_00");	//Никогда такого не видел.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_NeverSeen_10_00");	//Никогда такого не видел.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_NeverSeen_14_00");	//Никогда такого не видел.
	} else	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_NeverSeen_16_00");	//Никогда такого не видела.
	};
	Info_ClearChoices(DIA_Dragomir_Tell_Golems);
};
func void DIA_Dragomir_Tell_Golems_Seen()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_Seen_03_00");	//Как же, видал такого...
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_Seen_07_00");	//Как же, видал такого...
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_Seen_10_00");	//Как же, видал такого...
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_Seen_14_00");	//Как же, видал такого...
	} else	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_Seen_16_00");	//Видала такого...
	};
	Info_ClearChoices(DIA_Dragomir_Tell_Golems);
};
//-----------------------------------------
instance DIA_Dragomir_Tell_WhyDestroyed(C_INFO)
{
	nr = 14;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_Tell_WhyDestroyed_cond;
	information = DIA_Dragomir_Tell_WhyDestroyed_info;
	description = "Так куда они делись?";
};
func int DIA_Dragomir_Tell_WhyDestroyed_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_Tell_AboutRuins))
	{
		return TRUE;
	};
};
func void DIA_Dragomir_Tell_WhyDestroyed_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_Tell_WhyDestroyed_03_00");	//Так куда они делись?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_Tell_WhyDestroyed_07_00");	//Так куда они делись?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_Tell_WhyDestroyed_10_00");	//Так куда они делись?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_Tell_WhyDestroyed_14_00");	//Так куда они делись?
	} else	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_Tell_WhyDestroyed_16_00");	//Так куда они делись?
	};
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_01");	//Ну, так получилось, что големы стали теснить и людей, и орков.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_02");	//Големам ведь не нужна ни вода, ни пища, они не спят, не болеют, не умирают.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_03");	//Развалиться только могут. Но да земли и камней везде навалом, боги всегда могли сделать новых.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_04");	//Люди и орки их боялись, и стали молить Инноса, Аданоса и Белиара о защите. 
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_05");	//Те уже тоже почувствовали возросшую силу Богов камня и земли, и решили на время оставить распри и объединиться.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_06");	//Аданос, по обыкновению, предложил устроить потоп, Иннос - наслать такой огонь, чтобы расплавил и камень. Но тогда бы погибли не только големы, но и вообще все живое.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_07");	//Тогда Белиар предложил действовать хитростью. Он нарядил нескольких орков - одних обмазал глиной, а других обвешал камнями.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_08");	//Ночью орки пробрались в святилища Богов и осквернили их. Големы хоть и сильные, а мозгов-то у них вовсе нет. Так что ряженые орки их легко обманули.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_09");	//Когда Боги стали спрашивать, кто совершил святотатство, каменные големы указали на земляных, а земляные - на каменных. Так началась война.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_10");	//Вскоре армии големов просто смололи друг друга в крошку. А их ослабевшие Боги куда-то сгинули.
};	

//-----------------------------------------
instance DIA_Dragomir_Tell_WhereGodsGone(C_INFO)
{
	nr = 15;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_Tell_WhereGodsGone_cond;
	information = DIA_Dragomir_Tell_WhereGodsGone_info;
	description = "Интересно, куда делись те два Бога.";
};
func int DIA_Dragomir_Tell_WhereGodsGone_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_Tell_WhyDestroyed))
	{
		return TRUE;
	};
};
func void DIA_Dragomir_Tell_WhereGodsGone_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_03_00");	//Интересно, куда делись те два Бога.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_07_00");	//Интересно, куда делись те два Бога.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_10_00");	//Интересно, куда делись те два Бога.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_14_00");	//Интересно, куда делись те два Бога.
	} else	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_16_00");	//Интересно, куда делись те два Бога.
	};
	AI_Output(self,other,"DIA_Dragomir_Tell_WhereGodsGone_12_01");	//Тот странник говорил, что их изгнали из этого мира, куда-то, откуда они никогда не вернутся.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhereGodsGone_12_02");	//Иначе бы они так и воевали друг с другом до конца времен.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhereGodsGone_12_03");	//А я считаю, что они просто ослабели и стали невидимками. Так и бродят до сих пор среди нас, как призраки, но никто их не замечает.
	Info_ClearChoices(DIA_Dragomir_Tell_WhereGodsGone);
	Info_AddChoice(DIA_Dragomir_Tell_WhereGodsGone, "А я думаю, все было не так.", DIA_Dragomir_Tell_WhereGodsGone_Other);
	Info_AddChoice(DIA_Dragomir_Tell_WhereGodsGone, "Я, пожалуй, соглашусь с тем странником.", DIA_Dragomir_Tell_WhereGodsGone_Stranger);
	if (other.aivar[AIV_Gender] == MALE)	{
		Info_AddChoice(DIA_Dragomir_Tell_WhereGodsGone, "Я с тобой согласен.", DIA_Dragomir_Tell_WhereGodsGone_Agree);
	}
	else	{
		Info_AddChoice(DIA_Dragomir_Tell_WhereGodsGone, "Я с тобой согласна.", DIA_Dragomir_Tell_WhereGodsGone_Agree);
	};
};
func void DIA_Dragomir_Tell_WhereGodsGone_Agree()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Agree_03_00");	//Я с тобой согласен.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Agree_07_00");	//Я с тобой согласен.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Agree_10_00");	//Я с тобой согласен.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Agree_14_00");	//Я с тобой согласен.
	} else	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Agree_16_00");	//Я с тобой согласна.
	};
	Info_ClearChoices(DIA_Dragomir_Tell_WhereGodsGone);
};
func void DIA_Dragomir_Tell_WhereGodsGone_Stranger()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Stranger_03_00");	//Я, пожалуй, соглашусь с тем странником.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Stranger_07_00");	//Я, пожалуй, соглашусь с тем странником.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Stranger_10_00");	//Я, пожалуй, соглашусь с тем странником.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Stranger_14_00");	//Я, пожалуй, соглашусь с тем странником.
	} else	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Stranger_16_00");	//Я, пожалуй, соглашусь с тем странником.
	};
	Info_ClearChoices(DIA_Dragomir_Tell_WhereGodsGone);
};

func void DIA_Dragomir_Tell_WhereGodsGone_Other()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Other_03_00");	//А я думаю, все было не так.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Other_07_00");	//А я думаю, все было не так.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Other_10_00");	//А я думаю, все было не так.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Other_14_00");	//А я думаю, все было не так.
	} else	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Other_16_00");	//А я думаю, все было не так.
	};
	Info_ClearChoices(DIA_Dragomir_Tell_WhereGodsGone);
	Info_AddChoice(DIA_Dragomir_Tell_WhereGodsGone, "(Не было таких богов.)", DIA_Dragomir_Tell_WhereGodsGone_NeverBeen);
	Info_AddChoice(DIA_Dragomir_Tell_WhereGodsGone, "(Они вернулись в свои стихии.)", DIA_Dragomir_Tell_WhereGodsGone_Elements);
	Info_AddChoice(DIA_Dragomir_Tell_WhereGodsGone, "(Белиар сделал их своими приспешниками.)", DIA_Dragomir_Tell_WhereGodsGone_Beliar);
};
func void DIA_Dragomir_Tell_WhereGodsGone_Beliar()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_03_00");	//Белиар-то не просто так это все затеял. Наверняка, он придумал еще какую-нибудь ложь, чтобы эти Боги стали служить ему.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_03_01");	//Может, и не боги они теперь вовсе, а демоны.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_07_00");	//Белиар-то не просто так это все затеял. Наверняка, он придумал еще какую-нибудь ложь, чтобы эти Боги стали служить ему.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_07_01");	//Может, и не боги они теперь вовсе, а демоны.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_10_00");	//Белиар-то не просто так это все затеял. Наверняка, он придумал еще какую-нибудь ложь, чтобы эти Боги стали служить ему.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_10_01");	//Может, и не боги они теперь вовсе, а демоны.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_14_00");	//Белиар-то не просто так это все затеял. Наверняка, он придумал еще какую-нибудь ложь, чтобы эти Боги стали служить ему.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_14_01");	//Может, и не боги они теперь вовсе, а демоны.
	} else	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_16_00");	//Белиар-то не просто так это все затеял. Наверняка, он придумал еще какую-нибудь ложь, чтобы эти Боги стали служить ему.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_16_01");	//Может, и не боги они теперь вовсе, а демоны.
	};
	Info_ClearChoices(DIA_Dragomir_Tell_WhereGodsGone);
};
func void DIA_Dragomir_Tell_WhereGodsGone_Elements()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_03_00");	//Должно быть, потеряв все силы, они растворились каждый в своей стихии.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_03_01");	//Так что они теперь в каждом камушке и в каждой горсти земли. А иначе почему горы не падают, что их держит, а?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_07_00");	//Должно быть, потеряв все силы, они растворились каждый в своей стихии.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_07_01");	//Так что они теперь в каждом камушке и в каждой горсти земли. А иначе почему горы не падают, что их держит, а?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_10_00");	//Должно быть, потеряв все силы, они растворились каждый в своей стихии.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_10_01");	//Так что они теперь в каждом камушке и в каждой горсти земли. А иначе почему горы не падают, что их держит, а?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_14_00");	//Должно быть, потеряв все силы, они растворились каждый в своей стихии.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_14_01");	//Так что они теперь в каждом камушке и в каждой горсти земли. А иначе почему горы не падают, что их держит, а?
	} else	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_16_00");	//Должно быть, потеряв все силы, они растворились каждый в своей стихии.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_16_01");	//Так что они теперь в каждом камушке и в каждой горсти земли. А иначе почему горы не падают, что их держит, а?
	};
	Info_ClearChoices(DIA_Dragomir_Tell_WhereGodsGone);
};
func void DIA_Dragomir_Tell_WhereGodsGone_NeverBeen()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_03_00");	//Да не было вовсе таких богов. Вот тоже придумал - еще два бога.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_03_01");	//Ты еще скажи, что был бог воздуха, бог растений, бог животных... Эдак мы дойдем до того, что на каждый чих будет по богу.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_03_02");	//Богов всего трое и точка. А все остальное - либо выдумка, либо обычная магия.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_07_00");	//Да не было вовсе таких богов. Вот тоже придумал - еще два бога.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_07_01");	//Ты еще скажи, что был бог воздуха, бог растений, бог животных... Эдак мы дойдем до того, что на каждый чих будет по богу.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_07_02");	//Богов всего трое и точка. А все остальное - либо выдумка, либо обычная магия.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_10_00");	//Да не было вовсе таких богов. Вот тоже придумал - еще два бога.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_10_01");	//Ты еще скажи, что был бог воздуха, бог растений, бог животных... Эдак мы дойдем до того, что на каждый чих будет по богу.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_10_02");	//Богов всего трое и точка. А все остальное - либо выдумка, либо обычная магия.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_14_00");	//Да не было вовсе таких богов. Вот тоже придумал - еще два бога.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_14_01");	//Ты еще скажи, что был бог воздуха, бог растений, бог животных... Эдак мы дойдем до того, что на каждый чих будет по богу.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_14_02");	//Богов всего трое и точка. А все остальное - либо выдумка, либо обычная магия.
	} else	{							//Сара/Елена
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_16_00");	//Да не было вовсе таких богов. Вот тоже придумал - еще два бога.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_16_01");	//Ты еще скажи, что был бог воздуха, бог растений, бог животных... Эдак мы дойдем до того, что на каждый чих будет по богу.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_16_02");	//Богов всего трое и точка. А все остальное - либо выдумка, либо обычная магия.
	};
	Info_ClearChoices(DIA_Dragomir_Tell_WhereGodsGone);
};

