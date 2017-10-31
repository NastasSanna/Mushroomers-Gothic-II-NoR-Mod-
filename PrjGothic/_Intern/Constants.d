/**************************************************************************

                               КОНСТАНТЫ
							   
  В этом файле прописаны основные глобальне константы (в основном флаги и
индексы), а также несколько переменных (специальные умения)
и класс параметров гильдий. Используются повсеместно.

***************************************************************************/


// ШРИФТЫ вывода на экран --------------------------------------------------

const string FONT_Screen			= "FONT_OLD_20_WHITE.TGA";	//обычный экранный
const string FONT_ScreenSmall		= "FONT_OLD_10_WHITE.TGA";	//мелкий экранный
const string FONT_Book				= "FONT_10_BOOK.TGA";		//текст документа
const string FONT_BookHeadline		= "FONT_20_BOOK.TGA";		//заголовок документа

//const string FONT_Manuscript			= "FONT_MANUSCRIPT_16.TGA";		//Book Antiqua i 16
//const string FONT_ManuscriptHeadline	= "FONT_MANUSCRIPT_20.TGA";		//Book Antiqua i 20
const string FONT_Handwrite				= "FONT_SEGOESCRIPT_17.TGA";
const string FONT_Calligraphic			= "FONT_HANDWRITE_20.TGA";		//Isadora Cyr 20
const string FONT_Manuscript			= "FONT_CONSOLAS_16.TGA";
const string FONT_ManuscriptHeadline	= "FONT_CONSOLAS_20.TGA";
const string FONT_MR					= "FONT_BOOKANTIQUA_16.TGA";
const string FONT_MRHeadline			= "FONT_BOOKANTIQUA_20.TGA";

// --------------------------------------------------------------------------

//Стоимость использования свитка (маны)
const int SPL_Cost_Scroll	= 5; 

// Атрибуты
const int ATR_HITPOINTS			= 0; 		//текущее здоровье
const int ATR_HITPOINTS_MAX		= 1; 		//макс. здоровье
const int ATR_MANA				= 2; 		//текущая мана
const int ATR_MANA_MAX			= 3; 		//макс. мана
const int ATR_STRENGTH			= 4; 		//сила
const int ATR_DEXTERITY			= 5;		//ловкость
const int ATR_REGENERATEHP		= 6;		//регенерация здоровья (пунктов в сек.)
const int ATR_REGENERATEMANA	= 7;		//регенерация маны (пунктов в сек.)
const int ATR_INDEX_MAX			= 8;	//кол-во атрибутов

// Флаги персонажей
const int NPC_FLAG_FRIEND		= 1;		//дружественный (не исп., см. aivar)
const int NPC_FLAG_IMMORTAL		= 1 << 1;	//бессмертный (неуязвимый)	
const int NPC_FLAG_GHOST		= 1 << 2;	//призрак (полупрозрачный, настраивается в Gothic.ini [INTERNAL] 'GhostAlpha')

// Режимы боя 
const int FMODE_NONE			= 0;		//нет боя
const int FMODE_FIST			= 1;		//кулаки
const int FMODE_MELEE			= 2;		//ближний бой
const int FMODE_FAR				= 5;		//дальний бой
const int FMODE_MAGIC			= 7;		//магия

// Способ передвижения (внутр.)
const int NPC_RUN				= 0;		//бег
const int NPC_WALK				= 1;		//ходьба
const int NPC_SNEAK				= 2;		//подкрадывание
const int NPC_RUN_WEAPON		= 0 + 128;	//бег с оружием
const int NPC_WALK_WEAPON		= 1 + 128;	//ходьба с оружием
const int NPC_SNEAK_WEAPON		= 2 + 128;	//подкрадывание с оружием

// Использование предмета (внутр.)
const int WEAR_TORSO			= 1;		//носится на теле
const int WEAR_HEAD				= 2;		//носится на голове (нет прим.)
const int WEAR_EFFECT			= 16;		//оказывает какой-то эффект


// ИНВЕНТАРЬ ---------------------------------------------------------------

// Категории инвентаря (не исп., см. флаги ITEM_KAT_x ниже)
const int INV_WEAPON			= 1;		//оружие
const int INV_ARMOR				= 2;		//броня/одежда
const int INV_RUNE				= 3;		//руны
const int INV_MAGIC				= 4;		//магические предметы
const int INV_FOOD				= 5;		//пища
const int INV_POTION			= 6;		//напитки
const int INV_DOC				= 7;		//документы
const int INV_MISC				= 8;		//прочее
const int INV_CAT_MAX			= 9;	//кол-во категорий инвентаря

// Ограничения инвентаря (не исп., инвентарь безразмерный) 
const int INV_MAX_WEAPO		= 6;		//оружие
const int INV_MAX_ARMORS		= 2;		//броня
const int INV_MAX_RUNES			= 1000;		//руны (бесконечность)
const int INV_MAX_FOOD			= 15;		//пища
const int INV_MAX_DOCS			= 1000;		//документы (бесконечность)
const int INV_MAX_POTIO		= 1000;		//напитки (бесконечность)
const int INV_MAX_MAGIC			= 1000;		//магические предметы (бесконечность)
const int INV_MAX_MISC			= 1000;		//прочее (бесконечность)


const int ITM_TEXT_MAX	= 6; //предельное число строк описания предмета

// ПРЕДМЕТЫ ----------------------------------------------------------------

// Флаги категорий предметов (внутр.)
	//общие
const int ITEM_KAT_NONE			= 1;		//без категории
const int ITEM_KAT_NF			= 1 << 1;	//одноручное оружие
const int ITEM_KAT_FF			= 1 << 2;	//двуручное оружие
const int ITEM_KAT_MUN			= 1 << 3;	//заряды (стрелы)
const int ITEM_KAT_ARMOR		= 1 << 4;	//броня
const int ITEM_KAT_FOOD			= 1 << 5;	//пища
const int ITEM_KAT_DOCS			= 1 << 6;	//документы
const int ITEM_KAT_POTIONS		= 1 << 7;	//зелья
const int ITEM_KAT_LIGHT		= 1 << 8;	//светильники
const int ITEM_KAT_RUNE			= 1 << 9;	//руны
const int ITEM_KAT_MAGIC		= 1 << 31;	//магические предметы
const int ITEM_KAT_KEYS			= 1;		//ключи (нет прим.)
	//оружие
