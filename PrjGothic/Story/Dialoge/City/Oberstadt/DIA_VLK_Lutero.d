
instance DIA_Lutero_EXIT(DIA_Proto_End)
{
	npc = VLK_404_Lutero;
};

/////////////////////////////////////// ЕЛЕНА ///////////////////////////////////////////

//===================================================
instance DIA_Lutero_Elena_HavePresent(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 11;
	condition = DIA_Lutero_Elena_HavePresent_Cond;
	information = DIA_Lutero_Elena_HavePresent_Info;
	description = "А у тебя есть что-нибудь особенное?";
};
func int DIA_Lutero_Elena_HavePresent_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_KnowsInfo(other,DIA_Lutero_MR_Hello)
		 && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Lutero_Elena_HavePresent_Info()
{
		AI_Output(other,self,"DIA_Lutero_Elena_HavePresent_16_00");	//А у тебя есть что-нибудь особенное?
		AI_Output(other,self,"DIA_Lutero_Elena_HavePresent_16_01");	//Я ищу подарок родителям на годовщину свадьбы.
	AI_Output(self,other,"DIA_Lutero_Elena_HavePresent_13_02");	//У меня есть кое-что, что должно тебя заинтересовать.
	AI_Output(self,other,"DIA_Lutero_Elena_HavePresent_13_03");	//Взгляни, это кубок Верности. Символизирует прочность семейных уз.
	AI_Output(self,other,"DIA_Lutero_Elena_HavePresent_13_04");	//Вообще-то, их должно быть два, для мужа и жены. Но у меня есть только один из пары.
	AI_Output(self,other,"DIA_Lutero_Elena_HavePresent_13_05");	//Этот кубок я с удовольствием продам тебе за 350 золотых.
	B_LogEntry_Elena_Present(TOPIC_Elena_Present_CupLutero);
};

//===================================================
instance DIA_Lutero_Elena_BuyCup(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 12;
	condition = DIA_Lutero_Elena_BuyCup_Cond;
	information = DIA_Lutero_Elena_BuyCup_Info;
	description = "Я хочу купить кубок Верности. (350 зол.)";
	permanent = TRUE;
};
func int DIA_Lutero_Elena_BuyCup_Cond()
{
	if (C_HeroIs_Elena()
		&& Npc_KnowsInfo(other,DIA_Lutero_Elena_HavePresent)
		&& !MIS_Elena_Present_CupLuteroGot && (MIS_Elena_Present == LOG_Running))
	{
		return TRUE;
	};
};
var int DIA_Lutero_Elena_BuyCup_NoMoneyOnce;
func void DIA_Lutero_Elena_BuyCup_Info()
{
	AI_Output(other,self,"DIA_Lutero_Elena_BuyCup_16_00");	//Я хочу купить кубок Верности.
	if (C_NpcHasGold(other, 350))	{
		B_GiveInvItems(other,self,ItMi_Gold,350);
		AI_Output(self,other,"DIA_Lutero_Elena_BuyCup_13_01");	//Пожалуйста. Передавай мои поздравления родителям.
		B_GiveInvItems(self,other,ItMi_FaithfulnessCup_01,1);
		B_GivePlayerXP(XP_Elena_CupLuteroGot);
		B_LogEntry_Elena_CupGot(TOPIC_Elena_Present_CupLuteroGot);
		MIS_Elena_Present_CupLuteroGot = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Lutero_Elena_BuyCup_13_02");	//Тогда принеси 350 золотых.
		if (!DIA_Lutero_Elena_BuyCup_NoMoneyOnce || (Hlp_Random(100) < 30))	{
			AI_Output(self,other,"DIA_Lutero_Elena_BuyCup_13_03");	//Это исключительно редкая вещь, и я не делаю скидок.
			DIA_Lutero_Elena_BuyCup_NoMoneyOnce = TRUE;
		};
	};
};

