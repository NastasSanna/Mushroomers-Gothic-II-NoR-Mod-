
instance DIA_Neoras_EXIT(DIA_Proto_End)
{
	npc = KDF_506_Neoras;
};

/////////////////////////////////////// ОДО /////////////////////////////////////////////

//===================================================
instance DIA_Neoras_Start_Odo(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 1;
	condition = DIA_Neoras_Start_Odo_Cond;
	information = DIA_Neoras_Start_Odo_Info;
	description = "Приветствую вас, мастер!";
};
func int DIA_Neoras_Start_Odo_Cond()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Neoras_Start_Odo_Info()
{
		AI_Output(other,self,"DIA_Neoras_Start_Odo_03_00");	//Приветствую вас, мастер!
	AI_Output(self,other,"DIA_Neoras_Start_Odo_01_01");	//Здравствуй, послушник. У тебя ко мне какое-то дело? Если нет, не отвлекай меня.
		AI_Output(other,self,"DIA_Neoras_Start_Odo_03_02");	//Мастер, я слышал, Вам нужны ингредиенты для зелий. Быть может, я мог бы пойти за ними?
	AI_Output(self,other,"DIA_Neoras_Start_Odo_01_03");	//Хмм... Ты прав, мне нужно кое-что. 
	AI_Output(self,other,"DIA_Neoras_Start_Odo_01_04");	//Царский щавель, что мы выращиваем, очень низкого качества, а с наступлением осени вообще ни на что не годится. 
	AI_Output(self,other,"DIA_Neoras_Start_Odo_01_05");	//А ведь на нем готовятся многие сильные зелья... Мне нужно хотя бы несколько растений. Да и другие травы не помешали бы. Серафис, к примеру.
		AI_Output(other,self,"DIA_Neoras_Start_Odo_03_06");	//Мастер, позвольте мне отправиться на поиски этих растений.
	AI_Output(self,other,"DIA_Neoras_Start_Odo_01_07");	//Найти царский щавель не так-то просто, тем более осенью.
		AI_Output(other,self,"DIA_Neoras_Start_Odo_03_08");	//Я думаю, что справлюсь, мастер. Только позвольте...
	AI_Output(self,other,"DIA_Neoras_Start_Odo_01_09");	//Если ты так рвешься помочь - помогай, а не отвлекай меня.
		AI_Output(other,self,"DIA_Neoras_Start_Odo_03_10");	//Но мне нужно разрешение, чтобы покинуть Монастырь.
	AI_Output(self,other,"DIA_Neoras_Start_Odo_01_11");	//Вот как? Что ж, скажи мастеру Парлану, что я разрешаю тебе выйти для поисков целебных трав. Приноси все, что найдешь. А теперь ступай, не мешай мне.
	B_LogEntry_Create(TOPIC_Odo_Herbs,LOG_MISSION,TOPIC_Odo_Herbs_Start);
	B_LogEntry(TOPIC_Odo_Herbs,TOPIC_Odo_Herbs_NoPerm);
	MIS_Odo_Herbs = LOG_Running;
};


