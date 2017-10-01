
instance DIA_Borka_EXIT_Male(DIA_Proto_End)
{
	npc = VLK_434_Borka;
	condition = DIA_Borka_EXIT_Male_Cond;
};
func int DIA_Borka_EXIT_Male_Cond()
{
	if (other.aivar[AIV_Gender] == MALE) {
		return TRUE;
	};
};

//общие условия диалога вышибалы
const string Borka_Checkpoint = "NW_CITY_HABOUR_PUFF_IN_01";


//////////////////////////////////ДАМЫ////////////////////////////////////////
//вход строго воспрещен
//-----------------------------------------
var int DIA_Borka_Hello_Female_Husband_Once;
var int DIA_Borka_Hello_SaraAsked_Once;
var int Borka_Sarah_AgreedToTell;
var int Borka_Sarah_AgreedToPass;


instance DIA_Borka_EXIT_Female(DIA_Proto_End)
{
	npc = VLK_434_Borka;
	condition = DIA_Borka_EXIT_Female_Cond;
	information = DIA_Borka_Hello_Female_GoAway;
	description = "Уже ухожу. (КОНЕЦ)";
};
func int DIA_Borka_EXIT_Female_Cond()
{
	if (other.aivar[AIV_Gender] == FEMALE) {
		return TRUE;
	};
};
func void DIA_Borka_Hello_Female_GoAway()
{
		AI_Output(other,self,"DIA_Borka_Hello_Female_GoAway_16_00");	//Уже ухожу.
	AI_Output(self,other,"DIA_Borka_Hello_Female_GoAway_11_01");	//Вот и иди.
	AI_StopProcessInfos(self);
};

