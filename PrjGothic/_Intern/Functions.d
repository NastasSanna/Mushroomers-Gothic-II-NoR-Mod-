func void Npc_SetToMad(var C_Npc self,var int seconds)
{
};
func void player_victim_is_immortal()
{
	PrintScreen("Copy Protection Error",-1,-1,FONT_Screen,5);
};
//                              GENERAL 

// проверяет, установлены ли в val ВСЕ флаги flags (логическое И)
func int HasFlags(var int val,	var int flags)
{
	if ((val & flags) == flags)
	{ 
		return TRUE;
	};
	return FALSE;
};

// проверяет, установлен ли в val хотя бы один флаг из flags (логическое ИЛИ)
func int HasAnyFlags(var int val,	var int flags)
{
	if ((val & flags) != 0)
	{ 
		return TRUE;
	};
	return FALSE;
};

// возвращает модуль числа
func int abs(var int val)
{
	if (val < 0)
	{ 
		return -val;
	};
	return val;
};

// деление с округлением x/d
func int div_round(var int x, var int d)
{
	var int Result; Result = x / d;
	if (d / 2 < x % d)	{
		return Result + 1;
	};
	return Result;
};

func string PriceToString(var int value, var int Brackets)
{
	var string Result;
	Result = IntToString(value);
	Result = ConcatStrings(Result, " зол.");
	if (Brackets == TRUE)
	{
		Result = ConcatStrings("(", Result);
		Result = ConcatStrings(Result, ")");
	};
	return Result;
};

func string CS3(var string str1, var string str2, var string str3)
{
	var string Result;
	Result = ConcatStrings(str1, str2);
	Result = ConcatStrings(Result, str3);
	return Result;
};

func string CS5(var string str1, var string str2, var string str3, var string str4, var string str5)
{
	var string Result;
	Result = ConcatStrings(str1, str2);
	Result = ConcatStrings(Result, str3);
	Result = ConcatStrings(Result, str4);
	Result = ConcatStrings(Result, str5);
	return Result;
};

func string B_BuildStrShulden(var int sum)
{
	var string str;
	str = ConcatStrings("Заплатить штраф (",InttoString(sum));
	str = ConcatStrings(str," зол.)");
	return str;
};
func string C_BuildPriceString(var string str, var int sum)
{
	str = ConcatStrings(str,PriceToString(sum, TRUE));
	return str;
};

// генератор псевдовлучайных чисел (линейный конгруэнтный метод)
//NS: в отличие от встроенного он будет выдавать одни и те же значения в одной игре, т.е. результат не изменится при банальной перезагрузке
// но если игрок изменит последовательность действий, может поменяться и результат
// "затравка" сбрасывается в начале каждой главы и при первом входе в каждый мир
var int Random_Seed;

// след. число случайной последовательности
func int _C_Random_Next(var int Value)
{
	var int New_Value;
	// если затравка не задана - взять случайное число, не более 16 бит длиной
	if (Value <= 0)
	{
		Value = Hlp_Random(1 << 15) + 1;
	};
	// высчитать новое случайное число (взять средние 16 бит)
	New_Value = ((Value * 16807 + 5) & 16776960) >> 8;
	return New_Value;
};

// Max_Value не должно превышать 2^16
func int C_Random(var int Max_Value)
{
	//новое число
	Random_Seed = _C_Random_Next(Random_Seed);
	// только для положительных
	if (Max_Value <= 0)
	{
		return 0;
	};
	// вернуть с учетом диапазона
	return Random_Seed % Max_Value;
};

//========================================

func void B_RemoveEquipped(var C_Npc slf)
// удалить все экипированное оружие (Npc_ClearInventory не удаляет)
{
	var C_ITEM weapon;
	var int weaponInst;
	if (Npc_HasEquippedMeleeWeapon(slf))	{
		weapon = Npc_GetEquippedMeleeWeapon(slf);
		weaponInst = Hlp_GetInstanceID(weapon);
		Npc_RemoveInvItem(slf,weaponInst);	
	};
	if (Npc_HasEquippedRangedWeapon(slf))	{
		weapon = Npc_GetEquippedRangedWeapon(slf);
		weaponInst = Hlp_GetInstanceID(weapon);
		Npc_RemoveInvItem(slf,weaponInst);	
	};
};

