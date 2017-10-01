/**************************************************************************

					ОБРАБОТЧИКИ СЧЕТЧИКОВ ПРЕСТУПЛЕНИЙ ГГ

  Сами обработчики вызываются для конкретного персонажа. Для вычислений
используются рекурсивные функции с указанием индексов локации и преступления. 
  При изменении лагерей переписать
C_GetPetzcounter, B_SetPetzcounter, B_ChangePetzCounter и
B_GrantAbsolution; остальные не трогать.


Обработчики:

B_GetPlayerCrime	(slf)

  Возвращает тип преступления ГГ (CRIME_x), которое видел персонаж slf (я).
Берется из AIV_NpcSawPlayerCommit.
  Срок давности мелких преступлений (драка и убийство овцы) - 2 дня.
Если прошло больше, считается, что преступления не было. Кража и убийство
не имеют срока давности. Если ГГ искупил свою вину, преступление прощается.
  
B_DeletePetzCrime	(slf)

  Персонаж slf снимает с ГГ обвинения в преступлении, записанном 
в AIV_NpcSawPlayerCommit. Уменьшается счетчик преступлений для лагеря,
к которому принадлежит slf.
  Вызывется при применении заклинания чар (забвения), смерти slf и по сюжету,
а также чтобы переписать преступление на более серьезное. Т.е. если slf видел,
что ГГ совершил, например, кражу и убийство, будет засчитано только убийство.

B_GrantAbsolution	(location)

  ГГ получает прощение всех преступлений в лагере location.
  Репутация ГГ повышается, а все счетчики преступлений сбрасываются.
  Возможен сброс счетчиков преступлений во всех лагерях, кроме лагеря 
бандитов (LOC_ALL).

B_GetTotalPetzCounter	(slf)

  Возвращает общее количество преступлений ГГ в лагере slf.
  
B_GetCurrentAbsolutionLevel	(slf)

  Возвращает индекс самого серьезного преступления ГГ в лагере slf.
  Используется в диалогах, чтобы выдать комментарий, соответствующий
криминальному авторитету ГГ.

B_AddPetzCrime	(slf,	crime)

  Персонаж slf доносит, что ГГ совершил преступление crime. Увеличивается 
счетчик преступлений для лагеря, к которому принадлежит slf.
 
***************************************************************************/

// СЧЕТЧИКИ ПРЕСТУПЛЕНИЙ ПО ЛАГЕРЯМ =======================================
// 0-вой элемент массива не учитывается, это CRIME_NONE

// узнать
func int C_GetPetzcounter(var int location, var int Crime)
{
	if ((Crime > 0) && (Crime < CRIME_COUNT))
	{
		var int cnt;	cnt = 0;
		// проверить лагерь
		if (location == LOC_OLDCAMP)		//старый лагерь
		{
			if (crime == 1)	{return PETZCOUNTER_OldCamp[1];}	else
			if (crime == 2)	{return PETZCOUNTER_OldCamp[2];}	else
			if (crime == 3)	{return PETZCOUNTER_OldCamp[3];}	else
			if (crime == 4)	{return PETZCOUNTER_OldCamp[4];};
		}
		else if (location == LOC_CITY)		//город
		{
			if (crime == 1)	{return PETZCOUNTER_City[1];}	else
			if (crime == 2)	{return PETZCOUNTER_City[2];}	else
			if (crime == 3)	{return PETZCOUNTER_City[3];}	else
			if (crime == 4)	{return PETZCOUNTER_City[4];};
		}
		else if (location == LOC_MONASTERY)	//монастырь
		{
			if (crime == 1)	{return PETZCOUNTER_Monastery[1];}	else
			if (crime == 2)	{return PETZCOUNTER_Monastery[2];}	else
			if (crime == 3)	{return PETZCOUNTER_Monastery[3];}	else
			if (crime == 4)	{return PETZCOUNTER_Monastery[4];};
		}
		else if (location == LOC_FARM)		//ферма
		{
			if (crime == 1)	{return PETZCOUNTER_Farm[1];}	else
			if (crime == 2)	{return PETZCOUNTER_Farm[2];}	else
			if (crime == 3)	{return PETZCOUNTER_Farm[3];}	else
			if (crime == 4)	{return PETZCOUNTER_Farm[4];};
		}
		else if (location == LOC_BL)		//лагерь бандитов
		{
			if (crime == 1)	{return PETZCOUNTER_BL[1];}	else
			if (crime == 2)	{return PETZCOUNTER_BL[2];}	else
			if (crime == 3)	{return PETZCOUNTER_BL[3];}	else
			if (crime == 4)	{return PETZCOUNTER_BL[4];};
		}
		else if (location == LOC_ALL)		//все лагеря, кроме бандитского
		{
			return C_GetPetzcounter(LOC_OLDCAMP,Crime) + C_GetPetzcounter(LOC_CITY,Crime)
				+ C_GetPetzcounter(LOC_MONASTERY,Crime) + C_GetPetzcounter(LOC_FARM,Crime);
		};
		// иначе - нет такого лагеря
		return cnt;
	};
	// иначе - нет такого преступления
	return 0;	
};

