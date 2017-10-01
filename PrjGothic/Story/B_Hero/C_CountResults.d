
func int C_GetHeroScore()
{
	var int Result; Result = 0;
	var int i;	i = 0;
	while (i < MR_Count);
		Result += MEM_ReadStatArr(MR_Counter, i) * MEM_ReadStatArr(MR_Price, i);
		i += 1;
	end;
	return Result;
};

//победитель из конкурентов?
func void B_CountCompetitorsResults()
{
	Competition_WinnerScore = 0;
	if (Competition_WinnerScore < MR_Counter_Elena)	{
		Competition_Winner = Hlp_GetInstanceID(CMP_Elena);
		Competition_WinnerScore = MR_Counter_Elena;	
	};
	if (Competition_WinnerScore < MR_Counter_Erol)	{
		Competition_Winner = Hlp_GetInstanceID(CMP_Erol);
		Competition_WinnerScore = MR_Counter_Erol;	
	};
	if (Competition_WinnerScore < MR_Counter_Odo)	{
		Competition_Winner = Hlp_GetInstanceID(CMP_Odo);
		Competition_WinnerScore = MR_Counter_Odo;	
	};
	if (Competition_WinnerScore < MR_Counter_Rupert)	{
		Competition_Winner = Hlp_GetInstanceID(CMP_Rupert);
		Competition_WinnerScore = MR_Counter_Rupert;	
	};
	if (Competition_WinnerScore < MR_Counter_Sarah)	{
		Competition_Winner = Hlp_GetInstanceID(CMP_Sarah);
		Competition_WinnerScore = MR_Counter_Sarah;	
	};
	if (Competition_WinnerScore < MR_Counter_Talbin)	{
		Competition_Winner = Hlp_GetInstanceID(CMP_Talbin);
		Competition_WinnerScore = MR_Counter_Talbin;	
	};
	if (Competition_WinnerScore < MR_Counter_Till)	{
		Competition_Winner = Hlp_GetInstanceID(CMP_Till);
		Competition_WinnerScore = MR_Counter_Till;	
	};
};
//подвести итоги конкурса
//возвращает Competition_Result_WON или Competition_Result_LOST
func int C_CountResults()
{
	var int HERO_Score;	HERO_Score = C_GetHeroScore();
	
	if (HERO_Score == 0)	{
		return Competition_Result_NONE;
	};
	
	B_CountCompetitorsResults();
	
	if (HERO_Score < Competition_WinnerScore)	{
		return Competition_Result_LOST;
	};
	Competition_WinnerScore = HERO_Score;
	Competition_Winner = Hlp_GetInstanceID(hero);
	return Competition_Result_WON;
};

func void B_CreateInvMroom(var C_NPC npc, var int MR_Index)
{
	if (MR_Index == MR_01)			{CreateInvItem(npc,ItPl_Mushroom_01);}	else
	if (MR_Index == MR_02)			{CreateInvItem(npc,ItPl_Mushroom_02);}	else
	if (MR_Index == MR_Bottle)		{CreateInvItem(npc,ItMr_Bottle);}	else
	if (MR_Index == MR_Branch)		{CreateInvItem(npc,ItMr_Branch);}	else
	if (MR_Index == MR_BrownOiler)	{CreateInvItem(npc,ItMr_BrownOiler);}	else
	if (MR_Index == MR_DragonTears)	{CreateInvItem(npc,ItMr_DragonTears);}	else
	if (MR_Index == MR_Foggy)		{CreateInvItem(npc,ItMr_Foggy);}	else
	if (MR_Index == MR_GoldPlate)	{CreateInvItem(npc,ItMr_GoldPlate);} else
	if (MR_Index == MR_Governor)	{CreateInvItem(npc,ItMr_Governor);}	else
	if (MR_Index == MR_Heart)		{CreateInvItem(npc,ItMr_Heart);} else
	if (MR_Index == MR_Ivy)			{CreateInvItem(npc,ItMr_Ivy);}	else
	if (MR_Index == MR_Keil)		{CreateInvItem(npc,ItMr_KeilSmall);}	else
	if (MR_Index == MR_LadysEar)	{CreateInvItem(npc,ItMr_LadysEar);}	else
	if (MR_Index == MR_NightSparkles)	{CreateInvItem(npc,ItMr_NightSparkles);}	else
	if (MR_Index == MR_Oyster)		{CreateInvItem(npc,ItMr_Oyster);}	else
	if (MR_Index == MR_Piny)		{CreateInvItem(npc,ItMr_Piny);}	else
	if (MR_Index == MR_Red)			{CreateInvItem(npc,ItMr_Red);}	else
	if (MR_Index == MR_Stone)		{CreateInvItem(npc,ItMr_Stone);}	else
	if (MR_Index == MR_Sunrise)		{CreateInvItem(npc,ItMr_Sunrise);}	else
	if (MR_Index == MR_Trident)		{CreateInvItem(npc,ItMr_Trident);}	else
	if (MR_Index == MR_Violet)		{CreateInvItem(npc,ItMr_Violet);};
};