//===================================================
instance DIA_Lutero_Elena_CupTooExpensive(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 13;
	condition = DIA_Lutero_Elena_CupTooExpensive_Cond;
	information = DIA_Lutero_Elena_CupTooExpensive_Info;
	description = "Ты просишь за кубок слишком много!";
};
func int DIA_Lutero_Elena_CupTooExpensive_Cond()
{
	if (C_HeroIs_Elena()
		&& Npc_KnowsInfo(other,DIA_Lutero_Elena_HavePresent)
		&& !MIS_Elena_Present_CupLuteroGot && (MIS_Elena_Present == LOG_Running))
	{
		return TRUE;
	};
};
func void DIA_Lutero_Elena_CupTooExpensive_Info()
{
		AI_Output(other,self,"DIA_Lutero_Elena_CupTooExpensive_16_00");	//Ты просишь за кубок слишком много!
	AI_Output(self,other,"DIA_Lutero_Elena_CupTooExpensive_13_01");	//Я не делаю скидок. Это и так немного за такой ценный предмет!
	AI_Output(self,other,"DIA_Lutero_Elena_CupTooExpensive_13_02");	//Хотя... Если хочешь, я обменяю этот кубок на шкуру мракориса.
	AI_Output(self,other,"DIA_Lutero_Elena_CupTooExpensive_13_03");	//Давно хотел заполучить такую.
		AI_Output(other,self,"DIA_Lutero_Elena_CupTooExpensive_16_04");	//Мракорис? Хорошо, я подумаю.
	MIS_Elena_Present_LuteroAskedFur = TRUE;
	B_LogEntry(TOPIC_Elena_Present, TOPIC_Elena_Present_CupLuteroFur);
};

//===================================================
instance DIA_Lutero_Elena_GiveFur(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 14;
	condition = DIA_Lutero_Elena_GiveFur_Cond;
	information = DIA_Lutero_Elena_GiveFur_Info;
	description = "Я принесла шкуру мракориса, как мы и договаривались.";
};
func int DIA_Lutero_Elena_GiveFur_Cond()
{
	if (C_HeroIs_Elena()
		&& MIS_Elena_Present_LuteroAskedFur
		&& Npc_HasItems(other,ItAt_ShadowFur) 
		&& !MIS_Elena_Present_CupLuteroGot && (MIS_Elena_Present == LOG_Running))
	{
		return TRUE;
	};
};
func void DIA_Lutero_Elena_GiveFur_Info()
{
		AI_Output(other,self,"DIA_Lutero_Elena_GiveFur_16_00");	//Я принесла шкуру мракориса, как мы и договаривались.
	B_GiveInvItems(other,self,ItAt_ShadowFur,1);
	AI_Output(self,other,"DIA_Lutero_Elena_GiveFur_13_01");	//Хорошо. Вот твой кубок.
		B_GivePlayerXP(XP_Elena_CupLuteroGot);
	B_GiveInvItems(self,other,ItMi_FaithfulnessCup_01,1);
	B_LogEntry_Elena_CupGot(TOPIC_Elena_Present_CupLuteroGot);
	MIS_Elena_Present_CupLuteroGot = TRUE;
};

//===================================================
instance DIA_Lutero_Elena_Where2Cup(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 15;
	condition = DIA_Lutero_Elena_Where2Cup_Cond;
	information = DIA_Lutero_Elena_Where2Cup_Info;
	description = "А у кого может быть второй кубок?";
};
func int DIA_Lutero_Elena_Where2Cup_Cond()
{
	if (C_HeroIs_Elena()
		&& Npc_KnowsInfo(other,DIA_Lutero_Elena_HavePresent))	{
		return TRUE;
	};
};
func void DIA_Lutero_Elena_Where2Cup_Info()
{
		AI_Output(other,self,"DIA_Lutero_Elena_Where2Cup_16_00");	//А у кого может быть второй кубок?
	AI_Output(self,other,"DIA_Lutero_Elena_Where2Cup_13_01");	//Когда-то я получил его от ростовщика Лемара...
	AI_Output(self,other,"DIA_Lutero_Elena_Where2Cup_13_02");	//Тогда он был одним из богатейших людей в Верхнем квартале, а теперь прозябает в грязной лачуге в Портовом районе.
	AI_Output(self,other,"DIA_Lutero_Elena_Where2Cup_13_03");	//Думаю, второй кубок все еще у него.
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_Lehmar);
	MIS_Elena_Present_KnowsLehmar = TRUE;
};



