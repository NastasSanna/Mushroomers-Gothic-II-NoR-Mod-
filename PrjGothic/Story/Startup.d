
const int _init_once = 0;
const int LeGo_Init_MyFlags = LeGo_Trialoge | LeGo_AI_Function | LeGo_View | LeGo_FrameFunctions; //Trialoge requires AI_Function!

func void startup_global()
{
	Game_InitGerman();
	//MEM_InitAll(); //вызывается в Lego_Init
	Lego_Init(LeGo_Init_MyFlags);
};

func void init_global()
{
	Game_InitGerman();
	if (!_init_once)	{	//только 1 раз за сессию!
		_init_once = 1;
		//MEM_InitAll(); //вызывается в Lego_Init
		Lego_Init(LeGo_Init_MyFlags);
		MEM_InitGlobalInst();

		MoreAlphaVobs(2048); //normal: 256
		MoreAlphaPolys(16*1024); //normal: 2048
	};
	
	NPC_SetLastPlayer();
	Random_Seed = Hlp_Random(1 << 16);
};

//================================================================

func void STARTUP_Testlevel()
{
};

func void INIT_SUB_Testlevel()
{
};

func void INIT_Testlevel()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	INIT_SUB_Testlevel();
};

//================================================================

func void STARTUP_MR_START()
{
	CurrentLevel = MR_START_ZEN;
	Wld_InsertNpc(PC_Elena,"FP_SMALLTALK_START_01");
	Wld_InsertNpc(PC_Sarah,"FP_SMALLTALK_START_02");
	Wld_InsertNpc(PC_Odo,"WP_START_INNOS");
	Wld_InsertNpc(PC_Erol,"WP_START_BENCH_01");
	Wld_InsertNpc(PC_Rupert,"FP_SMALLTALK_START_03");
	Wld_InsertNpc(PC_Talbin,"FP_SMALLTALK_START_04");
	Wld_InsertNpc(PC_Till,"FP_STAND_START_01");
};

func void INIT_MR_START()
{
	CurrentLevel = MR_START_ZEN;
	Competition_Len = 7;
	
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	//B_InitNpcGlobals();
	
	//B_InitHero();

	Wld_SendTrigger("CYCLE_TRIGGER");
};

//================================================================

func void STARTUP_NewWorld_Part_City_MR()
{
	// НИЖНИЙ КВАРТАЛ --------------------------------------
	Wld_InsertNpc(VLK_417_Constantino,"NW_CITY_ENTRANCE_01");
	
	Wld_InsertNpc(VLK_416_Matteo,"NW_CITY_ENTRANCE_01");
	
	Wld_InsertNpc(VLK_413_Bosper,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_427_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_440_Bartok,"NW_CITY_ENTRANCE_01");
	
	Wld_InsertNpc(VLK_462_Thorben,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_4302_Addon_Elvrich,"NW_BIGMILL_FARM3_RANGERBANDITS_04");
	Wld_InsertNpc(VLK_418_Gritta,"NW_CITY_ENTRANCE_01");

	Wld_InsertNpc(VLK_412_Harad,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_457_Brian,"NW_CITY_ENTRANCE_01");
	
	Wld_InsertNpc(VLK_420_Coragon,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_425_Regis,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_421_Valentino,"NW_CITY_ENTRANCE_01");
	
	Wld_InsertNpc(VLK_439_Vatras,"NW_CITY_ENTRANCE_01");
	
	Wld_InsertNpc(VLK_414_Hanna,"NW_CITY_ENTRANCE_01");
	
	Wld_InsertNpc(VLK_407_Hakon,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_408_Jora,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_409_Zuris,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_410_Baltram,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_468_Canthar,"NW_FARM1_OUT_01");
	
	Wld_InsertNpc(VLK_492_Rengaru,"NW_CITY_ENTRANCE_01");
//	Wld_InsertNpc(VLK_4201_Wirt,"NW_CITY_ENTRANCE_01");
	
	Wld_InsertNpc(VLK_484_Lehmar,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_488_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_415_Meldor,"NW_CITY_ENTRANCE_01");
	
	Wld_InsertNpc(Vlk_424_Alwin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_479_Lucy,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Sheep,"NW_CITY_SHEEP_SPAWN_02");
	
	Wld_InsertNpc(VLK_461_Carl,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_453_Buerger,"NW_CITY_ENTRANCE_01");
	
	Wld_InsertNpc(VLK_498_Ignaz,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_471_Edda,"NW_CITY_ENTRANCE_01");

	Wld_InsertNpc(VLK_480_Fellan,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_478_Irene,"NW_CITY_ENTRANCE_01");

	Wld_InsertNpc(VLK_432_Moe,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_431_Kardif,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_493_Nagur,"WP_CITY_THIEF_ISLE_01");

	// Красный фонарь
	Wld_InsertNpc(VLK_433_Bromor,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_434_Borka,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_435_Nadja,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_436_Sonja,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_4361_Lucia,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_491_Vanja,"NW_CITY_ENTRANCE_01");
	
	Wld_InsertNpc(VLK_469_Halvor,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_476_Fenia,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_437_Brahim,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_477_Buergerin,"NW_CITY_ENTRANCE_01");
//	Wld_InsertNpc(VLK_441_Garvell,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_442_Arbeiter,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_443_Arbeiter,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_4301_Addon_Farim,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_4304_Addon_William,"NW_CITY_ENTRANCE_01");

	
	Wld_InsertNpc(VLK_499_Buerger,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_451_Buerger,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_452_Buerger,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_426_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_428_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_450_Buerger,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_454_Buerger,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_455_Buerger,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_486_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_495_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_496_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_497_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_487_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_467_Buerger,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_475_Buerger,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_489_Buerger,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_429_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_430_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_481_Buerger,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_482_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_466_Gernod,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_485_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_459_Buerger,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_472_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_460_Buerger,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_473_Buergerin,"NW_CITY_ENTRANCE_01");


	Wld_InsertNpc(MIL_319_Pablo,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_309_Stadtwache,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_310_Stadtwache,"NW_CITY_ENTRANCE_01");
//	Wld_InsertNpc(Mil_325_Miliz,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_323_Miliz,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_322_Miliz,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_320_Miliz,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_332_Stadtwache,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_333_Stadtwache,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(MIL_324_Peck,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(MIL_312_Wulfgar,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_317_Ruga,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_313_Boltan,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_327_Miliz,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_314_Mortis,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_315_Kasernenwache,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_329_Miliz,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_330_Miliz,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_331_Miliz,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_318_Miliz,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(TargetInvis,"NW_CITY_HABOUR_KASERN_TARGET_01");
	Wld_InsertNpc(TargetInvis,"NW_CITY_HABOUR_KASERN_TARGET_02");
//	Wld_InsertNpc(Mil_350_Addon_Martin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_337_Mika,"FARM2");
	
	Wld_InsertNpc(VLK_445_Ramirez,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_494_Attila,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_446_Jesper,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_447_Cassia,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_448_Joe,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_01");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_02");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_03");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_06");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_07");
	
	//Верхний квартал
	Wld_InsertNpc(VLK_406_Herold,"NW_CITY_ENTRANCE_01");
//	Wld_InsertNpc(VLK_400_Larius,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_401_Cornelius,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Vlk_402_Richter,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_403_Gerbrandt,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_404_Lutero,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_405_Fernando,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_411_Gaertner,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_422_Salandril,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_419_Buerger,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_4000_Buerger,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_4001_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_4002_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_4003_Buergerin,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_4004_Arbeiter,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(VLK_4005_Arbeiter,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_306_Tuerwache,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_307_Tuerwache,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_316_Wambo,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(MIL_321_Rangar,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(Mil_326_Miliz,"NW_CITY_ENTRANCE_01");
	
	Wld_InsertNpc(Giant_Rat,"NW_CITY_WAY_TO_SHIP_FISCHER_06");
	Wld_InsertNpc(Lurker,"FP_ROAM_INSEL_01");
	Wld_InsertNpc(Lurker,"FP_ROAM_INSEL_03");
};

func void INIT_SUB_NewWorld_Part_City_MR()
{
	var C_NPC RoomOwner;
	Wld_SetMobRoutine(0,0,"FIREPLACE",1);
	Wld_SetMobRoutine(20,0,"FIREPLACE",1);
	Wld_SetMobRoutine(5,0,"FIREPLACE",0);
	//* PORTALS
	// Порт
	Wld_AssignRoomToGuild("hafen01", GIL_VLK);
	RoomOwner = Hlp_GetNpc(Vlk_424_Alwin);
	Wld_AssignRoomToNpc("hafen02", RoomOwner);
	Wld_AssignRoomToGuild("hafen03", GIL_VLK);
	RoomOwner = Hlp_GetNpc(VLK_484_Lehmar);
	Wld_AssignRoomToNpc("hafen04", RoomOwner);
	Wld_AssignRoomToGuild("hafen05", GIL_VLK);
	Wld_AssignRoomToGuild("hafen06", GIL_VLK);
	Wld_AssignRoomToGuild("hafen07", GIL_VLK);
	RoomOwner = Hlp_GetNpc(VLK_471_Edda);
	Wld_AssignRoomToNpc("hafen08", RoomOwner);
	RoomOwner = Hlp_GetNpc(VLK_498_Ignaz);
	Wld_AssignRoomToNpc("hafen09", RoomOwner);
	Wld_AssignRoomToGuild("hafen10", GIL_VLK);
	Wld_AssignRoomToGuild("hafen11", GIL_VLK);
	RoomOwner = Hlp_GetNpc(VLK_478_Irene);//VLK_480_Fellan
	Wld_AssignRoomToNpc("fellan", RoomOwner);
	if (!Fellan_ChestKeyGot)	{
		MOBNAME_Chest_Fellan = MOBNAME_CHEST;
	};
	RoomOwner = Hlp_GetNpc(VLK_469_Halvor);
	Wld_AssignRoomToNpc("fisch", RoomOwner);
	RoomOwner = Hlp_GetNpc(VLK_437_Brahim);
	Wld_AssignRoomToNpc("karten", RoomOwner);
	Wld_AssignRoomToGuild("lagerhaus", GIL_ROOMNONE);
	Wld_AssignRoomToGuild("hafenkneipe", GIL_ROOMNONE);
	Wld_AssignRoomToGuild("puff", GIL_ROOMNONE);
	// Нижний квартал, рынок
	RoomOwner = Hlp_GetNpc(VLK_414_Hanna);
	Wld_AssignRoomToNpc("hotel", RoomOwner);
	RoomOwner = Hlp_GetNpc(VLK_420_Coragon);
	Wld_AssignRoomToNpc("stadtkneipe", RoomOwner);
	//RoomOwner = Hlp_GetNpc(VLK_409_Zuris);
	//Wld_AssignRoomToNpc("zuris", RoomOwner);
	Wld_AssignRoomToGuild("zuris", GIL_PUBLIC);
	RoomOwner = Hlp_GetNpc(VLK_417_Constantino);
	Wld_AssignRoomToNpc("alchemist", RoomOwner);
	RoomOwner = Hlp_GetNpc(VLK_412_Harad);
	Wld_AssignRoomToNpc("schmied", RoomOwner);
	RoomOwner = Hlp_GetNpc(VLK_462_Thorben);
	Wld_AssignRoomToNpc("bogner", RoomOwner);
	RoomOwner = Hlp_GetNpc(VLK_413_Bosper);
	Wld_AssignRoomToNpc("gritta", RoomOwner);
	RoomOwner = Hlp_GetNpc(VLK_416_Matteo);
	Wld_AssignRoomToNpc("matteo", RoomOwner);
	// Верхний квартал, ратуша
	Wld_AssignRoomToGuild("reich01", GIL_VLK);
	Wld_AssignRoomToGuild("reich02", GIL_VLK);
	Wld_AssignRoomToGuild("reich03", GIL_VLK);
	Wld_AssignRoomToGuild("reich04", GIL_VLK);
	Wld_AssignRoomToGuild("reich05", GIL_VLK);
	RoomOwner = Hlp_GetNpc(VLK_422_Salandril);
	Wld_AssignRoomToNpc("reich06", RoomOwner);
	Wld_AssignRoomToGuild("leomar", GIL_VLK);
	RoomOwner = Hlp_GetNpc(Vlk_402_Richter);
	Wld_AssignRoomToNpc("richter", RoomOwner);
	Wld_AssignRoomToGuild("nwcityrich01", GIL_VLK);
	Wld_AssignRoomToGuild("rathaus", GIL_PUBLIC);
	Wld_AssignRoomToGuild("rathaus02", GIL_PUBLIC);
	Wld_AssignRoomToGuild("rathaus03", GIL_VLK);
	// Казармы, башни
	Wld_AssignRoomToGuild("waffenkammer", GIL_PUBLIC);
	Wld_AssignRoomToGuild("andre", GIL_PUBLIC);
	Wld_AssignRoomToGuild("barracke", GIL_MIL);
	Wld_AssignRoomToGuild("turmost01", GIL_MIL);
	Wld_AssignRoomToGuild("turmost02", GIL_MIL);
	Wld_AssignRoomToGuild("turmsued01", GIL_MIL);
	Wld_AssignRoomToGuild("turmsued02", GIL_MIL);
	Wld_AssignRoomToGuild("turmschmied", GIL_MIL);
	Wld_AssignRoomToGuild("turmbogner", GIL_MIL);
	// Канализация - ничья, и там сыро и прохладно
	Wld_AssignRoomToGuild("ctythiev01", GIL_DUNGEON);
	Wld_AssignRoomToGuild("ctythiev02", GIL_DUNGEON);
	Wld_AssignRoomToGuild("ctythiev03", GIL_DUNGEON);
	Wld_AssignRoomToGuild("ctythiev04", GIL_DUNGEON);
	Wld_AssignRoomToGuild("ctythiev05", GIL_DUNGEON);
	Wld_AssignRoomToGuild("ctythiev06", GIL_DUNGEON);
	Wld_AssignRoomToGuild("ctythiev07", GIL_DUNGEON);
	Wld_AssignRoomToGuild("ctythiev08", GIL_DUNGEON);
	Wld_AssignRoomToGuild("ctythiev09", GIL_ROOMNONE);
	Wld_AssignRoomToGuild("ctythiev10", GIL_ROOMNONE);
	/*/
	Wld_AssignRoomToGuild("hafen01",GIL_VLK);
	Wld_AssignRoomToGuild("hafen02",GIL_VLK);
	Wld_AssignRoomToGuild("hafen03",GIL_VLK);
	Wld_AssignRoomToGuild("hafen04",GIL_PUBLIC);
	Wld_AssignRoomToGuild("hafen05",GIL_VLK);
	Wld_AssignRoomToGuild("hafen06",GIL_VLK);
	Wld_AssignRoomToGuild("hafen07",GIL_VLK);
	if(Edda_Schlafplatz == TRUE)
	{
		Wld_AssignRoomToGuild("hafen08",GIL_NONE);
	}
	else
	{
		Wld_AssignRoomToGuild("hafen08",GIL_VLK);
	};
	Wld_AssignRoomToGuild("hafen09",GIL_PUBLIC);
	Wld_AssignRoomToGuild("hafen10",GIL_VLK);
	Wld_AssignRoomToGuild("hafen11",GIL_VLK);
	Wld_AssignRoomToGuild("fellan",GIL_VLK);
	Wld_AssignRoomToGuild("fisch",GIL_VLK);
	Wld_AssignRoomToGuild("lagerhaus",GIL_NONE);
	Wld_AssignRoomToGuild("karten",GIL_PUBLIC);
	Wld_AssignRoomToGuild("hafenkneipe",GIL_NONE);
	Wld_AssignRoomToGuild("puff",GIL_NONE);
	Wld_AssignRoomToGuild("bogner",GIL_PUBLIC);
	Wld_AssignRoomToGuild("matteo",GIL_PUBLIC);
	Wld_AssignRoomToGuild("hotel",GIL_NONE);
	Wld_AssignRoomToGuild("stadtkneipe",GIL_NONE);
	Wld_AssignRoomToGuild("zuris",GIL_VLK);
	if(Player_IsApprentice == APP_Constantino)
	{
		Wld_AssignRoomToGuild("alchemist",GIL_NONE);
	}
	else
	{
		Wld_AssignRoomToGuild("alchemist",GIL_PUBLIC);
	};
	if(Player_IsApprentice == APP_Bosper)
	{
		Wld_AssignRoomToGuild("gritta",GIL_NONE);
	}
	else
	{
		Wld_AssignRoomToGuild("gritta",GIL_PUBLIC);
	};
	if(Player_IsApprentice == APP_Harad)
	{
		Wld_AssignRoomToGuild("schmied",GIL_NONE);
	}
	else
	{
		Wld_AssignRoomToGuild("schmied",GIL_VLK);
	};
	Wld_AssignRoomToGuild("turmsued01",GIL_MIL);
	Wld_AssignRoomToGuild("turmsued02",GIL_MIL);
	Wld_AssignRoomToGuild("turmost01",GIL_MIL);
	Wld_AssignRoomToGuild("turmost02",GIL_MIL);
	Wld_AssignRoomToGuild("turmschmied",GIL_MIL);
	Wld_AssignRoomToGuild("turmbogner",GIL_MIL);
	Wld_AssignRoomToGuild("andre",GIL_PUBLIC);
	Wld_AssignRoomToGuild("waffenkammer",GIL_PUBLIC);
	Wld_AssignRoomToGuild("barracke",GIL_MIL);
	Wld_AssignRoomToGuild("nwcityrich01",GIL_MIL);
	Wld_AssignRoomToGuild("rathaus",GIL_PUBLIC);
	Wld_AssignRoomToGuild("reich01",GIL_VLK);
	Wld_AssignRoomToGuild("reich02",GIL_VLK);
	Wld_AssignRoomToGuild("reich03",GIL_VLK);
	Wld_AssignRoomToGuild("reich04",GIL_VLK);
	Wld_AssignRoomToGuild("reich05",GIL_VLK);
	Wld_AssignRoomToGuild("reich06",GIL_PUBLIC);
	Wld_AssignRoomToGuild("richter",GIL_PUBLIC);
	Wld_AssignRoomToGuild("leomar",GIL_VLK);
	//*/
};