//реальное "рабочее время" из полного времени full_time
func int C_GetWorkingHours(var int full_time, var int h_begin, var int m_begin, var int h_end, var int m_end)
{
	//тривиальные случаи
	if (full_time <= 0)	{	return 0;	};
	if ((h_end == h_begin) && (m_end == m_begin))	{	return 0;	};
	if (full_time == 1)	{
		if (Wld_IsTime(h_begin,m_begin,h_end,m_end))	{
			return 1;
		}
		else	{
			return 0;
		};
	};
	//иначе - прошло > 1 минуты
	//ночью конкуренты грибы не собирают
	var int ActualTime;	ActualTime = 0;	//сколько реально времени собирались грибы, за вычетом часов с h_end до h_begin
	var int Now_Time;	Now_Time = Wld_GetFullTime();	//сколько сейчас времени
	var int Now_Day;	Now_Day = Now_Time / (24 * 60);
	var int Now_H;		Now_H = (Now_Time - Now_Day * 24 * 60) / 60;
	var int Now_M;		Now_M = Now_Time - (Now_Day * 24 + Now_H) * 60;
	var int Start_Time;	Start_Time = Now_Time - full_time;	//сколько было времени full_time назад
	var int Start_Day;	Start_Day = Start_Time / (24 * 60);
	var int Start_H;	Start_H = (Start_Time - Start_Day * 24 * 60) / 60;
	var int Start_M;	Start_M = Start_Time - (Start_Day * 24 + Start_H) * 60;
	//var string txt;
	//txt = ConcatStrings("Start ",IntToString(Start_Day));
	//txt = ConcatStrings(txt," ");
	//txt = ConcatStrings(txt,IntToString(Start_H));
	//txt = ConcatStrings(txt,":");
	//txt = ConcatStrings(txt,IntToString(Start_M));
	//MEM_Debug(txt);
	//txt = ConcatStrings("Now ",IntToString(Now_Day));
	//txt = ConcatStrings(txt," ");
	//txt = ConcatStrings(txt,IntToString(Now_H));
	//txt = ConcatStrings(txt,":");
	//txt = ConcatStrings(txt,IntToString(Now_M));
	//MEM_Debug(txt);
	var int Day_norm;	//сколько за полный рабочий день?
	//время начала раньше времени конца
	if (C_TimeLesser(h_begin,m_begin,h_end,m_end))	{
		Day_norm = (h_end - h_begin) * 60 + m_end - m_begin;
		ActualTime += Day_norm * (Now_Day - Start_Day); //полных дней
		if (C_TimeLesser(Start_H,Start_M,h_end,m_end)) {
			ActualTime += Day_norm;
			if (C_TimeLesser(h_begin,m_begin,Start_H,Start_M))	{	//начали позже начала рабочего дня
				ActualTime -= (Start_H - h_begin) * 60 + Start_M - m_begin;
			};
		};
		//MEM_Debug(IntToString(ActualTime));
		if (C_TimeLesser(h_begin,m_begin,Now_H,Now_M))	{
			if (C_TimeLesser(Now_H,Now_M,h_end,m_end))	{	//закончили раньше конца рабочего дня
				ActualTime -= (h_end - Now_H) * 60 + m_end - Now_M;
			};
		}
		else	{
			ActualTime -= Day_norm;
		};
		//MEM_Debug(IntToString(ActualTime));
	}
	else	{
		//Day_norm = (24 + h_end - h_begin) * 60 + m_end - m_begin;
	};	
	return ActualTime;
};