//-----------------------------------------
instance DIA_Borka_Hello_Female(C_INFO)
{
	npc = VLK_434_Borka;	nr = 1;
	condition = DIA_Borka_Hello_Female_cond;
	information = DIA_Borka_Hello_Female_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Borka_Hello_Female_cond()
{
	if ((other.aivar[AIV_Gender] == FEMALE)
		 && (self.aivar[AIV_Guardpassage_Status] == GP_NONE)
		 && ((Npc_GetDistToWP(other,Borka_Checkpoint) < 700) || DIA_WhenAsked_cond()))
	{
		return TRUE;
	};
};
func void DIA_Borka_Hello_Female_info()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)	{
		AI_Output(self,other,"DIA_Borka_Hello_Female_11_00");	//Стой! Бабам вход запрещен!
		if (DIA_Borka_Hello_Female_Husband_Once < 2)	{
			AI_Output(self,other,"DIA_Borka_Hello_Female_11_01");	//Нет тут твоего мужа!
			DIA_Borka_Hello_Female_Husband_Once = 1;
		};
	}
	else	{
		AI_Output(self,other,"DIA_Borka_Hello_Female_11_02");	//Вали отсюда!
	};
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Borka_Checkpoint);
};
//-----------------------------------------
instance DIA_Borka_LastWarn_Female(C_INFO)
{
	npc = VLK_434_Borka;			nr = 2;
	condition = DIA_Borka_LastWarn_Female_cond;
	information = DIA_Borka_LastWarn_Female_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Borka_LastWarn_Female_cond()
{
	if ((Npc_GetDistToWP(other,Borka_Checkpoint) < other.aivar[AIV_LastDistToWP] - 50)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && (self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
		&& (other.aivar[AIV_Gender] == FEMALE))	{
		return TRUE;
	};
};
func void DIA_Borka_LastWarn_Female_info()
{
	AI_Output(self,other,"DIA_Borka_LastWarn_Female_11_00");	//Ты глухая? Я сказал - вход воспрещен!
	AI_Output(self,other,"DIA_Borka_LastWarn_Female_11_01");	//Еще один шаг, и мне придется применить силу.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Borka_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};

//-----------------------------------------
instance DIA_Borka_Attack_Female(C_INFO)
{
	npc = VLK_434_Borka;			nr = 3;
	condition = DIA_Borka_Attack_Female_cond;
	information = DIA_Borka_Attack_Female_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Borka_Attack_Female_cond()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (other.aivar[AIV_Gender] == FEMALE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))	{
		if ((Npc_GetDistToWP(other,Borka_Checkpoint) < other.aivar[AIV_LastDistToWP] - 50) || (Npc_GetDistToWP(other,Borka_Checkpoint) < 200))	{
			return TRUE;
		};
	};
};
func void DIA_Borka_Attack_Female_info()
{
	AI_Output(self,other,"DIA_Borka_Attack_Female_11_00");	//Я предупреждал.
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_ClearRoom,1);
};

//-----------------------------------------
instance DIA_Borka_Female_Husband(C_INFO)
{
	npc = VLK_434_Borka;	nr = 5;
	condition = DIA_Borka_Female_Husband_cond;
	information = DIA_Borka_Female_Husband_info;
	description = "Моего мужа?";
};
func int DIA_Borka_Female_Husband_cond()
{
	if ((other.aivar[AIV_Gender] == FEMALE) && (DIA_Borka_Hello_Female_Husband_Once > 0))	{
		return TRUE;
	};
};
func void DIA_Borka_Female_Husband_info()
{
		AI_Output(other,self,"DIA_Borka_Hello_Female_Husband_16_00");	//Моего мужа?
	AI_Output(self,other,"DIA_Borka_Hello_Female_Husband_11_01");	//Жениха, отца, брата, свата... Никого нет! И нечего тебе здесь делать.
	DIA_Borka_Hello_Female_Husband_Once = 2;
};

//-----------------------------------------
instance DIA_Borka_Female_MayILook(C_INFO)
{
	npc = VLK_434_Borka;	nr = 50;
	condition = DIA_Borka_Female_MayILook_cond;
	information = DIA_Borka_Female_MayILook_info;
	description = "Я только одним глазком гляну!";
	permanent = TRUE;
};
func int DIA_Borka_Female_MayILook_cond()
{
	if (other.aivar[AIV_Gender] == FEMALE && (self.aivar[AIV_Guardpassage_Status] != GP_PASSGATE))	{
		return TRUE;
	};
};
func void DIA_Borka_Female_MayILook_info()
{
		AI_Output(other,self,"DIA_Borka_Hello_Female_MayILook_16_00");	//Я только одним глазком гляну!
	AI_Output(self,other,"DIA_Borka_Hello_Female_MayILook_11_01");	//Я сказал - нельзя. Иди куда-нибудь, не распугивай клиентов.
	AI_StopProcessInfos(self);
};
	
//////////////////////////////////ЕЛЕНА////////////////////////////////////////

//-----------------------------------------
instance DIA_Borka_Elena_Naive(C_INFO)
{
	npc = VLK_434_Borka;	nr = 10;
	condition = DIA_Borka_Elena_Naive_cond;
	information = DIA_Borka_Elena_Naive_info;
	description = "(наивно) Что здесь вообще такое?";
};
func int DIA_Borka_Elena_Naive_cond()
{
	if (C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Borka_Elena_Naive_info()
{
		AI_Output(other,self,"DIA_Borka_Hello_Female_Naive_16_00");	//(наивно) Что здесь вообще такое?
	AI_Output(self,other,"DIA_Borka_Hello_Female_Naive_11_01");	//Это... ээ... специальное заведение... только для мужчин. Они... мы... тут размышляем. Медитируем. При свете красных фонарей. Да.
	AI_Output(self,other,"DIA_Borka_Hello_Female_Naive_11_02");	//Но твоего здесь нет! Иди поищи его где-нибудь еще. 
};

//////////////////////////////////САРА////////////////////////////////////////
var int Borka_Sarah_Fight;

//-----------------------------------------
instance DIA_Borka_Sarah_LetMeIn(C_INFO)
{
	npc = VLK_434_Borka;	nr = 29;
	condition = DIA_Borka_Sarah_LetMeIn_cond;
	information = DIA_Borka_Sarah_LetMeIn_info;
	description = "Дай пройти!";
	permanent = TRUE;
};
func int DIA_Borka_Sarah_LetMeIn_cond()
{
	if (C_HeroIs_Sarah() && (self.aivar[AIV_Guardpassage_Status] != GP_PASSGATE))	{
		return TRUE;
	};
};
func void DIA_Borka_Sarah_LetMeIn_info()
{
		AI_Output(other,self,"DIA_Borka_Hello_Female_Sarah_16_00");	//Дай пройти! Я знаю Бромора и здешних девчонок как облупленных!
	AI_Output(self,other,"DIA_Borka_Hello_Female_Sarah_11_01");	//Тогда ты знаешь, что тебе тут делать нечего. Проваливай! 
	AI_StopProcessInfos(self);
};

//-----------------------------------------
instance DIA_Borka_Sarah_AskInsider(C_INFO)
{
	npc = VLK_434_Borka;	nr = 21;
	condition = DIA_Borka_Sarah_AskInsider_cond;
	information = DIA_Borka_Sarah_AskInsider_info;
	description = "Эй, ты ведь хорошо знаешь, что творится в этом заведении?";
	permanent = TRUE;
};
func int DIA_Borka_Sarah_AskInsider_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_MoeTalked && !Borka_Sarah_AgreedToTell)
	{
		if (DIA_Borka_Hello_SaraAsked_Once)	{
			DIA_Borka_Sarah_AskInsider.description = "Я все еще хочу получить ответ на свой вопрос.";
		};
		return TRUE;
	};
};
func void DIA_Borka_Sarah_AskInsider_info()
{
	if (!DIA_Borka_Hello_SaraAsked_Once)	{
			AI_Output(other,self,"DIA_Borka_Sarah_AskInsider_16_00");	//Эй, ты ведь хорошо знаешь, что творится в этом заведении?
		AI_Output(self,other,"DIA_Borka_Sarah_AskInsider_11_01");	//Сведения о клиентах не разглашаются!
			AI_Output(other,self,"DIA_Borka_Sarah_AskInsider_16_02");	//Чихала я на ваших клиентов! Скажи-ка, как у девчонок отношения между собой? Надя с кем-то дружит? Враждует?
		AI_Output(self,other,"DIA_Borka_Sarah_AskInsider_11_03");	//Хм, я мог бы тебе рассказать, если бы у меня была мотивация...
	}
	else	{
			AI_Output(other,self,"DIA_Borka_Sarah_AskInsider2_16_00");	//Я все еще хочу получить ответ на свой вопрос.
		AI_Output(self,other,"DIA_Borka_Sarah_AskInsider2_11_01");	//А я все еще нуждаюсь в мотивации.
	};
	Info_ClearChoices(DIA_Borka_Sarah_AskInsider);
	Info_AddChoice(DIA_Borka_Sarah_AskInsider,"У меня ничего нет. (НАЗАД)",DIA_Borka_Sarah_AskInsiderBack);
	Info_AddChoice(DIA_Borka_Sarah_AskInsider,"Как насчет пары оплеух?",DIA_Borka_Sarah_AskInsiderFight);
	if (C_NpcHasGold(other,100))	{
		Info_AddChoice(DIA_Borka_Sarah_AskInsider,"100 золотых.",DIA_Borka_Sarah_AskInsider100);
	};
	if (C_NpcHasGold(other,50))	{
		Info_AddChoice(DIA_Borka_Sarah_AskInsider,"50 золотых.",DIA_Borka_Sarah_AskInsider50);
	};
	if (C_NpcHasGold(other,20))	{
		Info_AddChoice(DIA_Borka_Sarah_AskInsider,"20 золотых.",DIA_Borka_Sarah_AskInsider20);
	};
	if (C_NpcHasGold(other,10))	{
		Info_AddChoice(DIA_Borka_Sarah_AskInsider,"10 золотых.",DIA_Borka_Sarah_AskInsider10);
	};
	DIA_Borka_Hello_SaraAsked_Once = TRUE;
};
func void DIA_Borka_Sarah_AskInsiderBack()
{
		AI_Output(other,self,"DIA_Borka_Sarah_AskInsiderBack_16_00");	//У меня ничего нет.
	AI_Output(self,other,"DIA_Borka_Sarah_AskInsiderBack_11_01");	//Жаль.
	AI_StopProcessInfos(self);
};
func void DIA_Borka_Sarah_AskInsider10()
{
		AI_Output(other,self,"DIA_Borka_Sarah_AskInsider10_16_00");	//10 золотых.
	AI_Output(self,other,"DIA_Borka_Sarah_AskInsider10_11_01");	//Обижаешь, зая.
};
func void DIA_Borka_Sarah_AskInsider20()
{
		AI_Output(other,self,"DIA_Borka_Sarah_AskInsider20_16_00");	//20 золотых.
	AI_Output(self,other,"DIA_Borka_Sarah_AskInsider20_11_01");	//Какая-то слабая мотивация.
};
func void DIA_Borka_Sarah_AskInsider50()
{
		AI_Output(other,self,"DIA_Borka_Sarah_AskInsider50_16_00");	//50 золотых.
	AI_Output(self,other,"DIA_Borka_Sarah_AskInsider50_11_01");	//Подойдет.
	B_GiveGold(other,self,50);
	Borka_Sarah_AgreedToTell = TRUE;
	Info_ClearChoices(DIA_Borka_Sarah_AskInsider);
};
func void DIA_Borka_Sarah_AskInsider100()
{
		AI_Output(other,self,"DIA_Borka_Sarah_AskInsider100_16_00");	//100 золотых.
	AI_Output(self,other,"DIA_Borka_Sarah_AskInsider100_11_01");	//Вот это щедрость!
	B_GiveGold(other,self,100);
	Borka_Sarah_AgreedToTell = TRUE;
	Info_ClearChoices(DIA_Borka_Sarah_AskInsider);
};
func void DIA_Borka_Sarah_AskInsiderFight()
{
		AI_Output(other,self,"DIA_Borka_Sarah_AskInsiderFight_16_00");	//Как насчет пары оплеух?
	AI_Output(self,other,"DIA_Borka_Sarah_AskInsiderFight_11_01");	//Это что, шутка такая? Ты, пигалица!
	Info_ClearChoices(DIA_Borka_Sarah_AskInsider);
	Info_AddChoice(DIA_Borka_Sarah_AskInsider,"Что, мало? Могу еще добавить уколов шпагой.",DIA_Borka_Sarah_AskInsiderFight2);
	Info_AddChoice(DIA_Borka_Sarah_AskInsider,"Да-да, шутка, не кипятись.",DIA_Borka_Sarah_AskInsiderNoFight);	
};
func void DIA_Borka_Sarah_AskInsiderNoFight()
{
		AI_Output(other,self,"DIA_Borka_Sarah_AskInsiderNoFight_16_00");	//Да-да, шутка, не кипятись.
	AI_Output(self,other,"DIA_Borka_Sarah_AskInsiderNoFight_11_01");	//Ты со мной не шути.
};
func void DIA_Borka_Sarah_AskInsiderFight2()
{
	AI_Output(other,self,"DIA_Borka_Sarah_AskInsiderFight2_16_00");	//Что, мало? Могу еще добавить уколов шпагой.
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)	{
		AI_Output(self,other,"DIA_Borka_Sarah_AskInsiderFight2_11_01");	//Что?! Ах ты... Ну доставай эту свою шпагу! И я больше не буду таким вежливым!
	}
	else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)	{
		AI_Output(self,other,"DIA_Borka_Sarah_AskInsiderFight2_11_02");	//Думаешь, я так легко сдамся? Доставай эту свою шпагу!
	}
	else	{
		AI_Output(self,other,"DIA_Borka_Sarah_AskInsiderFight2_11_03");	//Думаешь, в этот раз все будет по-другому? Ну давай, попробуем!
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	Borka_Sarah_Fight = TRUE;
};

