
instance DIA_Richter_EXIT(DIA_Proto_End)
{
	npc = Vlk_402_Richter;
};

//================================================
instance DIA_Richter_Hello(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 1;
	condition = DIA_Richter_MR_Hello_cond;
	information = DIA_Richter_MR_Hello_Info;
	important = TRUE;
};
func int DIA_Richter_MR_Hello_Cond()
{
	if (DIA_WhenAsked_cond() && (HERO_Imprisoned != HERO_Imprisoned_City))
	{
		return TRUE;
	};
};
func void DIA_Richter_MR_Hello_Info()
{
	AI_Output(self,other,"DIA_Richter_MR_Hello_14_00");	//Если хочешь на что-то пожаловаться, иди к капитану городской стражи.
	AI_Output(self,other,"DIA_Richter_MR_Hello_14_01");	//А я занят.
	AI_StopProcessInfos(self);
};

//================================================
instance DIA_Richter_MR_Perm(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_MR_Perm_Cond;
	information = DIA_Richter_MR_Perm_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Richter_MR_Perm_Cond()
{
	if (DIA_WhenAsked_cond() && Npc_KnowsInfo(other,DIA_Richter_Hello) && (HERO_Imprisoned != HERO_Imprisoned_City))
	{
		return TRUE;
	};
};
func void DIA_Richter_MR_Perm_Info()
{
	AI_Output(self,other,"DIA_Richter_MR_Perm_14_00");	//Я же сказал, не мешай мне.
	AI_StopProcessInfos(self);
};

//=============================== СУД ===================================
instance DIA_Richter_Verdict(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 0;
	condition = DIA_Richter_Verdict_Cond;
	information = DIA_Richter_Verdict_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Richter_Verdict_Cond()
{
	if (HERO_Imprisoned == HERO_Imprisoned_City)	{
		return TRUE;
	};
};
func void DIA_Richter_Verdict_Info()
{
	HERO_Imprisoned = FALSE;
	City_Schulden = B_GetTotalPetzCounter(self) + 20 * ABSOLUTIONLEVEL_City;
	if (ABSOLUTIONLEVEL_City == 0)	{
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Richter_Verdict_14_00");	//Ты обвиняешься в преступлении.
			AI_Output(self,other,"DIA_Richter_Verdict_14_01");	//Согласно указу короля, все преступники, сколь бы тяжким не было их преступление, должны отрабатывать свои прегрешения на рудниках.
			if (hero.voice == 3)	{			//Одо/Руперт
				AI_Output(other,self,"DIA_Richter_Verdict_03_02");	//Но, может быть, есть какой-то другой вариант?
			} else if (hero.voice == 7)	{		//Талбин
				AI_Output(other,self,"DIA_Richter_Verdict_07_02");	//Но, может быть, есть какой-то другой вариант?
			} else if (hero.voice == 10)	{	//Эрол
				AI_Output(other,self,"DIA_Richter_Verdict_10_02");	//Но, может быть, есть какой-то другой вариант?
			} else if (hero.voice == 14)	{	//Тилл
				AI_Output(other,self,"DIA_Richter_Verdict_14_02");	//Но, может быть, есть какой-то другой вариант?
			};
			AI_Output(self,other,"DIA_Richter_Verdict_14_03");	//Ммм... Учитывая чистосердечное раскаяние, отсутствие злого умысла...
			AI_Output(self,other,"DIA_Richter_Verdict_14_04");	//Думаю, штрафа будет вполне достаточно.
		}
		else	{
			AI_Output(self,other,"DIA_Richter_Verdict_14_05");	//Как посмела ты нарушить закон в нашем славном городе!
			AI_Output(self,other,"DIA_Richter_Verdict_14_06");	//Твое счастье, что женщин не отправляют в Колонию... без веской на то причины.
			AI_Output(self,other,"DIA_Richter_Verdict_14_07");	//Ты должна заплатить штраф за свои преступления.
		};
	}
	else	{
			AI_Output(self,other,"DIA_Richter_Verdict_14_08");	//Итак, ты вновь обвиняешься в преступлении.
			AI_Output(self,other,"DIA_Richter_Verdict_14_09");	//В состоянии ли ты оплатить штраф, покрывающий твои прегрешения?
	};
	//B_Say_Gold(self,other,City_Schulden);
	Info_ClearChoices(DIA_Richter_Verdict);
	Info_AddChoice(DIA_Richter_Verdict,"У меня нет столько денег.",DIA_Richter_Verdict_NoPay);
	Info_AddChoice(DIA_Richter_Verdict,B_BuildStrShulden(City_Schulden),DIA_Richter_Verdict_Pay);
};
func void DIA_Richter_Verdict_Pay()
{
	if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Richter_Verdict_Pay_03_00");	//Я хочу заплатить штраф.
	} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Richter_Verdict_Pay_07_00");	//Я хочу заплатить штраф.
	} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Richter_Verdict_Pay_10_00");	//Я хочу заплатить штраф.
	} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Richter_Verdict_Pay_14_00");	//Я хочу заплатить штраф.
	} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Richter_Verdict_Pay_16_00");	//Я хочу заплатить штраф.
	};
	if (C_NpcHasGold(other,City_Schulden))	{
		AI_Output(self,other,"DIA_Richter_Verdict_Pay_14_01");	//Именем короля Робара II, я снимаю с тебя все обвинения.
		B_GrantAbsolution(LOC_CITY);
		B_GiveInvItems(other,self,ItMi_Gold,City_Schulden);
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(self,"START");
		B_StartOtherRoutine(Vlk_402_Richter,"START");
		B_StartOtherRoutine(MIL_312_Wulfgar,"START");
		B_StartOtherRoutine(Mil_329_Miliz,"START");
		B_StartOtherRoutine(Mil_330_Miliz,"START");
	}
	else	{
		AI_Output(self,other,"DIA_Richter_Verdict_Pay_14_02");	//И где же деньги?
	};
};
func void DIA_Richter_Verdict_NoPay()
{
	if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Richter_Verdict_NoPay_03_00");	//У меня нет столько денег.
	} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Richter_Verdict_NoPay_07_00");	//У меня нет столько денег.
	} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Richter_Verdict_NoPay_10_00");	//У меня нет столько денег.
	} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Richter_Verdict_NoPay_14_00");	//У меня нет столько денег.
	} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Richter_Verdict_NoPay_16_00");	//У меня нет столько денег.
	};
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Richter_Verdict_NoPay_14_01");	//В таком случае рудники ждут тебя. У тебя есть еще неделя, чтобы отдохнуть в городской тюрьме.
	}
	else	{
		AI_Output(self,other,"DIA_Richter_Verdict_NoPay_14_02");	//В таком случае, тебе придется обдумать свое поведение в городской тюрьме.
	};
		AI_Output(self,other,"DIA_Richter_Verdict_NoPay_14_03");	//Стража!
	PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
	AI_StopProcessInfos(self);
};