//расчет кол-ва рабочего времени каждого конкурента, 1 раз за цикл
var int ActualWorkingHours[7];
func void B_CalcWorkingHoursAll(var int Time_Minutes)
{
	//Елена
	if (!C_HeroIs_Elena() && !C_NpcIsDown(Cmp_Elena))	{	//если не ГГ и жив-здоров
		ActualWorkingHours[0] = C_GetWorkingHours(Time_Minutes, 7, 6, 19, 10);	//сколько из прошедшего времени собирал грибы
	}
	else	{
		ActualWorkingHours[0] = 0;
	};
//	MEM_Debug(ConcatStrings("ActualWorkingHours[Elena] = ",IntToString(ActualWorkingHours[0])));
	//Эрол
	if (!C_HeroIs_Erol() && !C_NpcIsDown(Cmp_Erol))	{	//если не ГГ и жив-здоров
		ActualWorkingHours[1] = C_GetWorkingHours(Time_Minutes, 5, 0, 19, 45);	//сколько из прошедшего времени собирал грибы
	}
	else	{
		ActualWorkingHours[1] = 0;
	};
//	MEM_Debug(ConcatStrings("ActualWorkingHours[Erol] = ",IntToString(ActualWorkingHours[1])));
	//Одо
	if (!C_HeroIs_Odo() && !C_NpcIsDown(CMP_Odo))	{	//если не ГГ и жив-здоров
		ActualWorkingHours[2] = C_GetWorkingHours(Time_Minutes, 8, 0, 18, 20);	//сколько из прошедшего времени собирал грибы
	}
	else	{
		ActualWorkingHours[2] = 0;
	};
//	MEM_Debug(ConcatStrings("ActualWorkingHours[Odo] = ",IntToString(ActualWorkingHours[2])));
	//Руперт
	if (!C_HeroIs_Rupert() && !C_NpcIsDown(CMP_Rupert))	{	//если не ГГ и жив-здоров
		ActualWorkingHours[3] = C_GetWorkingHours(Time_Minutes, 10, 0, 17, 30);	//сколько из прошедшего времени собирал грибы
	}
	else	{
		ActualWorkingHours[3] = 0;
	};
//	MEM_Debug(ConcatStrings("ActualWorkingHours[Rupert] = ",IntToString(ActualWorkingHours[3])));
	//Сара
	if (!C_HeroIs_Sarah() && !C_NpcIsDown(CMP_Sarah))	{	//если не ГГ и жив-здоров
		ActualWorkingHours[4] = C_GetWorkingHours(Time_Minutes, 7, 5, 18, 20);	//сколько из прошедшего времени собирал грибы
	}
	else	{
		ActualWorkingHours[4] = 0;
	};
//	MEM_Debug(ConcatStrings("ActualWorkingHours[Sarah] = ",IntToString(ActualWorkingHours[4])));
	//Талбин
	if (!C_HeroIs_Talbin() && !C_NpcIsDown(CMP_Talbin))	{	//если не ГГ и жив-здоров
		ActualWorkingHours[5] = C_GetWorkingHours(Time_Minutes, 7, 30, 19, 0);	//сколько из прошедшего времени собирал грибы
	}
	else	{
		ActualWorkingHours[5] = 0;
	};
//	MEM_Debug(ConcatStrings("ActualWorkingHours[Talbin] = ",IntToString(ActualWorkingHours[5])));
	//Тилл
	if (!C_HeroIs_Till() && !C_NpcIsDown(CMP_Till))	{	//если не ГГ и жив-здоров
		ActualWorkingHours[6] = C_GetWorkingHours(Time_Minutes, 10, 30, 18, 30);	//сколько из прошедшего времени собирал грибы
	}
	else	{
		ActualWorkingHours[6] = 0;
	};
//	MEM_Debug(ConcatStrings("ActualWorkingHours[Till] = ",IntToString(ActualWorkingHours[6])));
};

