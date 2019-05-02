
instance DIA_Grom_EXIT(DIA_Proto_End)
{
	npc = OUT_1204_Grom;
};

/////////////////////////////////////// ВСЕ /////////////////////////////////////////////

//===================================================
instance DIA_Grom_Hello(C_Info)
{
	npc = OUT_1204_Grom;				nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_Grom_MR_Hello_Info;
	description = "Приветствую!";
};
func void DIA_Grom_MR_Hello_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grom_MR_Hello_03_00");	//Приветствую!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grom_MR_Hello_07_00");	//Приветствую!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grom_MR_Hello_10_00");	//Приветствую!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grom_MR_Hello_14_00");	//Привет!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grom_MR_Hello_16_00");	//Приветствую!
	};
	if (Wld_IsTime(5,0,10,30))	{
		AI_Output(self,other,"DIA_Grom_MR_Hello_08_01a");	//Доброе утро!
	}
	else	if  (Wld_IsTime(10,30,17,00))	{
		AI_Output(self,other,"DIA_Grom_MR_Hello_08_01b");	//День добрый!
	}
	else	if  (Wld_IsTime(17,00,22,00))	{
		AI_Output(self,other,"DIA_Grom_MR_Hello_08_01c");	//Вечер добрый!
	}
	else	{
		AI_Output(self,other,"DIA_Grom_MR_Hello_08_01d");	//Доброй ночи!
	};
	AI_Output(self,other,"DIA_Grom_MR_Hello_08_02");	//Нечасто у меня бывают гости.
	AI_Output(self,other,"DIA_Grom_MR_Hello_08_03");	//Каким ветром тебя сюда занесло?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grom_MR_Hello_03_04");	//Грибы собираю.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grom_MR_Hello_07_04");	//Грибы собираю.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grom_MR_Hello_10_04");	//Грибы собираю.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grom_MR_Hello_14_04");	//Грибы собираю.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grom_MR_Hello_16_04");	//Грибы собираю.
	};
	AI_Output(self,other,"DIA_Grom_MR_Hello_08_05");	//Вон оно что! Дело доброе, грибов здесь много.
	AI_Output(self,other,"DIA_Grom_MR_Hello_08_06");	//Смотри, какие я на пеньках нашел! Вот только не знаю, съедобные ли они.
	B_GiveInvItems(self,other,ItMr_LadysEar,4);
	if (MR_Eaten[MR_LadysEar] > 0)	{
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Grom_MR_Hello_03_07");	//Ну, я пробовал, живой, как видишь. Только в голове от них шумит. 
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Grom_MR_Hello_07_07");	//Ну, я пробовал, живой, как видишь. Только в голове от них шумит.
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Grom_MR_Hello_10_07");	//Ну, я пробовал, живой, как видишь. Только в голове от них шумит.
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Grom_MR_Hello_14_07");	//Ну, я пробовал, живой, как видишь. Только в голове от них шумит.
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Grom_MR_Hello_16_07");	//Ну, я пробовала, и живая, как видишь. Только в голове от них шумит.
		};
		B_GivePlayerXP(XP_Cookery_ToldEatableRaw);
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Grom_MR_Hello_08_08a");	//Хмм,... А как ты их готовил?
		}
		else	{
			AI_Output(self,other,"DIA_Grom_MR_Hello_08_08b");	//Хмм,... А как ты их готовила?
		};
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Grom_MR_Hello_03_09");	//Готовил?
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Grom_MR_Hello_07_09");	//Готовил?
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Grom_MR_Hello_10_09");	//Готовил?
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Grom_MR_Hello_14_09");	//Готовил?
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Grom_MR_Hello_16_09");	//Готовила?
		};
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Grom_MR_Hello_08_10a");	//А ты что, сырыми их ел?
		}
		else	{
			AI_Output(self,other,"DIA_Grom_MR_Hello_08_10b");	//А ты что, сырыми их ела?
		};
		AI_Output(self,other,"DIA_Grom_MR_Hello_08_11");	//Я бы не рискнул. Можно же варить, жарить, тушить, сушить, мариновать, солить... Только знать как.
	}
	else	{//не ели
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Grom_MR_Hello_03_12");	//Не знаю. Надо спросить у Константино.
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Grom_MR_Hello_07_12");	//Не знаю. Надо спросить у Константино.
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Grom_MR_Hello_10_12");	//Не знаю. Надо спросить у Константино.
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Grom_MR_Hello_14_12");	//Не знаю. Надо спросить у Константино.
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Grom_MR_Hello_16_12");	//Не знаю. Надо спросить у Константино.
		};
		AI_Output(self,other,"DIA_Grom_MR_Hello_08_13");	//Да и рецептик бы не плохо вызнать. Варить, тушить, жарить, солить или мариновать... С какими специями, травами, овощами, мясом...
	};
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grom_MR_Hello_03_14");	//(со смехом) А я погляжу, ты в этом знаешь толк! Я постараюсь узнать рецепт.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grom_MR_Hello_07_14");	//(со смехом) А я погляжу, ты в этом знаешь толк! Я постараюсь узнать рецепт.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grom_MR_Hello_10_14");	//(со смехом) А я погляжу, ты в этом знаешь толк! Я постараюсь узнать рецепт.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grom_MR_Hello_14_14");	//(со смехом) А я погляжу, ты в этом знаешь толк! Я постараюсь узнать рецепт.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grom_MR_Hello_16_14");	//(со смехом) А я погляжу, ты в этом знаешь толк! Я постараюсь узнать рецепт.
	};
	MIS_Cookery = LOG_Running;
	B_LogEntry_Create(TOPIC_Cookery,LOG_MISSION,TOPIC_Cookery_Start);
	if (Npc_IsDead(BAU_913_Thekla))	{
		B_CloseLogOnDeath(BAU_913_Thekla);
	};
	if (Npc_IsDead(OUT_1203_Sagitta))	{
		B_CloseLogOnDeath(OUT_1203_Sagitta);
	};
	if (Npc_IsDead(BAU_951_Hilda))	{
		B_CloseLogOnDeath(BAU_951_Hilda);
	};
};


