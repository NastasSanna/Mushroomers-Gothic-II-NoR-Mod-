/**************************************************************************

                              КОНСТАНТЫ ИИ
							   
  В этом файле прописаны глобальне константы и переменные, ипользующиеся ИИ.

***************************************************************************/


// ИНДЕКСЫ И ПЕРЕМЕННЫЕ ДЛЯ C_NPC.aivar[100] -------------------------------
/* Сотня разных параметров персонажей, используемых ИИ для построения
линии поведения. 
  Большинство - отдельно для людей и монстров, но некоторые для всех */

//ЛЮДИ

// Последнее сражение персонажа с ГГ
const int AIV_LastFightAgainstPlayer		= 0;
	const int FIGHT_NONE 			= 0;		//сражения не было
	const int FIGHT_LOST			= 1;		//персонаж проиграл
	const int FIGHT_WON				= 2;		//персонаж выиграл
	const int FIGHT_CANCEL			= 3;		//сражение было прервано
// Видел ли персонаж, как ГГ совершил преступление
/*  использовать B_GetPlayerCrime */
const int AIV_NpcSawPlayerCommit			= 1;
//NS: преступления должны быть отсортированы по возрастанию тяжести
	const int CRIME_NONE			= 0;		//не видел
	const int CRIME_SHEEPKILLER		= 1;		//убита овца
	const int CRIME_ATTACK			= 2;		//нападение на человека
	const int CRIME_THEFT			= 3;		//воровство
	const int CRIME_MURDER			= 4;		//убийство
	const int CRIME_COUNT		= 5;		// количество типов преступлений
// Когда было совершено преступление
const int AIV_NpcSawPlayerCommitDay			= 2;	//=номер дня

// Персонаж первым начал разговор
const int AIV_NpcStartedTalk				= 3;	//=TRUE/FALSE
// Персонаж недоступен (спит, разговаривает, готовит зелье и т.п.)
const int AIV_INVINCIBLE					= 4;	//=TRUE/FALSE
// Персонаж уже разговаривал с ГГ
const int AIV_TalkedToPlayer				= 5;	// время с начала игры //=TRUE/FALSE
// ГГ уже обчистил карманы персонажа
const int AIV_PlayerHasPickedMyPocket		= 6;	//=TRUE/FALSE
	const int PICKPOCKET_Once		= 1 << 15;		// особый предмет уже был украден

// Последний атакованный персонаж
const int AIV_LASTTARGET					= 7;	//=ID персонажа
// Преследование завершено
const int AIV_PursuitEnd					= 8;	//=TRUE/FALSE
// Причина нападения персонажа (по возрастанию приоритета)
const int AIV_ATTACKREASON					= 9;
	const int AR_NONE					= 0;	//нет причины
	const int AR_LeftPortalRoom			= 1;	//вышел из помещения, где ему нельзя было находиться
	const int AR_ClearRoom				= 2;	//выгонял незваного гостя
	const int AR_GuardCalledToRoom		= 3;	//вызвана охрана для защиты помещения
	const int AR_MonsterVsHuman			= 4;	//нападение монстра на человека
	const int AR_MonsterMurderedHuman	= 5;	//монстр убил человека
	const int AR_SheepKiller			= 6;	//убита овца
	const int AR_Theft					= 7;	//совершена кража
	const int AR_UseMob					= 8;	//использован чужой объект (ГГ влез в чей-то сундук)
	const int AR_GuardCalledToThief		= 9;	//вызвана охрана для поимки вора
	const int AR_ReactToWeapon			= 10;	//персонажу угрожали оружием
	const int AR_ReactToDamage			= 11;	//на персонажа напали
	const int AR_GuardStopsFight		= 12;	//охрана останавливает драку (нарушителя вырубят, но не убьют)
	const int AR_GuardCalledToKill		= 13;	//охрана вызвана, чтобы убить нарушителя
	const int AR_GuildEnemy				= 14;	//враждебная гильдия
	const int AR_HumanMurderedHuman		= 15;	//человек убил человека
	const int AR_MonsterCloseToGate		= 16;	//приближение монстра ко входу
	const int AR_GuardStopsIntruder		= 17;	//охрана останавливает вторжение
	const int AR_SuddenEnemyInferno		= 18;	//немедленная атака, приступ ярости (обычно после диалога с ГГ)
	const int AR_KILL					= 19;	//чтобы убить
	
// Тело пероснажа уже обыскано
const int AIV_RANSACKED						= 10;	//=TRUE/FALSE
// Был ли выдан посмертный инвентарь
const int AIV_DeathInvGiven					= 11;	//=TRUE/FALSE
// Когда в последний раз был обновлен инвентарь (для случаев, когда он заполняется случайно)
const int AIV_InvUpdated					= 12;	//дней/часов/минут от начала игры

// Опыт за убитых персонажем врагов достается ГГ (для людей и монстров (призванных))
const int AIV_PARTYMEMBER					= 13;	//=TRUE/FALSE
// Опыт за победу над персонажем начислен (если вырубить персонажа повторно, опыт больше не начисляется)
const int AIV_VictoryXPGiven				= 14;	//=TRUE/FALSE

//Счетчик числа обновлений инвентаря торговцев (в начале каждой главы)
/* если счетчик меньше номера главы, то инвентарь обновляется и счетчик увеличивается */
const int AIV_ChapterInv					= 15;

// Предупреждения охраны
const int AIV_Guardpassage_Status			= 16;
	const int GP_PASSGATE			= -1;	//проход разрешен
	const int GP_NONE				= 0;	//не было
	const int GP_FirstWarnGiven		= 1;	//первое предупреждение
	const int GP_SecondWarnGiven	= 2;	//второе предупреждение