const int ITEM_DAG				= 1 << 13;	//кинжал (не исп.)
const int ITEM_SWD				= 1 << 14;	//меч
const int ITEM_AXE				= 1 << 15;	//топор
const int ITEM_2HD_SWD			= 1 << 16;	//двуручный меч
const int ITEM_2HD_AXE			= 1 << 17;	//двуручный топор (посох)
const int ITEM_SHIELD			= 1 << 18;	//щит (не исп.)
const int ITEM_BOW				= 1 << 19;	//лук
const int ITEM_CROSSBOW			= 1 << 20;	//арбалет
	//усиление (магические предметы)
const int ITEM_RING				= 1 << 11;	//кольцо
const int ITEM_AMULET			= 1 << 22;	//амулет	
const int ITEM_BELT				= 1 << 24;	//ремень
	//свойства
const int ITEM_DROPPED			= 1 << 10;	//выброшенный (внутр.)
const int ITEM_MISSION			= 1 << 12;	//квестовый
const int ITEM_MULTI			= 1 << 21;	//пакуемый - несколько предметов в 1 ячейке
const int ITEM_NFOCUS			= 1 << 23;	//не отображается в фокусе, нельзя подобрать (внутр.)
const int ITEM_CREATEAMMO		= 1 << 25;	//самозаряжаемый (не исп.)
const int ITEM_NSPLIT			= 1 << 26;	//неделимый ??? (вероятно, не исп.)
const int ITEM_DRINK			= 1 << 27;	//можно пить (не исп.)
const int ITEM_TORCH			= 1 << 28;	//факел
const int ITEM_THROW			= 1 << 29;	//можно бросить (не исп.)
const int ITEM_ACTIVE			= 1 << 30;	//активен (внутр.)

// доп. флаги, прописывать в слот weight
const int ITEM_Mushroom			= 1 << 0;	// гриб
const int ITEM_Feminine			= 1 << 17;	// женская вещь (одежда)

// ПОВРЕЖДЕНИЯ --------------------------------------------------------

//Флаги повреждений (внутр.)
const int DAM_INVALID			= 0;		//неизвестный тип (не исп.)
const int DAM_BARRIER			= 1;		//барьер (не исп.)
const int DAM_BLUNT				= 1 << 1;	//тупое оружие - молот, дубина, посох, кулак
const int DAM_EDGE				= 1 << 2;	//острое оружие - мечи, топоры, шпаги
const int DAM_FIRE				= 1 << 3;	//огонь
const int DAM_FLY				= 1 << 4;	//падение после удара (нокаута)
const int DAM_MAGIC				= 1 << 5;	//магия
const int DAM_POINT				= 1 << 6;	//точечное - от стрел
const int DAM_FALL				= 1 << 7;	//падение с высоты (не исп.)

//Индексы повреждений (индекс соответствует номеру флага)
const int DAM_INDEX_BARRIER		= 0;		//барьер (не исп.)
const int DAM_INDEX_BLUNT		= 1;		//тупое оружие - молот, дубина, кулак
const int DAM_INDEX_EDGE		= 2;		//острое оружие - мечи, топоры, шпаги
const int DAM_INDEX_FIRE		= 3;		//огонь
const int DAM_INDEX_FLY			= 4;		//падение после удара
const int DAM_INDEX_MAGIC		= 5;		//магия
const int DAM_INDEX_POINT		= 6;		//точечное - от стрел
const int DAM_INDEX_FALL		= 7;		//падение с высоты (не исп.)
const int DAM_INDEX_MAX			= 8;	//кол-во типов повреждений

//Другое (не исп.)
const int NPC_ATTACK_FINISH_DISTANCE			= 180;	//расстояние прекращения атаки
const int NPC_BURN_TICKS_PER_DAMAGE_POINT		= 1000;	//вспышек за единицу ???
const int NPC_BURN_DAMAGE_POINTS_PER_INTERVALL	= 50;	//поврежденеи огнем за ед. вермени
const int DAM_CRITICAL_MULTIPLIER				= 2;	//коэф-т урона при крит. ударе (не исп.)

const int BLOOD_SIZE_DIVISOR					= 1000;	//разделитель количества крови
const int BLOOD_DAMAGE_MAX						= 200;  //макс. кровопотеря

const int DAMAGE_FLY_CM_MAX						= 2000;	//макс. урон при падении от удара
const int DAMAGE_FLY_CM_MIN						= 300;	//мин. урон при падении от удара
const int DAMAGE_FLY_CM_PER_POINT				= 5;	//урон при падении от удара за единицу

const int NPC_DAM_DIVE_TIME						= 100;	//урон от удушья в ед. времени

//Иммутитет к урону
const int IMMUNE				= -1; 			

//коэф-т дистанции, на которой персонаж перестает сражаться (относит. расстояния BASE + длина оружия)
const float NPC_COLLISION_CORRECTION_SCALER		= 0.75;

//Типы защиты (индексы совпадают с типами повреждений) (кол-во не менять)
const int PROT_BARRIER			= 0;
const int PROT_BLUNT			= 1;
const int PROT_EDGE				= 2;
const int PROT_FIRE				= 3;
const int PROT_FLY				= 4;
const int PROT_MAGIC			= 5;
const int PROT_POINT			= 6;
const int PROT_FALL				= 7;
const int PROT_INDEX_MAX		= 8;

// ВОСПРИЯТИЕ ----------------------------------------------------------
/* Подробнее о восприятиях в AI\AI_Intern\Perception.d */

//Активные восприятия 
const int PERC_ASSESSPLAYER			= 1;		//игрока
const int PERC_ASSESSENEMY			= 2;		//врага
const int PERC_ASSESSFIGHTER		= 3;		//драчуна (не исп.)
const int PERC_ASSESSBODY			= 4;		//тела
const int PERC_ASSESSITEM			= 5;		//предмета (нет прим.)

//Чувства, через которые поступают активные восприятия
const int SENSE_SEE				= 1;		//зрение
const int SENSE_HEAR			= 1 << 1;	//слух
const int SENSE_SMELL			= 1 << 2;	//обоняние