//===================================================
instance DIA_Grom_WhereRecipe(C_Info)
{
	npc = OUT_1204_Grom;				nr = 20;
	condition = DIA_Grom_WhereRecipe_Cond;
	information = DIA_Grom_WhereRecipe_Info;
	description = "Как думаешь, кто может знать рецепт?";
};
func int DIA_Grom_WhereRecipe_Cond()
{
	if (MIS_Cookery == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Grom_WhereRecipe_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grom_WhereRecipe_03_00");	//Как думаешь, кто может знать рецепт?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grom_WhereRecipe_07_00");	//Как думаешь, кто может знать рецепт?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grom_WhereRecipe_10_00");	//Как думаешь, кто может знать рецепт?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grom_WhereRecipe_14_00");	//Как думаешь, кто может знать рецепт?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grom_WhereRecipe_16_00");	//Как думаешь, кто может знать рецепт?
	};
	AI_Output(self,other,"DIA_Grom_WhereRecipe_08_01");	//Кухарка Текла может приготовить даже старый башмак, она наверняка знает какой-нибудь.
	AI_Output(self,other,"DIA_Grom_WhereRecipe_08_02");	//Может из крестьян еще кто знает, но не на ферме Онара, это точно.
	AI_Output(self,other,"DIA_Grom_WhereRecipe_08_03");	//Ну и господ алхимиков надо поспрашивать.
	AI_Output(self,other,"DIA_Grom_WhereRecipe_08_04");	//Да, еще Сагитта. Она хоть и ведьма, а про все, что в лесу растет, знает.
	B_LogEntry(TOPIC_Cookery, TOPIC_Cookery_WhereSearch);
};