//гриб на счет конкурентов
//чем больше Time_Minutes и меньше period, тем выше вероятность собрать гриб
//UPD: расчет времени Time_Minutes для каждого собирателя вынесен в B_CalcWorkingHoursAll
func int C_GetCompetitor_Chance(var int period, var int dif_correction, var int Cmp_Skill)
{
	return (period * 100 / dif_correction * (150 - Cmp_Skill/2) / 100);
};
func int B_AddCompetitors(/*var int Time_Minutes, */var int period, var int MR_Index)
{
	// только во время конкурса
	if (Wld_GetDay() >= Competition_Len)	{return FALSE;};
	// сколько стоит
	var int sum;	sum = MEM_ReadStatArr(MR_Price, MR_Index);
	// кто собрал?
	var int rnd; rnd = 0;
	var int rnd_min; rnd_min = 0;
	var int i_min; i_min = 0;
	var int dif_correction;	dif_correction = 100 + MR_Opts_CmpActivity;
	if (dif_correction <= 0) 	{dif_correction = 1;};
	//Елена
	if (ActualWorkingHours[0] > 0)	{	//если не ГГ и жив-здоров
		rnd = Hlp_Random(C_GetCompetitor_Chance(period, dif_correction, Cmp_Skill_Elena));	//шанс собрать с учетом личного таланта и сложности
		if ((rnd < ActualWorkingHours[0]) && ((rnd < rnd_min) || (rnd_min == 0)))	{	//если шанс достаточный для сбора и меньше остальных
			rnd_min = rnd;	//собрать гриб
			i_min = 1;
		};
	};
	//Эрол
	if (ActualWorkingHours[1] > 0)	{	//если не ГГ и жив-здоров
		rnd = Hlp_Random(C_GetCompetitor_Chance(period, dif_correction, Cmp_Skill_Erol));	//шанс собрать с учетом личного таланта и сложности
		if ((rnd < ActualWorkingHours[1]) && ((rnd < rnd_min) || (rnd_min == 0)))	{	//если шанс достаточный для сбора и меньше остальных
			rnd_min = rnd;	//собрать гриб
			i_min = 2;
		};
	};
	//Одо
	if (ActualWorkingHours[2] > 0)	{	//если не ГГ и жив-здоров
		rnd = Hlp_Random(C_GetCompetitor_Chance(period, dif_correction, Cmp_Skill_Odo));	//шанс собрать с учетом личного таланта и сложности
		if ((rnd < ActualWorkingHours[2]) && ((rnd < rnd_min) || (rnd_min == 0)))	{	//если шанс достаточный для сбора и меньше остальных
			rnd_min = rnd;	//собрать гриб
			i_min = 3;
		};
	};
	//Руперт
	if (ActualWorkingHours[3] > 0)	{	//если не ГГ и жив-здоров
		rnd = Hlp_Random(C_GetCompetitor_Chance(period, dif_correction, Cmp_Skill_Rupert));	//шанс собрать с учетом личного таланта и сложности
		if ((rnd < ActualWorkingHours[3]) && ((rnd < rnd_min) || (rnd_min == 0)))	{	//если шанс достаточный для сбора и меньше остальных
			rnd_min = rnd;	//собрать гриб
			i_min = 4;
		};
	};
	//Сара
	if (ActualWorkingHours[4] > 0)	{	//если не ГГ и жив-здоров
		rnd = Hlp_Random(C_GetCompetitor_Chance(period, dif_correction, Cmp_Skill_Sarah));	//шанс собрать с учетом личного таланта и сложности
		if ((rnd < ActualWorkingHours[4]) && ((rnd < rnd_min) || (rnd_min == 0)))	{	//если шанс достаточный для сбора и меньше остальных
			rnd_min = rnd;	//собрать гриб
			i_min = 5;
		};
	};
	//Талбин
	if (ActualWorkingHours[5] > 0)	{	//если не ГГ и жив-здоров
		rnd = Hlp_Random(C_GetCompetitor_Chance(period, dif_correction, Cmp_Skill_Talbin));	//шанс собрать с учетом личного таланта и сложности
		if ((rnd < ActualWorkingHours[5]) && ((rnd < rnd_min) || (rnd_min == 0)))	{	//если шанс достаточный для сбора и меньше остальных
			rnd_min = rnd;	//собрать гриб
			i_min = 6;
		};
	};
	//Тилл
	if (ActualWorkingHours[6] > 0)	{	//если не ГГ и жив-здоров
		rnd = Hlp_Random(C_GetCompetitor_Chance(period, dif_correction, Cmp_Skill_Till));	//шанс собрать с учетом личного таланта и сложности
		if ((rnd < ActualWorkingHours[6]) && ((rnd < rnd_min) || (rnd_min == 0)))	{	//если шанс достаточный для сбора и меньше остальных
			rnd_min = rnd;	//собрать гриб
			i_min = 7;
		};
	};
	//кому гриб?
	if (i_min > 0)	{
		if (Hlp_Random(100) < 100)	{
//			MEM_Debug("MR in inventory");
			if (i_min == 1)	{	B_CreateInvMroom(Cmp_Elena,MR_Index); };
			if (i_min == 2)	{	B_CreateInvMroom(Cmp_Erol,MR_Index);};
			if (i_min == 3)	{	B_CreateInvMroom(Cmp_Odo,MR_Index);};
			if (i_min == 4)	{	B_CreateInvMroom(Cmp_Rupert,MR_Index);};
			if (i_min == 5)	{	B_CreateInvMroom(Cmp_Sarah,MR_Index);};
			if (i_min == 6)	{	B_CreateInvMroom(Cmp_Talbin,MR_Index);};
			if (i_min == 7)	{	B_CreateInvMroom(Cmp_Till,MR_Index);};
		}
		else	{
//			MEM_Debug("MR in scorelist");
			if (i_min == 1)	{	MR_Counter_Elena += sum;};
			if (i_min == 2)	{	MR_Counter_Erol += sum;};
			if (i_min == 3)	{	MR_Counter_Odo += sum;};
			if (i_min == 4)	{	MR_Counter_Rupert += sum;};
			if (i_min == 5)	{	MR_Counter_Sarah += sum;};
			if (i_min == 6)	{	MR_Counter_Talbin += sum;};
			if (i_min == 7)	{	MR_Counter_Till += sum;};
		};
		MEM_Debug(ConcatStrings("B_AddCompetitors TRUE i_min = ", IntToString(i_min)));
		return TRUE;
	};
	return FALSE;
};

