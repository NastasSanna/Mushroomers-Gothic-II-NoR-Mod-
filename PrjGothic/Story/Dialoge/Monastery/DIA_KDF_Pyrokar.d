
instance DIA_Pyrokar_EXIT(DIA_Proto_End)
{
	npc = KDF_500_Pyrokar;
};

/////////////////////////////////////// ОДО /////////////////////////////////////////////

//===================================================
instance DIA_Pyrokar_Bless_Odo(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Bless_Odo_Cond;
	information = DIA_Pyrokar_Bless_Odo_Info;
	permanent = TRUE;
	description = "Я прошу Вашего благословления, мастер!";
};
func int DIA_Pyrokar_Bless_Odo_Cond()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Bless_Odo_Info()
{
		AI_Output(other,self,"DIA_Pyrokar_Bless_Odo_03_00");	//(смиренно) Я прошу Вашего благословления, мастер!
	AI_Output(self,other,"DIA_Pyrokar_Bless_Odo_11_01");	//Пусть твою дорогу всегда озаряет Свет Инноса, послушник.
	if (PATRONGOD == PATRONGOD_Innos)	{
		// выкл. дождь
		if (Wld_GetDay() != Fishers_Rain_Day)	{
			MEM_InitGlobalInst();
			MEM_SkyController.rainFX_timeStartRain = FLOATNULL;
			MEM_SkyController.rainFX_timeStopRain = FLOATNULL;
			MEM_SkyController.rainFX_renderLightning = FALSE;
		};
		if (!Odo_Bless_Innos_Once)	{
			B_BlessAttribute(other,ATR_MANA,2);
			Odo_Bless_Innos_Once = TRUE;
		};
	};
	if (PATRONGOD == PATRONGOD_Beliar)	{
		PrintScreen(PRINT_GOD_Beliar_Rage, -1, 55, FONT_Screen, 3);
		if (self.attribute[ATR_HITPOINTS] > 1)	{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] / 2;
		};
	};
};

// ================================== КРИМИНАЛ =========================================
instance DIA_Pyrokar_Crime(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_Crime_Condition;
	information = DIA_Pyrokar_Crime_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Pyrokar_Crime_Condition()
{
	if (B_GetGreatestPetzCrime(self) > 0)	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Crime_Info()
{
	HERO_Imprisoned = FALSE;
	//Одо не может откупиться
	if (C_HeroIs_Odo())	{
		AI_Output(self,other,"DIA_Pyrokar_Crime_Odo_11_00");	//Послушник! Ты осмелился грешить в стенах Монастыря!
		AI_Output(self,other,"DIA_Pyrokar_Crime_Odo_11_01");	//Мы тщательно обдумаем твое наказание.
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
		return;
	};
	var int crime;	crime = B_GetGreatestPetzCrime(self);
	Monastery_Schulden = B_GetTotalPetzCounter(self) + 100 * ABSOLUTIONLEVEL_Monastery;
	if (ABSOLUTIONLEVEL_Monastery == 0)	{
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_00");	//Ты осквернил это святое место своими нечестивыми поступками!
		}
		else	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_01");	//Как посмела ты принести скверну в это святое место?
		};
		if (Crime == CRIME_MURDER)	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_02");	//Убийство - это просто немыслимо!
		}
		else if (Crime == CRIME_THEFT)	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_03");	//Воровство - тяжкий грех.
		}
		else if (Crime == CRIME_ATTACK)	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_04");	//Здесь не место для драк.
		}
		else if (Crime == CRIME_SHEEPKILLER)	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_05");	//Эти овцы принадлежат монастырю. Ты не имеешь права проливать их кровь!
		};
	}
	else	{
		AI_Output(self,other,"DIA_Pyrokar_Crime_11_06");	//Ты снова грешишь перед лицом слуг Инноса!
	};
	
	if (Monastery_Schulden < 1000)	{
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_07");	//Ты должен раскаяться и искупить свою вину!
		}
		else	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_08");	//Ты должна раскаяться и искупить свою вину!
		};
		//B_Say_Gold(self,other,Monastery_Schulden);
		Info_ClearChoices(DIA_Pyrokar_Crime);
		Info_AddChoice(DIA_Pyrokar_Crime,"У меня нет столько денег.",DIA_Pyrokar_Crime_NoPay);
		Info_AddChoice(DIA_Pyrokar_Crime,B_BuildStrShulden(Monastery_Schulden),DIA_Pyrokar_Crime_Pay);
	}
	else	{
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_09");	//Твои преступления слишком велики, чтобы оцениваться золотом.
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_10");	//Возможно, работа на рудниках искупит часть из них.
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_11");	//Покайся и молись! Отведите его в город.
		}
		else	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_12");	//Греховодница! Покайся и молись, чтобы Иннос спас тебя, ибо земные власти уже не в силах помочь!
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_13");	//Возможно, заключение в городской тюрьме вразумит тебя.
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_14");	//Отведите ее в город!
		};
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
	};
};

func void DIA_Pyrokar_Crime_Pay()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Pyrokar_Crime_Pay_03_00");	//Я хочу искупить свои грехи!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Pyrokar_Crime_Pay_07_00");	//Я хочу искупить свои грехи!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Pyrokar_Crime_Pay_10_00");	//Я хочу искупить свои грехи!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Pyrokar_Crime_Pay_14_00");	//Я хочу искупить свои грехи!
	} else	{							//Сара
		AI_Output(other,self,"DIA_Pyrokar_Crime_Pay_16_00");	//Я хочу искупить свои грехи!
	};
	if (C_NpcHasGold(other,Farms_Schulden))	{
		B_GiveInvItems(other,self,ItMi_Gold,Farms_Schulden);
		AI_Output(self,other,"DIA_Pyrokar_Crime_Pay_14_01");	//Хорошо, твоя вина забыта. А теперь покинь эти стены, немедленно!
		B_GrantAbsolution(LOC_MONASTERY);
		AI_StopProcessInfos(self);
		Hero_ThrowOut_Monastery = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_Crime_Pay_14_02");	//Тогда тебе потребуется золото, доказывающее твою искренность.
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
	};
};
	
func void DIA_Pyrokar_Crime_NoPay()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Pyrokar_Crime_NoPay_03_00");	//У меня нет столько денег!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Pyrokar_Crime_NoPay_07_00");	//У меня нет столько денег!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Pyrokar_Crime_NoPay_10_00");	//У меня нет столько денег!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Pyrokar_Crime_NoPay_14_00");	//У меня нет столько денег!
	} else	{							//Сара
		AI_Output(other,self,"DIA_Pyrokar_Crime_NoPay_16_00");	//У меня нет столько денег!
	};
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Pyrokar_Crime_NoPay_14_01");	//В таком случае, тебе придется искупить свою вину на Рудниках.
	}
	else	{
		AI_Output(self,other,"DIA_Pyrokar_Crime_NoPay_14_02");	//Тогда заключение в городской тюрьме поможет тебе искупить грехи.
	};
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
};