//===================================================
instance DIA_Grom_ConstantinoTold(C_Info)
{
	npc = OUT_1204_Grom;				nr = 3;
	condition = DIA_Grom_ConstantinoTold_Cond;
	information = DIA_Grom_ConstantinoTold_Info;
	description = "Константино сказал, что гриб в принципе съедобный.";
};
func int DIA_Grom_ConstantinoTold_Cond()
{
	if ((MIS_Cookery == LOG_Running) && MIS_Cookery_ConstantinoAsked)	{
		return TRUE;
	};
};
func void DIA_Grom_ConstantinoTold_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_03_00");	//Константино сказал, что гриб в принципе съедобный.
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_03_01");	//Только надо вымочить его в воде три раза по три часа. Это уберет как вредные, так и полезные эфффекты.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_07_00");	//Константино сказал, что гриб в принципе съедобный.
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_07_01");	//Только надо вымочить его в воде три раза по три часа. Это уберет как вредные, так и полезные эфффекты.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_10_00");	//Константино сказал, что гриб в принципе съедобный.
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_10_01");	//Только надо вымочить его в воде три раза по три часа. Это уберет как вредные, так и полезные эфффекты.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_14_00");	//Константино сказал, что гриб в принципе съедобный.
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_14_01");	//Только надо вымочить его в воде три раза по три часа. Это уберет как вредные, так и полезные эфффекты.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_16_00");	//Константино сказал, что гриб в принципе съедобный.
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_16_01");	//Только надо вымочить его в воде три раза по три часа. Это уберет как вредные, так и полезные эфффекты.
	};
	AI_Output(self,other,"DIA_Grom_ConstantinoTold_08_02");	//Хорошо, только на рецепт это не похоже. Я как-то не привык грибы сырыми есть.
	if (!MIS_Cookery_Eatable)	{
		B_GivePlayerXP(XP_Cookery_ToldEatableRaw);
	};
};


