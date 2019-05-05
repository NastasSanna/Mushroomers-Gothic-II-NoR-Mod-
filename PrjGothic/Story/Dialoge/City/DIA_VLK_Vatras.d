
instance DIA_Vatras_EXIT(DIA_Proto_End)
{
	npc = VLK_439_Vatras;
};


/////////////////////////////////////// ЭРОЛ /////////////////////////////////////////////

//отдать все таблички
func void B_GivePlates2Vatras(var C_NPC slf, var C_NPC oth)
{
	var int cnt;	cnt = Npc_HasItems(oth,ItWr_OldStonePlate_Erol);
	
	if (cnt == 0)	{return;};
	if (MIS_Erol_Plates_GivenCnt == 0) {
		MIS_Erol_Plates_GivenDay1 = Wld_GetDay();
		AI_Output(self,other,"DIA_Vatras_Erol_GivePlates_05_00");	//Заходи ко мне, возможно, я смогу прочесть что-то полезное для поисков.
	};
	//B_GiveInvItems(oth,slf,ItWr_OldStonePlate_Erol,cnt);
	ItemTrans_items[0] = ItWr_OldStonePlate_Erol;
	ItemTrans_amount[0] = cnt;
	B_ItemsTransaction(oth,slf);
	
	MIS_Erol_Plates_GivenCnt += cnt;
	//B_GiveInvItems(slf,oth,ItMi_Gold,cnt * MIS_Erol_Plates_Pay);
	ItemTrans_items[0] = ItMi_Gold;
	ItemTrans_amount[0] = cnt * MIS_Erol_Plates_Pay;
	//B_GiveInvItems(slf,oth,ItPo_Health_02,cnt);
	ItemTrans_items[1] = ItPo_Health_02;
	ItemTrans_amount[1] = cnt;
	if (MIS_Erol_Plates_GivenCnt % 5 == 0)	{
		//B_GiveInvItems(slf,oth,ItPo_Health_03,cnt / 5 + 1);
		ItemTrans_items[2] = ItPo_Health_03;
		ItemTrans_amount[2] = cnt / 5 + 1;
	}
	else	{
		//B_GiveInvItems(slf,oth,ItPo_Health_03,cnt / 5);
		ItemTrans_items[2] = ItPo_Health_03;
		ItemTrans_amount[2] = cnt / 5;
	};
	
	B_ItemsTransaction(slf,oth);
	B_GivePlayerXP(XP_Erol_Plate * cnt);
	B_GiveAchievement_Erol_Archeologist();
};

//===================================================
instance DIA_Vatras_Erol_Hello(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_Erol_MR_Hello_Cond;
	information = DIA_Vatras_Erol_MR_Hello_Info;
	description = "Приветствую, досточтимый маг!";
};
func int DIA_Vatras_Erol_MR_Hello_Cond()
{
	if (C_HeroIs_Erol())	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_MR_Hello_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_MR_Hello_10_00");	//Приветствую, досточтимый маг!
	AI_Output(self,other,"DIA_Vatras_Erol_MR_Hello_05_01");	//Я ждал тебя. Нашел ли ты что-то новое в своих странствиях?
	if (Npc_HasItems(other,ItWr_OldStonePlate_Erol) == 0)	{
			AI_Output(other,self,"DIA_Vatras_Erol_MR_Hello_10_02");	//Пока нет.
		AI_Output(self,other,"DIA_Vatras_Erol_MR_Hello_05_03");	//Очень жаль.
	}
	else	{
		if (Npc_HasItems(other,ItWr_OldStonePlate_Erol) > 1)	{
			AI_Output(other,self,"DIA_Vatras_Erol_MR_Hello_10_04");	//Да, мне попалось несколько каменных табличек.
		}
		else	{
			AI_Output(other,self,"DIA_Vatras_Erol_MR_Hello_10_05");	//Да, я нашел каменную табличку.
		};
		AI_Output(self,other,"DIA_Vatras_Erol_MR_Hello_05_06");	//Благодарю тебя. Эти таблички чрезвычайно интересны.
		B_GivePlates2Vatras(self,other);
	};
};

//===================================================
instance DIA_Vatras_Erol_GivePlates(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 10;
	condition = DIA_Vatras_Erol_GivePlates_Cond;
	information = DIA_Vatras_Erol_GivePlates_Info;
	description = "(отдать каменные таблички)";
	permanent = TRUE;
};
func int DIA_Vatras_Erol_GivePlates_Cond()
{
	if (C_HeroIs_Erol() 
		&& Npc_HasItems(other,ItWr_OldStonePlate_Erol) && Npc_KnowsInfo(other,DIA_Vatras_Erol_Hello))	
	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_GivePlates_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_GivePlates_10_00");	//Я кое-что нашел для тебя.
	AI_Output(self,other,"DIA_Vatras_Erol_GivePlates_05_01");	//Благодарю.
	B_GivePlates2Vatras(self,other);	
};

//===================================================
instance DIA_Vatras_Erol_AboutPlates(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_Erol_AboutPlates_Cond;
	information = DIA_Vatras_Erol_AboutPlates_Info;
	description = "Что такого интересного в этих табличках?";
};
func int DIA_Vatras_Erol_AboutPlates_Cond()
{
	if (C_HeroIs_Erol() && Npc_KnowsInfo(other,DIA_Vatras_Erol_Hello))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_AboutPlates_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_AboutPlates_10_00");	//Что такого интересного в этих табличках?
	AI_Output(self,other,"DIA_Vatras_Erol_AboutPlates_05_01");	//Как я говорил тебе ранее, эти таблички принадлежат древнему народу, что жил здесь много веков назад.
	AI_Output(self,other,"DIA_Vatras_Erol_AboutPlates_05_02");	//Таблички содержат разнообразнейшие сведения об их жизни.
	AI_Output(self,other,"DIA_Vatras_Erol_AboutPlates_05_03");	//От храмовых записей и легенд до учета налогов и личных писем.
	AI_Output(self,other,"DIA_Vatras_Erol_AboutPlates_05_04");	//Все они постепенно продвигают меня в понимании их культуры и быта.
	AI_Output(self,other,"DIA_Vatras_Erol_AboutPlates_05_05");	//Некоторые содержат крайне полезные знания по магии, медицине и естествознанию.
	AI_Output(self,other,"DIA_Vatras_Erol_AboutPlates_05_06");	//Жаль, что мне приходлось исследовать их одному. Будь здесь мои братья, дело продвигалось бы гораздо быстрее.
};

//===================================================
instance DIA_Vatras_Erol_OldLanguage(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_Erol_OldLanguage_Cond;
	information = DIA_Vatras_Erol_OldLanguage_Info;
	description = "Ты мог бы обучить меня языку древних?";
};
func int DIA_Vatras_Erol_OldLanguage_Cond()
{
	if (C_HeroIs_Erol() && Npc_KnowsInfo(other,DIA_Vatras_Erol_Hello))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_OldLanguage_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_OldLanguage_10_00");	//Ты мог бы обучить меня языку древних?
	AI_Output(self,other,"DIA_Vatras_Erol_OldLanguage_05_01");	//Боюсь, я сам нахожусь лишь в начале этого пути.
	AI_Output(self,other,"DIA_Vatras_Erol_OldLanguage_05_02");	//Поэтому, чем больше табличек ты принесешь, тем дальше я смогу по нему продвинуться.
};

