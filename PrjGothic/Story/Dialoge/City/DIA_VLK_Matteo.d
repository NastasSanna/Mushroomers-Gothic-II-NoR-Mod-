
instance DIA_Matteo_EXIT(DIA_Proto_End)
{
	npc = VLK_416_Matteo;
};

/////////////////////////////////////// ЕЛЕНА ///////////////////////////////////////////

//===================================================
instance DIA_Matteo_Elena_HavePresent(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 10;
	condition = DIA_Matteo_Elena_HavePresent_Cond;
	information = DIA_Matteo_Elena_HavePresent_Info;
	description = "У тебя есть какой-нибудь подарок на годовщину свадьбы?";
};
func int DIA_Matteo_Elena_HavePresent_Cond()
{
	if (C_HeroIs_Elena()
		 && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Matteo_Elena_HavePresent_Info()
{
		AI_Output(other,self,"DIA_Matteo_Elena_HavePresent_16_00");	//У тебя есть какой-нибудь подарок на годовщину свадьбы?
	AI_Output(self,other,"DIA_Matteo_Elena_HavePresent_09_02");	//Как насчет ожерелья с крупной жемчужиной?
		AI_Output(other,self,"DIA_Matteo_Elena_HavePresent_16_02");	//Нет, это не то. Нужен подарок на двоих. Как они это ожерелье делить будут?
	AI_Output(self,other,"DIA_Matteo_Elena_HavePresent_09_03");	//Тогда, боюсь, у меня ничего подходящего нет.
	AI_Output(self,other,"DIA_Matteo_Elena_HavePresent_09_04");	//Попробуй поговорить с Лютеро из Верхнего квартала.
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_Matteo);
};


/////////////////////////////////////// РУПЕРТ ///////////////////////////////////////////
// ===================================================
instance DIA_Matteo_Debt_Rupert(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 20;
	condition = DIA_Matteo_Debt_Rupert_Cond;
	information = DIA_Matteo_Debt_Rupert_Info;
	description = "Я хочу вернуть долг (38 зол.)";
	permanent = TRUE;
};
func int DIA_Matteo_Debt_Rupert_Cond()
{
	if (C_HeroIs_Rupert() && !MIS_Rupert_Debts_Paid[Creditor_Matteo])	{
		return TRUE;
	};
};

func void DIA_Matteo_Debt_Rupert_Info()
{
	AI_Output(other,self,"DIA_Matteo_Debt_Rupert_03_00");	//Я хочу вернуть долг.
	if (B_GiveGold(other,self,38))	{
		AI_Output(self,other,"DIA_Matteo_Debt_Rupert_09_01");	//Так... Пять, десять, двадцать... Тридцать пять, семь, восемь.
		AI_Output(self,other,"DIA_Matteo_Debt_Rupert_09_02");	//Хорошо, твой долг погашен.
		AI_Output(self,other,"DIA_Matteo_Debt_Rupert_09_03");	//Теперь можешь купить у меня что-нибудь, конечно, если у тебя еще есть деньги.
		B_RupertPayDebt(Creditor_Matteo);
	}
	else	{
		AI_Output(self,other,"DIA_Matteo_Debt_Rupert_09_04");	//Тогда ты должен принести мне 38 золотых.
	};
};


//===================================================
instance DIA_Matteo_Hello(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 50;
	condition = DIA_Matteo_MR_Hello_Cond;
	information = DIA_Matteo_MR_Hello_Info;
	important = TRUE;
};
func int DIA_Matteo_MR_Hello_Cond()
{
	return TRUE;
};

func void DIA_Matteo_MR_Hello_Info()
{
	if (other.aivar[AIV_Gender] == FEMALE)	{
		AI_Output(self,other,"DIA_Matteo_MR_Hello_09_00");	//Добро пожаловать, милая барышня! Не желаете ли новое платье?
	}
	else	if (C_HeroIs_Erol())	{
		AI_Output(self,other,"DIA_Matteo_MR_Hello_09_02");	//Прошу, проходите, господин Эрол. Не желаете ли новый костюм?
	}
	else	if (C_HeroIs_Talbin())	{
		AI_Output(self,other,"DIA_Matteo_MR_Hello_09_03");	//Добро пожаловать, охотник. Боюсь, у меня нет более прочных доспехов, чем твои.
		AI_Output(self,other,"DIA_Matteo_MR_Hello_09_04");	//Но, возможно, тебе пригодится что-то еще.
	}
	else	if (C_HeroIs_Rupert())	{
		AI_Output(self,other,"DIA_Matteo_MR_Hello_09_05");	//Принес деньги? Ты задолжал 38 золотых. 
		AI_Output(self,other,"DIA_Matteo_MR_Hello_09_06");	//И не мечтай, что я что-то еще продам тебе в долг.
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Matteo_Sum);
	}
	else	{		
		AI_Output(self,other,"DIA_Matteo_MR_Hello_09_07");	//Добро пожаловать в мою лавку!
		AI_Output(self,other,"DIA_Matteo_MR_Hello_09_08");	//Здесь можно купить лучшую одежду и другие полезные товары.
		AI_Output(self,other,"DIA_Matteo_MR_Hello_09_09");	//У меня есть даже доспех из кожи снеппера.
	};
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Matteo);
};
//===================================================
instance DIA_Matteo_Trade(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 51;
	condition = DIA_Matteo_Trade_Cond;
	information = DIA_Matteo_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи свои товары.";
};
func int DIA_Matteo_Trade_Cond()
{
	if (!C_HeroIs_Rupert() || MIS_Rupert_Debts_Paid[Creditor_Matteo])	{
		return TRUE;
	};
};