//===================================================
instance DIA_Grom_GiveConstantinoRecipe(C_Info)
{
	npc = OUT_1204_Grom;				nr = 10;
	condition = DIA_Grom_GiveConstantinoRecipe_Cond;
	information = DIA_Grom_GiveConstantinoRecipe_Info;
	description = "Смотри, какой рецепт я нашел!";
};
func int DIA_Grom_GiveConstantinoRecipe_Cond()
{
	if ((MIS_Cookery == LOG_Running)
		 && Npc_HasItems(other,ItWr_EarRecipe_Constantino))	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Grom_GiveConstantinoRecipe.description = "Смотри, какой рецепт я нашла!";
		};
		return TRUE;
	};
};
func void DIA_Grom_GiveConstantinoRecipe_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_03_00");	//Смотри, какой рецепт я нашел!
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_03_01");	//Настойка на дамском ушке. Еле выторговал у Константино.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_07_00");	//Смотри, какой рецепт я нашел!
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_07_01");	//Настойка на дамском ушке. Еле выторговал у Константино.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_10_00");	//Смотри, какой рецепт я нашел!
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_10_01");	//Настойка на дамском ушке. Еле выторговал у Константино.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_14_00");	//Смотри, какой рецепт я нашел!
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_14_01");	//Настойка на дамском ушке. Еле выторговал у Константино.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_16_00");	//Смотри, какой рецепт я нашла!
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_16_01");	//Настойка на дамском ушке. Еле выторговала у Константино.
	};
	B_GiveInvItems(other,self,ItWr_EarRecipe_Constantino,1);
	AI_Output(self,other,"DIA_Grom_GiveConstantinoRecipe_08_02");	//Вот это интересно!
	MIS_Cookery_ConstantinoTold = TRUE;
	//читает
	CreateInvItem(self,Fakescroll);
	AI_UseItemToState(self,Fakescroll,1);
	AI_Wait(self,1);
	AI_UseItemToState(self,Fakescroll,-1);
	AI_Output(self,other,"DIA_Grom_GiveConstantinoRecipe_08_03");	//Так, болотник, крапива... Обязательно приготовлю!
	AI_Output(self,other,"DIA_Grom_GiveConstantinoRecipe_08_04");	//Вот, возьми этот пояс. В нем из лука стрелять ловчее.
	//пояс охотника +5 лвк
	B_GiveInvItems(self,other,ItBe_Addon_DEX_5,1);
	B_GivePlayerXP(XP_Cookery_ConstantinoTold);
	B_LogEntry_Cookery_SuccessAll(TOPIC_Cookery_ConstantinoGiven);
};
//===================================================
instance DIA_Grom_TellSagittaRecipe(C_Info)
{
	npc = OUT_1204_Grom;				nr = 11;
	condition = DIA_Grom_TellSagittaRecipe_Cond;
	information = DIA_Grom_TellSagittaRecipe_Info;
	description = "Сагитта посоветовала жарить ушки с коричневым масляком.";
};
func int DIA_Grom_TellSagittaRecipe_Cond()
{
	if ((MIS_Cookery == LOG_Running) && MIS_Cookery_SagittaAsked)	{
		return TRUE;
	};
};
func void DIA_Grom_TellSagittaRecipe_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_03_00");	//Сагитта посоветовала жарить ушки с коричневым масляком.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_03_01");	//Масляков нужно взять вдвое больше, чем ушек, а ушки сначала отварить в крепко соленой воде. Воду слить.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_03_02");	//Грибы обжарить на масле с любыми специями.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_07_00");	//Сагитта посоветовала жарить ушки с коричневым масляком.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_07_01");	//Масляков нужно взять вдвое больше, чем ушек, а ушки сначала отварить в крепко соленой воде. Воду слить.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_07_02");	//Грибы обжарить на масле с любыми специями.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_10_00");	//Сагитта посоветовала жарить ушки с коричневым масляком.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_10_01");	//Масляков нужно взять вдвое больше, чем ушек, а ушки сначала отварить в крепко соленой воде. Воду слить.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_10_02");	//Грибы обжарить на масле с любыми специями.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_14_00");	//Сагитта посоветовала жарить ушки с коричневым масляком.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_14_01");	//Масляков нужно взять вдвое больше, чем ушек, а ушки сначала отварить в крепко соленой воде. Воду слить.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_14_02");	//Грибы обжарить на масле с любыми специями.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_16_00");	//Сагитта посоветовала жарить ушки с коричневым масляком.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_16_01");	//Масляков нужно взять вдвое больше, чем ушек, а ушки сначала отварить в крепко соленой воде. Воду слить.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_16_02");	//Грибы обжарить на масле с любыми специями.
	};
	AI_Output(self,other,"DIA_Grom_TellSagittaRecipe_08_03");	//Со специями, говоришь? А у меня, кроме соли, ничего и нет.
	AI_Output(self,other,"DIA_Grom_TellSagittaRecipe_08_04");	//Может, ты сможешь достать что-нибудь остренькое?
	Info_ClearChoices(DIA_Grom_TellSagittaRecipe);
	Info_AddChoice(DIA_Grom_TellSagittaRecipe,"Извини, мне некогда.",DIA_Grom_TellSagittaRecipe_No);
	Info_AddChoice(DIA_Grom_TellSagittaRecipe,"Ладно.",DIA_Grom_TellSagittaRecipe_Yes);
};
func void DIA_Grom_TellSagittaRecipe_Thanks()
{
	AI_Output(self,other,"DIA_Grom_TellSagittaRecipe_Thanks_08_00");	//В любом случае, спасибо за рецепт. Я тут еще кое-каких грибов нашел, держи.
	//дает 2 бутылочника, 3 масляка, 2 кабанчика и 1 губернатор
	//B_GiveInvItems(self,other,ItMr_Bottle,2);
	//B_GiveInvItems(self,other,ItMr_BrownOiler,3);
	//B_GiveInvItems(self,other,ItMr_KeilSmall,2);
	//B_GiveInvItems(self,other,ItMr_Governor,1);
	B_LogEntry_Cookery_SuccessAll(TOPIC_Cookery_SagittaTold);
	B_GivePlayerXP(XP_Cookery_SagittaTold);
	MIS_Cookery_SagittaTold = TRUE;
	ItemTrans_items[0] = ItMr_Bottle;
	ItemTrans_amount[0] = 2;
	ItemTrans_items[1] = ItMr_BrownOiler;
	ItemTrans_amount[1] = 3;
	ItemTrans_items[2] = ItMr_KeilSmall;
	ItemTrans_amount[2] = 2;
	ItemTrans_items[3] = ItMr_Governor;
	ItemTrans_amount[3] = 1;
	B_ItemsTransaction(self,other);
};
func void DIA_Grom_TellSagittaRecipe_No()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_No_03_00");	//Извини, мне некогда.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_No_07_00");	//Извини, мне некогда.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_No_10_00");	//Извини, мне некогда.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_No_14_00");	//Извини, мне некогда.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_No_16_00");	//Извини, мне некогда.
	};
	AI_Output(self,other,"DIA_Grom_TellSagittaRecipe_No_08_01");	//Очень жаль.
	DIA_Grom_TellSagittaRecipe_Thanks();
	Info_ClearChoices(DIA_Grom_TellSagittaRecipe);
};
func void DIA_Grom_TellSagittaRecipe_Yes()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_Yes_03_00");	//Ладно.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_Yes_07_00");	//Ладно.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_Yes_10_00");	//Ладно.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_Yes_14_00");	//Ладно.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_Yes_16_00");	//Ладно.
	};
	B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_AskSpices);
	MIS_Cookery_AskSpices = TRUE;
	AI_Output(self,other,"DIA_Grom_TellSagittaRecipe_Yes_08_01");	//Спасибо. Вот, возьми 20 золотых - больше у меня, к сожалению, нет.
	B_GiveInvItems(self,other,ItMi_Gold,20);
	DIA_Grom_TellSagittaRecipe_Thanks();
	Info_ClearChoices(DIA_Grom_TellSagittaRecipe);
};



