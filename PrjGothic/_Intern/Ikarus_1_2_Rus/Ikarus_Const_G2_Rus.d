const int GOTHIC_BASE_VERSION = 2;

//--------------------------------------
// Пользовательские переменные:
//--------------------------------------

const string MEM_FARFARAWAY = "TOT";		//здесь спаунится Mem-Helper
const string MEM_HELPER_NAME = "MEMHLP";    //его имя

const int zERR_TYPE_OK    = 0; /* [не используется]  */
const int zERR_TYPE_INFO  = 1; /* MEM_Info           */
const int zERR_TYPE_WARN  = 2; /* MEM_Warn           */
const int zERR_TYPE_FAULT = 3; /* MEM_Error          */
const int zERR_TYPE_FATAL = 4; /* [не используется]  */

const int zERR_ReportToZSpy     = zERR_TYPE_INFO;  //все от zERR_TYPE_INFO
const int zERR_ShowErrorBox     = zERR_TYPE_FAULT; //вывод сообщений об ошибках в окно MessageBox
const int zERR_PrintStackTrace  = zERR_TYPE_WARN; //трассировка содержимого стека при предупреждениях

const int zERR_ErrorBoxOnlyForFirst   = 1; /* никогда не показывать больше одного сообщения об ошибке */
const int zERR_StackTraceOnlyForFirst = 0; /* трассировка стека только для первой ошибки */

/* Отладочные сообщения:
 * MEM_Debug не используется в Ikarus и представляет собой
 * свободно конфигурируемый информационный канал. */
 
const string zERR_DEBUG_PREFIX   = "Debug: ";      //Этот префикс всегда ставится перед сообщением
const int    zERR_DEBUG_TOSPY    = 1;              //Отправлять сообщения MEM_Debug в ZSpy?
const int    zERR_DEBUG_TYPE     = zERR_TYPE_INFO; //Если да, то как отправлять в ZSpy?
const int    zERR_DEBUG_TOSCREEN = 0;              //Вывод сообщений MEM_Debug на экран через "Print".
const int    zERR_DEBUG_ERRORBOX = 0;              //Показывать окно Error-Box (с кнопкой OK).

//--------------------------------------
// Адреса
//--------------------------------------

//Парсер
const int ContentParserAddress      = 11223232; //0xAB40C0;
const int vfxParserPointerAddress   =  9234156; //0x8CE6EC
const int menuParserPointerAddress  =  9248360; //0x8D1E68
const int pfxParserPointerAddress   =  9278004; //0x8D9234

//ShowDebug
const int showDebugAddress	= 11232372; //0xAB6474

//Массив, содержащий все созданные (и не разрушенные) меню
const int MEMINT_MenuArrayOffset		= 9248324; //0x8D1E44
const int MEMINT_MenuItemArrayAddres	= 9248508; //0x8D1EFC

//Несколько полезных статических объектов
const int MEMINT_oGame_Pointer_Address			= 11208836; //0xAB0884
const int MEMINT_zTimer_Address					= 10073044; //0x99B3D4
const int MEMINT_oCInformationManager_Address	= 11191384; //0xAAC458
const int MEMINT_gameMan_Pointer_address		= 9185624; //0x8C2958

//Массив случайных чисел движка (для хэша):
const int crc_table_address	= 8598048; //0x833220

//Массив с информацией о нажатых клавишах
const int MEMINT_KeyEvent_Offset  = 9246328; //0x8D1678
const int MEMINT_KeyToggle_Offset = 9246904;
const int MEMINT_KeyBuffer_offset = 9248080; //0x8D1D50

//Статические объекты для управления спауном (из Spawnmanager)
const int SPAWN_INSERTTIME_MAX_Address = 9153740;/*8BACCC*/ //zREAL*
const int SPAWN_INSERTRANGE_Address    = 9153744;/*8BACD0*/ //zREAL*
const int SPAWN_REMOVERANGE_Address    = 9153748;/*8BACD4*/ //zREAL*

//Игровое время не меняется, если установлен:
const int game_holdTime_Address = 11208840; //0xAB0888 //zBOOL*

