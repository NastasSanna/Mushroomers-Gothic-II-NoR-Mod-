
instance DIA_Orlan_EXIT(DIA_Proto_End)
{
	npc = OUT_1202_Orlan;
};

/////////////////////////////////////// ЭРОЛ /////////////////////////////////////////////

//===================================================
instance DIA_Orlan_Start_Erol(C_Info)
{
	npc = OUT_1202_Orlan;
	nr = 1;
	condition = DIA_Orlan_Start_Erol_Cond;
	information = DIA_Orlan_Start_Erol_Info;
	important = TRUE;
};
func int DIA_Orlan_Start_Erol_Cond()
{
	if (C_HeroIs_Erol())	{
		return TRUE;
	};
};
func void DIA_Orlan_Start_Erol_Info()
{
		AI_Output(other,self,"DIA_Orlan_Start_Erol_10_00");	//...Константино и раньше покупал у меня грибы, но теперь ему, похоже, этого мало. Он объявил “конкурс”, хе!
	AI_Output(self,other,"DIA_Orlan_Start_Erol_05_01");	//Вот как?
		AI_Output(other,self,"DIA_Orlan_Start_Erol_10_02");	//Конкурс, или нет, но он обещал платить за грибы вдвое обычного в течение недели. И даже выдать какой-то приз победителю.
		AI_Output(other,self,"DIA_Orlan_Start_Erol_10_03");	//Вот я и подумал, почему бы мне не размять кости, не пройтись по лесу.
		AI_Output(other,self,"DIA_Orlan_Start_Erol_10_04");	//Торговля сейчас все равно притихла, а этот остров я знаю, как свои пять пальцев.
	//выпивает
	CreateInvItem(other,ItFo_Addon_Grog);
	AI_UseItem(other,ItFo_Addon_Grog);
		AI_Output(other,self,"DIA_Orlan_Start_Erol_10_05");	//Спасибо за грог! Но мне, пожалуй, пора.
	AI_Output(self,other,"DIA_Orlan_Start_Erol_05_06");	//Заходи. Расскажешь, что там за приз.
	START_DIA_Finished = TRUE;
	AI_StopProcessInfos(self);
};


//===================================================
instance DIA_Orlan_MoreGrog_Erol(C_Info)
{
	npc = OUT_1202_Orlan;
	nr = 2;
	condition = DIA_Orlan_MoreGrog_Erol_Cond;
	information = DIA_Orlan_MoreGrog_Erol_Info;
	important = TRUE;
};
func int DIA_Orlan_MoreGrog_Erol_Cond()
{
	if (C_HeroIs_Erol() && Npc_IsInState(self,ZS_Talk)
		&& Npc_KnowsInfo(other,DIA_Orlan_Start_Erol))	{
		return TRUE;
	};
};
func void DIA_Orlan_MoreGrog_Erol_Info()
{
	AI_Output(self,other,"DIA_Orlan_MoreGrog_Erol_05_00");	//Еще грога?
	Info_ClearChoices(DIA_Orlan_MoreGrog_Erol);
	Info_AddChoice(DIA_Orlan_MoreGrog_Erol,"Нет, не сейчас.",DIA_Orlan_MoreGrog_Erol_No);
	Info_AddChoice(DIA_Orlan_MoreGrog_Erol,"Да, давай (10 зол.).",DIA_Orlan_MoreGrog_Erol_Yes);
};
func void DIA_Orlan_MoreGrog_Erol_Yes()
{
	AI_Output(other,self,"DIA_Orlan_MoreGrog_Erol_Yes_10_00");	//Да, давай.
	if (Npc_HasItems(other,ItMi_Gold) >= Value_Grog)	{
		AI_Output(self,other,"DIA_Orlan_MoreGrog_Erol_Yes_05_01");	//Держи бутылку.
		B_GiveInvItems(other,self,ItMi_Gold,Value_Grog);
	}
	else	{
		AI_Output(self,other,"DIA_Orlan_MoreGrog_Erol_Yes_05_02");	//Что? Неужели я вижу торговца Эрола без пригоршни золотых в кармане?
		AI_Output(self,other,"DIA_Orlan_MoreGrog_Erol_Yes_05_03");	//Это нужно отметить. Держи бутылку.
		AI_Output(self,other,"DIA_Orlan_MoreGrog_Erol_Yes_05_04");	//За удачу!
		CreateInvItem(self,ItFo_Addon_Grog);
		AI_UseItem(self,ItFo_Addon_Grog);
	};
	B_GiveInvItems(self,other,ItFo_Addon_Grog,1);
	AI_UseItem(other,DIA_Orlan_MoreGrog_Erol);
	Info_ClearChoices(DIA_Orlan_MoreGrog_Erol);
};
func void DIA_Orlan_MoreGrog_Erol_No()
{
	AI_Output(other,self,"DIA_Orlan_MoreGrog_Erol_No_10_00");	//Нет, не сейчас.
	Info_ClearChoices(DIA_Orlan_MoreGrog_Erol);
};
//===================================================
instance DIA_Orlan_Erol_Final(C_Info)
{
	npc = OUT_1202_Orlan;
	nr = 3;
	condition = DIA_Orlan_Erol_Final_Condition;
	information = DIA_Orlan_Erol_Final_Info;
	description = "Я выиграл конкурс Константино.";
};
func int DIA_Orlan_Erol_Final_Condition()
{
	if ((C_HeroIs_Erol()) && (Competition_Result != Competition_Result_NONE))	{
		if (Competition_Result == Competition_Result_LOST)	{
			DIA_Orlan_Erol_Final.description = "Представляешь, меня обскакали на этом грибном конкурсе.";
		};
		return TRUE;
	};
};
func void DIA_Orlan_Erol_Final_Info()
{
	if (Competition_Result == Competition_Result_WON)	{
			AI_Output(other,self,"DIA_Orlan_Erol_Final_WON_10_00");	//Налей-ка за победу! Я выиграл конкурс Константино.
		AI_Output(self,other,"DIA_Orlan_Erol_Final_05_WON_01");	//Это надо отметить.
		B_GiveInvItems(other,self,ItMi_Gold,Value_Grog);
		CreateInvItem(self,ItFo_Addon_Grog);
		AI_UseItem(other,ItFo_Addon_Grog);
		AI_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_Orlan_Erol_Final_WON_05_02");	//Так что там за приз?
			AI_Output(other,self,"DIA_Orlan_Erol_Final_WON_10_03");	//Лучший подарок - книга! (смеется)
			AI_Output(other,self,"DIA_Orlan_Erol_Final_WON_10_04");	//Константино составил подробный иллюстрированный справочник по грибам Хориниса.
			if (Competition_Bonus > 0)	{
				AI_Output(other,self,"DIA_Orlan_Erol_Final_WON_10_05");	//Но, представляешь, мне удалось найти грибы, про которые он даже не слышал.
			};
	}
	else	{
			AI_Output(other,self,"DIA_Orlan_Erol_Final_LOST_10_01");	//Представляешь, меня обскакали на этом грибном конкурсе. Старею, что ли...
		AI_Output(self,other,"DIA_Orlan_Erol_Final_LOST_05_02");	//Да ладно, тебе просто не повезло.
	};
	if(Npc_HasItems(other,ItMi_Gold) > 100)	{
			AI_Output(other,self,"DIA_Orlan_Erol_Final_10_01");	//Так или иначе, я неплохо подзаработал.
	};
};

