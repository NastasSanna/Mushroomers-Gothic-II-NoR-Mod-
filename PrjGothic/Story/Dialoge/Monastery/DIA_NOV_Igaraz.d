

instance DIA_Igaraz_EXIT(DIA_Proto_End)
{
	npc = NOV_601_Igaraz;
};

/////////////////////////////////////// ОДО /////////////////////////////////////////////

//===================================================
instance DIA_Igaraz_NoTalk_Odo(C_Info)
{
	npc = NOV_601_Igaraz;			nr = 1;
	condition = DIA_Igaraz_NoTalk_Odo_Cond;
	information = DIA_Igaraz_NoTalk_Odo_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Igaraz_NoTalk_Odo_Cond()
{
	if (C_HeroIs_Odo() && DIA_WhenAsked_cond() && (Wld_IsTime(8,30,22,7)))	{
		return TRUE;
	};
};
func void DIA_Igaraz_NoTalk_Odo_Info()
{
	AI_Output(self,other,"DIA_Igaraz_NoTalk_Odo_13_00");	//Извини, но я сейчас слишком занят для разговоров.
	AI_StopProcessInfos(self);
};

//===================================================
var int DIA_Igaraz_MR_Perm_Odo_Once;
instance DIA_Igaraz_MR_Perm_Odo(C_Info)
{
	npc = NOV_601_Igaraz;			nr = 2;
	condition = DIA_Igaraz_MR_Perm_Odo_Cond;
	information = DIA_Igaraz_MR_Perm_Odo_Info;
	permanent = TRUE;
	description = "Почему ты всегда так занят?";
};
func int DIA_Igaraz_MR_Perm_Odo_Cond()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Igaraz_MR_Perm_Odo_Info()
{
	DIA_Igaraz_MR_Perm_Odo_Once = TRUE;
		AI_Output(other,self,"DIA_Igaraz_MR_Perm_Odo_03_00");	//Почему ты всегда так занят?
	AI_Output(self,other,"DIA_Igaraz_MR_Perm_Odo_13_01");	//Я постигаю секреты изготовления монастырского вина.
	AI_Output(self,other,"DIA_Igaraz_MR_Perm_Odo_13_02");	//Если мне не удастся стать магом, открою свою винокурню! (смеется)
	AI_Output(self,other,"DIA_Igaraz_MR_Perm_Odo_13_03");	//Шучу. Я уверен, что однажды Иннос выберет меня. Для этого я и работаю так упорно. 
};

//===================================================
instance DIA_Igaraz_Odo_Wine(C_Info)
{
	npc = NOV_601_Igaraz;			nr = 3;
	condition = DIA_Igaraz_Odo_Wine_Cond;
	information = DIA_Igaraz_Odo_Wine_Info;
	description = "Так ты знаешь все про наше вино?";
	permanent = TRUE;
};
func int DIA_Igaraz_Odo_Wine_Cond()
{
	if (C_HeroIs_Odo() && MIS_Odo_Wine_SecretAsk && DIA_Igaraz_MR_Perm_Odo_Once && !MIS_Odo_Wine_SecretGot)	{
		return TRUE;
	};
};
func void DIA_Igaraz_Odo_Wine_Info()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_03_00");	//Так ты знаешь все про наше вино?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_13_01");	//(с гордостью) Да, я выучился у мастера Горакса всему, что касается вина.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_13_02");	//Возможно, мне даже доверят винокурню, когда я стану Магом...
	Info_ClearChoices(DIA_Igaraz_Odo_Wine);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"Расскажи мне секрет вина, или я тебя поколочу!",DIA_Igaraz_Odo_Wine_Fight);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"Говорят, наше вино лучшее на острове.",DIA_Igaraz_Odo_Wine_Best);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"В чем же заключается секрет нашего вина?",DIA_Igaraz_Odo_Wine_AskSecret);
};
func void DIA_Igaraz_Odo_Wine_Best()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Best_03_00");	//Говорят, наше вино лучшее на острове, а может и во всей Миртане.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Best_13_01");	//Да, монастырское вино Хориниса известно почти так же, как и его рудники.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Best_13_02");	//У него особый букет и легкий, несладкий вкус.
	Info_ClearChoices(DIA_Igaraz_Odo_Wine);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"Расскажи мне секрет вина, или я тебя поколочу!",DIA_Igaraz_Odo_Wine_Fight);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"Много ли вина будет в этом году?",DIA_Igaraz_Odo_Wine_Much);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"Кто покупает наше вино?",DIA_Igaraz_Odo_Wine_Customers);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"Значит, наше вино готовят из особого сорта винограда?",DIA_Igaraz_Odo_Wine_Grape);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"В чем же заключается секрет нашего вина?",DIA_Igaraz_Odo_Wine_AskSecret);
};
func void DIA_Igaraz_Odo_Wine_Much()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Much_03_00");	//Много ли вина будет в этом году?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Much_13_01");	//Слава Инносу, у нас много хорошего винограда. Нам даже не хватает бочек, приходится готовить новые.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Much_13_02");	//А это не так-то просто, иначе можно испортить весь урожай.
	Info_ClearChoices(DIA_Igaraz_Odo_Wine);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"Расскажи мне секрет вина, или я тебя поколочу!",DIA_Igaraz_Odo_Wine_Fight);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"А что насчет бутылок?",DIA_Igaraz_Odo_Wine_Bottles);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"Значит, хорошие бочки - это так же важно?",DIA_Igaraz_Odo_Wine_Barrels);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"В чем же заключается секрет нашего вина?",DIA_Igaraz_Odo_Wine_AskSecret);
};
func void DIA_Igaraz_Odo_Wine_Barrels()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Barrels_03_00");	//Значит, хорошие бочки - это так же важно, как и хороший виноград?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Barrels_13_01");	//Конечно! Если бочку не приготовить, как надо, она передаст вину деревянный привкус.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Barrels_13_02");	//Или начнет течь. Или передаст запах старого вина. Или плесень пойдет.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Barrels_13_03");	//Поэтому бочки промывают и катают с водой. А перед заливкой вина, открою тебе секрет, бочку обязательно окуривают серой.
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Barrels_03_04");	//Серой?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Barrels_13_05");	//Да, сжигают в бочке фитиль, вымоченный в сере. Вино из такой бочки не закисает, не гниет и долго сохраняет свой вкус, запах и цвет.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Barrels_13_06");	//Этот способ применяют только в нашем Монастыре. Много лет назад его изобрел... (осекся)
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Barrels_13_07");	//Я не должен был говорить тебе этого! Ты меня совсем заболтал. Если Горакс узнает...
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Barrels_03_08");	//Я ему ничего не скажу, обещаю.
	AI_StopProcessInfos(self);
	MIS_Odo_Wine_SecretGot = TRUE;
	B_LogEntry(TOPIC_Odo_Wine,TOPIC_Odo_Wine_Igaraz);
	B_GivePlayerXP(XP_Odo_Herbs_WineSecret);
};
func void DIA_Igaraz_Odo_Wine_Bottles()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Bottles_03_00");	//А что насчет бутылок?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Bottles_13_01");	//Мы используем керамические сосуды. Каждая бутылка тщательно промывается, заполняется вином почти доверху и закрывается деревянной пробкой.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Bottles_13_02");	//Пробка заливается сургучом, на которую мастер Горакс лично ставит печать Монастыря.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Bottles_13_03");	//Вот, взгляни сам.
	B_GiveInvItems(self,other,ItFo_Wine,1);
	Info_ClearChoices(DIA_Igaraz_Odo_Wine);
};
func void DIA_Igaraz_Odo_Wine_Grape()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Grape_03_00");	//Значит, наше вино готовят из какого-то особого сорта винограда?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Grape_13_01");	//Вообще-то, мы используем несколько разных сортов. Главное, чтобы виноград был спелый и сочный.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Grape_13_02");	//Ягоды нужно тщательно перебрать, удалить все гнилые и незрелые. Но ни в коем случае не мыть.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Grape_13_03");	//Потом на специальной терке отделяют гребни. Некоторые советуют удалить и косточки, но я считаю, что они придают букету особую терпкую нотку.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Grape_13_04");	//Главное - не раздробить их, иначе они дадут горечь.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Grape_13_05");	//Знаешь, эти косточки вообще как камень преткновения, из чего бы ни делали вино - из винограда, яблок, груш или других плодов.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Grape_13_06");	//Вот, скажем, со сливой все понятно - ее косточки нужно удалять, они вредные. А груша...
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Grape_13_07");	//Кхм, кажется, я отвлекся. Так о чем мы говорили?
	Info_ClearChoices(DIA_Igaraz_Odo_Wine);
};
func void DIA_Igaraz_Odo_Wine_Customers()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Customers_03_00");	//Кто покупает наше вино?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Customers_13_01");	//Да все таверны на острове. А то ты не знаешь.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Customers_13_02");	//Еще мы отправляем часть губернатору, на материк и даже за Барьер.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Customers_13_03");	//Впрочем, последнее стараются не афишировать. Давай забудем, что я это тебе сказал.
	AI_StopProcessInfos(self);
};
func void DIA_Igaraz_Odo_Wine_AskSecret()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_AskSecret_03_00");	//В чем же заключается секрет нашего вина?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_AskSecret_13_01");	//Так я тебе и рассказал. На то он и секрет, чтобы его никто не знал.
	AI_StopProcessInfos(self);
};
func void DIA_Igaraz_Odo_Wine_Fight()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Fight_03_00");	//Расскажи мне секрет вина, или я тебя поколочу!
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Fight_13_01");	//Что? Ты хоть думаешь, что несешь?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Fight_13_02");	//Даже ЕСЛИ ты меня побьешь, я тебе ничего не расскажу. Зато нам обоим крепко влетит за драку. Тебе оно надо?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Fight_13_03");	//Давай просто забудем, что ты это сказал.
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Igaraz_Odo_StopTalk(C_Info)
{
	npc = NOV_601_Igaraz;			nr = 4;
	condition = DIA_Igaraz_Odo_StopTalk_Cond;
	information = DIA_Igaraz_Odo_StopTalk_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Igaraz_Odo_StopTalk_Cond()
{
	if (C_HeroIs_Odo() && DIA_WhenAsked_cond() && Wld_IsTime(22,7,8,30) && MIS_Odo_Wine_SecretGot)	{
		return TRUE;
	};
};
func void DIA_Igaraz_Odo_StopTalk_Info()
{
	if (Hlp_Random(100) < 50)	{
		AI_Output(self,other,"DIA_Igaraz_Odo_StopTalk_13_01");	//Знаешь, я с тобой уже наболтался.
	}
	else	{
		AI_Output(self,other,"DIA_Igaraz_Odo_StopTalk_13_02");	//В другой раз поговорим.
	};
	AI_StopProcessInfos(self);
};