//гриб на счет конкурентов
func void B_AddCompetitors_NotRnd(var C_ITEM itm, var C_NPC slf)
{
	var int sum;
	if (Hlp_IsItem(itm,ItPl_Mushroom_01))	{sum = MR_Price[MR_01];}	else
	if (Hlp_IsItem(itm,ItPl_Mushroom_02))	{sum = MR_Price[MR_02];}	else
	if (Hlp_IsItem(itm,ItMr_Piny))			{sum = MR_Price[MR_Piny];}	else
	if (Hlp_IsItem(itm,ItMr_Stone))			{sum = MR_Price[MR_Stone];}	else
	if (Hlp_IsItem(itm,ItMr_Red))			{sum = MR_Price[MR_Red];}	else
	if (Hlp_IsItem(itm,ItMr_BrownOiler))	{sum = MR_Price[MR_BrownOiler];}	else
	if (Hlp_IsItem(itm,ItMr_Governor))		{sum = MR_Price[MR_Governor];}	else
	if (Hlp_IsItem(itm,ItMr_Sunrise))		{sum = MR_Price[MR_Sunrise];}	else
	if (Hlp_IsItem(itm,ItMr_LadysEar))		{sum = MR_Price[MR_LadysEar];}	else
	if (Hlp_IsItem(itm,ItMr_KeilSmall))		{sum = MR_Price[MR_Keil];}	else
	if (Hlp_IsItem(itm,ItMr_Bottle))		{sum = MR_Price[MR_Bottle];}	else
	if (Hlp_IsItem(itm,ItMr_Ivy))			{sum = MR_Price[MR_Ivy];}	else
	if (Hlp_IsItem(itm,ItMr_Trident))		{sum = MR_Price[MR_Trident];}	else
	if (Hlp_IsItem(itm,ItMr_Branch))		{sum = MR_Price[MR_Branch];}	else
	if (Hlp_IsItem(itm,ItMr_DragonTears))	{sum = MR_Price[MR_DragonTears];}	else
	if (Hlp_IsItem(itm,ItMr_Oyster))		{sum = MR_Price[MR_Oyster];}	else
	if (Hlp_IsItem(itm,ItMr_Violet))		{sum = MR_Price[MR_Violet];} else
	if (Hlp_IsItem(itm,ItMr_GoldPlate))		{sum = MR_Price[MR_GoldPlate];} else
	if (Hlp_IsItem(itm,ItMr_Heart))			{sum = MR_Price[MR_Heart];} else
	{return;};

	//кому гриб?
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cmp_Elena))	{	MR_Counter_Elena += sum;};
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cmp_Erol))	{	MR_Counter_Erol += sum;};
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cmp_Odo))	{	MR_Counter_Odo += sum;};
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cmp_Rupert))	{	MR_Counter_Rupert += sum;};
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cmp_Sarah))	{	MR_Counter_Sarah += sum;};
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cmp_Talbin))	{	MR_Counter_Talbin += sum;};
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cmp_Till))	{	MR_Counter_Till += sum;};
};

