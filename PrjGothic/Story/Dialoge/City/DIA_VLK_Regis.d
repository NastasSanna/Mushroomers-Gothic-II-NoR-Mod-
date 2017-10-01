
instance DIA_Regis_EXIT(DIA_Proto_End)
{
	npc = VLK_425_Regis;
};

/////////////////////////////////////// РУПЕРТ /////////////////////////////////////////////

//===================================================
instance DIA_Regis_Start_Rupert(C_Info)
{
	npc = VLK_425_Regis;
	nr = 10;
	condition = DIA_Regis_Start_Rupert_Condition;
	information = DIA_Regis_Start_Rupert_Info;
	important = TRUE;
};
func int DIA_Regis_Start_Rupert_Condition()
{
	if (C_HeroIs_Rupert())	{
		return TRUE;
	};
};
func void DIA_Regis_Start_Rupert_Info()
{
	START_DIA_Finished = TRUE;
	AI_Output(self,other,"DIA_Regis_Start_Rupert_13_00");	//... пришел, представляешь, на рыночную площадь, и говорит: 
	AI_Output(self,other,"DIA_Regis_Start_Rupert_13_01");	//объявляю, мол, конкурс по сбору грибов! И пообещал отвесить кучу золота за каждый гриб, который ему принесут на этой неделе. 
	AI_Output(self,other,"DIA_Regis_Start_Rupert_13_02");	//А победителю - вручить какой-то главный приз.
	AI_Output(self,other,"DIA_Regis_Start_Rupert_13_03");	//Я, конечно, слышал, что он к грибам неровно дышит, но чтоб так...
	AI_Output(self,other,"DIA_Regis_Start_Rupert_13_04");	//Видать, совсем этот Константино умом тронулся. Или в рецепте зелья что напутал...  (смеется)
	CreateInvItem(self,ItFo_Beer);	AI_UseItem(self,ItFo_Beer);
		AI_Output(other,self,"DIA_Regis_Start_Rupert_03_05");	//Так что, ты пойдешь за грибами?
	AI_Output(self,other,"DIA_Regis_Start_Rupert_13_06");	//Я?! Нет, я-то еще в своем уме. В городе грибы не растут, насколько я знаю. 
	AI_Output(self,other,"DIA_Regis_Start_Rupert_13_07");	//А в лес меня ни за какие коврижки не заманишь. Не хочу, чтобы из-за пары грибочков меня сожрали волки. Или кто похуже.
		AI_Output(other,self,"DIA_Regis_Start_Rupert_03_08");	//А я, пожалуй, попытаю счастья. Я сейчас совсем на мели...
	AI_Output(self,other,"DIA_Regis_Start_Rupert_13_09");	//Дело твое.
	CreateInvItem(self,ItFo_Beer);	AI_UseItem(self,ItFo_Beer);
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Regis_Rupert_Final(C_Info)
{
	npc = VLK_425_Regis;
	nr = 11;
	condition = DIA_Regis_Rupert_Final_Condition;
	information = DIA_Regis_Rupert_Final_Info;
	important = TRUE;
};
func int DIA_Regis_Rupert_Final_Condition()
{
	if ((C_HeroIs_Rupert()) && (Competition_Result != Competition_Result_NONE))	{
		return TRUE;
	};
};
func void DIA_Regis_Rupert_Final_Info()
{
	if (Competition_Result == Competition_Result_WON)	{
			AI_Output(self,other,"DIA_Regis_Rupert_Final_WON_13_01");	//Слыхал, ты выиграл конкурс!
			AI_Output(self,other,"DIA_Regis_Rupert_Final_WON_13_02");	//Давай, рассказывай, что там за приз.
		AI_Output(other,self,"DIA_Regis_Rupert_Final_WON_03_03");	//Книга Константино о грибах. Довольно увестистый том. И интересный, с картинками.
			AI_Output(self,other,"DIA_Regis_Rupert_Final_WON_13_04");	//Надо срочно обмыть! Пошли к Корагорну.
	}
	else	{
			AI_Output(self,other,"DIA_Regis_Rupert_Final_LOST_13_01");	//Слыхал, ты проиграл конкурс!
		AI_Output(other,self,"DIA_Regis_Rupert_Final_LOST_03_02");	//Была очень жесткая конкуренция.
			AI_Output(self,other,"DIA_Regis_Rupert_Final_LOST_13_03");	//А не запить ли нам горечь поражения?
	};
	Info_ClearChoices(DIA_Regis_Rupert_Final);
	Info_AddChoice(DIA_Regis_Rupert_Final,"Пошли!",DIA_Regis_Rupert_Final_Yes);
	Info_AddChoice(DIA_Regis_Rupert_Final,"Сегодня я пас.",DIA_Regis_Rupert_Final_No);
};
func void DIA_Regis_Rupert_Final_No()
{
		AI_Output(other,self,"DIA_Regis_Rupert_Final_No_03_01");	//Сегодня я пас.
	if (C_NpcHasGold(other,100))	{
		AI_Output(other,self,"DIA_Regis_Rupert_Final_No_03_02");	//Не хочу тратить с трудом накопленное золото.
	}
	else	{
		AI_Output(other,self,"DIA_Regis_Rupert_Final_No_03_03");	//Я по-прежнему без денег.
	};
	if (MIS_Rupert_Debts == LOG_SUCCESS)	{
		AI_Output(other,self,"DIA_Regis_Rupert_Final_No_03_04");	//И я только-только расплатился со всеми долгами.
	};
		AI_Output(other,self,"DIA_Regis_Rupert_Final_No_03_05");	//Я лучше попытаюсь найти работу.
	AI_Output(self,other,"DIA_Regis_Rupert_Final_No_13_06");	//О Иннос, кто этот человек? Куда ты дел Руперта?
	AI_Output(self,other,"DIA_Regis_Rupert_Final_No_13_07");	//Или тебя Константино каким-то зельем напоил?
		AI_Output(other,self,"DIA_Regis_Rupert_Final_No_03_08");	//Перед тобой новая, улучшенная версия Руперта. Которая умеет не только по трактирам шататься, но и добиваться чего-то в жизни!
	AI_Output(self,other,"DIA_Regis_Rupert_Final_No_13_09");	//Ладно, ладно, я понял. Не хочешь - не надо.
	AI_StopProcessInfos(self);
	
};
func void DIA_Regis_Rupert_Final_Yes()
{
	Rupert_Binge = 1;
		AI_Output(other,self,"DIA_Regis_Rupert_Final_Yes_03_01");	//Пошли!
	if (C_NpcHasGold(other,100))	{
		AI_Output(other,self,"DIA_Regis_Rupert_Final_Yes_03_02");	//Я угощаю! Я теперь при деньгах.
			AI_Output(self,other,"DIA_Regis_Rupert_Final_Yes_13_03");	//Вот это разговор!
	}
	else	{
		AI_Output(other,self,"DIA_Regis_Rupert_Final_Yes_03_04");	//Только ты угощаешь. Я все еще без денег.
			AI_Output(self,other,"DIA_Regis_Rupert_Final_Yes_13_05");	//Эх, по такому поводу...
	};
			AI_Output(self,other,"DIA_Regis_Rupert_Final_Yes_13_06");	//Идем накатим!
	B_StartOtherRoutine(self,"BINGE");
	AI_StopProcessInfos(self);
};
// ПОПОЙКА ==================================================
instance DIA_Regis_Rupert_Binge(C_Info)
{
	npc = VLK_425_Regis;
	nr = 12;
	condition = DIA_Regis_Rupert_Binge_Condition;
	information = DIA_Regis_Rupert_Binge_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Regis_Rupert_Binge_Condition()
{
	if ((C_HeroIs_Rupert()) && (Rupert_Binge > 0))	{
		return TRUE;
	};
};
func void DIA_Regis_Rupert_Binge_Info()
{
	Wld_GetFullTime();
	var string h;
	var string m;
	if (Wld_hour > 9)	{	h = IntToString(Wld_Hour);	} else {	h = ConcatStrings("0",IntToString(Wld_Hour));	};
	if (Wld_minute > 9)	{	m = IntToString(Wld_minute);} else {	m = ConcatStrings("0",IntToString(Wld_minute));	};
	PrintScreen(CS3(h,":",m),-1,-1,FONT_Screen,4);
	Wld_StopEffect("TIMELAPSE_BLEND");
	if (Rupert_Binge == 1)	{
		AI_Output(self,other,"DIA_Regis_Rupert_Binge_Start_13_01");	//Ну, за грибы!
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_Start_03_02");	//За грибы!
	};
	if (Rupert_Binge == 2)	{
		if (MR_Counter[MR_Heart] > 0)	{
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_MR_Heart_03_01");	//...Этот гриб прямо как сердце. Константино его чуть не выронил, когда увидел!
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_MR_Heart_13_02");	//Тьфу, мерзость. Только не говори, что ты его ел!
		}
		else	{
			Rupert_Binge += 1;	//следующая фраза
		};
	};
	if (Rupert_Binge == 3)	{
		if ((MR_Counter[MR_Governor] > 0) || (MR_Eaten[MR_Governor] > 0))	{
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_MR_Governor_13_01");	//...а я говорю видел! Самого губернатора в шляпе, с воротником белым!
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_MR_Governor_03_02");	//И сколько таких грибов ты слопал?
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_MR_Governor_13_03");	//А я считал?
		}
		else	{
			Rupert_Binge += 1;	//следующая фраза
		};
	};
	if (Rupert_Binge == 4)	{
		if (MIS_Rupert_Debts_Lehmar_Sword == MIS_Rupert_Debts_Lehmar_SwordGiven)	{
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_SwordGiven_03_01");	//...настоящий рудный меч! Он у меня его чуть с руками не оторвал!
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_SwordGiven_13_02");	//За руду!
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_SwordGiven_03_03");	//За руду!
		}
		else	{
			Rupert_Binge += 1;	//следующая фраза
		};
	};
	if (Rupert_Binge == 5)	{
		if (MIS_MalethWolves == LOG_SUCCESS)	{
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_MalethWolves_03_01");	//...Шестому волку я так засветил промеж глаз, что он сразу и свалился. Так всех шестерых рядком и уложил.
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_MalethWolves_13_02");	//Врешь!
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_MalethWolves_03_03");	//Мамой клянусь!
		}
		else	{
			Rupert_Binge += 1;	//следующая фраза
		};
	};
	if (Rupert_Binge == 6)	{
		if (MIS_FellanGoHome == LOG_SUCCESS)	{
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_FellanGoHome_03_01");	//...А теперь он целый день стучит молотком по своей хижине. 
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_FellanGoHome_13_02");	//А я-то думаю, откуда дятел в порту? Гы-гы.
		}
		else	{
			Rupert_Binge += 1;	//следующая фраза
		};
	};
	if (Rupert_Binge == 7)	{
		if (MIS_Cookery == LOG_SUCCESS)	{
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_Cookery_03_01");	//...и получились жареные уши в масле. Не каждый согласится попробовать!
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_Cookery_13_02");	//Я бы лучше ту настойку Константино продегустировал...
		}
		else	{
			Rupert_Binge += 1;	//следующая фраза
		};
	};
	if (Rupert_Binge == 8)	{
		if (Vino_Found)	{
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_VinoFound_03_01");	//...по запаху перегара я этого Вино и нашел. Уж не знаю, чего он там намешал, но пробрало его знатно!
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_VinoFound_13_02");	//Навестить бы его как-нить, ик...
		}
		else	{
			Rupert_Binge += 1;	//следующая фраза
		};
	};
	if (Rupert_Binge == 9)	{
		if (MIS_KhorinisPost_VinoDelivered)	{
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_VinoDelivered_03_01");	//...у их там в этй... пщере... нстоящ винзавод... баашой ткой... бутлки... многа...
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_VinoDelivered_13_02");	//Вот бы там пааселисся, а!
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_VinoDelivered_03_03");	//Ага!
	}
		else	{
			Rupert_Binge += 1;	//следующая фраза
		};
	};
	if (Rupert_Binge == 10)	{
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_More_03_01");	//Ищщо пааад-ной!
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_More_13_02");	//Буем!
	};
	//конец
	if (Rupert_Binge == 12)	{
		Wld_PlayEffect("DRUNK",hero,hero,0,0,0,FALSE);
		Npc_RemoveInvItems(hero,ItMi_Gold,Npc_HasItems(hero,ItMi_Gold));
		AI_PlayAni(other,"T_DANCE_04");
		AI_TurnToNpc(self,other);
		AI_PlayAni(self,"T_WATCHFIGHT_YEAH");
		AI_Wait(other,0.8);
		AI_PlayAniBS(other,"T_STAND_2_SLEEPFIRECAMP",BS_LIE);
		AI_StopProcessInfos(self);
		Rupert_Binge = 100;
		return;
	};
	//после каждой фразы пьем - сначала пиво, потом вино, потом самогон
	AI_StopLookAt(self);
	if (Rupert_Binge < 4)	{
		CreateInvItem(self,ItFo_Beer);		AI_UseItem(self,ItFo_Beer);
		CreateInvItem(other,ItFo_Beer);		AI_UseItem(other,ItFo_Beer);
	}
	else if (Rupert_Binge < 7)	{
		CreateInvItem(self,ItFo_Wine);		AI_UseItem(self,ItFo_Wine);
		CreateInvItem(other,ItFo_Wine);		AI_UseItem(other,ItFo_Wine);
	}
	else	{
		CreateInvItem(self,ItFo_Booze);		AI_UseItem(self,ItFo_Booze);
		CreateInvItem(other,ItFo_Booze);	AI_UseItem(other,ItFo_Booze);
	};
	Rupert_Binge += 1;
	AI_StopProcessInfos(self);
};
//==========================
instance DIA_Regis_Rupert_Binge_Wake(C_Info)
{
	npc = PC_Rupert;
	condition = DIA_Regis_Rupert_Binge_Wake_Condition;
	information = DIA_Regis_Rupert_Binge_OpenEyes;
	description = "(открыть глаза)";
};
func int DIA_Regis_Rupert_Binge_Wake_Condition()
{
	if ((C_HeroIs_Rupert()) && (Rupert_Binge == -2))	{
		return TRUE;
	};
};
func void DIA_Regis_Rupert_Binge_OpenEyes()
{
	Wld_StopEffect("TIMELAPSE_BLEND");
	Wld_PlayEffect("DRUNK",hero,hero,0,0,0,FALSE);
	Info_ClearChoices(DIA_Regis_Rupert_Binge_Wake);
	Info_AddChoice(DIA_Regis_Rupert_Binge_Wake,"(попытаться встать)",DIA_Regis_Rupert_Binge_TryGetUp);
};	
func void DIA_Regis_Rupert_Binge_TryGetUp()
{
	AI_PlayAniBS(hero,"T_SLEEPGROUND_2_STAND",BS_STAND);
	AI_PrintScreen("Моя голова...",-1,-1,FONT_Screen,2);
	AI_PlayAniBS(hero,"T_STAND_2_WOUNDED",BS_LIE);
	Info_ClearChoices(DIA_Regis_Rupert_Binge_Wake);
	Info_AddChoice(DIA_Regis_Rupert_Binge_Wake,"(попытаться еще раз)",DIA_Regis_Rupert_Binge_GetUp);
};	
func void DIA_Regis_Rupert_Binge_GetUp()
{
	AI_PlayAniBS(hero,"T_WOUNDED_2_STAND",BS_STAND);
	AI_PrintScreen("Мама, роди меня обратно...",-1,-1,FONT_Screen,2);
	AI_StopProcessInfos(self);
//	Wld_StopEffect("DRUNK");
	Rupert_Binge = -3;
};


/////////////////////////////////////// ОСТАЛЬНЫЕ /////////////////////////////////////////////

//===================================================
instance DIA_Regis_Hello(C_Info)
{
	npc = VLK_425_Regis;
	nr = 1;
	condition = DIA_Regis_MR_Hello_Condition;
	information = DIA_Regis_MR_Hello_Info;
	description = "Привет.";
};
func int DIA_Regis_MR_Hello_Condition()
{
	if (!C_HeroIs_Rupert())	{
		return TRUE;
	};
};
func void DIA_Regis_MR_Hello_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Regis_MR_Hello_03_00");	//Привет.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Regis_MR_Hello_07_00");	//Привет.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Regis_MR_Hello_10_00");	//Привет.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Regis_MR_Hello_14_00");	//Привет.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Regis_MR_Hello_16_00");	//Привет.
	};
	AI_Output(self,other,"DIA_Regis_MR_Hello_13_01");	//Привет.
	AI_Output(self,other,"DIA_Regis_MR_Hello_13_02");	//Ты ведь из этих, охотников за грибами, верно?
	AI_Output(self,other,"DIA_Regis_MR_Hello_13_03");	//Как твои успехи?
	Info_ClearChoices(DIA_Regis_Hello);
	Info_AddChoice(DIA_Regis_Hello,"Не скажу.",DIA_Regis_MR_Hello_Secret);
	Info_AddChoice(DIA_Regis_Hello,"Не знаю.",DIA_Regis_MR_Hello_DontKnow);
	Info_AddChoice(DIA_Regis_Hello,"Плохо.",DIA_Regis_MR_Hello_Bad);
	Info_AddChoice(DIA_Regis_Hello,"Нормально.",DIA_Regis_MR_Hello_Norm);
	Info_AddChoice(DIA_Regis_Hello,"Хорошо.",DIA_Regis_MR_Hello_Good);
	Info_AddChoice(DIA_Regis_Hello,"Отлично.",DIA_Regis_MR_Hello_Cool);
	
};
func void DIA_Regis_MR_Hello_Cool()
{
	if (hero.voice == 3)	{			//Одо/Руперт/Тилл
		AI_Output(other,self,"DIA_Regis_MR_Hello_Cool_03_00");	//Отлично.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Regis_MR_Hello_Cool_07_00");	//Отлично.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Regis_MR_Hello_Cool_10_00");	//Отлично.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Regis_MR_Hello_Cool_14_00");	//Отлично.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Regis_MR_Hello_Cool_16_00");	//Отлично.
	};
	AI_Output(self,other,"DIA_Regis_MR_Hello_Cool_13_01");	//Поздравляю!
	Info_ClearChoices(DIA_Regis_Hello);
};
func void DIA_Regis_MR_Hello_Good()
{
	if (hero.voice == 3)	{			//Одо/Руперт/Тилл
		AI_Output(other,self,"DIA_Regis_MR_Hello_Good_03_00");	//Хорошо.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Regis_MR_Hello_Good_07_00");	//Хорошо.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Regis_MR_Hello_Good_10_00");	//Хорошо.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Regis_MR_Hello_Good_14_00");	//Хорошо.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Regis_MR_Hello_Good_16_00");	//Хорошо.
	};
	AI_Output(self,other,"DIA_Regis_MR_Hello_Good_13_01");	//Так держать!
	Info_ClearChoices(DIA_Regis_Hello);
};
func void DIA_Regis_MR_Hello_Norm()
{
	if (hero.voice == 3)	{			//Одо/Руперт/Тилл
		AI_Output(other,self,"DIA_Regis_MR_Hello_Norm_03_00");	//Нормально.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Regis_MR_Hello_Norm_07_00");	//Нормально.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Regis_MR_Hello_Norm_10_00");	//Нормально.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Regis_MR_Hello_Norm_14_00");	//Нормально.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Regis_MR_Hello_Norm_16_00");	//Нормально.
	};
	AI_Output(self,other,"DIA_Regis_MR_Hello_Norm_13_01");	//Ну, желаю успеха!
	Info_ClearChoices(DIA_Regis_Hello);
};
func void DIA_Regis_MR_Hello_Bad()
{
	if (hero.voice == 3)	{			//Одо/Руперт/Тилл
		AI_Output(other,self,"DIA_Regis_MR_Hello_Bad_03_00");	//Плохо.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Regis_MR_Hello_Bad_07_00");	//Плохо.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Regis_MR_Hello_Bad_10_00");	//Плохо.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Regis_MR_Hello_Bad_14_00");	//Плохо.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Regis_MR_Hello_Bad_16_00");	//Плохо.
	};
	AI_Output(self,other,"DIA_Regis_MR_Hello_Bad_13_01");	//Сочувствую.
	if (Wld_GetDay() < 7)	{
		AI_Output(self,other,"DIA_Regis_MR_Hello_Bad_13_02");	//Но у тебя еще есть время!
	};
	Info_ClearChoices(DIA_Regis_Hello);
};
func void DIA_Regis_MR_Hello_DontKnow()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Regis_MR_Hello_DontKnow_03_00");	//Не знаю.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Regis_MR_Hello_DontKnow_07_00");	//Не знаю.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Regis_MR_Hello_DontKnow_10_00");	//Не знаю.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Regis_MR_Hello_DontKnow_14_00");	//Не знаю.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Regis_MR_Hello_DintKnow_16_00");	//Не знаю.
	};
	AI_Output(self,other,"DIA_Regis_MR_Hello_DontKnow_13_01");	//Тогда загляни к Константино.
	AI_Output(self,other,"DIA_Regis_MR_Hello_DontKnow_13_02");	//Уверен, он не станет делать секрета из соревнования, и все тебе расскажет.
	Info_ClearChoices(DIA_Regis_Hello);
};
func void DIA_Regis_MR_Hello_Secret()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Regis_MR_Hello_Secret_03_00");	//Не скажу.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Regis_MR_Hello_Secret_07_00");	//Не скажу.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Regis_MR_Hello_Secret_10_00");	//Не скажу.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Regis_MR_Hello_Secret_14_00");	//Не скажу.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Regis_MR_Hello_Secret_16_00");	//Не скажу.
	};
	AI_Output(self,other,"DIA_Regis_MR_Hello_Secret_13_01");	//Эй, я просто спросил. В любом случае, желаю удачи!
	Info_ClearChoices(DIA_Regis_Hello);
};