//ТРАВЫ ===================================================
instance DIA_Neoras_Herbs_Odo(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 10;
	condition = DIA_Neoras_Herbs_Odo_Cond;
	information = DIA_Neoras_Herbs_Odo_Info;
	description = "(отдать травы)";
	permanent = TRUE;
};
func int DIA_Neoras_Herbs_Odo_Cond()
{
	if (C_HeroIs_Odo() && (MIS_Odo_Herbs > 0))	{
		return TRUE;
	};
};
//назад ---------------------------------------
func void DIA_Neoras_Herbs_Odo_Back()
{
	Info_ClearChoices(DIA_Neoras_Herbs_Odo);
	MIS_Odo_Herbs_Give_Plant = 0;
	MIS_Odo_Herbs_Give_Cnt = 0;
	MIS_Odo_Herbs_Give_Price = 0;
};
func void DIA_Neoras_Herbs_Odo_BackMenu()
{
	AI_Output(other,self,"DIA_Neoras_Herbs_Odo_Back_03_00");	//Я принесу еще позже.
	DIA_Neoras_Herbs_Odo_Back();
};
//бонус ---------------------------------------
func void DIA_Neoras_Herbs_Odo_Bonus()
{
	//нужно набрать 100 очков за растения, в том числе 3 царских щавеля
	if ((MIS_Odo_Herbs_AllCnt < 100) || (MIS_Odo_Herbs_PermCnt < 3)
		|| (MIS_Odo_Herbs_Bonus == TRUE))	{
		return;
	};
	//бонус однократный
	MIS_Odo_Herbs_Bonus = TRUE;
	TEACH_Neoras = TRUE;
		AI_Output(self,other,"DIA_Neoras_Herbs_Odo_01_00");	//Ты сильно помог мне, послушник Одо.
	//получали ли деньги за растения?
	if ((MIS_Odo_Herbs_Pay == 0) && (MIS_Odo_Herbs_PermCnt > 0))	{
		AI_Output(self,other,"DIA_Neoras_Herbs_Odo_01_01");	//И ты ничего не попросил взамен.
		AI_Output(self,other,"DIA_Neoras_Herbs_Odo_01_02");	//Я хочу наградить тебя. Возьми эти зелья.
		//B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
		//B_GiveInvItems(self,other,ItPo_Health_02,2);
		//B_GiveInvItems(self,other,ItPo_Health_03,1);
		//B_GiveInvItems(self,other,ItPo_Mana_02,3);
		ItemTrans_items[0] = ItPo_Perm_Mana;
		ItemTrans_amount[0] = 1;
		ItemTrans_items[1] = ItPo_Health_02;
		ItemTrans_amount[1] = 2;
		ItemTrans_items[2] = ItPo_Health_03;
		ItemTrans_amount[2] = 1;
		ItemTrans_items[3] = ItPo_Mana_02;
		ItemTrans_amount[3] = 3;
		B_ItemsTransaction(self,other);
		AI_Output(self,other,"DIA_Neoras_Herbs_Odo_01_03");	//И с этого момента я буду давать тебе немного золота за принесенные растения.
		MIS_Odo_Herbs_Pay = 5;
		B_LogEntry(TOPIC_Odo_Herbs,TOPIC_Odo_Herbs_Payment);
	}
	else	{
		AI_Output(self,other,"DIA_Neoras_Herbs_Odo_01_04");	//Хоть ты и получил награду за свою работу, я дам тебе еще пару зелий.
		//B_GiveInvItems(self,other,ItPo_Health_02,2);
		//B_GiveInvItems(self,other,ItPo_Mana_02,1);
		ItemTrans_items[0] = ItPo_Health_02;
		ItemTrans_amount[0] = 2;
		ItemTrans_items[1] = ItPo_Mana_02;
		ItemTrans_amount[1] = 1;
		B_ItemsTransaction(self,other);
	};
		AI_Output(self,other,"DIA_Neoras_Herbs_Odo_01_05");	//Я беру тебя в подмастерья и покажу основы алхимии. Приходи, когда будешь готов к первому уроку.
		AI_Output(self,other,"DIA_Neoras_Herbs_Odo_01_06");	//И ты получаешь постоянное право покидать Монастырь для сбора растений.
	AI_Output(other,self,"DIA_Neoras_Herbs_Odo_03_07");	//Благодарю Вас, мастер.
		AI_Output(self,other,"DIA_Neoras_Herbs_Odo_01_08");	//Ах да. Зайди к мастеру Гораксу, у него для тебя есть работа.
	MIS_Odo_Herbs = LOG_SUCCESS;
	B_LogEntry_Status(TOPIC_Odo_Herbs,LOG_SUCCESS,TOPIC_Odo_Herbs_Success);
	B_GivePlayerXP(XP_Odo_Herbs_Success);
	B_LogNote(TOPIC_Teacher,TOPIC_Teacher_Neoras);
};
//1. чего?---------------------------------------
func void DIA_Neoras_Herbs_Odo_Menu()
{
	Info_ClearChoices(DIA_Neoras_Herbs_Odo);
	Info_AddChoice(DIA_Neoras_Herbs_Odo,Dialog_Back,DIA_Neoras_Herbs_Odo_BackMenu);
	var int HasAny;	HasAny = FALSE;
	if (Npc_HasItems(other,ItPl_Mana_Herb_01))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"отдать огненную крапиву...",DIA_Neoras_Herbs_Odo_Mana_01);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Mana_Herb_02))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"отдать огненную траву...",DIA_Neoras_Herbs_Odo_Mana_02);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Mana_Herb_03))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"отдать огненный корень...",DIA_Neoras_Herbs_Odo_Mana_03);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Health_Herb_01))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"отдать лечебную траву...",DIA_Neoras_Herbs_Odo_Health_01);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Health_Herb_02))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"отдать лечебные растения...",DIA_Neoras_Herbs_Odo_Health_02);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Health_Herb_03))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"отдать лечебный корень...",DIA_Neoras_Herbs_Odo_Health_03);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Speed_Herb_01))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"отдать снеппер-траву...",DIA_Neoras_Herbs_Odo_Speed);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Temp_Herb))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"отдать луговой горец...",DIA_Neoras_Herbs_Odo_Temp);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Blueplant))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"отдать серафис...",DIA_Neoras_Herbs_Odo_Blue);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Strength_Herb_01))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"отдать драконий корень...",DIA_Neoras_Herbs_Odo_STR);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Dex_Herb_01))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"отдать ягоду гоблина...",DIA_Neoras_Herbs_Odo_DEX);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Perm_Herb))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"отдать царский щавель...",DIA_Neoras_Herbs_Odo_MR_Perm);
		HasAny = TRUE;
	};
	if (HasAny)	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"отдать все травы",DIA_Neoras_Herbs_Odo_GiveAll);
	};
};
//2. сколько?---------------------------------------
func void DIA_Neoras_Herbs_Odo_Count()
{
	Info_ClearChoices(DIA_Neoras_Herbs_Odo);
	Info_AddChoice(DIA_Neoras_Herbs_Odo,Dialog_Back,DIA_Neoras_Herbs_Odo_Back);
	Info_AddChoice(DIA_Neoras_Herbs_Odo,"1 штуку",DIA_Neoras_Herbs_Odo_1);
	if (MIS_Odo_Herbs_Give_Cnt >= 5)	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"5 штук",DIA_Neoras_Herbs_Odo_5);
	};
	if (MIS_Odo_Herbs_Give_Cnt >= 10)	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"10 штук",DIA_Neoras_Herbs_Odo_10);
	};
	if (MIS_Odo_Herbs_Give_Cnt > 1)	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,CS5("все (",IntToString(MIS_Odo_Herbs_Give_Cnt), " шт.",")",""),DIA_Neoras_Herbs_Odo_DoGive);
	};
};
//3. отдать ---------------------------------------
func void DIA_Neoras_Herbs_Odo_DoGive()
{
	//счетчики
	MIS_Odo_Herbs_AllCnt += MIS_Odo_Herbs_Give_Cnt * MIS_Odo_Herbs_Give_Price;
	if (MIS_Odo_Herbs_Give_Plant == Hlp_GetInstanceID(ItPl_Perm_Herb))	{
		MIS_Odo_Herbs_PermCnt += MIS_Odo_Herbs_Give_Cnt;
	};
	//отдать растения
	B_GiveInvItems(other,self,MIS_Odo_Herbs_Give_Plant,MIS_Odo_Herbs_Give_Cnt);
	//плата
	if (MIS_Odo_Herbs_Pay > 0)	{
		B_GiveInvItems(self,other,ItMi_Gold,MIS_Odo_Herbs_Pay * MIS_Odo_Herbs_Give_Cnt * MIS_Odo_Herbs_Give_Price);
	};
	//бонус, проверка внутри
	DIA_Neoras_Herbs_Odo_Bonus();
	//назад
	if (Npc_HasItems(other, MIS_Odo_Herbs_Give_Plant))	{
		DIA_Neoras_Herbs_Odo_Count();
	}
	else	{
		DIA_Neoras_Herbs_Odo_Menu();
	};
};