// задать
func void B_SetPetzcounter(var int location, var int Crime, var int Value)
{
	if ((Crime > 0) && (Crime < CRIME_COUNT))
	{
		// проверить лагерь
		if ((location == LOC_OLDCAMP) || (location == LOC_ALL))		//старый лагерь
		{
			if (crime == 1)	{PETZCOUNTER_OldCamp[1] = value;}	else
			if (crime == 2)	{PETZCOUNTER_OldCamp[2] = value;}	else
			if (crime == 3)	{PETZCOUNTER_OldCamp[3] = value;}	else
			if (crime == 4)	{PETZCOUNTER_OldCamp[4] = value;};
		}
		else if ((location == LOC_CITY) || (location == LOC_ALL))		//город
		{
			if (crime == 1)	{PETZCOUNTER_City[1] = value;}	else
			if (crime == 2)	{PETZCOUNTER_City[2] = value;}	else
			if (crime == 3)	{PETZCOUNTER_City[3] = value;}	else
			if (crime == 4)	{PETZCOUNTER_City[4] = value;};
		}
		else if ((location == LOC_MONASTERY) || (location == LOC_ALL))	//монастырь
		{
			if (crime == 1)	{PETZCOUNTER_Monastery[1] = value;}	else
			if (crime == 2)	{PETZCOUNTER_Monastery[2] = value;}	else
			if (crime == 3)	{PETZCOUNTER_Monastery[3] = value;}	else
			if (crime == 4)	{PETZCOUNTER_Monastery[4] = value;};
		}
		else if ((location == LOC_FARM) || (location == LOC_ALL))		//ферма
		{
			if (crime == 1)	{PETZCOUNTER_Farm[1] = value;}	else
			if (crime == 2)	{PETZCOUNTER_Farm[2] = value;}	else
			if (crime == 3)	{PETZCOUNTER_Farm[3] = value;}	else
			if (crime == 4)	{PETZCOUNTER_Farm[4] = value;};
		}
		else if ((location == LOC_BL) || (location == LOC_ALL))		//лагерь бандитов
		{
			if (crime == 1)	{PETZCOUNTER_BL[1] = value;}	else
			if (crime == 2)	{PETZCOUNTER_BL[2] = value;}	else
			if (crime == 3)	{PETZCOUNTER_BL[3] = value;}	else
			if (crime == 4)	{PETZCOUNTER_BL[4] = value;};
		};
	};
};

// репутация ГГ в текущем лагере
func int B_GetCurrentAbsolutionLevel(var C_Npc slf)
{
	if(C_NpcBelongsToOldCamp(slf))		 // в Старом лагере
	{
		return ABSOLUTIONLEVEL_OldCamp;
	};
	if(C_NpcBelongsToCity(slf))			// в городе
	{
		return ABSOLUTIONLEVEL_City;
	};
	if(C_NpcBelongsToMonastery(slf))	// в монастыре
	{
		return ABSOLUTIONLEVEL_Monastery;
	};
	if(C_NpcBelongsToFarm(slf))			// на ферме
	{
		return ABSOLUTIONLEVEL_Farm;
	};
	if(C_NpcBelongsToBL(slf))			// в лагере бандитов
	{
		return ABSOLUTIONLEVEL_BL;
	};
	return 0;
};

// ========================================================

// сброс всех счетчиков преступлений в лагере
func void B_ResetPetzcounters(var int location)
{
	B_SetPetzcounter(location, 0, 0);
	B_SetPetzcounter(location, 1, 0);
	B_SetPetzcounter(location, 2, 0);
	B_SetPetzcounter(location, 3, 0);
	B_SetPetzcounter(location, 4, 0);
};

// суммирование числа всех преступлений в лагере
func int C_SumPetzcounters(var int location)
{
	var int Sum;	sum = 0;
	Sum = C_GetPetzcounter(Location, CRIME_MURDER) * 200 + C_GetPetzcounter(Location, CRIME_THEFT) * 50 
			+ C_GetPetzcounter(Location, CRIME_ATTACK) * 20 + C_GetPetzcounter(Location, CRIME_SHEEPKILLER) * 20; 
	return Sum;
};