// Расстояние от нарушителя до поста охраны (прописывается у нарушителя, по факту - только у ГГ)
const int AIV_LastDistToWP					= 17;	//в см

// Пол персонажа
const int AIV_Gender						= 18;
	const int MALE					= 0;	//муж.
	const int FEMALE				= 1;	//жен.
	
// Что ест персонаж
const int AIV_Food							= 19;
	const int FOOD_Apple			= 0;	//яблоко
	const int FOOD_Cheese			= 1;	//сыр
	const int FOOD_Bacon			= 2;	//мясо
	const int FOOD_Bread			= 3;	//хлеб

// Позиция персонажа по распорядку дня
const int AIV_TAPOSITION					= 20;
	const int ISINPOS				= 0;	//позиция занята
	const int NOTINPOS				= 1;	//позиция не занята
	const int NOTINPOS_WALK			= 2;	//идет на позицию

// Персонаж видел, как ГГ вышел из его комнаты
const int AIV_SeenLeftRoom					= 21;	//=TRUE/FALSE

// Глобальные переменные (=TRUE/FALSE) - были ли прокомментированы действия ГГ, когда он 
var int Player_SneakerComment;				//крался
var int Player_LeftRoomComment;				//зашел в чужой дом
var int Player_DrawWeaponComment;			//достал оружие
var int Player_GetOutOfMyBedComment;		//лег в чужую кровать

// Кто атаковал персонажа
const int AIV_HitByOtherNpc					= 22;	//=ID атаковавшего
// Задержка перед атакой (есть или нет)
const int AIV_WaitBeforeAttack				= 23;	//=TRUE/FALSE
// Репутация ГГ в начале атаки в лагере персонажа
const int AIV_LastAbsolutionLevel			= 24;

//МОНСТРЫ

// Флаги, определяющие поведение монстра или человека
const int AIV_MM_Behaviour					= 25;
const int AIV_Behaviour						= 25;
	const int BEHAV_ThreatenBeforeAttack = 1;		// угрожать перед атакой
	const int BEHAV_FollowInWater		= 1 << 1;	// преследовать в воде (и для людей)
	const int BEHAV_Packhunter			= 1 << 2;	// охотятся ли монстры стаей
	const int BEHAV_AttackPriority		= 1 << 3;	// приоритет атаки (над питанием, монстр не будет отвлекаться на падаль) 
	const int BEHAV_NoDamageReaction	= 1 << 4;	// не реагировать на повреждения
	const int BEHAV_NeverRansack		= 1 << 5;	// запрет на обыск трупов
	const int BEHAV_MM_Talk				= 1 << 6;	// "говорящие" животные с диалогами
	const int BEHAV_Hidden				= 1 << 7;	// спрятался - враги его не видят, а он не высовывается (только случано наткнувшись)
	const int BEHAV_Invisible			= 1 << 8;	// невидимый (только ГГ его видит)
	const int BEHAV_Summoned			= 1 << 15;	// призванный

// Длительность преследования в сек (и для людей)
const int AIV_MM_FollowTime					= 26;
	const int FOLLOWTIME_SHORT		= 5;		//короткое
	const int FOLLOWTIME_MEDIUM		= 10;		//среднее
	const int FOLLOWTIME_LONG		= 20;		//долгое


// Время начала и завершения состояний монстров в их расписании, час
const int AIV_MM_SleepStart			= 27;	//спит
const int AIV_MM_SleepEnd			= 28;		
const int AIV_MM_RestStart			= 29;	//отдыхает
const int AIV_MM_RestEnd			= 30;
const int AIV_MM_RoamStart			= 31;	//бродит
const int AIV_MM_RoamEnd			= 32;
const int AIV_MM_EatGroundStart		= 33;	//ест
const int AIV_MM_EatGroundEnd		= 34;
const int AIV_MM_WuselStart			= 35;	//проявляет активность
const int AIV_MM_WuselEnd			= 36;
const int AIV_MM_OrcSitStart		= 37;	//орк сидит
const int AIV_MM_OrcSitEnd			= 38;
	
	const int OnlyRoutine	= -1;  // весь день одно и то же
// следующий AIV = AIV_MM_SleepStart + 12