func void DIA_Neoras_Herbs_Odo_1()
{
	MIS_Odo_Herbs_Give_Cnt = 1;
	DIA_Neoras_Herbs_Odo_DoGive();
};
func void DIA_Neoras_Herbs_Odo_5()
{
	MIS_Odo_Herbs_Give_Cnt = 5;
	DIA_Neoras_Herbs_Odo_DoGive();
};
func void DIA_Neoras_Herbs_Odo_10()
{
	MIS_Odo_Herbs_Give_Cnt = 10;
	DIA_Neoras_Herbs_Odo_DoGive();
};

func void DIA_Neoras_Herbs_Odo_MR_Perm()
{
	AI_Output(self,other,"DIA_Neoras_Herbs_Odo_MR_Perm_01_01");	//Царский щавель, притом в хорошем состоянии!
	AI_Output(self,other,"DIA_Neoras_Herbs_Odo_MR_Perm_01_02");	//Ты проявляешь похвальное усердие.
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Perm_Herb);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Perm_Herb);
	MIS_Odo_Herbs_Give_Price = 20;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Str()
{
	AI_Output(self,other,"DIA_Neoras_Herbs_Odo_Str_01_01");	//Ты принес драконий корень. Очень ценное растение.
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Strength_Herb_01);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Strength_Herb_01);
	MIS_Odo_Herbs_Give_Price = 15;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Dex()
{
	AI_Output(self,other,"DIA_Neoras_Herbs_Odo_Dex_01_01");	//Давненько у меня не было гоблинских ягод.
	AI_Output(self,other,"DIA_Neoras_Herbs_Odo_Dex_01_02");	//Не самое популярное растение в Монастыре.
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Dex_Herb_01);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Dex_Herb_01);
	MIS_Odo_Herbs_Give_Price = 15;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Blue()
{
	AI_Output(self,other,"DIA_Neoras_Herbs_Odo_Blue_01_01");	//Серафис - это отлично! У меня почти иссякли его запасы.
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Blueplant);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Blueplant);
	MIS_Odo_Herbs_Give_Price = 8;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Temp()
{
	AI_Output(self,other,"DIA_Neoras_Herbs_Odo_Temp_01_01");	//Луговой горец всегда нужен - без него не сварить большинство зелий.
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Temp_Herb);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Temp_Herb);
	MIS_Odo_Herbs_Give_Price = 10;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Speed()
{
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Speed_Herb_01);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Speed_Herb_01);
	MIS_Odo_Herbs_Give_Price = 7;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Mana_01()
{
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Mana_Herb_01);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Mana_Herb_01);
	MIS_Odo_Herbs_Give_Price = 2;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Mana_02()
{
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Mana_Herb_02);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Mana_Herb_02);
	MIS_Odo_Herbs_Give_Price = 3;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Mana_03()
{
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Mana_Herb_03);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Mana_Herb_03);
	MIS_Odo_Herbs_Give_Price = 5;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Health_01()
{
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Health_Herb_01);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Health_Herb_01);
	MIS_Odo_Herbs_Give_Price = 2;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Health_02()
{
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Health_Herb_02);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Health_Herb_02);
	MIS_Odo_Herbs_Give_Price = 3;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Health_03()
{
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Health_Herb_03);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Health_Herb_03);
	MIS_Odo_Herbs_Give_Price = 5;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_GiveAll()
{
	if (Npc_HasItems(other,ItPl_Mana_Herb_01))	{
		DIA_Neoras_Herbs_Odo_Mana_01();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Mana_Herb_02))	{
		DIA_Neoras_Herbs_Odo_Mana_02();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Mana_Herb_03))	{
		DIA_Neoras_Herbs_Odo_Mana_03();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Health_Herb_01))	{
		DIA_Neoras_Herbs_Odo_Health_01();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Health_Herb_02))	{
		DIA_Neoras_Herbs_Odo_Health_02();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Health_Herb_03))	{
		DIA_Neoras_Herbs_Odo_Health_03();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Speed_Herb_01))	{
		DIA_Neoras_Herbs_Odo_Speed();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Temp_Herb))	{
		DIA_Neoras_Herbs_Odo_Temp();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Blueplant))	{
		DIA_Neoras_Herbs_Odo_Blue();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Strength_Herb_01))	{
		DIA_Neoras_Herbs_Odo_Str();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Dex_Herb_01))	{
		DIA_Neoras_Herbs_Odo_Dex();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Perm_Herb))	{
		DIA_Neoras_Herbs_Odo_MR_Perm();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	Info_ClearChoices(DIA_Neoras_Herbs_Odo);
};
func void DIA_Neoras_Herbs_Odo_Info()
{
	AI_Output(other,self,"DIA_Neoras_Herbs_Odo_03_00");	//Я принес вам травы, мастер!
	DIA_Neoras_Herbs_Odo_Menu();
};

