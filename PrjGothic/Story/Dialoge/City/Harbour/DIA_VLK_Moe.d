
instance DIA_Moe_EXIT(DIA_Proto_End)
{
	npc = VLK_432_Moe;
};

//ГГ отойдет от греха подальше
func void _DIA_Moe_GoOut()
{
	AI_GotoWP(hero,"NW_CITY_PATH_HABOUR_02");
};

//общие условия диалога вышибалы
func int DIA_Moe_AllCond()
{
	if ((Npc_GetDistToWP(other,"NW_CITY_HABOUR_TAVERN01_ENTRY") < 500)
		&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
		&& (self.aivar[AIV_Guardpassage_Status] != GP_PASSGATE))	{
		return TRUE;
	};
};

//////////////////////////////////САРА////////////////////////////////////////
//-----------------------------------------
instance DIA_Moe_Hello_Sarah(C_INFO)
{
	npc = VLK_432_Moe;			nr = 1;
	condition = DIA_Moe_Hello_Sarah_cond;
	information = DIA_Moe_Hello_Sarah_info;
	important = TRUE;
};
func int DIA_Moe_Hello_Sarah_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Sarah())	{
		return TRUE;
	};
};
func void DIA_Moe_Hello_Sarah_info()
{
	AI_Output(self,other,"DIA_Moe_Hello_Sarah_01_00");	//Сара! Сколько лет, сколько зим...
	AI_Output(self,other,"DIA_Moe_Hello_Sarah_01_01");	//(ухмыляясь) Что, соскучилась по мне?
		AI_Output(other,self,"DIA_Moe_Hello_Sarah_16_02");	//Как по дырке в голове! У тебя, я смотрю, прибавилась одна.
	AI_Output(self,other,"DIA_Moe_Hello_Sarah_01_03");	//А язычок у тебя точно такой же острый. 
		AI_Output(other,self,"DIA_Moe_Hello_Sarah_16_04");	//Только теперь у меня такая же острая шпага.
	AI_Output(self,other,"DIA_Moe_Hello_Sarah_01_05");	//Какая грозная! (подмигивая) Ладно, проходи, да смотри, не порань кого.
	B_GivePlayerXP(XP_Moe_Respect);
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_Moe);
};
//-----------------------------------------
instance DIA_Moe_Sarah_AboutNadja(C_INFO)
{
	npc = VLK_432_Moe;			nr = 2;
	condition = DIA_Moe_Sarah_AboutNadja_cond;
	information = DIA_Moe_Sarah_AboutNadja_info;
	description = "Эй, Мо, разговор есть.";
};
func int DIA_Moe_Sarah_AboutNadja_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_EddaAsked)	{
		return TRUE;
	};
};
func void DIA_Moe_Sarah_AboutNadja_info()
{
		AI_Output(other,self,"DIA_Moe_Sarah_AboutNadja_16_00");	//Эй, Мо, разговор есть.
	AI_Output(self,other,"DIA_Moe_Sarah_AboutNadja_01_01");	//Чего тебе?
		AI_Output(other,self,"DIA_Moe_Sarah_AboutNadja_16_02");	//Помнишь Надю?
	AI_Output(self,other,"DIA_Moe_Sarah_AboutNadja_01_03");	//Забудешь тут. Каждую ночь передо мной по... факелами крутит.
		AI_Output(other,self,"DIA_Moe_Sarah_AboutNadja_16_04");	//Я хочу ей помочь. Если она не бросит курить, для нее это плохо закончится.
	AI_Output(self,other,"DIA_Moe_Sarah_AboutNadja_01_05");	//А я тут причем?
		AI_Output(other,self,"DIA_Moe_Sarah_AboutNadja_16_06");	//Поговори с ней. Я для нее больше не авторитет.
	AI_Output(self,other,"DIA_Moe_Sarah_AboutNadja_01_07");	//А я прям авторитет великий. Но я не о том спрашивал.
		AI_Output(other,self,"DIA_Moe_Sarah_AboutNadja_16_08");	//Я тебе заплачу.
	AI_Output(self,other,"DIA_Moe_Sarah_AboutNadja_01_09");	//Золото - это хорошо. Но мне надо кой-чего другое. Ты ж торговка? 
		AI_Output(other,self,"DIA_Moe_Sarah_AboutNadja_16_10");	//Ну да.
	AI_Output(self,other,"DIA_Moe_Sarah_AboutNadja_01_11");	//Достань для меня бутылочку белого рома. Эта бурда, которую тут Кардиф разливает, ни на что не годится.
	MIS_Sarah_BadHabit_MoeAsked = TRUE;
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_MoeWillTalk);
};
//-----------------------------------------
instance DIA_Moe_Sarah_WhereRum(C_INFO)
{
	npc = VLK_432_Moe;			nr = 3;
	condition = DIA_Moe_Sarah_WhereRum_cond;
	information = DIA_Moe_Sarah_WhereRum_info;
	description = "И где мне взять ром?";
};
func int DIA_Moe_Sarah_WhereRum_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_MoeAsked
		 && !Npc_HasItems(other,ItFo_Addon_Rum) && !MIS_Sarah_BadHabit_MoeTalked)	{
		return TRUE;
	};
};
func void DIA_Moe_Sarah_WhereRum_info()
{
		AI_Output(other,self,"DIA_Moe_Sarah_WhereRum_16_00");	//И где мне взять ром?
	AI_Output(self,other,"DIA_Moe_Sarah_WhereRum_01_01");	//Эй, кто из нас торговец? Но я точно знаю, что он откуда-то всплывает в порту.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_Bootleggers);

};
//-----------------------------------------
instance DIA_Moe_Sarah_GiveRum(C_INFO)
{
	npc = VLK_432_Moe;			nr = 4;
	condition = DIA_Moe_Sarah_GiveRum_cond;
	information = DIA_Moe_Sarah_GiveRum_info;
	description = "Вот твой ром.";
};
func int DIA_Moe_Sarah_GiveRum_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_MoeAsked
		 && Npc_HasItems(other,ItFo_Addon_Rum) && !MIS_Sarah_BadHabit_MoeTalked)	{
		return TRUE;
	};
};
func void DIA_Moe_Sarah_GiveRum_info()
{
		AI_Output(other,self,"DIA_Moe_Sarah_GiveRum_16_00");	//Вот твой ром.
	B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
	AI_Output(self,other,"DIA_Moe_Sarah_GiveRum_01_01");	//Отлично! Я в тебя верил, так что уже поболтал с Надей.
	AI_Output(self,other,"DIA_Moe_Sarah_GiveRum_01_02");	//Милая цыпа, но упрямая как сто баранов. Или тупая.
	AI_Output(self,other,"DIA_Moe_Sarah_GiveRum_01_03");	//Ты ее не убедишь. Брось это дело. Болотник ей последние мозги выел, она ни о чем другом думать не хочет.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_MoeFailed);
	B_GivePlayerXP(XP_Sarah_Nadja_MoeTalked);
	MIS_Sarah_BadHabit_MoeTalked = TRUE;
};