// Идентификатор типа монстра (реальный тип монстра)
/*  перечень не совпадает со списком гильдий монстров */
const int AIV_MM_REAL_ID					= 39;
	const int ID_MEATBUG				= 1;	//мясной жук
	const int ID_SHEEP					= 2;	//овца
	const int ID_GOBBO_GREEN			= 3;	//зеленый гоблин
	const int ID_GOBBO_BLACK			= 4;	//черный гоблин
	const int ID_GOBBO_SKELETON			= 5;	//скелет гоблина
	const int ID_SUMMONED_GOBBO_SKELETON = 6;	//призванный скелет гоблина
	const int ID_SCAVENGER				= 7;	//падальщик
	const int ID_SCAVENGER_DEMON		= 8;	//луговой падальщик (падальщик-демон)
	const int ID_Giant_Rat				= 8;	//гигантская крыса
	const int ID_GIANT_BUG				= 9;	//полевой хищник (полевой жук)
	const int ID_BLOODFLY				= 10;	//шершень (кровавая муха)
	const int ID_WARAN					= 11;	//варан (ящер)
	const int ID_FIREWARAN				= 12;	//огненный варан (ящер)
	const int ID_WOLF					= 13;	//волк
	const int ID_WARG					= 14;	//варг
	const int ID_SUMMONED_WOLF			= 15;	//призванный волк
	const int ID_MINECRAWLER			= 16;	//ползун (краулер)
	const int ID_MINECRAWLERWARRIOR		= 17;	//воин-ползун
	const int ID_LURKER					= 18;	//шныг (лукер)
	const int ID_SKELETON				= 19;	//скелет
	const int ID_SUMMONED_SKELETON		= 20;	//призванный скелет
	const int ID_SKELETON_MAGE			= 21;	//скелет-маг
	const int ID_ZOMBIE					= 22;	//зомби
	const int ID_SNAPPER				= 23;	//снеппер (глорх)
	const int ID_DRAGONSNAPPER			= 24;	//драконий снеппер
	const int ID_SHADOWBEAST			= 25;	//мракорис
	const int ID_SHADOWBEAST_SKELETON	= 26;	//скелет мракориса
	const int ID_HARPY					= 27;	//гарпия
	const int ID_STONEGOLEM				= 28;	//каменный голем
	const int ID_FIREGOLEM				= 29;	//огненный голем
	const int ID_ICEGOLEM				= 30;	//ледяной голем
	const int ID_SUMMONED_GOLEM			= 31;	//призванный голем
	const int ID_DEMON					= 32;	//демон
	const int ID_SUMMONED_DEMON			= 33;	//призванный демон
	const int ID_DEMON_LORD				= 34;	//демон-лорд
	const int ID_TROLL					= 35;	//тролль
	const int ID_TROLL_BLACK			= 36;	//черный тролль
	const int ID_SWAMPSHARK				= 37;	//болотная акула (болотожор)
	const int ID_DRAGON_FIRE			= 38;	//огненный дракон
	const int ID_DRAGON_ICE				= 39;	//ледяной дракон
	const int ID_DRAGON_ROCK			= 40;	//каменный дракон
	const int ID_DRAGON_SWAMP			= 41;	//болотный дракон
	const int ID_DRAGON_UNDEAD			= 42;	//дракон-нежить
	const int ID_MOLERAT				= 43;	//кротокрыс
	const int ID_ORCWARRIOR				= 44;	//орк-воин
	const int ID_ORCSHAMAN				= 45;	//орк-шаман
	const int ID_ORCELITE				= 46;	//элитный орк
	const int ID_UNDEADORCWARRIOR		= 47;	//орк-нежить
	const int ID_DRACONIAN				= 48;	//ящер
	const int ID_WISP					= 49;	//огонек
	const int ID_Alligator				= 50;	//аллигатор
	const int ID_Swampgolem				= 51;	//болотный голем
	const int ID_Stoneguardian			= 52;	//каменный страж
	const int ID_Gargoyle				= 53;	//гаргулья
	const int ID_Bloodhound				= 54;	//кровавая гончая (пес-кровосос)
	const int ID_Icewolf				= 55;	//ледяной волк
	const int ID_OrcBiter				= 56;	//чомпер (кусач)
	const int ID_Razor					= 57;	//бритвозуб
	const int ID_Swarm					= 58;	//рой саранчи
	const int ID_Swamprat				= 59;	//болотная крыса
	const int ID_BLATTCRAWLER			= 60;	//богомол
	const int ID_SummonedGuardian		= 61;	//призванный страж
	const int ID_SummonedZombie			= 62;	//призванный зомби
	const int ID_Keiler					= 63;	//кабан
	const int ID_SWAMPDRONE				= 64;	//дрон (болотная вонючка)
// Последний съеденный монстр (труп)
const int AIV_LASTBODY						= 40;	//=ID монстра


//Герой
// Состояние сражения на арене
const int AIV_ArenaFight					= 41;
	const int AF_NONE				= 0;		//не было
	const int AF_RUNNING			= 1;		//сражение идет сейчас
	const int AF_AFTER				= 2;		//сражение закончано
	const int AF_AFTER_PLUS_DAMAGE	= 3;		//сражение закончилось, но ГГ продолжил атаковать
	const int AF_WRONG_WEAPON		= 4;		//ГГ использовал запрещенное оружие
	
// Репутация ГГ в момент совершения последнего преступления (запоминается персонажем, видевшим ГГ)	
const int AIV_CrimeAbsolutionLevel			= 42;
// Причина последнего нападения на ГГ
const int AIV_LastPlayerAR					= 43;	//=AR_x, см. выше
	
// Смертельный исход сражения (персонаж или его противник умирает, а не падает без сознания)
const int AIV_DropDeadAndKill				= 44;	//=TRUE/FALSE
	
// Счетчик заклинаний
/* сбрасывается в 0 в начале сражения, увеличивается на 1 при произнесении любого заклинания */
const int AIV_SelectSpell					= 45;

// Персонаж игнорирует
const int AIV_IgnoreFlags					= 46;	
	const int IGNORE_Murder				= 1;		//убийство
	const int IGNORE_Theft				= 1 << 1;	//воровство
	const int IGNORE_Sheepkiller		= 1 << 2;	//убийство овцы
	const int IGNORE_FakeGuild			= 1 << 3;	//ложную гильдию
	const int IGNORE_Armor				= 1 << 4;	//во что одет ГГ
	const int IGNORE_PortalRoom			= 1 << 5;	//ГГ может чувствовать себя у меня как дома
	const int IGNORE_PortalRoom_Public	= 1 << 6;	//персонаж владеет публичным помещением
	const int IGNORE_Drunk				= 1 << 7;	//то, что ГГ пьян
	const int IGNORE_DrawWeapon			= 1 << 8;	//то, что ГГ достал оружие
	const int IGNORE_Enemy				= 1 << 9;	//врагов
	const int IGNORE_FightSound			= 1 << 10;	//драку
	const int IGNORE_All			= -1;	//все

// Флаги, определяющие характер персонажа
const int AIV_Temper						= 47;
	const int TEMPER_ToughGuy			= 1;		// крутой парень, исп. через C_NpsIsToughGuy
	const int TEMPER_ToughGuyNewsOverride	= 1 << 1;	// запрет на комментарий "крутого парня"
	const int TEMPER_NewsOverride		= 1 << 2;	// НЕ будет распространять новости
	const int TEMPER_NoFightParker		= 1 << 3;	// пацифист (или безобидный монстр). Его никто не воспринимает как врага 
	const int TEMPER_MagicUser			= 1 << 4;	// предпочитает магию, а не оружие 
	const int TEMPER_BodyGuard			= 1 << 5;	// телохранитель другого NPC