//Статические свойства, касающиеся отображения субтитров:
const int oCNpc_isEnabledTalkBox_Address        =  9142548; //0x8B8114 //zBOOL* //перекрывает следующие три настройки
const int oCNpc_isEnabledTalkBoxPlayer_Address  =  9142552; //0x8B8118 //zBOOL*
const int oCNpc_isEnabledTalkBoxAmbient_Address = 11216504; //0xAB2678 //zBOOL*
const int oCNpc_isEnabledTalkBoxNoise_Address   = 11216508; //0xAB267C //zBOOL*

//глобальный экран (тип zCView) на нем, напр., отображается полоска жизни
const int screen_offset = 11232360;	//0xAB6468

//Инкапсуляция Gothic.ini (готовая для доступа через функции)
const int zoptions_Pointer_Address		= 9230728; //0x8CD988
//[modname].ini (готов для доступа через функции)
const int zgameoptions_Pointer_Address	= 9230732; //0x8CD98C

//bspFrameCtr:
const int bspFrameCtr_Address = 9259332; //0x8D4944;

//Счетчик производительности, в тактах (тиках) в миллисекунду
const int PC_TicksPerMS_Address = 9255828; //0x8D3B94

//--------------------------------------
// Другие константы
//--------------------------------------

//Адрес таблицы методов для распознавания объектов
const int oCMobFire_vtbl        = 8638876;
const int zCMover_vtbl          = 8627324;
const int oCMob_vtbl            = 8639700;
const int oCMobInter_vtbl       = 8639884;
const int oCMobLockable_vtbl    = 8637628;
const int oCMobContainer_vtbl   = 8637284;
const int oCMobDoor_vtbl        = 8638548;
const int oCItem_vtbl           = 8636420;
const int oCNpc_vtbl            = 8640292;
const int zCVobLight_vtbl		= 8624756;

//--------------------------------------
// Клавиши
//--------------------------------------

//Список взят отсюда:
//http://community.bistudio.com/wiki/DIK_KeyCodes