func void INIT_NewWorld_Part_City_MR()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	INIT_SUB_NewWorld_Part_City_MR();
};

func void STARTUP_NewWorld_Part_Farm_MR()
{
	Wld_InsertNpc(BAU_954_Maleth,"NW_FARM1_OUT_01");
	Wld_InsertNpc(BAU_950_Lobart,"NW_FARM1_OUT_01");
	Wld_InsertNpc(BAU_951_Hilda,"NW_FARM1_OUT_01");
	Wld_InsertNpc(BAU_952_Vino,"NW_FARM1_OUT_01");
	Wld_InsertNpc(BAU_953_Bauer,"NW_FARM1_OUT_01");
	Wld_InsertNpc(BAU_955_Bauer,"NW_FARM1_OUT_01");
	
	Wld_InsertNpc(Hammel_Maleth,"NW_FARM1_PATH_CITY_SHEEP_07");
	Wld_InsertNpc(Sheep_Maleth,"NW_FARM1_PATH_CITY_SHEEP_07");
	Wld_InsertNpc(Sheep_Maleth,"NW_FARM1_PATH_CITY_SHEEP_07");
	Wld_InsertNpc(Hammel_Maleth,"NW_FARM1_PATH_CITY_SHEEP_08");
	Wld_InsertNpc(Sheep_Maleth,"NW_FARM1_PATH_CITY_SHEEP_08");
	Wld_InsertNpc(Sheep_Maleth,"NW_FARM1_PATH_CITY_SHEEP_08");
	Wld_InsertNpc(Sheep_Maleth,"NW_FARM1_PATH_CITY_SHEEP_09");
	Wld_InsertNpc(Sheep_Maleth,"NW_FARM1_PATH_CITY_SHEEP_09");
	Wld_InsertNpc(Sheep_Maleth,"NW_FARM1_PATH_CITY_SHEEP_09");
	Wld_InsertNpc(Hammel,"NW_FARM1_PATH_CITY_SHEEP_10");
	Wld_InsertNpc(Sheep,"NW_FARM1_PATH_CITY_SHEEP_10");
	Wld_InsertNpc(Hammel,"NW_FARM1_PATH_CITY_SHEEP_11");
	Wld_InsertNpc(Sheep,"NW_FARM1_PATH_CITY_SHEEP_11");
	Wld_InsertNpc(Sheep,"NW_FARM1_PATH_CITY_SHEEP_12");
	Wld_InsertNpc(Sheep,"NW_FARM1_PATH_CITY_SHEEP_12");
	Wld_InsertNpc(Sheep,"NW_FARM1_OUT_03");
	Wld_InsertNpc(Sheep,"NW_FARM1_OUT_03");
	Wld_InsertNpc(Sheep,"NW_FARM1_MILL_01");
	Wld_InsertNpc(Sheep,"NW_FARM1_MILL_01");
	Wld_InsertNpc(Sheep,"NW_FARM1_MILL_01");
	
	//дальняя пещера
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Giant_Rat,"NW_FARM1_PATH_BANDITS_11");
		Wld_InsertNpc(Giant_Rat,"NW_FARM1_BANDITS_CAVE_02");
		B_InsertNpc_Rnd(Giant_Rat,"NW_FARM1_BANDITS_CAVE_03",90);
		Wld_InsertNpc(Giant_Bug,"NW_FARM1_BANDITS_CAVE_07");
		Wld_InsertNpc(Giant_Bug,"NW_FARM1_BANDITS_CAVE_07");
		B_InsertNpc_Rnd(Giant_Bug,"NW_FARM1_BANDITS_CAVE_08",90);
		B_InsertNpc_Rnd(Giant_Bug,"NW_FARM1_BANDITS_CAVE_08",90);
	}
	else	{
		Wld_InsertNpc(Giant_Bug,"NW_FARM1_BANDITS_CAVE_02");
		Wld_InsertNpc(Giant_Bug,"NW_FARM1_BANDITS_CAVE_03");
		B_InsertNpc_Rnd(Giant_Bug,"NW_FARM1_BANDITS_CAVE_04",90);
		Wld_InsertNpc(Snapper,"NW_FARM1_BANDITS_CAVE_07");
		B_InsertNpc_Rnd(Snapper,"NW_FARM1_BANDITS_CAVE_08",90);
		B_InsertNpc_Rnd(Snapper,"NW_FARM1_BANDITS_CAVE_06",10);
	};
	//путь к пещере
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Molerat,"FP_ROAM_FARM1_PATH_BANDITS_05_01");
		Wld_InsertNpc(Molerat,"FP_ROAM_FARM1_PATH_BANDITS_05_02");
		Wld_InsertNpc(Molerat,"NW_FARM1_PATH_BANDITS_05");
	}
	else	{
		Wld_InsertNpc(Scavenger,"FP_ROAM_FARM1_PATH_BANDITS_03_01");
		Wld_InsertNpc(Scavenger,"FP_ROAM_FARM1_PATH_BANDITS_03_02");
		Wld_InsertNpc(Scavenger,"FP_ROAM_FARM1_PATH_BANDITS_03_03");
		B_InsertNpc_Rnd(Scavenger,"FP_ROAM_FARM1_PATH_BANDITS_03_04",90);
	};
	//на месте лагеря гоблинов в лесу
	Wld_InsertNpc(Wolf,"FP_ROAM_FARM1_GOBBO_01");
	Wld_InsertNpc(Wolf,"FP_ROAM_FARM1_GOBBO_02");
	B_InsertNpc_Rnd(Wolf,"FP_ROAM_FARM1_GOBBO_03",90);
	B_InsertNpc_Rnd(Wolf,"FP_ROAM_FARM1_GOBBO_04",90);
	
	Wld_InsertNpc(Keiler,"FP_ROAM_FARM1_FORREST_BLOODFLY_01");
	Wld_InsertNpc(Keiler,"FP_ROAM_FARM1_FORREST_BLOODFLY_02");
	Wld_InsertNpc(Keiler_Hog,"FP_ROAM_FARM1_FORREST_BLOODFLY_07");
	B_InsertNpc_Rnd(Keiler,"FP_ROAM_FARM1_FORREST_BLOODFLY_05",90);
	
	B_InsertNpc_Rnd(Scavenger,"FP_ROAM_FARM1_FORREST_WOLF_01",60);
	B_InsertNpc_Rnd(Scavenger,"FP_ROAM_FARM1_FORREST_WOLF_02",60);
	B_InsertNpc_Rnd(Scavenger,"FP_ROAM_FARM1_FORREST_WOLF_03",60);
	B_InsertNpc_Rnd(Scavenger,"FP_ROAM_FARM1_FORREST_WOLF_04",60);
	B_InsertNpc_Rnd(Scavenger,"FP_ROAM_FARM1_FORREST_WOLF_05",60);
	B_InsertNpc_Rnd(Scavenger,"FP_ROAM_FARM1_FORREST_WOLF_06",60);
	B_InsertNpc_Rnd(Scavenger,"FP_ROAM_FARM1_FORREST_WOLF_07",60);
	B_InsertNpc_Rnd(Scavenger,"FP_ROAM_FARM1_FORREST_WOLF_08",60);
	B_InsertNpc_Rnd(Scavenger,"FP_ROAM_FARM1_FORREST_WOLF_09",60);
	B_InsertNpc_Rnd(Scavenger,"FP_ROAM_FARM1_FORREST_WOLF_10",60);
	
	//между городской стеной и скалой
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_FARM1_FORREST_SNAPPER_01");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_FARM1_FORREST_SNAPPER_02");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_FARM1_FORREST_SNAPPER_03");
		Wld_InsertNpc(Molerat,"FP_ROAM_FARM1_CITYWALL_03_01");
		Wld_InsertNpc(Molerat,"FP_ROAM_FARM1_CITYWALL_03_03");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_FARM1_BLOODFLY_06");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_FARM1_BLOODFLY_08");
	}
	else	{
		Wld_InsertNpc(Molerat,"NW_FARM1_CITYWALL_05");
		Wld_InsertNpc(Molerat,"NW_FARM1_CITYWALL_05");
		Wld_InsertNpc(Wolf,"FP_ROAM_FARM1_CITYWALL_03_02");
		Wld_InsertNpc(Wolf,"FP_ROAM_FARM1_CITYWALL_03_03");
		Wld_InsertNpc(Gobbo_Green,"FP_ROAM_FARM1_BLOODFLY_05");
		Wld_InsertNpc(Gobbo_Green,"FP_ROAM_FARM1_BLOODFLY_06");
		Wld_InsertNpc(Gobbo_Green,"FP_ROAM_FARM1_BLOODFLY_07");
	};
	
	//ров
	Wld_InsertNpc(Giant_Rat,"FP_ROAM_FARM1_CITYDITCH_01");
	Wld_InsertNpc(Giant_Rat,"FP_ROAM_FARM1_CITYDITCH_03");
	Wld_InsertNpc(OUT_4900_DeadCitizen,"FP_ROAM_FARM1_CITYDITCH_02");
	B_KillNpc(OUT_4900_DeadCitizen);
	
	/*
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Molerat,"FP_ROAM_NW_FARM1_CITYWALL_RIGHT_04_01");
		Wld_InsertNpc(Molerat,"FP_ROAM_NW_FARM1_CITYWALL_RIGHT_04_02");
	}
	else	{
		Wld_InsertNpc(Wolf,"FP_ROAM_FARM1_CITYWALL_RIGHT_03_01");
		Wld_InsertNpc(Wolf,"FP_ROAM_FARM1_CITYWALL_RIGHT_03_03");
	};
	//*/
	
	Wld_InsertNpc(Waran,"FP_ROAM_NW_FARM1_OUT_15_01");
	
	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_NW_FARM1_PATH_SPAWN_07_01");
	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_NW_FARM1_PATH_SPAWN_07_02");
	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_NW_FARM1_PATH_SPAWN_07_03");
	
	if (Hlp_Random(6) < 5)	{Wld_InsertNpc(Scavenger,"FP_ROAM_NW_FARM1_PATH_SPAWN_03_01");};
	if (Hlp_Random(6) < 4)	{Wld_InsertNpc(Scavenger,"FP_ROAM_NW_FARM1_PATH_SPAWN_03_02");};
	if (Hlp_Random(6) < 3)	{Wld_InsertNpc(Scavenger,"FP_ROAM_NW_FARM1_PATH_SPAWN_03_03");};
	if (Hlp_Random(6) < 2)	{Wld_InsertNpc(Scavenger,"FP_ROAM_NW_FARM1_PATH_SPAWN_03_04");};
	if (Hlp_Random(6) < 2)	{Wld_InsertNpc(Scavenger,"FP_ROAM_NW_FARM1_PATH_SPAWN_03_05");};
	if (Hlp_Random(6) < 1)	{Wld_InsertNpc(Scavenger,"FP_ROAM_NW_FARM1_PATH_SPAWN_03_06");};

	Wld_InsertNpc(Wolf_Maleth,"NW_FARM1_PATH_SPAWN_02");
	Wld_InsertNpc(Wolf_Maleth,"NW_FARM1_PATH_SPAWN_02");
	Wld_InsertNpc(Wolf_Maleth,"NW_FARM1_PATH_SPAWN_02");
	Wld_InsertNpc(Wolf_Maleth,"NW_FARM1_PATH_SPAWN_02");
	Wld_InsertNpc(Wolf_Maleth,"NW_FARM1_PATH_SPAWN_02");
	Wld_InsertNpc(Wolf_Maleth,"NW_FARM1_PATH_SPAWN_02");
};

func void INIT_SUB_NewWorld_Part_Farm_MR()
{
	var C_NPC RoomOwner;
	//* PORTALS
	// Ферма Лобарта
	RoomOwner = Hlp_GetNpc(BAU_950_Lobart);
	Wld_AssignRoomToNpc("farm01", RoomOwner);
	Wld_AssignRoomToNpc("farm02", RoomOwner);
	Wld_AssignRoomToNpc("farm03", RoomOwner);
	// пещеры
	Wld_AssignRoomToGuild("bancave01", GIL_CAVE);
	Wld_AssignRoomToGuild("bancave01", GIL_CAVE);
	/*/
	Wld_AssignRoomToGuild("farm01",GIL_PUBLIC);
	Wld_AssignRoomToGuild("farm02",GIL_PUBLIC);
	if(Lobart_Kleidung_Verkauft == TRUE)
	{
		Wld_AssignRoomToGuild("farm03",GIL_NONE);
	}
	else
	{
		Wld_AssignRoomToGuild("farm03",GIL_PUBLIC);
	};
	//*/
};

func void INIT_NewWorld_Part_Farm_MR()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	INIT_SUB_NewWorld_Part_Farm_MR();
};

