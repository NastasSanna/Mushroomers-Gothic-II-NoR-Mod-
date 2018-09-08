
var int Print_Log_Line;
var string Log_LastMessage;
var string Log_LastDayTime;


// строка с днем, датой и временем
func string C_GetDayTimeString()
{
	var int d;	d = Wld_GetDay() + 1;
	var int h;	h = C_GetHour();
	var int m;	m = C_GetMinute();
	var string txt;
	txt = CS3("День ",IntToString(d),", ");
	if (h >= 10)	{
		txt = ConcatStrings(txt,IntToString(h));
	}
	else	{
		txt = CS3(txt,"0",IntToString(h));
	};
	if (m >= 10)	{
		txt = CS3(txt,":",IntToString(m));
	}
	else	{
		txt = CS3(txt,":0",IntToString(m));
	};
	return txt;
};

func void B_Print_LogEntry(var string message, var string topic)
// вывести сообщение на экран
{
	var string txt;
	txt = CS5(message, " (", topic, ")", "");
	if (Hlp_StrCmp(txt, Log_LastMessage) == FALSE)	{
		Print_Log_Line += 1;
		if (Print_Log_Line > 4)	{
			Print_Log_Line = 0;
		};
		Log_LastMessage = txt;
	};
	//AI_PrintScreen(txt, -1, YPOS_LOGENTRY + Print_Log_Line * 2, FONT_ScreenSmall, 3);
	AI_PrintScreen(txt, -1, YPOS_LOGENTRY + Print_Log_Line * 2, FONT_ScreenSmall, 3);
	AI_Snd_Play(hero,"LOGENTRY");
};

// новая запись в журнале (дневнике) с/без указания времени
//WriteDayTime == FALSE - без, WriteDayTime == TRUE - с
func void B_LogEntry_DateTime(var string topic, var string entry, var int WriteDayTime)
{
	//время и дата записи
	var string DayTime; DayTime = C_GetDayTimeString();
	// сделать запись
	if (Hlp_StrCmp(DayTime,Log_LastDayTime) && Hlp_StrCmp(topic, Log_LastTopic) || !WriteDayTime)	{
		Log_AddEntry(topic,entry);
	}
	else 	{
		Log_AddEntry(topic,CS3(DayTime,".   ",entry));
		Log_LastDayTime = DayTime;
	};
	// вывести сообщение
	B_Print_LogEntry(PRINT_NewLogEntry, topic);
};

func void B_LogEntry(var string topic,var string entry)
{
	B_LogEntry_DateTime(topic,entry,TRUE);
};

func void B_LogEntry_Status(var string topic,var int Log_Status, var string entry)
{
	B_LogEntry_DateTime(topic,entry,TRUE);
	Log_SetTopicStatus(topic,Log_Status);
};

func void B_LogEntry_Obsolete(var string topic)
{
	B_Print_LogEntry(PRINT_LogEntryObsolete, topic);
	Log_SetTopicStatus(topic, LOG_OBSOLETE);
};

func void B_LogEntry_Create(var string topic,var int section, var string entry)
{
	Log_CreateTopic(topic,section);
	Log_SetTopicStatus(topic,LOG_Running);
	B_LogEntry_DateTime(topic,entry,TRUE);
};

func void B_LogNote(var string topic, var string entry)
{
	Log_CreateTopic(topic,LOG_NOTE);
	B_LogEntry_DateTime(topic,entry,FALSE);
};

