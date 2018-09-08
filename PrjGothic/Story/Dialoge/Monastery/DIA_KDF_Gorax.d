
instance DIA_Gorax_EXIT(DIA_Proto_End)
{
	npc = KDF_508_Gorax;
};

/////////////////////////////////////// ОДО /////////////////////////////////////////////

// ==============================================
instance DIA_Gorax_Odo_HasJob(C_INFO)
{

	npc = KDF_508_Gorax;			nr = 1;
	condition = DIA_Gorax_Odo_HasJob_cond;
	information = DIA_Gorax_Odo_HasJob_info;
	description = "Вы хотели меня видеть, мастер?";
};
func int DIA_Gorax_Odo_HasJob_cond()
{
	if (C_HeroIs_Odo()
		 && (MIS_Odo_Herbs == LOG_SUCCESS))	{
		return TRUE;
	};
};
func void DIA_Gorax_Odo_HasJob_info()
{
		AI_Output(other,self,"DIA_Gorax_Odo_HasJob_03_00");	//Вы хотели меня видеть, мастер?
	AI_Output(self,other,"DIA_Gorax_Odo_HasJob_14_01");	//Да. Неорас хорошо отзывался о твоих способностях, поэтому я хочу поручить тебе одно задание.
	AI_Output(self,other,"DIA_Gorax_Odo_HasJob_14_02");	//Тем более, что ты все равно часто уходишь за стены Монастыря в поисках трав.
	AI_Output(self,other,"DIA_Gorax_Odo_HasJob_14_03");	//К делу. Приближается зима, и нашей обители необходимы кое-какие запасы.
	AI_Output(self,other,"DIA_Gorax_Odo_HasJob_14_04");	//В первую очередь, мы нуждаемся в сене для наших овец.
	AI_Output(self,other,"DIA_Gorax_Odo_HasJob_14_05");	//Обойди окрестные фермы и узнай высоки ли цены в этом году. Да не забудь проверить качество сена.
	AI_Output(self,other,"DIA_Gorax_Odo_HasJob_14_06");	//После я решу, где лучше его купить.
	B_LogEntry_Create(TOPIC_Odo_Straw,LOG_MISSION,TOPIC_Odo_Straw_Start);
	MIS_Odo_Straw = LOG_Running;
	B_CloseLogOnDeath(BAU_940_Akil);
	B_CloseLogOnDeath(BAU_950_Lobart);
	B_CloseLogOnDeath(BAU_930_Sekob);
	B_CloseLogOnDeath(BAU_960_Bengar);
};

// ==============================================
instance DIA_Gorax_Odo_AboutStraw(C_INFO)
{

	npc = KDF_508_Gorax;			nr = 2;
	condition = DIA_Gorax_Odo_AboutStraw_cond;
	information = DIA_Gorax_Odo_AboutStraw_info;
	description = "По поводу сена...";
	permanent = TRUE;
};
func int DIA_Gorax_Odo_AboutStraw_cond()
{
	if (C_HeroIs_Odo()
		 && (MIS_Odo_Straw == LOG_Running)
		 && !MIS_Odo_Straw_BengarChoosen)	{
		return TRUE;
	};
};
func void DIA_Gorax_Odo_AboutStraw_Menu()
{
	Info_ClearChoices(DIA_Gorax_Odo_AboutStraw);
	Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"...я пока больше ничего не узнал.",DIA_Gorax_Odo_AboutStraw_Back);
	if ((MIS_Odo_Straw_Lobart[0] > 0) && (MIS_Odo_Straw_Lobart[1] > 0) && !MIS_Odo_Straw_Lobart[Straw_Told])	{
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"у Лобарта...",DIA_Gorax_Odo_AboutStraw_Lobart);
	};
	if ((MIS_Odo_Straw_Akil[0] > 0) && (MIS_Odo_Straw_Akil[1] > 0) && !MIS_Odo_Straw_Akil[Straw_Told])	{
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"у Акила...",DIA_Gorax_Odo_AboutStraw_Akil);
	};
	if ((MIS_Odo_Straw_Bengar[0] > 0) && (MIS_Odo_Straw_Bengar[1] > 0) && !MIS_Odo_Straw_Bengar[Straw_Told])	{
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"у Бенгара...",DIA_Gorax_Odo_AboutStraw_Bengar);
	};
	if ((MIS_Odo_Straw_Sekob[0] > 0) && (MIS_Odo_Straw_Sekob[1] > 0) && !MIS_Odo_Straw_Sekob[Straw_Told])	{
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"у Секоба...",DIA_Gorax_Odo_AboutStraw_Sekob);
	};
	if ((MIS_Odo_Straw_Onar[0] > 0) && (MIS_Odo_Straw_Onar[1] > 0) && !MIS_Odo_Straw_Onar[Straw_Told])	{
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"у лендлорда Онара...",DIA_Gorax_Odo_AboutStraw_Onar);
	};
	if (MIS_Odo_Straw_Cnt == MIS_Odo_Straw_All)	{
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"Я обошел все фермы.",DIA_Gorax_Odo_AboutStraw_All);
	};
};

