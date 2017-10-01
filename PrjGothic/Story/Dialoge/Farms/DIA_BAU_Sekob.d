
instance DIA_Sekob_EXIT(DIA_Proto_End)
{
	npc = BAU_930_Sekob;
};

/////////////////////////////////////// ТИЛЛ /////////////////////////////////////////////

//===================================================
instance DIA_Sekob_MR_Perm_Till(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 1;
	condition = DIA_Sekob_MR_Perm_Till_Cond;
	information = DIA_Sekob_MR_Perm_Till_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Sekob_MR_Perm_Till_Cond()
{
	if (C_HeroIs_Till() && Npc_IsInState(self,ZS_Talk) && (Competition_Result == Competition_Result_NONE))	{
		return TRUE;
	};
};
func void DIA_Sekob_MR_Perm_Till_Info()
{
	if (Wld_IsTime(5,0,22,0))	{
		AI_Output(self,other,"DIA_Sekob_MR_Perm_Till_01_00");	//Ты что тут делаешь, оболтус? Марш за грибами!
	}
	else	{
		AI_Output(self,other,"DIA_Sekob_MR_Perm_Till_01_01");	//Ты что бродишь посреди ночи? Ложись спать, а утром в лес.
	};
	AI_StopProcessInfos(self);
};
//===================================================
instance DIA_Sekob_Till_Final(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 2;
	condition = DIA_Sekob_Till_Final_Condition;
	information = DIA_Sekob_Till_Final_Info;
	description = "Я выиграл конкурс Константино!";
};
func int DIA_Sekob_Till_Final_Condition()
{
	if ((C_HeroIs_Till()) && (Competition_Result != Competition_Result_NONE))	{
		if (Competition_Result == Competition_Result_LOST)	{
			DIA_Sekob_Till_Final.description = "Я... я проиграл конкурс...";
		};
		return TRUE;
	};
};
func void DIA_Sekob_Till_Final_Info()
{
	if (Competition_Result == Competition_Result_WON)	{
		AI_Output(other,self,"DIA_Sekob_Till_Final_WON_14_00");	//Я выиграл конкурс Константино!
			AI_Output(self,other,"DIA_Sekob_Till_Final_WON_01_01");	//Ну хоть на что-то ты годишься! Что там за приз, давай его сюда.
		AI_Output(other,self,"DIA_Sekob_Till_Final_WON_14_02");	//Это книга про грибы. Константино ее даже подписал для меня.
			AI_Output(self,other,"DIA_Sekob_Till_Final_WON_01_03");	//Что?! Книжка? И это все?!
			AI_Output(self,other,"DIA_Sekob_Till_Final_WON_01_04");	//Ради этого ты неделю слонялся без дела?
			AI_Output(self,other,"DIA_Sekob_Till_Final_WON_01_05");	//Хотя, книги стоят немало. Если удастся продать ее...
	}
	else	{
		AI_Output(other,self,"DIA_Sekob_Till_Final_LOST_14_00");	//Я... я проиграл конкурс...
			AI_Output(self,other,"DIA_Sekob_Till_Final_LOST_01_01");	//Я так и знал, что тебе ничего нельзя доверить! 
	};
	AI_Output(self,other,"DIA_Sekob_Till_Final_14_00");	//Этот старый мошенник хотя бы заплатил тебе?
	var int amount;	amount = Npc_HasItems(other, ItMi_Gold);
	if(amount > 0)	{
		AI_Output(other,self,"DIA_Sekob_Till_Final_14_01");	//Да, вот деньги...
		B_GiveGold(other,self,amount);
		if(amount > 100)	{
			AI_Output(self,other,"DIA_Sekob_Till_Final_03_02");	//(довольно) Недурно... Ладно, иди поиграй пока.
		}
		else	{
			AI_Output(self,other,"DIA_Sekob_Till_Final_03_03");	//(раздраженно) Почему так мало? Чем ты занимался всю неделю?
			AI_Output(self,other,"DIA_Sekob_Till_Final_03_04");	//Остолоп! Уйди с глаз моих!
		};
	}
	else	{
			AI_Output(other,self,"DIA_Sekob_Till_Final_14_05");	//У меня нет денег.
		AI_Output(self,other,"DIA_Sekob_Till_Final_03_06");	//(взбешенно) Куда ты девал все золото?! Ты его что, проглотил?
		AI_Output(self,other,"DIA_Sekob_Till_Final_03_07");	//Пошел вон, паршивец!
	};
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Sekob_PermAfter_Till(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 3;
	condition = DIA_Sekob_PermAfter_Till_Cond;
	information = DIA_Sekob_PermAfter_Till_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Sekob_PermAfter_Till_Cond()
{
	if (C_HeroIs_Till() && Npc_IsInState(self,ZS_Talk)
		 && Npc_KnowsInfo(other,DIA_Sekob_Till_Final) && (Competition_Result != Competition_Result_NONE))	{
		return TRUE;
	};
};
func void DIA_Sekob_PermAfter_Till_Info()
{
	if (Wld_IsTime(5,0,22,0))	{
		AI_Output(self,other,"DIA_Sekob_PermAfter_Till_01_00");	//И когда ты уже поумнеешь? Весь в мать пошел.
	}
	else	{
		AI_Output(self,other,"DIA_Sekob_PermAfter_Till_01_01");	//Чего тебе не спится, оболдуй? Иди ложись, а проснуться постарайся другим человеком!
	};
	AI_StopProcessInfos(self);
};


/////////////////////////////////////// ЕЛЕНА /////////////////////////////////////////////

//===================================================
instance DIA_Sekob_Start_Elena(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 10;
	condition = DIA_Sekob_Start_Elena_Cond;
	information = DIA_Sekob_Start_Elena_Info;
	important = TRUE;
};
func int DIA_Sekob_Start_Elena_Cond()
{
	if (C_HeroIs_Elena() && Npc_IsInState(self,ZS_Talk))	{
		return TRUE;
	};
};
func void DIA_Sekob_Start_Elena_Info()
{
	AI_Output(self,other,"DIA_Sekob_Start_Elena_01_00");	//Елена! Добро пожаловать! Как здоровье родителей?
		AI_Output(other,self,"DIA_Sekob_Start_Elena_16_01");	//Спасибо, хорошо. А у вас?
	AI_Output(self,other,"DIA_Sekob_Start_Elena_01_02");	//Слава богам, слава богам... Что привело тебя в мой скромный дом?
		AI_Output(other,self,"DIA_Sekob_Start_Elena_16_03");	//Я собираю грибы.
	AI_Output(self,other,"DIA_Sekob_Start_Elena_01_04");	//Так ты участвуешь в грибном конкурсе? Мой Тилл тоже решил попытать счастья.
	AI_Output(self,other,"DIA_Sekob_Start_Elena_01_05");	//Вы были бы чудесной парой...
};

/////////////////////////////////////// ОДО /////////////////////////////////////////////

// ==================================================================
instance DIA_Sekob_Odo_Straw(C_INFO)
{
	npc = BAU_930_Sekob;	nr = 20;
	condition = DIA_Sekob_Odo_Straw_cond;
	information = DIA_Sekob_Odo_Straw_info;
	description = "Сколько стоит твое сено?";
};
func int DIA_Sekob_Odo_Straw_cond()
{
	if (C_HeroIs_Odo() && (MIS_Odo_Straw == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Sekob_Odo_Straw_info()
{
		AI_Output(other,self,"DIA_Sekob_Odo_Straw_03_00");	//Сколько стоит твое сено?
	AI_Output(self,other,"DIA_Sekob_Odo_Straw_13_01");	//19 золотых за тюк. 
	B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Sekob_Price);
	MIS_Odo_Straw_Sekob[Straw_Price] = 1;
};

/////////////////////////////////////// ОСТАЛЬНЫЕ /////////////////////////////////////////////

//===================================================
var int DIA_Sekob_MR_Perm_Others_once;
instance DIA_Sekob_MR_Perm_Others(C_Info)
{
	npc = BAU_930_Sekob;	nr = 50;
	condition = DIA_Sekob_MR_Perm_Others_Cond;
	information = DIA_Sekob_MR_Perm_Others_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Sekob_MR_Perm_Others_Cond()
{
	if (!C_HeroIs_Till() && !C_HeroIs_Elena()
		 && Npc_IsInState(self,ZS_Talk) && !DIA_Sekob_Odo_Straw_cond())	{
		return TRUE;
	};
};
func void DIA_Sekob_MR_Perm_Others_Info()
{
	if (DIA_Sekob_MR_Perm_Others_once == FALSE)	{
		AI_Output(self,other,"DIA_Sekob_MR_Perm_Others_01_00");	//Что ты делаешь в моем доме? Я не звал гостей. Убирайся!
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Sekob_MR_Perm_Others_03_01");	//Но...
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Sekob_MR_Perm_Others_07_01");	//Но...
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Sekob_MR_Perm_Others_10_01");	//Но...
		} else	{							//Сара
			AI_Output(other,self,"DIA_Sekob_MR_Perm_Others_16_01");	//Но...
		};
		DIA_Sekob_MR_Perm_Others_once = TRUE;
	};
	AI_Output(self,other,"DIA_Sekob_MR_Perm_Others_01_02");	//Я сказал - проваливай!
	AI_StopProcessInfos(self);
};