func void DIA_Matteo_Trade_Info()
{
	B_GiveTradeInv_Matteo(self);
};
//===================================================
var int DIA_Matteo_Armor_Inst;
var int DIA_Matteo_Armor_Price;
var int DIA_Matteo_Armor_Prev;

//какие платья уже примеряли
var int Matteo_ClothWear_BAU_Bave_L;
var int Matteo_ClothWear_BAU_Bave_M;
var int Matteo_ClothWear_VLK_Bave_L;
var int Matteo_ClothWear_VLK_Bave_M;
var int Matteo_ClothWear_VLK_Bave_H;
//проверить, что игрок не выбросил одежду, пока примерял
func void DIA_Matteo_Armor_CheckDrop_Take(var C_ITEM itm)
{
	if (Hlp_GetInstanceID(itm) == DIA_Matteo_Armor_Inst)	{
		if (Npc_CanSeeItem(self,itm) || Npc_GetDistToItem(self,itm) < PERC_DIST_ACTIVE_MAX)	{
			AI_Output(self,other,"DIA_Matteo_Armor_Dropped_09_01");	//Зачем же бросать на пол?
			AI_StopLookAt(self);
			AI_GotoItem(self,itm);
			AI_TakeItem(self,itm);
			AI_TurnToNpc(self,other);
			AI_LookAtNpc(self,other);
		};
	};
};
func int DIA_Matteo_Armor_CheckDrop()
{
	//у ГГ есть в инвентаре эта одежда?
	if (Npc_HasItems(other, DIA_Matteo_Armor_Inst))	{
		//она на него надета?
		var int armor;	armor = Npc_GetArmor(other);
		if (!armor || armor != DIA_Matteo_Armor_Inst)	{
			AI_EquipArmor(other, DIA_Matteo_Armor_Inst);
		};
		return FALSE;
	}
	//нет одежды - куда дел?
	else	{
		if (DIA_Matteo_Armor_Inst == ITAR_BAU_L) {	DIA_Matteo_Armor_CheckDrop_Take(ITAR_BAU_L);	} else
		if (DIA_Matteo_Armor_Inst == ITAR_Bau_M) {	DIA_Matteo_Armor_CheckDrop_Take(ITAR_Bau_M);	} else
		if (DIA_Matteo_Armor_Inst == ITAR_Vlk_L) {	DIA_Matteo_Armor_CheckDrop_Take(ITAR_Vlk_L);	} else
		if (DIA_Matteo_Armor_Inst == ITAR_Vlk_M) {	DIA_Matteo_Armor_CheckDrop_Take(ITAR_Vlk_M);	} else
		if (DIA_Matteo_Armor_Inst == ITAR_Vlk_H) {	DIA_Matteo_Armor_CheckDrop_Take(ITAR_Vlk_H);	} else
		if (DIA_Matteo_Armor_Inst == ITAR_Governor) {	DIA_Matteo_Armor_CheckDrop_Take(ITAR_Governor);	} else
		if (DIA_Matteo_Armor_Inst == ITAR_Leather_L) {	DIA_Matteo_Armor_CheckDrop_Take(ITAR_Leather_L);	} else
		if (DIA_Matteo_Armor_Inst == ITAR_BauBabe_L) {	DIA_Matteo_Armor_CheckDrop_Take(ITAR_BauBabe_L);	} else
		if (DIA_Matteo_Armor_Inst == ITAR_BauBabe_M) {	DIA_Matteo_Armor_CheckDrop_Take(ITAR_BauBabe_M);	} else
		if (DIA_Matteo_Armor_Inst == ITAR_VlkBabe_L) {	DIA_Matteo_Armor_CheckDrop_Take(ITAR_VlkBabe_L);	} else
		if (DIA_Matteo_Armor_Inst == ITAR_VlkBabe_M) {	DIA_Matteo_Armor_CheckDrop_Take(ITAR_VlkBabe_M);	} else
		if (DIA_Matteo_Armor_Inst == ITAR_VlkBabe_H) {	DIA_Matteo_Armor_CheckDrop_Take(ITAR_VlkBabe_H);	};
		return TRUE;
	};
};
func void DIA_Matteo_Armor_Menu()
{
	Info_ClearChoices(DIA_Matteo_Armor);
	Info_AddChoice(DIA_Matteo_Armor,Dialog_Back, DIA_Matteo_Armor_Back);
	if (other.aivar[AIV_Gender] == FEMALE)	{
		Info_AddChoice(DIA_Matteo_Armor,"Крестьянское платье (защита от оружия и стрел 10)", DIA_Matteo_Armor_BAU_Babe_L);
		Info_AddChoice(DIA_Matteo_Armor,"Платье с ромашками (защита от оружия и стрел 15)", DIA_Matteo_Armor_BAU_Babe_M);
		Info_AddChoice(DIA_Matteo_Armor,"Синее платье (защита от оружия и стрел 10)", DIA_Matteo_Armor_VLK_Babe_L);
		Info_AddChoice(DIA_Matteo_Armor,"Белое платье (защита от оружия и стрел 10)", DIA_Matteo_Armor_VLK_Babe_M);
		Info_AddChoice(DIA_Matteo_Armor,"Черное платье (защита от оружия и стрел 10)", DIA_Matteo_Armor_VLK_Babe_H);
	}		
	else	{
		Info_AddChoice(DIA_Matteo_Armor,"Рабочая одежда (защита от оружия и стрел 15)", DIA_Matteo_Armor_Bau_L);
		Info_AddChoice(DIA_Matteo_Armor,"Одежда фермера (защита от оружия и стрел 15)", DIA_Matteo_Armor_BAU_M);
		Info_AddChoice(DIA_Matteo_Armor,"Простая городская одежда (защита от оружия и стрел 10)", DIA_Matteo_Armor_VLK_L);
		Info_AddChoice(DIA_Matteo_Armor,"Хорошая городская одежда (защита от оружия и стрел 10)", DIA_Matteo_Armor_VLK_M);
		Info_AddChoice(DIA_Matteo_Armor,"Добротный городской костюм (защита от оружия и стрел 10)", DIA_Matteo_Armor_VLK_H);
		Info_AddChoice(DIA_Matteo_Armor,"Роскошный дублет (защита от оружия и стрел 40)", DIA_Matteo_Armor_Governor);
		Info_AddChoice(DIA_Matteo_Armor,"Кожаная броня (защита от оружия 25, от стрел 20)", DIA_Matteo_Armor_Leather);
	};
	Info_AddChoice(DIA_Matteo_Armor,"А можно примерить?", DIA_Matteo_Armor_CanWear);
};
func void DIA_Matteo_Armor_ToDo()
{
	Info_ClearChoices(DIA_Matteo_Armor);
	Info_AddChoice(DIA_Matteo_Armor,Dialog_Back, DIA_Matteo_Armor_Menu);
	Info_AddChoice(DIA_Matteo_Armor,CS3("Купить (",IntToString(DIA_Matteo_Armor_Price)," зол.)"), DIA_Matteo_Armor_DoBuy);
	Info_AddChoice(DIA_Matteo_Armor,"Примерить", DIA_Matteo_Armor_Fit);

};
func void DIA_Matteo_Armor_Fit()
{
	if (Npc_HasEquippedArmor(other))	{
		var C_ITEM arm;	arm = Npc_GetEquippedArmor(other);
		DIA_Matteo_Armor_Prev = Hlp_GetInstanceID(arm);
	}
	else	{
		DIA_Matteo_Armor_Prev = 0;
	};
	if (DIA_Matteo_Armor_Prev != DIA_Matteo_Armor_Inst)
	{
		CreateInvItem(other,DIA_Matteo_Armor_Inst);
		AI_EquipArmor(other,DIA_Matteo_Armor_Inst);
	};
	AI_Output(other,self,"XXX");	//
	DiaCAM_Update();
	Info_ClearChoices(DIA_Matteo_Armor);
	Info_AddChoice(DIA_Matteo_Armor,"Посмотрели, и хватит.", DIA_Matteo_Armor_Uneqip);
	Info_AddChoice(DIA_Matteo_Armor,"Повернуться.", DIA_Matteo_Armor_Rotate);
};
func void DIA_Matteo_Armor_Rotate()
{
	if (DIA_Matteo_Armor_CheckDrop())	{
		Info_ClearChoices(DIA_Matteo_Armor);
		return;
	};
	AI_Output(other,self,"XXX");	//
	AI_TurnAway(other,self);
	AI_TurnToNpc(other,self);
	Info_AddChoice(DIA_Matteo_Armor,"Повернуться.", DIA_Matteo_Armor_Rotate);
	if (other.aivar[AIV_Gender] == FEMALE)	{
		var int rnd;	rnd = Hlp_Random(100);
		if (rnd < 15)	{
			AI_Output(self,self,"DIA_Matteo_Armor_Rotate_09_01");	//Этот цвет вам очень идет.
		}
		else	if (rnd < 30)	{
			AI_Output(self,self,"DIA_Matteo_Armor_Rotate_09_02");	//Это платье прекрасно сидит на вас.
		};
	};
};
func void DIA_Matteo_Armor_Uneqip()
{
	if (DIA_Matteo_Armor_CheckDrop())	{
		Info_ClearChoices(DIA_Matteo_Armor);
		return;
	};
	AI_UnequipArmor(other);
	if (DIA_Matteo_Armor_Prev != 0)
	{
		AI_EquipArmor(other,DIA_Matteo_Armor_Prev);
	};
	if (DIA_Matteo_Armor_Prev != DIA_Matteo_Armor_Inst)
	{
		if (Npc_HasItems(other,DIA_Matteo_Armor_Inst))	{
			Npc_RemoveInvItem(other,DIA_Matteo_Armor_Inst);
		}
		else	{
			
		};
	};
	DIA_Matteo_Armor_ToDo();
};
func void DIA_Matteo_Armor_DoBuy()
{
	if (Npc_HasItems(other,ItMi_Gold) >= DIA_Matteo_Armor_Price)	{
		B_GiveInvItems(self,other,DIA_Matteo_Armor_Inst,1);
		B_GiveInvItems(other,self,ItMi_Gold,DIA_Matteo_Armor_Price);
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_NoMoney_09_01");	//У вас недостаточно золота.
	};

	DIA_Matteo_Armor_Inst = 0;
	DIA_Matteo_Armor_Price = 0;
	DIA_Matteo_Armor_Prev = 0;
	Info_ClearChoices(DIA_Matteo_Armor);
	B_GiveAchievement_Fashionista();
};
func void DIA_Matteo_Armor_Choise(var int ArmorInst, var int price)
{
	DIA_Matteo_Armor_Inst = ArmorInst;
	DIA_Matteo_Armor_Price = price;
	if (THORBEN_Discount == TRUE)	{
		DIA_Matteo_Armor_Price = 9 * DIA_Matteo_Armor_Price / 10;
	};
	DIA_Matteo_Armor_ToDo();
};
func void DIA_Matteo_Armor_CanWear()
{
	if (hero.voice == 3)	{			//Одо/Руперт/
		AI_Output(other,self,"DIA_Matteo_Armor_CanWear_03_00");	//А можно примерить?
		AI_Output(self,other,"DIA_Matteo_Armor_CanWear_01_01");	//Да, пожалуйста, выбирай.
		AI_Output(self,other,"DIA_Matteo_Armor_CanWear_01_02");	//Только не порви.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Matteo_Armor_CanWear_07_00");	//Можно примерить?
		AI_Output(self,other,"DIA_Matteo_Armor_CanWear_01_01");	//Да, пожалуйста, выбирай.
		AI_Output(self,other,"DIA_Matteo_Armor_CanWear_01_02");	//Только не порви.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Matteo_Armor_CanWear_10_00");	//Могу я примерить?
		AI_Output(self,other,"DIA_Matteo_Armor_CanWear_01_03");	//Прошу, выбирайте.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Matteo_Armor_CanWear_14_00");	//А можно примерить?
		AI_Output(self,other,"DIA_Matteo_Armor_CanWear_01_01");	//Да, пожалуйста, выбирай.
		AI_Output(self,other,"DIA_Matteo_Armor_CanWear_01_02");	//Только не порви.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Matteo_Armor_CanWear_16_00");	//А можно примерить?
		AI_Output(self,other,"DIA_Matteo_Armor_CanWear_01_01");	//Да, пожалуйста, выбирай.
	};
};
//---------------------------------------
instance DIA_Matteo_Armor(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 52;
	condition = DIA_Matteo_Armor_Cond;
	information = DIA_Matteo_Armor_Info;
	permanent = TRUE;
	description = "Что у тебя есть из одежды?";
};
func int DIA_Matteo_Armor_Cond()
{
	if (other.aivar[AIV_Gender] == FEMALE)	{
		DIA_Matteo_Armor.description = "Покажи свои платья.";
	};
	if (!C_HeroIs_Rupert() || MIS_Rupert_Debts_Paid[Creditor_Matteo])	{
		return TRUE;
	};
};