//Пассивные восприятия
const int PERC_ASSESSMURDER			= 6;		//убийство
const int PERC_ASSESSDEFEAT			= 7;		//поражение
const int PERC_ASSESSDAMAGE			= 8;		//повреждение
const int PERC_ASSESSOTHERSDAMAGE	= 9;  		//повреждение другого
const int PERC_ASSESSTHREAT			= 10;		//угроза
const int PERC_ASSESSREMOVEWEAPON	= 11;		//оружие спрятано	
const int PERC_OBSERVEINTRUDER		= 12;		//вторжение злоумышленника
const int PERC_ASSESSFIGHTSOUND		= 13;		//шум сражения
const int PERC_ASSESSQUIETSOUND		= 14;		//тихий звук
const int PERC_ASSESSWARN			= 15;		//предупреждение
const int PERC_CATCHTHIEF			= 16;		//поимка вора с поличным
const int PERC_ASSESSTHEFT			= 17;		//воровство
const int PERC_ASSESSCALL			= 18;		//обращение
const int PERC_ASSESSTALK			= 19;		//беседа
const int PERC_ASSESSGIVENITEM		= 20;		//передача предмета
const int PERC_ASSESSFAKEGUILD		= 21;		//фальшивая гильдия (как только переоделся)
const int PERC_MOVEMOB				= 22;		//перемещение объекта
const int PERC_MOVENPC				= 23;		//перемещение персонажа
const int PERC_DRAWWEAPON			= 24;		//обнаженное оружие
const int PERC_OBSERVESUSPECT		= 25;		//замечен подозреваемый 
const int PERC_NPCCOMMAND			= 26;		//команда от персонажа
const int PERC_ASSESSMAGIC			= 27;		//магия
const int PERC_ASSESSSTOPMAGIC		= 28;		//прекращение колдовства
const int PERC_ASSESSCASTER			= 29;		//произносится заклинание (как только инвестирован 1п. маны)
const int PERC_ASSESSSURPRISE		= 30;		//неожиданность
const int PERC_ASSESSENTERROOM		= 31;		//вход в помещение (область)
const int PERC_ASSESSUSEMOB			= 32;		//использование объекта

//Распространение новостей
const int NEWS_DONT_SPREAD							= 0; 		//не распространяются			
const int NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_VICTIM	= 1;		//через друзей жертвы
const int NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_WITNESS	= 2;		//через друзей свидетеля 
const int NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_OFFENDER	= 3;		//через друзей обидчика 
const int NEWS_SPREAD_NPC_SAME_GUILD_VICTIM			= 4;	 	//внутри гильдии

const int important				= 1;       //важная новость

const int INF_TELL				= 0;		//информация получена в разговоре
const int INF_UNKNOWN			= 2;		//информация получена неизвестным путем


// ЖУРНАЛ ----------------------------------------------------------------

//Статусы миссий (внутр.)
const int LOG_Running			= 1;		//выполняется
const int LOG_SUCCESS			= 2;		//успешно завершена
const int LOG_FAILED			= 3;		//провалена
const int LOG_OBSOLETE			= 4;		//отменена


// ГИЛЬДИИ ---------------------------------------------------------------

//Типы отношений (внутр.)
const int ATT_FRIENDLY			= 3;		//дружественное
const int ATT_NEUTRAL			= 2;		//нейтральное
const int ATT_ANGRY				= 1;		//натянутое
const int ATT_HOSTILE			= 0;		//враждебное


//Индексы гильдий
//люди
const int GIL_OUTDOOR			= -3;		//улица //NS: Wld_GetPlayerPortalGuild() = 0 на улице, а Npc_GetPortalGuild(npc) = -1
const int GIL_ROOMNONE			= -2;		//помещение никому не принадлежит (заходи кто хошь, бери что хошь)
const int GIL_NONE				= 0;		//без гильдии (улица)
const int GIL_HUMAN				= 1;		//человек (для заполнения C_GILVALUES для всех людей)
const int GIL_PAL				= 1;		//паладин
const int GIL_MIL				= 2;		//ополченец (милиция, городская стража)
const int GIL_VLK				= 3;		//горожанин
const int GIL_KDF				= 4;		//маг огня
const int GIL_NOV				= 5;		//послушник
//const int GIL_DJG				= 6;		//охотник на драконов
const int GIL_BAU2				= 6;		//крестьяне вне владений Онара
const int GIL_SLD				= 7;		//наемник
const int GIL_BAU				= 8;		//крестьяне
const int GIL_BDT				= 9;		//бандит
const int GIL_STRF				= 10;		//каторжник (заключенный, раб)
const int GIL_DMT				= 11;		//ищущий (черный маг)
const int GIL_OUT				= 12;		//чужак (воры, нейтральные крестьяне и пр.)
const int GIL_PIR				= 13;		//пират
const int GIL_KDW				= 14;		//маг воды
const int GIL_EMPTY_D			= 15;		//(не исп.)
const int GIL_PUBLIC			= 15;		//публичное (для общественных помещений) (заходить можно, но брать ничего нельзя)
	const int GIL_SEPERATOR_HUM		= 16; //кол-во гильдий людей (внутр.)
	
const int GIL_DUNGEON			= 16;	 	//подземелье, склеп (для помещений - порталов) (там прохладно)
const int GIL_CAVE				= 17; 		//пещера, дикая (для помещений - порталов)