///////////////////////////////////ЕЛЕНА//////////////////////////////////////
//-----------------------------------------
instance DIA_Moe_Hello_Elena(C_INFO)
{
	nr = 10;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Hello_Elena_cond;
	information = DIA_Moe_Hello_Elena_info;
	important = TRUE;
};
func int DIA_Moe_Hello_Elena_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Moe_Hello_Elena_info()
{
	AI_Output(self,other,"DIA_Moe_Hello_Elena_01_00");	//Эй!
		AI_Output(other,self,"DIA_Moe_Hello_Elena_16_01");	//Что? В этот бар не пускают женщин?
	AI_Output(self,other,"DIA_Moe_Hello_Elena_01_02");	//Пускают, но должен тебя предупредить - ребята тут грубые. И здесь нет стражников, защищающих таких девочек, как ты.
	AI_Output(self,other,"DIA_Moe_Hello_Elena_01_03");	//Если будут проблемы, зови меня.
	B_GivePlayerXP(XP_Moe_Respect);
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
};

///////////////////////////////////ТАЛБИН//////////////////////////////////////
//-----------------------------------------
instance DIA_Moe_Hello_Talbin(C_INFO)
{
	nr = 20;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Hello_Talbin_cond;
	information = DIA_Moe_Hello_Talbin_info;
	important = TRUE;
};
func int DIA_Moe_Hello_Talbin_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Talbin())	{
		return TRUE;
	};
};
func void DIA_Moe_Hello_Talbin_info()
{
	AI_Output(self,other,"DIA_Moe_Hello_Talbin_01_01");	//Ты выглядишь крепким парнем. Проходи.
	B_GivePlayerXP(XP_Moe_Respect);
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
};