func void DIA_Matteo_Armor_Info()
{
	DIA_Matteo_Armor_Menu();
};
//---------------------------------------
func void DIA_Matteo_Armor_Back()
{
	Info_ClearChoices(DIA_Matteo_Armor);
};
func void DIA_Matteo_Armor_Leather()
{
	DIA_Matteo_Armor_Choise(ITAR_Leather_L,VALUE_ITAR_Leather_L);
};
func void DIA_Matteo_Armor_Governor()
{
	DIA_Matteo_Armor_Choise(ITAR_Governor,VALUE_ITAR_Governor);
};
func void DIA_Matteo_Armor_VLK_H()
{
	DIA_Matteo_Armor_Choise(ITAR_Vlk_H,VALUE_ITAR_Vlk_H);
};
func void DIA_Matteo_Armor_VLK_M()
{
	DIA_Matteo_Armor_Choise(ITAR_Vlk_M,VALUE_ITAR_Vlk_M);
};
func void DIA_Matteo_Armor_VLK_L()
{
	DIA_Matteo_Armor_Choise(ITAR_Vlk_L,VALUE_ITAR_Vlk_L);
};
func void DIA_Matteo_Armor_BAU_M()
{
	DIA_Matteo_Armor_Choise(ITAR_BAU_M,VALUE_ITAR_BAU_M);
};
func void DIA_Matteo_Armor_BAU_L()
{
	DIA_Matteo_Armor_Choise(ITAR_BAU_L,VALUE_ITAR_BAU_L);
};