func void STARTUP_NewWorld_Part_Xardas_MR()
{
	//	охотники
	Wld_InsertNpc(OUT_1210_Grimbald,"FP_CAMPFIRE_XARDAS_HUNTERCAVE_01");
	Wld_InsertNpc(OUT_1211_DeadHunter,"FP_DEAD_XARDAS_HUNTER_01");
	B_KillNpc(OUT_1211_DeadHunter);
	Wld_InsertNpc(OUT_1212_DeadHunter,"FP_DEAD_XARDAS_HUNTER_02");
	B_KillNpc(OUT_1212_DeadHunter);
	Wld_InsertNpc(Meatbug,"FP_ROAM_XARDAS_HUNTER_01");
	Wld_InsertNpc(Meatbug,"FP_ROAM_XARDAS_HUNTER_02");
	//	орки
	Wld_InsertNpc(OrcWarrior_Grimbald1,"FP_ROAM_XARDAS_ORC_01");
	Wld_InsertNpc(OrcWarrior_Grimbald2,"FP_ROAM_XARDAS_ORC_03");
	Wld_InsertNpc(OrcWarrior_Grimbald3,"FP_CAMPFIRE_XARDAS_ORC_01");
	
	//дорога
	Wld_InsertNpc(Bloodfly,"FP_ROAM_XARDAS_MONSTER_01_01");
	Wld_InsertNpc(Bloodfly,"FP_ROAM_XARDAS_MONSTER_01_02");
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_XARDAS_MONSTER_01_03",90);
	//	кротокрысы/жуки
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Molerat,"FP_ROAM_XARDAS_MONSTER_03_04");
		Wld_InsertNpc(Molerat,"FP_ROAM_XARDAS_MONSTER_03_02");
	}
	else	{
		Wld_InsertNpc(Giant_Bug,"FP_ROAM_XARDAS_MONSTER_03_03");
		Wld_InsertNpc(Giant_Bug,"FP_ROAM_XARDAS_MONSTER_03_01");
	};
	//	кабаны/волки
	Wld_InsertNpc(Keiler,"FP_ROAM_XARDAS_TOWER_3_01");
	Wld_InsertNpc(Keiler,"FP_ROAM_XARDAS_TOWER_3_04");
	
	//башня
	//	волчья стая
	Wld_InsertNpc(Wolf,"FP_ROAM_XARDAS_PATH_01");
	Wld_InsertNpc(Wolf,"FP_ROAM_XARDAS_PATH_02");
	if (Hlp_Random(100) < 60)	{
		Wld_InsertNpc(Wolf,"FP_ROAM_XARDAS_PATH_04");
		Wld_InsertNpc(Wolf,"FP_ROAM_XARDAS_PATH_06");
	}
	else	{
		Wld_InsertNpc(BlackWolf,"FP_ROAM_XARDAS_PATH_03");
	};
	//	жуки/падальщики
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Giant_Bug,"FP_ROAM_XARDAS_TOWER_VIEW_02");
		Wld_InsertNpc(Giant_Bug,"FP_ROAM_XARDAS_TOWER_VIEW_04");
	}
	else	{
		Wld_InsertNpc(Scavenger,"FP_ROAM_XARDAS_TOWER_VIEW_01");
		Wld_InsertNpc(Scavenger,"FP_ROAM_XARDAS_TOWER_VIEW_02");
		Wld_InsertNpc(Scavenger,"FP_ROAM_XARDAS_TOWER_VIEW_03");
	};
	//	шершни
	Wld_InsertNpc(Bloodfly,"FP_ROAM_XARDAS_TOWER_2");
	Wld_InsertNpc(Bloodfly,"FP_ROAM_XARDAS_TOWER_2_02");
	
	//	шныги у озера
	Wld_InsertNpc(Lurker,"FP_ROAM_XARDAS_LAKE_01");
	Wld_InsertNpc(Lurker,"FP_ROAM_XARDAS_LAKE_03");
	Wld_InsertNpc(Giant_Rat,"FP_ROAM_XARDAS_LAKE_05");
	
	
	//спуск в долину
	//	гоблины в пещере
	Wld_InsertNpc(Gobbo_Warrior,"FP_ROAM_XARDAS_CAVE_05");
	Wld_InsertNpc(Gobbo_Warrior,"FP_ROAM_XARDAS_CAVE_06");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_XARDAS_CAVE_07");
	Wld_InsertNpc(Gobbo_Green_Stealer,"NW_XARDAS_TOWER_WATERFALL_CAVE_ENTRANCE_02");
	//	крысы в пещере
	Wld_InsertNpc(Giant_Rat,"FP_ROAM_XARDAS_CAVE_03");
	Wld_InsertNpc(Giant_Rat,"FP_ROAM_XARDAS_CAVE_04");
	//	мракорис в кустах
	Wld_InsertNpc(Shadowbeast,"FP_ROAM_XARDAS_VALLEY_01_01");
	
	//долина
	//	кабаны, волки, крысы
	if (Hlp_Random(100) < 60)	{
		Wld_InsertNpc(Keiler,"FP_ROAM_XARDAS_VALLEY_02");
		Wld_InsertNpc(Wolf,"FP_ROAM_XARDAS_VALLEY_05");
		Wld_InsertNpc(Wolf,"FP_ROAM_XARDAS_VALLEY_06");
		Wld_InsertNpc(Wolf,"FP_ROAM_XARDAS_VALLEY_07");
	}
	else	{
		Wld_InsertNpc(Wolf,"FP_ROAM_XARDAS_VALLEY_03");
		Wld_InsertNpc(Wolf,"FP_ROAM_XARDAS_VALLEY_04");
		Wld_InsertNpc(Giant_Rat,"FP_ROAM_XARDAS_VALLEY_01");
	};
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Keiler,"FP_ROAM_XARDAS_VALLEY_06");
		Wld_InsertNpc(Keiler,"FP_ROAM_XARDAS_VALLEY_07");
		Wld_InsertNpc(Keiler,"FP_ROAM_XARDAS_VALLEY_12");
	}
	else	{
		Wld_InsertNpc(Keiler,"FP_ROAM_XARDAS_VALLEY_08");
		Wld_InsertNpc(Keiler,"FP_ROAM_XARDAS_VALLEY_10");
		Wld_InsertNpc(Keiler,"FP_ROAM_XARDAS_VALLEY_11");
	};
	Wld_InsertNpc(Wolf,"FP_ROAM_XARDAS_VALLEY_17");
	Wld_InsertNpc(Wolf,"FP_ROAM_XARDAS_VALLEY_18");
	Wld_InsertNpc(Wolf,"FP_ROAM_XARDAS_VALLEY_20");
	//	шершни и скелеты гоблинов в пещере
	Wld_InsertNpc(Gobbo_Skeleton,"FP_ROAM_XARDASCAVE_DJG_01");
	Wld_InsertNpc(Gobbo_Skeleton,"FP_ROAM_XARDASCAVE_DJG_02");
	Wld_InsertNpc(Gobbo_Skeleton,"FP_ROAM_XARDASCAVE_DJG_03");
	
	Wld_InsertNpc(Bloodfly,"FP_ROAM_XARDAS_CAVE_10");
	Wld_InsertNpc(Bloodfly,"FP_ROAM_XARDAS_CAVE_11");
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_XARDAS_CAVE_12",90);
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_XARDAS_CAVE_13",90);
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_XARDAS_CAVE_14",90);
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_XARDAS_CAVE_15",90);
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_XARDAS_CAVE_16",90);
	
	//в горах
	//	ящеры
	Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_21");
	Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_23");
	B_InsertNpc_Rnd(Waran,"FP_ROAM_XARDAS_SECRET_24",90);
	B_InsertNpc_Rnd(Waran,"FP_ROAM_XARDAS_SECRET_04",90);
	Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_06");
	//	крысы
	Wld_InsertNpc(Giant_Rat,"FP_ROAM_XARDAS_SECRET_02");
	Wld_InsertNpc(Giant_Rat,"FP_ROAM_XARDAS_SECRET_03");
	//	снепперы
	Wld_InsertNpc(Snapper,"FP_ROAM_XARDAS_SECRET_13");
	Wld_InsertNpc(Snapper,"FP_ROAM_XARDAS_SECRET_14");
	B_InsertNpc_Rnd(Snapper,"FP_ROAM_XARDAS_SECRET_17",90);
	B_InsertNpc_Rnd(Snapper,"FP_ROAM_XARDAS_SECRET_18",90);
	Wld_InsertNpc(Snapper,"FP_ROAM_XARDAS_SECRET_07");
	//	гарпии
	Wld_InsertNpc(Harpie,"FP_ROAM_XARDAS_SECRET_28");
	Wld_InsertNpc(Harpie,"FP_ROAM_XARDAS_SECRET_29");
	Wld_InsertNpc(Harpie,"FP_ROAM_XARDAS_SECRET_30");
	CreateInvItem(self,ItMi_GoldRing);
};

func void INIT_SUB_NewWorld_Part_Xardas_MR()
{
	//* PORTALS
	// дикие пещеры
	Wld_AssignRoomToGuild("xarcave01", GIL_CAVE);
	Wld_AssignRoomToGuild("xarcave02", GIL_CAVE);
	//*/
};

func void INIT_NewWorld_Part_Xardas_MR()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	INIT_SUB_NewWorld_Part_Xardas_MR();
};