///////////////////////////////////ОДО//////////////////////////////////////
//-----------------------------------------
instance DIA_Moe_Hello_Odo(C_INFO)
{
	nr = 30;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Hello_Odo_cond;
	information = DIA_Moe_Hello_Odo_info;
	important = TRUE;
};
func int DIA_Moe_Hello_Odo_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Moe_Hello_Odo_info()
{
	if (!C_NpcWears(other, ItAr_NOV_L))	{
		AI_Output(self,other,"DIA_Moe_Hello_Odo_01_01");	//А ты еще кто? Не видал тебя здесь раньше.
			AI_Output(other,self,"DIA_Moe_Hello_Odo_03_02");	//Я послушник из Монастыря Инноса.
	};
	AI_Output(self,other,"DIA_Moe_Hello_Odo_01_03");	//Что тебе тут нужно? Это не молельня, и винишко мы у вас не заказывали.
	Info_ClearChoices(DIA_Moe_Hello_Odo);
	Info_AddChoice(DIA_Moe_Hello_Odo,"Я просто проходил мимо.",DIA_Moe_Hello_Odo_PassBy);
	Info_AddChoice(DIA_Moe_Hello_Odo,"Я просто хочу заглянуть внутрь.",DIA_Moe_Hello_Odo_GetIn);
};	
func void DIA_Moe_Hello_Odo_PassBy()
{
		AI_Output(other,self,"DIA_Moe_Hello_Odo_PassBy_03_01");	//Я просто проходил мимо.
	AI_Output(self,other,"DIA_Moe_Hello_Odo_PassBy_01_01");	//Так и иди, куда шел.
	_DIA_Moe_GoOut();
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Odo_GetIn()
{
		AI_Output(other,self,"DIA_Moe_Hello_Odo_GetIn_03_01");	//Я просто хочу заглянуть внутрь.
	AI_Output(self,other,"DIA_Moe_Hello_Odo_01_GetIn_01");	//Отлично. Вход в кабак стоит 50 золотых.
	Info_ClearChoices(DIA_Moe_Hello_Odo);
	Info_AddChoice(DIA_Moe_Hello_Odo,"Я не могу заплатить столько.",DIA_Moe_Hello_Odo_NoPay);
	if (C_NpcHasGold(other,50))	{
		Info_AddChoice(DIA_Moe_Hello_Odo,"Вот, возьми.",DIA_Moe_Hello_Odo_Pay);
	};
};
func void DIA_Moe_Hello_Odo_Pay()
{
	B_GiveGold(other,self,50);
		AI_Output(other,self,"DIA_Moe_Hello_Odo_Pay_03_01");	//Вот, возьми.
	AI_Output(self,other,"DIA_Moe_Hello_Odo_Pay_01_01");	//Проходите, Ваше Будущее Высокопреосвященство.
	B_GivePlayerXP(XP_Moe_Respect);
	Moe_Sign = TRUE;
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Odo_NoPay()
{	
		AI_Output(other,self,"DIA_Moe_Hello_Odo_NoPay_03_01");	//Я не могу заплатить столько.
	AI_Output(self,other,"DIA_Moe_Hello_Odo_NoPay_01_01");	//Какая жалость. Тогда я не могу впустить тебя.
	_DIA_Moe_GoOut();
	AI_StopProcessInfos(self);
};
//-----------------------------------------
instance DIA_Moe_Odo_AskPay(C_INFO)
{
	nr = 31;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Odo_AskPay_cond;
	information = DIA_Moe_Odo_AskPay_info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Moe_Odo_AskPay_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Odo()
		&& Npc_KnowsInfo(other,DIA_Moe_Hello_Odo))	{
		return TRUE;
	};
};
func void DIA_Moe_Odo_AskPay_info()
{
	AI_Output(self,other,"DIA_Moe_Odo_AskPay_01_00");	//Если хочешь войти - плати 50 золотых.
	Info_ClearChoices(DIA_Moe_Odo_AskPay);
	Info_AddChoice(DIA_Moe_Odo_AskPay,"Я не могу заплатить столько.",DIA_Moe_Hello_Odo_NoPay);
	if (C_NpcHasGold(other,50))	{
		Info_AddChoice(DIA_Moe_Odo_AskPay,"Вот, возьми.",DIA_Moe_Hello_Odo_Pay);
	};
};

///////////////////////////////////ЭРОЛ//////////////////////////////////////
//-----------------------------------------
instance DIA_Moe_Hello_Erol(C_INFO)
{
	nr = 40;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Hello_Erol_cond;
	information = DIA_Moe_Hello_Erol_info;
	important = TRUE;
};
func int DIA_Moe_Hello_Erol_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Erol())	{
		return TRUE;
	};
};
func void DIA_Moe_Hello_Erol_info()
{
	AI_Output(self,other,"DIA_Moe_Hello_Erol_01_00");	//А ты кто такой? Смотришь, словно большие шишки из Верхнего квартала, и идешь прямо в наш скромный портовый кабак.
	Info_ClearChoices(DIA_Moe_Hello_Erol);
	Info_AddChoice(DIA_Moe_Hello_Erol,"А ты хочешь меня остановить?",DIA_Moe_Hello_Erol_StopMe);
	Info_AddChoice(DIA_Moe_Hello_Erol,"Хочешь проверить, каков я в драке?",DIA_Moe_Hello_Erol_Fight);
	Info_AddChoice(DIA_Moe_Hello_Erol,"Я не собираюсь идти в твой кабак.",DIA_Moe_Hello_Erol_WontGo);
	Info_AddChoice(DIA_Moe_Hello_Erol,"Тебе показалось. Я не иду в кабак.",DIA_Moe_Hello_Erol_PassBy);
};
func void DIA_Moe_Hello_Erol_PassBy()
{
		AI_Output(other,self,"DIA_Moe_Hello_Erol_PassBy_10_00");	//Тебе показалось. Я не иду в кабак.
	AI_Output(self,other,"DIA_Moe_Hello_Erol_PassBy_01_01");	//А может все-таки зайдешь? Вход стоит всего 100 золотых.
	Info_ClearChoices(DIA_Moe_Hello_Erol);
	Info_AddChoice(DIA_Moe_Hello_Erol,"Я не собираюсь тебе платить.",DIA_Moe_Hello_Erol_NoPay);
	if (C_NpcHasGold(other,50))	{
		Info_AddChoice(DIA_Moe_Hello_Erol,"50 золотых и ни монетой больше.",DIA_Moe_Hello_Erol_Pay50);
	};
	if (C_NpcHasGold(other,100))	{
		Info_AddChoice(DIA_Moe_Hello_Erol,"Уговорил. Вот деньги. (100 зол.)",DIA_Moe_Hello_Erol_Pay100);
	};
};
func void DIA_Moe_Hello_Erol_Pay100()
{
	B_GiveGold(other,self,100);
		AI_Output(other,self,"DIA_Moe_Hello_Erol_Pay100_10_00");	//Уговорил. Вот деньги.
	AI_Output(self,other,"DIA_Moe_Hello_Erol_Pay100_01_01");	//Добро пожаловать. (наглая ухмылка)
	Moe_Sign = TRUE;
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Erol_Pay50()
{
	B_GiveGold(other,self,50);
		AI_Output(other,self,"DIA_Moe_Hello_Erol_Pay50_10_00");	//50 золотых и ни монетой больше.
		AI_Output(other,self,"DIA_Moe_Hello_Erol_Pay50_10_01");	//Можешь попробовать взять остальное, но я не обещаю, что твоя челюсть останется целой.
	AI_Output(self,other,"DIA_Moe_Hello_Erol_Pay50_01_02");	//Я вижу, ты парень не промах. Проходи.
	B_GivePlayerXP(XP_Moe_Respect);
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Erol_NoPay()
{
		AI_Output(other,self,"DIA_Moe_Hello_Erol_NoPay_10_00");	//Я не собираюсь тебе платить.
		AI_Output(other,self,"DIA_Moe_Hello_Erol_NoPay_10_01");	//Если я ЗАХОЧУ, то я ВОЙДУ в этот кабак.
	AI_Output(self,other,"DIA_Moe_Hello_Erol_NoPay_01_02");	//Правда? Давай попробуем.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
func void DIA_Moe_Hello_Erol_WontGo()
{
		AI_Output(other,self,"DIA_Moe_Hello_Erol_WontGo_10_00");	//Я не собираюсь идти в твой кабак, даже если ты мне заплатишь за это.
	AI_Output(self,other,"DIA_Moe_Hello_Erol_WontGo_01_01");	//Вот как? Хорошо, давай я тебе немного отсыплю.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};
func void DIA_Moe_Hello_Erol_Fight()
{
			AI_Output(other,self,"DIA_Moe_Hello_Erol_Fight_10_00");	//Хочешь проверить, каков я в драке?
		AI_Output(self,other,"DIA_Moe_Hello_Erol_Fight_01_01");	//Ну, раз ты ТАК ставишь вопрос... Защищайся.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
func void DIA_Moe_Hello_Erol_StopMe()
{
		AI_Output(other,self,"DIA_Moe_Hello_Erol_StopMe_10_00");	//А ты хочешь меня остановить?
	AI_Output(self,other,"DIA_Moe_Hello_Erol_StopMe_01_01");	//(пристально смотрит) Нет, проходи.
	B_GivePlayerXP(XP_Moe_Respect);
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	AI_StopProcessInfos(self);
};
//-----------------------------------------
instance DIA_Moe_Erol_FightAfter(C_INFO)
{
	nr = 41;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Erol_FightAfter_cond;
	information = DIA_Moe_Erol_FightAfter_info;
	important = TRUE;
};
func int DIA_Moe_Erol_FightAfter_cond()
{
	if (C_HeroIs_Erol() && Npc_KnowsInfo(other,DIA_Moe_Hello_Erol)
		&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))	{
		return TRUE;
	};
};
func void DIA_Moe_Erol_FightAfter_info()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Moe_Erol_FightAfter_01_00");	//Оох, моя голова... Ну и удар у тебя!
		AI_Output(self,other,"DIA_Moe_Erol_FightAfter_01_01");	//Похоже, ты все-таки подходишь этому месту. Заходи.
		B_GivePlayerXP(XP_Moe_Respect);
	}
	else	{
		AI_Output(self,other,"DIA_Moe_Erol_FightAfter_01_02");	//Вот видишь, не стоило связываться со мной.
	};
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_DIST_CANCEL)	{
		self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	};
	self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
	AI_StopProcessInfos(self);
};
//-----------------------------------------
instance DIA_Moe_Erol_AskPay(C_INFO)
{
	nr = 42;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Erol_AskPay_cond;
	information = DIA_Moe_Erol_AskPay_info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Moe_Erol_AskPay_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Erol()
		&& Npc_KnowsInfo(other,DIA_Moe_Hello_Erol)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))	{
		return TRUE;
	};
};
func void DIA_Moe_Erol_AskPay_info()
{
	AI_Output(self,other,"DIA_Moe_Erol_AskPay_01_00");	//Если хочешь войти - плати 100 золотых.
	Info_ClearChoices(DIA_Moe_Erol_AskPay);
	Info_AddChoice(DIA_Moe_Erol_AskPay,"Я не собираюсь тебе платить.",DIA_Moe_Hello_Erol_NoPay2);
	if (C_NpcHasGold(other,100))	{
		Info_AddChoice(DIA_Moe_Erol_AskPay,"Уговорил. Вот деньги. (100 зол.)",DIA_Moe_Hello_Erol_Pay100);
	};
};

