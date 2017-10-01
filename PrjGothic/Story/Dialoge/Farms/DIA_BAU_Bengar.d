
instance DIA_Bengar_EXIT(DIA_Proto_End)
{
	npc = BAU_960_Bengar;
};

// ОДО ==================================================================
instance DIA_Bengar_Odo_Straw(C_INFO)
{
	npc = BAU_960_Bengar;	nr = 20;
	condition = DIA_Bengar_Odo_Straw_cond;
	information = DIA_Bengar_Odo_Straw_info;
	description = "У тебя можно купить сено?";
};
func int DIA_Bengar_Odo_Straw_cond()
{
	if (C_HeroIs_Odo() && (MIS_Odo_Straw == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Bengar_Odo_Straw_info()
{
		AI_Output(other,self,"DIA_Bengar_Odo_Straw_03_00");	//У тебя можно купить сено?
	AI_Output(self,other,"DIA_Bengar_Odo_Straw_10_01");	//Конечно.
		AI_Output(other,self,"DIA_Bengar_Odo_Straw_03_02");	//И почем?
	AI_Output(self,other,"DIA_Bengar_Odo_Straw_10_03");	//16 золотых за тюк. Сено хорошее, сам посмотри.
	B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Bengar_Price);
	MIS_Odo_Straw_Bengar[Straw_Price] = 1;
};
//------------------------------------------------
instance DIA_Bengar_Odo_StrawBuy(C_INFO)
{
	npc = BAU_960_Bengar;	nr = 20;
	condition = DIA_Bengar_Odo_StrawBuy_cond;
	information = DIA_Bengar_Odo_StrawBuy_info;
	description = "Монастырь хотел бы купить у тебя сено.";
	permanent = TRUE;
};
func int DIA_Bengar_Odo_StrawBuy_cond()
{
	if (C_HeroIs_Odo() && (MIS_Odo_Straw == LOG_Running) && MIS_Odo_Straw_BengarChoosen)	{
		return TRUE;
	};
};
func void DIA_Bengar_Odo_StrawBuy_info()
{
		AI_Output(other,self,"DIA_Bengar_Odo_StrawBuy_03_00");	//Монастырь хотел бы купить у тебя сено.
		AI_Output(other,self,"DIA_Bengar_Odo_StrawBuy_03_01");	//Нам нужно 32 тюка.
	AI_Output(self,other,"DIA_Bengar_Odo_StrawBuy_10_02");	//Это будет... 512 золотых.
	if (B_GiveGold(other,self,512))	{
			AI_Output(other,self,"DIA_Bengar_Odo_StrawBuy_03_03");	//Вот деньги.
		AI_Output(self,other,"DIA_Bengar_Odo_StrawBuy_10_04");	//Мы привезем сено к монастырю через несколько дней, как только дороги немного подсохнут.
		B_LogEntry_Status(TOPIC_Odo_Straw,LOG_SUCCESS,TOPIC_Odo_Straw_Success);
		MIS_Odo_Straw = LOG_SUCCESS;
		B_GivePlayerXP(XP_Odo_Straw_Success);
	}
	else	{
			AI_Output(other,self,"DIA_Bengar_Odo_StrawBuy_03_05");	//Я немедленно пойду за деньгами.
	};
};

// ОБЩИЕ ==================================================================
instance DIA_Bengar_MR_Perm(C_INFO)
{
	npc = BAU_960_Bengar;	nr = 50;
	condition = DIA_NoCond_cond;
	information = DIA_Bengar_MR_Perm_info;
	description = "Как дела на твоей ферме?";
	permanent = TRUE;
};
func void DIA_Bengar_MR_Perm_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Bengar_MR_Perm_03_00");	//Как дела на твоей ферме?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Bengar_MR_Perm_07_00");	//Как дела на твоей ферме?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Bengar_MR_Perm_10_00");	//Как дела на твоей ферме?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Bengar_MR_Perm_14_00");	//Как дела на твоей ферме?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Bengar_MR_Perm_16_00");	//Как дела на твоей ферме?
	};
	AI_Output(self,other,"DIA_Bengar_MR_Perm_10_01");	//Мне не на что жаловаться.
};