//===================================================
instance DIA_Regis_Others_Final(C_Info)
{
	npc = VLK_425_Regis;
	nr = 2;
	condition = DIA_Regis_Others_Final_Condition;
	information = DIA_Regis_Others_Final_Info;
	important = TRUE;
};
func int DIA_Regis_Others_Final_Condition()
{
	if ((!C_HeroIs_Rupert()) && (Competition_Result == Competition_Result_WON))	{
		return TRUE;
	};
};
func void DIA_Regis_Others_Final_Info()
{
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Regis_Others_Final_WON_13_01m");	//Слыхал, ты победил в конкурсе Константино!
	}
	else	{
		AI_Output(self,other,"DIA_Regis_Others_Final_WON_13_01f");	//Слыхал, ты победила в конкурсе Константино!
	};
		AI_Output(self,other,"DIA_Regis_Others_Final_WON_13_02");	//Мои поздравления!
};

// ВСЕ ===============================================
instance DIA_Regis_MRPerm(C_Info)
{
	npc = VLK_425_Regis;
	nr = 50;
	condition = DIA_NoCond_cond;
	information = DIA_Regis_MRPerm_Info;
	permanent = TRUE;
	description = "О чем говорят в городе?";
};
func void DIA_Regis_MRPerm_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Regis_MRPerm_03_00");	//О чем говорят в городе?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Regis_MRPerm_07_00");	//О чем говорят в городе?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Regis_MRPerm_10_00");	//О чем говорят в городе?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Regis_MRPerm_14_00");	//О чем говорят в городе?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Regis_MRPerm_16_00");	//О чем говорят в городе?
	};
	var int rnd;	rnd = Hlp_Random(5);
	if (rnd == 0)	{
		AI_Output(self,other,"DIA_Regis_MRPerm_13_01");	//О конкурсе Константино, разумеется!
		AI_Output(self,other,"DIA_Regis_MRPerm_13_02");	//Все хотят знать, кто выйдет победителем. Некоторые даже делают ставки.
	}
	else if (rnd == 1)	{
		AI_Output(self,other,"DIA_Regis_MRPerm_13_03");	//В гавань уже несколько месяцев не заходили торговые суда, но товары с материка периодически всплывают в городе.
		AI_Output(self,other,"DIA_Regis_MRPerm_13_04");	//Никто не знает, откуда они берутся.
	}
	else if (rnd == 2)	{
		AI_Output(self,other,"DIA_Regis_MRPerm_13_05");	//Слышал, в Верхнем квартале участились кражи.
		AI_Output(self,other,"DIA_Regis_MRPerm_13_06");	//Наши бравые стражники, как всегда, появляются с опозданием.
	}
	else if (rnd == 3)	{
		AI_Output(self,other,"DIA_Regis_MRPerm_13_07");	//Давно не было вестей о войне. Это плохой знак.
		AI_Output(self,other,"DIA_Regis_MRPerm_13_08");	//Вслух пока не говорят, но в городе и за городом зреет недовольство.
	}
	else	{
		AI_Output(self,other,"DIA_Regis_MRPerm_13_09");	//За последние годы многие люди осели на острове, как и твой покорный слуга.
		AI_Output(self,other,"DIA_Regis_MRPerm_13_10");	//Одни скрываются от войны, другие просто не могут уплыть, потому что нет кораблей.
		AI_Output(self,other,"DIA_Regis_MRPerm_13_11");	//Стало очень трудно найти работу, даже в порту или на фермах.
	};
};