func void DIA_Moe_Hello_Erol_NoPay2()
{
		AI_Output(other,self,"DIA_Moe_Hello_Erol_NoPay_10_00");	//Я не собираюсь тебе платить.
	AI_Output(self,other,"DIA_Moe_Hello_Erol_NoPay2_01_02");	//Похоже ты так и не понял, какие тут порядки.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


///////////////////////////////////РУПЕРТ//////////////////////////////////////
var int Moe_Rupert_GiveBottle;
var int DIA_Moe_Hello_Rupert_Once;
//-----------------------------------------
instance DIA_Moe_Hello_Rupert(C_INFO)
{
	nr = 50;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Hello_Rupert_cond;
	information = DIA_Moe_Hello_Rupert_info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Moe_Hello_Rupert_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Rupert()
		&& (MIS_Rupert_Debts_Paid[Creditor_Kardif] == FALSE))	{
		return TRUE;
	};
};
func void DIA_Moe_Hello_Rupert_info()
{
	if (!DIA_Moe_Hello_Rupert_Once)	{
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_01_00");	//А я уж думал, что ты тут больше не появишься.
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_01_01");	//Кардиф просил напомнить, что ты должен ему 60 золотых. И я не впущу тебя, пока ты не погасишь долг.
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Kardif_Sum);
		DIA_Moe_Hello_Rupert_Once = TRUE;
	}
	else	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)	{
			AI_Output(self,other,"DIA_Moe_Rupert_AskPay_01_01");	//Неважно, сколько раз ты меня побьешь.
			AI_Output(self,other,"DIA_Moe_Rupert_AskPay_01_02");	//Это не отменяет твоего долга перед Кардифом.
		};
		AI_Output(self,other,"DIA_Moe_Rupert_AskPay_01_00");	//Ты все еще должен 60 золотых.
	};
	Info_ClearChoices(DIA_Moe_Hello_Rupert);
	Info_AddChoice(DIA_Moe_Hello_Rupert,"У меня нет денег.",DIA_Moe_Hello_Rupert_NoPay);
	if (C_NpcHasGold(other,60))	{
		Info_AddChoice(DIA_Moe_Hello_Rupert,"Вот деньги. (60 зол.)",DIA_Moe_Hello_Rupert_Pay);
	};
};
func void DIA_Moe_Hello_Rupert_Pay()
{
	B_GiveGold(other,self,60);
	B_RupertPayDebt(Creditor_Kardif);
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
		AI_Output(other,self,"DIA_Moe_Hello_Rupert_Pay_03_00");	//Вот деньги.
	AI_Output(self,other,"DIA_Moe_Hello_Rupert_Pay_01_01");	//Невероятно. Ты при деньгах. Не угостишь меня бутылочкой?
		AI_Output(other,self,"DIA_Moe_Hello_Rupert_Pay_03_02");	//А ты не боишься, что однажды кто-нибудь угостит тебя бутылочкой по голове?
	AI_Output(self,other,"DIA_Moe_Hello_Rupert_Pay_01_03");	//Уже пробовали, как видишь. Так угостишь?
	Moe_Rupert_GiveBottle = 1;
	Info_ClearChoices(DIA_Moe_Hello_Rupert);
	Info_AddChoice(DIA_Moe_Hello_Rupert,"Обойдешься.",DIA_Moe_Hello_Rupert_NoBottle);
	if (Npc_HasItems(other,ItFo_Booze))	{
		Info_AddChoice(DIA_Moe_Hello_Rupert,"Вот, держи бутылку.",DIA_Moe_Hello_Rupert_GiveBottle);
	}
	else	{
		Info_AddChoice(DIA_Moe_Hello_Rupert,"Угощу, когда она у меня будет.",DIA_Moe_Hello_Rupert_BottleLater);
	};
};
func void DIA_Moe_Hello_Rupert_GiveBottle()
{
	B_GiveInvItems(other,self,ItFo_Booze,1);
	Moe_Rupert_GiveBottle = 2;
		AI_Output(other,self,"DIA_Moe_Hello_Rupert_GiveBottle_03_00");	//Вот, держи бутылку.
	AI_Output(self,other,"DIA_Moe_Hello_Rupert_GiveBottle_01_01");	//Наш человек.
	if (!MIS_Rupert_Debts_Paid[Creditor_Lehmar])	{
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_GiveBottle_01_02");	//За это я дам тебе совет - если хочешь расплатиться с Лемаром, достань ему меч из магической руды.
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_GiveBottle_01_03");	//За него он простит любой долг.
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Lehmar_Alt);
		B_GivePlayerXP(XP_Moe_Respect);
		MIS_Rupert_Debts_Lehmar_Sword = MIS_Rupert_Debts_Lehmar_SwordKnown;
	};
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Rupert_BottleLater()
{
	AI_Output(other,self,"DIA_Moe_Hello_Rupert_BottleLater_03_00");	//Угощу, когда она у меня будет.
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_BottleLater_01_01");	//Так чего стоишь? Заходи.
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Rupert_NoBottle()
{
	AI_Output(other,self,"DIA_Moe_Hello_Rupert_NoBottle_03_00");	//Обойдешься.
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_NoBottle_01_01");	//Я тебе это припомню.
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Rupert_NoPay()
{
	AI_Output(other,self,"DIA_Moe_Hello_Rupert_NoPay_03_00");	//У меня нет денег.
	if (!C_NpcHasGold(other,100))	{
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_NoPay_01_01");	//Тогда ИДИ и ДОСТАНЬ их.
		_DIA_Moe_GoOut();
		AI_StopProcessInfos(self);
	}
	else	{
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_NoPay_01_02");	//Не пытайся провести меня! У тебя полные карманы золота!
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_NoPay_01_03");	//И если ты не хочешь его отдавать, то я заберу его сам!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};
//-----------------------------------------
instance DIA_Moe_Rupert_GiveBottle(C_INFO)
{
	nr = 51;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Rupert_GiveBottle_cond;
	information = DIA_Moe_Hello_Rupert_GiveBottle;
	description = "Вот, держи бутылку.";
};
func int DIA_Moe_Rupert_GiveBottle_cond()
{
	if (C_HeroIs_Rupert()
		&& (Moe_Rupert_GiveBottle == 1) && (Npc_HasItems(other,ItFo_Booze)))	{
		return TRUE;
	};
};

///////////////////////////////////ТИЛЛ//////////////////////////////////////
//-----------------------------------------
instance DIA_Moe_Hello_Till(C_INFO)
{
	nr = 60;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Hello_Till_cond;
	information = DIA_Moe_Hello_Till_info;
	important = TRUE;
};
func int DIA_Moe_Hello_Till_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Till())	{
		return TRUE;
	};
};
func void DIA_Moe_Hello_Till_info()
{
	AI_Output(self,other,"DIA_Moe_Hello_Till_01_00");	//Кто это у нас тут? Малыш, здесь не наливают молоко. Иди к своей мамочке, попроси у нее.
	Info_ClearChoices(DIA_Moe_Hello_Till);
	Info_AddChoice(DIA_Moe_Hello_Till,"Если я заплачу тебе, ты меня впустишь?",DIA_Moe_Hello_Till_WannaPay);
	Info_AddChoice(DIA_Moe_Hello_Till,"Я не малыш! И я иду в кабак.",DIA_Moe_Hello_Till_NotKid);
	Info_AddChoice(DIA_Moe_Hello_Till,"Уже ухожу.",DIA_Moe_Hello_Till_PassBy);
};
func void DIA_Moe_Hello_Till_PassBy()
{
		AI_Output(other,self,"DIA_Moe_Hello_Till_PassBy_14_00");	//Уже ухожу.
	AI_Output(self,other,"DIA_Moe_Hello_Till_PassBy_01_01");	//Не так быстро. Сначала отдай-ка мне свои деньги, а то у тебя их кто-нибудь украдет. (ухмыляется)
	Info_ClearChoices(DIA_Moe_Hello_Till);
	Info_AddChoice(DIA_Moe_Hello_Till,"Ничего я тебе не отдам!",DIA_Moe_Hello_Till_WontPay);
	Info_AddChoice(DIA_Moe_Hello_Till,"Возьми все, только не бей меня!",DIA_Moe_Hello_Till_GetAllGold);
	Info_AddChoice(DIA_Moe_Hello_Till,"У меня ничего нет.",DIA_Moe_Hello_Till_NoGold);
};
func void DIA_Moe_Hello_Till_NoGoldTrue()
{
	AI_Output(self,other,"DIA_Moe_Hello_Till_NoGoldTrue_01_00");	//Хм, да ты нищий. Ладно, иди. Если хочешь есть, загляни к Эдде.
	B_GivePlayerXP(XP_Moe_Respect);
};
func void DIA_Moe_Hello_Till_NoGoldFalse()
{
	AI_Output(self,other,"DIA_Moe_Hello_Till_NoGoldFalse_01_00");	//А это что? Тебя не учили, что врать нехорошо?
	AI_Output(self,other,"DIA_Moe_Hello_Till_NoGoldFalse_01_01");	//Ладно, иди. Я сегодня добрый.
};
func void DIA_Moe_Hello_Till_NoGold()
{
		AI_Output(other,self,"DIA_Moe_Hello_Till_NoGold_14_00");	//У меня ничего нет.
	AI_Output(self,other,"DIA_Moe_Hello_Till_NoGold_01_01");	//Давай-ка проверим... Выворачивай карманы!
	if (C_NpcHasGold(other,10))	{
		B_GiveInvItems(other,self,ItMi_Gold,Npc_HasItems(other,ItMi_Gold));
		DIA_Moe_Hello_Till_NoGoldFalse();
	}
	else	{
		DIA_Moe_Hello_Till_NoGoldTrue();
	};
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Till_GetAllGold()
{
	var int sum;	sum = Npc_HasItems(other,ItMi_Gold);
		AI_Output(other,self,"DIA_Moe_Hello_Till_GetAllGold_14_00");	//Возьми все, только не бей меня!
	AI_Output(self,other,"DIA_Moe_Hello_Till_GetAllGold_01_01");	//Умница. Схватываешь на лету.
	if (sum > 10)	{
		B_GiveInvItems(other,self,ItMi_Gold,sum);
		if (sum > 20)	{
			AI_Output(self,other,"DIA_Moe_Hello_Till_GetAllGold_01_02");	//Вот, возьми 10 монет за сообразительность.
			B_GiveInvItems(self,other,ItMi_Gold,10);
		};
	}
	else	{
		DIA_Moe_Hello_Till_NoGoldTrue();
	};
	AI_StopProcessInfos(self);
	Info_ClearChoices(DIA_Moe_Hello_Till);
};
func void DIA_Moe_Hello_Till_WontPay()
{
		AI_Output(other,self,"DIA_Moe_Hello_Till_WontPay_14_00");	//Ничего я тебе не отдам!
	AI_Output(self,other,"DIA_Moe_Hello_Till_WontPay_01_01");	//О, как мы заговорили. Давай попробуем, как ты их не отдашь.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
func void DIA_Moe_Hello_Till_NotKid()
{
		AI_Output(other,self,"DIA_Moe_Hello_Till_NotKid_14_00");	//Я не малыш! И я иду в кабак.
	AI_Output(self,other,"DIA_Moe_Hello_Till_NotKid_01_01");	//Вот как? Тогда покажи мне, какой ты взрослый.
	AI_Output(self,other,"DIA_Moe_Hello_Till_NotKid_01_02");	//Попробуй пройти, если сможешь.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
func void DIA_Moe_Hello_Till_WannaPay()
{
		AI_Output(other,self,"DIA_Moe_Hello_Till_WannaPay_14_00");	//Если я заплачу тебе, ты меня впустишь?
	AI_Output(self,other,"DIA_Moe_Hello_Till_WannaPay_01_01");	//Так ты у нас богатенький? Как насчет сотни золотых?
	Info_ClearChoices(DIA_Moe_Hello_Till);
	Info_AddChoice(DIA_Moe_Hello_Till,"Это слишком много.",DIA_Moe_Hello_Till_WannaPayTooMuch);
	if (C_NpcHasGold(other,100))	{
		Info_AddChoice(DIA_Moe_Hello_Till,"Держи. (100 зол.)",DIA_Moe_Hello_Till_WannaPayGive);
	};
};
func void DIA_Moe_Hello_Till_WannaPayGive()
{
	B_GiveGold(other,self,100);
		AI_Output(other,self,"DIA_Moe_Hello_Till_WannaPayGive_14_00");	//Держи.
	Moe_Sign = TRUE;
	AI_Output(self,other,"DIA_Moe_Hello_Till_WannaPayGive_01_01");	//Добро пожаловать в кабак, малыш.
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Till_WannaPayTooMuch()
{
		AI_Output(other,self,"DIA_Moe_Hello_Till_WannaPayTooMuch_14_00");	//Это слишком много.
	AI_Output(self,other,"DIA_Moe_Hello_Till_WannaPayTooMuch_01_01");	//Какая жалость. Тогда давай все. что у тебя есть.
	if (C_NpcHasGold(other,10))	{
		B_GiveInvItems(other,self,ItMi_Gold,Npc_HasItems(other,ItMi_Gold));
		AI_Output(self,other,"DIA_Moe_Hello_Till_WannaPayTooMuch_01_02");	//Хмм, не так уж плохо... Проходи.
	}
	else	{
		AI_Output(self,other,"DIA_Moe_Hello_Till_WannaPayTooMuch_01_03");	//Да у тебя же ничего нет. Парень, не стоит здесь ничего строить из себя. Однажды это выйдет тебе боком.
		B_GivePlayerXP(XP_Moe_Respect);
	};
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	AI_StopProcessInfos(self);
};
//-----------------------------------------
instance DIA_Moe_Till_FightAfter(C_INFO)
{
	nr = 61;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Till_FightAfter_cond;
	information = DIA_Moe_Till_FightAfter_info;
	important = TRUE;
};
func int DIA_Moe_Till_FightAfter_cond()
{
	if (C_HeroIs_Till() && Npc_KnowsInfo(other,DIA_Moe_Hello_Till)
		&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))	{
		return TRUE;
	};
};
func void DIA_Moe_Till_FightAfter_info()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Moe_Till_FightAfter_01_00");	//Тебе просто повезло.
	}
	else	{
		AI_Output(self,other,"DIA_Moe_Till_FightAfter_01_01");	//Надеюсь, этот урок пошел тебе на пользу.
	};
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
	AI_StopProcessInfos(self);
};

///////////////////////////////////ВСЕ//////////////////////////////////////
//-----------------------------------------
instance DIA_Moe_News(C_INFO)
{
	nr = 100;
	npc = VLK_432_Moe;
	condition = DIA_Moe_News_cond;
	information = DIA_Moe_News_info;
	permanent = TRUE;
	description = "Какие новости?";
};
func int DIA_Moe_News_cond()
{
	return TRUE;
};
func void DIA_Moe_News_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Moe_News_03_00");	//Какие новости?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Moe_News_07_00");	//Какие новости?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Moe_News_10_00");	//Какие новости?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Moe_News_14_00");	//Какие новости?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Moe_News_16_00");	//Какие новости?
	};
	if (!C_HeroIs_Sarah())	{
		AI_Output(self,other,"DIA_Moe_News_01_01");	//Ничего, что бы тебя заинтересовало.
	}
	else	{
		AI_Output(self,other,"DIA_Moe_News_01_02");	//Лучше поговори с Кардифом.
	};
};
