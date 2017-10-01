
instance DIA_Edda_EXIT(DIA_Proto_End)
{
	npc = VLK_471_Edda;
};

/////////////////////////////////////// САРА /////////////////////////////////////////////

//===================================================
instance DIA_Edda_Sarah_Hello(C_Info)
{
	npc = VLK_471_Edda;				nr = 1;
	condition = DIA_Edda_Sarah_MR_Hello_cond;
	information = DIA_Edda_Sarah_MR_Hello_Info;
	description = "Привет, Эдда!";
};
func int DIA_Edda_Sarah_MR_Hello_cond()
{
	if (C_HeroIs_Sarah())	{
		return TRUE;
	};
};
func void DIA_Edda_Sarah_MR_Hello_Info()
{
		AI_Output(other,self,"DIA_Edda_Sarah_MR_Hello_16_00");	//Привет, Эдда!
	AI_Output(self,other,"DIA_Edda_Sarah_MR_Hello_17_01");	//Сара! Давненько я тебя не видела. Что, несладкая жизнь в городе, что ты забежала ко мне за ушицей?
		AI_Output(other,self,"DIA_Edda_Sarah_MR_Hello_16_02");	//А она такая же вкусная?
	AI_Output(self,other,"DIA_Edda_Sarah_MR_Hello_17_03");	//Можешь сама проверить. Но ты же помнишь правило: будет рыба - будет и уха.
	Edda_Feed = TRUE;
	B_LogNote(TOPIC_Misk,TOPIC_Misk_EddaFishSoup);
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_Edda);
};

//===================================================
instance DIA_Edda_Sarah_HowAU(C_Info)
{
	npc = VLK_471_Edda;				nr = 2;
	condition = DIA_Edda_Sarah_HowAU_cond;
	information = DIA_Edda_Sarah_HowAU_Info;
	description = "Как поживаешь?";
};
func int DIA_Edda_Sarah_HowAU_cond()
{
	if (C_HeroIs_Sarah())	{
		return TRUE;
	};
};
func void DIA_Edda_Sarah_HowAU_Info()
{
		AI_Output(other,self,"DIA_Edda_Sarah_HowAU_16_00");	//Как поживаешь?
	AI_Output(self,other,"DIA_Edda_Sarah_HowAU_17_01");	//Все в порядке, спасибо.
		AI_Output(other,self,"DIA_Edda_Sarah_HowAU_16_02");	//Точно? Выглядишь расстроенной.
	AI_Output(self,other,"DIA_Edda_Sarah_HowAU_17_03");	//Да вот... Заходил недавно один... гурман. Заявил, что моя уха воняет.
	AI_Output(self,other,"DIA_Edda_Sarah_HowAU_17_04");	//Стою вот и думаю, может правда, рыба подгнила? Или еще что-то...
		AI_Output(other,self,"DIA_Edda_Sarah_HowAU_16_05");	//Наглая ложь! Твоя уха лучшая в мире.
	AI_Output(self,other,"DIA_Edda_Sarah_HowAU_17_06");	//То-то я тебя ни разу не видела, как ты из Порта ушла.
		AI_Output(other,self,"DIA_Edda_Sarah_HowAU_16_07");	//Мне просто некогда было. А как освободилась - видишь, сразу к тебе прибежала.
	AI_Output(self,other,"DIA_Edda_Sarah_HowAU_17_08");	//Ах ты, подлиза! Но спасибо на добром слове.
	AI_Output(self,other,"DIA_Edda_Sarah_HowAU_17_09");	//Только, чего уж кривить душой, свежей рыбы сейчас не хватает.
	AI_Output(self,other,"DIA_Edda_Sarah_HowAU_17_10");	//Раньше мне Вильям с каждого улова приносил немного, а сейчас ни его, ни Фарима не видно.
	AI_Output(self,other,"DIA_Edda_Sarah_HowAU_17_11");	//Может, ты и их проведаешь?
};

//===================================================
instance DIA_Edda_Sarah_Fishers(C_Info)
{
	npc = VLK_471_Edda;				nr = 3;
	condition = DIA_Edda_Sarah_Fishers_cond;
	information = DIA_Edda_Sarah_Fishers_Info;
	description = "Я была у рыбаков.";
};
func int DIA_Edda_Sarah_Fishers_cond()
{
	if (C_HeroIs_Sarah()
		 && Npc_KnowsInfo(other,DIA_Edda_Sarah_HowAU)
		 && (VLK_4304_Addon_William.aivar[AIV_TalkedToPlayer] || VLK_4301_Addon_Farim.aivar[AIV_TalkedToPlayer]))	{
		return TRUE;
	};
};
func void DIA_Edda_Sarah_Fishers_Info()
{
		AI_Output(other,self,"DIA_Edda_Sarah_Fishers_16_00");	//Я была у рыбаков. В ближайшее время рыбы ждать не стоит.
		AI_Output(other,self,"DIA_Edda_Sarah_Fishers_16_01");	//Говорят, вода холодная и рыба ушла. И шторм может начаться. В общем, пока погода не наладится, рыбы не будет.
	AI_Output(self,other,"DIA_Edda_Sarah_Fishers_17_02");	//Печально. Но все равно, спасибо за новости.
	B_GivePlayerXP(XP_Sarah_EddaAboutFishers);
};