func void DIA_Matteo_Armor_BAU_Babe_L()
{
	if (!Matteo_ClothWear_BAU_Bave_L)	{
		Matteo_ClothWear_BAU_Bave_L = TRUE;
		Matteo_ClothWear_Counter += 1;
	};
	DIA_Matteo_Armor_Choise(ITAR_BauBabe_L,VALUE_ITAR_BauBabe_L);
};
func void DIA_Matteo_Armor_BAU_Babe_M()
{
	if (!Matteo_ClothWear_BAU_Bave_M)	{
		Matteo_ClothWear_BAU_Bave_M = TRUE;
		Matteo_ClothWear_Counter += 1;
	};
	DIA_Matteo_Armor_Choise(ITAR_BauBabe_M,VALUE_ITAR_BauBabe_M);
};
func void DIA_Matteo_Armor_VLK_Babe_L()
{
	if (!Matteo_ClothWear_VLK_Bave_L)	{
		Matteo_ClothWear_VLK_Bave_L = TRUE;
		Matteo_ClothWear_Counter += 1;
	};
	DIA_Matteo_Armor_Choise(ITAR_VlkBabe_L,VALUE_ITAR_VlkBabe_L);
};
func void DIA_Matteo_Armor_VLK_Babe_M()
{
	if (!Matteo_ClothWear_VLK_Bave_M)	{
		Matteo_ClothWear_VLK_Bave_M = TRUE;
		Matteo_ClothWear_Counter += 1;
	};
	DIA_Matteo_Armor_Choise(ITAR_VlkBabe_M,VALUE_ITAR_VlkBabe_M);
};
func void DIA_Matteo_Armor_VLK_Babe_H()
{
	if (!Matteo_ClothWear_VLK_Bave_H)	{
		Matteo_ClothWear_VLK_Bave_H = TRUE;
		Matteo_ClothWear_Counter += 1;
	};
	DIA_Matteo_Armor_Choise(ITAR_VlkBabe_H,VALUE_ITAR_VlkBabe_H);
};