//соперник сдает грибы из инвентаря Константино
func void B_CompetitorGiveMrmsToConstantino(var C_NPC slf)
{
	var int cnt;
	var int sum;	sum = 0;
	cnt = Npc_HasItems(slf,ItPl_Mushroom_01); if (cnt > 0)		{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_01);	Npc_RemoveInvItems(slf,ItPl_Mushroom_01,cnt);	};
	cnt = Npc_HasItems(slf,ItPl_Mushroom_02); if (cnt > 0)		{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_02);	Npc_RemoveInvItems(slf,ItPl_Mushroom_02,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_Bottle); if (cnt > 0)			{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_Bottle);	Npc_RemoveInvItems(slf,ItMr_Bottle,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_Branch); if (cnt > 0)			{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_Branch);	Npc_RemoveInvItems(slf,ItMr_Branch,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_BrownOiler); if (cnt > 0)		{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_BrownOiler);	Npc_RemoveInvItems(slf,ItMr_BrownOiler,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_DragonTears); if (cnt > 0)		{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_DragonTears);	Npc_RemoveInvItems(slf,ItMr_DragonTears,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_GoldPlate); if (cnt > 0)		{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_GoldPlate);	Npc_RemoveInvItems(slf,ItMr_GoldPlate,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_Governor); if (cnt > 0)			{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_Governor);	Npc_RemoveInvItems(slf,ItMr_Governor,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_Heart); if (cnt > 0)			{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_Heart);	Npc_RemoveInvItems(slf,ItMr_Heart,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_Ivy); if (cnt > 0)				{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_Ivy);	Npc_RemoveInvItems(slf,ItMr_Ivy,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_KeilSmall); if (cnt > 0)		{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_Keil);	Npc_RemoveInvItems(slf,ItMr_KeilSmall,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_LadysEar); if (cnt > 0)			{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_LadysEar);	Npc_RemoveInvItems(slf,ItMr_LadysEar,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_NightSparkles); if (cnt > 0)	{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_NightSparkles);	Npc_RemoveInvItems(slf,ItMr_NightSparkles,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_Oyster); if (cnt > 0)			{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_Oyster);	Npc_RemoveInvItems(slf,ItMr_Oyster,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_Piny); if (cnt > 0)				{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_Piny);	Npc_RemoveInvItems(slf,ItMr_Piny,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_Red); if (cnt > 0)				{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_Red);	Npc_RemoveInvItems(slf,ItMr_Red,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_Stone); if (cnt > 0)			{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_Stone);	Npc_RemoveInvItems(slf,ItMr_Stone,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_Sunrise); if (cnt > 0)			{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_Sunrise);	Npc_RemoveInvItems(slf,ItMr_Sunrise,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_Trident); if (cnt > 0)			{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_Trident);	Npc_RemoveInvItems(slf,ItMr_Trident,cnt);	};
	cnt = Npc_HasItems(slf,ItMr_Violet); if (cnt > 0)			{ sum += cnt * MEM_ReadStatArr(MR_Price, MR_Violet);	Npc_RemoveInvItems(slf,ItMr_Violet,cnt);	};
	//кому гриб?
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cmp_Elena))	{	MR_Counter_Elena += sum;};
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cmp_Erol))	{	MR_Counter_Erol += sum;};
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cmp_Odo))	{	MR_Counter_Odo += sum;};
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cmp_Rupert))	{	MR_Counter_Rupert += sum;};
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cmp_Sarah))	{	MR_Counter_Sarah += sum;};
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cmp_Talbin))	{	MR_Counter_Talbin += sum;};
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cmp_Till))	{	MR_Counter_Till += sum;};
};