// =======================================================================
	
func int GetHour_Rec(var int h)
{
	if (h <= 0)
	{
		return 0;
	};
	if (Wld_IsTime(h, 0, 0, 0))
	{
		return h;
	};
	var int h0;
	h0 = GetHour_Rec(h - 1);
	return h0;
};	
	
func int C_GetHour()
{
	return GetHour_Rec(23);
};
	
func int GetMinute_Rec(var int h, var int m)
{
	if (m <= 0)
	{
		return 0;
	}
	else if (Wld_IsTime(h, m, 0, 0))
	{
		return m;
	};
	var int m0;
	m0 = GetMinute_Rec(h, m - 1);
	return m0;
};
	
func int C_GetMinute()
{
	var int h;
	h = C_GetHour();
	return GetMinute_Rec(h, 59);
};

func int C_GetMinutesFromStart()
{
	var int h;
	h = C_GetHour();
	return (Wld_GetDay() * 24 + h) * 60 + GetMinute_Rec(h, 59);
};

//отсчитывает дни, считая началом дня h
func int Wld_GetDay_Shifted(var int h)
{
	var int day;	day = Wld_GetDay();
	if (Wld_IsTime(0,0,h,0))	{
		day -= 1;
	};
	return day;
};

//сравнение времени: h1:m1 меньше (раньше) чем h2:m2?
func int C_TimeLesser(var int h1, var int m1, var int h2, var int m2)
{
	if ((h1 < h2) || ((h1 == h2) && (m1 < m2)))	{
		return TRUE;
	};
	return FALSE;
};

// ------------------------------------------------------------------

// перевести часы
func void B_SetTime(var int h, var int m)
{
	// если больше, чем на сутки - то как написано
	if(h >= 24)
	{
		Wld_SetTime(h, m);
	}
	// если меньше суток - проверить, не нужно или перевести на завтра
	else if(Wld_IsTime(0,0,h,m))
	{
		Wld_SetTime(h, m);
	}
	else
	{
		Wld_SetTime(h + 24, m);
	};
};

// перевести часы на несколько часов и минут
func void B_SetTimePlus(var int h, var int m)
{
	var int h_target;
	var int m_target;
	// сколько будет минут
	m_target = m + C_GetMinute();
	// сколько будет часов, учитывая, что минут может стать больше 60
	h_target = h + C_GetHour() + m_target / 60;
	// обрезать минуты
	m_target = m_target % 60;
	// установить время
	B_SetTime(h_target, m_target);	
};

//====================================================
func void B_InsertNpc(var int npc, var string WP)
{
	var C_NPC self_bkup;	self_bkup = Hlp_GetNpc(self);
	Wld_InsertNpc(npc,WP);
	self = Hlp_GetNpc(self_bkup);
};

//====================================================
func int C_NpcHasGold(var C_NPC npc, var int amount)
{
	if (Npc_HasItems(npc, ItMi_Gold) >= amount)	{
		return TRUE;
	};
	return FALSE;
};

//====================================================
func int C_NpcGetAttitude(var C_NPC slf, var C_NPC oth)
{
	var int Attitude;	Attitude = Npc_GetAttitude(slf,oth);
	if (Attitude > 3)	{
//		MEM_Debug(CS5("Attitude =",IntToString(Attitude),slf.name," other = ",oth.name));
		Attitude = Wld_GetGuildAttitude(slf.guild,oth.guild);
		if (Attitude > 3)	{
//			MEM_Debug(CS5("Wld_Attitude =",IntToString(Attitude),slf.name," other = ",oth.name));
			Attitude = 3;
		};
	};
	return Attitude;
};

//====================================================
func int C_NpcIs(var C_NPC npc, var C_NPC slf)
{
	if (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(slf))	{
		return TRUE;
	};
	return FALSE;
};