func void STARTUP_NewWorld_Part_Monastery_MR()
{
	Wld_InsertNpc(NOV_602_Ulf,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(KDF_511_Daron,"NW_MONASTERY_ENTRY_01");

	Wld_InsertNpc(KDF_500_Pyrokar,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(KDF_501_Serpentes,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(KDF_502_Ulthar,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(KDF_503_Karras,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(KDF_504_Parlan,"NW_MONASTERY_ENTRY_01");
//	Wld_InsertNpc(KDF_505_Marduk,"NW_MONASTERY_ENTRY_01"); без паладинов нема
	Wld_InsertNpc(KDF_506_Neoras,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(KDF_507_Talamon,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(KDF_508_Gorax,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(KDF_509_Isgaroth,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(KDF_510_Hyglas,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(NOV_600_Pedro,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(NOV_601_Igaraz,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(NOV_603_Agon,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(NOV_604_Dyrian,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(NOV_605_Opolos,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(NOV_606_Novize,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(NOV_607_Novize,"NW_MONASTERY_ENTRY_01");
//	Wld_InsertNpc(Nov_608_Garwig,"NW_MONASTERY_ENTRY_01"); типа в библиотеке
	Wld_InsertNpc(NOV_609_Novize,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(NOV_610_Novize,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(NOV_611_Novize,"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc(NOV_615_Novize,"NW_MONASTERY_ENTRY_01");
	
	Wld_InsertNpc(Sheep_Monastery,"FP_ROAM_MONASTERY_01");
	Wld_InsertNpc(Sheep_Monastery,"FP_ROAM_MONASTERY_02");
	Wld_InsertNpc(Sheep_Monastery,"FP_ROAM_MONASTERY_03");
	Wld_InsertNpc(Sheep_Monastery,"FP_ROAM_MONASTERY_03");
	
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Scavenger,"NW_PATH_TO_MONASTER_AREA_11");
		Wld_InsertNpc(Scavenger,"NW_PATH_TO_MONASTER_AREA_11");
		Wld_InsertNpc(Scavenger,"NW_PATH_TO_MONASTER_MONSTER22");
	}
	else	{
		Wld_InsertNpc(Giant_Bug,"NW_PATH_TO_MONASTER_AREA_11");
		Wld_InsertNpc(Giant_Bug,"NW_PATH_TO_MONASTER_MONSTER22");
	};
	Wld_InsertNpc(Giant_Rat,"NW_PATH_TO_MONASTER_AREA_01");
	B_InsertNpc_Rnd(Giant_Rat,"NW_PATH_TO_MONASTER_AREA_01",80);
	B_InsertNpc_Rnd(Giant_Rat,"NW_PATH_TO_MONASTER_AREA_08",90);
	B_InsertNpc_Rnd(Giant_Rat,"NW_PATH_TO_MONASTER_AREA_10",80);
	Wld_InsertNpc(Molerat,"NW_SHRINE_MONSTER");
	Wld_InsertNpc(Molerat,"NW_SHRINE_MONSTER");
	Wld_InsertNpc(Scavenger,"NW_FOREST_CONNECT_MONSTER2");
	B_InsertNpc_Rnd(Scavenger,"NW_FOREST_CONNECT_MONSTER2",70);
	B_InsertNpc_Rnd(Scavenger,"NW_FOREST_CONNECT_MONSTER2",50);
};

func void INIT_SUB_NewWorld_Part_Monastery_MR()
{
	Wld_AssignRoomToGuild("kloster01",GIL_PUBLIC);	//церковь
	Wld_AssignRoomToGuild("kloster02",GIL_PUBLIC);	//библиотека
	Wld_AssignRoomToGuild("kloster11",GIL_PUBLIC);	//спуск в подвал
	Wld_AssignRoomToGuild("kloster13",GIL_KDF);	//винокурня
	Wld_AssignRoomToGuild("kloster04",GIL_PUBLIC);	//часовня
	Wld_AssignRoomToGuild("kloster03",GIL_NOV);	//справа от часовни
	Wld_AssignRoomToGuild("kloster05",GIL_NOV);	//слева от часовни
	Wld_AssignRoomToGuild("kloster10",GIL_NOV);	//слева от спуска в подвал
	Wld_AssignRoomToGuild("kloster12",GIL_NOV);	//справа от спуска в подвал
	Wld_AssignRoomToGuild("kloster06",GIL_KDF);	//одноместная комната
	Wld_AssignRoomToGuild("kloster07",GIL_KDF);	//напротив библиотеки
	Wld_AssignRoomToGuild("kloster08",GIL_KDF);	//напротив винокурни
	Wld_AssignRoomToGuild("kloster09",GIL_KDF);	//комната Безымянного
	//* PORTALS
	// Подвал
	Wld_AssignRoomToGuild("kloster111", GIL_PUBLIC);
	Wld_AssignRoomToGuild("kloster112", GIL_PUBLIC);	//лаборатория
	Wld_AssignRoomToGuild("kloster113", GIL_PUBLIC);
	Wld_AssignRoomToGuild("kloster114", GIL_KDF);
	Wld_AssignRoomToGuild("kloster115", GIL_KDF);
	Wld_AssignRoomToGuild("kloster116", GIL_PUBLIC);
	Wld_AssignRoomToGuild("kloster117", GIL_PUBLIC);
	Wld_AssignRoomToGuild("kloster118", GIL_PUBLIC);
	// тайный ход, лабиринт и библиотека
	Wld_AssignRoomToGuild("kloster119", GIL_ROOMNONE);
	Wld_AssignRoomToGuild("kloster120", GIL_CAVE);
	Wld_AssignRoomToGuild("kloster121", GIL_CAVE);
	Wld_AssignRoomToGuild("kloster122", GIL_CAVE);
	Wld_AssignRoomToGuild("kloster123", GIL_CAVE);
	Wld_AssignRoomToGuild("kloster124", GIL_CAVE);
	Wld_AssignRoomToGuild("kloster125", GIL_ROOMNONE);
	Wld_AssignRoomToGuild("kloster126", GIL_ROOMNONE);
	Wld_AssignRoomToGuild("kloster127", GIL_ROOMNONE);
	//*/
};

func void INIT_NewWorld_Part_Monastery_MR()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	INIT_SUB_NewWorld_Part_Monastery_MR();
};

func void STARTUP_NewWorld_Part_GreatPeasant_MR()
{
	var int rnd;
	
	Wld_InsertNpc(OUT_1220_Niclas,"NW_TAVERNE_TROLLAREA_MONSTER_02_01");
	
	//ферма Онара
	Wld_InsertNpc(Bau_900_Onar,"BIGFARM");
	Wld_InsertNpc(BAU_901_Bauer,"BIGFARM");
	Wld_InsertNpc(BAU_902_Gunnar,"BIGFARM");
	Wld_InsertNpc(Bau_903_Bodo,"BIGFARM");
	Wld_InsertNpc(BAU_904_Bauer,"BIGFARM");
	Wld_InsertNpc(BAU_905_Bauer,"BIGFARM");
	Wld_InsertNpc(BAU_907_Wasili,"BIGFARM");
	Wld_InsertNpc(BAU_908_Hodges,"BIGFARM");
	Wld_InsertNpc(BAU_910_Maria,"BIGFARM");
	Wld_InsertNpc(Bau_912_Pepe,"BIGFARM");
	Wld_InsertNpc(BAU_913_Thekla,"BIGFARM");
	Wld_InsertNpc(BAU_914_Baeuerin,"BIGFARM");
	Wld_InsertNpc(BAU_915_Baeuerin,"BIGFARM");
	Wld_InsertNpc(BAU_916_Bauer,"BIGFARM");
	Wld_InsertNpc(BAU_917_Bauer,"BIGFARM");
	Wld_InsertNpc(BAU_918_Bauer,"BIGFARM");
	Wld_InsertNpc(BAU_919_Bauer,"BIGFARM");
	Wld_InsertNpc(BAU_920_Bauer,"BIGFARM");
	Wld_InsertNpc(BAU_921_Bauer,"BIGFARM");
	
	Wld_InsertNpc(OUT_1203_Sagitta,"BIGFARM");

	Wld_InsertNpc(Sheep,"NW_BIGFARM_SHEEP1_01");
	Wld_InsertNpc(Sheep,"NW_BIGFARM_SHEEP1_01");
	Wld_InsertNpc(Hammel,"NW_BIGFARM_SHEEP1_01");
	Wld_InsertNpc(Sheep,"NW_BIGFARM_SHEEP1_02");
	Wld_InsertNpc(Sheep,"NW_BIGFARM_SHEEP1_02");
	Wld_InsertNpc(Sheep,"NW_BIGFARM_SHEEP1_02");
	Wld_InsertNpc(Hammel,"NW_BIGFARM_SHEEP1_03");
	Wld_InsertNpc(Sheep,"NW_BIGFARM_SHEEP1_03");
	Wld_InsertNpc(Sheep,"NW_BIGFARM_SHEEP1_03");
	Wld_InsertNpc(Sheep,"FP_ROAM_NW_BIGFARM_SHEEP2_12");
	Wld_InsertNpc(Sheep,"FP_ROAM_NW_BIGFARM_SHEEP2_13");
	Wld_InsertNpc(Sheep,"FP_ROAM_NW_BIGFARM_SHEEP2_14");
	Wld_InsertNpc(Sheep,"FP_ROAM_NW_BIGFARM_SHEEP2_07");
	Wld_InsertNpc(Sheep,"FP_ROAM_NW_BIGFARM_SHEEP2_08");
	Wld_InsertNpc(Sheep,"FP_ROAM_NW_BIGFARM_SHEEP2_09");
	Wld_InsertNpc(Hammel,"NW_BIGFARM_SHEEP2_02");
	Wld_InsertNpc(Sheep,"NW_BIGFARM_SHEEP2_02");
	Wld_InsertNpc(Hammel,"NW_BIGFARM_SHEEP2_03");
	Wld_InsertNpc(Hammel,"NW_BIGFARM_SHEEP2_03");
	Wld_InsertNpc(Sheep,"NW_BIGFARM_SHEEP2_03");
	Wld_InsertNpc(Sheep,"NW_BIGFARM_SHEEP2_04");
	Wld_InsertNpc(Sheep,"NW_BIGFARM_SHEEP2_04");
	Wld_InsertNpc(Sheep,"NW_BIGFARM_KITCHEN_OUT_02");
	Wld_InsertNpc(Sheep,"NW_BIGFARM_KITCHEN_OUT_02");
	Wld_InsertNpc(Hammel,"NW_BIGFARM_KITCHEN_OUT_02");

	//верхние пастбища
	Wld_InsertNpc(BAU_960_Bengar,"BIGFARM");
	Wld_InsertNpc(BAU_961_Gaan,"BIGFARM");
	Wld_InsertNpc(BAU_962_Bauer,"BIGFARM");
	Wld_InsertNpc(BAU_963_Malak,"BIGFARM");
	Wld_InsertNpc(BAU_964_Bauer,"BIGFARM");
	Wld_InsertNpc(BAU_965_Bauer,"BIGFARM");
	Wld_InsertNpc(BAU_966_Bauer,"BIGFARM");
	Wld_InsertNpc(BAU_967_Bauer,"BIGFARM");
	Wld_InsertNpc(BAU_968_Bauer,"BIGFARM");
	Wld_InsertNpc(BAU_969_Bauer,"BIGFARM");
	
	Wld_InsertNpc(Sheep,"FP_ROAM_NW_FARM3_OUT_05_01");
	Wld_InsertNpc(Sheep,"FP_ROAM_NW_FARM3_OUT_05_02");
	Wld_InsertNpc(Hammel,"FP_ROAM_NW_FARM3_OUT_05_03");
	Wld_InsertNpc(Sheep,"FP_ROAM_NW_FARM3_OUT_05_04");

	//ферма Секоба
	Wld_InsertNpc(BAU_930_Sekob,"BIGFARM");
	Wld_InsertNpc(BAU_932_Balthasar,"BIGFARM");
	Wld_InsertNpc(Balthasar_Sheep1,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(Balthasar_Sheep2,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(Balthasar_Sheep3,"NW_BIGMILL_FARM3_BALTHASAR");
	
	Wld_InsertNpc(BAU_933_Rega,"BIGFARM");
	Wld_InsertNpc(BAU_934_Babera,"BIGFARM");
	Wld_InsertNpc(BAU_936_Rosi,"BIGFARM");
	Wld_InsertNpc(BAU_937_Bauer,"BIGFARM");
	Wld_InsertNpc(BAU_938_Bauer,"BIGFARM");
	
	
	// охотники и прочие
	Wld_InsertNpc(OUT_1204_Grom,"BIGFARM");
	Wld_InsertNpc(TargetInvis,"NW_TAVERNE_HUNTERCAMP_TARGET");

	//ФЕРМЫ - МОНСТРЫ ----------------------------

	//шахта
	Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_CASTLEMINE_TOWER_01");
	Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_CASTLEMINE_TOWER_02");
	Wld_InsertNpc(Skeleton,"FP_ROAM_CASTLEMINE_TOWER_03");
	Wld_InsertNpc(Skeleton_Bow,"FP_ROAM_CASTLEMINE_TOWER_UP_01");
	
	Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_CASTLEMINE_TOWER2_01");
	Wld_InsertNpc(Skeleton_Tower_Sit,"NW_CASTLEMINE_TOWER_06");
	Wld_InsertNpc(Lesser_Skeleton, "FP_ROAM_CASTLEMINE_TOWER2_02");
	Wld_InsertNpc(Skeleton,"FP_ROAM_CASTLEMINE_TOWER2_03");
	Wld_InsertNpc(Skeleton_Bow,"FP_ROAM_CASTLEMINE_TOWER2_UP_01");
	Wld_InsertNpc(Skeleton_CBow,"FP_ROAM_CASTLEMINE_TOWER2_UP_02");

	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_CASTLEMINE_PATH_HUT_01");
	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_CASTLEMINE_PATH_HUT_02");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_CASTLEMINE_PATH_HUT_03");
	
	Wld_InsertNpc(Molerat,"FP_ROAM_NW_CASTLEMINE_HUT_02");
	Wld_InsertNpc(Molerat,"FP_ROAM_NW_CASTLEMINE_HUT_04");
	
	Wld_InsertNpc(Giant_Bug,"NW_CASTLEMINE_02");
	
	Wld_InsertNpc(Minecrawler,"FP_ROAM_CASTLEMINE_12");
	Wld_InsertNpc(Skeleton_Miner,"FP_ROAM_CASTLEMINE_01");
	Wld_InsertNpc(Minecrawler,"FP_ROAM_CASTLEMINE_04");
	Wld_InsertNpc(Minecrawler,"FP_ROAM_CASTLEMINE_05");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CASTLEMINE_09");

	Wld_InsertNpc(Demon_Small,"FP_ROAM_CASTLEMINE2_14");
	Wld_InsertNpc(Zombie01,"FP_ROAM_CASTLEMINE2_07");
	Wld_InsertNpc(Zombie02,"FP_ROAM_CASTLEMINE2_13");
	Wld_InsertNpc(Zombie02,"FP_ROAM_CASTLEMINE2_11");
	Wld_InsertNpc(Zombie03,"FP_ROAM_CASTLEMINE2_12");
	
	Wld_InsertNpc(Troll,"NW_CASTLEMINE_TROLL_08");
	Wld_InsertNpc(Troll,"NW_CASTLEMINE_TROLL_07");

	//поля
	Wld_InsertNpc(Giant_Bug_Cave,"NW_BIGFARM_FELDREUBER");
	Wld_InsertNpc(Giant_Bug_Cave,"NW_BIGFARM_FELDREUBER2");
	Wld_InsertNpc(Giant_Bug_Cave,"NW_BIGFARM_FELDREUBER4");
	B_InsertNpc_Rnd(Giant_Bug_Cave,"NW_BIGFARM_FELDREUBER2",30);
	B_InsertNpc_Rnd(Giant_Bug_Cave,"NW_BIGFARM_FELDREUBER4",30);

	Wld_InsertNpc(Giant_Rat,"FP_ROAM_BIGMILL_PATH_06_MONSTER_01");
	Wld_InsertNpc(Giant_Rat,"FP_ROAM_BIGMILL_PATH_06_MONSTER_02");
	
	Wld_InsertNpc(Scavenger,"NW_BIGMILL_FIELD_MONSTER_02");
	Wld_InsertNpc(Scavenger,"NW_BIGMILL_FIELD_MONSTER_02");
	B_InsertNpc_Rnd(Scavenger,"NW_BIGMILL_FIELD_MONSTER_02",50);
	B_InsertNpc_Rnd(Scavenger,"NW_BIGMILL_FIELD_MONSTER_02",50);
	B_InsertNpc_Rnd(Scavenger,"NW_BIGMILL_FIELD_MONSTER_02",50);
	B_InsertNpc_Rnd(Scavenger,"NW_BIGMILL_FIELD_MONSTER_02",50);

	Wld_InsertNpc(Scavenger,"NW_BIGFARM_SEKOBWAY_02_MONSTER");
	B_InsertNpc_Rnd(Scavenger,"NW_BIGFARM_SEKOBWAY_02_MONSTER",70);
	B_InsertNpc_Rnd(Scavenger,"NW_BIGFARM_SEKOBWAY_02_MONSTER",70);
	B_InsertNpc_Rnd(Scavenger,"NW_BIGFARM_SEKOBWAY_02_MONSTER",70);
	
	rnd = Hlp_Random(100);
	if (rnd < 30)	{
		Wld_InsertNpc(Scavenger,"NW_BIGFARM_FIELD_MONSTER_01");
		Wld_InsertNpc(Scavenger,"NW_BIGFARM_FIELD_MONSTER_01");
		Wld_InsertNpc(Scavenger,"NW_BIGFARM_FIELD_MONSTER_01");
		Wld_InsertNpc(Scavenger,"NW_BIGFARM_FIELD_MONSTER_01");
	}
	else if (rnd < 60)	{
		Wld_InsertNpc(Giant_Rat,"NW_BIGFARM_FIELD_MONSTER_01");
		Wld_InsertNpc(Giant_Rat,"NW_BIGFARM_FIELD_MONSTER_01");
		Wld_InsertNpc(Giant_Rat,"NW_BIGFARM_FIELD_MONSTER_01");
	}
	else if (rnd < 90)	{
		Wld_InsertNpc(Molerat,"NW_BIGFARM_FIELD_MONSTER_01");
		Wld_InsertNpc(Molerat,"NW_BIGFARM_FIELD_MONSTER_01");
		Wld_InsertNpc(Molerat,"NW_BIGFARM_FIELD_MONSTER_01");
	}
	else 	{
		Wld_InsertNpc(Meatbug,"NW_BIGFARM_FIELD_MONSTER_01");
		Wld_InsertNpc(Meatbug,"NW_BIGFARM_FIELD_MONSTER_01");
		Wld_InsertNpc(Meatbug,"NW_BIGFARM_FIELD_MONSTER_01");
		Wld_InsertNpc(Meatbug,"NW_BIGFARM_FIELD_MONSTER_01");
		Wld_InsertNpc(Meatbug,"NW_BIGFARM_FIELD_MONSTER_01");
		Wld_InsertNpc(Meatbug,"NW_BIGFARM_FIELD_MONSTER_01");
	};
	
	//верхние пастбища
	Wld_InsertNpc(Wolf,"NW_BIGMILL_FARM3_RANGERBANDITS_01");
	Wld_InsertNpc(Wolf,"NW_BIGMILL_FARM3_RANGERBANDITS_02");
	Wld_InsertNpc(Wolf,"NW_BIGMILL_FARM3_RANGERBANDITS_03");
	Wld_InsertNpc(Wolf,"NW_BIGMILL_FARM3_RANGERBANDITS_04");
	
	Wld_InsertNpc(Scavenger,"FP_ROAM_NW_BIGMILL_FARM3_03_01");
	Wld_InsertNpc(Scavenger,"FP_ROAM_NW_BIGMILL_FARM3_03_02");
	Wld_InsertNpc(Scavenger,"FP_ROAM_NW_BIGMILL_FARM3_03_03");
	Wld_InsertNpc(Scavenger,"FP_ROAM_NW_BIGMILL_FARM3_03_04");
	
	Wld_InsertNpc(Keiler_Hog,"FP_ROAM_NW_FARM3_BIGWOOD_03_01");
	Wld_InsertNpc(Keiler,"FP_ROAM_NW_FARM3_BIGWOOD_03_02");
	Wld_InsertNpc(Keiler,"FP_ROAM_NW_FARM3_BIGWOOD_03_03");
	
	Wld_InsertNpc(Warg,"FP_ROAM_NW_FARM3_BIGWOOD_04_01");
	
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Bloodfly,"FP_ROAM_NW_FARM3_BIGWOOD_02_01");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_NW_FARM3_BIGWOOD_02_02");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_NW_FARM3_BIGWOOD_02_03");
	}
	else	{
		Wld_InsertNpc(Molerat,"FP_ROAM_NW_FARM3_BIGWOOD_02_01");
		
		Wld_InsertNpc(Molerat,"FP_ROAM_NW_FARM3_BIGWOOD_02_02");
		Wld_InsertNpc(Molerat,"FP_ROAM_NW_FARM3_BIGWOOD_02_03");
	};
	
	B_InsertNpc_Rnd(Lurker,"NW_FARM3_PATH_11_SMALLRIVER_03",70);
	B_InsertNpc_Rnd(Lurker,"NW_FARM3_PATH_11_SMALLRIVER_03",70);
	B_InsertNpc_Rnd(Lurker,"NW_FARM3_PATH_11_SMALLRIVER_03",70);
	B_InsertNpc_Rnd(Lurker,"NW_FARM3_PATH_11_SMALLRIVER_20",70);
	B_InsertNpc_Rnd(Lurker,"NW_FARM3_PATH_11_SMALLRIVER_20",70);
	B_InsertNpc_Rnd(Lurker,"NW_FARM3_PATH_11_SMALLRIVERMID_02",70);
	B_InsertNpc_Rnd(Lurker,"NW_FARM3_PATH_11_SMALLRIVERMID_03",70);
	B_InsertNpc_Rnd(Lurker,"NW_FARM3_PATH_11_SMALLRIVER_24",70);
	B_InsertNpc_Rnd(Lurker,"NW_FARM3_PATH_11_SMALLRIVER_24",20);
	
	Wld_InsertNpc(Keiler_Hog,"NW_FARM3_PATH_12_MONSTER_02");
	B_InsertNpc_Rnd(Keiler,"NW_FARM3_PATH_12_MONSTER_02",90);
	B_InsertNpc_Rnd(Keiler,"NW_FARM3_PATH_12_MONSTER_02",90);
	B_InsertNpc_Rnd(Keiler,"NW_FARM3_PATH_12_MONSTER_02",60);
	
	B_InsertNpc_Rnd(Scavenger,"NW_FARM3_PATH_11_SMALLRIVER_10",40);
	B_InsertNpc_Rnd(Scavenger,"NW_FARM3_PATH_11_SMALLRIVER_10",40);
	B_InsertNpc_Rnd(Scavenger,"NW_FARM3_PATH_11_SMALLRIVER_10",40);
	B_InsertNpc_Rnd(Scavenger,"NW_FARM3_PATH_11_SMALLRIVER_10",40);
	
	B_InsertNpc_Rnd(Scavenger,"NW_FARM3_PATH_11_SMALLRIVER_15",50);
	B_InsertNpc_Rnd(Scavenger,"NW_FARM3_PATH_11_SMALLRIVER_15",50);
	B_InsertNpc_Rnd(Scavenger,"NW_FARM3_PATH_11_SMALLRIVER_15",50);
	
	if (Hlp_Random(100) < 50)	{
		B_InsertNpc_Rnd(Giant_Bug,"NW_FARM3_PATH_LEVELCHANGE_01",80);
		B_InsertNpc_Rnd(Giant_Bug,"NW_FARM3_PATH_LEVELCHANGE_01",80);
	}
	else	{
		B_InsertNpc(Keiler,"NW_FARM3_PATH_LEVELCHANGE_01");
	};
	
	//озеро
	Wld_InsertNpc(SwampGolem,"NW_LAKE_GREG_TREASURE_01");
	
	B_InsertNpc_Rnd(Lurker,"NW_LAKE__WATER_05",90);
	B_InsertNpc_Rnd(Lurker,"NW_LAKE__WATER_05",50);
	B_InsertNpc_Rnd(Lurker,"NW_LAKE__WATER_05",25);
	
	B_InsertNpc_Rnd(Wolf,"NW_BIGFARM_LAKE_CAVE_01",90);
	B_InsertNpc_Rnd(Wolf,"NW_BIGFARM_LAKE_CAVE_01",50);
	B_InsertNpc_Rnd(Wolf,"NW_BIGFARM_LAKE_CAVE_01",30);
	
	B_InsertNpc_Rnd(Gobbo_Green,"NW_BIGFARM_LAKE_CAVE_10",70);
	B_InsertNpc_Rnd(Gobbo_Green,"NW_BIGFARM_LAKE_CAVE_10",70);
	B_InsertNpc_Rnd(Gobbo_Green,"NW_BIGFARM_LAKE_CAVE_10",70);
	B_InsertNpc_Rnd(Gobbo_Black,"NW_BIGFARM_LAKE_CAVE_10",70);
	B_InsertNpc_Rnd(Gobbo_Black,"NW_BIGFARM_LAKE_CAVE_04",70);
	B_InsertNpc_Rnd(Gobbo_Black,"NW_BIGFARM_LAKE_CAVE_05",70);
	B_InsertNpc_Rnd(Gobbo_Black,"NW_BIGFARM_LAKE_CAVE_05",70);
	B_InsertNpc_Rnd(Gobbo_Black,"NW_BIGFARM_LAKE_CAVE_05",70);
	B_InsertNpc_Rnd(Gobbo_Black,"NW_BIGFARM_LAKE_CAVE_05",70);
	B_InsertNpc_Rnd(Gobbo_Black,"NW_BIGFARM_LAKE_CAVE_07",70);
	B_InsertNpc_Rnd(Gobbo_Black,"NW_BIGFARM_LAKE_CAVE_07",70);
	B_InsertNpc_Rnd(Gobbo_Warrior,"NW_BIGFARM_LAKE_CAVE_07",70);
	B_InsertNpc_Rnd(Gobbo_Warrior,"NW_BIGFARM_LAKE_CAVE_07",70);
	
	if (!C_HeroIs_Elena())	{
		B_InsertNpc_Rnd(Keiler,"NW_BIGFARM_LAKE_MONSTER_03_01",90);
		B_InsertNpc_Rnd(Keiler,"NW_BIGFARM_LAKE_MONSTER_03_01",50);
	};
	
	B_InsertNpc_Rnd(Waran,"NW_BIGFARM_LAKE_03_MOVEMENT",30);
	B_InsertNpc_Rnd(Waran,"NW_BIGFARM_LAKE_03_MOVEMENT3",30);
	B_InsertNpc_Rnd(Waran,"NW_BIGFARM_LAKE_03_MOVEMENT5",30);

	//дорога в горы
	Wld_InsertNpc(Gobbo_Black,"NW_TAVERNE_TROLLAREA_MONSTER_04_01");
	if (!B_InsertNpc_Rnd(Gobbo_Warrior,"NW_TAVERNE_TROLLAREA_MONSTER_04_01",50))	{
		Wld_InsertNpc(Gobbo_Black,"NW_TAVERNE_TROLLAREA_MONSTER_04_01");
	};
	
	B_InsertNpc_Rnd(Gobbo_Green,"NW_TAVERNE_TROLLAREA_MONSTER_05_01",60);
	B_InsertNpc_Rnd(Gobbo_Green,"NW_TAVERNE_TROLLAREA_MONSTER_05_01",60);
	B_InsertNpc_Rnd(Gobbo_Green,"NW_TAVERNE_TROLLAREA_MONSTER_05_01",60);
	
	B_InsertNpc_Rnd(BlackWolf,"NW_TAVERNE_TROLLAREA_MONSTER_05_01M1",80);
	B_InsertNpc_Rnd(BlackWolf,"NW_TAVERNE_TROLLAREA_MONSTER_05_01M1",80);
	B_InsertNpc_Rnd(BlackWolf,"NW_TAVERNE_TROLLAREA_MONSTER_05_01M1",80);
	
	//лес у Сагитты
	if (Hlp_Random(100) < 70)	{
		Wld_InsertNpc(Shadowbeast,"NW_FARM4_WOOD_RANGERBANDITS_02");
	}
	else	{
		Wld_InsertNpc(Warg,"NW_FARM4_WOOD_RANGERBANDITS_02");
		B_InsertNpc_Rnd(Warg,"NW_FARM4_WOOD_RANGERBANDITS_02",60);
		B_InsertNpc_Rnd(Warg,"NW_FARM4_WOOD_RANGERBANDITS_02",60);
	};
	
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Wolf_Till,"NW_FARM4_WOOD_NEARPEASANT7");
		Wld_InsertNpc(Wolf_Till,"NW_FARM4_WOOD_NEARPEASANT7");
	}
	else	{
		Wld_InsertNpc(Wolf_Till,"NW_FARM4_WOOD_MONSTER_04");
		Wld_InsertNpc(Wolf_Till,"NW_FARM4_WOOD_MONSTER_04");
	};
	
	
	Wld_InsertNpc(Keiler,"NW_FARM4_WOOD_MONSTER_02");
	Wld_InsertNpc(Keiler,"NW_FARM4_WOOD_MONSTER_02");
	Wld_InsertNpc(Keiler_Hog,"NW_FARM4_WOOD_MONSTER_02");
	
	B_InsertNpc_Rnd(BlackWolf,"NW_FARM4_WOOD_MONSTER_05",70);
	B_InsertNpc_Rnd(BlackWolf,"NW_FARM4_WOOD_MONSTER_05",70);
	B_InsertNpc_Rnd(BlackWolf,"NW_FARM4_WOOD_MONSTER_05",70);
	
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Keiler_Hog,"NW_FARM4_WOOD_MONSTER_01");
	}
	else	{
		Wld_InsertNpc(Keiler,"NW_FARM4_WOOD_MONSTER_01");
		Wld_InsertNpc(Keiler,"NW_FARM4_WOOD_MONSTER_01");
	};

	Wld_InsertNpc(Shadowbeast,"NW_SAGITTA_MOREMONSTER_03");
	
	B_InsertNpc_Rnd(Keiler,"NW_FARM4_WOOD_NEARPEASANT3",70);
	B_InsertNpc_Rnd(Keiler,"NW_FARM4_WOOD_NEARPEASANT3",70);
	B_InsertNpc_Rnd(Keiler,"NW_FARM4_WOOD_NEARPEASANT3",70);
	B_InsertNpc_Rnd(Keiler,"NW_FARM4_WOOD_NEARPEASANT3",70);
	B_InsertNpc_Rnd(Keiler,"NW_FARM4_WOOD_NEARPEASANT3",70);
	
	B_InsertNpc_Rnd(Molerat,"NW_FARM4_WOOD_MONSTER_08",80);
	B_InsertNpc_Rnd(Molerat,"NW_FARM4_WOOD_MONSTER_08",80);
	B_InsertNpc_Rnd(Molerat,"NW_FARM4_WOOD_MONSTER_09",90);
	
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Keiler,"NW_FARM4_WOOD_MONSTER_10");
		Wld_InsertNpc(Keiler,"NW_FARM4_WOOD_MONSTER_10");
		Wld_InsertNpc(Keiler,"NW_FARM4_WOOD_MONSTER_10");
	}
	else	{
		Wld_InsertNpc(Keiler,"NW_FARM4_WOOD_NAVIGATION_09");
		Wld_InsertNpc(Keiler,"NW_FARM4_WOOD_NAVIGATION_09");
	};
	
	//склеп
	Wld_InsertNpc(Skeleton,"FP_ROAM_NW_CRYPT_01");
	Wld_InsertNpc(Skeleton,"FP_ROAM_NW_CRYPT_02");
	Wld_InsertNpc(Skeleton_Lord,"NW_CRYPT_IN_01");

	B_InsertNpc_Rnd(Gobbo_Skeleton,"NW_FARM4_WOOD_NEARPEASANT2_14",50);
	B_InsertNpc_Rnd(Gobbo_Skeleton,"NW_FARM4_WOOD_NEARPEASANT2_14",50);
	
	//лес за фермой
	B_InsertNpc_Rnd(Keiler,"NW_CRYPT_MONSTER04",60);
	B_InsertNpc_Rnd(Keiler,"NW_CRYPT_MONSTER04",60);
	B_InsertNpc_Rnd(Keiler,"NW_CRYPT_MONSTER08",60);
	B_InsertNpc_Rnd(Keiler,"NW_CRYPT_MONSTER08",60);

	B_InsertNpc_Rnd(Wolf,"NW_CRYPT_MONSTER06",80);
	B_InsertNpc_Rnd(Wolf,"NW_CRYPT_MONSTER06",80);
	B_InsertNpc_Rnd(Wolf,"NW_CRYPT_MONSTER06",80);
	
	B_InsertNpc_Rnd(Wolf,"FP_ROAM_NW_CRYPT_MONSTER12_01",90);
	B_InsertNpc_Rnd(Wolf,"FP_ROAM_NW_CRYPT_MONSTER12_02",90);

	//гоблины в пещере
	if (C_HeroIs_Till())	{
		Wld_InsertNpc(Gobbo_Warrior_Visir_Till,"NW_BIGFARM_FOREST_08");
	};
	Wld_InsertNpc(Gobbo_Warrior_Till_1,"NW_BIGFARM_FOREST_08");
	Wld_InsertNpc(Gobbo_Black_Till_1,"NW_BIGFARM_FOREST_08");
	Wld_InsertNpc(Gobbo_Black_Till_2,"NW_BIGFARM_FOREST_08");
	Wld_InsertNpc(Gobbo_Warrior_Till_2,"NW_BIGFARM_FOREST_05");
	Wld_InsertNpc(Gobbo_Black_Till_3,"NW_BIGFARM_FOREST_05");
	Wld_InsertNpc(Gobbo_Green_Till_1,"NW_BIGFARM_FOREST_05");
	Wld_InsertNpc(Gobbo_Green_Till_2,"NW_BIGFARM_FOREST_05");


	B_InsertNpc_Rnd(Molerat,"NW_BIGFARM_FOREST_02",70);
	B_InsertNpc_Rnd(Molerat,"NW_BIGFARM_FOREST_02",70);
};

func void INIT_SUB_NewWorld_Part_GreatPeasant_MR()
{
	var C_NPC RoomOwner;
	//* PORTALS
	// Ферма Онара
	RoomOwner = Hlp_GetNpc(Bau_900_Onar);
	Wld_AssignRoomToNpc("grphaupthaus01",RoomOwner);
	Wld_AssignRoomToNpc("grpschmiede01",RoomOwner);
	Wld_AssignRoomToNpc("grpscheune01",RoomOwner);
	Wld_AssignRoomToGuild("grpkapelle01",GIL_ROOMNONE);
	// Ферма Секоба
	RoomOwner = Hlp_GetNpc(BAU_930_Sekob);
	Wld_AssignRoomToNpc("grpbauer01",RoomOwner);
	Wld_AssignRoomToNpc("grpbauerscheune01",RoomOwner);
	// Ферма Бенгара
	RoomOwner = Hlp_GetNpc(BAU_960_Bengar);
	Wld_AssignRoomToNpc("grpbauer02",RoomOwner);
	Wld_AssignRoomToNpc("grpbauerscheune02",RoomOwner);
	// Другое жилье
	RoomOwner = Hlp_GetNpc(CMP_Erol);
	if (Hlp_IsValidNpc(RoomOwner))	{
		Wld_AssignRoomToNpc("grpwaldhuette01",RoomOwner);
	}
	else	{
		Wld_AssignRoomToGuild("grpwaldhuette01",GIL_ROOMNONE);
	};
	/*UNFINISHED охотники
	RoomOwner = Hlp_GetNpc(OUT_1200_Engrom);
	if (Hlp_IsValidNpc(RoomOwner))	{
		Wld_AssignRoomToNpc("grpwaldhuette01",RoomOwner);
	}
	else	{
		Wld_AssignRoomToGuild("grpwaldhuette01",GIL_ROOMNONE);
	};
	//*/
	Wld_AssignRoomToGuild("grpturm01",GIL_ROOMNONE);
	Wld_AssignRoomToGuild("grpturm02",GIL_ROOMNONE);
	Wld_AssignRoomToGuild("grpwaldhuette02",GIL_ROOMNONE);
	// Склеп
	Wld_AssignRoomToGuild("cementary01",GIL_DUNGEON);
	Wld_AssignRoomToGuild("cementary02",GIL_DUNGEON);
	Wld_AssignRoomToGuild("cementary03",GIL_DUNGEON);
	Wld_AssignRoomToGuild("cementary04",GIL_DUNGEON);
	Wld_AssignRoomToGuild("cementary05",GIL_DUNGEON);
	// Пещеры
	Wld_AssignRoomToGuild("grpcave01",GIL_CAVE);
	Wld_AssignRoomToGuild("grpcave02",GIL_CAVE);
	Wld_AssignRoomToGuild("grpcave03",GIL_GOBBO);
	Wld_AssignRoomToGuild("grpcave04",GIL_MINECRAWLER);
	Wld_AssignRoomToGuild("grpcave05",GIL_CAVE);
	/*/
	if(MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
	{
		Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
	}
	else
	{
		Wld_AssignRoomToGuild("grpwaldhuette01",GIL_SLD);
	};
	Wld_AssignRoomToGuild("grphaupthaus01",GIL_PUBLIC);
	Wld_AssignRoomToGuild("grpschmiede01",GIL_PUBLIC);
	Wld_AssignRoomToGuild("grpscheune01",GIL_PUBLIC);
	Wld_AssignRoomToGuild("grpkapelle01",GIL_NONE);
	Wld_AssignRoomToGuild("cementary01",GIL_NONE);
	if(Sekob_RoomFree == FALSE)
	{
		Wld_AssignRoomToGuild("grpbauer01",GIL_PUBLIC);
	}
	else
	{
		Wld_AssignRoomToGuild("grpbauer01",GIL_NONE);
	};
	Wld_AssignRoomToGuild("grpbauerscheune01",GIL_PUBLIC);
	Wld_AssignRoomToGuild("grpbauer02",GIL_PUBLIC);
	Wld_AssignRoomToGuild("grpbauerscheune02",GIL_PUBLIC);
	Wld_AssignRoomToGuild("grpturm02",GIL_PUBLIC);
	Wld_AssignRoomToGuild("grpturm01",GIL_PUBLIC);
	Wld_AssignRoomToGuild("grpwaldhuette02",GIL_PUBLIC);
	//*/
};

func void INIT_NewWorld_Part_GreatPeasant_MR()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	INIT_SUB_NewWorld_Part_GreatPeasant_MR();
};

func void STARTUP_NewWorld_Part_Pass_To_OW_MR()
{
	Wld_InsertNpc(YWolf,"NW_PASS_06");
	Wld_InsertNpc(YWolf,"NW_PASS_06");
	Wld_InsertNpc(YWolf,"NW_PASS_11");
	Wld_InsertNpc(YWolf,"NW_PASS_11");
	
	Wld_InsertNpc(YWolf,"NW_PASS_SECRET_15");
	Wld_InsertNpc(YWolf,"NW_PASS_SECRET_16");
	Wld_InsertNpc(YWolf,"NW_PASS_SECRET_16");
	Wld_InsertNpc(YWolf,"NW_PASS_SECRET_17");
	
	Wld_InsertNpc(Giant_Rat,"NW_PASS_SECRET_05");
	Wld_InsertNpc(Giant_Rat,"NW_PASS_SECRET_06");
	Wld_InsertNpc(Giant_Rat,"NW_PASS_SECRET_07");
	Wld_InsertNpc(Giant_Rat,"NW_PASS_SECRET_08");
	
	Wld_InsertNpc(Gobbo_Green,"NW_PASS_GRAT_04");
	Wld_InsertNpc(Gobbo_Green,"NW_PASS_GRAT_05");
	Wld_InsertNpc(Gobbo_Green,"NW_PASS_GRAT_05");
	Wld_InsertNpc(Gobbo_Green,"NW_PASS_GRAT_06");
	Wld_InsertNpc(Gobbo_Green,"NW_PASS_GRAT_06");
};

func void INIT_SUB_NewWorld_Part_Pass_To_OW_MR()
{
	//* PORTALS
	Wld_AssignRoomToGuild("passdungeon01",GIL_CAVE);
	//*/
};

func void INIT_NewWorld_Part_Pass_To_OW_MR()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	INIT_SUB_NewWorld_Part_Pass_To_OW_MR();
};

func void STARTUP_NewWorld_Part_Forest_MR()
{
	Wld_InsertNpc(VLK_444_Jack,"NW_CITY_ENTRANCE_01");

	Wld_InsertNpc(BAU_940_Akil,"FARM2");
	Wld_InsertNpc(BAU_941_Kati,"FARM2");
	Wld_InsertNpc(BAU_942_Randolph,"FARM2");
	Wld_InsertNpc(BAU_943_Bauer,"FARM2");
	Wld_InsertNpc(BAU_944_Ehnim,"FARM2");
	Wld_InsertNpc(BAU_945_Egill,"FARM2");
	Wld_InsertNpc(BAU_973_Rukhar,"FARM2");
	
	Wld_InsertNpc(Sheep,"NW_FARM2_OUT_02");
	Wld_InsertNpc(Sheep,"NW_FARM2_OUT_02");
	
	Wld_InsertNpc(OUT_1202_Orlan,"TAVERNE");
	Wld_InsertNpc(BAU_971_Bauer,"TAVERNE");
	Wld_InsertNpc(BAU_972_Bauer,"TAVERNE");
	Wld_InsertNpc(BAU_974_Bauer,"NW_TAVERNE_IN_07");
	
	Wld_InsertNpc(OUT_1200_Engrom,"NW_TAVERNE_TROLLAREA_MONSTER_02_01");
	
	Wld_InsertNpc(OUT_1201_OldShepherd,"NW_SHEPHERD_01");
	Wld_InsertNpc(Sheep_OldShepherd,"FP_ROAM_SHEPHERD_01");
	Wld_InsertNpc(Sheep_OldShepherd,"FP_ROAM_SHEPHERD_02");
	Wld_InsertNpc(Sheep_OldShepherd,"FP_ROAM_SHEPHERD_03");
	Wld_InsertNpc(Sheep_OldShepherd,"FP_ROAM_SHEPHERD_04");
	Wld_InsertNpc(Sheep_OldShepherd,"FP_ROAM_SHEPHERD_05");
	Wld_InsertNpc(Sheep_OldShepherd,"FP_ROAM_SHEPHERD_06");
	Wld_InsertNpc(Hammel,"FP_ROAM_SHEPHERD_07");
	
	Wld_InsertNpc(BDT_801_Chief,"NW_FOREST_VINOSKELLEREI_04");
	Wld_InsertNpc(BDT_802_Bootlegger,"NW_FOREST_VINOSKELLEREI_04");
	Wld_InsertNpc(BDT_803_Bootlegger,"NW_FOREST_VINOSKELLEREI_04");
	Wld_InsertNpc(BDT_804_Bootlegger,"NW_FOREST_VINOSKELLEREI_04");

	Wld_InsertNpc(Molerat,"FP_ROAM_SHEPHERD_OUT_01_01");
	Wld_InsertNpc(Molerat,"FP_ROAM_SHEPHERD_OUT_01_03");
	Wld_InsertNpc(Waran,"FP_ROAM_SHEPHERD_OUT_02_01");
	
	//кладбище за таверной
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Molerat,"NW_FARM2_TO_TAVERN_09_MONSTER4");
		Wld_InsertNpc(Molerat,"NW_FARM2_TO_TAVERN_09_MONSTER4");
	}
	else
	{
		Wld_InsertNpc(Molerat,"NW_FARM2_TO_TAVERN_09_MONSTER3");
		Wld_InsertNpc(Molerat,"NW_FARM2_TO_TAVERN_09_MONSTER3");
	};
	
	Wld_InsertNpc(Wolf,"NW_FARM2_TO_TAVERN_09_MONSTER5");
	Wld_InsertNpc(Wolf,"NW_FARM2_TO_TAVERN_09_MONSTER5");
	Wld_InsertNpc(Wolf,"NW_FARM2_TO_TAVERN_09_MONSTER5");
	
	Wld_InsertNpc(Lesser_Skeleton,"NW_FARM2_TAVERNCAVE1_08");
	Wld_InsertNpc(Lesser_Skeleton,"NW_FARM2_TAVERNCAVE1_10");
	Wld_InsertNpc(Gobbo_Green,"NW_FARM2_TAVERNCAVE1_02");
	Wld_InsertNpc(Gobbo_Green,"NW_FARM2_TAVERNCAVE1_02");
	Wld_InsertNpc(Gobbo_Black,"NW_FARM2_TAVERNCAVE1_02");
	if (C_HeroIs_Erol())	{
		Wld_InsertNpc(Gobbo_Warrior_Visir_Erol,"NW_FARM2_TAVERNCAVE1_02");
	};

	//около города
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Giant_Rat,"FP_ROAM_CITY_TO_FOREST_13");
		Wld_InsertNpc(Giant_Rat,"FP_ROAM_CITY_TO_FOREST_13");
		Wld_InsertNpc(Giant_Rat,"FP_ROAM_CITY_TO_FOREST_13");
		Wld_InsertNpc(Molerat,"NW_CITY_SMFOREST_03");
		Wld_InsertNpc(Molerat,"NW_CITY_SMFOREST_03_M");
	}
	else	{
		Wld_InsertNpc(Molerat,"FP_ROAM_CITY_TO_FOREST_13");
		Wld_InsertNpc(Molerat,"FP_ROAM_CITY_TO_FOREST_13");
		Wld_InsertNpc(Molerat,"FP_ROAM_CITY_TO_FOREST_13");
		Wld_InsertNpc(Giant_Rat,"NW_CITY_SMFOREST_03");
		Wld_InsertNpc(Giant_Rat,"NW_CITY_SMFOREST_03_M");
	};
	//пещера
	Wld_InsertNpc(Bloodfly,"NW_CITY_SMFOREST_05");
	Wld_InsertNpc(Bloodfly,"NW_CITY_SMFOREST_05");
	B_InsertNpc_Rnd(Bloodfly,"NW_CITY_SMFOREST_05",50);
	B_InsertNpc_Rnd(Bloodfly,"NW_CITY_SMFOREST_05",50);
	B_InsertNpc_Rnd(Bloodfly,"NW_CITY_SMFOREST_06",50);
	B_InsertNpc_Rnd(Bloodfly,"NW_CITY_SMFOREST_06",50);
	B_InsertNpc_Rnd(Bloodfly,"NW_CITY_SMFOREST_06",50);
	B_InsertNpc_Rnd(Giant_Rat,"NW_CITY_SMFOREST_08",80);
	B_InsertNpc_Rnd(Giant_Rat,"NW_CITY_SMFOREST_09",50);
	B_InsertNpc_Rnd(Meatbug,"NW_CITY_SMFOREST_09",90);
	B_InsertNpc_Rnd(Meatbug,"NW_CITY_SMFOREST_09",90);
	B_InsertNpc_Rnd(Meatbug,"NW_CITY_SMFOREST_09",90);
	B_InsertNpc_Rnd(Meatbug,"NW_CITY_SMFOREST_09",90);
	Wld_InsertNpc(Waran,"NW_CITY_SMFOREST_BANDIT_04");
	
	
	//долина около города
	B_InsertNpc_Rnd(Keiler,"NW_CITYFOREST_06",90);
	B_InsertNpc_Rnd(Keiler,"NW_CITYFOREST_06",90);
	B_InsertNpc_Rnd(Keiler,"NW_CITYFOREST_06",90);
	Wld_InsertNpc(Keiler_Hog,"FP_ROAM_CITYFOREST_KAP3_18");
	B_InsertNpc_Rnd(Keiler_Hog,"FP_ROAM_CITYFOREST_KAP4_01",90);
	if (Hlp_Random(100) < 40)	{
		Wld_InsertNpc(Warg,"NW_CITYFOREST2_03");
		Wld_InsertNpc(Warg,"NW_CITYFOREST2_03");
	}
	else	{
		Wld_InsertNpc(Scavenger,"NW_CITYFOREST2_03");
		Wld_InsertNpc(Scavenger,"NW_CITYFOREST2_03");
		Wld_InsertNpc(Scavenger,"NW_CITYFOREST2_03");
	};
	//пещера
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_CITYFOREST_KAP3_06");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_CITYFOREST_KAP3_07");
	Wld_InsertNpc(Gobbo_Warrior,"FP_ROAM_CITYFOREST_KAP3_08");
	Wld_InsertNpc(Gobbo_Warrior,"FP_ROAM_CITYFOREST_KAP3_05");
	Wld_InsertNpc(Gobbo_Warrior_Visir,"NW_CITYFOREST_CAVE_A01");
	Wld_InsertNpc(Gobbo_Warrior_Visir,"NW_CITYFOREST_CAVE_A01");
	Wld_InsertNpc(Gobbo_Warrior,"NW_CITYFOREST_CAVE_04");
	Wld_InsertNpc(Gobbo_Black,"NW_CITYFOREST_CAVE_06");
	Wld_InsertNpc(Gobbo_Black,"NW_CITYFOREST_CAVE_06");
	Wld_InsertNpc(Shadowbeast,"NW_CITYFOREST_CAVE_A06");
	
	//дорога к таверне
	//ельник
	if (Hlp_Random(100) < 60)	{
		Wld_InsertNpc(Wolf,"NW_CITY_TO_FOREST_04_02");
		Wld_InsertNpc(Wolf,"NW_CITY_TO_FOREST_04_02");
		Wld_InsertNpc(Wolf,"NW_CITY_TO_FOREST_04_02");
	}
	else	{
		Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_56");
		Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_57");
		Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_58");
	};
	B_InsertNpc_Rnd(Wolf,"NW_CITY_TO_FOREST_04",70);
	//пещера
	B_InsertNpc_Rnd(Giant_Bug,"NW_CITY_TO_FOREST_04_05",80);
	B_InsertNpc_Rnd(Giant_Bug,"NW_CITY_TO_FOREST_04_05",80);
	B_InsertNpc_Rnd(Giant_Bug,"NW_CITY_TO_FOREST_04_05",80);
	//дорога
	if (!C_HeroIs_Elena())	{
		B_InsertNpc_Rnd(Giant_Bug,"NW_CITY_TO_FOREST_12",80);
		B_InsertNpc_Rnd(Giant_Bug,"NW_CITY_TO_FOREST_12",40);
	};
	if (Hlp_Random(100) < 40)	{
		Wld_InsertNpc(Gobbo_Green,"NW_CITY_TO_FOREST_13");
		Wld_InsertNpc(Gobbo_Green,"NW_CITY_TO_FOREST_13");
	}
	else if (Hlp_Random(100) < 60)	{
		Wld_InsertNpc(Gobbo_Green,"NW_CITY_TO_FOREST_18");
		Wld_InsertNpc(Gobbo_Green,"NW_CITY_TO_FOREST_18");
	}
	else	{
		Wld_InsertNpc(Gobbo_Green,"NW_CITY_TO_FARM2_01");
		Wld_InsertNpc(Gobbo_Green,"NW_CITY_TO_FARM2_01");
		Wld_InsertNpc(Gobbo_Green,"NW_CITY_TO_FARM2_01");
	};
	//под мостом
	B_InsertNpc_Rnd(Bloodfly,"NW_TAVERN_TO_FOREST_04",80);
	B_InsertNpc_Rnd(Bloodfly,"NW_TAVERN_TO_FOREST_04",50);
	B_InsertNpc_Rnd(Bloodfly,"NW_TAVERN_TO_FOREST_04",30);
	
	B_InsertNpc_Rnd(Molerat,"NW_TAVERN_TO_FOREST_05_01",50);
	B_InsertNpc(Waran,"NW_TAVERN_TO_FOREST_05_04");
	
	//таверна
	Wld_InsertNpc(YGiant_Rat,"FP_ROAM_NW_TAVERN_BACK_01");
	Wld_InsertNpc(YGiant_Rat,"FP_ROAM_NW_TAVERN_BACK_03");

	//холмы
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Wolf,"FP_ROAM_MEDIUMFOREST_KAP4_11");
		Wld_InsertNpc(Wolf,"FP_ROAM_MEDIUMFOREST_KAP4_12");
		Wld_InsertNpc(Wolf,"FP_ROAM_MEDIUMFOREST_KAP4_13");
	}
	else	{
		Wld_InsertNpc(Scavenger,"FP_ROAM_MEDIUMFOREST_KAP2_28");
		B_InsertNpc_Rnd(Scavenger,"FP_ROAM_MEDIUMFOREST_KAP2_29",70);
		B_InsertNpc_Rnd(Scavenger,"FP_ROAM_MEDIUMFOREST_KAP2_30",70);
		B_InsertNpc_Rnd(Scavenger,"FP_ROAM_MEDIUMFOREST_KAP4_10",70);
		B_InsertNpc_Rnd(Scavenger,"FP_ROAM_MEDIUMFOREST_KAP4_11",70);
		B_InsertNpc_Rnd(Scavenger,"FP_ROAM_MEDIUMFOREST_KAP4_12",70);
	};
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Wolf,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER8");
		Wld_InsertNpc(Wolf,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER8");
		Wld_InsertNpc(Wolf,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER8");
	}
	else	{
		Wld_InsertNpc(Keiler,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER7");
		Wld_InsertNpc(Keiler,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER7");
	};
	B_InsertNpc_Rnd(Molerat,"FP_ROAM_FORESTHILL_01",80);
	B_InsertNpc_Rnd(Molerat,"FP_ROAM_FORESTHILL_02",80);
	B_InsertNpc_Rnd(Molerat,"FP_ROAM_FORESTHILL_03",80);
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_FORESTHILL_04",60);
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_FORESTHILL_05",40);
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_FORESTHILL_06",40);
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_FORESTHILL_07",40);
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_FORESTHILL_08",60);
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_FORESTHILL_09",40);
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_FORESTHILL_10",20);
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_FORESTHILL_11",60);
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_FORESTHILL_12",40);
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_FORESTHILL_13",40);
	B_InsertNpc_Rnd(Bloodfly,"FP_ROAM_FORESTHILL_14",80);
	
	//побережье
	Wld_InsertNpc(Shadowbeast,"NW_FOREST_PATH_35_06");
	B_InsertNpc_Rnd(Waran,"NW_FOREST_PATH_80_1_MOVEMENT15",90);
	B_InsertNpc_Rnd(Waran,"NW_FOREST_PATH_80_1_MOVEMENT15",90);
	B_InsertNpc_Rnd(Snapper,"FP_ROAM_NW_FOREST_PATH_80_1_MOVEMENT5_01",80);
	B_InsertNpc_Rnd(Snapper,"FP_ROAM_NW_FOREST_PATH_80_1_MOVEMENT5_02",80);
	B_InsertNpc_Rnd(Snapper,"FP_ROAM_NW_FOREST_PATH_80_1_MOVEMENT2_77_01",80);
	B_InsertNpc_Rnd(Snapper,"FP_ROAM_NW_FOREST_PATH_80_1_MOVEMENT2_77_02",80);
	B_InsertNpc_Rnd(Snapper,"FP_ROAM_NW_FOREST_PATH_80_1_MOVEMENT2_77_03",80);
	B_InsertNpc_Rnd(Snapper,"FP_ROAM_NW_FOREST_PATH_801_01",80);
	B_InsertNpc_Rnd(Snapper,"FP_ROAM_NW_FOREST_PATH_801_02",80);
	if (Hlp_Random(100) < 60)	{
		Wld_InsertNpc(Wolf,"NW_FOREST_PATH_80_1_MOVEMENT8_M5");
		Wld_InsertNpc(Wolf,"NW_FOREST_PATH_80_1_MOVEMENT8_M5");
		Wld_InsertNpc(Wolf,"NW_FOREST_PATH_80_1_MOVEMENT8_M5");
	}
	else	{
		Wld_InsertNpc(Snapper,"NW_FOREST_PATH_80_1_MOVEMENT8_M5");
		Wld_InsertNpc(Snapper,"NW_FOREST_PATH_80_1_MOVEMENT8_M5");
	};
	
	//каменный круг
	B_InsertNpc_Rnd(Wisp,"FP_ROAM_NW_FOREST_PATH_63_UP_01",80);
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_FOREST_PATH_82_04");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_FOREST_PATH_82_04");
	}
	else
	{
		Wld_InsertNpc(Gobbo_Warrior_Visir,"FP_ROAM_NW_FOREST_PATH_82_04");
	};
	B_InsertNpc(SkeletonMage,"FP_ROAM_SKEMAGE_FORESTCIRCLE_01");
	
	//ферма Акила
	if (Hlp_Random(100) < 50)	{
		Wld_InsertNpc(Keiler,"NW_FOREST_PATH_04_16_MONSTER");
		Wld_InsertNpc(Keiler,"NW_FOREST_PATH_04_16_MONSTER");
		Wld_InsertNpc(Keiler,"NW_FOREST_PATH_04_16_MONSTER");
	}
	else	{
		Wld_InsertNpc(Keiler,"NW_FOREST_PATH_04_16_MONSTER");
		Wld_InsertNpc(Keiler_Hog,"NW_FOREST_PATH_04_16_MONSTER");
	};
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_04_16_MONSTER2",50);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_04_14_MONSTER",50);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_04_14_MONSTER",50);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_04_12",50);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_04_10",50);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_04_10",50);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_04_10",50);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_04_8",50);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_04_8",50);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_04_8",50);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_04_6",50);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_04_6",50);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_04_6",50);
	B_InsertNpc_Rnd(Molerat,"NW_FOREST_PATH_04_3",80);
	B_InsertNpc_Rnd(Molerat,"NW_FOREST_PATH_04_3",80);
	B_InsertNpc_Rnd(Giant_Bug,"FP_ROAM_MEDIUMFOREST_KAP2_05",70);
	B_InsertNpc_Rnd(Giant_Bug,"FP_ROAM_MEDIUMFOREST_KAP2_06",70);
	
	//дорога через лес
	Wld_InsertNpc(Scavenger,"FP_ROAM_MEDIUMFOREST_KAP2_13");
	Wld_InsertNpc(Scavenger,"FP_ROAM_MEDIUMFOREST_KAP2_17");
	Wld_InsertNpc(Wolf,"FP_ROAM_MEDIUMFOREST_KAP2_35");
	B_InsertNpc_Rnd(Wolf,"FP_ROAM_MEDIUMFOREST_KAP2_36",70);
	B_InsertNpc_Rnd(Wolf,"FP_ROAM_MEDIUMFOREST_KAP2_34",70);
	
	Wld_InsertNpc(Giant_Rat,"NW_FOREST_PATH_18");
	B_InsertNpc_Rnd(Giant_Rat,"FP_ROAM_MEDIUMFOREST_KAP2_31",60);
	B_InsertNpc_Rnd(Giant_Rat,"FP_ROAM_MEDIUMFOREST_KAP2_31A",60);

	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_18_MONSTER",90);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_18_MONSTER",90);
	
	B_InsertNpc_Rnd(Wolf,"FP_ROAM_MEDIUMFOREST_KAP3_24",90);
	B_InsertNpc_Rnd(Wolf,"FP_ROAM_MEDIUMFOREST_KAP3_23",90);
	
	//кладбище
	if (C_HeroIs_Erol())	{
		Wld_InsertNpc(Skeleton_Healer,"FP_ROAM_MEDIUMFOREST_KAP3_04");
	}
	else	{
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_MEDIUMFOREST_KAP3_04");
	};
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_MEDIUMFOREST_KAP3_06");
	if (Hlp_Random(100) < 50)	{
		B_InsertNpc(Zombie01,"FP_ROAM_MEDIUMFOREST_KAP3_01");
		B_InsertNpc(Zombie02,"FP_ROAM_MEDIUMFOREST_KAP3_02");
		B_InsertNpc_Rnd(Zombie03,"FP_ROAM_MEDIUMFOREST_KAP3_03",80);
	}
	else	{
		B_InsertNpc(Gobbo_Skeleton,"FP_ROAM_MEDIUMFOREST_KAP3_01");
		B_InsertNpc_Rnd(Gobbo_Skeleton,"FP_ROAM_MEDIUMFOREST_KAP3_03",90);
	};
	
	//чаща
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_31_NAVIGATION3",70);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_31_NAVIGATION3",70);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_31_NAVIGATION3",70);
	B_InsertNpc_Rnd(Wisp,"FP_ROAM_MEDIUMFOREST_KAP3_34",90);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_27_04",70);
	B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_27_04",70);
	if (Hlp_Random(100) < 70)	{
		B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_27_03",90);
		B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_27_03",90);
		B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_27_03",60);
	}
	else	{
		B_InsertNpc_Rnd(Keiler_Hog,"NW_FOREST_PATH_27_03",90);
	};
	if (Hlp_Random(100) < 70)	{
		B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_31_NAVIGATION10",90);
		B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_31_NAVIGATION10",90);
		B_InsertNpc_Rnd(Keiler,"NW_FOREST_PATH_31_NAVIGATION10",90);
	}
	else	{
		B_InsertNpc_Rnd(Molerat,"NW_FOREST_PATH_31_NAVIGATION10",90);
		B_InsertNpc_Rnd(Molerat,"NW_FOREST_PATH_31_NAVIGATION10",90);
		B_InsertNpc_Rnd(Molerat,"NW_FOREST_PATH_31_NAVIGATION10",90);
	};
	B_InsertNpc_Rnd(Keiler_Hog,"NW_FOREST_PATH_31_NAVIGATION11",90);
	B_InsertNpc_Rnd(Wolf,"NW_FOREST_PATH_27_02",90);
	B_InsertNpc_Rnd(Wolf,"NW_FOREST_PATH_27_02",90);
	if (!B_InsertNpc_Rnd(Shadowbeast,"NW_FOREST_PATH_72_MONSTER23",50))	{
		B_InsertNpc(Warg,"NW_FOREST_PATH_72_MONSTER23");
		B_InsertNpc(Warg,"NW_FOREST_PATH_72_MONSTER23");
	};
	if (Hlp_Random(100) < 60)	{
		B_InsertNpc_Rnd(Wolf,"NW_FOREST_PATH_31_NAVIGATION16",90);
		B_InsertNpc_Rnd(Wolf,"NW_FOREST_PATH_31_NAVIGATION16",60);
		B_InsertNpc_Rnd(Wolf,"NW_FOREST_PATH_31_NAVIGATION16",80);
	}
	else	{
		B_InsertNpc_Rnd(Scavenger,"NW_FOREST_PATH_31_NAVIGATION16",60);
		B_InsertNpc_Rnd(Scavenger,"NW_FOREST_PATH_31_NAVIGATION16",60);
		B_InsertNpc_Rnd(Scavenger,"NW_FOREST_PATH_31_NAVIGATION16",60);
		B_InsertNpc_Rnd(Scavenger,"NW_FOREST_PATH_31_NAVIGATION16",60);
		B_InsertNpc_Rnd(Scavenger,"NW_FOREST_PATH_31_NAVIGATION16",60);
	};
	B_InsertNpc_Rnd(Giant_Rat,"FP_PICK_FOREST_PATH_54_02",80);
	B_InsertNpc_Rnd(Giant_Rat,"FP_PICK_FOREST_PATH_54_02",80);
	if (Hlp_Random(100) < 60)	{
		B_InsertNpc_Rnd(Molerat,"NW_FOREST_PATH_75_2",90);
		B_InsertNpc_Rnd(Molerat,"NW_FOREST_PATH_75_2",90);
		B_InsertNpc_Rnd(Molerat,"NW_FOREST_PATH_75_2",20);
	}
	else	{
		B_InsertNpc_Rnd(Keiler_Hog,"NW_FOREST_PATH_75_2",80);
	};
};