func void B_Show_ScoreList()
{
	var int nDocID;
	var string str;
	var int sum;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,70,70,70,70,1);
	Doc_SetFont(nDocID,-1,FONT_Calligraphic);
	Doc_PrintLine(nDocID,0,"          Очки участников конкурса");
	Doc_PrintLine(nDocID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLine(nDocID,0,"");
	if (C_HeroIs_Sarah())	{	sum = C_GetHeroScore();	} else {sum = MR_Counter_Sarah;};
	str = ConcatStrings("Сара: ", IntToString(sum));
	MEM_Debug(str);
	Doc_PrintLine(nDocID,0,str);
	Doc_PrintLine(nDocID,0,"");
	if (C_HeroIs_Rupert())	{	sum = C_GetHeroScore();	} else {sum = MR_Counter_Rupert;};
	str = ConcatStrings("Руперт: ", IntToString(sum));
	MEM_Debug(str);
	Doc_PrintLine(nDocID,0,str);
	Doc_PrintLine(nDocID,0,"");
	if (C_HeroIs_Erol())	{	sum = C_GetHeroScore();	} else {sum = MR_Counter_Erol;};
	str = ConcatStrings("Эрол: ", IntToString(sum));
	MEM_Debug(str);
	Doc_PrintLine(nDocID,0,str);
	Doc_PrintLine(nDocID,0,"");
	if (C_HeroIs_Elena())	{	sum = C_GetHeroScore();	} else {sum = MR_Counter_Elena;};
	str = ConcatStrings("Елена: ", IntToString(sum));
	MEM_Debug(str);
	Doc_PrintLine(nDocID,0,str);
	Doc_PrintLine(nDocID,0,"");
	if (C_HeroIs_Odo())	{	sum = C_GetHeroScore();	} else {sum = MR_Counter_Odo;};
	str = ConcatStrings("Одо: ", IntToString(sum));
	MEM_Debug(str);
	Doc_PrintLine(nDocID,0,str);
	Doc_PrintLine(nDocID,0,"");
	if (C_HeroIs_Talbin())	{	sum = C_GetHeroScore();	} else {sum = MR_Counter_Talbin;};
	str = ConcatStrings("Талбин: ", IntToString(sum));
	MEM_Debug(str);
	Doc_PrintLine(nDocID,0,str);
	Doc_PrintLine(nDocID,0,"");
	if (C_HeroIs_Till())	{	sum = C_GetHeroScore();	} else {sum = MR_Counter_Till;};
	str = ConcatStrings("Тилл: ", IntToString(sum));
	MEM_Debug(str);
	Doc_PrintLine(nDocID,0,str);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	var int day;	day = Competition_LastDay - Wld_GetDay();
	if (day > 0)	{
		if (day % 10 == 1 && day % 100 != 11)	{
			str = ConcatStrings("     До конца конкурса остался ",IntToString(day));
			str = ConcatStrings(str, " день.");	
		} 
		else if (day % 10 < 5 && (day % 100 < 12 || day % 100 > 14))	{
			str = ConcatStrings("     До конца конкурса осталось ",IntToString(day));
			str = ConcatStrings(str, " дня.");	
		} 
		else
		{
			str = ConcatStrings("     До конца конкурса осталось ",IntToString(day));
			str = ConcatStrings(str, " дней.");	
		};
	}
	else	{
		str = "Конкурс завершен!";
	};
	Doc_PrintLine(nDocID,0,str);
	Doc_Show(nDocID);
};