// Персонажу запрещено нападать на врагов, на такого человека(!) тоже никто не нападает
const int AIV_EnemyOverride					= 48;

// Флаги принадлежности к определенным сюжетным группам
const int AIV_StoryFlags					= 49;
	const int STORY_Sheep				= 1;		// квестовые овцы
	const int STORY_OutOfCamp			= 2;		// не в своем лагере

// Исходная тактика боя персонажа (монстра) (на случай ее смены в fight_tactic)
const int AIV_OriginalFightTactic			= 50;	//=FAI_x, см. ниже

// Дистанция от "места обитания", дальше которой персонаж (монстр) не уходит
/*  если расстояние будет больше, то персонаж переключится на стиль боя FAI_NAILED */
/*  всегда задавать с AIV_OriginalFightTactic */
const int AIV_MaxDistToWp					= 51;	//в см, если	<=0, то не учитывается

// Дистанция между персонажем и его противником, на которой он перестает атаковать
const int AIV_FightDistCancel				= 52;	//в см

// Прокомментировал ли персонаж последнее сражение
const int AIV_LastFightComment				= 53;	//=TRUE/FALSE

// Была ли загрузка игры (если была, то other не определен)
const int AIV_LOADGAME						= 54;	//=TRUE/FALSE

// ГГ победил персонажа, но не убил его
const int AIV_DefeatedByPlayer				= 55;	//=TRUE/FALSE
// ГГ убил персонажа
const int AIV_KilledByPlayer				= 56;	//=TRUE/FALSE

// Дистанция, на которой персонаж следует за другим
const int AIV_FollowDist					= 57;	//в см

// Дистанция между персонажем и противником (записывается с помощью Npc_GetDistToNpc)
const int AIV_Dist							= 58;	//в см	

// Сколько времени персонаж пребывает в текущем состоянии (запоминается в скриптах через NPC_GetStateTime)
const int AIV_StateTime						= 59;	//в сек.

// Время, прошедшее с момента призыва монстра
const int AIV_SummonedTime					= 60;	//в сек.

// Продолжительность действия на персонажа, сек.
//NS: все эти заклинания не могут действовать одновременно, хватит и одной AIV
const int AIV_FreezeStateTime				= 61;	//заморозки
const int AIV_WhirlwindStateTime			= 61;	//смерча
const int AIV_InflateStateTime				= 61;	//вздутия
const int AIV_SwarmStateTime				= 61;	//роя
const int AIV_SuckEnergyStateTime			= 61;	//кражи энергии (высасывания энергии)

// Уровень инвестирования маны в заклинание
const int AIV_SpellLevel					= 62;

// Степень сморщивания при применении соответствующего заклинания
const int AIV_MM_ShrinkState				= 63;	//от 0 до 14, см. ZS_MagicShrink.d

// Триалог
const int AIV_TALK_TRIA						= 64;	// с кем разговаривает NPC, 0 - с ГГ

//Когда персонаж умер
const int AIV_DeathTime 					= 68;	//=дней/часов/минут от начала игры (вырезано)

//Насколько трудно обворовать персонажа
const int AIV_TheftDex						= 69;	//=DEX

// Истинные характеристики персонажа (без учета надетых колец, амулета, пояса)
const int REAL_STRENGTH						= 80;	//сила
const int REAL_DEXTERITY					= 81;	//ловкость
const int REAL_MANA_MAX						= 82;	//макс. мана
const int REAL_HITPOINTS_MAX				= 83;	//макс. здоровье
const int REAL_TALENT_1H					= 84;	//владение одноручным оружием
const int REAL_TALENT_2H					= 85;	//владение двуручным оружием
const int REAL_TALENT_BOW					= 86;	//владение луком
const int REAL_TALENT_CROSSBOW				= 87;	//владение арбалетом

const int AIV_HurtSelf						= 88;	//насколько повредить себе через ZS_HurtSelf

//индекс текущего имени в массиве name
const int AIV_NameIndex						= 90;	//=1-5

// грибы
const int AIV_Timelapse_EndTime				= 91;	// провал в памяти из-за туманника


// ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ --------------------------------------------------------------------

//Репутация ГГ по лагерям
var int ABSOLUTIONLEVEL_OldCamp;			//в старом лагере
var int ABSOLUTIONLEVEL_City;				//в городе
var int ABSOLUTIONLEVEL_Monastery;			//в монастыре
var int ABSOLUTIONLEVEL_Farm;				//на ферме
var int absolutionlevel_bl;					//в лагере бандитов

//Счетчики доносов на ГГ
var int PETZCOUNTER_OldCamp[CRIME_COUNT];	// в старом лагере
var int PETZCOUNTER_City[CRIME_COUNT];		// в городе
var int PETZCOUNTER_Monastery[CRIME_COUNT];	// в монастыре
var int PETZCOUNTER_Farm[CRIME_COUNT];		// на ферме
var int PETZCOUNTER_BL[CRIME_COUNT];		// в лагере бандитов

// ГЛОБАЛЬНЫЕ КОНСТАНТЫ --------------------------------------------------------------------

//Индесы лагерей
/*  используется при изменении репутации ГГ */
const int LOC_NONE					= 0;	//за пределами лагерей
const int LOC_OLDCAMP				= 1;	//старый лагерь
const int LOC_CITY					= 2;	//город
const int LOC_MONASTERY				= 3;	//монастырь
const int LOC_FARM					= 4;	//ферма
const int LOC_BL					= 5;	//лагерь бандитов
const int LOC_ALL					= 6;	//все лагеря