//монстры
const int GIL_MEATBUG			= 17;		//мясной жук
const int GIL_SHEEP				= 18;		//овца
const int GIL_GOBBO				= 19;		//гоблин зеленый/черный
const int GIL_GOBBO_SKELETON	= 20;		//скелет гоблина	
const int GIL_SUMMONED_GOBBO_SKELETON	= 21;	//вызванный скелет гоблина
const int GIL_SCAVENGER			= 22;		//падальщик /злой падальщик / чомпер (кусач)
const int GIL_Giant_Rat			= 23;		//гигантская крыса
const int GIL_GIANT_BUG			= 24;		//полевой хищник (полевой жук)
const int GIL_BLOODFLY			= 25;		//шершень (крвоавая муха)
const int GIL_WARAN				= 26;		//ящер (варан) / огненный варан
const int GIL_WOLF				= 27;		//волк (и варг)
const int GIL_SUMMONED_WOLF		= 28;		//вызванный волк
const int GIL_MINECRAWLER		= 29;		//ползун (краулер) / ползун-воин
const int GIL_LURKER			= 30;		//шныг (лукер)
//const int GIL_SKELETON			= 31;		//скелет
//const int GIL_SUMMONED_SKELETON	= 32;		//призванный скелет
const int GIL_SKELETON_MAGE		= 33;		//скелет-маг
const int GIL_ZOMBIE			= 34;		//зомби
const int GIL_SNAPPER			= 35;		//снеппер (глорх) / драконий снеппер / бритвозуб
const int GIL_SHADOWBEAST		= 36;		//мракорис / кровавая гончая (пес-кровосос)
const int GIL_SHADOWBEAST_SKELETON	= 37;	//скелет мракориса
const int GIL_HARPY				= 38;		//гарпия
const int GIL_STONEGOLEM		= 39;		//каменный голем
const int GIL_FIREGOLEM			= 40;		//огненный голем
const int GIL_ICEGOLEM			= 41;		//ледяной голем
const int GIL_SUMMONED_GOLEM	= 42;		//вызванный голем
const int GIL_DEMON				= 43;		//демон
const int GIL_SUMMONED_DEMON	= 44;		//вызванный демон
const int GIL_TROLL				= 45;		//тролль / черный тролль
const int GIL_SWAMPSHARK		= 46;		//болотная акула (болтожор)
const int GIL_DRAGON			= 47;		//дракон
const int GIL_MOLERAT			= 48;		//кротокрыс
const int GIL_Alligator			= 49;		//аллигатор
const int GIL_SWAMPGOLEM		= 50;		//болотный голем
const int GIL_Stoneguardian		= 51;		//каменный страж
const int GIL_Gargoyle			= 52;		//гаргулья
const int GIL_Keiler			= 53;		//кабан
const int GIL_SummonedGuardian	= 54;		//призванный сраж
const int GIL_SummonedZombie	= 55;		//призванный зомби
const int GIL_EMPTY_B			= 56;		//пусто
const int GIL_EMPTY_C			= 57;		//пусто

//орки и другие цивилизации
	const int GIL_SEPERATOR_ORC		= 58; 		//разделитель гильдий орков
const int GIL_ORC				= 59;		//орки (воин / элитный / шаман)
const int GIL_FRIENDLY_ORC		= 60;		//дружественный орк (орк-раб / Ур Шак)
const int GIL_UNDEADORC			= 61;		//орк-нежить
const int GIL_DRACONIAN			= 62;		//люди-ящеры
const int GIL_SKELETON	= 63;		//скелет (если гильдия среди монстров - то не меняет оружие)
const int GIL_SUMMONED_SKELETON	= 64;		//призванный скелет
const int GIL_EMPTY_Z			= 65;		//пусто
const int GIL_MAX				= 66;		//кол-во гильдий (не менять)

//Класс параметров гильдии (внутр.)
/* значения задаются в Species.d */
class C_GILVALUES
{
	var int water_depth_knee[GIL_MAX]; 		//глубина воды до колена
	var int water_depth_chest[GIL_MAX];		//глубина воды до груди
	var int jumpup_height[GIL_MAX];			//высота прыжка
	var int swim_time[GIL_MAX];				//длительность плавания
	var int dive_time[GIL_MAX];				//длительность ныряния
	var int step_height[GIL_MAX];			//высота шага
	var int jumplow_height[GIL_MAX];		//высота низкого прыжка
	var int jumpmid_height[GIL_MAX];		//высота среднего прыжка
	var int slide_angle[GIL_MAX];			//угол начала скольжения по сколону
	var int slide_angle2[GIL_MAX];          //угол начала скольжения по сколону 2 (не исп.)
	var int disable_autoroll[GIL_MAX];      // ??? автовращение отключено (=TRUE/FALSE)
	var int surface_align[GIL_MAX];			//положение в пространстве: 0 - на 2 ногах (вертикально); 1 - на 4 ногах (горизонтально); 2 - около земли (ползанье)
	var int climb_heading_angle[GIL_MAX];	//угол высокого подъема
	var int climb_horiz_angle[GIL_MAX];     //угол подъема по горизонтали
	var int climb_ground_angle[GIL_MAX];    //угол подъема вдоль земли (по факту все углы подъема совпадают)
 	var int fight_range_base[GIL_MAX];		//базовый диапазон атаки 
	var int fight_range_fist[GIL_MAX];		//диапазон для атаки кулаком (лапой) FAI_W = BASE + ItemRange (oder Fist)
	var int fight_range_g[GIL_MAX];			//диапазон для атаки с разбега FAI_G = BASE + ItemRange (oder Fist) + G
	var int fight_range_1hs[GIL_MAX];		//диапазон атаки одноручным (не исп.), определяется длиной оружия
	var int fight_range_1ha[GIL_MAX]; 		//диапазон атаки одноручным (не исп.)
	var int fight_range_2hs[GIL_MAX];		//диапазон атаки двуручным (не исп.)
	var int fight_range_2ha[GIL_MAX];		//диапазон атаки двуручным (не исп.)
	var int falldown_height[GIL_MAX];		//макс. высота падения без повреждений
	var int falldown_damage[GIL_MAX];		//повреждение от падения за каждый следующий метр
	var int blood_disabled[GIL_MAX];		//отключение крови (напр., у скелетов) (=TRUE/FALSE) (по умолч. = FALSE, т.е. кровь есть)
	var int blood_max_distance[GIL_MAX];	//радиус разбрызгивания крови, см (по умолч. = 1000)
	var int blood_amount[GIL_MAX];			//количество крови (по умолч. = 10)
	var int blood_flow[GIL_MAX];			//кровотечение медленное (=TRUE/FALSE) (по умолч. = 0)
	var string blood_emitter[GIL_MAX];		//источник крови (по умолч. = "PFX_BLOOD")
	var string blood_texture[GIL_MAX];		//текстура крови (по умолч. = "ZBLOODSPLAT2.TGA")
	var int turn_speed[GIL_MAX];			//скорость поворота (по умолч. = 150)
};