//*///********************************* ЧИСЛА ************************************

//===================================================
instance DIA_Vatras_Erol_Help(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Vatras_Erol_Help_Cond;
	information = DIA_Vatras_Erol_Help_Info;
	description = "Быть может, я смогу помочь с расшифровкой записей?";
};
func int DIA_Vatras_Erol_Help_Cond()
{
	if (C_HeroIs_Erol() && Npc_KnowsInfo(other,DIA_Vatras_Erol_OldLanguage))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_Help_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_Help_10_00");	//Быть может, я смогу помочь с расшифровкой записей?
	AI_Output(self,other,"DIA_Vatras_Erol_Help_05_01");	//Хм, почему бы и нет.
	AI_Output(self,other,"DIA_Vatras_Erol_Help_05_02");	//Я постепенно понимаю смысл текстов, но числа по-прежнему ставят меня в тупик. Если бы удалось понять их систему счета...
	AI_Output(self,other,"DIA_Vatras_Erol_Help_05_03");	//Вот, у меня есть табличка, на которой, очевидно, отмечены какие-то расчеты.
	B_GiveInvItems(self,other,ItWr_Clayplate_Numbers,1);
	//UNFINISHED озвучку проверить
	AI_Output(self,other,"DIA_Vatras_Erol_Help_05_04");	//Числа записаны в виде групп символов в два столбца. Над двойной чертой вверху должна быть сумма чисел, записанных под ней.
	AI_Output(self,other,"DIA_Vatras_Erol_Help_05_05");	//Попробуй понять, что это за числа и что означает каждый символ, использующийся для цифр.
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_Numbers);
};

//===================================================
instance DIA_Vatras_Erol_NumbersSolved(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 4;
	condition = DIA_Vatras_Erol_NumbersSolved_Cond;
	information = DIA_Vatras_Erol_NumbersSolved_Info;
	description = "Мне удалось разгадать, что это за числа!";
};
func int DIA_Vatras_Erol_NumbersSolved_Cond()
{
	if (C_HeroIs_Erol() && Npc_KnowsInfo(other,DIA_Vatras_Erol_Help) && MIS_Erol_Plates_NumbersSolved
		 && Npc_HasItems(other,ItWr_Clayplate_Numbers_Result) && Npc_HasItems(other,ItWr_Clayplate_Numbers))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_NumbersSolved_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_NumbersSolved_10_00");	//Мне удалось разгадать, что это за числа! Вот, посмотри, я все записал.
	B_GiveInvItems(other,self,ItWr_Clayplate_Numbers_Result,1);
	B_GiveInvItems(other,self,ItWr_Clayplate_Numbers,1);
	AI_Output(self,other,"DIA_Vatras_Erol_NumbersSolved_05_01");	//Так, понимаю...
	AI_Output(self,other,"DIA_Vatras_Erol_NumbersSolved_05_02");	//Благодарю тебя за помощь. Возьми эти зелья и свиток в качестве награды. И приноси все интересное, что тебе попадется.
	//B_GiveInvItems(self,other,ItPo_Health_Addon_04,2);
	//B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	//B_GiveInvItems(self,other,ItSc_Thunderstorm,1);
	ItemTrans_items[0] = ItPo_Health_Addon_04;
	ItemTrans_amount[0] = 2;
	ItemTrans_items[1] = ItPo_Perm_Mana;
	ItemTrans_amount[1] = 1;
	ItemTrans_items[2] = ItSc_Thunderstorm;
	ItemTrans_amount[2] = 1;
	B_ItemsTransaction(self,other);
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_NumbersTold);
	B_GivePlayerXP(XP_Erol_NumbersSolved);	//опыт только после возврата!
};

//*///********************************* ОГОНЕК ************************************