//===================================================
instance DIA_Edda_Sarah_HelpNadja(C_Info)
{
	npc = VLK_471_Edda;				nr = 4;
	condition = DIA_Edda_Sarah_HelpNadja_cond;
	information = DIA_Edda_Sarah_HelpNadja_Info;
	description = "Мне нужно с тобой поговорить насчет Нади.";
};
func int DIA_Edda_Sarah_HelpNadja_cond()
{
	if (C_HeroIs_Sarah()
		 && Npc_KnowsInfo(other,DIA_Edda_Sarah_Hello)
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_VatrasAsked)	{
		return TRUE;
	};
};
func void DIA_Edda_Sarah_HelpNadja_Info()
{
		AI_Output(other,self,"DIA_Edda_Sarah_HelpNadja_16_00");	//Мне нужно с тобой поговорить насчет Нади.
	AI_Output(self,other,"DIA_Edda_Sarah_HelpNadja_17_01");	//Да? Что с ней? Давненько она ко мне не заглядывала.
		AI_Output(other,self,"DIA_Edda_Sarah_HelpNadja_16_02");	//У нее проблемы.
	AI_Output(self,other,"DIA_Edda_Sarah_HelpNadja_17_03");	//Больше обычного? Во что еще она вляпалась?
		AI_Output(other,self,"DIA_Edda_Sarah_HelpNadja_16_04");	//Курит болотник. Похоже, она тратит на него все деньги и время.
	AI_Output(self,other,"DIA_Edda_Sarah_HelpNadja_17_05");	//Оох, бедная девочка. Видать, совсем ей невыносимо стало.
	AI_Output(self,other,"DIA_Edda_Sarah_HelpNadja_17_06");	//С тех пор, как ты ушла из Портового квартала, она ведь совсем одна осталась...
		AI_Output(other,self,"DIA_Edda_Sarah_HelpNadja_16_07");	//Эдда, нам нужно ее остановить! Она себя в могилу загонит. Меня она слушать не хочет, а тебя...
	AI_Output(self,other,"DIA_Edda_Sarah_HelpNadja_17_08");	//Нет.
		AI_Output(other,self,"DIA_Edda_Sarah_HelpNadja_16_09");	//Что? Почему?!
	AI_Output(self,other,"DIA_Edda_Sarah_HelpNadja_17_10");	//Я пыталась повлиять на нее много раз. Тебя ставила в пример, уговаривала бросить ее занятие и заняться чем-нибудь приличным.
	AI_Output(self,other,"DIA_Edda_Sarah_HelpNadja_17_11");	//Но она поставила сама на себе крест. Мне больше нечего ей сказать.
	MIS_Sarah_BadHabit_EddaAsked = TRUE;
	B_GivePlayerXP(XP_Sarah_Nadja_EddaTalked);
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_EddaNoHelp);
};

/////////////////////////////////////// РУПЕРТ /////////////////////////////////////////////