//===================================================
instance DIA_Grom_SpicesRed(C_Info)
{
	npc = OUT_1204_Grom;				nr = 20;
	condition = DIA_Grom_SpicesRed_Cond;
	information = DIA_Grom_SpicesRed_Info;
	description = "У меня для тебя есть красный перец.";
};
func int DIA_Grom_SpicesRed_Cond()
{
	if (MIS_Cookery_AskSpices
		 && Npc_HasItems(other,ItFo_Addon_Pfeffer_01))	{
		return TRUE;
	};
};
func void DIA_Grom_SpicesRed_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grom_SpicesRed_03_00");	//У меня для тебя есть красный перец.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grom_SpicesRed_07_00");	//У меня для тебя есть красный перец.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grom_SpicesRed_10_00");	//У меня для тебя есть красный перец.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grom_SpicesRed_14_00");	//У меня для тебя есть красный перец.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grom_SpicesRed_16_00");	//У меня для тебя есть красный перец.
	};
	B_GiveInvItems(other,self,ItFo_Addon_Pfeffer_01,1);
	AI_Output(self,other,"DIA_Grom_SpicesRed_08_01");	//О, это то, что надо! Надеюсь, я не разорил тебя.
	AI_Output(self,other,"DIA_Grom_SpicesRed_08_02");	//Я недавно рискнул подняться к старой шахте в горах. Там было полно мертвяков, так что я убежал.
	AI_Output(self,other,"DIA_Grom_SpicesRed_08_03");	//Но перед этим успел приметить кусок руды в дорожной пыли. Возьми, мне он вряд ли пригодится.
	B_GiveInvItems(self,other,ItMi_Nugget,1);
	MIS_Cookery_SpicesGiven = TRUE;
	B_GivePlayerXP(XP_Cookery_SpicesGiven);
	B_LogEntry_Cookery_SuccessAll(TOPIC_Cookery_SpicesGiven);	
};

