
var int B_OnEnterNewWorld_once;

// дополняет STARTUP. STARTUP_NewWorld_MR не всегда срабатывает => вызов из Init
func void B_OnEnterNewWorld()
{
	// только 1 раз в игре
	if (B_OnEnterNewWorld_once == TRUE)	{ return;	};
	B_OnEnterNewWorld_once = TRUE;
	
	Wld_SetTime(10,0);
	Competition_LastDay = Wld_GetDay() + Competition_Len;
	Hero_HackChance = 10;
	
	// доп. заставка
	MEM_InitGlobalInst();
	Print_GetScreenSize();
	MEM_Game.showPlayerStatus = FALSE;
	_OnGameStart_View = View_Create(0, 0, PS_VMax, PS_VMax);
	View_SetTexture(_OnGameStart_View, "loading.tga");
	View_Open(_OnGameStart_View);
    var int dy;	dy = 33 * PS_VMax / Print_Screen[PS_X];	//межстрочный интервал 33px -> вирт. координаты
	//View_AddText(_OnGameStart_View, 5200, 1170, PRINT_MushroomsAreSpawned, FONT_Book);
	//View_AddText(_OnGameStart_View, 5200, 1170 + dy, PRINT_PleaseWait, FONT_Book);
	var int width; 
	var int y_top; y_top = PS_VMax / 2;
	var int x_center; x_center = PS_VMax / 2;
	//var int dx; dx = 22 * PS_VMax / Print_Screen[PS_X];
	width = Print_GetStringWidth(PRINT_MushroomsAreSpawned, FONT_BookHeadline) * PS_VMax / Print_Screen[PS_X];
	View_AddText(_OnGameStart_View, x_center - width / 2, y_top, PRINT_MushroomsAreSpawned, FONT_BookHeadline);
	View_AddText(_OnGameStart_View, x_center - width / 2 - 15, y_top - 10, PRINT_MushroomsAreSpawned, FONT_Screen);
	width = Print_GetStringWidth(PRINT_PleaseWait, FONT_BookHeadline) * PS_VMax / Print_Screen[PS_X];
	View_AddText(_OnGameStart_View, x_center - width / 2, y_top + dy, PRINT_PleaseWait, FONT_BookHeadline);
	View_AddText(_OnGameStart_View, x_center - width / 2 - 15, y_top - 10 + dy, PRINT_PleaseWait, FONT_Screen);

	_OnGameStart_View_Help = View_CreateCenter(PS_VMax / 2, PS_VMax * 3 / 4, PS_VMax * 8 / 10, PS_VMax / 5);
	View_SetTexture(_OnGameStart_View_Help, "Log_Paper.tga");
	var zCView v;	v = View_Get(_OnGameStart_View_Help);
	v.alphafunc = 2; //BLEND
	v.alpha = 100; //полупрозрачное
	View_Open(_OnGameStart_View_Help);
	
    dy = PS_VMax * 8 / 10 / 6; //16 * PS_VMax / v.psizey;
	View_AddText(_OnGameStart_View_Help, PS_VMax / 20, PS_VMax / 10,        "Грибы случайным образом засеиваются ", FONT_ScreenSmall);
	View_AddText(_OnGameStart_View_Help, PS_VMax / 20, PS_VMax / 10 + dy,   "в начале игры и продолжают расти в ее процессе,", FONT_ScreenSmall);
	View_AddText(_OnGameStart_View_Help, PS_VMax / 20, PS_VMax / 10 + 2*dy, "в том числе на месте уже собранных.", FONT_ScreenSmall);
	View_AddText(_OnGameStart_View_Help, PS_VMax / 20, PS_VMax / 10 + 3*dy, "Гриб может и исчезнуть - соберет его один из соперников,", FONT_ScreenSmall);
	View_AddText(_OnGameStart_View_Help, PS_VMax / 20, PS_VMax / 10 + 4*dy, "или он просто развалится от старости.", FONT_ScreenSmall);

	// время
	CYCLE_TRIGGER_Time = Wld_GetFullTime();
};