//===================================================
instance DIA_Edda_Rupert_Hello(C_Info)
{
	npc = VLK_471_Edda;				nr = 10;
	condition = DIA_Edda_Rupert_MR_Hello_cond;
	information = DIA_Edda_Rupert_MR_Hello_Info;
	important = TRUE;
};
func int DIA_Edda_Rupert_MR_Hello_cond()
{
	if (C_HeroIs_Rupert() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Edda_Rupert_MR_Hello_Info()
{
	AI_Output(self,other,"DIA_Edda_Rupert_MR_Hello_17_00");	//Что, опять без гроша в кармане?
	AI_Output(self,other,"DIA_Edda_Rupert_MR_Hello_17_01");	//Ты знаешь правило - уха в обмен на рыбу.
	Edda_Feed = TRUE;
	B_LogNote(TOPIC_Misk,TOPIC_Misk_EddaFishSoup);
};

/////////////////////////////////////// ОСТАЛЬНЫЕ /////////////////////////////////////////////

//===================================================
instance DIA_Edda_Tasty(C_Info)
{
	npc = VLK_471_Edda;				nr = 20;
	condition = DIA_Edda_Tasty_cond;
	information = DIA_Edda_Tasty_Info;
	description = "Как вкусно пахнет!";
};
func int DIA_Edda_Tasty_cond()
{
	if (!C_HeroIs_Rupert() && !C_HeroIs_Sarah()
		 && !Npc_KnowsInfo(other,DIA_Edda_Stink))	{
		return TRUE;
	};
};
func void DIA_Edda_Tasty_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Edda_Tasty_03_00");	//Как вкусно пахнет!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Edda_Tasty_07_00");	//Как вкусно пахнет!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Edda_Tasty_10_00");	//Как вкусно пахнет!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Edda_Tasty_14_00");	//Как вкусно пахнет!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Edda_Tasty_16_00");	//Как вкусно пахнет!
	};
	AI_Output(self,other,"DIA_Edda_Tasty_17_01");	//Спасибо. Хорошая уха всегда вкусно пахнет.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Edda_Tasty_03_02");	//А можно мне попробовать?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Edda_Tasty_07_02");	//А можно мне попробовать?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Edda_Tasty_10_02");	//А можно мне попробовать?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Edda_Tasty_14_02");	//А можно мне попробовать?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Edda_Tasty_16_02");	//А можно мне попробовать?
	};
	AI_Output(self,other,"DIA_Edda_Tasty_17_03");	//Я варю ее для всех, кто не может сам о себе позаботиться. Но я не могу варить уху без рыбы.
	AI_Output(self,other,"DIA_Edda_Tasty_17_04");	//Поэтому правило простое: приносишь рыбу - получаешь уху.
	Edda_Feed = TRUE;
	B_LogNote(TOPIC_Misk,TOPIC_Misk_EddaFishSoup);
};

//===================================================
instance DIA_Edda_Stink(C_Info)
{
	npc = VLK_471_Edda;				nr = 21;
	condition = DIA_Edda_Stink_cond;
	information = DIA_Edda_Stink_Info;
	description = "Что за вонь?";
};
func int DIA_Edda_Stink_cond()
{
	if (!C_HeroIs_Rupert() && !C_HeroIs_Sarah()
		 && !Npc_KnowsInfo(other,DIA_Edda_Tasty))	{
		return TRUE;
	};
};
func void DIA_Edda_Stink_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Edda_Stink_03_00");	//Что за вонь?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Edda_Stink_07_00");	//Что за вонь?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Edda_Stink_10_00");	//Что за вонь?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Edda_Stink_14_00");	//Что за вонь?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Edda_Stink_16_00");	//Что за вонь?
	};
	AI_Output(self,other,"DIA_Edda_Stink_17_01");	//Так пахнет рыба и бедняцкая уха.
	AI_Output(self,other,"DIA_Edda_Stink_17_02");	//Не нравится - отойди.
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Edda_StinkSorry(C_Info)
{
	npc = VLK_471_Edda;				nr = 22;
	condition = DIA_Edda_StinkSorry_cond;
	information = DIA_Edda_StinkSorry_Info;
	description = "Извини, я...";
};
func int DIA_Edda_StinkSorry_cond()
{
	if (!C_HeroIs_Rupert() && !C_HeroIs_Sarah()
		 && Npc_KnowsInfo(other,DIA_Edda_Stink))	{
		return TRUE;
	};
};
func void DIA_Edda_StinkSorry_Info()
{
	Info_ClearChoices(DIA_Edda_StinkSorry);
	Info_AddChoice(DIA_Edda_StinkSorry,"...просто не люблю рыбу.",DIA_Edda_StinkSorry_DontLikeFish);
	if (other.aivar[AIV_Gender] == MALE)	{
		Info_AddChoice(DIA_Edda_StinkSorry,"...просто сказал то, что думаю.",DIA_Edda_StinkSorry_BadSoup);
		Info_AddChoice(DIA_Edda_StinkSorry,"...сказал, не подумав.",DIA_Edda_StinkSorry_DidntThink);
	}	else	{
		Info_AddChoice(DIA_Edda_StinkSorry,"...просто сказала то, что думаю.",DIA_Edda_StinkSorry_BadSoup);
		Info_AddChoice(DIA_Edda_StinkSorry,"...сказала, не подумав.",DIA_Edda_StinkSorry_DidntThink);
	};
};
func void DIA_Edda_StinkSorry_DidntThink()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Edda_StinkSorry_DidntThink_03_00");	//Извини, я сказал, не подумав.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Edda_StinkSorry_DidntThink_07_00");	//Извини, я сказал, не подумав.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Edda_StinkSorry_DidntThink_10_00");	//Извини, я сказал, не подумав.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Edda_StinkSorry_DidntThink_14_00");	//Извини, я сказал, не подумав.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Edda_StinkSorry_DidntThink_16_00");	//Извини, я сказала, не подумав.
	};
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Edda_StinkSorry_DidntThink_17_01");	//Так думай в другой раз, прежде чем раскрыть рот.
	Info_ClearChoices(DIA_Edda_StinkSorry);
};
func void DIA_Edda_StinkSorry_BadSoup()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_03_00");	//Извини, я просто сказал то, что думаю.
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_03_01");	//Я не хотел тебя обидеть.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_07_00");	//Извини, я просто сказал то, что думаю.
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_07_01");	//Я не хотел тебя обидеть.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_10_00");	//Извини, я просто сказал то, что думаю.
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_10_01");	//Я не хотел тебя обидеть.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_14_00");	//Извини, я просто сказал то, что думаю.
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_14_01");	//Я не хотел тебя обидеть.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_16_00");	//Извини, я просто сказала то, что думаю.
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_16_01");	//Я не хотела тебя обидеть.
	};
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Edda_StinkSorry_BadSoup_17_02");	//Я уже сказала: не нравится - отойди.
	Info_ClearChoices(DIA_Edda_StinkSorry);
};
func void DIA_Edda_StinkSorry_DontLikeFish()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Edda_StinkSorry_DontLikeFish_03_00");	//Извини, я просто не люблю рыбу.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Edda_StinkSorry_DontLikeFish_07_00");	//Извини, я просто не люблю рыбу.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Edda_StinkSorry_DontLikeFish_10_00");	//Извини, я просто не люблю рыбу.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Edda_StinkSorry_DontLikeFish_14_00");	//Извини, я просто не люблю рыбу.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Edda_StinkSorry_DontLikeFish_16_00");	//Извини, я просто не люблю рыбу.
	};
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Edda_StinkSorry_DontLikeFish_17_01");	//Ну уж прости, не припасла я для тебя никаких деликатесов.
	AI_Output(self,other,"DIA_Edda_StinkSorry_DontLikeFish_17_02");	//Чем еще прикажешь кормить портовый народ, как не рыбой?
	Info_ClearChoices(DIA_Edda_StinkSorry);
};