//===================================================
instance DIA_Vatras_Erol_AboutAmul(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 6;
	condition = DIA_Vatras_Erol_AboutAmul_Cond;
	information = DIA_Vatras_Erol_AboutAmul_Info;
	important = TRUE;
};
func int DIA_Vatras_Erol_AboutAmul_Cond()
{
	if (C_HeroIs_Erol() && (MIS_Erol_Plates_GivenCnt > 0) 
		&& (MIS_Erol_Plates_GivenDay1 < Wld_GetDay_Shifted(6)))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_AboutAmul_Info()
{
	AI_Output(self,other,"DIA_Vatras_Erol_AboutAmul_05_00");	//Эрол, я ждал тебя. У меня для тебя новый заказ.
	AI_Output(self,other,"DIA_Vatras_Erol_AboutAmul_05_01");	//Мне удалось прочесть одну из табличек, что ты мне принес.
	AI_Output(self,other,"DIA_Vatras_Erol_AboutAmul_05_02");	//В ней упоминается очень интересный амулет - рудный амулет ищущего огонька.
	AI_Output(self,other,"DIA_Vatras_Erol_AboutAmul_05_03");	//Я полагаю, что его можно найти где-то на острове. Мне бы очень хотелось его увидеть.
		AI_Output(other,self,"DIA_Vatras_Erol_AboutAmul_10_04");	//Я постараюсь отыскать его.
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_Amul);
	Wld_InsertItem(ItAm_MR_WispDetector_Lake,"FP_ITEM_AMUL_LAKE");
};
//===================================================
instance DIA_Vatras_Erol_WhereAmul(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 7;
	condition = DIA_Vatras_Erol_WhereAmul_Cond;
	information = DIA_Vatras_Erol_WhereAmul_Info;
	description = "Где мне искать этот амулет?";
};
func int DIA_Vatras_Erol_WhereAmul_Cond()
{
	if (C_HeroIs_Erol() && !MIS_Erol_Plates_AmulFound
		&& Npc_KnowsInfo(other,DIA_Vatras_Erol_AboutAmul))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_WhereAmul_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_WhereAmul_10_00");	//Где мне искать этот амулет?
	AI_Output(self,other,"DIA_Vatras_Erol_WhereAmul_05_01");	//К сожалению, в табличке нет точного указания. Он мог и вовсе исчезнуть или быть погребен под землей.
	AI_Output(self,other,"DIA_Vatras_Erol_WhereAmul_05_02");	//Но есть один верный признак - поблизости от амулета собираются призрачные огни.
	AI_Output(self,other,"DIA_Vatras_Erol_WhereAmul_05_03");	//Надеюсь, это поможет в поисках.
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_AmulWhere);
};
//===================================================
instance DIA_Vatras_Erol_Wisps(C_Info)
{
	npc = VLK_439_Vatras;							nr = 8;
	condition = DIA_Vatras_Erol_Wisps_Cond;
	information = DIA_Vatras_Erol_Wisps_Info;
	description = "Расскажи мне об ищущем огоньке.";
};
func int DIA_Vatras_Erol_Wisps_Cond()
{
	if (C_HeroIs_Erol()
		&& Npc_KnowsInfo(other,DIA_Vatras_Erol_AboutAmul))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_Wisps_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_Wisps_10_00");	//Расскажи мне об ищущем огоньке.
	AI_Output(self,other,"DIA_Vatras_Erol_Wisps_05_01");	//Ищущие огоньки - это одушевленные сгустки магической энергии.
	AI_Output(self,other,"DIA_Vatras_Erol_Wisps_05_02");	//Они рождаются из магической руды, и на всю жизнь остаются привязаны к ней.
	AI_Output(self,other,"DIA_Vatras_Erol_Wisps_05_03");	//Огонек можно рассеять магией или оружием, но спустя некоторое время он возродится.
	AI_Output(self,other,"DIA_Vatras_Erol_Wisps_05_04");	//Однако, если огонек по каким-то причинам теряет свою руду, он становится блуждающим.
	AI_Output(self,other,"DIA_Vatras_Erol_Wisps_05_05");	//Эти несчастные создания продолжают скитаться в поисках родной руды.
	AI_Output(self,other,"DIA_Vatras_Erol_Wisps_05_06");	//Сталкиваясь с живыми существами, они могут причинить существенный вред, но специально не нападают.
};
//===================================================
var int DIA_Vatras_Erol_ChargeAmul_DateTime;
instance DIA_Vatras_Erol_AmulFound(C_Info)
{
	npc = VLK_439_Vatras;							nr = 9;
	condition = DIA_Vatras_Erol_AmulFound_Cond;
	information = DIA_Vatras_Erol_AmulFound_Info;
	description = "Я нашел амулет ищущего огонька.";
};
func int DIA_Vatras_Erol_AmulFound_Cond()
{
	if (C_HeroIs_Erol() && MIS_Erol_Plates_AmulFound
		&& Npc_HasItems(other,ItAm_MR_WispDetector_Lake))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_AmulFound_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_AmulFound_10_00");	//Я нашел амулет ищущего огонька. Он лежал на дне озера в горах.
	B_GiveInvItems(other,self,ItAm_MR_WispDetector_Lake,1);
	Npc_RemoveInvItem(self,ItAm_MR_WispDetector_Lake);
	AI_Output(self,other,"DIA_Vatras_Erol_AmulFound_05_01");	//Превосходно! Скажи, тебе удалось призвать огонек?
	//надевали?
	if (Equip_WispDetector_Uncharged_Once)	{	//да
			AI_Output(other,self,"DIA_Vatras_Erol_AmulFound_10_02");	//Нет. Когда я надел амулет, ничего не произошло.
		AI_Output(self,other,"DIA_Vatras_Erol_AmulFound_05_03");	//Странно. (внимательно осматривает амулет)
	}
	else	{	//нет
			AI_Output(other,self,"DIA_Vatras_Erol_AmulFound_10_04");	//Я не пытался.
		AI_Output(self,other,"DIA_Vatras_Erol_AmulFound_05_05");	//Возможно ты и прав, не стоит испытывать незнакомые магические предметы.
		AI_Output(self,other,"DIA_Vatras_Erol_AmulFound_05_06");	//Я попробую надеть его.
		AI_Wait(self,1.1);
		B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_AmulWearVatras);
		AI_Output(self,other,"DIA_Vatras_Erol_AmulFound_05_07");	//Странно, ничего не происходит. (внимательно осматривает амулет)
	};
	AI_Output(self,other,"DIA_Vatras_Erol_AmulFound_05_08");	//Кажется, кусок руды в амулете разрядился. Мне нужно подумать, как восстановить ее силу.
	AI_Output(self,other,"DIA_Vatras_Erol_AmulFound_05_09");	//Пожалуйста, зайди ко мне завтра утром.
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_AmulGiven);
	B_GivePlayerXP(XP_Erol_AmulGiven);
	DIA_Vatras_Erol_ChargeAmul_DateTime = (24 * (Wld_GetDay() + 1) + 5) * 60 + 50;
};
//===================================================
instance DIA_Vatras_Erol_ChargeAmul(C_Info)
{
	npc = VLK_439_Vatras;							nr = 10;
	condition = DIA_Vatras_Erol_ChargeAmul_Cond;
	information = DIA_Vatras_Erol_ChargeAmul_Info;
	important = TRUE;
};
func int DIA_Vatras_Erol_ChargeAmul_Cond()
{
	if (C_HeroIs_Erol()	&& DIA_WhenAsked_cond()
		&& (DIA_Vatras_Erol_ChargeAmul_DateTime > 0)
		&& (Wld_GetFullTime() >= DIA_Vatras_Erol_ChargeAmul_DateTime)
		&& Npc_KnowsInfo(other,DIA_Vatras_Erol_AmulFound))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_ChargeAmul_Info()
{
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_00");	//Я нашел способ зарядить амулет. Но мне снова потребуется твоя помощь.
		AI_Output(other,self,"DIA_Vatras_Erol_ChargeAmul_10_01");	//Что нужно сделать?
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_02");	//Возьми амулет и этот свиток.
	//дает амулет и Свиток Ватраса
	//B_GiveInvItems(self,other,ItAm_MR_WispDetector_Uncharged,1);
	//B_GiveInvItems(self,other,ItMi_Vatras_AmulScroll,1);
	ItemTrans_items[0] = ItAm_MR_WispDetector_Uncharged;
	ItemTrans_amount[0] = 1;
	ItemTrans_items[1] = ItMi_Vatras_AmulScroll;
	ItemTrans_amount[1] = 1;
	B_ItemsTransaction(self, other);
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_03");	//Сначала тебе придется восстановить магическую энергию руды, а потом вернуть ее в огонек.
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_04");	//Тебе потребуется еще один кусок руды.
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_05");	//Насколько я знаю, сейчас вся руда уходит на военные нужды, и достать ее нелегко. Но я верю в твои способности.
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_06");	//Когда найдешь руду, ступай в место силы - один из каменных кругов. Приложи кусок руды к амулету и прочти заклинание, что я тебе дал.
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_07");	//В результате магическая энергия из куска руды должна перетечь в амулет.
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_08");	//Но, боюсь, этого недостаточно, чтобы огонек возродился.
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_09");	//Придется рассеять один блуждающий огонек. Тогда амулет должен заработать.
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_AmulCharge);
	Wld_InsertNpc(Wisp,"NW_TROLLAREA_PATH_71");
};
//===================================================
instance DIA_Vatras_Erol_LestReplaceOre(C_Info)
{
	npc = VLK_439_Vatras;							nr = 11;
	condition = DIA_Vatras_Erol_LestReplaceOre_Cond;
	information = DIA_Vatras_Erol_LestReplaceOre_Info;
	description = "А почему бы просто не заменить руду?";
};
func int DIA_Vatras_Erol_LestReplaceOre_Cond()
{
	if (C_HeroIs_Erol()
		 && Npc_KnowsInfo(other,DIA_Vatras_Erol_AmulFound)
		 && !MIS_Erol_Plates_AmulReady && !MIS_Erol_Plates_AmulWorks && !Npc_HasItems(other,ItAm_MR_WispDetector_Ready))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_LestReplaceOre_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_LestReplaceOre_10_00");	//А почему бы просто не заменить руду?
	AI_Output(self,other,"DIA_Vatras_Erol_LestReplaceOre_05_01");	//Огонек появляется только из своей родной руды. Такая руда - чрезвычайная редкость.
	AI_Output(self,other,"DIA_Vatras_Erol_LestReplaceOre_05_02");	//Амулет - всего лишь оправа для нее.
};
//===================================================
instance DIA_Vatras_Erol_AmulReady(C_Info)
{
	npc = VLK_439_Vatras;							nr = 12;
	condition = DIA_Vatras_Erol_AmulReady_Cond;
	information = DIA_Vatras_Erol_AmulReady_Info;
	description = "Я все сделал, как ты сказал.";
};
func int DIA_Vatras_Erol_AmulReady_Cond()
{
	if (C_HeroIs_Erol() 
		&& Npc_KnowsInfo(other,DIA_Vatras_Erol_AmulFound)
		&& Npc_HasItems(other,ItAm_MR_WispDetector_Ready))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_AmulReady_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_AmulReady_10_00");	//Я все сделал, как ты сказал.
	B_GivePlayerXP(XP_Erol_AmulCharged);
	if (Npc_CanSeeNpc(self,Wisp_Detector) || (Npc_GetDistToNpc(self,Wisp_Detector) < PERC_DIST_DIALOG))	{
		AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_05_01");	//Вижу, сработало.
		Info_ClearChoices(DIA_Vatras_Erol_AmulReady);
		Info_AddChoice(DIA_Vatras_Erol_AmulReady,"Да, но он ничего не ищет!",DIA_Vatras_Erol_AmulReady_NoSearch);
	}
	else	{
		AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_05_02");	//И как? Получилось?
			AI_Output(other,self,"DIA_Vatras_Erol_AmulReady_10_03");	//А ты не был уверен в результате?
		AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_05_04");	//Это очень древняя магия, и я все еще не уверен в расшифровке некоторых табличек.
		AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_05_05");	//Но тебе в любом случае ничего не угрожало.
		if (MIS_Erol_Plates_AmulWorks)	{
			AI_Output(other,self,"DIA_Vatras_Erol_AmulReady_10_06");	//Когда я надел амулет, огонек появился, но он ничего не искал.
			AI_Output(other,self,"DIA_Vatras_Erol_AmulReady_10_07");	//Стоило мне снять амулет, как огонек рассеялся.
				AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_05_08");	//Значит, все прошло, как надо.
			Info_ClearChoices(DIA_Vatras_Erol_AmulReady);
			Info_AddChoice(DIA_Vatras_Erol_AmulReady,"Да, но он ничего не ищет!",DIA_Vatras_Erol_AmulReady_NoSearch);
		}
		else	{
				AI_Output(other,self,"DIA_Vatras_Erol_AmulReady_10_09");	//Ладно. Но я не пытался призвать огонек.
			AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_05_10");	//Что ж, попробуй сейчас. Не волнуйся, это абсолютно безопасно.
			Info_ClearChoices(DIA_Vatras_Erol_AmulReady);
			Info_AddChoice(DIA_Vatras_Erol_AmulReady,"(надеть амулет)",DIA_Vatras_Erol_AmulReady_Wear);
		};
	};
};
func void DIA_Vatras_Erol_AmulReady_Wear()
{
	// TEST NEEDED!
	EquipItem(other,ItAm_MR_WispDetector_Ready);
	AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_Wear_05_00");	//Вижу, амулет работает.
	Info_ClearChoices(DIA_Vatras_Erol_AmulReady);
	Info_AddChoice(DIA_Vatras_Erol_AmulReady,"Да, но он ничего не ищет!",DIA_Vatras_Erol_AmulReady_NoSearch);
};
func void DIA_Vatras_Erol_AmulReady_NoSearch()
{
		AI_Output(other,self,"DIA_Vatras_Erol_AmulReady_NoSearch_10_00");	//Да, но он ничего не ищет!
	AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_NoSearch_05_01");	//Возрожденный огонек подобен новорожденному младенцу. Нужно обучать его, чтобы он сумел найти что-нибудь.
		AI_Output(other,self,"DIA_Vatras_Erol_AmulReady_NoSearch_10_02");	//И как это сделать?
	AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_NoSearch_05_03");	//На этот вопрос я и буду искать ответ в ближайшее время.
	AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_NoSearch_05_04");	//Теперь, пожалуйста, отдай мне амулет.
	//отдаем
	B_GiveInvItems(other,self,ItAm_MR_WispDetector_Ready,1);
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_AmulSuccess);
	AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_NoSearch_05_05");	//Возьми эти зелья и свитки в награду. Надеюсь, они помогут тебе в странствиях.
	MIS_Erol_Plates_AmulReady = TRUE;
	//награда
	//B_GiveInvItems(self,other,ItPo_Mana_02,2);
	//B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	//B_GiveInvItems(self,other,ItSc_MediumHeal,2);
	//B_GiveInvItems(self,other,ItSc_IceWave,1);
	ItemTrans_items[0] = ItPo_Mana_02;
	ItemTrans_amount[0] = 2;
	ItemTrans_items[1] = ItPo_Perm_DEX;
	ItemTrans_amount[1] = 1;
	ItemTrans_items[2] = ItSc_MediumHeal;
	ItemTrans_amount[2] = 2;
	ItemTrans_items[3] = ItSc_IceWave;
	ItemTrans_amount[3] = 1;
	B_ItemsTransaction(self, other);
	Info_ClearChoices(DIA_Vatras_Erol_AmulReady);
};