//Индексы кварталов Хориниса
const int Q_KASERNE					= 1;	//казарма
const int Q_GALGEN					= 2;	//висельная площадь
const int Q_MARKT					= 3;	//рынок
const int Q_TEMPEL					= 4;	//часовня
const int Q_UNTERSTADT				= 5;	//нижний город
const int Q_HAFEN					= 6;	//гавань
const int Q_OBERSTADT				= 7;	//верхний город

//Дистанции и время для монстров
// Дальность восприятия
const int PERC_DIST_SUMMONED_ACTIVE_MAX		= 2000;		//призванных (нет прим.)
const int PERC_DIST_MONSTER_ACTIVE_MAX		= 1500;		//обычных
const int PERC_DIST_ORC_ACTIVE_MAX			= 2500;		//орков
const int PERC_DIST_DRAGON_ACTIVE_MAX		= 3500;		//драконов
// На каком расстоянии
const int FIGHT_DIST_MONSTER_ATTACKRANGE	= 700;		//монстр атакует
const int FIGHT_DIST_MONSTER_FLEE			= 300;		//монстр убегает
const int FIGHT_DIST_DRAGON_MAGIC			= 700;		//дракон применяет магию
// Длительность
const int MONSTER_THREATEN_TIME				= 4;		//угрозы перед нападением
const int MONSTER_SUMMON_TIME				= 60;		//призыва

//Дистанции для людей
// Макс. расстояние до WP, на котором персонаж начинает выполнять действие распорядка дня 
// если расстояние больше, надо идти на позицию
const int TA_DIST_SELFWP_MAX				= 300;	//500;
// вопсприятие
const int PERC_DIST_ACTIVE_MAX				= 2000;		//максимальная и для активных восприятий
const int PERC_DIST_INTERMEDIAT				= 1000;		//средняя
const int PERC_DIST_DIALOG					= 500;		//в разговоре
const int PERC_DIST_HEIGHT					= 1000;		//по вертикали
const int PERC_DIST_INDOOR_HEIGHT			= 250;		//по вертикали в помещении
// сражение
const int FIGHT_DIST_MELEE					= 600;		//ближнего боя
const int FIGHT_DIST_RANGED_INNER			= 700;		//смена дальнего боя на ближний бой
const int FIGHT_DIST_RANGED_OUTER			= 900;		//смена ближнего боя на дальний бой
const int FIGHT_DIST_CANCEL					= 3500;		//прекращение преследования
// наблюдение за дракой
const int WATCHFIGHT_DIST_MIN				= 300;		//мин.
const int WATCHFIGHT_DIST_MAX				= 2000;		//макс.
// обращение к ГГ
const int ZivilAnquatschDist				= 400;
// (не исп.)
const float RANGED_CHANCE_MINDIST			= 1500;		//мин.
const float RANGED_CHANCE_MAXDIST			= 4500;		//макс.

//Время для людей
const int NPC_ANGRY_TIME					= 120;		//разьяренность (не исп.)
const int HAI_TIME_UNCONSCIOUS				= 20;		//без сознания
const int NPC_TIME_FOLLOW					= 10;		//время преследования по умолчанию (для всех персонажей)

//Минимальные повреждения (не исп.)
const int NPC_MINIMAL_DAMAGE				= 5;		//в ед.
const int NPC_MINIMAL_PERCENT				= 10;		//в %

//Тактика сражения (см. в проекте FIGHT), указ. в C_Npc.fight_tactic
// люди
const int FAI_HUMAN_COWARD					= 2;		//трус
const int FAI_HUMAN_NORMAL					= 42;		//нормальный
const int FAI_HUMAN_STRONG					= 3;		//сильный
const int FAI_HUMAN_MASTER					= 4;		//мастер
//
const int FAI_MONSTER_COWARD				= 10;		//моснтр-трус (молодой)
const int FAI_NAILED						= 1;		//на посту ("прибит гвоздями" к месту)
// монстры
const int FAI_GOBBO							= 7;		//гоблин
const int FAI_SCAVENGER						= 15;		//падальщик
const int FAI_GIANT_RAT						= 11;		//гигантская крыса
const int FAI_GIANT_BUG						= 31;		//полевой хищник (гигантский жук)
const int FAI_BLOODFLY						= 24;		//шершень (кровавая муха)
const int FAI_WARAN							= 21;		//варан (ящер)
const int FAI_WOLF							= 22;		//волк
const int FAI_MINECRAWLER					= 5;		//ползун (краулер)
const int FAI_LURKER						= 9;		//шныг (лукер)
const int FAI_ZOMBIE						= 23;		//зомби
const int FAI_SNAPPER						= 18;		//снеппер (глорх)
const int FAI_SHADOWBEAST					= 16;		//мракорис
const int FAI_HARPY							= 36;		//гарпия
const int FAI_STONEGOLEM					= 8;		//каменный голем
const int FAI_DEMON							= 6;		//демон
const int FAI_TROLL							= 20;		//тролль
const int FAI_SWAMPSHARK					= 19;		//болотная акула (болотожор)
const int FAI_DRAGON						= 39;		//дракон
const int FAI_MOLERAT						= 40;		//кротокрыс
const int FAI_ORC							= 12;		//орк
const int FAI_DRACONIAN						= 41;		//человек-ящер (не исп.)
const int FAI_Alligator						= 43;		//аллигатор
const int FAI_Gargoyle						= 44;		//гаргулья
const int FAI_Bear							= 45;		//медведь (не исп.)
const int FAI_Stoneguardian					= 46;		//каменный сраж

//Логические константы (внутр.)
const int TRUE								= 1;		//истина
const int FALSE								= 0;		//ложь

