
instance DIA_Onar_EXIT(DIA_Proto_End)
{
	npc = BAU_900_Onar;
};

/////////////////////////////////////// ЕЛЕНА /////////////////////////////////////////////

//===================================================
instance DIA_Onar_Start_Elena(C_Info)
{
	npc = BAU_900_Onar;
	nr = 1;
	condition = DIA_Onar_Start_Elena_Condition;
	information = DIA_Onar_Start_Elena_Info;
	important = TRUE;
};
func int DIA_Onar_Start_Elena_Condition()
{
	if (C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Onar_Start_Elena_Info()
{
	START_DIA_Finished = TRUE;
	var int x; x = 0;
		AI_Output(other,self,"DIA_Onar_Start_Elena_16_00");	//... и 12 мешков пшеницы по 48 золотых. Итого 824 золотых.
	//отдает деньги
	x = 1;	if (x == 1)	{
		CreateInvItems(other,ItMi_Gold,824);
		B_GiveInvItems(other,self,ItMi_Gold,824);
	};
	AI_Output(self,other,"DIA_Onar_Start_Elena_14_01");	//Недурно. А я боялся, что ты не справишься с торговлей.
	AI_Output(self,other,"DIA_Onar_Start_Elena_14_02");	//Есть ли какие-нибудь интересные новости из города?
		AI_Output(other,self,"DIA_Onar_Start_Elena_16_03");	//Как сказать... Городской алхимик, Константино, объявил конкурс по сбору грибов. Говорят, он большой их любитель.
		AI_Output(other,self,"DIA_Onar_Start_Elena_16_04");	//Обещал щедрую награду всем, кто принесет ему грибы в течение этой недели. И какой-то «особый приз» победителю...
	AI_Output(self,other,"DIA_Onar_Start_Elena_14_05");	//И ты, конечно, хочешь пойти за грибами.
		AI_Output(other,self,"DIA_Onar_Start_Elena_16_06");	//Я...
	AI_Output(self,other,"DIA_Onar_Start_Elena_14_07");	//Не перебивай отца. Ступай, чего уж. Сейчас дел для тебя все равно нет, нечего платье по лавкам протирать. 
	AI_Output(self,other,"DIA_Onar_Start_Elena_14_08");	//Только будь осторожна, в лесу можно встретить всяких тварей. Возьми шпагу, что я подарил тебе. И пару зелий скорости.
	//ключ от сундука
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};
//===================================================
instance DIA_Onar_Elena_MR_Perm(C_Info)
{
	npc = BAU_900_Onar;
	nr = 2;
	condition = DIA_Onar_Elena_MR_Perm_Condition;
	information = DIA_Onar_Elena_MR_Perm_Info;
	permanent = TRUE;
	description = "Есть что-нибудь новое?";
};
func int DIA_Onar_Elena_MR_Perm_Condition()
{
	if (C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Onar_Elena_MR_Perm_Info()
{
		AI_Output(other,self,"DIA_Onar_Elena_MR_Perm_16_00");	//Есть что-нибудь новое?
	AI_Output(self,other,"DIA_Onar_Elena_MR_Perm_14_01");	//Пока ничего.
	if (Competition_Result == Competition_Result_NONE)	{
		AI_Output(self,other,"DIA_Onar_Elena_MR_Perm_14_02");	//А ты меня чем порадуешь?
			AI_Output(other,self,"DIA_Onar_Elena_MR_Perm_16_03");	//Грибов в этом году много, так что у меня неплохие шансы.
		AI_Output(self,other,"DIA_Onar_Elena_MR_Perm_14_04");	//Ну ступай.
	};
	AI_StopProcessInfos(self);
};
//===================================================
instance DIA_Onar_Elena_Final(C_Info)
{
	npc = BAU_900_Onar;
	nr = 3;
	condition = DIA_Onar_Elena_Final_Condition;
	information = DIA_Onar_Elena_Final_Info;
	description = "Я выиграла конкурс!";
};
func int DIA_Onar_Elena_Final_Condition()
{
	if ((C_HeroIs_Elena()) && (Competition_Result != Competition_Result_NONE))	{
		return TRUE;
	};
};
func void DIA_Onar_Elena_Final_Info()
{
	if (Competition_Result == Competition_Result_WON)	{
			AI_Output(other,self,"DIA_Onar_Elena_Final_WON_16_00");	//Отец! Я выиграла конкурс!
		Mdl_StartFaceAni(self,"S_FRIENDLY",1.0,5);
		AI_Output(self,other,"DIA_Onar_Elena_Final_WON_14_01");	//(улыбается) Я в тебе и не сомневался. Ну рассказывай, что там за приз.
			AI_Output(other,self,"DIA_Onar_Elena_Final_WON_16_02");	//Книга. Константино описал в ней все известные ему грибы.
			if (Competition_Bonus > 0)	{
				AI_Output(other,self,"DIA_Onar_Elena_Final_WON_16_03");	//Но мне удалось найти такие, про которые даже он не знает.
			};
		AI_Output(self,other,"DIA_Onar_Elena_Final_WON_14_04");	//Что ж, книга это не плохо.
	}
	else	{
			AI_Output(other,self,"DIA_Onar_Elena_Final_LOST_16_01");	//Здравствуй, отец! Конкурс мне выиграть не удалось...
		AI_Output(self,other,"DIA_Onar_Elena_Final_LOST_14_02");	//Ну что ж...
	};
	if(Npc_HasItems(other,ItMi_Gold) > 100)	{
			AI_Output(other,self,"DIA_Onar_Elena_Final_16_01");	//Константино, как и обещал, щедро платил за грибы.
		//отдать деньги
		B_GiveInvItems(other,self,ItMi_Gold,Npc_HasItems(other,ItMi_Gold));
	};
};
//===================================================
instance DIA_Onar_Elena_MR_Perm2(C_Info)
{
	npc = BAU_900_Onar;
	nr = 4;
	condition = DIA_Onar_Elena_MR_Perm2_Condition;
	information = DIA_Onar_Elena_MR_Perm2_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Onar_Elena_MR_Perm2_Condition()
{
	if ((C_HeroIs_Elena()) && Npc_IsInState(self,ZS_Talk)
		&& Npc_KnowsInfo(other,DIA_Onar_Elena_Final) && (HERO_Imprisoned != HERO_Imprisoned_Farm))
	{
		return TRUE;
	};
};
func void DIA_Onar_Elena_MR_Perm2_Info()
{
	AI_Output(self,other,"DIA_Onar_Elena_MR_Perm2_14_00");	//Ступай к матери, она за неделю соскучилась.
	AI_StopProcessInfos(self);
};

/////////////////////////////////////// ТИЛЛ /////////////////////////////////////////////

//===================================================
instance DIA_Onar_MR_Perm_Till(C_Info)
{
	npc = BAU_900_Onar;
	nr = 10;
	condition = DIA_Onar_MR_Perm_Till_Condition;
	information = DIA_Onar_MR_Perm_Till_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Onar_MR_Perm_Till_Condition()
{
	if ((C_HeroIs_Till()) && Npc_IsInState(self,ZS_Talk) && (HERO_Imprisoned != HERO_Imprisoned_Farm))	{
		return TRUE;
	};
};
func void DIA_Onar_MR_Perm_Till_Info()
{
	AI_Output(self,other,"DIA_Onar_MR_Perm_Till_14_00");	//Тебя отец прислал? Какое-то дело?
		AI_Output(other,self,"DIA_Onar_MR_Perm_Till_14_01");	//Нет...
	AI_Output(self,other,"DIA_Onar_MR_Perm_Till_14_02");	//Так займись чем-нибудь!
	AI_StopProcessInfos(self);
};

/////////////////////////////////////// ЭРОЛ /////////////////////////////////////////////

//===================================================
instance DIA_Onar_MR_Hello_Erol(C_Info)
{
	npc = BAU_900_Onar;
	nr = 20;
	condition = DIA_Onar_MR_Hello_Erol_Condition;
	information = DIA_Onar_MR_Hello_Erol_Info;
	important = TRUE;
};
func int DIA_Onar_MR_Hello_Erol_Condition()
{
	if ((C_HeroIs_Erol()) && Npc_IsInState(self,ZS_Talk) && (HERO_Imprisoned != HERO_Imprisoned_Farm))	{
		return TRUE;
	};
};
func void DIA_Onar_MR_Hello_Erol_Info()
{
	AI_Output(self,other,"DIA_Onar_MR_Hello_Erol_14_00");	//Приветствую, Эрол! Какое дело привело тебя сюда?
		AI_Output(other,self,"DIA_Onar_MR_Hello_Erol_10_01");	//Да в общем-то, никакое. 
	AI_Output(self,other,"DIA_Onar_MR_Hello_Erol_14_02");	//Давненько ты просто так не захаживал. Даже странно видеть тебя не по делу.
};

//---------------------------------------------
instance DIA_Onar_HowAU_MR_Perm_Erol(C_Info)
{
	npc = BAU_900_Onar;
	nr = 21;
	condition = DIA_Onar_HowAU_MR_Perm_Erol_Condition;
	information = DIA_Onar_HowAU_MR_Perm_Erol_Info;
	permanent = TRUE;
	description = "Как твои дела?";
};
func int DIA_Onar_HowAU_MR_Perm_Erol_Condition()
{
	if (C_HeroIs_Erol())	{
		return TRUE;
	};
};
func void DIA_Onar_HowAU_MR_Perm_Erol_Info()
{
		AI_Output(other,self,"DIA_Onar_HowAU_MR_Perm_Erol_10_00");	//Как твои дела?
	AI_Output(self,other,"DIA_Onar_HowAU_MR_Perm_Erol_14_01");	//Спасибо, не жалуюсь. Урожай в этом году хороший. И дочь меня радует.
};

//------------------------------------------------
var int DIA_Onar_MRTrade_Erol_once;
instance DIA_Onar_MRTrade_Erol(C_Info)
{
	npc = BAU_900_Onar;
	nr = 22;
	condition = DIA_Onar_MRTrade_Erol_Condition;
	information = DIA_Onar_MRTrade_Erol_Info;
	permanent = TRUE;
	description = "Я хочу купить у тебя кое-что.";
	trade = TRUE;
};
func int DIA_Onar_MRTrade_Erol_Condition()
{
	if (C_HeroIs_Erol())	{
		return TRUE;
	};
};
func void DIA_Onar_MRTrade_Erol_Info()
{
	if (DIA_Onar_MRTrade_Erol_once == FALSE)	{
			AI_Output(other,self,"DIA_Onar_MRTrade_Erol_10_00");	//Я хочу купить у тебя кое-что.
		AI_Output(self,other,"DIA_Onar_MRTrade_Erol_14_01");	//Узнаю Эрола.
		DIA_Onar_MRTrade_Erol_once = TRUE;
		B_LogNote(TOPIC_Trader, TOPIC_Trader_Onar);
	};
	B_GiveTradeInv_Onar(self);
};

/////////////////////////////////////// ПРОЧИЕ /////////////////////////////////////////////

//===================================================
instance DIA_Onar_MR_Perm_Other(C_Info)
{
	npc = BAU_900_Onar;
	nr = 90;
	condition = DIA_Onar_MR_Perm_Other_Condition;
	information = DIA_Onar_MR_Perm_Other_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Onar_MR_Perm_Other_Condition()
{
	if (!C_HeroIs_Till() && !C_HeroIs_Erol() && !C_HeroIs_Elena() 
		 && Npc_IsInState(self,ZS_Talk) && (HERO_Imprisoned != HERO_Imprisoned_Farm))	{
		return TRUE;
	};
};
func void DIA_Onar_MR_Perm_Other_Info()
{
	AI_Output(self,other,"DIA_Onar_MR_Perm_Other_14_01");	//Я не знаю тебя. Что ты делаешь на моей ферме?
	if (C_HeroIs_Odo() && (MIS_Odo_Straw == LOG_Running) && !MIS_Odo_Straw_Onar[Straw_Price])	{
			AI_Output(other,self,"DIA_Onar_Odo_Straw_03_02");	//Монастырь нуждается в сене.
		AI_Output(self,other,"DIA_Onar_Odo_Straw_14_03");	//Я могу продать вам сено по 17 золотых за тюк.
			AI_Output(other,self,"DIA_Onar_Odo_Straw_03_04");	//Я передам мастеру. Могу ли я взглянуть на сено?
		AI_Output(self,other,"DIA_Onar_Odo_Straw_14_05");	//Оно в сарае, если это так необходимо.
		MIS_Odo_Straw_Onar[Straw_Price] = 1;
		B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Onar_Price);
	}
	else	{
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Onar_MR_Perm_Other_03_02");	//Ищу грибы.
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Onar_MR_Perm_Other_07_02");	//Я ищу грибы.
		} else	{							//Сара
			AI_Output(other,self,"DIA_Onar_MR_Perm_Other_16_02");	//Собираю грибы.
		};
		AI_Output(self,other,"DIA_Onar_MR_Perm_Other_14_03");	//Уверяю тебя, что в моем доме грибов нет. Иди лучше в лес.
	};
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Onar_Crime(C_Info)
{
	npc = BAU_900_Onar;
	nr = 100;
	condition = DIA_Onar_Crime_Condition;
	information = DIA_Onar_Crime_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Onar_Crime_Condition()
{
	if (HERO_Imprisoned == HERO_Imprisoned_Farm)	{
		return TRUE;
	};
};
func void DIA_Onar_Crime_Info()
{
	HERO_Imprisoned = FALSE;
	if (C_HeroIs_Elena())	{
		AI_Output(self,other,"DIA_Onar_Crime_Elena_14_00");	//Дочка, что на тебя нашло? Мне сказали, что ты совершила преступление!
		AI_Output(self,other,"DIA_Onar_Crime_Elena_14_01");	//Посиди недельку у себя в комнате и подумай о своем поведении. Позже я придумаю наказание, соответствующее твоему проступку.
		PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
		AI_StopProcessInfos(self);
		return;
	}
	else	if (C_HeroIs_Till())	{
		AI_Output(self,other,"DIA_Onar_Crime_Till_14_00");	//Ты обвиняешься в преступлении! Позор!
		AI_Output(self,other,"DIA_Onar_Crime_Till_14_01");	//На первый раз я предоставлю разобраться с этим твоему отцу. Надеюсь, он устроит тебе хорошую порку!
		PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
		AI_StopProcessInfos(self);
		return;
	}
	else
	{
		if (ABSOLUTIONLEVEL_Farm > 0)	{
			AI_Output(self,other,"DIA_Onar_Crime_Other_14_00a");	//Ты снова преступаешь закон на моей земле!
		}
		else	
		{
			if (other.aivar[AIV_Gender] == MALE)	{
				AI_Output(self,other,"DIA_Onar_Crime_Other_14_00b");	//Мне сообщили, что ты совершил преступление на одной из ферм.
			}
			else	{
				AI_Output(self,other,"DIA_Onar_Crime_Other_14_00c");	//Мне сообщили, что ты совершила преступление на одной из ферм.
			};
			AI_Output(self,other,"DIA_Onar_Crime_Other_14_01");	//Здесь я представляю закон и буду судить тебя.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)	{
			AI_Output(self,other,"DIA_Onar_Crime_Other_14_02");	//Мы не будем терпеть убийцу на нашей земле!
		}	else if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)	{
			AI_Output(self,other,"DIA_Onar_Crime_Other_14_03");	//Я не позволю здесь воровать.
		}	else if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)	{
			AI_Output(self,other,"DIA_Onar_Crime_Other_14_04");	//Хочешь подраться - ступай в порт. А здесь для этого не место.
		}	else if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)	{
			AI_Output(self,other,"DIA_Onar_Crime_Other_14_05");	//Это НАШИ овцы. Не смей прикасаться к ним!
		};
		Farms_Schulden = B_GetTotalPetzCounter(self) + 50 * ABSOLUTIONLEVEL_Farm;
		if(Farms_Schulden > 1000)
		{
			AI_Output(self,other,"DIA_Onar_Crime_Other_14_06");	//Ты никогда не расплатишься за свои преступления золотом!
			AI_Output(self,other,"DIA_Onar_Crime_Other_14_07");	//Я лично прослежу, чтобы тебя отправили за Барьер, к таким же головорезам!
			PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
			AI_StopProcessInfos(self);
			return;
		};
		AI_Output(self,other,"DIA_Onar_Crime_Other_14_08");	//Ты можешь выплатить компенсацию, или отправиться в городскую тюрьму.
		/*
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Onar_Crime_Other_03_09");	//Сколько?
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Onar_Crime_Other_07_09");	//Сколько?
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Onar_Crime_Other_10_09");	//Сколько?
		} else	{							//Сара
			AI_Output(other,self,"DIA_Onar_Crime_Other_16_09");	//Сколько?
		};
		//B_Say_Gold(self,other,Farms_Schulden);
		//*/
		Info_ClearChoices(DIA_Onar_Crime);
		Info_AddChoice(DIA_Onar_Crime,"У меня нет столько денег.",DIA_Onar_Crime_NoPay);
		Info_AddChoice(DIA_Onar_Crime,B_BuildStrShulden(Farms_Schulden),DIA_Onar_Crime_Pay);
	};
};
	
func void DIA_Onar_Crime_Pay()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Onar_Crime_Other_03_10");	//Вот деньги.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Onar_Crime_Other_07_10");	//Вот деньги.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Onar_Crime_Other_10_10");	//Вот деньги.
	} else	{							//Сара
		AI_Output(other,self,"DIA_Onar_Crime_Other_16_10");	//Вот деньги.
	};
	if (C_NpcHasGold(other,Farms_Schulden))	{
		B_GiveInvItems(other,self,ItMi_Gold,Farms_Schulden);
		AI_Output(self,other,"DIA_Onar_Crime_Other_14_11");	//Хорошо. Надеюсь, нам не придется возвращаться к этому разговору.
		B_GrantAbsolution(LOC_FARM);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_Crime_Other_14_12");	//Где? Не пытайся обмануть меня.
	};
};
	
func void DIA_Onar_Crime_NoPay()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Onar_Crime_Other_03_12");	//У меня нет столько денег!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Onar_Crime_Other_07_12");	//У меня нет столько денег!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Onar_Crime_Other_10_12");	//У меня нет столько денег!
	} else	{							//Сара
		AI_Output(other,self,"DIA_Onar_Crime_Other_16_12");	//У меня нет столько денег!
	};
	AI_Output(self,other,"DIA_Onar_Crime_Other_14_13");	//Об этом стоило подумать раньше. Я не настроен отпускать тебя под честное слово.
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Onar_Crime_Other_14_14");	//Ты отправишься туда же, куда и все преступники - в Рудниковую долину.
	};
	PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
	AI_StopProcessInfos(self);
};