//*///********************************* ДРАГОЦЕННЫЕ ТАБЛИЧКИ ************************************

//===================================================
instance DIA_Vatras_Erol_GoldPlate(C_Info)
{
	npc = VLK_439_Vatras;						nr = 13;
	condition = DIA_Vatras_Erol_GoldPlate_Cond;
	information = DIA_Vatras_Erol_GoldPlate_Info;
	description = "Смотри, что я нашел! Золотая табличка!";
};
func int DIA_Vatras_Erol_GoldPlate_Cond()
{
	if (C_HeroIs_Erol()
		 && Npc_KnowsInfo(other, DIA_Vatras_Erol_Hello)
		 && Npc_HasItems(other,ItWr_Stoneplate_Gold))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_GoldPlate_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_GoldPlate_10_00");	//Смотри, что я нашел! Золотая табличка!
	B_GivePlayerXP(XP_Erol_Gold);
	B_GiveInvItems(other,self,ItWr_Stoneplate_Gold,1);
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_01");	//Золотая?! Это почти чудо!
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_02");	//Помимо каменных и глиняных, древний народ использовал и золотые, и серебряные таблички.
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_03");	//Но, похоже, до большинства из них добрались охотники за сокровищами, которых интересовал лишь металл.
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_04");	//Где ты ее нашел?
		AI_Output(other,self,"DIA_Vatras_Erol_GoldPlate_10_05");	//Я снял ее со скелета на заброшенном кладбище в лесу.
	//Ватрас читает табличку
	AI_StandUp(self);
	AI_UseItemToState(self,ItWr_Stoneplate_Gold,1);
	AI_Wait(self, 1.5);
	AI_UseItemToState(self,ItWr_Stoneplate_Gold,-1);
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_06");	//Мне потребуется больше времени, чтобы понять ее полностью, но в целом здесь идет речь о каком-то великом целителе.
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_07");	//Возможно, он был похоронен на этом кладбище.
		AI_Output(other,self,"DIA_Vatras_Erol_GoldPlate_10_08");	//Точно! Тот скелет не был воином. Он был довольно слаб и вооружен серпом.
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_09");	//Если это действительно место его захоронения, то там может быть что-то еще.
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_10");	//Попробуй поискать в земле. Нехорошо беспокоить мертвых, но эти знания могут оказаться очень важными.
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_11");	//Возьми эти свитки и свою награду.
	//дает свиток уничтожения нежити, света, большое исцеление
	//B_GiveInvItems(self,other,ItMi_Gold,100);
	//B_GiveInvItems(self,other,ItSc_FullHeal,1);
	//B_GiveInvItems(self,other,ItSc_Light,3);
	//B_GiveInvItems(self,other,ItSc_HarmUndead,1);
	ItemTrans_items[0] = ItMi_Gold;
	ItemTrans_amount[0] = 100;
	ItemTrans_items[1] = ItSc_FullHeal;
	ItemTrans_amount[1] = 1;
	ItemTrans_items[2] = ItSc_Light;
	ItemTrans_amount[2] = 3;
	ItemTrans_items[3] = ItSc_HarmUndead;
	ItemTrans_amount[3] = 1;
	B_ItemsTransaction(self,other);
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_GoldGiven);
	MIS_Erol_Plates_GoldGiven = TRUE;
};
//===================================================
instance DIA_Vatras_Erol_SilverPlate(C_Info)
{
	npc = VLK_439_Vatras;						nr = 14;
	condition = DIA_Vatras_Erol_SilverPlate_Cond;
	information = DIA_Vatras_Erol_SilverPlate_Info;
	description = "Вот, я откопал эту серебряную табличку.";
};
func int DIA_Vatras_Erol_SilverPlate_Cond()
{
	if (C_HeroIs_Erol() 
		&& MIS_Erol_Plates_GoldGiven
		&& Npc_HasItems(other,ItWr_Stoneplate_Silver))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_SilverPlate_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_SilverPlate_10_00");	//Вот, я откопал эту серебряную табличку.
	B_GiveInvItems(other,self,ItWr_Stoneplate_Silver,1);
	if (Npc_HasItems(other,ItWr_Stoneplate_SilverPiece))	{//уже нашли обломок
		B_GivePlayerXP(XP_Erol_Silver + XP_Erol_SilverPiece);
			AI_Output(other,self,"DIA_Vatras_Erol_SilverPlate_10_01");	//А этот кусок я отобрал у гоблинов.
		B_GiveInvItems(other,self,ItWr_Stoneplate_SilverPiece,1);
		B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_SilverGivenFull);
		AI_Output(self,other,"DIA_Vatras_Erol_SilverPlate_05_02");	//Какая удача, что он не был утерян. Здесь должны быть рецепты совершенно необычных зелий.
		AI_Output(self,other,"DIA_Vatras_Erol_SilverPlate_05_03");	//Возьми эту награду.
		//B_GiveInvItems(self,other,ItMi_Gold,MIS_Erol_Plates_PaySpecial * 2);
		//B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
		//B_GiveInvItems(self,other,ItPo_Health_03,3);
		ItemTrans_items[0] = ItMi_Gold;
		ItemTrans_amount[0] = MIS_Erol_Plates_PaySpecial * 2;
		ItemTrans_items[1] = ItPo_Perm_DEX;
		ItemTrans_amount[1] = 1;
		ItemTrans_items[2] = ItPo_Health_03;
		ItemTrans_amount[2] = 3;
		B_ItemsTransaction(self,other);
		MIS_Erol_Plates_SilverFull_Day = Wld_GetDay_Shifted(23) + 1;
		MIS_Erol_Plates_SilverFull = TRUE;
	}
	else	{//нет угла
		B_GivePlayerXP(XP_Erol_Silver);
			AI_Output(other,self,"DIA_Vatras_Erol_SilverPlate_10_04");	//Но у нее не хватает куска. Я перерыл все кладбище, но ничего не нашел.
		AI_Output(self,other,"DIA_Vatras_Erol_SilverPlate_05_05");	//Печально, если эта часть потеряна безвозвратно.
			AI_Output(other,self,"DIA_Vatras_Erol_SilverPlate_10_06");	//Еще есть надежда. Если этот кусок утащили гоблины, то он, скорее всего, цел.
			AI_Output(other,self,"DIA_Vatras_Erol_SilverPlate_10_07");	//Я постараюсь разыскать его.
		AI_Output(self,other,"DIA_Vatras_Erol_SilverPlate_05_08");	//Полагаюсь на тебя. А пока возьми награду за свои труды.
		//B_GiveInvItems(self,other,ItMi_Gold,MIS_Erol_Plates_PaySpecial);
		//B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
		//B_GiveInvItems(self,other,ItPo_Health_03,1);
		ItemTrans_items[0] = ItMi_Gold;
		ItemTrans_amount[0] = MIS_Erol_Plates_PaySpecial;
		ItemTrans_items[1] = ItPo_Perm_DEX;
		ItemTrans_amount[1] = 1;
		ItemTrans_items[2] = ItPo_Health_03;
		ItemTrans_amount[2] = 1;
		B_ItemsTransaction(self,other);
	};
};
//===================================================
instance DIA_Vatras_Erol_SilverPiece(C_Info)
{
	npc = VLK_439_Vatras;						nr = 15;
	condition = DIA_Vatras_Erol_SilverPiece_Cond;
	information = DIA_Vatras_Erol_SilverPiece_Info;
	description = "Я нашел потеряный обломок.";
};
func int DIA_Vatras_Erol_SilverPiece_Cond()
{
	if (C_HeroIs_Erol() 
		&& Npc_KnowsInfo(other,DIA_Vatras_Erol_SilverPlate)
		&& Npc_HasItems(other,ItWr_Stoneplate_SilverPiece))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_SilverPiece_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_SilverPiece_10_00");	//Я нашел потеряный обломок.
	B_GiveInvItems(other,self,ItWr_Stoneplate_SilverPiece,1);
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_SilverGivenFull);
	B_GivePlayerXP(XP_Erol_SilverPiece);
	AI_Output(self,other,"DIA_Vatras_Erol_SilverPiece_05_01");	//Наконец-то! Спасибо. На нам записаны некоторые важные ингредиенты зелья.
		AI_Output(other,self,"DIA_Vatras_Erol_SilverPiece_10_02");	//Как насчет награды?
	AI_Output(self,other,"DIA_Vatras_Erol_SilverPiece_05_03");	//Ох, прости, чуть не забыл. Возьми.
	//B_GiveInvItems(self,other,ItMi_Gold,MIS_Erol_Plates_PaySpecial);
	//B_GiveInvItems(self,other,ItPo_Health_03,3);
	ItemTrans_items[0] = ItMi_Gold;
	ItemTrans_amount[0] = MIS_Erol_Plates_PaySpecial;
	ItemTrans_items[1] = ItPo_Health_03;
	ItemTrans_amount[1] = 2;
	B_ItemsTransaction(self,other);
	MIS_Erol_Plates_SilverFull_Day = Wld_GetDay_Shifted(23) + 1;
	MIS_Erol_Plates_SilverFull = TRUE;
};
//===================================================
instance DIA_Vatras_Erol_AncientPotion(C_Info)
{
	npc = VLK_439_Vatras;						nr = 16;
	condition = DIA_Vatras_Erol_AncientPotion_Cond;
	information = DIA_Vatras_Erol_AncientPotion_Info;
	important = TRUE;
};
func int DIA_Vatras_Erol_AncientPotion_Cond()
{
	if (C_HeroIs_Erol() 
		&& MIS_Erol_Plates_SilverFull && (MIS_Erol_Plates_SilverFull_Day < Wld_GetDay_Shifted(4)))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_AncientPotion_Info()
{
	AI_Output(self,other,"DIA_Vatras_Erol_AncientPotion_05_01");	//Эрол, постой!
	AI_Output(self,other,"DIA_Vatras_Erol_AncientPotion_05_02");	//Мне удалось приготовить одно из зелий с той таблички. Возьми, ты по праву заслуживаешь получить его первым.
	B_GiveInvItems(self,other,ItPo_MR_OldAlch,1);
		AI_Output(other,self,"DIA_Vatras_Erol_AncientPotion_10_03");	//И что оно дает?
	AI_Output(self,other,"DIA_Vatras_Erol_AncientPotion_05_04");	//Оно не только полностью излечивает раны, но и делает твою кожу крепче.
};

//*/

//*///********************************* ФИНАЛ! ************************************

//===================================================
instance DIA_Vatras_Erol_Success(C_Info)
{
	npc = VLK_439_Vatras;						nr = 17;
	condition = DIA_Vatras_Erol_Success_Cond;
	information = DIA_Vatras_Erol_Success_Info;
	description = "Я могу еще чем-нибудь помочь?";
};
func int DIA_Vatras_Erol_Success_Cond()
{
	if (C_HeroIs_Erol()
		&& MIS_Erol_Plates_NumbersSolved && MIS_Erol_Plates_AmulReady && MIS_Erol_Plates_GoldGiven && MIS_Erol_Plates_SilverFull)	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_Success_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_Success_10_00");	//Я могу еще чем-нибудь помочь?
	AI_Output(self,other,"DIA_Vatras_Erol_Success_05_01");	//Думаю, пока нет.
	AI_Output(self,other,"DIA_Vatras_Erol_Success_05_02");	//Просто продолжай приносить мне таблички, которые сумеешь найти.
	AI_Output(self,other,"DIA_Vatras_Erol_Success_05_03");	//А я постараюсь подробнее изучить то, что имеется.
	B_LogEntry_Status(TOPIC_Erol_Plates,LOG_SUCCESS,TOPIC_Erol_Plates_Success);
	B_GivePlayerXP(XP_Erol_Success);
};

//*/


/////////////////////////////////////// САРА /////////////////////////////////////////////

//===================================================
instance DIA_Vatras_Sarah_NeedHelp(C_Info)
{
	npc = VLK_439_Vatras;						nr = 20;
	condition = DIA_Vatras_Sarah_NeedHelp_Cond;
	information = DIA_Vatras_Sarah_NeedHelp_Info;
	description = "Досточтимый маг, мне очень нужен ваш совет!";
};
func int DIA_Vatras_Sarah_NeedHelp_Cond()
{
	if (C_HeroIs_Sarah()
		&& (MIS_Sarah_BadHabit == LOG_Running) && Npc_KnowsInfo(other, DIA_Nadja_Sarah_TellAsIs))	{
		return TRUE;
	};
};
func void DIA_Vatras_Sarah_NeedHelp_Info()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_NeedHelp_16_00");	//Досточтимый маг, мне очень нужен ваш совет!
	AI_Output(self,other,"DIA_Vatras_Sarah_NeedHelp_05_01");	//Я внимательно слушаю тебя.
		AI_Output(other,self,"DIA_Vatras_Sarah_NeedHelp_16_02");	//Моя подруга, она... в общем, курит какую-то гадость. И это для нее совсем плохо. Я даже боюсь, что она умрет.
		AI_Output(other,self,"DIA_Vatras_Sarah_NeedHelp_16_03");	//Я не знаю, что делать. Мои уговоры она не слушает.
	AI_Output(self,other,"DIA_Vatras_Sarah_NeedHelp_05_04");	//Все чаще я слышу, что из-под купола приходит не только руда, но и болотник - трава, которую курят слабые духом, чтобы облегчить свою долю.
	AI_Output(self,other,"DIA_Vatras_Sarah_NeedHelp_05_05");	//Лишь раз попробовав его, они больше не могут остановиться. Их тело и разум попадают в зависимость, и избавиться от нее крайне трудно.
};