//===================================================
instance DIA_Matteo_LeatherArmorBabe(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 53;
	condition = DIA_Matteo_LeatherArmorBabe_Cond;
	information = DIA_Matteo_LeatherArmorBabe_Info;
	description = "А нет ли чего попрочнее?";
};
func int DIA_Matteo_LeatherArmorBabe_Cond()
{
	if (other.aivar[AIV_Gender] == FEMALE)	{
		return TRUE;
	};
};

func void DIA_Matteo_LeatherArmorBabe_Info()
{
		AI_Output(other,self,"DIA_Matteo_LeatherArmorBabe_16_00");	//А нет ли чего попрочнее?
	AI_Output(self,other,"DIA_Matteo_LeatherArmorBabe_09_01");	//Женская броня? В наличии нет, но, думаю, я мог бы подогнать доспех из кожи снеппера...
		AI_Output(other,self,"DIA_Matteo_LeatherArmorBabe_16_02");	//До завтра управишься? Мне нужен срочно.
	AI_Output(self,other,"DIA_Matteo_LeatherArmorBabe_09_03");	//Разумеется. Это будет стоить 300 золотых.
	Info_ClearChoices(DIA_Matteo_LeatherArmorBabe);
	Info_AddChoice(DIA_Matteo_LeatherArmorBabe,"Слишком дорого.",DIA_Matteo_LeatherArmorBabe_NoGold);
	if (Npc_HasItems(other,ItMi_Gold) >= 300)
	{
		Info_AddChoice(DIA_Matteo_LeatherArmorBabe,"Хорошо, вот золото. (300 зол.)",DIA_Matteo_LeatherArmorBabe_DoBuy);
	};
};
func void DIA_Matteo_LeatherArmorBabe_NoGold()
{
		AI_Output(other,self,"DIA_Matteo_LeatherArmorBabe_NoGold_16_00");	//Слишком дорого.
	Info_ClearChoices(DIA_Matteo_LeatherArmorBabe);
};
func void DIA_Matteo_LeatherArmorBabe_DoBuy()
{
	if (THORBEN_Discount)	{
		B_GiveInvItems(other,self,ItMi_Gold,270);
	}
	else	{		
		B_GiveInvItems(other,self,ItMi_Gold,300);
	};
		AI_Output(other,self,"DIA_Matteo_LeatherArmorBabe_DoBuy_16_00");	//Вот золото.
	AI_Output(self,other,"DIA_Matteo_LeatherArmorBabe_09_DoBuy_01");	//Нужно только снять мерки...
		AI_Output(other,self,"DIA_Matteo_LeatherArmorBabe_DoBuy_16_02");	//Я и так знаю свой размер. Записывай.
	AI_Output(self,other,"DIA_Matteo_LeatherArmorBabe_09_DoBuy_03");	//К завтрашнему утру будет готово.
	AI_Output(self,other,"DIA_Matteo_LeatherArmorBabe_09_DoBuy_04");	//Не желаете пока взглянуть на другие товары?
	Matteo_LeatherArmorBabe_Day = Wld_GetDay() + 1;
	Info_ClearChoices(DIA_Matteo_LeatherArmorBabe);
};