//ПОПРОСИТЬ НАГРАДУ ===================================================
instance DIA_Neoras_HerbsPay_Odo(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = DIA_Neoras_HerbsPay_Odo_Cond;
	information = DIA_Neoras_HerbsPay_Odo_Info;
	description = "Могу я получить награду за свою работу?";
};
func int DIA_Neoras_HerbsPay_Odo_Cond()
{
	if (C_HeroIs_Odo() && (MIS_Odo_Herbs == LOG_Running) && (MIS_Odo_Herbs_Pay == 0))	{
		return TRUE;
	};
};

func void DIA_Neoras_HerbsPay_Odo_Info()
{
	AI_Output(other,self,"DIA_Neoras_HerbsPay_Odo_03_00");	//Могу я получить награду за свою работу?
	if (MIS_Odo_Herbs_AllCnt == 0)	{
		AI_Output(self,other,"DIA_Neoras_HerbsPay_Odo_01_01");	//Еще ничего не сделал, а уже просишь награды?
		AI_Output(self,other,"DIA_Neoras_HerbsPay_Odo_01_02");	//Ну хорошо, ты получишь несколько монет за принесенные растения.
		MIS_Odo_Herbs_Pay = 2;
	}
	else	{
		AI_Output(self,other,"DIA_Neoras_HerbsPay_Odo_01_03");	//Ты принес мне некоторые растения... Похоже, ты не такой уж бездельник.
		AI_Output(self,other,"DIA_Neoras_HerbsPay_Odo_01_04");	//Хорошо, я буду платить тебе золотом.
		MIS_Odo_Herbs_Pay = 3;
	};
	B_LogEntry(TOPIC_Odo_Herbs,TOPIC_Odo_Herbs_Payment2);
};

