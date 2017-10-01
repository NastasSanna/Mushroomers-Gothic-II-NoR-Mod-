

instance DIA_Ulf_EXIT(DIA_Proto_End)
{
	npc = NOV_602_Ulf;
};

/////////////////////////////////////// ОДО /////////////////////////////////////////////

//===================================================
instance DIA_Ulf_Start_Odo(C_Info)
{
	npc = NOV_602_Ulf;		nr = 1;
	condition = DIA_Ulf_Start_Odo_Cond;
	information = DIA_Ulf_Start_Odo_Info;
	important = TRUE;
};
func int DIA_Ulf_Start_Odo_Cond()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Ulf_Start_Odo_Info()
{
	START_DIA_Finished = TRUE;
	AI_UseItemToState(other,ItMi_Broom,1);
	AI_GotoNpc(self,other);
	AI_WaitTillEnd(other,self);
	AI_UseItemToState(other,ItMi_Broom,-1);
		AI_Output(other,self,"DIA_Ulf_Start_Odo_03_00");	//Здравствуй, брат Ульф! Что нового в городе?
	AI_Output(self,other,"DIA_Ulf_Start_Odo_03_01");	//Да все как обычно... Пиво не подорожало, наше вино не подешевело, так что все в порядке! 
		AI_Output(other,self,"DIA_Ulf_Start_Odo_03_02");	//Понятно.
	AI_Output(self,other,"DIA_Ulf_Start_Odo_03_03");	//А, вспомнил! Городской алхимик, кажется, его зовут Константино, объявил конкурс по сбору грибов.
	AI_Output(self,other,"DIA_Ulf_Start_Odo_03_04");	//Сказал, что в течение ближайшей недели будет платить всем, кто принесет ему грибы. А в конце выдаст какой-то приз победителю.
		AI_Output(other,self,"DIA_Ulf_Start_Odo_03_05");	//Ты бы хотел пойти за грибами?
	AI_Output(self,other,"DIA_VLK_Start_Odo_03_06");	//Нет, мне это неинтересно.
		AI_Output(other,self,"DIA_Ulf_Start_Odo_03_07");	//А я неплохо разбираюсь в грибах... Жаль, что мне нельзя покидать монастырь. Мастер Парлан ни за что не разрешит мне.
	AI_Output(self,other,"DIA_Ulf_Start_Odo_03_08");	//А ты поговори с мастером Неорасом. Он все время жалуется, что ему не хватает ингредиентов для зелий. Может, ему и грибы нужны?
		AI_Output(other,self,"DIA_Ulf_Start_Odo_03_09");	//Спасибо за идею! Я немедленно пойду к мастеру.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"START");
};