/////////////////////////////////////// ТАЛБИН ///////////////////////////////////////////

//===================================================
instance DIA_Lutero_Talbin_Tusk(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 21;
	condition = DIA_Lutero_Talbin_Tusk_Cond;
	information = DIA_Lutero_Talbin_Tusk_Info;
	description = "Хочешь купить кабаньи клыки?";
};
func int DIA_Lutero_Talbin_Tusk_Cond()
{
	if (C_HeroIs_Talbin()
		 && Npc_KnowsInfo(other,DIA_Lutero_MR_Hello)
		 && (Npc_HasItems(other,ItAt_KeilerHogTusk) || Npc_HasItems(other,ItAt_KeilerHogTuskBig) || Npc_HasItems(other,ItAt_KeilerTusk)))	{
		return TRUE;
	};
};
func void DIA_Lutero_Talbin_Tusk_Info()
{
		AI_Output(other,self,"DIA_Lutero_Talbin_Tusk_07_00");	//Хочешь купить кабаньи клыки?
	AI_Output(self,other,"DIA_Lutero_Talbin_Tusk_13_01");	//Клыки? Хмм...
	AI_Output(self,other,"DIA_Lutero_Talbin_Tusk_13_02");	//У меня уже есть несколько пар, но если ты можешь предложить мне хороший экземпляр, я с радостью куплю их.
	AI_Output(self,other,"DIA_Lutero_Talbin_Tusk_13_03");	//Клыки должны быть не меньше трех с половиной пальцев в длину.
	B_LogEntry(TOPIC_Talbin_Hunt,TOPIC_Talbin_Hunt_KeilsLutero);
};

//===================================================
instance DIA_Lutero_Talbin_TuskBig(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 22;
	condition = DIA_Lutero_Talbin_TuskBig_Cond;
	information = DIA_Lutero_Talbin_TuskBig_Info;
	description = "Взгляни, какие клыки!";
};
func int DIA_Lutero_Talbin_TuskBig_Cond()
{
	if (C_HeroIs_Talbin()
		 && Npc_KnowsInfo(other,DIA_Lutero_Talbin_Tusk)
		 && (Npc_HasItems(other,ItAt_KeilerHogTuskBig)))	{
		return TRUE;
	};
};
func void DIA_Lutero_Talbin_TuskBig_Info()
{
		AI_Output(other,self,"DIA_Lutero_Talbin_TuskBig_07_00");	//Взгляни, какие клыки! Таких у тебя точно нет.
	AI_Output(self,other,"DIA_Lutero_Talbin_TuskBig_13_01");	//Покажи-ка... Даа, дайствительно длинные!
		AI_Output(other,self,"DIA_Lutero_Talbin_TuskBig_07_02");	//Да тут не меньше четырех пальцев в каждом!
	AI_Output(self,other,"DIA_Lutero_Talbin_TuskBig_13_03");	//(задумчиво измеряет) Пожалуй...
		AI_Output(other,self,"DIA_Lutero_Talbin_TuskBig_07_04");	//Так чего ты тянешь? Бери, как договаривались.
	AI_Output(self,other,"DIA_Lutero_Talbin_TuskBig_13_05");	//Нет, так не годится. У всех моих клыков есть сертификаты, официально подтверждающие их длину!
	AI_Output(self,other,"DIA_Lutero_Talbin_TuskBig_13_06");	//Без сертификата не куплю.
		AI_Output(other,self,"DIA_Lutero_Talbin_TuskBig_07_07");	//И где я возьму этот сертификат?
	AI_Output(self,other,"DIA_Lutero_Talbin_TuskBig_13_08");	//У мастера Боспера есть инструменты для измерения. И я доверяю его слову.
	B_LogEntry(TOPIC_Talbin_Hunt,TOPIC_Talbin_Hunt_KeilsMeasure);
};