// ----------------------------------------------------------------------------


// Звуки (не исп.)
const int NPC_SOUND_DROPTAKE		= 1;		//что-то уронили
const int NPC_SOUND_SPEAK			= 3;		//речь
const int NPC_SOUND_STEPS			= 4;		//шаги
const int NPC_SOUND_THROWCOLL		= 5;		//выстрел (пролетевшая стрела)
const int NPC_SOUND_DRAWWEAPON		= 6;		//вытаскиваемое оружие
const int NPC_SOUND_SCREAM			= 7;		//крик
const int NPC_SOUND_FIGHT			= 8;		//драка


// Материалы (внутр.)
const int MAT_WOOD					= 0;		//дерево
const int MAT_STONE					= 1;		//камень
const int MAT_METAL					= 2;		//металл
const int MAT_LEATHER				= 3;		//кожа
const int MAT_CLAY					= 4;	    //глина (не исп.)
const int MAT_GLAS					= 5;		//стекло


//Разделы журнала (внутр.)
const int LOG_MISSION				= 0;		//миссии (квесты)
const int LOG_NOTE					= 1;		//записи

//бесконечное время (используется для длительности плавания)
const int TIME_INFINITE	= -1000000 / 1000;

//вариация ??? голосов персонажей (нет прим.)
const int NPC_VOICE_VARIATION_MAX	= 10;

//Торговля
const float TRADE_VALUE_MULTIPLIER	= 0.15; 		//коэф-т стоимости при продаже (по умолч. 0.3)
const string TRADE_CURRENCY_ITANCE	= "ITMI_GOLD";	//валюта



// ЗАКЛИНАНИЯ ------------------------------------------------------------

//Качество заклинания
const int SPELL_GOOD				= 0; 		//хорошее (таковых не обнаружено)
const int SPELL_NEUTRAL				= 1;		//нейтральное (сон, свет, лечение и др.)
const int SPELL_BAD					= 2;		//плохое (по умолчанию)

//Применение заклинания
const int SPL_DONTINVEST					= 0;		//недостаточно маны для инвестирования
const int SPL_RECEIVEINVEST					= 1;		//нужное кол-во маны инвестировано
const int SPL_SENDCAST						= 2;		//заклинание применено
const int SPL_SENDSTOP						= 3;		//заклинание отменено из-за нехватки маны
const int SPL_NEXTLEVEL						= 4;		//переход на следующий уровень зарядки
const int SPL_STATUS_CANINVEST_NO_MANADEC	= 8;		//инвестированной маны недостаточно для перехода на следующий уровень
const int SPL_FORCEINVEST					= 1 << 16;	//принудителньое ивестирование (нет прим.)

//Цели заклинаний
const int TARGET_COLLECT_NONE					= 0;	//нет (определяется дальностью и углами азимута и тангажа)
const int TARGET_COLLECT_CASTER					= 1;	//заклинатель
const int TARGET_COLLECT_FOCUS					= 2;	//что-то или кто-то в фокусе
const int TARGET_COLLECT_ALL					= 3;	//все вокруг
const int TARGET_COLLECT_FOCUS_FALLBACK_NONE	= 4;	//объект в фокусе, при потере цели - нет
const int TARGET_COLLECT_FOCUS_FALLBACK_CASTER	= 5;	//объект в фокусе, при потере цели - заклинатель
const int TARGET_COLLECT_ALL_FALLBACK_NONE		= 6;	//все вокруг, при потере цели - нет
const int TARGET_COLLECT_ALL_FALLBACK_CASTER	= 7;	//все вокруг, при потере цели - заклинатель

//Тип цели заклинания
/* по факту используется только TARGET_TYPE_NPCS */
const int TARGET_TYPE_ALL					= 1;		//кто или что угодно
const int TARGET_TYPE_ITEMS					= 2;		//предметы
const int TARGET_TYPE_NPCS					= 4;		//любые персонажи
const int TARGET_TYPE_ORCS					= 8;		//орки
const int TARGET_TYPE_HUMA				= 16;		//люди
const int TARGET_TYPE_UNDEAD				= 32;		//нежить