const int KEY_ESCAPE          = 01;
const int KEY_1               = 02;
const int KEY_2               = 03;
const int KEY_3               = 04;
const int KEY_4               = 05;
const int KEY_5               = 06;
const int KEY_6               = 07;
const int KEY_7               = 08;
const int KEY_8               = 09;
const int KEY_9               = 10;
const int KEY_0               = 11;
const int KEY_MINUS           = 12;
const int KEY_EQUALS          = 13;
const int KEY_BACK            = 14;
const int KEY_TAB             = 15;
const int KEY_Q               = 16;
const int KEY_W               = 17;
const int KEY_E               = 18;
const int KEY_R               = 19;
const int KEY_T               = 20;
const int KEY_Y               = 21;
const int KEY_U               = 22;
const int KEY_I               = 23;
const int KEY_O               = 24;
const int KEY_P               = 25;
const int KEY_LBRACKET        = 26;
const int KEY_RBRACKET        = 27;
const int KEY_RETURN          = 28;
const int KEY_LCONTROL        = 29;
const int KEY_A               = 30;
const int KEY_S               = 31;
const int KEY_D               = 32;
const int KEY_F               = 33;
const int KEY_G               = 34;
const int KEY_H               = 35;
const int KEY_J               = 36;
const int KEY_K               = 37;
const int KEY_L               = 38;
const int KEY_SEMICOLON       = 39;
const int KEY_APOSTROPHE      = 40;
const int KEY_GRAVE           = 41;
const int KEY_LSHIFT          = 42;
const int KEY_BACKSLASH       = 43;
const int KEY_Z               = 44;
const int KEY_X               = 45;
const int KEY_C               = 46;
const int KEY_V               = 47;
const int KEY_B               = 48;
const int KEY_N               = 49;
const int KEY_M               = 50;
const int KEY_COMMA           = 51;
const int KEY_PERIOD          = 52;
const int KEY_SLASH           = 53;
const int KEY_RSHIFT          = 54;
const int KEY_MULTIPLY        = 55;
const int KEY_LMENU           = 56;
const int KEY_SPACE           = 57;
const int KEY_CAPITAL         = 58;
const int KEY_F1              = 59;
const int KEY_F2              = 60;
const int KEY_F3              = 61;
const int KEY_F4              = 62;
const int KEY_F5              = 63;
const int KEY_F6              = 64;
const int KEY_F7              = 65;
const int KEY_F8              = 66;
const int KEY_F9              = 67;
const int KEY_F10             = 68;
const int KEY_NUMLOCK         = 69;
const int KEY_SCROLL          = 70;
const int KEY_NUMPAD7         = 71;
const int KEY_NUMPAD8         = 72;
const int KEY_NUMPAD9         = 73;
const int KEY_SUBTRACT        = 74;
const int KEY_NUMPAD4         = 75;
const int KEY_NUMPAD5         = 76;
const int KEY_NUMPAD6         = 77;
const int KEY_ADD             = 78;
const int KEY_NUMPAD1         = 79;
const int KEY_NUMPAD2         = 80;
const int KEY_NUMPAD3         = 81;
const int KEY_NUMPAD0         = 82;
const int KEY_DECIMAL         = 83;
const int KEY_OEM_102         = 86;
const int KEY_F11             = 87;
const int KEY_F12             = 88;
const int KEY_F13             = 100;
const int KEY_F14             = 101;
const int KEY_F15             = 102;
const int KEY_KANA            = 112;
const int KEY_ABNT_C1         = 115;
const int KEY_CONVERT         = 121;
const int KEY_NOCONVERT       = 123;
const int KEY_YEN             = 124;
const int KEY_ABNT_C2         = 125;
const int KEY_NUMPADEQUALS    = 141;
const int KEY_PREVTRACK       = 144;
const int KEY_AT              = 145;
const int KEY_COLON           = 146;
const int KEY_UNDERLINE       = 147;
const int KEY_KANJI           = 148;
const int KEY_STOP            = 149;
const int KEY_AX              = 150;
const int KEY_UNLABELED       = 151;
const int KEY_NEXTTRACK       = 153;
const int KEY_NUMPADENTER     = 156;
const int KEY_RCONTROL        = 157;
const int KEY_MUTE            = 160;
const int KEY_CALCULATOR      = 161;
const int KEY_PLAYPAUSE       = 162;
const int KEY_MEDIASTOP       = 164;
const int KEY_VOLUMEDOWN      = 174;
const int KEY_VOLUMEUP        = 176;
const int KEY_WEBHOME         = 178;
const int KEY_NUMPADCOMMA     = 179;
const int KEY_DIVIDE          = 181;
const int KEY_SYSRQ           = 183;
const int KEY_RMENU           = 184;
const int KEY_PAUSE           = 197;
const int KEY_HOME            = 199;
const int KEY_UPARROW         = 200;
const int KEY_PRIOR           = 201;
const int KEY_LEFTARROW       = 203;
const int KEY_RIGHTARROW      = 205;
const int KEY_END             = 207;
const int KEY_DOWNARROW       = 208;
const int KEY_NEXT            = 209;
const int KEY_INSERT          = 210;
const int KEY_DELETE          = 211;
const int KEY_LWIN            = 219;
const int KEY_RWIN            = 220;
const int KEY_APPS            = 221;
const int KEY_POWER           = 222;
const int KEY_SLEEP           = 223;
const int KEY_WAKE            = 227;
const int KEY_WEBSEARCH       = 229;
const int KEY_WEBFAVORITES    = 230;
const int KEY_WEBREFRESH      = 231;
const int KEY_WEBSTOP         = 232;
const int KEY_WEBFORWARD      = 233;
const int KEY_WEBBACK         = 234;
const int KEY_MYCOMPUTER      = 235;
const int KEY_MAIL            = 236;
const int KEY_MEDIASELECT     = 237;

const int MOUSE_BUTTONLEFT	= 524; //левая кнопка мыши
const int MOUSE_BUTTONRIGHT	= 525; //правая кнопка мыши
const int MOUSE_BUTTONMID	= 526; //средняя конопка мыши
const int MOUSE_XBUTTON1	= 527; //специальные клавиши...
const int MOUSE_XBUTTON2	= 528;
const int MOUSE_XBUTTON3	= 529;
const int MOUSE_XBUTTON4	= 530;
const int MOUSE_XBUTTON5	= 531;
