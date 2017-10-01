
instance DIA_Parlan_EXIT(DIA_Proto_End)
{
	npc = KDF_504_Parlan;
};

/////////////////////////////////////// ОДО /////////////////////////////////////////////

//===================================================
instance DIA_Parlan_Start_Odo(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_Start_Odo_Cond;
	information = DIA_Parlan_Start_Odo_Info;
	description = "Приветствую вас, мастер!";
};
func int DIA_Parlan_Start_Odo_Cond()
{
	if (C_HeroIs_Odo() && Npc_KnowsInfo(other, DIA_Neoras_Start_Odo))	{
		return TRUE;
	};
};
func void DIA_Parlan_Start_Odo_Info()
{
		AI_Output(other,self,"DIA_Parlan_Start_Odo_03_00");	//Здравствуйте, мастер!
	AI_Output(self,other,"DIA_Parlan_Start_Odo_05_01");	//Что, послушник? Тебе нечем заняться?
		AI_Output(other,self,"DIA_Parlan_Start_Odo_03_02");	//Нет, что Вы. Мастер Неорас велел мне найти для него целебные травы. Он дал свое разрешение, чтобы я мог покинуть монастырь.
	AI_Output(self,other,"DIA_Parlan_Start_Odo_05_03");	//(пристально смотрит) А может быть, тебе просто зачем-то нужно выйти из монастыря? 
	AI_Output(self,other,"DIA_Parlan_Start_Odo_05_04");	//Ну хорошо. Возьми ключ от входа. Купи у мастера Горакса несколько свитков, в лесу может быть небезопасно... 
	//дает ключ
	B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
	AI_Output(self,other,"DIA_Parlan_Start_Odo_05_05");	//Но если до завтра ты не принесешь ни травинки, я отменю свое решение.
		AI_Output(other,self,"DIA_Parlan_Start_Odo_03_06");	//Благодарю Вас, мастер.
	MIS_Odo_Herbs_Day = Wld_GetDay() + 1;
	B_LogEntry(TOPIC_Odo_Herbs,TOPIC_Odo_Herbs_Key);
	B_GivePlayerXP(XP_Odo_Herbs_KeyGot);
	if (!Gorax_Trade_Once)	{
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Gorax);
		Gorax_Trade_Once = TRUE;
	};
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Parlan_NoHerb_Odo(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_NoHerb_Odo_Cond;
	information = DIA_Parlan_NoHerb_Odo_Info;
	important = TRUE;
};
func int DIA_Parlan_NoHerb_Odo_Cond()
{
	if (C_HeroIs_Odo() && Npc_KnowsInfo(other, DIA_Parlan_Start_Odo) && (MIS_Odo_Herbs_Day < Wld_GetDay())
		&& (MIS_Odo_Herbs_AllCnt == 0))	{
		return TRUE;
	};
};
func void DIA_Parlan_NoHerb_Odo_Info()
{
	AI_Output(self,other,"DIA_Parlan_NoHerb_Odo_05_00");	//Где ты был, послушник? Мастер Неорас не получил от тебя ни стебелька!
		AI_Output(other,self,"DIA_Parlan_NoHerb_Odo_03_01");	//Я...
	AI_Output(self,other,"DIA_Parlan_NoHerb_Odo_05_02");	//Я не желаю слушать твои оправдания! Ты будешь наказан!
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
};

//===================================================
instance DIA_Parlan_MR_Perm_Odo(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_MR_Perm_Odo_Cond;
	information = DIA_Parlan_MR_Perm_Odo_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Parlan_MR_Perm_Odo_Cond()
{
	if (C_HeroIs_Odo() && DIA_WhenAsked_cond()
		&& (!Npc_KnowsInfo(other, DIA_Neoras_Start_Odo) || Npc_KnowsInfo(other, DIA_Parlan_Start_Odo))
		&& !DIA_Parlan_NoHerb_Odo_Cond())	{
		return TRUE;
	};
};
func void DIA_Parlan_MR_Perm_Odo_Info()
{
	AI_Output(self,other,"DIA_Parlan_MR_Perm_Odo_05_00");	//(строго) Возвращайся к своей работе, послушник.
	AI_StopProcessInfos(self);
};