//Идентификаторы заклинаний (ID)
/* см. описание в IT_Runen.d, IT_AddonRunes.d, IT_Scrolls.d, действие в AI\Magic\ */
//магия паладинов
const int SPL_PalLight						= 0;		//святой свет
const int SPL_PalLightHeal					= 1;		//малое исцеление
const int SPL_PalHolyBolt					= 2;		//святая стрела
const int SPL_PalMediumHeal					= 3;		//среднее исцеление
const int SPL_PalRepelEvil					= 4;		//изгнание зла
const int SPL_PalFullHeal					= 5;		//большое исцеление
const int SPL_PalDestroyEvil				= 6;		//уничтожение зла
const int SPL_PalTeleportSecret				= 7;		//секретный телепорт паладинов
//телепорация
const int SPL_TeleportSeaport				= 8;		//в порт
const int SPL_TeleportMonastery				= 9;		//в монастырь
const int SPL_TeleportFarm					= 10;		//на ферму
const int SPL_TeleportXardas				= 11;		//к Ксардасу
const int SPL_TeleportPassNW				= 12;		//к проходу Хориниса (новый мир)
const int SPL_TeleportPassOW				= 13;		//к проходы Хориниса (старый мир)
const int SPL_TeleportOC					= 14;		//в старый лагерь
const int SPL_TeleportOWDemonTower			= 15;		//башня демонов
const int SPL_TeleportTaverne				= 16;		//к таверне
const int SPL_Teleport_3					= 17;		//(пусто)
//заклинания магов огня
const int SPL_Light							= 18;		//свет
const int SPL_Firebolt						= 19;		//огненная стрела
const int SPL_Icebolt						= 20;		//ледяная стрела
const int SPL_LightHeal						= 21;		//лечение легких ранений
const int SPL_SummonGoblinSkeleton			= 22;		//призыв скелет гоблина
const int SPL_InstantFireball				= 23;		//огненный шар
const int SPL_Zap							= 24;		//малая молния
const int SPL_SummonWolf					= 25;		//призыв волка
const int SPL_WindFist						= 26;		//кулак ветра
const int SPL_Sleep							= 27;		//сон
const int SPL_MediumHeal					= 28;		//лечение средних ранений
const int SPL_LightningFlash				= 29;		//молния
const int SPL_ChargeFireball				= 30;		//большой огненный шар
const int SPL_SummonSkeleton				= 31;		//призыв скелета
const int SPL_Fear							= 32;		//страх
const int SPL_IceCube						= 33;		//ледяная глыба (ледяной блок)
const int SPL_ChargeZap						= 34;		//шаровая молния
const int SPL_SummonGolem					= 35;		//призыв голема
const int SPL_DestroyUndead					= 36;		//уничтожение нежити
const int SPL_Pyrokinesis					= 37;		//пирокинез
const int SPL_Firestorm						= 38;		//огненный шторм
const int SPL_IceWave						= 39;		//ледяная волна
const int SPL_SummonDemon					= 40;		//призыв демона
const int SPL_FullHeal						= 41;		//лечение тяжелых ранений
const int SPL_Firerain						= 42;		//огненный дождь
const int SPL_BreathOfDeath					= 43;		//дыхание смерти
const int SPL_MassDeath						= 44;		//волна смерти
const int SPL_ArmyOfDarkness				= 45;		//армия тьмы
const int SPL_Shrink						= 46;		//сморщивание монстра
//свитки превращения
const int SPL_TrfSheep						= 47;		//в овцу			
const int SPL_TrfScavenger					= 48;		//в падальщика
const int SPL_TrfGiantRat					= 49;		//в гигантскую крысу
const int SPL_TrfGiantBug					= 50;		//в полевого хищника (жука)
const int SPL_TrfWolf						= 51;		//в волка
const int SPL_TrfWaran						= 52;		//в ящера (варана)
const int SPL_TrfSnapper					= 53;		//в снеппера (глорха)
const int SPL_TrfWarg						= 54;		//в варга
const int SPL_TrfFireWaran					= 55;		//в огненного ящера (варана)
const int SPL_TrfLurker						= 56;		//в шныга (лукера)
const int SPL_TrfShadowbeast				= 57;		//в мракориса
const int SPL_TrfDragonSnapper				= 58;		//в драконьего снеппера
//другие свитки
const int SPL_Charm							= 59;		//забвение (чары)
const int SPL_MasterOfDisaster				= 60;		//святая стрела
//магия тьмы - не найдено в игре, но заскриптовано
const int SPL_Deathbolt						= 61;		//стрела смерти
const int SPL_Deathball						= 62;		//шар смерти
const int SPL_ConcussionBolt				= 63;		//стрела сотрясения
//резерв
const int SPL_Reserved_64					= 64;
const int SPL_Reserved_65					= 65;
const int SPL_Reserved_66					= 66;
const int SPL_Reserved_67					= 67;
const int SPL_Reserved_68					= 68;
const int SPL_Reserved_69					= 69;
//заклинания магов воды
const int SPL_Thunderstorm					= 70;		//удар грома
const int SPL_Whirlwind						= 71;		//буря
const int SPL_WaterFist						= 72;		//кулак воды
const int SPL_IceLance						= 73;		//ледяной копье
const int SPL_Inflate						= 74;		//раздуть (нет ни руны, ни свитка)
const int SPL_Geyser						= 75;		//гейзер
const int SPL_Waterwall						= 76;		//водопад (нет ни руны, ни свитка)
//резерв
const int SPL_Reserved_77					= 77;
const int SPL_Reserved_78					= 78;
const int SPL_Reserved_79					= 79;
//заклинания древней цивилизации
const int SPL_Plague						= 80;	    //нашествие насекомых (нет ни руны, ни свитка)
const int SPL_Swarm							= 81;		//рой насекомых
const int SPL_GreenTentacle					= 82;		//корень-ловушка (зеленые щупальца)
const int SPL_Earthquake					= 83;		//землетрясение (нет ни руны, ни свитка)
const int SPL_SummonGuardian				= 84;		//призыв стража
const int SPL_Energyball					= 85;		//энергетический шар, см. гнев Белиара - BeliarsRage
const int SPL_SuckEnergy					= 86;		//кража энергии (высасывание энергии)
const int SPL_Skull							= 87;		//крик смерти (крик мертвых)
const int SPL_SummonZombie					= 88;		//призыв зомби
const int SPL_SummonMud						= 89;		//призыв утопленника (муда, болотноо зомби). недоработана, см в TestModelle_Bendin.d
//резерв
const int SPL_Reserved_90					= 90;
const int SPL_Reserved_91					= 91;
const int SPL_Reserved_92					= 92;
const int SPL_Reserved_93					= 93;
const int SPL_Reserved_94					= 94;
const int SPL_Reserved_95					= 95;
const int SPL_Reserved_96					= 96;
const int SPL_Reserved_97					= 97;
const int SPL_Reserved_98					= 98;
const int SPL_Reserved_99					= 99;

const int MAX_SPELL							= 100; // макс. кол-во заклинний

//Названия классов для каждого заклинания, в том же порядке
const string spellFxInstanceNames[100]	=
{
	//магия паладинов
	"PalLight",
	"PalHeal",
	"PalHolyBolt",
	"PalHeal",
	"PalRepelEvil",
	"PalHeal",
	"PalDestroyEvil",
	//телепорация
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	//заклинания магов огня
	"Light",
	"Firebolt",
	"Icebolt",
	"Heal",
	"SummonGoblinSkeleton",
	"InstantFireball",
	"Zap",
	"SummonWolf",
	"WindFist",
	"Sleep",
	"Heal",
	"LightningFlash",
	"ChargeFireball",
	"SummonSkeleton",
	"Fear",
	"Icecube",
	"ChargeZap",
	"SummonGolem",
	"DestroyUndead",
	"Pyrokinesis",
	"Firestorm",
	"Icewave",
	"SummonDemon",
	"Heal",
	"Firerain",
	"BreathOfDeath",
	"MassDeath",
	"ArmyOfDarkness",
	"Shrink",
	//превращение
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	//другие свитки
	"Charm",
	"MasterOfDisaster",
	//магия тьмы
	"Deathbolt",
	"Deathball",
	"Concussionbolt",
	//резерв
	"Light",
	"Light",
	"Light",
	"Light",
	"Light",
	"Light",
	//заклинания магов воды
	"Thunderstorm",
	"Whirlwind",
	"Waterfist",
	"IceLance",
	"Sleep",
	"Geyser",
	"Firerain",
	//резерв
	"Light",
	"Light",
	"Light",
	//заклинания древней цивилизации
	"Fear",
	"Swarm",
	"Greententacle",
	"Firerain",
	"SummonGuardian",
	"Energyball",
	"SuckEnergy",
	"Skull",
	"SummonZombie",
	"SummonMud",
	//резерв
	"Light",
	"Light",
	"Light",
	"Light",
	"Light",
	"Light",
	"Light",
	"Light",
	"Light",
	"Light"
};