//===================================================
instance DIA_Vatras_Sarah_HowToArgue(C_Info)
{
	npc = VLK_439_Vatras;						nr = 21;
	condition = DIA_Vatras_Sarah_HowToArgue_Cond;
	information = DIA_Vatras_Sarah_HowToArgue_Info;
	description = "Как мне убедить ее бросить?";
};
func int DIA_Vatras_Sarah_HowToArgue_Cond()
{
	if (C_HeroIs_Sarah()
		&& (MIS_Sarah_BadHabit == LOG_Running) && Npc_KnowsInfo(other,DIA_Vatras_Sarah_NeedHelp))	{
		return TRUE;
	};
};
func void DIA_Vatras_Sarah_HowToArgue_Info()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_HowToArgue_16_00");	//Как мне убедить ее бросить?
	AI_Output(self,other,"DIA_Vatras_Sarah_HowToArgue_05_01");	//Объясни, сколько вреда она себе причиняет.
		AI_Output(other,self,"DIA_Vatras_Sarah_HowToArgue_16_02");	//Никакие разумные доводы на нее не действуют.
	AI_Output(self,other,"DIA_Vatras_Sarah_HowToArgue_05_03");	//Значит, она понимает, к чему ведет ее пагубное пристрастие, но не желает отказываться от него?
	AI_Output(self,other,"DIA_Vatras_Sarah_HowToArgue_05_04");	//Тогда разум будет слабым помощником.
	AI_Output(self,other,"DIA_Vatras_Sarah_HowToArgue_05_05");	//Попытайся воззвать к ее чувствам. Если она и правда считает тебя подругой, то должна послушать.
		AI_Output(other,self,"DIA_Vatras_Sarah_HowToArgue_16_06");	//Мы были подругами в детстве. Но уже много лет не виделись. Мне кажется, она на меня в обиде.
	AI_Output(self,other,"DIA_Vatras_Sarah_HowToArgue_05_07");	//Тогда найди кого-то, кого она уважает, кому доверяет и кого слушает. Родители, друзья.
	MIS_Sarah_BadHabit_VatrasAsked = TRUE;
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_NeedAuthority);
};