//===================================================
instance DIA_Matteo_LeatherArmorBabeBuy(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 54;
	condition = DIA_Matteo_LeatherArmorBabeBuy_Cond;
	information = DIA_Matteo_LeatherArmorBabeBuy_Info;
	description = "Заказать женский кожаный доспех (300 зол.)";
};
func int DIA_Matteo_LeatherArmorBabeBuy_Cond()
{
	if (THORBEN_Discount)	{
		DIA_Matteo_LeatherArmorBabeBuy.description = "Заказать женский кожаный доспех (270 зол.)";
	};
	if ((other.aivar[AIV_Gender] == FEMALE) && Npc_KnowsInfo(other,DIA_Matteo_LeatherArmorBabe) && (Matteo_LeatherArmorBabe_Day == 0))	{
		return TRUE;
	};
};

func void DIA_Matteo_LeatherArmorBabeBuy_Info()
{
		AI_Output(other,self,"DIA_Matteo_LeatherArmorBabeBuy_16_00");	//Изготовь для меня этот кожаный доспех.
	if ((Npc_HasItems(other,ItMi_gold) >= 300) || (THORBEN_Discount && (Npc_HasItems(other,ItMi_gold) >= 270)))	{
		DIA_Matteo_LeatherArmorBabe_DoBuy();
	}
	else	{
		AI_Output(self,other,"DIA_Matteo_NoMoney_09_01");	//У вас недостаточно золота.
	};
};

