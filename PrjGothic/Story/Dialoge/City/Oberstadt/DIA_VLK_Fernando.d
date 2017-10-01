
//AMBIENT - EXIT не нужен


// Почта Хориниса ==============================================================
instance DIA_Fernando_FurFromHalvor(C_INFO)
{
	npc = VLK_405_Fernando;				nr = 1;
	condition = DIA_Fernando_FurFromHalvor_cond;
	information = DIA_Fernando_FurFromHalvor_info;
	description = "Ты заказывал кожу болотной акулы?";
};
func int DIA_Fernando_FurFromHalvor_cond()
{
	if (MIS_KhorinisPost_Stage_FromHalvor
		&& Npc_HasItems(other,ItAt_SharkSkin))	{
		return TRUE;
	};
};
func void DIA_Fernando_FurFromHalvor_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fernando_FurFromHalvor_03_00");	//Ты заказывал кожу болотной акулы?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fernando_FurFromHalvor_07_00");	//Ты заказывал кожу болотной акулы?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fernando_FurFromHalvor_10_00");	//Ты заказывал кожу болотной акулы?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fernando_FurFromHalvor_14_00");	//Ты заказывал кожу болотной акулы?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fernando_FurFromHalvor_16_00");	//Ты заказывал кожу болотной акулы?
	};
	AI_Output(self,other,"DIA_Fernando_FurFromHalvor_14_01");	//Да, наконец-то! Я ждал ее два месяца. Теперь, когда корабли почти не заходят в порт, достать товары с материка становится все труднее...
	AI_Output(self,other,"DIA_Fernando_FurFromHalvor_14_02");	//Вот твои деньги.
	//200зол., забирает кожу
	B_TradeItems(other,self,ItAt_SharkSkin,1,200);
	B_GivePlayerXP(XP_KhorinisPost_FernandoDelivered);
	MIS_KhorinisPost_FernandoDelivered = TRUE;
	B_LogEntry(TOPIC_KhorinisPost, TOPIC_KhorinisPost_FernandoDelivered);
	AI_StopProcessInfos(self);
};

// ==============================================================
instance DIA_Fernando_GiveMoney(C_INFO)
{
	npc = VLK_405_Fernando;				nr = 2;
	condition = DIA_Fernando_GiveMoney_cond;
	information = DIA_Fernando_GiveMoney_info;
	description = "А где еще 50 золотых?";
};
func int DIA_Fernando_GiveMoney_cond()
{
	if (MIS_KhorinisPost_FernandoDelivered)	{
		return TRUE;
	};
};
func void DIA_Fernando_GiveMoney_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fernando_GiveMoney_03_00");	//А где еще 50 золотых?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fernando_GiveMoney_07_00");	//А где еще 50 золотых?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fernando_GiveMoney_10_00");	//А где еще 50 золотых?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fernando_GiveMoney_14_00");	//А где еще 50 золотых?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fernando_GiveMoney_16_00");	//А где еще 50 золотых?
	};
	AI_Output(self,other,"DIA_Fernando_GiveMoney_14_01");	//Разве я тебе еще что-то должен?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Fernando_GiveMoney_03_02");	//Кожа стоит 250 золотых.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Fernando_GiveMoney_07_02");	//Кожа стоит 250 золотых.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Fernando_GiveMoney_10_02");	//Кожа стоит 250 золотых.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Fernando_GiveMoney_14_02");	//Кожа стоит 250 золотых.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Fernando_GiveMoney_16_02");	//Кожа стоит 250 золотых.
	};
	AI_Output(self,other,"DIA_Fernando_GiveMoney_14_03");	//Да? А я думал 200... Вот, держи.
	//дает еще 50зол.
	B_GiveGold(self,other,50);
	B_GivePlayerXP(XP_KhorinisPost_FernandoMoney);
	B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_FernandoMoney);
};