////////////////////////////////// ВСЕ ////////////////////////////////////////////

// ТОРГОВЛЯ ==========================================
var int DIA_Orlan_Trade_Once;
instance DIA_Orlan_Trade(C_Info)
{
	npc = OUT_1202_Orlan;
	nr = 50;
	condition = DIA_NoCond_cond;
	information = DIA_Orlan_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи, что у тебя есть.";
};
func void DIA_Orlan_Trade_Info()
{
	if (DIA_Orlan_Trade_Once == FALSE)	{
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Orlan);
		DIA_Orlan_Trade_Once = TRUE;
	};
	B_GiveTradeInv_Orlan(self);
};
// НОЧЛЕГ ==========================================
var int DIA_Orlan_Room_Once;
instance DIA_Orlan_Room(C_Info)
{
	npc = OUT_1202_Orlan;
	nr = 51;
	condition = DIA_Orlan_Room_Cond;
	information = DIA_Orlan_Room_Info;
	permanent = TRUE;
	description = "Я хочу снять комнату.";
};
func int DIA_Orlan_Room_Cond()
{
	if (!C_HeroIs_Erol() && (Orlan_Room_Got == FALSE))	{
		return TRUE;
	};
};

func void DIA_Orlan_Room_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Orlan_Room_03_00");	//Я хочу снять комнату.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Orlan_Room_07_00");	//Я хочу снять комнату.
	//} else if (hero.voice == 10)	{	//Эрол
	//	AI_Output(other,self,"DIA_Orlan_Room_10_00");	//Я хочу снять комнату.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Orlan_Room_14_00");	//Я хочу снять комнату.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Orlan_Room_16_00");	//Я хочу снять комнату.
	};
	AI_Output(self,other,"DIA_Orlan_Room_05_01");	//50 золотых за неделю.
	if (!DIA_Orlan_Room_Once)	{
		B_LogNote(TOPIC_Sleep,TOPIC_Sleep_OrlanPrice);
		DIA_Orlan_Room_Once = 1;
	};
	Info_ClearChoices(DIA_Orlan_Room);
	Info_AddChoice(DIA_Orlan_Room,"Слишком дорого.",DIA_Orlan_Room_No);
	if (C_NpcHasGold(other,50))	{
		Info_AddChoice(DIA_Orlan_Room,"(заплатить 50 зол.).",DIA_Orlan_Room_Yes);
	};
};
func void DIA_Orlan_Room_Yes()
{
	B_GiveInvItems(other,self,ItMi_Gold,50);
	if (other.aivar[AIV_Gender] == MALE)	{
		B_GiveInvItems(self,other,ITKE_ORLAN_HOTELZIMMER,1);
	}
	else	{
		B_GiveInvItems(self,other,ITKE_ORLAN_HOTELZIMMER_02,1);
	};
	AI_Output(self,other,"DIA_Orlan_Room_Yes_05_01");	//Вот ключ.
	Orlan_Room_Got = TRUE;
	B_LogNote(TOPIC_Sleep,TOPIC_Sleep_Orlan);
	Info_ClearChoices(DIA_Orlan_Room);
};
func void DIA_Orlan_Room_No()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Orlan_Room_No_03_00");	//Слишком дорого.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Orlan_Room_No_07_00");	//Слишком дорого.
	//} else if (hero.voice == 10)	{	//Эрол
	//	AI_Output(other,self,"DIA_Orlan_Room_No_10_00");	//Слишком дорого.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Orlan_Room_No_14_00");	//Слишком дорого.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Orlan_Room_No_16_00");	//Слишком дорого.
	};
	Info_ClearChoices(DIA_Orlan_Room);
};