//===================================================
instance DIA_Matteo_LeatherArmorBabeReady(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 55;
	condition = DIA_Matteo_LeatherArmorBabeReady_Cond;
	information = DIA_Matteo_LeatherArmorBabeReady_Info;
	permanent = TRUE;
	description = "Доспех готов?";
};
func int DIA_Matteo_LeatherArmorBabeReady_Cond()
{
	if ((other.aivar[AIV_Gender] == FEMALE) && (Matteo_LeatherArmorBabe_Day > 0)
		&& (Matteo_LeatherArmorGiven == FALSE))	{
		return TRUE;
	};
};

func void DIA_Matteo_LeatherArmorBabeReady_Info()
{
		AI_Output(other,self,"DIA_Matteo_LeatherArmorBabeReady_16_00");	//Доспех готов?
	if ((Wld_GetDay() > Matteo_LeatherArmorBabe_Day) || ((Wld_GetDay() == Matteo_LeatherArmorBabe_Day) && (Wld_IsTime(8,0,0,0))))	{
		AI_Output(self,other,"DIA_Matteo_LeatherArmorReady_09_01");	//Да, все готово. Прошу примерить.
		B_GiveInvItems(self,other,ITAR_Leather_Baby,1);
		AI_EquipArmor(other,ITAR_Leather_Baby);
		AI_Output(other,self,"DIA_Matteo_LeatherArmorBabeReady_16_02");	//Сидит, как влитой! Спасибо.
		AI_Output(self,other,"DIA_Matteo_LeatherArmorReady_09_03");	//Рад услужить.
		Matteo_LeatherArmorGiven = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Matteo_LeatherArmorReady_09_04");	//Еще нет. Утром будет готово.
	};
};

//===================================================
instance DIA_Matteo_ThorbenDiscount(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 60;
	condition = DIA_Matteo_ThorbenDiscount_Cond;
	information = DIA_Matteo_ThorbenDiscount_Info;
	important = TRUE;
};
func int DIA_Matteo_ThorbenDiscount_Cond()
{
	if (Npc_IsInState(self,ZS_Talk) && (THORBEN_Discount == TRUE) &&
		(!C_HeroIs_Rupert() || MIS_Rupert_Debts_Paid[Creditor_Matteo]))
	{
		return TRUE;
	};
};
func void DIA_Matteo_ThorbenDiscount_Info()
{
	AI_Output(self,other,"DIA_Matteo_ThorbenDiscount_09_00");	//Мастер Торбен сказал, что вы заслуживаете небольшого поощрения.
	AI_Output(self,other,"DIA_Matteo_ThorbenDiscount_09_01");	//Поэтому я продам вам любую одежду с небольшой скидкой.
};