// ОБРАБОТЧИКИ ============================================================

// сколько всего у ГГ преступлений
func int B_GetTotalPetzCounter(var C_Npc slf)
{
	var int Location;	Location = C_GetNpcLocation(slf);
	var int sum;
	sum = C_GetPetzcounter(Location, CRIME_MURDER) * 500 + C_GetPetzcounter(Location, CRIME_THEFT) * 100 
			+ C_GetPetzcounter(Location, CRIME_ATTACK) * 40 + C_GetPetzcounter(Location, CRIME_SHEEPKILLER) * 50;
	return sum;
};


// какое самое тяжкое преступление в этом регионе
func int B_GetGreatestPetzCrime(var C_Npc slf)
{
	var int loc;	loc = C_GetNpcLocation(slf);
	if (C_GetPetzcounter(loc,4) > 0)	{return 4;}	else
	if (C_GetPetzcounter(loc,3) > 0)	{return 3;}	else
	if (C_GetPetzcounter(loc,2) > 0)	{return 2;}	else
	if (C_GetPetzcounter(loc,1) > 0)	{return 1;};
	return 0;
};

// вспомнить преступление ГГ
func int B_GetPlayerCrime(var C_Npc slf)
{
	// Считать, что преступления не было, если -----------------------------
	
	// ГГ расплатился с частью преступлений (репутация повысилась)
	if(slf.aivar[AIV_CrimeAbsolutionLevel] < B_GetCurrentAbsolutionLevel(slf))
	{
		//PB: для NPC, не из города/монастыря/с фермы 
		// B_GetCurrentAbsolutionLevel всегда возвращает 0 и сравнение будет ложно
		//NS: для Старого лагеря и лагеря бандтов искупление тоже работает 
		return CRIME_NONE;
	};
	
	// соверешено несерьезное преступление
	if(slf.aivar[AIV_NpcSawPlayerCommit] <= CRIME_ATTACK)
	{
		// и прошло больше 2 дней
		if(slf.aivar[AIV_NpcSawPlayerCommitDay] < (Wld_GetDay() - 2))
		{
			return CRIME_NONE;
		};
	};
	
	
	// Во всех остальных случаях -------------------------------------------
	
	// вспомнить последнее преступление, совершенное ГГ
	return slf.aivar[AIV_NpcSawPlayerCommit];
};

//добавляет преступления против других, если нужно
func int B_GetKnownPlayerCrime(var C_Npc slf)
{
	var int crime;	crime = B_GetPlayerCrime(slf);
	if (B_GetGreatestPetzCrime(slf) > crime)	{
		if (C_NpcBelongsToFarm(slf) || C_NpcBelongsToMonastery(slf) || (slf.guild == GIL_MIL)
			&& !HasFlags(slf.aivar[AIV_StoryFlags],STORY_OutOfCamp))	{
			crime = B_GetGreatestPetzCrime(slf);
		};
	};
	return crime;
};

// простить ГГ все
func void B_GrantAbsolution(var int location)
{
	// если прощение получено для Старого лагеря или всех лагерей
	if((location == LOC_OLDCAMP) || (location == LOC_ALL))
	{
		// повысить репутацию
		ABSOLUTIONLEVEL_OldCamp = ABSOLUTIONLEVEL_OldCamp + 1;
		// сбросить счетчики преступлений
		B_ResetPetzcounters(LOC_OLDCAMP);
	};
	// аналогично для города
	if((location == LOC_CITY) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_City = ABSOLUTIONLEVEL_City + 1;
		B_ResetPetzcounters(LOC_CITY);
	};
	// аналогично для монастыря
	if((location == LOC_MONASTERY) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_Monastery = ABSOLUTIONLEVEL_Monastery + 1;
		B_ResetPetzcounters(LOC_MONASTERY);
	};
	// аналогично для фермы
	if((location == LOC_FARM) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_Farm = ABSOLUTIONLEVEL_Farm + 1;
		B_ResetPetzcounters(LOC_FARM);
	};
	// аналогично для лагеря бандитов (кроме всепрощения)
	if(location == LOC_BL)
	{
		ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
		B_ResetPetzcounters(LOC_BL);
	};
};