//ОБУЧЕНИЕ ===================================================
instance DIA_Neoras_Teach_Odo(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 5;
	condition = DIA_Neoras_Teach_Odo_Cond;
	information = DIA_Neoras_Teach_Odo_Info;
	description = "(обучение)";
	permanent = TRUE;
};
func int DIA_Neoras_Teach_Odo_Cond()
{
	if (C_HeroIs_Odo() && (TEACH_Neoras == TRUE))	{
		return TRUE;
	};
};
func void DIA_Neoras_Teach_Odo_Menu()
{
	var int any;	any = FALSE;
	Info_ClearChoices(DIA_Neoras_Teach_Odo);
	Info_AddChoice(DIA_Neoras_Teach_Odo,Dialog_Back,DIA_Neoras_Teach_Odo_BACK);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)	{
		Info_AddChoice(DIA_Neoras_Teach_Odo,"Лечебная эссенция (100 зол.)",DIA_Neoras_Teach_Odo_Health_01);
		any = TRUE;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))	{
		Info_AddChoice(DIA_Neoras_Teach_Odo,"Лечебный экстракт (200 зол.)",DIA_Neoras_Teach_Odo_Health_02);
		any = TRUE;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)	{
		Info_AddChoice(DIA_Neoras_Teach_Odo,"Эссенция маны (100 зол.)",DIA_Neoras_Teach_Odo_Mana_01);
		any = TRUE;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))	{
		Info_AddChoice(DIA_Neoras_Teach_Odo,"Экстракт маны (200 зол.)",DIA_Neoras_Teach_Odo_Mana_02);
		any = TRUE;
	};
	if (!any)	{
		AI_Output(self,other,"DIA_Neoras_TeachNothing_Odo_01_01");	//Сейчас я больше не могу ничему научить тебя.
		AI_Output(self,other,"DIA_Neoras_TeachNothing_Odo_01_02");	//Прочие знания предназначены лишь для тех, кто прошел испытание магией.
		TEACH_Neoras = FALSE;
	};
};
func void DIA_Neoras_Teach_Odo_Info()
{
	AI_Output(other,self,"DIA_Neoras_Teach_Odo_03_00");	//Мастер, я хочу учиться!
	if ((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))	{
		AI_Output(self,other,"DIA_Neoras_Teach_Odo_01_01");	//Ты уже знаешь все, чему я сейчас могу тебя обучить.
		return;
	};
		AI_Output(self,other,"DIA_Neoras_Teach_Odo_01_02");	//Что ты хочешь узнать?
	DIA_Neoras_Teach_Odo_Menu();
};
func void DIA_Neoras_Teach_Odo_Back()
{
		AI_Output(self,other,"DIA_Neoras_Teach_Odo_01_03");	//Возвращайся, когда будешь готов к уроку.
	Info_ClearChoices(DIA_Neoras_Teach_Odo);
};
func void DIA_Neoras_Teach_Odo_NoMoney()
{
		AI_Output(self,other,"DIA_Neoras_Teach_Odo_01_04");	//Обычно я не учу послушников, поэтому ты должен заплатить за урок. 
	Info_ClearChoices(DIA_Neoras_Teach_Odo);
};
func void DIA_Neoras_Teach_Odo_Health_01()
{
	if (Npc_HasItems(other,ItMi_Gold) >= 100)	{
		B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
		DIA_Neoras_Teach_Odo_Menu();
	}
	else	{
		DIA_Neoras_Teach_Odo_NoMoney();
	};
};
func void DIA_Neoras_Teach_Odo_Health_02()
{
	if (Npc_HasItems(other,ItMi_Gold) >= 200)	{
		B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
		DIA_Neoras_Teach_Odo_Menu();
	}
	else	{
		DIA_Neoras_Teach_Odo_NoMoney();
	};
};
func void DIA_Neoras_Teach_Odo_Mana_01()
{
	if (Npc_HasItems(other,ItMi_Gold) >= 100)	{
		B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
		DIA_Neoras_Teach_Odo_Menu();
	}
	else	{
		DIA_Neoras_Teach_Odo_NoMoney();
	};
};
func void DIA_Neoras_Teach_Odo_Mana_02()
{
	if (Npc_HasItems(other,ItMi_Gold) >= 200)	{
		B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
		DIA_Neoras_Teach_Odo_Menu();
	}
	else	{
		DIA_Neoras_Teach_Odo_NoMoney();
	};
};