func void INIT_SUB_NewWorld_Part_Forest_MR()
{
	var C_NPC RoomOwner;
	//* PORTALS
	// Жилье
	RoomOwner = Hlp_GetNpc(BAU_940_Akil);
	Wld_AssignRoomToNpc("nwforrestfarm01",RoomOwner);
	RoomOwner = Hlp_GetNpc(OUT_1202_Orlan);
	Wld_AssignRoomToNpc("forestherberge01",RoomOwner);
	// Пещеры
	Wld_AssignRoomToGuild("nwcave01",GIL_CAVE);
	Wld_AssignRoomToGuild("nwforrestcave01",GIL_PUBLIC);
	Wld_AssignRoomToGuild("nwforrestcave02",GIL_CAVE);
	Wld_AssignRoomToGuild("nwforrestcave03",GIL_CAVE);
	Wld_AssignRoomToGuild("nwforrestcave04",GIL_CAVE);
	Wld_AssignRoomToGuild("nwforrestcave05",GIL_CAVE);
	Wld_AssignRoomToGuild("nwforrestcave06",GIL_CAVE);
	//*/
};

func void INIT_NewWorld_Part_Forest_MR()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	INIT_SUB_NewWorld_Part_Forest_MR();
};

func void STARTUP_NewWorld_Part_TrollArea_MR()
{
	Wld_InsertNpc(OUT_1212_Dragomir,"NW_TROLLAREA_RUINS_UP_IN");
	
	//волшебная пещера
	B_InsertNpc_Rnd(Meatbug,"NW_MAGECAVE_20",90);
	B_InsertNpc_Rnd(Meatbug,"NW_MAGECAVE_20",90);
	B_InsertNpc_Rnd(Meatbug,"NW_MAGECAVE_20",90);
	B_InsertNpc_Rnd(Minecrawler,"NW_MAGECAVE_23",90);
	B_InsertNpc_Rnd(Minecrawler,"NW_MAGECAVE_23",90);
	B_InsertNpc_Rnd(MinecrawlerWarrior,"NW_MAGECAVE_27",90);
	B_InsertNpc_Rnd(MinecrawlerWarrior,"NW_MAGECAVE_27",90);
	
	//черный тролль
	Wld_InsertNpc(Troll_Black,"NW_TROLLAREA_PATH_84");
	B_InsertNpc_Rnd(Bloodhound,"NW_TROLLAREA_BRIGDE_01",90);
	B_InsertNpc_Rnd(Bloodhound,"NW_TROLLAREA_PATH_80",80);
	B_InsertNpc_Rnd(Molerat,"NW_TROLLAREA_BRIGDE_04_MONSTER",80);
	B_InsertNpc_Rnd(Molerat,"NW_TROLLAREA_BRIGDE_04_MONSTER",80);
	if (Hlp_Random(100) < 40)	{
		B_InsertNpc_Rnd(Molerat,"NW_TROLLAREA_PATH_06",90);
		B_InsertNpc_Rnd(Molerat,"NW_TROLLAREA_PATH_06",90);
	}
	else	{
		B_InsertNpc_Rnd(Gobbo_Green,"NW_TROLLAREA_PATH_06",70);
		B_InsertNpc_Rnd(Gobbo_Green,"NW_TROLLAREA_PATH_06",70);
		B_InsertNpc_Rnd(Gobbo_Green,"NW_TROLLAREA_PATH_06",70);
	};
	
	//горное озеро
	Wld_InsertNpc(Wisp,"FP_ROAM_NW_TROLLAREA_LAKE_01");
	Wld_InsertNpc(Wisp,"FP_ROAM_NW_TROLLAREA_LAKE_07");
	Wld_InsertNpc(Wisp,"FP_ROAM_NW_TROLLAREA_LAKE_04");
	Wld_InsertNpc(Wisp,"FP_ROAM_NW_TROLLAREA_LAKE_08");
	Wld_InsertNpc(Wisp,"FP_ROAM_NW_TROLLAREA_LAKE_10");
	B_InsertNpc_Rnd(Lurker,"FP_ROAM_TROLLAREA_SEA_06",70);
	B_InsertNpc_Rnd(Lurker,"FP_ROAM_TROLLAREA_SEA_02",70);
	B_InsertNpc_Rnd(Giant_Rat,"NW_TROLLAREA_PATH_71",70);
	B_InsertNpc_Rnd(Giant_Rat,"NW_TROLLAREA_PATH_71",70);
	B_InsertNpc_Rnd(Bloodfly,"NW_TROLLAREA_PATH_75",75);
	B_InsertNpc_Rnd(Bloodfly,"NW_TROLLAREA_PATH_75",75);
	
	//соснячок
	B_InsertNpc_Rnd(Keiler,"NW_TROLLAREA_PATH_15_MONSTER",90);
	B_InsertNpc_Rnd(Keiler,"NW_TROLLAREA_PATH_15_MONSTER",60);
	B_InsertNpc_Rnd(Molerat,"NW_TROLLAREA_PLANE_02",90);
	B_InsertNpc_Rnd(Molerat,"NW_TROLLAREA_PLANE_02",90);
	B_InsertNpc_Rnd(Scavenger,"NW_TROLLAREA_PATH_22_MONSTER",70);
	B_InsertNpc_Rnd(Scavenger,"NW_TROLLAREA_PATH_22_MONSTER",70);
	B_InsertNpc_Rnd(Scavenger,"NW_TROLLAREA_PATH_22_MONSTER",80);
	B_InsertNpc_Rnd(Scavenger,"NW_TROLLAREA_PATH_22_MONSTER",90);
	B_InsertNpc_Rnd(Scavenger,"FP_ROAM_NW_TROLLAREA_PATH_14_MONSTER_01",70);
	B_InsertNpc_Rnd(Scavenger,"FP_ROAM_NW_TROLLAREA_PATH_14_MONSTER_02",70);
	B_InsertNpc_Rnd(Scavenger,"FP_ROAM_NW_TROLLAREA_PATH_14_MONSTER_03",70);
	B_InsertNpc_Rnd(Scavenger,"FP_ROAM_NW_TROLLAREA_PATH_14_MONSTER_04",70);
	B_InsertNpc_Rnd(Bloodfly,"NW_TROLLAREA_PLANE_01",90);
	B_InsertNpc_Rnd(Bloodfly,"NW_TROLLAREA_PLANE_01",90);
	
	//горная шахта
	B_InsertNpc_Rnd(Minecrawler,"NW_TROLLAREA_TROLLLAKECAVE_02",90);
	B_InsertNpc_Rnd(Minecrawler,"NW_TROLLAREA_TROLLLAKECAVE_08",90);
	B_InsertNpc_Rnd(MinecrawlerWarrior,"NW_TROLLAREA_TROLLLAKECAVE_09",90);
	
	//солнечный круг
	B_InsertNpc_Rnd(Giant_Rat,"NW_TROLLAREA_RITUALFOREST_06_MONSTER",90);
	B_InsertNpc_Rnd(Giant_Rat,"NW_TROLLAREA_RITUALFOREST_06_MONSTER",90);
	B_InsertNpc_Rnd(Keiler,"NW_TROLLAREA_RITUALFOREST_04",70);
	B_InsertNpc_Rnd(Keiler,"NW_TROLLAREA_RITUALFOREST_04",70);
	B_InsertNpc_Rnd(Giant_Rat,"NW_TROLLAREA_RITUALFOREST_04_MONSTER",90);
	B_InsertNpc_Rnd(Giant_Rat,"NW_TROLLAREA_RITUALFOREST_04_MONSTER",90);
	B_InsertNpc_Rnd(Keiler,"NW_TROLLAREA_RITUALPATH_04",50);
	B_InsertNpc_Rnd(Keiler,"NW_TROLLAREA_RITUALPATH_04",50);
	B_InsertNpc_Rnd(Keiler,"NW_TROLLAREA_RITUALPATH_04",50);
	B_InsertNpc_Rnd(Keiler,"NW_TROLLAREA_RITUALPATH_032",90);
	B_InsertNpc_Rnd(Keiler,"NW_TROLLAREA_RITUALPATH_032",90);
	B_InsertNpc_Rnd(Keiler_Hog,"NW_TROLLAREA_RITUAL_13",90);
	B_InsertNpc_Rnd(Keiler_Hog,"FP_ROAM_NW_TROLLAREA_RITUALFOREST_KEILER_02",90);
	B_InsertNpc_Rnd(Wolf,"NW_TROLLAREA_RITUAL_08",90);
	B_InsertNpc_Rnd(Wolf,"NW_TROLLAREA_RITUAL_08",90);
	B_InsertNpc_Rnd(Wolf,"NW_TROLLAREA_RITUAL_08",90);
	
	//шахта на лестнице
	B_InsertNpc_Rnd(Giant_Rat,"NW_RITUALFOREST_CAVE_04",90);
	B_InsertNpc_Rnd(Giant_Rat,"NW_RITUALFOREST_CAVE_04",90);
	B_InsertNpc_Rnd(Minecrawler,"FP_ROAM_RITUALFOREST_CAVE_05",90);
	
	//руины
	B_InsertNpc_Rnd(Scavenger,"NW_TROLLAREA_RUINS_47",90);
	B_InsertNpc_Rnd(Scavenger,"NW_TROLLAREA_RUINS_47",90);
	B_InsertNpc_Rnd(Scavenger,"NW_TROLLAREA_RUINS_47",90);
	B_InsertNpc_Rnd(Scavenger,"NW_TROLLAREA_RUINS_47",90);
	B_InsertNpc_Rnd(Scavenger,"NW_TROLLAREA_RUINS_21",90);
	B_InsertNpc_Rnd(Scavenger,"NW_TROLLAREA_RUINS_21",90);
	B_InsertNpc_Rnd(Scavenger,"NW_TROLLAREA_RUINS_21",90);
	B_InsertNpc_Rnd(Wisp,"FP_ROAM_NW_TROLLAREA_RUINS_28",70);
	B_InsertNpc_Rnd(Swamprat,"NW_TROLLAREA_RUINS_40",90);
	B_InsertNpc_Rnd(Swamprat,"FP_ROAM_NW_TROLLAREA_RUINS_37",90);
	B_InsertNpc_Rnd(Swamprat,"FP_ROAM_NW_TROLLAREA_RUINS_40",90);
	B_InsertNpc_Rnd(Gobbo_Green,"NW_KRONKELLARES_03",90);
	B_InsertNpc_Rnd(Gobbo_Green,"NW_TROLLAREA_RUINS_10",90);
	B_InsertNpc_Rnd(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_41",90);
	B_InsertNpc_Rnd(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_42",90);
	B_InsertNpc_Rnd(Gobbo_Warrior,"FP_ROAM_NW_TROLLAREA_RUINS_43",90);

	//дорога и горы
	B_InsertNpc_Rnd(MagicGolem,"FP_MAGICGOLEM",90);
	B_InsertNpc_Rnd(Molerat,"NW_TROLLAREA_GOBBO_01",90);
	B_InsertNpc_Rnd(Molerat,"NW_TROLLAREA_GOBBO_01",90);
	B_InsertNpc_Rnd(Scavenger,"NW_TROLLAREA_RATS_01",70);
	B_InsertNpc_Rnd(Scavenger,"NW_TROLLAREA_RATS_01",70);
	B_InsertNpc_Rnd(Scavenger,"NW_TROLLAREA_RATS_01",70);
	B_InsertNpc_Rnd(Scavenger,"NW_TROLLAREA_RATS_01",70);
	B_InsertNpc_Rnd(Scavenger,"NW_TROLLAREA_RATS_01",70);
	if (Hlp_Random(100) < 50)	{
		B_InsertNpc_Rnd(Gobbo_Green,"NW_TROLLAREA_PLANE_05",90);
		B_InsertNpc_Rnd(Gobbo_Green,"NW_TROLLAREA_PLANE_05",90);
	}
	else	{
		B_InsertNpc_Rnd(Gobbo_Black,"NW_TROLLAREA_PLANE_05",95);
	};
	if (Hlp_Random(100) < 50)	{
		B_InsertNpc_Rnd(Giant_Rat,"NW_TROLLAREA_PATH_38_MONSTER",90);
		B_InsertNpc_Rnd(Giant_Rat,"NW_TROLLAREA_PATH_38_MONSTER",90);
	}
	else	{
		B_InsertNpc_Rnd(Waran,"NW_TROLLAREA_PATH_38_MONSTER",95);
	};
	B_InsertNpc_Rnd(Bloodfly,"NW_TROLLAREA_PLANE_04",50);
	B_InsertNpc_Rnd(Bloodfly,"NW_TROLLAREA_PLANE_04",50);
	B_InsertNpc_Rnd(Bloodfly,"NW_TROLLAREA_PLANE_04",50);
	B_InsertNpc_Rnd(Bloodfly,"NW_TROLLAREA_PLANE_04",50);
	
	//пещера мракорисов
	Wld_InsertNpc(Shadowbeast,"NW_TROLLAREA_RIVERSIDECAVE_07");
	Wld_InsertNpc(Shadowbeast,"NW_TROLLAREA_RIVERSIDECAVE_02");
	Wld_InsertNpc(Molerat,"FP_DEAD_NW_TROLLAREA_RIVERSIDECAVE_01_04");
	
	//берег
	B_InsertNpc(Lurker,"NW_TROLLAREA_RIVERSIDE_01");
	B_InsertNpc(Lurker,"NW_TROLLAREA_RIVERSIDE_02");
	B_InsertNpc_Rnd(Molerat,"NW_TROLLAREA_PLANE_11",90);
	B_InsertNpc_Rnd(Molerat,"NW_TROLLAREA_PLANE_11",90);
	B_InsertNpc_Rnd(Gobbo_Green,"NW_TROLLAREA_PLANE_07",90);
	B_InsertNpc_Rnd(Gobbo_Green,"NW_TROLLAREA_PLANE_07",90);
	B_InsertNpc_Rnd(Gobbo_Green,"NW_TROLLAREA_PLANE_07",70);
	B_InsertNpc_Rnd(Gobbo_Green,"NW_TROLLAREA_PLANE_07",40);
	
	//заречье
	if (Hlp_Random(100) < 50)	{
		B_InsertNpc_Rnd(Giant_Rat,"FP_ROAM_TROLLAREA_RIVERBACK_04",90);
		B_InsertNpc_Rnd(Giant_Rat,"FP_ROAM_TROLLAREA_RIVERBACK_01",90);
	}
	else	{
		B_InsertNpc_Rnd(Swamprat,"FP_ROAM_TROLLAREA_RIVERBACK_02",90);
		B_InsertNpc_Rnd(Swamprat,"FP_ROAM_TROLLAREA_RIVERBACK_03",90);
	};
	B_InsertNpc_Rnd(Lurker,"FP_ROAM_TROLLAREA_RIVERBACK_05",90);
	B_InsertNpc_Rnd(Lurker,"FP_ROAM_TROLLAREA_RIVERBACK_06",90);
};

func void INIT_SUB_NewWorld_Part_TrollArea_MR()
{
	//* PORTALS
	// Пещеры
	Wld_AssignRoomToGuild("trollcave01",GIL_CAVE);
	Wld_AssignRoomToGuild("trollcave02",GIL_CAVE);
	Wld_AssignRoomToGuild("trollcave03",GIL_CAVE);
	Wld_AssignRoomToGuild("trollcave04",GIL_CAVE);
	Wld_AssignRoomToGuild("trollcave05",GIL_CAVE);
	Wld_AssignRoomToGuild("trollmagecave01",GIL_CAVE);
	Wld_AssignRoomToGuild("trollmagecave02",GIL_CAVE);
	//*/
};

func void INIT_NewWorld_Part_TrollArea_MR()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	INIT_SUB_NewWorld_Part_TrollArea_MR();
};

func void STARTUP_NewWorld_MR()
{
	CurrentLevel = NEWWORLD_ZEN;
	
	STARTUP_NewWorld_Part_City_MR();
	STARTUP_NewWorld_Part_Farm_MR();
	STARTUP_NewWorld_Part_Xardas_MR();
	STARTUP_NewWorld_Part_Monastery_MR();
	STARTUP_NewWorld_Part_GreatPeasant_MR();
	STARTUP_NewWorld_Part_TrollArea_MR();
	STARTUP_NewWorld_Part_Forest_MR();
	STARTUP_NewWorld_Part_Pass_To_OW_MR();
	
	if (!C_HeroIs_Elena())	{Wld_InsertNpc(CMP_Elena, "BIGFARM");};
	if (!C_HeroIs_Erol())	{Wld_InsertNpc(CMP_Erol, "TAVERNE");};
	if (!C_HeroIs_Odo())	{Wld_InsertNpc(CMP_Odo, "NW_MONASTERY_ENTRY_01");};
	if (!C_HeroIs_Rupert())	{Wld_InsertNpc(CMP_Rupert, "NW_CITY_ENTRANCE_01");};
	if (!C_HeroIs_Sarah())	{Wld_InsertNpc(CMP_Sarah, "NW_CITY_ENTRANCE_01");};
	if (!C_HeroIs_Talbin())	{Wld_InsertNpc(CMP_Talbin, "TAVERNE");};
	if (!C_HeroIs_Till())	{Wld_InsertNpc(CMP_Till, "BIGFARM");};
	Wld_InsertNpc(PC_NastasSanna, "NW_NASTASSANNA_01");
	Wld_InsertNpc(PC_BloodwinSnow,"NW_MAGECAVE_RUNE");
	Wld_InsertNpc(PC_Himera,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(PC_Valerych,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(PC_Dennis,"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc(PC_IdolKadar,"NW_FARM1_OUT_01");
	Wld_InsertNpc(PC_Noone, "TOT");
	
	B_Hero_PreStart();
};

func void INIT_NewWorld_MR()
{
	CurrentLevel = NEWWORLD_ZEN;
	
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	B_InitHero();
	
	SP_SearchVobTree();
	
	B_OnEnterNewWorld();	
	
	INIT_SUB_NewWorld_Part_City_MR();
	INIT_SUB_NewWorld_Part_Farm_MR();
	INIT_SUB_NewWorld_Part_Xardas_MR();
	INIT_SUB_NewWorld_Part_Monastery_MR();
	INIT_SUB_NewWorld_Part_GreatPeasant_MR();
	INIT_SUB_NewWorld_Part_TrollArea_MR();
	INIT_SUB_NewWorld_Part_Forest_MR();
	INIT_SUB_NewWorld_Part_Pass_To_OW_MR();
	
	Wld_SendTrigger("CYCLE_TRIGGER");
};