//===================================================
instance DIA_Ulf_MR_Perm_Odo(C_Info)
{
	npc = NOV_602_Ulf;		nr = 2;
	condition = DIA_Ulf_Start_Odo_Cond;
	information = DIA_Ulf_MR_Perm_Odo_Info;
	permanent = TRUE;
	description = "Как у тебя дела?";
};
func void DIA_Ulf_MR_Perm_Odo_Info()
{
		AI_Output(other,self,"DIA_Ulf_MR_Perm_Odo_03_00");	//Как у тебя дела?
	AI_Output(self,other,"DIA_Ulf_MR_Perm_Odo_03_01");	//Мастер Парлан поручил мне ухаживать за часовней.
	AI_Output(self,other,"DIA_Ulf_MR_Perm_Odo_03_02");	//Так что я весь день смотрю, чтобы ни пылинки не осело на статую Инноса.
	AI_Output(self,other,"DIA_Ulf_MR_Perm_Odo_03_03");	//(заговорщически) Скука смертная!

};
//===================================================
instance DIA_Ulf_Thanks_Odo(C_Info)
{
	npc = NOV_602_Ulf;		nr = 3;
	condition = DIA_Ulf_Thanks_Odo_Cond;
	information = DIA_Ulf_Thanks_Odo_Info;
	description = "Еще раз спасибо!";
};
func int DIA_Ulf_Thanks_Odo_Cond()
{
	if (C_HeroIs_Odo() && Npc_KnowsInfo(other,DIA_Parlan_Start_Odo))	{
		return TRUE;
	};
};
func void DIA_Ulf_Thanks_Odo_Info()
{
		AI_Output(other,self,"DIA_Ulf_Thanks_Odo_03_00");	//Еще раз спасибо тебе!
		AI_Output(other,self,"DIA_Ulf_Thanks_Odo_03_01");	//Мастер Неорас действительно позволил мне отправиться на поиски трав.
	AI_Output(self,other,"DIA_Ulf_Thanks_Odo_03_02");	//Конечно, пожалуйста.
	AI_Output(self,other,"DIA_Ulf_Thanks_Odo_03_03");	//Но я бы не отказался от более материальной благодарности (подмигивает).
		AI_Output(other,self,"DIA_Ulf_Thanks_Odo_03_04");	//Ох! Чего бы ты хотел?
	AI_Output(self,other,"DIA_Ulf_Thanks_Odo_03_05");	//Дай-ка подумать... Знаю! Пиво! Свежее, темное, паладинское... Как я по нему скучаю.
		AI_Output(other,self,"DIA_Ulf_Thanks_Odo_03_06");	//Хорошо, я что-нибудь придумаю.
	B_LogNote(TOPIC_Misk,TOPIC_Misk_UlfBeer);
	Ulf_WannaBeer = TRUE;
};
//===================================================
instance DIA_Ulf_Beer_Odo(C_Info)
{
	npc = NOV_602_Ulf;		nr = 4;
	condition = DIA_Ulf_Beer_Odo_Cond;
	information = DIA_Ulf_Beer_Odo_Info;
	description = "Вот твое пиво!";
};
func int DIA_Ulf_Beer_Odo_Cond()
{
	if (C_HeroIs_Odo() && Ulf_WannaBeer && (Npc_HasItems(other,ItFo_Beer) > 0))	{
		return TRUE;
	};
};
func void DIA_Ulf_Beer_Odo_Info()
{
		AI_Output(other,self,"DIA_Ulf_Beer_Odo_03_00");	//Вот твое пиво!
	B_GiveInvItems(other,self,ItFo_Beer,1);
	CreateInvItems(self,ItFo_Beer,1);
	AI_UseItem(self,ItFo_Beer);
	AI_Output(self,other,"DIA_Ulf_Beer_Odo_03_01");	//(смакуя) Аах, вот оно, блаженство...
	AI_Output(self,other,"DIA_Ulf_Beer_Odo_03_02");	//Твоя благодарность достигла самых глубин моего естества.
	B_GivePlayerXP(XP_Ambient);
};
//===================================================
instance DIA_Ulf_Beer_MR_Perm_Odo(C_Info)
{
	npc = NOV_602_Ulf;		nr = 5;
	condition = DIA_Ulf_Beer_MR_Perm_Odo_Cond;
	information = DIA_Ulf_Beer_MR_Perm_Odo_Info;
	permanent = TRUE;
	description = "Хочешь еще пива?";
};
func int DIA_Ulf_Beer_MR_Perm_Odo_Cond()
{
	if (C_HeroIs_Odo() && Npc_KnowsInfo(other,DIA_Ulf_Beer_Odo) && (Npc_HasItems(other,ItFo_Beer) > 0))	{
		return TRUE;
	};
};
func void DIA_Ulf_Beer_MR_Perm_Odo_Info()
{
		AI_Output(other,self,"DIA_Ulf_Beer_MR_Perm_Odo_03_00");	//Хочешь еще пива?
	if (Ulf_Beer_Count < Wld_GetDay() * 3 + 5)	{
		AI_Output(self,other,"DIA_Ulf_Beer_MR_Perm_Odo_03_01");	//Что за вопрос? Давай!
		B_GiveInvItems(other,self,ItFo_Beer,1);
		AI_StandUp(self);
		AI_UseItem(self,ItFo_Beer);
		B_GivePlayerXP(XP_Ambient);
		Ulf_Beer_Count += 1;
	}
	else	{
		AI_Output(self,other,"DIA_Ulf_Beer_MR_Perm_Odo_03_02");	//Знаешь, в меня уже больше не лезет, ик! Может быть, завтра, ик,...
		IF ((Hlp_Random(100) < 50) && !Hlp_StrCmp(Npc_GetNearestWP(self),"NW_MONASTERY_GRASS_06"))	{
			Npc_ClearAIQueue(self);
			AI_StopProcessInfos(self);
			AI_SetWalkmode(self,NPC_RUN);
			AI_GotoWP(self,"NW_MONASTERY_GRASS_06");
			AI_StartState(self,ZS_Pee,0,"NW_MONASTERY_GRASS_06");
		};
	};
};
//===================================================
instance DIA_Ulf_Odo_Final(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 10;
	condition = DIA_Ulf_Odo_Final_Condition;
	information = DIA_Ulf_Odo_Final_Info;
	description = "Представляешь, я выиграл конкурс Константино.";
};
func int DIA_Ulf_Odo_Final_Condition()
{
	if ((C_HeroIs_Odo()) && (Competition_Result != Competition_Result_NONE))	{
		if (Competition_Result == Competition_Result_LOST)	{
			DIA_Ulf_Odo_Final.description = "Эх, не удалось мне победить в грибном конкурсе...";
		};
		return TRUE;
	};
};
func void DIA_Ulf_Odo_Final_Info()
{
	if (Competition_Result == Competition_Result_WON)	{
			AI_Output(other,self,"DIA_Ulf_Odo_Final_WON_03_00");	//Представляешь, я выиграл конкурс Константино.
		AI_Output(self,other,"DIA_Ulf_Odo_Final_03_WON_01");	//Повезло. И что там за приз?
			AI_Output(other,self,"DIA_Ulf_Odo_Final_WON_03_02");	//Книга о грибах. Константино ее сам написал.
		AI_Output(self,other,"DIA_Ulf_Odo_Final_WON_03_03");	//Просто книжка?
			AI_Output(other,self,"DIA_Ulf_Odo_Final_WON_03_04");	//Уникальный авторский экземпляр. С подписью автора.
	}
	else	{
			AI_Output(other,self,"DIA_Ulf_Odo_Final_LOST_03_01");	//Эх, не удалось мне победить в грибном конкурсе...
		AI_Output(self,other,"DIA_Ulf_Odo_Final_LOST_03_02");	//Да ладно, это в любом случае лучше, чем весь день мести кельи.
			AI_Output(other,self,"DIA_Ulf_Odo_Final_LOST_03_03");	//Точно.
	};
	if(Npc_HasItems(other,ItMi_Gold) > 100)	{
			AI_Output(other,self,"DIA_Ulf_Odo_Final_03_01");	//Зато он неплохо платил за собранные грибы.
		AI_Output(self,other,"DIA_Ulf_Odo_Final_03_02");	//Ну, тоже ничего.
	}
	else	{
			AI_Output(other,self,"DIA_Ulf_Odo_Final_03_03");	//Да я и не особо старался.
	};
};