//-----------------------------------------
instance DIA_Borka_Sarah_FightEnd(C_INFO)
{
	npc = VLK_434_Borka;			nr = 0;
	condition = DIA_Borka_Sarah_FightEnd_cond;
	information = DIA_Borka_Sarah_FightEnd_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Borka_Sarah_FightEnd_cond()
{
	if (C_HeroIs_Sarah()
		 && Borka_Sarah_Fight && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))	{
		return TRUE;
	};
};
func void DIA_Borka_Sarah_FightEnd_info()
{
	Borka_Sarah_Fight = FALSE;
	self.aivar[AIV_LastFightComment] = TRUE;
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)	{
			AI_Output(other,self,"DIA_Borka_Sarah_FightEnd_16_01");	//Ну как, достаточная мотивация?
		AI_Output(self,other,"DIA_Borka_Sarah_FightEnd_11_02");	//Стерва!
			AI_Output(other,self,"DIA_Borka_Sarah_FightEnd_16_03");	//Я пропущу это мимо ушей. И даже никому не скажу, что тебе наваляла девчонка.
		AI_Output(self,other,"DIA_Borka_Sarah_FightEnd_11_04");	//Гррр.
		Borka_Sarah_AgreedToTell = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Borka_Sarah_FightEnd_11_05");	//Ну что, киса, угомонилась?
		AI_Output(self,other,"DIA_Borka_Sarah_FightEnd_11_06");	//А теперь, если у тебя еще есть золото, мы можем восстановить дружеские отношения.
	};
};