func void DIA_Gorax_Odo_AboutStraw_info()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_03_00");	//По поводу сена...
	DIA_Gorax_Odo_AboutStraw_Menu();
};
func void DIA_Gorax_Odo_AboutStraw_Back()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Back_03_00");	//...я пока больше ничего не узнал.
	Info_ClearChoices(DIA_Gorax_Odo_AboutStraw);
};
func void DIA_Gorax_Odo_AboutStraw_Onar()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Onar_03_00");	//У Онара сено по 17 золотых за тюк.
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Onar_03_01");	//И оно отменного качества.
	DIA_Gorax_Odo_AboutStraw_Menu();
	MIS_Odo_Straw_Onar[Straw_Told] = 1;
	MIS_Odo_Straw_Cnt += 1;
	B_GivePlayerXP(XP_Odo_Straw_Onar);
};
func void DIA_Gorax_Odo_AboutStraw_Sekob()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Sekob_03_00");	//Секоб просит по 19 золотых за тюк сена.
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Sekob_03_01");	//Но оно никудышное, гнилое.
	DIA_Gorax_Odo_AboutStraw_Menu();
	MIS_Odo_Straw_Sekob[Straw_Told] = 1;
	MIS_Odo_Straw_Cnt += 1;
	B_GivePlayerXP(XP_Odo_Straw_Sekob);
};
func void DIA_Gorax_Odo_AboutStraw_Bengar()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Bengar_03_00");	//У Бенгара тюк сена стоит 16 золотых.
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Bengar_03_01");	//Сено у него отличное, свежее и душистое.
	DIA_Gorax_Odo_AboutStraw_Menu();
	MIS_Odo_Straw_Bengar[Straw_Told] = 1;
	MIS_Odo_Straw_Cnt += 1;
	B_GivePlayerXP(XP_Odo_Straw_Bengar);
};
func void DIA_Gorax_Odo_AboutStraw_Akil()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Akil_03_00");	//Акил предлагает сено всего по 15 золотых за тюк.
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Akil_03_01");	//Сено у него слишком жесткое.
	DIA_Gorax_Odo_AboutStraw_Menu();
	MIS_Odo_Straw_Akil[Straw_Told] = 1;
	MIS_Odo_Straw_Cnt += 1;
	B_GivePlayerXP(XP_Odo_Straw_Akil);
};
func void DIA_Gorax_Odo_AboutStraw_Lobart()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Lobart_03_00");	//Лобарт продает сено по 16 золотых за тюк.
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Lobart_03_01");	//Сено неплохое, но и не самое лучшее. Свежести в нем нет.
	DIA_Gorax_Odo_AboutStraw_Menu();
	MIS_Odo_Straw_Lobart[Straw_Told] = 1;
	MIS_Odo_Straw_Cnt += 1;
	B_GivePlayerXP(XP_Odo_Straw_Lobart);
};
func void DIA_Gorax_Odo_AboutStraw_All()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_All_03_00");	//Я обошел все фермы.
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_All_14_01");	//Хорошо. И где бы ты купил сено, если бы мог выбирать?
	Info_ClearChoices(DIA_Gorax_Odo_AboutStraw);
	if (MIS_Odo_Straw_Lobart[Straw_Told]) {
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"У Лобарта.",DIA_Gorax_Odo_AboutStraw_BuyLobart);
	};
	if (MIS_Odo_Straw_Akil[Straw_Told]) {
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"У Акила.",DIA_Gorax_Odo_AboutStraw_BuyAkil);
	};
	if (MIS_Odo_Straw_Bengar[Straw_Told]) {
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"У Бенгара.",DIA_Gorax_Odo_AboutStraw_BuyBengar);
	};
	if (MIS_Odo_Straw_Sekob[Straw_Told]) {
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"У Секоба.",DIA_Gorax_Odo_AboutStraw_BuySekob);
	};
	if (MIS_Odo_Straw_Onar[Straw_Told]) {
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"У Онара.",DIA_Gorax_Odo_AboutStraw_BuyOnar);
	};
};
func void DIA_Gorax_Odo_AboutStraw_DoBuyBengar()
{
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_DoBuyBengar_14_01");	//Мы возьмем сено у Бенгара.
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_DoBuyBengar_14_02");	//Всего нам потребуется 32 тюка. В золоте это...
	Info_ClearChoices(DIA_Gorax_Odo_AboutStraw);
	Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"(промолчать)",DIA_Gorax_Odo_AboutStraw_None);
	Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"480.",DIA_Gorax_Odo_AboutStraw_480g);
	Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"498.",DIA_Gorax_Odo_AboutStraw_498g);
	Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"512.",DIA_Gorax_Odo_AboutStraw_512g);
	Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"524.",DIA_Gorax_Odo_AboutStraw_524g);
	Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"532.",DIA_Gorax_Odo_AboutStraw_532g);
	Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"544.",DIA_Gorax_Odo_AboutStraw_544g);
};
func void DIA_Gorax_Odo_AboutStraw_BuyLobart()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_BuyLobart_03_00");	//У Лобарта.
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_BuyLobart_14_01");	//Хм, ты же сам сказал, что оно не самое лучшее.
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_BuyLobart_14_02");	//Тебе еще предстоит многому научиться.
	DIA_Gorax_Odo_AboutStraw_DoBuyBengar();
};
func void DIA_Gorax_Odo_AboutStraw_BuyAkil()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_BuyAkil_03_00");	//У Акила.
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_BuyAkil_14_01");	//Оно самое дешевое, но жесткое. Такое не пойдет овцам в прок.
	DIA_Gorax_Odo_AboutStraw_DoBuyBengar();
};
func void DIA_Gorax_Odo_AboutStraw_BuyBengar()
{
	MIS_Odo_Straw_BengarChoosen = TRUE;
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_BuyBengar_03_00");	//У Бенгара.
	B_GivePlayerXP(XP_Odo_Straw_Right1);
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_BuyBengar_14_01");	//Хороший выбор! Так и поступим.
	DIA_Gorax_Odo_AboutStraw_DoBuyBengar();
};
func void DIA_Gorax_Odo_AboutStraw_BuySekob()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_BuySekob_03_00");	//У Секоба.
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_BuySekob_14_01");	//Странный выбор... По твоим собственным словам у него худшее и самое дорогое сено.
	DIA_Gorax_Odo_AboutStraw_DoBuyBengar();
};
func void DIA_Gorax_Odo_AboutStraw_BuyOnar()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_BuyOnar_03_00");	//У Онара.
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_BuyOnar_14_01");	//Мы покупали у него сено в прошлые годы... Но сейчас есть более выгодные предложения.
	DIA_Gorax_Odo_AboutStraw_DoBuyBengar();
};
func void DIA_Gorax_Odo_AboutStraw_GiveGold()
{
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_GiveGold_14_01");	//Возьми деньги и ступай, купи сено у Бенгара. Да поторопись!
	B_GiveGold(self,other,512);
	B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Told);
	Info_ClearChoices(DIA_Gorax_Odo_AboutStraw);
};
func void DIA_Gorax_Odo_AboutStraw_None()
{
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_None_14_01");	//...512 золотых.
	DIA_Gorax_Odo_AboutStraw_GiveGold();
};
func void DIA_Gorax_Odo_AboutStraw_Wrong()
{
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_Wrong_14_01");	//Нет, ты ошибся. Это 512 золотых.
	DIA_Gorax_Odo_AboutStraw_GiveGold();
};
func void DIA_Gorax_Odo_AboutStraw_Right()
{
	B_GivePlayerXP(XP_Odo_Straw_Right2);
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_Right_14_01");	//Верно!
	if (MIS_Odo_Straw_BengarChoosen)	{
		AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_Right_14_02");	//Ты проявляешь способности к управлению хозяйством.
	};
	DIA_Gorax_Odo_AboutStraw_GiveGold();
};
func void DIA_Gorax_Odo_AboutStraw_480g()
{
	AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_480g_14_01");	//480.
	DIA_Gorax_Odo_AboutStraw_Wrong();
};
func void DIA_Gorax_Odo_AboutStraw_498g()
{
	AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_498g_14_01");	//498.
	DIA_Gorax_Odo_AboutStraw_Wrong();
};
func void DIA_Gorax_Odo_AboutStraw_512g()
{
	AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_512g_14_01");	//512.
	DIA_Gorax_Odo_AboutStraw_Right();
};
func void DIA_Gorax_Odo_AboutStraw_524g()
{
	AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_524g_14_01");	//524.
	DIA_Gorax_Odo_AboutStraw_Wrong();
};
func void DIA_Gorax_Odo_AboutStraw_532g()
{
	AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_532g_14_01");	//532.
	DIA_Gorax_Odo_AboutStraw_Wrong();
};
func void DIA_Gorax_Odo_AboutStraw_544g()
{
	AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_544g_14_01");	//544.
	DIA_Gorax_Odo_AboutStraw_Wrong();
};



// ТОРГОВЛЯ ==============================================
instance DIA_Gorax_MRTrade(C_INFO)
{
	nr = 50;
	npc = KDF_508_Gorax;
	condition = DIA_Gorax_MRTrade_cond;
	information = DIA_Gorax_MRTrade_info;
	description = "Мне кое-что нужно, мастер...";
	trade = TRUE;
	permanent = TRUE;
};
func int DIA_Gorax_MRTrade_cond()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Gorax_MRTrade_info()
{
	if (!Gorax_Trade_Once || (Wld_GetFullTime() - self.aivar[AIV_TalkedToPlayer] > 12 * 60 * 60)) { 
			AI_Output(other,self,"DIA_Gorax_MRTrade_03_00");	//Мне кое-что нужно, мастер...
		AI_Output(self,other,"DIA_Gorax_MRTrade_14_01");	//Все имеет свою цену, дитя мое.
	};
	if (!Gorax_Trade_Once)	{
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Gorax);
		Gorax_Trade_Once = TRUE;
	};
	B_GiveTradeInv_Gorax(self);
};