//===================================================
instance DIA_Vatras_Sarah_MagicHelp(C_Info)
{
	npc = VLK_439_Vatras;						nr = 22;
	condition = DIA_Vatras_Sarah_MagicHelp_Cond;
	information = DIA_Vatras_Sarah_MagicHelp_Info;
	description = "Может быть, твоя магия поможет?";
};
func int DIA_Vatras_Sarah_MagicHelp_Cond()
{
	if (C_HeroIs_Sarah()
		&& (MIS_Sarah_BadHabit == LOG_Running) && Npc_KnowsInfo(other,DIA_Vatras_Sarah_NeedHelp))	{
		return TRUE;
	};
};
func void DIA_Vatras_Sarah_MagicHelp_Info()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_MagicHelp_16_00");	//Может быть, твоя магия поможет?
	AI_Output(self,other,"DIA_Vatras_Sarah_MagicHelp_05_01");	//Дитя мое, магия - это не фокусы, и она не решает всех проблем!
	AI_Output(self,other,"DIA_Vatras_Sarah_MagicHelp_05_02");	//Даже если бы я мог и захотел наложить достаточно могущественное заклятие, чтобы подчинить ее волю, то как только заклятие спадет, она вернется к своей привычке.
	AI_Output(self,other,"DIA_Vatras_Sarah_MagicHelp_05_03");	//Может стать даже хуже.
};