// добавить преступление
func void B_AddPetzCrime(var C_Npc slf,var int crime)
{  //увеличить счетчик за соответствующее преступление в лагере персонажа
	
	if(C_NpcBelongsToOldCamp(slf)) //если персонаж из Старого лагеря
	{
		if (crime == 1)	{PETZCOUNTER_OldCamp[1] +=1;}	else
		if (crime == 2)	{PETZCOUNTER_OldCamp[2] +=1;}	else
		if (crime == 3)	{PETZCOUNTER_OldCamp[3] +=1;}	else
		if (crime == 4)	{PETZCOUNTER_OldCamp[4] +=1;};
	};
	if(C_NpcBelongsToCity(slf)) //аналогичто для города
	{
		if (crime == 1)	{PETZCOUNTER_City[1] +=1;}	else
		if (crime == 2)	{PETZCOUNTER_City[2] +=1;}	else
		if (crime == 3)	{PETZCOUNTER_City[3] +=1;}	else
		if (crime == 4)	{PETZCOUNTER_City[4] +=1;};
	};
	if(C_NpcBelongsToMonastery(slf)) //аналогичто для монастыря
	{
		if (crime == 1)	{PETZCOUNTER_Monastery[1] +=1;}	else
		if (crime == 2)	{PETZCOUNTER_Monastery[2] +=1;}	else
		if (crime == 3)	{PETZCOUNTER_Monastery[3] +=1;}	else
		if (crime == 4)	{PETZCOUNTER_Monastery[4] +=1;};
	};
	if(C_NpcBelongsToFarm(slf)) //аналогичто для фермы Онара
	{
		if (crime == 1)	{PETZCOUNTER_Farm[1] +=1;}	else
		if (crime == 2)	{PETZCOUNTER_Farm[2] +=1;}	else
		if (crime == 3)	{PETZCOUNTER_Farm[3] +=1;}	else
		if (crime == 4)	{PETZCOUNTER_Farm[4] +=1;};
	};
	if(C_NpcBelongsToBL(slf)) //аналогичто для лягеря бандитов, только без овец
	{
	//	if (crime == 1)	{PETZCOUNTER_BL[1] +=1;}	else
		if (crime == 2)	{PETZCOUNTER_BL[2] +=1;}	else
		if (crime == 3)	{PETZCOUNTER_BL[3] +=1;}	else
		if (crime == 4)	{PETZCOUNTER_BL[4] +=1;};
	};
};


// снять с ГГ обвинение
func void B_DeletePetzCrime(var C_Npc slf)
{
	var int crime;	crime = B_GetPlayerCrime(slf);
	if (Crime == CRIME_None) 	{return;};
	if(C_NpcBelongsToOldCamp(slf)) //если персонаж из Старого лагеря
	{
		if (crime == 1)	{PETZCOUNTER_OldCamp[1] -=1;}	else
		if (crime == 2)	{PETZCOUNTER_OldCamp[2] -=1;}	else
		if (crime == 3)	{PETZCOUNTER_OldCamp[3] -=1;}	else
		if (crime == 4)	{PETZCOUNTER_OldCamp[4] -=1;};
	};
	if(C_NpcBelongsToCity(slf)) //аналогичто для города
	{
		if (crime == 1)	{PETZCOUNTER_City[1] -=1;}	else
		if (crime == 2)	{PETZCOUNTER_City[2] -=1;}	else
		if (crime == 3)	{PETZCOUNTER_City[3] -=1;}	else
		if (crime == 4)	{PETZCOUNTER_City[4] -=1;};
	};
	if(C_NpcBelongsToMonastery(slf)) //аналогичто для монастыря
	{
		if (crime == 1)	{PETZCOUNTER_Monastery[1] -=1;}	else
		if (crime == 2)	{PETZCOUNTER_Monastery[2] -=1;}	else
		if (crime == 3)	{PETZCOUNTER_Monastery[3] -=1;}	else
		if (crime == 4)	{PETZCOUNTER_Monastery[4] -=1;};
	};
	if(C_NpcBelongsToFarm(slf)) //аналогичто для фермы Онара
	{
		if (crime == 1)	{PETZCOUNTER_Farm[1] -=1;}	else
		if (crime == 2)	{PETZCOUNTER_Farm[2] -=1;}	else
		if (crime == 3)	{PETZCOUNTER_Farm[3] -=1;}	else
		if (crime == 4)	{PETZCOUNTER_Farm[4] -=1;};
	};
	if(C_NpcBelongsToBL(slf)) //аналогичто для лягеря бандитов, только без овец
	{
		//if (crime == 1)	{PETZCOUNTER_BL[1] -=1;}	else
		if (crime == 2)	{PETZCOUNTER_BL[2] -=1;}	else
		if (crime == 3)	{PETZCOUNTER_BL[3] -=1;}	else
		if (crime == 4)	{PETZCOUNTER_BL[4] -=1;};
	};
};