//===================================================
instance DIA_Edda_StinkSorryPerm(C_Info)
{
	npc = VLK_471_Edda;				nr = 23;
	condition = DIA_Edda_StinkSorryPerm_cond;
	information = DIA_Edda_StinkSorryPerm_Info;
	description = "Еще раз извини.";
};
func int DIA_Edda_StinkSorryPerm_cond()
{
	if (!C_HeroIs_Rupert() && !C_HeroIs_Sarah()
		 && Npc_KnowsInfo(other,DIA_Edda_StinkSorry))	{
		return TRUE;
	};
};
func void DIA_Edda_StinkSorryPerm_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Edda_StinkSorryPerm_03_00");	//Еще раз извини.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Edda_StinkSorryPerm_07_00");	//Еще раз извини.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Edda_StinkSorryPerm_10_00");	//Еще раз извини.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Edda_StinkSorryPerm_14_00");	//Еще раз извини.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Edda_StinkSorryPerm_16_00");	//Еще раз извини.
	};
	AI_Output(self,other,"DIA_Edda_StinkSorryPerm_17_01");	//Извиняю. А теперь не мешай мне готовить.
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Edda_FishSoup(C_Info)
{
	npc = VLK_471_Edda;				nr = 50;
	condition = DIA_Edda_FishSoup_cond;
	information = DIA_Edda_FishSoup_Info;
	description = "Налей мне своей ухи.";
	permanent = TRUE;
};
func int DIA_Edda_FishSoup_cond()
{
	if (Edda_Feed)	{
		return TRUE;
	};
};
func void DIA_Edda_FishSoup_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Edda_FishSoup_03_00");	//Налей мне своей ухи.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Edda_FishSoup_07_00");	//Налей мне своей ухи.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Edda_FishSoup_10_00");	//Налей мне своей ухи.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Edda_FishSoup_14_00");	//Налей мне своей ухи.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Edda_FishSoup_16_00");	//Налей мне своей ухи.
	};
	if (!Wld_IsTime(22,0,6,0))	{
		if (Npc_HasItems(other,ItFo_Fish))	{
			B_GiveInvItems(other, self, ItFo_Fish,1);
			AI_Output(self,other,"DIA_Edda_FishSoup_17_01");	//Держи тарелку.
			B_GiveInvItems(self,other,ItFo_FishSoup,1);
		}
		else	{
			AI_Output(self,other,"DIA_Edda_FishSoup_17_02");	//Сначала принеси рыбу. Нет рыбы - нет ухи.
		};
	}
	else	{
		AI_Output(self,other,"DIA_Edda_FishSoup_17_03");	//Приходи утром.
	};
};