//===================================================
instance DIA_Vatras_Sarah_PotionHelp(C_Info)
{
	npc = VLK_439_Vatras;						nr = 23;
	condition = DIA_Vatras_Sarah_PotionHelp_Cond;
	information = DIA_Vatras_Sarah_PotionHelp_Info;
	description = "А как насчет алхимии?";
};
func int DIA_Vatras_Sarah_PotionHelp_Cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && Npc_KnowsInfo(other,DIA_Vatras_Sarah_NeedHelp)
		 && !Npc_KnowsInfo(other, DIA_Salandril_Sarah_AskSmokingCure)
	)	{
		return TRUE;
	};
};
func void DIA_Vatras_Sarah_PotionHelp_Info()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_PotionHelp_16_00");	//А как насчет алхимии? Может, есть такое зелье, чтобы ее тело очистилось от болотника?
	AI_Output(self,other,"DIA_Vatras_Sarah_PotionHelp_05_01");	//Возможно, такое зелье есть. Об этом тебе лучше поговорить с алхимиками.
	AI_Output(self,other,"DIA_Vatras_Sarah_PotionHelp_05_02");	//Я занимаюсь в основном духовным исцелением, мои познания во врачевании недостаточно глубоки.
	AI_Output(self,other,"DIA_Vatras_Sarah_PotionHelp_05_03");	//В любом случае, очищения тела будет недостаточно, если замутнен дух.
	MIS_Sarah_BadHabit_SearchPotion = TRUE;
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_VatrasPotion);
};
//===================================================
instance DIA_Vatras_Sarah_PrayAdanosForBerny(C_Info)
{
	npc = VLK_439_Vatras;						nr = 24;
	condition = DIA_Vatras_Sarah_PrayAdanosForBerny_Cond;
	information = DIA_Vatras_Sarah_PrayAdanosForBerny_Info;
	description = "Я хочу помолиться Аданосу за упокой души.";
};
func int DIA_Vatras_Sarah_PrayAdanosForBerny_Cond()
{
	if (C_HeroIs_Sarah()
		&& MIS_Sarah_OldFriends_BernyPray)	{
		return TRUE;
	};
};
func void DIA_Vatras_Sarah_PrayAdanosForBerny_Info()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_PrayAdanosForBerny_16_00");	//Я хочу помолиться Аданосу за упокой души.
	AI_Output(self,other,"DIA_Vatras_Sarah_PrayAdanosForBerny_05_01");	//Можешь ли ты подкрепить свою молитву пожертвованием?
	Info_ClearChoices(DIA_Vatras_Sarah_PrayAdanosForBerny);
	Info_AddChoice(DIA_Vatras_Sarah_PrayAdanosForBerny,"У меня нет золота.",DIA_Vatras_Sarah_PrayAdanosForBerny_NoGold);
	if (C_NpcHasGold(other,10))	{
		Info_AddChoice(DIA_Vatras_Sarah_PrayAdanosForBerny,"Я хочу пожертвовать 10 золотых.",DIA_Vatras_Sarah_PrayAdanosForBerny_Gold10);
	};
	if (C_NpcHasGold(other,20))	{
		Info_AddChoice(DIA_Vatras_Sarah_PrayAdanosForBerny,"Я хочу пожертвовать 20 золотых.",DIA_Vatras_Sarah_PrayAdanosForBerny_Gold20);
	};
	if (C_NpcHasGold(other,50))	{
		Info_AddChoice(DIA_Vatras_Sarah_PrayAdanosForBerny,"Я хочу пожертвовать 50 золотых.",DIA_Vatras_Sarah_PrayAdanosForBerny_Gold50);
	};
	if (C_NpcHasGold(other,100))	{
		Info_AddChoice(DIA_Vatras_Sarah_PrayAdanosForBerny,"Я хочу пожертвовать 100 золотых.",DIA_Vatras_Sarah_PrayAdanosForBerny_Gold100);
	};
};
func void DIA_Vatras_Sarah_PrayAdanosForBerny_Pray()
{
	Info_ClearChoices(DIA_Vatras_Sarah_PrayAdanosForBerny);
	AI_Output(self,other,"DIA_Vatras_Sarah_PrayAdanosForBerny_Pray_05_01");	//За кого ты хочешь помолиться?
		AI_Output(other,self,"DIA_Vatras_Sarah_PrayAdanosForBerny_Pray_16_02");	//За Берни, старика Берни из Портового квартала, упокоенного в пучине моря.
	AI_Output(self,other,"DIA_Vatras_Sarah_PrayAdanosForBerny_Pray_05_03");	//Почтим же память покинувшего нас Бернарда из Портового квартала.
	AI_Output(self,other,"DIA_Vatras_Sarah_PrayAdanosForBerny_Pray_05_04");	//Пусть море примет его тело и принесет Аданос мир его душе!
	AI_Output(other,self,"XXX");	//
	AI_PlayAni(other,"T_STAND_2_PRAY");
	AI_Wait(other,2);
	AI_Wait(self,2);
	AI_PlayAni(other,"T_PRAY_2_STAND");
	AI_Output(other,self,"XXX");	//
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_BernyPrayAdanos);
	MIS_Sarah_OldFriends_BernyPray = FALSE;
};
func void DIA_Vatras_Sarah_PrayAdanosForBerny_NoGold()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_PrayAdanosForBerny_NoGold_16_00");	//У меня нет золота.
	AI_Output(self,other,"DIA_Vatras_Sarah_PrayAdanosForBerny_NoGold_05_01");	//Не волнуйся, дитя мое, главное - чтобы молитва была искренней.
	DIA_Vatras_Sarah_PrayAdanosForBerny_Pray();
};
func void DIA_Vatras_Sarah_PrayAdanosForBerny_Gold10()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_PrayAdanosForBerny_Gold10_16_00");	//Я хочу пожертвовать 10 золотых.
	B_GiveGold(other,self,10);
	B_GivePlayerXP(10);
	DIA_Vatras_Sarah_PrayAdanosForBerny_Pray();
};
func void DIA_Vatras_Sarah_PrayAdanosForBerny_Gold20()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_PrayAdanosForBerny_Gold20_16_00");	//Я хочу пожертвовать 20 золотых.
	B_GiveGold(other,self,20);
	B_GivePlayerXP(20);
	DIA_Vatras_Sarah_PrayAdanosForBerny_Pray();
};
func void DIA_Vatras_Sarah_PrayAdanosForBerny_Gold50()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_PrayAdanosForBerny_Gold50_16_00");	//Я хочу пожертвовать 50 золотых.
	B_GiveGold(other,self,50);
	B_GivePlayerXP(50);
	DIA_Vatras_Sarah_PrayAdanosForBerny_Pray();
};
func void DIA_Vatras_Sarah_PrayAdanosForBerny_Gold100()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_PrayAdanosForBerny_Gold100_16_00");	//Я хочу пожертвовать 100 золотых.
	B_GiveGold(other,self,100);
	B_GivePlayerXP(100);
	DIA_Vatras_Sarah_PrayAdanosForBerny_Pray();
};