//===================================================
instance DIA_Lutero_Talbin_CertificateGot(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 23;
	condition = DIA_Lutero_Talbin_CertificateGot_Cond;
	information = DIA_Lutero_Talbin_CertificateGot_Info;
	description = "Вот клыки и вот твой сертификат.";
};
func int DIA_Lutero_Talbin_CertificateGot_Cond()
{
	if (C_HeroIs_Talbin()
		 && Npc_KnowsInfo(other,DIA_Lutero_Talbin_TuskBig)
		 && (Npc_HasItems(other,ItAt_KeilerHogTuskBig))
		 && (Npc_HasItems(other,ItWr_TuskCertificate)))	{
		return TRUE;
	};
};
func void DIA_Lutero_Talbin_CertificateGot_Info()
{
	//B_GiveInvItems(other,self,ItAt_KeilerHogTuskBig,1);
	//B_GiveInvItems(other,self,ItWr_TuskCertificate,1);
	ItemTrans_items[0] = ItAt_KeilerHogTuskBig;
	ItemTrans_amount[0] = 1;
	ItemTrans_items[1] = ItWr_TuskCertificate;
	ItemTrans_amount[1] = 1;
	B_ItemsTransaction(other,self);
		AI_Output(other,self,"DIA_Lutero_Talbin_CertificateGot_07_00");	//Вот клыки и вот твой сертификат.
	AI_Output(self,other,"DIA_Lutero_Talbin_CertificateGot_13_01");	//Четыре и одна десятая пальца! Это действительно...
	AI_Output(self,other,"DIA_Lutero_Talbin_CertificateGot_13_02");	//Вот, возьми 500 золотых. Эти клыки того стоят.
	B_GiveGold(self,other,500);
	MIS_Talbin_Hunt_KeilerSold = TRUE;
	B_LogEntry_Talbin_Hunt(TOPIC_Talbin_Hunt_KeilsSoldLutero);
	B_GivePlayerXP(XP_Talbin_Hunt_KeilsSold);
};

/////////////////////////////////////// ВСЕ /////////////////////////////////////////////
// ==============================================

instance DIA_Lutero_MR_Hello(C_INFO)
{
	nr = 1;
	npc = VLK_404_Lutero;
	condition = DIA_WhenAsked_cond;
	information = DIA_Lutero_MR_MR_Hello_info;
	important = TRUE;
};
func void DIA_Lutero_MR_MR_Hello_info()
{
	if (C_HeroIs_Erol())	{
		AI_Output(self,other,"DIA_Lutero_MR_MR_Hello_13_00");	//Приветствую, Эрол! Надумал купить у меня какую-нибудь редкость?
			AI_Output(other,self,"DIA_Lutero_MR_MR_Hello_10_01");	//Может быть, может быть.
	}
	else	{
		AI_Output(self,other,"DIA_Lutero_MR_MR_Hello_13_02");	//Если у тебя есть деньги, советую потратить их на мои товары.
		AI_Output(self,other,"DIA_Lutero_MR_MR_Hello_13_03");	//Это исключительно ценные и редкие вещи.
	};
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Lutero);
};

// ==============================================

instance DIA_Lutero_MRTrade(C_INFO)
{
	nr = 50;
	npc = VLK_404_Lutero;
	condition = DIA_Lutero_MRTrade_cond;
	information = DIA_Lutero_MRTrade_info;
	description = "Покажи свои товары.";
	permanent = TRUE;
	trade = TRUE;
};
func int DIA_Lutero_MRTrade_cond()
{
	if (Npc_KnowsInfo(other,DIA_Lutero_MR_Hello))	{
		return TRUE;
	};
};
func void DIA_Lutero_MRTrade_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Lutero_MRTrade_03_00");	//Покажи свои товары.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Lutero_MRTrade_07_00");	//Покажи свои товары.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Lutero_MRTrade_10_00");	//Покажи свои товары.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Lutero_MRTrade_14_00");	//Покажи свои товары.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Lutero_MRTrade_16_00");	//Покажи свои товары.
	};
	B_GiveTradeInv_Lutero(self);
};