//Названия анимации заклинаний
const string spellFxAniLetters[100]	=
{
	//магия паладинов
	"SLE",
	"HEA",
	"FBT",
	"HEA",
	"FBT",
	"HEA",
	"FIB",
	//телепорация
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	//заклинания магов огня
	"SLE",
	"FBT",
	"FBT",
	"HEA",
	"SUM",
	"FBT",
	"FBT",
	"SUM",
	"WND",
	"SLE",
	"HEA",
	"WND",
	"FIB",
	"SUM",
	"FEA",
	"FRZ",
	"FIB",
	"SUM",
	"FIB",
	"FIB",
	"FIB",
	"FEA",
	"SUM",
	"HEA",
	"FEA",
	"FIB",
	"MSD",
	"SUM",
	"SLE",
	//превращение
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	//другие свитки
	"FIB",
	"FIB",
	//магия тьмы
	"FBT",
	"FBT",
	"FBT",
	//резерв
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	//заклинания магов воды
	"STM",
	"WHI",
	"WND",
	"FBT",
	"SLE",
	"WND",
	"FEA",
	//резерв
	"XXX",
	"XXX",
	"XXX",
	//заклинания древней цивилизации
	"FBT",
	"FBT",
	"FRZ",
	"FEA",
	"SUM",
	"WND",
	"WND",
	"WND",
	"SUM",
	"SUM",
	//резерв
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"XXX"
};

// НАВЫКИ ----------------------------------------------------------------------------

/* не изменять навыки владения оружием и общее кол-во */
const int NPC_TALENT_UNKNOWN			= 0; 		//неизвестно какой
const int NPC_TALENT_1H					= 1;		//одноручное
const int NPC_TALENT_2H					= 2;		//двуручное
const int NPC_TALENT_BOW				= 3;		//лук
const int NPC_TALENT_CROSSBOW			= 4;		//арбалет
const int NPC_TALENT_PICKLOCK			= 5;		//взлом замков
//										= 6; 		//в Г1 была кража 
const int NPC_TALENT_MAGE				= 7;		//круги магии
const int NPC_TALENT_SNEAK				= 8;		//подкрыдвание
const int NPC_TALENT_REGENERATE			= 9;		//регенерация (нет прим.)
const int NPC_TALENT_FIREMASTER			= 10;		//обращени с огнем (не исп.)
const int NPC_TALENT_ACROBAT			= 11;		//акробатика
const int NPC_TALENT_PICKPOCKET			= 12;		//карманная кража
const int NPC_TALENT_SMITH				= 13;		//кузнечное дело
const int NPC_TALENT_RUNES				= 14;		//изготовление рун
const int NPC_TALENT_ALCHEMY			= 15;		//алхимия
const int NPC_TALENT_TAKEANIMALTROPHY	= 16;		//разделка животных (трофеи охотника)
const int NPC_TALENT_FOREIGNLANGUAGE	= 17;		//иностранные языки
const int NPC_TALENT_MRCOUNT			= 18;		//кол-во грибов
const int NPC_TALENT_CMPACTIVITY		= 19;		//сложность
const int NPC_TALENT_HERONAME			= 20;		//имя ГГ для отображения в меню
const int NPC_TALENT_PATRONGOD			= 21;		//бог-покровитель
const int NPC_TALENT_MAX				= 22;	//макс. кол-во навыков

/* все прочие умения прописываются через глобальные константы и реализуются в скриптах */

//РУНЫ
//умение изготавливать каждую из рун
var int player_talent_runes[MAX_SPELL];

//Индексы уровень владения языками (индексы)
const int LANGUAGE_1					= 0;   		// 1
const int LANGUAGE_2					= 1;		// 2
const int LANGUAGE_3					= 2;		// 3
const int MAX_LANGUAGE					= 3;		// кол-во уровней
//владение каждым из уровеней
var int player_talent_foreignlanguage[MAX_LANGUAGE]; 

//ОГОНЕК
//Индексы умений находить предметы (направления поиска огонька)
const int WISPSKILL_NF					= 0;	    //одноручное оружие
const int WISPSKILL_FF					= 1;		//двуручное оружие
const int WISPSKILL_NONE				= 2;		//разное (в т.ч. деньги, ключи)
const int WISPSKILL_RUNE				= 3;		//руны
const int WISPSKILL_MAGIC				= 4;		//магические предметы
const int WISPSKILL_FOOD				= 5;		//пища и растения
const int WISPSKILL_POTIONS				= 6;		//зелья
const int MAX_WISPSKILL					= 7;	//кол-во направлений поиска
//владение каждым из направлений
var int player_talent_wispdetector[MAX_WISPSKILL]; 

//Индексы режимов поиска (не совпадают с индексами умений!)
var int WispSearching;  // выбранный режим
const int WispSearch_Follow				= 1;    	//огонек следует за героем
const int WispSearch_ALL				= 2;		//ищет все подряд
const int WispSearch_POTIONS			= 3;		//зелья
const int WispSearch_MAGIC				= 4;		//магические предметы
const int WispSearch_FOOD				= 5;		//продукты и травы
const int WispSearch_NF					= 6;		//одноручное оружие
const int WispSearch_FF					= 7;		//двуручное оружие
const int WispSearch_NONE				= 8;		//прочие предметы (деньги, ключи и др.)
const int WispSearch_RUNE				= 9;		//руны