/////////////////////////////////////// ВСЕ /////////////////////////////////////////////
//===================================================
instance DIA_Vatras_HealMe(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 100;
	condition = DIA_NoCond_cond;
	information = DIA_Vatras_HEAL_Info;
	permanent = TRUE;
	description = "Ты можешь вылечить меня?";
};
func void DIA_Vatras_HEAL_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Vatras_HealMe_03_00");	//Ты можешь вылечить меня?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Vatras_HealMe_07_00");	//Ты можешь вылечить меня?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Vatras_HealMe_10_00");	//Ты можешь вылечить меня?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Vatras_HealMe_14_00");	//Ты можешь вылечить меня?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Vatras_HealMe_16_00");	//Ты можешь вылечить меня?
	};
	if (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])	{
		AI_Output(self,other,"DIA_Vatras_HealMe_05_01");	//(благочестиво) Аданос, благослови это тело. Освободи его от ран и вдохни в него силу новой жизни.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		AI_PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
	}
	else	if ((POISON_DrgTears_Timer == 0) && (POISON_Foggy_Timer == 0))	{
		AI_Output(self,other,"DIA_Vatras_HealMe_05_02");	//Сейчас ты не нуждаешься в магии исцеления.
	};
	if ((POISON_DrgTears_Timer > 0) || (POISON_Foggy_Timer > 0))	{
		AI_Output(self,other,"DIA_Vatras_HealMe_05_03");	//Похоже, твое тело отравлено ядом, который я не в силах исцелить.
		AI_Output(self,other,"DIA_Vatras_HealMe_05_04");	//Тебе нужно найти лекаря или алхимика, который лучше разбирается в ядах и противоядиях.
	};
};

// БЛАГОСЛОВЛЕНИЕ ===================================================
// + к мане или защите
var int DIA_Vatras_Donate_Day;
instance DIA_Vatras_Donate(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 101;
	condition = DIA_NoCond_cond;
	information = DIA_Vatras_Donate_Info;
	permanent = TRUE;
	description = "Я хочу сделать пожертвование Аданосу!";
};
func void DIA_Vatras_Donate_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Vatras_Donate_03_00");	//Я хочу сделать пожертвование Аданосу!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Vatras_Donate_07_00");	//Я хочу сделать пожертвование Аданосу!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Vatras_Donate_10_00");	//Я хочу сделать пожертвование Аданосу!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Vatras_Donate_14_00");	//Я хочу сделать пожертвование Аданосу!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Vatras_Donate_16_00");	//Я хочу сделать пожертвование Аданосу!
	};
	AI_Output(self,other,"DIA_Vatras_Donate_05_01");	//Твои деньги будут потрачены на благие цели.
	AI_Output(self,other,"DIA_Vatras_Donate_05_02");	//Сколько ты можешь пожертвовать?
	Info_ClearChoices(DIA_Vatras_Donate);
	Info_AddChoice(DIA_Vatras_Donate,"Сейчас мне нечего дать.",DIA_Vatras_Donate_BACK);
	if(Npc_HasItems(other,ItMi_Gold) >= 50)	{
		Info_AddChoice(DIA_Vatras_Donate,"Я могу дать 50 золотых монет.",DIA_Vatras_Donate_50);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 100)	{
		Info_AddChoice(DIA_Vatras_Donate,"У меня есть 100 золотых монет.",DIA_Vatras_Donate_100);
	};
};
func void DIA_Vatras_Donate_BACK()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Vatras_Donate_BACK_03_00");	//Сейчас мне нечего дать.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Vatras_Donate_BACK_07_00");	//Сейчас мне нечего дать.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Vatras_Donate_BACK_10_00");	//Сейчас мне нечего дать.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Vatras_Donate_BACK_14_00");	//Сейчас мне нечего дать.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Vatras_Donate_BACK_16_00");	//Сейчас мне нечего дать.
	};
	AI_Output(self,other,"DIA_Vatras_Donate_BACK_05_01");	//Ничего страшного. Веди праведную жизнь и возвращайся в любое время.
	Info_ClearChoices(DIA_Vatras_Donate);
};
func void DIA_Vatras_Donate_50()
{
	PrayCounter_Adanos += 1;
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Vatras_Donate50_03_00");	//Я могу дать 50 золотых монет.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Vatras_Donate50_07_00");	//Я могу дать 50 золотых монет.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Vatras_Donate50_10_00");	//Я могу дать 50 золотых монет.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Vatras_Donate50_14_00");	//Я могу дать 50 золотых монет.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Vatras_Donate50_16_00");	//Я могу дать 50 золотых монет.
	};
	AI_Output(self,other,"DIA_Vatras_Donate50_05_01");	//От имени Аданоса я благодарю тебя за этот дар.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	var int rnd;	rnd = C_Random(3);
	if (PATRONGOD == PATRONGOD_Adanos)	{
		if (rnd == 0)	{
			B_RaiseProtection(other,DAM_EDGE | DAM_POINT, 2);
		}
		else	if (rnd == 1)	{
			B_RaiseProtection(other,DAM_MAGIC | DAM_FIRE, 2);
		}
		else	{
			B_RaiseAttribute(other, ATR_MANA_MAX, 4);
		};
		B_GivePlayerXP(XP_Adanos50);
	}
	else	if (DIA_Vatras_Donate_Day <= Wld_GetDay())	{
		if (rnd == 0)	{
			B_RaiseProtection(other,DAM_EDGE | DAM_POINT, 1);
		}
		else	if (rnd == 1)	{
			B_RaiseProtection(other,DAM_MAGIC | DAM_FIRE, 1);
		}
		else	{
			B_RaiseAttribute(other, ATR_MANA_MAX, 2);
		};
		B_GivePlayerXP(XP_Adanos50);
	};
	DIA_Vatras_Donate_Day += 1;
	Info_ClearChoices(DIA_Vatras_Donate);
};

func void DIA_Vatras_Donate_100()
{
	PrayCounter_Adanos += 1;
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Vatras_Donate100_03_00");	//Я могу дать 100 золотых монет.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Vatras_Donate100_07_00");	//Я могу дать 100 золотых монет.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Vatras_Donate100_10_00");	//Я могу дать 100 золотых монет.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Vatras_Donate100_14_00");	//Я могу дать 100 золотых монет.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Vatras_Donate100_16_00");	//Я могу дать 100 золотых монет.
	};
	AI_Output(self,other,"DIA_Vatras_Donate100_05_01");	//Именем Аданоса я благославляю тебя за этот щедрый дар!
	B_GiveInvItems(other,self,ItMi_Gold,100);
	var int rnd;	rnd = C_Random(3);
	if (PATRONGOD == PATRONGOD_Adanos)	{
		if (rnd == 0)	{
			B_RaiseProtection(other,DAM_EDGE | DAM_POINT, 5);
		}
		else	if (rnd == 1)	{
			B_RaiseProtection(other,DAM_MAGIC | DAM_FIRE, 5);
		}
		else	{
			B_RaiseAttribute(other, ATR_MANA_MAX, 10);
		};
		B_GivePlayerXP(XP_Adanos100);
	}
	else	if (DIA_Vatras_Donate_Day <= Wld_GetDay())	{
		if (rnd == 0)	{
			B_RaiseProtection(other,DAM_EDGE | DAM_POINT, 3);
		}
		else	if (rnd == 1)	{
			B_RaiseProtection(other,DAM_MAGIC | DAM_FIRE, 3);
		}
		else	{
			B_RaiseAttribute(other, ATR_MANA_MAX, 5);
		};
		B_GivePlayerXP(XP_Adanos100);
	};
	DIA_Vatras_Donate_Day += 1;
	Info_ClearChoices(DIA_Vatras_Donate);
};