//-----------------------------------------
instance DIA_Borka_Sarah_TellInsider(C_INFO)
{
	npc = VLK_434_Borka;			nr = 22;
	condition = DIA_Borka_Sarah_TellInsider_cond;
	information = DIA_Borka_Sarah_TellInsider_info;
	important = TRUE;
};
func int DIA_Borka_Sarah_TellInsider_cond()
{
	if (C_HeroIs_Sarah()
		 && Borka_Sarah_AgreedToTell)	{
		return TRUE;
	};
};
func void DIA_Borka_Sarah_TellInsider_info()
{
	AI_Output(self,other,"DIA_Borka_Sarah_TellInsider_11_01");	//Ладно, слушай, повторять не буду.
	AI_Output(self,other,"DIA_Borka_Sarah_TellInsider_11_02");	//Надя у нас на особом положении из-за своего таланта. И характер у нее не сахар. От остальных девочек она держится особняком, они ее тоже недолюбливают.
	AI_Output(self,other,"DIA_Borka_Sarah_TellInsider_11_03");	//Но еще больше все не любят Люсию. Та еще штучка. 
	AI_Output(self,other,"DIA_Borka_Sarah_TellInsider_11_04");	//А с Надей они почти на ножах. Что бы одна не сказала, вторая сделает наоборот.
		AI_Output(other,self,"DIA_Borka_Sarah_TellInsider_16_05");	//Это то, что нужно! Пропусти меня, я с ней поговорю.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_KnowLucia);
	AI_Output(self,other,"DIA_Borka_Sarah_TellInsider_11_06");	//Мы так не договаривались! Бромор желчью изойдет, если я впущу бабу!
	Info_ClearChoices(DIA_Borka_Sarah_TellInsider);
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) {
		Info_AddChoice(DIA_Borka_Sarah_TellInsider,"Тебе еще раз отвесить? Лучше всего на глазах у Бромора.",DIA_Borka_Sarah_TellInsider_AddHit);
	}
	else if (C_NpcHasGold(other,50))	{
		Info_AddChoice(DIA_Borka_Sarah_TellInsider,"Как насчет еще 50 золотых?",DIA_Borka_Sarah_TellInsider_AddGold50);
	}
	else	{
		Info_AddChoice(DIA_Borka_Sarah_TellInsider,"Может, все-таки договоримся?",DIA_Borka_Sarah_TellInsider_AddNone);
	};
};
func void DIA_Borka_Sarah_Passgate()
{
	AI_Output(self,other,"DIA_Borka_Sarah_Passgate_11_01");	//Знаешь, у меня вдруг так живот скрутило... Пришлось отойти и я не мог тебя остановить.
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	Borka_Sarah_AgreedToPass = TRUE;
	AI_StopProcessInfos(self);
};
func void DIA_Borka_Sarah_TellInsider_AddHit()
{
		AI_Output(other,self,"DIA_Borka_Sarah_TellInsider_AddHit_16_00");	//Тебе еще раз отвесить? Лучше всего на глазах у Бромора.
	DIA_Borka_Sarah_Passgate();
};
func void DIA_Borka_Sarah_TellInsider_AddGold50()
{
		AI_Output(other,self,"DIA_Borka_Sarah_TellInsider_AddGold50_16_00");	//Как насчет еще 50 золотых?
	AI_Output(self,other,"DIA_Borka_Sarah_AddGold50_11_01");	//Мало.
	Info_ClearChoices(DIA_Borka_Sarah_TellInsider);
	Info_AddChoice(DIA_Borka_Sarah_TellInsider,"Может, все-таки договоримся?",DIA_Borka_Sarah_TellInsider_AddNone);
	if (C_NpcHasGold(other,100))	{
		Info_AddChoice(DIA_Borka_Sarah_TellInsider,"100 золотых тебя устроит?",DIA_Borka_Sarah_TellInsider_AddGold100);
	};
};
func void DIA_Borka_Sarah_TellInsider_AddGold100()
{
		AI_Output(other,self,"DIA_Borka_Sarah_TellInsider_AddGold100_16_00");	//100 золотых тебя устроит?
	B_GiveGold(other,self,100);
	DIA_Borka_Sarah_Passgate();
};
func void DIA_Borka_Sarah_TellInsider_AddNone()
{
		AI_Output(other,self,"DIA_Borka_Sarah_TellInsider_AddNone_16_00");	//Может, все-таки договоримся?
	AI_Output(self,other,"DIA_Borka_Sarah_AddNone_11_01");	//Договоримся - если у тебя будет достаточно золота.
	AI_StopProcessInfos(self);
};

//////////////////////////////////МУЖИКИ////////////////////////////////////////
//-----------------------------------------
var int DIA_Borka_Hello_Male_Once;
instance DIA_Borka_Hello_Male(C_INFO)
{
	npc = VLK_434_Borka;	nr = 30;
	condition = DIA_Borka_Hello_Male_cond;
	information = DIA_Borka_Hello_Male_info;
	important = TRUE;
};
func int DIA_Borka_Hello_Male_cond()
{
	if ((other.aivar[AIV_Gender] == MALE)
		 && ((Npc_GetDistToWP(other,Borka_Checkpoint) < 600) || DIA_WhenAsked_cond()))	{
		return TRUE;
	};
};
func void DIA_Borka_Hello_Male_info()
{
	if (!DIA_Borka_Hello_Male_Once)	{
		AI_Output(self,other,"DIA_Borka_Hello_Male_11_00");	//Добро пожаловать! 
		DIA_Borka_Hello_Male_Once = TRUE;
	};
	AI_Output(self,other,"DIA_Borka_Hello_Male_11_01");	//Проходи скорее, вкуси прелести жизни при свете Красного фонаря.
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	AI_StopProcessInfos(self);
};