//===================================================
instance DIA_Grom_GiveTheklaRecipe(C_Info)
{
	npc = OUT_1204_Grom;				nr = 12;
	condition = DIA_Grom_GiveTheklaRecipe_Cond;
	information = DIA_Grom_GiveTheklaRecipe_Info;
	description = "Вот тебе рецепт от Теклы.";
};
func int DIA_Grom_GiveTheklaRecipe_Cond()
{
	if ((MIS_Cookery == LOG_Running)
		 && Npc_HasItems(other,ItWr_EarRecipe_Thekla))	{
		return TRUE;
	};
};
func void DIA_Grom_GiveTheklaRecipe_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grom_GiveTheklaRecipe_03_00");	//Вот тебе рецепт от Теклы.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grom_GiveTheklaRecipe_07_00");	//Вот тебе рецепт от Теклы.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grom_GiveTheklaRecipe_10_00");	//Вот тебе рецепт от Теклы.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grom_GiveTheklaRecipe_14_00");	//Вот тебе рецепт от Теклы.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grom_GiveTheklaRecipe_16_00");	//Вот тебе рецепт от Теклы.
	};
	B_GiveInvItems(other,self,ItWr_EarRecipe_Thekla,1);
	AI_Output(self,other,"DIA_Grom_GiveTheklaRecipe_08_01");	//Я говорил, что она что хочешь приготовит?
	AI_Output(self,other,"DIA_Grom_GiveTheklaRecipe_08_02");	//Передай ей мой поклон. А тебе вот, ягод лесных. Последние в этом году!
	B_GiveInvItems(self,other,ItPl_Forestberry,10);
	MIS_Cookery_TheklaTold = TRUE;
	B_GivePlayerXP(XP_Cookery_TheklaTold);
	B_LogEntry_Cookery_SuccessAll(TOPIC_Cookery_TheklaGiven);
};

//===================================================
instance DIA_Grom_GiveHildaRecipe(C_Info)
{
	npc = OUT_1204_Grom;				nr = 13;
	condition = DIA_Grom_GiveHildaRecipe_Cond;
	information = DIA_Grom_GiveHildaRecipe_Info;
	description = "Я узнал, как мариновать твои грибы.";
};
func int DIA_Grom_GiveHildaRecipe_Cond()
{
	if ((MIS_Cookery == LOG_Running)
		 && Npc_HasItems(other,ItWr_EarRecipe_Hilda))	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Grom_GiveHildaRecipe.description = "Я узнала, как мариновать твои грибы.";
		};
		return TRUE;
	};
};
func void DIA_Grom_GiveHildaRecipe_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grom_GiveHildaRecipe_03_00");	//Я узнал, как мариновать твои грибы. Вот рецепт.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grom_GiveHildaRecipe_07_00");	//Я узнал, как мариновать твои грибы. Вот рецепт.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grom_GiveHildaRecipe_10_00");	//Я узнал, как мариновать твои грибы. Вот рецепт.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grom_GiveHildaRecipe_14_00");	//Я узнал, как мариновать твои грибы. Вот рецепт.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grom_GiveHildaRecipe_16_00");	//Я узнала, как мариновать твои грибы. Вот рецепт.
	};
	B_GiveInvItems(other,self,ItWr_EarRecipe_Hilda,1);
	AI_Output(self,other,"DIA_Grom_GiveHildaRecipe_08_01");	//О, маринованые грибочки, отлично!
	AI_Output(self,other,"DIA_Grom_GiveHildaRecipe_08_02");	//У меня не так много вещей, которые я бы мог подарить тебе...
	AI_Output(self,other,"DIA_Grom_GiveHildaRecipe_08_03");	//Вот, возьми эти стрелы. Думаю, ты найдешь им применение.
	B_GiveInvItems(self,other,ItRw_Arrow,50);
	MIS_Cookery_HildaTold = TRUE;
	B_GivePlayerXP(XP_Cookery_HildaTold);
	B_LogEntry_Cookery_SuccessAll(TOPIC_Cookery_HildaGiven);
};