//АЛХИМИЯ
//Индексы зелий
const int POTION_Health_01				= 0;		//лечебная эссенция
const int POTION_Health_02				= 1;		//лечебный экстракт
const int POTION_Health_03				= 2;		//лечебный эликсир
const int POTION_Mana_01				= 3;		//эссенция маны
const int POTION_Mana_02				= 4;		//экстракт маны
const int POTION_Mana_03				= 5;		//эликсир маны
const int POTION_Speed					= 6;		//напиток ускорения (эликсир скорости)
const int POTION_Perm_STR				= 7;		//эликсир силы
const int POTION_Perm_DEX				= 8;		//эликсир ловкосты
const int POTION_Perm_Mana				= 9;		//эликсир духа 
const int POTION_Perm_Health			= 10;		//эликсир жизни
const int POTION_MegaDrink				= 11;		//Эмбарла Фиргасто (зелье из драконьих яиц)
const int CHARGE_Innoseye				= 12;		//зарядить Глаз Инноса
const int POTION_Mana_04				= 13;		//чистая мана
const int POTION_Health_04				= 14;		//чистое здоровье
const int MAX_POTION					= 15;	//кол-во зелий
//умение изготавливать каждое из зелий 
var int player_talent_alchemy[MAX_POTION];

//КУЗНЕЧНОЕ ДЕЛО
/* само оружие см. в IT_Melee_Weapons.d */
//Индексы видов самокованых клинков
const int WEAPON_Common					= 0;		//(простой) меч
const int WEAPON_1H_Special_01			= 1;		//длинный рудный меч
const int WEAPON_2H_Special_01			= 2;		//Двуручный рудный меч
const int WEAPON_1H_Special_02			= 3;		//Полуторный рудный меч
const int WEAPON_2H_Special_02			= 4;		//Тяжелый двуручный рудный меч
const int WEAPON_1H_Special_03			= 5;		//Боевой клинок орков
const int WEAPON_2H_Special_03			= 6;		//Тяжелый рудный боевой клинок орков
const int WEAPON_1H_Special_04			= 7;		//Рудный клинок 'Убийца драконов'
const int WEAPON_2H_Special_04			= 8;		//Большой рудный клинок 'Убийца драконов'
const int WEAPON_1H_Harad_01			= 9;		//Изысканный меч
const int WEAPON_1H_Harad_02			= 10;		//Изысканный длинный меч
const int WEAPON_1H_Harad_03			= 11;		//Рубиновый клинок
const int WEAPON_1H_Harad_04			= 12;		//Эль-бастардо
const int MAX_WEAPO					= 13;	//кол-во видов самокованных клинков
//умение ковать каждый из клинков
var int player_talent_smith[MAX_WEAPO];

//РАЗДЕЛКА ЖИВОТНЫХ (добыча трофеев)
//Индексы видов трофеев
const int TROPHY_Teeth					= 0;		//зубы
const int TROPHY_Claws					= 1;		//когти
const int TROPHY_Fur					= 2;		//шкуры
const int TROPHY_Heart					= 3;		//сердце
const int TROPHY_ShadowHorn				= 4;		//рог мракориса
const int TROPHY_FireTongue				= 5;		//огненный язык
const int TROPHY_BFWing					= 6;		//крылья
const int TROPHY_BFSting				= 7;		//жало
const int TROPHY_Mandibles				= 8;		//жвала
const int TROPHY_CrawlerPlate			= 9;		//панцирь ползуна
const int TROPHY_DrgSnapperHorn			= 10;		//рог драконьего снеппера
const int TROPHY_DragonScale			= 11;		//чешуя дракона
const int TROPHY_DragonBlood			= 12;		//кровь дракона
const int TROPHY_ReptileSkin			= 13;		//кожа рептилии
const int TROPHY_KeilerTusk				= 14;		//клыки кабана
const int MAX_TROPHIES				= 15;	//кол-во видов трофеев
//умение добывать каждый из трофеев
var int player_talent_takeanimaltrophy[MAX_TROPHIES];

// ШРИФТЫ движка ------------------------------------------------------------------

const string TEXT_FONT_20			= "Font_old_20_white.tga";	//крупный
const string TEXT_FONT_10			= "Font_old_10_white.tga";	//мелкий
const string TEXT_FONT_DEFAULT		= "Font_old_10_white.tga";	//по умолчанию
const string TEXT_FONT_Inventory	= "Font_old_10_white.tga";	//инвентарь

//Продолжительность отображения фраз в диалоге (мс на символ)
const float VIEW_TIME_PER_CHAR		= 250;//550; UNFINISHED

// ПРОЧЕЕ -------------------------------------------------------------------------

//Области игрового мира
const int NEWWORLD_ZEN				= 1;		//новый мир (Хоринис)
const int OldWorld_Zen				= 2;		//старый мир (Миненталь, Долина Рудников)
const int DRAGONISLAND_ZEN			= 3;		//остров дракона (Ирдорат)
const int ADDONWORLD_ZEN			= 4;		//неизвестная часть остова (Яркендар)

const int MR_START_ZEN				= 5;		//стартовая локация для выбора персонажа

//Параметры камеры при отображении предметов инентаря
const int INVCAM_ENTF_RING_STANDARD		= 400;		//масштаб стандартного кольца
const int INVCAM_ENTF_AMULETTE_STANDARD	= 150;		//масштаб стандартного амулета
const int INVCAM_ENTF_MISC_STANDARD		= 200;		//стандартный масштаб 1
const int INVCAM_ENTF_MISC2_STANDARD	= 250;		//стандартный масштаб 2
const int INVCAM_ENTF_MISC3_STANDARD	= 500;		//стандартный масштаб 3
const int INVCAM_ENTF_MISC4_STANDARD	= 650;		//стандартный масштаб 4
const int INVCAM_ENTF_MISC5_STANDARD	= 850;		//стандартный масштаб 5
const int INVCAM_X_RING_STANDARD		= 25;		//кольцо - поворот камеры по оси X		
const int INVCAM_Z_RING_STANDARD		= 45;        //кольцо - поворот камеры по оси Z	

/*
const int INVCAM_ENTF_MISC_STANDARD 	= 150;
const int INVCAM_X_MISC_STANDARD 		= 0;
const int INVCAM_Y_MISC_STANDARD 		= 0;
const int INVCAM_Z_MISC_STANDARD 		= 0;
*/