//Константы циклов
const int LOOP_CONTINUE						= 0;		//продолжение цикла
const int LOOP_END							= 1;		//завершение цикла

//Значение по умолчанию
const int DEFAULT							= 0;

//ГГ получает
const int LP_PER_LEVEL						= 10;		//очков обучения за новый уровень
const int HP_PER_LEVEL						= 5;//12;	//здоровья за новый уровень
const int XP_PER_VICTORY					= 10;		//опыта за уровень противника

//Индексы типов персонажей
const int NPCTYPE_AMBIENT					= 0;		//массовка (безымянные окружающие)
const int npctype_main						= 1;		//обычный (именованные персонажи)
const int NPCTYPE_FRIEND					= 2;		//друг ГГ
const int NPCTYPE_OCAMBIENT					= 3;		//массовка в Долине Рудников
const int NPCTYPE_OCMAIN					= 4;		//обычный в Долине Рудников
const int NPCTYPE_BL_AMBIENT				= 5;		//массовка в лагере бандитов
const int NPCTYPE_TAL_AMBIENT				= 6;		//массовка в Яркендаре
const int NPCTYPE_BL_MAIN					= 7;		//обычный в лагере бандитов
const int NPCTYPE_HERO						= 8;		//потенциальные персонажи
const int NPCTYPE_Competitor				= 9;		//конкурент ГГ (неизбранные)

//Индексы действий над объектами
const int MOBSI_NONE						= 0;		//нет
const int MOBSI_SmithWeapon					= 1;		//ковать оружие
const int MOBSI_SleepAbit					= 2;		//спать
const int MOBSI_MakeRune					= 3;		//создать руну
const int MOBSI_PotionAlchemy				= 4;		//сварить зелье
const int MOBSI_PrayShrine					= 5;		//молиться
const int MOBSI_GOLDHACKEN					= 6;		//добывать золото
const int MOBSI_PRAYIDOL					= 7;		//поклоняться идолу
const int MOBSI_SmithSharp					= 8;		//затачивать оружие
const int MOBSI_WSWell						= 9;		//у колодца
const int MOBSI_WSSpring					= 10;		//у источника
const int MOBSI_FireCamp					= 11;		//у костра
const int MOBSI_Stove						= 12;		//у плиты
const int MOBSI_SitABit						= 13;		//сидим на лавочке, стуле, кресле
const int MOBSI_CauldronHunter				= 14;		//котел охотников (не для супа)
const int MOBSI_IvySleepStart				= 15;		//переход в сонное состояние
const int MOBSI_GameOver_Won					= 998;		//конец игры
const int MOBSI_GameOver_Lost					= 999;		//конец игры

//Переменная текущего действия ГГ
var int player_mobsi_production;

//Индексы предметов для ремонта
const int REIT_NONE						= 0;		//нет
const int REIT_Armor_Clothes			= 1;		//одежда
const int REIT_Armor_DJG_Crawler		= 2;		//доспех из ползуна

//Переменная текущего действия ГГ
var int Item2Repair;

// ТЕКСТУРЫ ------------------------------------------------------------------------------
/* индекс текстуры должен совпадать с номером файла в соответствующей папке 
   указывать как параметр B_SetNpcVisual */

//Тело
/* см. в data\Textures\NPCs\Body */
const int BodyTex_P						= 0;		//белокожий
const int BodyTex_N						= 1;		//нормальный
const int BodyTex_L						= 2;		//латиноамериканец
const int BodyTex_B						= 3;		//чернокожий
const int BodyTexBabe_P					= 4;		//белокожая женщина
const int BodyTexBabe_N					= 5;		//нормальная женщина
const int BodyTexBabe_L					= 6;		//латиноамериканка
const int BodyTexBabe_B					= 7;		//чернокожая женщина
const int BodyTex_Player				= 8;		//ГГ
//										= 9;  		//мужчина в исподней кожаной одежде
const int BodyTex_T						= 10;		//татуированный
const int BodyTexBabe_F					= 11;		//женщина в исподней одежде с мехом и металлом
const int BodyTexBabe_S					= 12;		//женщина в чулках и нарукавниках

const int NO_ARMOR					= -1; 		//отсутствие брони

//Лица
/* Названия многих констант остались из Г1.
  см. в data\Textures\NPCs\Head */
