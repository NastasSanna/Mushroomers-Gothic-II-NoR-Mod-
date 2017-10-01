/**************************************************************************

  Сообщения общего содержания, выдаваемые на экран. Специальные сообщения
прописаны в соответствующих файлах.
   
***************************************************************************/

func void Print3(var string msg1, var string msg2, var string msg3)
{
	var string txt;
	txt = msg1;
	txt = ConcatStrings(txt, msg2);
	txt = ConcatStrings(txt, msg3);
	Print(txt);
};

func void Print5(var string msg1, var string msg2, var string msg3, var string msg4, var string msg5)
{
	var string txt;
	txt = ConcatStrings(msg1, msg2);
	txt = ConcatStrings(txt, msg3);
	txt = ConcatStrings(txt, msg4);
	txt = ConcatStrings(txt, msg5);
	Print(txt);
};

//* DEBUG INFO
func void PrintSelf(var string msg)
{
	Print3(self.name, ": ", msg);
};

func void PrintSelfVsOther(var string msg)
{
	//Print5(self.name, " vs.", other.name, ": ", msg);
	MEM_Debug(CS5(self.name, " vs.", other.name, ": ", msg));
};
//*/

// --------------------------------------------------------------

// при взаимодействии с объектом
func void PrintOnMob(var string msg)
{
	PrintScreen(msg, -1, YPOS_MobInteract, FONT_ScreenSmall, 2);
};

// в инвентаре
func void PrintInInventory(var string msg)
{
	PrintScreen(msg, XPOS_InInventory, YPOS_InInventory, FONT_ScreenSmall, 2);
};

// вывести сообщение, что чего-то не хвататет (какого-то атрибута)
func void PrintMissing(var string txt)
{
	PrintScreen(txt, XPOS_InInventory, YPOS_InInventory, FONT_ScreenSmall, 3);
};

// успешный результат
func void PrintSuccess(var string msg)
{
	PrintScreen(msg, -1, YPOS_InInventory, FONT_ScreenSmall, 2);
};

// сейчас ГГ не в состоянии сделать что-то
func void PrintNotNow()
{
	var int rnd;
	rnd = Hlp_Random(90);
	if (rnd < 30)
	{
		PrintScreen(PRINT_NotNow1, -1, YPOS_InInventory - 2, FONT_ScreenSmall, 2);
	}
	else if (rnd < 60)
	{
		PrintScreen(PRINT_NotNow2, -1, YPOS_InInventory, FONT_ScreenSmall, 2);
	}
	else
	{
		PrintScreen(PRINT_NotNow3, -1, YPOS_InInventory + 2, FONT_ScreenSmall, 2);
	};
};

// не получилось что-то сделать, но можно попробовать еще раз
func void PrintTryAgain()
{
	if (Npc_IsPlayer(self))
	{
		var int rnd;
		rnd = Hlp_Random(90);
		if (rnd < 30)
		{
			PrintScreen(PRINT_TryAgain1, XPOS_InInventory, YPOS_InInventory - 2, FONT_ScreenSmall, 2);
		}
		else if (rnd < 60)
		{
			PrintScreen(PRINT_TryAgain2, XPOS_InInventory, YPOS_InInventory, FONT_ScreenSmall, 2);
		}
		else
		{
			PrintScreen(PRINT_TryAgain3, XPOS_InInventory, YPOS_InInventory + 2, FONT_ScreenSmall, 2);
		};
	};
};

// непонятно, как использовать
func void PrintWhatFor()
{
	if (Npc_IsPlayer(self))
	{
		var int rnd;
		rnd = Hlp_Random(30);
		if (rnd < 15)
		{
			PrintScreen(PRINT_WHATFOR1, XPOS_InInventory, YPOS_InInventory - 2, FONT_ScreenSmall, 2);
		}
		else if (rnd < 25)
		{
			PrintScreen(PRINT_WHATFOR2, XPOS_InInventory, YPOS_InInventory, FONT_ScreenSmall, 2);
		}
		else
		{
			PrintScreen(PRINT_WHATFOR3, XPOS_InInventory, YPOS_InInventory + 2, FONT_ScreenSmall, 2);
		};
	};
};

// закрыто
func void PrintClosed()
{
	if (Npc_IsPlayer(self))
	{
		var int rnd;
		rnd = Hlp_Random(100);
		if (rnd < 50)
		{
			PrintOnMob(PRINT_Closed1);
		}
		else
		{
			PrintOnMob(PRINT_Closed2);
		};
	};
};

// время
func void PrintTime()
{
	Wld_GetFullTime();
	var string h;
	var string m;
	if (Wld_hour > 9)	{	h = IntToString(Wld_Hour);	} else {	h = ConcatStrings("0",IntToString(Wld_Hour));	};
	if (Wld_minute > 9)	{	m = IntToString(Wld_minute);} else {	m = ConcatStrings("0",IntToString(Wld_minute));	};
	PrintScreen(CS3(h,":",m),96,98,FONT_ScreenSmall,2);
};