const int Face_N_Gomez					= 0;		//Гомез	=> Маттео
const int Face_N_Scar					= 1;		//Шрам (Скар)	=> Сильвио, Мое
const int Face_N_Raven					= 2;		//Ворон (Равен), Дарон, Гаронд
const int Face_N_Bullit					= 3;		//Буллит	=> Талбин
const int Face_B_Thorus					= 4;		//Торус, Халед, Гестат
const int Face_N_Corristo				= 5;		//Корристо, Эрол, Инац
const int Face_N_Milten					= 6;		//Мильтен
const int Face_N_Bloodwyn				= 7;		//Бладвин, Альрик
const int Face_L_Scatty					= 8;		//Скатти
const int Face_N_YBerion				= 9;		//ЮБерион (не исп.)
const int Face_N_CoolPock				= 10;		//Беннет/Ретон/Ибрагим
const int Face_B_CorAngar				= 11;		//Кор Ангар, Аллигатор Джек
const int Face_B_Saturas				= 12;		//Сатурас, Самюэль, Ватрас
const int Face_N_Xardas					= 13;		//Ксардас
const int Face_N_Lares					= 14;		//Ларс (Ларес)
const int Face_L_Ratford				= 15;		//Ретфорд	=> бандиты, пираты
const int Face_N_Drax					= 16;		//Доракс	=> Бастер, Поль
const int Face_B_Gorn					= 17;		//Горн
const int Face_N_Player					= 18;		//ГГ
const int Face_P_Lester					= 19;		//Лестер
const int Face_N_Lee					= 20;		//Ли
const int Face_N_Torlof					= 21;		//Торлоф, Ярвис
const int Face_N_Mud					= 22;		//Мад	=> бандиты
const int Face_N_Ricelord				= 23;		//Рик
const int Face_N_Horatio				= 24;		//Горацио	=> ополченец
const int Face_N_Richter				= 25;		//судья, Ян
const int Face_N_Cipher_neu				= 26;		//Сифер	=> Логан, Френсис
const int Face_N_Homer					= 27;		//Гомер	=> Вильям
const int Face_B_Cavalorn				= 28;		//Кавалорн, Фиск
const int Face_L_Ian					= 29;		//Ян	=> Рауль, Борка, Карлос
const int Face_L_Diego					= 30;		//Диего
const int Face_N_MadPsi					= 31;		//ищущие (дементоры, бывшие сектанты)
const int Face_N_Bartholo				= 32;		//Бартоло	=> Моргахард
const int Face_N_Snaf					= 33;		//Снаф, Добар
const int Face_N_Mordrag				= 34;		//Мордраг	=> Санчо, Регис
const int Face_N_Lefty					= 35;		//Лефти	=> Гарвелл, Хэнк
const int Face_N_Wolf					= 36;		//Вульф (Волк)
const int Face_N_Fingers				= 37;		//Фингерс	=> Фаджет, Бромор
const int Face_N_Whistler				= 38;		//Уистлер	=> Джерган, Лемар
const int Face_P_Gilbert				= 39;		//Гилберт	=> Гром, Фед
const int Face_L_Jackal					= 40;		//Шакал	=> Энгор
const int Face_P_ToughBald				= 41;		//Брутус, Джо
const int Face_P_Tough_Drago			= 42;		//Драго	=> Парсиваль
const int Face_P_Tough_Torrez			= 43;		//Торез	=> Дуриан
const int Face_P_Tough_Rodriguez		= 44;		//Родригез	=> Альберхт, Маркос, Тандор
const int Face_P_ToughBald_Nek			= 45;		//Нек	=> главарь разбойников
const int Face_P_NormalBald				= 46;		//Драал, Мельдор
const int Face_P_Normal01				= 47;		//Мортис
const int Face_P_Normal02				= 48;		//Лютеро
const int Face_P_Normal_Fletcher		= 49;		//Флетчер	=> паладин, рыцарь
const int Face_P_Normal03				= 50;		//Эним, Эгилл
const int Face_P_NormalBart01			= 51;		//Барт	=> Бальтазар, Эмилио
const int Face_P_NormalBart_Cronos		= 52;		//Кронос, Миксир
const int Face_P_NormalBart_Nefarius	= 53;		//Нефариус, Мердарион, Лотар
const int Face_P_NormalBart_Riordian	= 54;		//Риордан, Алвин
const int Face_P_OldMan_Gravo			= 55;		//Граво	=> Секоб, Мигель, Том, Мардук, Мартин
const int Face_P_Weak_Cutter			= 56;		//Каттер	=> Тилл
const int Face_P_Weak_Ulf_Wohlers		= 57;		//Корнелиус, Билгот
const int Face_N_Important_Arto			= 58;		//Арто	=> Румбольд, Барток
const int Face_N_ImportantGrey			= 59;		//Курган, Серпентес, Зурис, Гримс
const int Face_N_ImportantOld			= 60;		//Пирокар, Джек
const int Face_N_Tough_Lee_дhnlich		= 61;		//Драгомир, Орик
const int Face_N_Tough_Skip				= 62;		//Рангар, Йорген
const int Face_N_ToughBart01			= 63;		//Род, Ингмар, Ренгару
const int Face_N_Tough_Okyl				= 64;		//Исгарот, Хаген, Брэндон, Сентеза, Рамирес
const int Face_N_Normal01				= 65;		//Агон
const int Face_N_Normal_Cord			= 66;		//Корд
const int Face_N_Normal_Olli_Kahn		= 67;		//Бенгар, Булко
const int Face_N_Normal02				= 68;		//Гаан, Кйорн, Джора (Йора, Жора)
const int Face_N_Normal_Spassvogel		= 69;		//Дар
const int Face_N_Normal03				= 70;		//Сенграт, Валентино
const int Face_N_Normal04				= 71;		//Торбен
const int Face_N_Normal05				= 72;		//разные
const int Face_N_Normal_Stone			= 73;		//Стоун (не исп.)
const int Face_N_Normal06				= 74;		//разные
const int Face_N_Normal_Erpresser		= 75;		//Сержио, Эндарго
const int Face_N_Normal07				= 76;		//Бабо, Джеспер
const int Face_N_Normal_Blade			= 77;		//Герольд, Корагон
const int Face_N_Normal08				= 78;		//разные
const int Face_N_Normal14				= 79;		//Годар, Матт
const int Face_N_Normal_Sly				= 80;		//Слай	=> Малак, Малколм, герольд 
const int Face_N_Normal16				= 81;		//Бодо, Гараз, Бифф, Оуэн
const int Face_N_Normal17				= 82;		//Нагур
const int Face_N_Normal18				= 83;		//разные
const int Face_N_Normal19				= 84;		//Феллан
const int Face_N_Normal20				= 85;		//Сильвестро, Керолот, Руперт
const int Face_N_NormalBart01			= 86;		//разные
const int Face_N_NormalBart02			= 87;		//Василий, Финн
const int Face_N_NormalBart03			= 88;		//Гуннар, Руга
const int Face_N_NormalBart04			= 89;		//Кардиф
const int Face_N_NormalBart05			= 90;		//Гаретт, Фестер
const int Face_N_NormalBart06			= 91;		//Вульфгар
const int Face_N_NormalBart_Senyan		= 92;		//Лобарт
const int Face_N_NormalBart08			= 93;		//Фарим
const int Face_N_NormalBart09			= 94;		//Хиглас
const int Face_N_NormalBart10			= 95;		//Сифер, Седрик
const int Face_N_NormalBart11			= 96;		//Халвор
const int Face_N_NormalBart12			= 97;		//Никлас
const int Face_N_NormalBart_Dexter		= 98;		//Декстер, Малет
const int Face_N_NormalBart_Graham		= 99;		//Грехем	=> садовник
const int Face_N_NormalBart_Dusty		= 100;		//Дасти	=> Пабло
const int Face_N_NormalBart16			= 101;		//Вамбо
const int Face_N_NormalBart17			= 102;		//разные
const int Face_N_NormalBart_Huno		= 103;		//Хуно, Парлаф
const int Face_N_NormalBart_Grim		= 104;		//Грим	=> Ден
const int Face_N_NormalBart20			= 105;		//Эдгор, Хакон, Харад, Энгром
const int Face_N_NormalBart21			= 106;		//Ангус
const int Face_N_NormalBart22			= 107;		//Олаф
const int Face_N_OldBald_Jeremiah		= 108;		//Джереми (Иеремия)	=> Онар, Горакс, Лендлорд
const int Face_N_Weak_Ulbert			= 109;		//Ульберт	=> разные
const int Face_N_Weak_BaalNetbek		= 110;		//Идол Нетбек	=> отшельник
const int Face_N_Weak_Herek				= 111;		//Херек	=> Вино, Гепперт
const int Face_N_Weak04					= 112;		//разные
const int Face_N_Weak05					= 113;		//Ульф
const int Face_N_Weak_Orry				= 114;		//Орри	=> Кантар
const int Face_N_Weak_Asghan			= 115;		//Асгхан	=> Пардос, Саландрил
const int Face_N_Weak_Markus_Kark		= 116;		//Маркус	=> Пепе, Бальтрам
const int Face_N_Weak_Cipher_alt		= 117;		//Риттер, Лариус
const int Face_N_NormalBart_Swiney		= 118;		//разные
const int Face_N_Weak12					= 119;		//Андре, Керво
const int Face_L_ToughBald01			= 120;		//Рамон, Тенгрон
const int Face_L_Tough01				= 121;		//Скиннер, Франко
const int Face_L_Tough02				= 122;		//Гарвиг
const int Face_L_Tough_Santino			= 123;		//Сантино	=> Гербрандт, Боспер, Аттила
const int Face_L_ToughBart_Quentin		= 124;		//Квентин	=> Эстебан, Мика
const int Face_L_Normal_GorNaBar		= 125;		//Гор На Бар	=> Педро
const int Face_L_NormalBart01			= 126;		//Хуан, Ходжес, Ультар, Карл
const int Face_L_NormalBart02			= 127;		//Рухар, Каррас
const int Face_L_NormalBart_Rufus		= 128;		//Руфус	=> разные
const int Face_B_ToughBald				= 129;		//разные
const int Face_B_Tough_Pacho			= 130;		//Пако	=> Сеньян
const int Face_B_Tough_Silas			= 131;		//Силас	=> Ополос, Альварес
const int Face_B_Normal01				= 132;		//Болтан, Тонак, Телбор, Элврих
const int Face_B_Normal_Kirgo			= 133;		//Кирго	=> Бронко, Гримбальд, Марио, Брайан
const int Face_B_Normal_Sharky			= 134;		//Шарки	=> Орлан,Хокарн, Абуин 
const int Face_B_Normal_Orik			= 135;		//Орик	=> Ферос, Пек
const int Face_B_Normal_Kharim			= 136;		//Харим	=> Рендольф
const int FaceBabe_N_BlackHair			= 137;		//(не исп.)
const int FaceBabe_N_Blondie			= 138;		//Сара
const int FaceBabe_N_BlondTattoo		= 139;		//(не исп.)
const int FaceBabe_N_PinkHair			= 140;		//Сагитта, Сира
const int FaceBabe_L_Charlotte			= 141;		//(не исп.)
const int FaceBabe_B_RedLocks			= 142;		//Эдда, Ваня
const int FaceBabe_N_HairAndCloth		= 143;		//горожанки
const int FaceBabe_N_WhiteCloth			= 144;		//Хильда, Ханна
const int FaceBabe_N_GreyCloth			= 145;		//Елена, Люсия, Феня
const int FaceBabe_N_Brown				= 146;		//Текла
const int FaceBabe_N_VlkBlonde			= 147;		//горожанки
const int FaceBabe_N_BauBlonde			= 148;		//Бабера
const int FaceBabe_N_YoungBlonde		= 149;		//Гритта
const int FaceBabe_N_OldBlonde			= 150;		//Рега
const int FaceBabe_P_MidBlonde			= 151;		//(не исп.)
const int FaceBabe_N_MidBauBlonde		= 152;		//Мария
const int FaceBabe_N_OldBrown			= 153;		//горожанки
const int FaceBabe_N_Lilo				= 154;		//Кати
const int FaceBabe_N_Hure				= 155;		//Рози, Надя
const int FaceBabe_N_Anne				= 156;		//Люси
const int FaceBabe_B_RedLocks2			= 157;		//(не исп.)
const int FaceBabe_L_Charlotte2			= 158;		//Соня
const int Face_N_Fortuno				= 159;		//Фортуно
const int Face_P_Greg					= 160;		//Грег
const int Face_N_Pirat01				= 161;		//Скип
const int Face_N_ZombieMud				= 162;		//тина (илистый зомби, утопленник)


const int Face_N_Till					= 163;
const int Face_N_NastasSanna			= 164;
const int Face_N_BloodwinSnow			= 165;
const int Face_N_DenisSeregin			= 166;
const int Face_N_IdolKadar				= 167;
