
const int T_MEGA = 300;
const int T_MAX = 200;
const int T_HIGH = 120;
const int T_MED = 90;
const int T_LOW = 60;

var int CurrentLevel;

var int HP_Ring_1_Equipped;
var int HP_Ring_2_Equipped;
var int HP_Amulett_Equipped;
var int HP_Artefakt_Effekt;
var int MA_Ring_1_Equipped;
var int MA_Ring_2_Equipped;
var int MA_Amulett_Equipped;
var int MA_Artefakt_Effekt;
var int STR_Ring_1_Equipped;
var int STR_Ring_2_Equipped;
var int STR_Amulett_Equipped;
var int STR_Artefakt_Effekt;
var int LeatherArmor_Equipped;
var int SLDArmor_Equipped;
var int NOVArmor_Equipped;
var int KDFArmor_Equipped;
var int MILArmor_Equipped;
var int MCArmor_Equipped;
var int KDFBelt_Equipped;
var int MILBelt_Equipped;
var int NOVBelt_Equipped;
var int SLDBelt_Equipped;
var int LeatherBelt_Equipped;
var int MCBelt_Equipped;
var int wispskill_level;

var int NpcObsessedByDMT;
var int GhostAttackWarn;
var int SC_FailedToEquipBeliarsWeapon;

var int TheftDexGlob;
var int TheftGoldGlob;
var int Theftdiff;

var int MadKillerCount;

var int Knows_LousHammer;
var int Knows_Schlafhammer;
var int Knows_SchnellerHering;
var int Knows_RuebenSchnaps;
var int Knows_VinoSchnaps;
var int Knows_PiratenSchnaps;
var int Knows_Magierschnaps;
var int Knows_Sumpfkrautschnaps;
var int Knows_Banditenaxt;

var int Knows_Truemmerschlag;
var int Mandibles_Bonus;
var int Knows_Bloodfly;
var int Bloodfly_Bonus;
var int Apple_Bonus;
var int Dunkelpilz_Bonus;


// ГРИБНИКИ ===========================================

var int Fish_Bonus;
var int Meat_Bonus;
var int Meat_Bonus_Cnt;

//const int Startup_Once = 0;

var int Competition_Len;
var int Competition_LastDay;

//когда конкуренты последний раз сдавались Константино
var int GiveMrmsDay_Elena;
var int GiveMrmsDay_Erol;
var int GiveMrmsDay_Odo;
var int GiveMrmsDay_Rupert;
var int GiveMrmsDay_Sarah;
var int GiveMrmsDay_Talbin;
var int GiveMrmsDay_Till;

var int Wait_AfterDia_H;
var int Wait_AfterDia_M;

var int Talbin_Trade;	//Талбин согласился продать грибы
var int Rupert_Trade;	//Руперт согласился продать грибы
var int Sarah_Trade;	//Сара торгует (после окончания конкурса)
var int Gorax_Trade_Once;

var int PrayCounter_Innos;
var int PrayCounter_Adanos;
var int PrayCounter_Beliar;

// КВЕСТЫ ------------------------------------------

// Охотник против орков
var int MIS_GrimbaldOrcs;
	var int MIS_GrimbaldOrcs_FeelBetter;	//нам удалось утешить Гримбальда
	var int MIS_GrimbaldOrcs_Weapon;	//орочье оружие
	var int MIS_GrimbaldOrcs_GetBow;	//миссия невыполнима - достать лук
		const int MIS_GrimbaldOrcs_GetBow_GotIdea	= 10;	//у Гримбальда идея
		const int MIS_GrimbaldOrcs_GetBow_Planned	= 11;	//рассказал план
		const int MIS_GrimbaldOrcs_GetBow_Ready		= 12;	//начали!
		const int MIS_GrimbaldOrcs_GetBow_Go		= 13;	//бежим!
		const int MIS_GrimbaldOrcs_GetBow_Return	= 14;	//успешно
	var int MIS_GrimbaldOrcs_Timer;	//продержаться еще 5 мин.
	var int MIS_GrimbaldOrcs_DeadCnt;	//сколько орков убито
	var int MIS_GrimbaldOrcs_DeadCnt_Seen;	//сколько из них видел мертвыми Гримбальд

// Почта Хориниса
var int MIS_KhorinisPost;
	//этап доставки
	var int MIS_KhorinisPost_Stage_FromVino;
	var int MIS_KhorinisPost_Stage_FromBootlegger;
	var int MIS_KhorinisPost_Stage_FromHalvor;
	var int MIS_KhorinisPost_Stage_FromHakon;
	var int MIS_KhorinisPost_VinoDelivered;
	//кому донесли
	var int MIS_KhorinisPost_BootleggerDelivered;
	var int MIS_KhorinisPost_HalvorDelivered;
	var int MIS_KhorinisPost_ValentinoDelivered;
	var int MIS_KhorinisPost_FernandoDelivered;
	var int MIS_KhorinisPost_HakonDelivered;
	var int MIS_KhorinisPost_HaradDelivered;
	
	var int MIS_KhorinisPost_HalvorPayed;	//сколько Халвор заплатил за посылку
	var int MIS_KhorinisPost_HalvorTime100;	//когда приходить за 100
	var int MIS_KhorinisPost_HalvorGoWithMe;	//Халвор отводит нас в сторонку
	var int MIS_KhorinisPost_HalvorFight;	//деремся за пакет
	var int MIS_KhorinisPost_HalvorGotPacket;	//Халвор забрал/получил пакет
	var int MIS_KhorinisPost_HalvorShareGiven;	//дали Халвору его долю
	var int MIS_KhorinisPost_HalvorShareDay;	//когда Халвор ждет от нас свою долю
	var int MIS_KhorinisPost_HakonTime;	//когда Хакон начнет ругаться за недоставку
	
// Кулинарные изыски
var int MIS_Cookery;
	var int MIS_Cookery_Eatable;
	var int MIS_Cookery_TheklaTold;
	var int MIS_Cookery_HildaTold;
	var int MIS_Cookery_SagittaTold;
	var int MIS_Cookery_ConstantinoTold;
	var int MIS_Cookery_ConstantinoAsked;	//Константино сказал, что грибы съедобные
	var int MIS_Cookery_ConstantinoSold;	//Константино продал рецепт
	var int MIS_Cookery_SagittaAsked;	//спросили у Сагитты рецепт
	var int MIS_Cookery_AskSpices;	//Гром попросил найти специи
	var int MIS_Cookery_SpicesGiven;	//дали специи Грому
	var int MIS_Cookery_TheklaTime;	//когда Текла приготовит

// Плотник на мели
var int MIS_ThorbenSales;
	
// Как вернуть мужа домой
var int MIS_FellanGoHome;
	var int MIS_FellanGoHome_WifeWaits;	//знаем, что Ирина ждет мужа
	var int MIS_FellanGoHome_ToldAttempts;	//сколько раз уговаривали вернуться
		const int MIS_FellanGoHome_ToldAttempts_Fail = 2;	//сколько раз нужно попытаться
	var int MIS_FellanGoHome_BrokenHammerGot_Once;	//взяли сломанный молоток
	var int MIS_FellanGoHome_YewGot;	//получили тис
	var int MIS_FellanGoHome_Returned;	//вернулся!

// Пропавший раотник
var int MIS_LostBau;

// Голодные волки
var int MIS_MalethWolves;
	var int MIS_MalethWolves_SheepKilled;	//сколько овец было убито
	var int MIS_MalethWolves_FeedDay;	//когда в последний раз обедали

// ---------------------------------------------------------------

// ОДО Травы для мастера
var int MIS_Odo_Herbs;
	var int MIS_Odo_Herbs_Give_Plant;	//какое растение отдаем Неорасу
	var int MIS_Odo_Herbs_Give_Cnt;		//сколько растений отдаем
	var int MIS_Odo_Herbs_Give_Price;	//ценность отдаваемого растения
	var int MIS_Odo_Herbs_PermCnt;	//сколько царского щавеля принесли
	var int MIS_Odo_Herbs_AllCnt;	//сколько всего растений принесли
	var int MIS_Odo_Herbs_Bonus;	//выдан ли бонус
	var int MIS_Odo_Herbs_Pay;		//платит ли Неорас за травы, и сколько платит
	var int MIS_Odo_Herbs_Day;		//когда Парлан запрет нас в Монастыре, если не принесем травы
	var int MIS_Odo_Wine_SecretAsk;		//хотим узнать секрет монастырского вина
	var int MIS_Odo_Wine_SecretGot;		//узнали секрет монастырского вина
var int MIS_Odo_Straw;
		const int Straw_Price = 0;
		const int Straw_Quality = 1;
		const int Straw_Told = 2;
		const int Straw_Max = 3;
	var int MIS_Odo_Straw_Onar[Straw_Max];
	var int MIS_Odo_Straw_Sekob[Straw_Max];
	var int MIS_Odo_Straw_Bengar[Straw_Max];
	var int MIS_Odo_Straw_Akil[Straw_Max];
	var int MIS_Odo_Straw_Lobart[Straw_Max];
	var int MIS_Odo_Straw_All;
	var int MIS_Odo_Straw_BengarChoosen;

// ТАЛБИН Охота пуще неволи
var int MIS_Talbin_Hunt;
	var int MIS_Talbin_Hunt_ShadowFur;	//принесли шкуру мракориса
	var int MIS_Talbin_Hunt_ShadowHorn;	//принесли рог мракориса
	var int MIS_Talbin_Hunt_NeedTeacherMandibles;	//нужно научиться извлекать жвала
	var int MIS_Talbin_Hunt_CrawlerMandibles;	//принесли жвала ползуна
	var int MIS_Talbin_Hunt_KeilerGot;	//добыли челюсть кабана
	var int MIS_Talbin_Hunt_KeilerSold;	//продали челюсть кабана
var int MIS_Talbin_WhiteWolf;
	var int MIS_Talbin_WhiteWolf_LakeTrace;	//нашли следы у озера под водопадами
	var int MIS_Talbin_WhiteWolf_Fight;	//нашли следы драки
	var int MIS_Talbin_WhiteWolf_Fur;	//клок шерсти
	var int MIS_Talbin_WhiteWolf_StairsTrace;	//следы крови
	var int MIS_Talbin_WhiteWolf_Dead;	//убили белого волка
	var int MIS_Talbin_WhiteWolf_Gaan;	//поспорили с Гааном
	
// РУПЕРТ В долгах, как в шелках
var int MIS_Rupert_Debts;
	const int Creditor_Hanna	= 0;
	const int Creditor_Matteo	= 1;
	const int Creditor_Jora		= 2;
	const int Creditor_Baltram	= 3;
	const int Creditor_Canthar	= 4;
	const int Creditor_Kardif	= 5;
	const int Creditor_Lehmar	= 6;
	const int Creditor_Cnt	= 7;
	var int MIS_Rupert_Debts_Paid[Creditor_Cnt];	//кому вернули долги
	var int MIS_Rupert_Debts_Lehmar_Sum;	//сколько должны денег
	var int MIS_Rupert_Debts_Lehmar_Day;	//когда должны вернуть
	var int MIS_Rupert_Debts_Lehmar_Sword;	//меч для Лемара:
		const int MIS_Rupert_Debts_Lehmar_SwordKnown = 1;	//узнали
		const int MIS_Rupert_Debts_Lehmar_SwordTold  = 2;	//сказали
		const int MIS_Rupert_Debts_Lehmar_SwordGiven = 4;	//отдали
	
// ТИЛЛ Мой питомец
var int MIS_Till_Pet;
	var int MIS_Till_Pet_Follow;	//следует за Тиллом
	var int MIS_Till_Pet_Search;	//ищет еду (и грибы)
	var int MIS_Till_Pet_RunAway;	//Крестик убежал
	var int MIS_Till_Pet_KnowLost;	//Тилл знает, что Крестик убежал
	var int MIS_Till_Pet_Found;		//Тилл нашел Крестика
	var int MIS_Till_Pet_SearchBurnTea;		//Тилл пошел собирать горичай
	var int MIS_Till_Pet_CaveReady;	//приготовили пещеру
		const int MIS_Till_Pet_CaveReady_Gobbo1 = 1;	//избавились от гоблинов в 1 пещере
		const int MIS_Till_Pet_CaveReady_Gobbo2 = 2;	//избавились от гоблинов во 2 пещере
		const int MIS_Till_Pet_CaveReady_Straw = 4;	//постелили соломы
	var int MIS_Till_Pet_BirthPlace;	//где роды
		const int MIS_Till_Pet_BirthPlace_Sagitta = 1;	//у Сагитты
		const int MIS_Till_Pet_BirthPlace_Cave = 2;	//в пещере
	var int MIS_Till_Pet_ChildBorn;	//родила
	var int MIS_Till_Pet_WolfsDead_Cnt;	//сколько убили опасных волков

// ЕЛЕНА Подарочная суматоха
var int MIS_Elena_Present;
	var int MIS_Elena_Present_TalkedAllMarketOnce;
	var int MIS_Elena_Present_FoundCnt;	//сколько нашли вариантов подарка
	var int MIS_Elena_Present_ReadyCnt;	//сколько готово вариантов подарка
	var int MIS_Elena_Present_CupsCnt;	//сколько кубков Верности получили
	var int MIS_Elena_Present_CupLuteroGot;	//получили кубок Лютеро
	var int MIS_Elena_Present_LuteroAskedFur;	//Лютеро запросил шкуру мракориса
	var int MIS_Elena_Present_CupLehmarGot;	//получили кубок Лемара
	var int MIS_Elena_Present_KnowsLehmar;	//знаем, что кубок у Лемара
	var int MIS_Elena_Present_KardifTold;	//Кардиф посоветовал пойти к Халвору
	var int MIS_Elena_Present_HalvorAsked;	//поговорили с Халвором про кубок
	var int MIS_Elena_Present_HalvorPayedDay;	//когда заплатили Халвору
	var int MIS_Elena_Present_FurGot;	//нашли шкуру мракориса
	var int MIS_Elena_Present_FurReadyTime;	//когда шкура будет готова
	var int MIS_Elena_Present_ReadyFurGot;	//забрали готовую шкуру
	var int MIS_Elena_Present_BrianTime;	//+3 дня вечером
	var int MIS_Elena_Present_BrianReturn;	//отказались от колец Брайана и требуем золото назад
	var int MIS_Elena_Present_WasilyPortraitsDay;	//когда Вася даст портреты
	var int MIS_Elena_Present_WasiliPortraitGot;	//Василий дал портрет
	var int MIS_Elena_Present_KnowsBrahim;	//знаем, что Ибрагим может скопировать портреты
	var int MIS_Elena_Present_BrahimReadyTime;	//когда Ибрагим закончит портреты
	var int MIS_Elena_Present_PortraitsReady;	//портреты готовы
	var int MIS_Elena_Present_LehamarAskedCupBack;	//Лемар требует вернуть украденный кубок
		const int MIS_Elena_Present_Lehamar_Returned = 1;	//вернули украденный кубок Лемару
		const int MIS_Elena_Present_Lehamar_GotByForce = 2;	//Лемар отобрал свой кубок силой
		const int MIS_Elena_Present_Lehamar_Mad = 3;	//Лемар конкретно зол на нас
		const int MIS_Elena_Present_Lehamar_Waits = 4;	//еще можно вернуть кубок

// САРА
var int MIS_Sarah_OldFriends;
	var int MIS_Sarah_OldFriends_BernyPray;	//надо помолиться за Берни
	var int MIS_Sarah_OldFriends_BernyMet;	//встретили призрак Берни
	var int MIS_Sarah_OldFriends_Count;	//сколько народу проведали
	const int MIS_Sarah_OldFriends_CountAll = 8;	//сколько всего надо проведать
var int MIS_Sarah_BadHabit;
	var int MIS_Sarah_BadHabit_VatrasAsked;	//спросили совета у Ватраса
	var int MIS_Sarah_BadHabit_EddaAsked;	//попросили помощи у Эдды
	var int MIS_Sarah_BadHabit_MoeAsked;	//попросили помощи у Мо
	var int MIS_Sarah_BadHabit_MoeTalked;	//Мо поговорил с Надей
	var int MIS_Sarah_BadHabit_LuciaAsked;	//спросили Люсию, поговорит ли та с Надей (но еще не дали ключ)
	var int MIS_Sarah_BadHabit_LuciaTalkTime;	//когда Люсия поговорит с Надей
	var int MIS_Sarah_BadHabit_NadjaTalkTime;	//когда Надя "созреет" (день не курила)
	var int MIS_Sarah_BadHabit_SearchPotion;	//ищем лекарство (спросили у Ватраса или Надя сама попросила)
	var int MIS_Sarah_BadHabit_PotionIngredients;	//ищем ингредиенты
	var int MIS_Sarah_BadHabit_PotionIngredientsGiven;	//отдали ингредиенты
	var int MIS_Sarah_BadHabit_PotionGot;	//получили зелье
	var int MIS_Sarah_BadHabit_NadjaAgreed;	//Надя согласилась бросить
	var int MIS_Sarah_BadHabit_NadjaPrize;	//что попросили у Нади за зелье (если 0 - не давали)
		const int MIS_Sarah_BadHabit_NadjaPrize_Thanks = 1;	//просто спасибо
		const int MIS_Sarah_BadHabit_NadjaPrize_Gold = 2;	//золото
	var int MIS_Sarah_BadHabit_GivePotionDay;	//когда отдали зелье
	var int MIS_Sarah_BadHabit_KnowBloodyCough;	//узнали, что Надя кашляет кровью
	var int MIS_Sarah_BadHabit_SalveGivenDay;	//дали Наде укрепляющую мазь
	

// ЭРОЛ
var int MIS_Erol_Plates;
	var int MIS_Erol_Plates_GivenCnt;	//сколько всего сдали (15 = 13 + 2 из могилы)
	const int MIS_Erol_Plates_Pay = 20;	//золота за табличку (+ зелья)
	const int MIS_Erol_Plates_PaySpecial = 100;	//за ценную находку (+ зелья, свитки)
	var int MIS_Erol_Plates_GivenDay1;	//когда дали первую табличку
	var int MIS_Erol_Plates_NumbersSolved;	//решили загадку с числами
	var int MIS_Erol_Plates_AmulFound;	//нашли амулет Ищущего огонька
	var int MIS_Erol_Plates_AmulWorks;	//проверили, что амулет работает после восстановления
	var int MIS_Erol_Plates_AmulReady;	//отдали амулет Ватрасу
	var int MIS_Erol_Plates_GoldFound;	//нашли золотую табличку
	var int MIS_Erol_Plates_GoldGiven;	//отдали золотую табличку
	var int MIS_Erol_Plates_SilverFound;	//нашли серебряную табличку
	var int MIS_Erol_Plates_SilverPieceFound;	//нашли обломок серебряной таблички
	var int MIS_Erol_Plates_SilverFull;	//отдали серебряную табличку целиком
	var int MIS_Erol_Plates_SilverFull_Day;	//когда Ватрас получил серебряную табличку целиком
	

//НастасьСанна --------------
var int ADMIS_NS_Found;	//сколько раз нашли

// ПРАВОСУДИЕ -------------------------------
var int City_Schulden;	//штраф за преступления в городе
var int Farms_Schulden;	//штраф за преступления на фермах
var int Monastery_Schulden;	//штраф за преступления в монастыре
var int Hero_ThrowOut_Monastery;	//ГГ вышвырнули из Монастыря

// РАЗНОЕ -----------------------------------

var int TEACH_Neoras;	//Неорас учит варить зелья

var int OldShepherdSheeps_Dead_Cnt;	//сколько погибло овец у старого пастуха (по любым причинам)
var int MonasterySheep_Dead_Cnt;	//сколько погибло овец в монастыре (по любым причинам)
var int Vino_Search;	//Лобарт попросил найти Вино
var int Vino_Smelled;	//учуяли!
var int Vino_Found;	//нашелся!
var int Vino_Sleep_Day;	//в какой день Вино проспится
var int NastasSanna_Scripts_Cnt;	//счетчик сданных скриптов
var int MalethWolf_Dead_Cnt;	//сколько убили волков для Малета
var int MalethSheep_Dead_Cnt;	//сколько погибло овец Малета
var int THORBEN_Discount;	//Торбен попросил сделать скидки
var int Matteo_LeatherArmorBabe_Day;	//когда будет готов женский доспех
var int Matteo_LeatherArmorGiven;	//Маттео уже отдал Героине доспех
var int Bosper_BeltBought;	//уже купили у Боспера пояс со скидкой
var int Engrom_Follows;	//следует ли Энгром за ГГ
var int Engrom_ArmHurt;	//у Энгрома болит плечо
var int Engrom_ArmHurt_Day;	//с какого дня
var int Engrom_ArmHurt_Hour;	//и часа
var int Orlan_Room_Got;	//сняли комнату в таверне Мертвая гарпия
var int Fishers_Rain_Day;	//когда будет дождь, предсказанный Фаримом
var int Fishers_Rain_Started;	//дождь, предсказанный Фаримом, уже начался + сообщение
var int Ulf_Beer_Count;	//сколько пива выдул Ульф
var int Odo_Bless_Innos_Once;	//благословление от Пирокара
var int Pedro_NotHungryDay;	//когда Педро покормят (1 раз)
var int Pedro_FedDay;	//когда кормили в последний раз + 1, чтобы отличать от 0
var int Pedro_FedCnt;	//сколько раз кормили, или он был сыт
var int Peck_PayDay;	//за какой день заплатили Пеку за тренировку
var int Peck_Training_Running;	//идет тренировка
var int Peck_WrongTraining;	//предупреждения за нарушение правил тренировки
var int Moe_Sign;	//Мое дал сигнал "богатенький буратина"
var int Rengaru_Hocus;	//Ренгару споил "буратину"
var int Harad_TradeNugget;	//знаем, что Гарад покупает руду
var int Harad_TradeNugget_Cnt;	//сколько уже продали
var int Brian_KnifeSell;	//Брайан готов продать нож
var int Wasili_LutikStory_Part;	//какую часть истории про Лютика рассказываем
var int Thekla_Feed_Day;	//когда кушали у Теклы
var int Thekla_MrSoup_Day;	//когда у Теклы есть грибной суп
var int Edda_Feed;	//Эдда согласна кормить супом
var int Kardif_TellRumors;	//Кардиф рассказывает слухи
var int Hanna_Paid;
var int Carl_PickAxeReady_Time;	//когда будет готова кирка для Эрола
var int Fellan_ChestKeyGot;	//получили ключ от сундука Феллана
var int Sagitta_BigHeal;	//Сагитте нужна пара часов, чтобы подлатать ГГ
var int Ulf_WannaBeer;	//Ульф хочет пива от Одо в благодарность за помощь
var int Rupert_Binge;	//Руперт согласился напиться с Регисом
var int Matteo_ClothWear_Counter;	//сколько платьев примерили у Маттео
var int Trocar_InsertKeiler;	//вставить кабана Трокара
var int Harad_Rupert_Smith_Time;	//когда будет готов рудный меч
var int Harad_Rupert_Smith_SpendTime;	//был выбран пропуск времени у Харада
var int Rupert_LiedSong;	//соврали Руперту, что Константино спел балладу
var int Rupert_LiedGold;	//соврали Руперту, что Константино превращает грибы в золото
var int Bromor_Paid;	//заплатили Бромору за услуги
var int Vanja_Ready;	//Ваня готова
var int Vino_HidePlace;	//где прячется Вино
var int Erol_Graves_GotPlates;	//Эрол выкопал таблички
//байки охотников
var int DIA_Bartok_TellTales;	//1 байка (проклятый охотник)
	var int Tale_CursedHunter_Once;
var int DIA_Trocar_TellTales;	//3 байки у всех (варги, белый мракорис, крысиный король) + 1 у Талбина
	var int Tale_Wargs_Once;
	var int Tale_WhiteShadowbeast_Once;
	var int Tale_RatKing_Once;
	var int Tale_WhiteWolf_Once;
var int DIA_Farim_TellTales;	//1 байка (морской дракон)
	var int Tale_SeaDragon_Once;
var int DIA_Grimbald_TellTales;	//1 байка (говорящая гарпия)
	var int Tale_SpeakingHarpy_Once;
var int DIA_Engrom_TellTales;	//1 байка (пьяный кабан) - у всех, кроме Талбина
	var int Tale_DrunkKeil_Once;
var int Listen_Tale_Count;
const int Listen_Tale_Count_All = 6;
const int Listen_Tale_Count_Elena = 4;	//Василий
	var int Tale_Ritters_Once;
	var int Tale_Dragons_Once;
	var int Tale_Ruins_Once;
	var int Tale_Lutik_Once;
var int BloodwinSnow_KillPlayer; //разозлили начальника СноуСтудио
var int ACHIEV_SnowStudio_Counter; //сколько актеров нашли
//книги
var int Read_MRBook_Once;
var int Read_CourtCase_Once;
var int Read_Shipbuilding_Once;
var int Read_Bookstand_Report_Once;
var int Read_OldLetter_Godo2Berta_Once;
var int Read_OakBranch_Once;
var int Read_BiographyBartosLaran_Once;
var int Read_SmithGuide_Once;
var int Read_SunExtract_Once;
var int Read_OnAlchemy_Once;	//только Одо!
var int Read_UnderInnosEye_Once;
var int Read_HorsePlague_Once;
var int Read_AboutDragons_Once;
var int Read_Books_Count;
const int Read_Books_Count_All = 12;
var int Read_BooksOld_Count;
const int Read_BooksOld_Count_All = 9;

var int Dyrian_HasBook; //дали Дуриану книжку


// ГРИБЫ -----------------------------------------------

//вероятность спауна в % по умолчанию
const int Spawn_Intensity_min = 10;
const int Spawn_Intensity_mid = 20;
const int Spawn_Intensity_max = 30;
const int Spawn_Intensity_def = 20;

//в имени FP прописываются все данные для спауна в формате
//SP_<имя>[...][_RBx][_RSy][_CNTz][_NP][...],	x,y - min и max радиусы в см
const string SP_pref = "SP_"; const int SP_pref_len = 3;
const string Rmax_pref = "RB"; const int Rmax_pref_len = 2;
const string Rmin_pref = "RS"; const int Rmin_pref_len = 2;
const string Cnt_pref = "CNT"; const int Cnt_pref_len = 3;
const string NoPhys_name = "NP";

// --------------------------------------
// для грибов <имя> ::= MR<имя гриба>
const string SP_MR_pref = "MR"; const int SP_MR_pref_len = 2;

//MainFlag
const int SP_MR	= 1;
//flag
const int MR_01				= 0;	//411
const int MR_02				= 1;	//344
const int MR_Stone			= 2;	//142
const int MR_Sunrise		= 3;	//76
const int MR_Foggy			= 4;	//21		!!!
const int MR_Piny			= 5;	//done 156
const int MR_Red			= 6;	//350
const int MR_Bottle			= 7;	//77
const int MR_BrownOiler		= 8;	//done 467
const int MR_Oyster			= 9;	//done 67
const int MR_Governor		= 10;	//81
const int MR_Keil			= 11;	//89
const int MR_Branch			= 12;	//81
const int MR_LadysEar		= 13;	//done 91
const int MR_Trident		= 14;	//48		!!!
const int MR_NightSparkles	= 15;	//done 70
const int MR_DragonTears	= 16;	//59
const int MR_Heart			= 17;	//done 5
const int MR_GoldPlate		= 18;	//done 5
const int MR_Ivy			= 19;	//done 54
const int MR_Violet			= 20;	//32
const int MR_Count		= 21;
const int MR_Lists_DoubleLen = 2 * MR_Count;
//<имя гриба>
const string SP_MR_Abbr[MR_Count] = {	
	"01",
	"02",
	"STN",
	"SNR",
	"FOG",
	"PIN",
	"RED",
	"BTL",
	"OIL",
	"SEA",
	"GOV",
	"KL",
	"BRCH",
	"EAR",
	"TRI",
	"NSP",
	"DRG",
	"HRT",
	"GLD",
	"IVY",
	"VLT"
};
const string MR_Names[MR_Count] = {	
	"Темный гриб",
	"Пища рудокопа",
	"Каменка",
	"Зорьник",
	"Туманник",
	"Сосновик",
	"Болтун",
	"Бутылочник",
	"Масляк",
	"Ракушечник",
	"Губернатор",
	"Кабанчик",
	"Веточник",
	"Дамское ушко",
	"Трезубец",
	"Ночные искры",
	"Драконовы слезы",
	"Гриб-сердце",
	"Золотая чаша",
	"Плющевик",
	"Белиарова поганка"
};
//стоимость грибов для Константино, у торговцев другие цены
const int MR_Price[MR_Count] = {	
	10,	//"01",
	15,	//"02",
	4,	//"STN",
	9,	//"SNR",
	0,	//"FOG",
	5,	//"PIN",
	2,	//"RED",
	12,	//"BTL",
	8,	//"OIL",
	10,	//"SEA",
	12,	//"GOV",
	24,	//"KL",
	30,	//"BRCH",
	4,	//"EAR",
	14,	//"TRI",
	60,	//"NSP",
	80,	//"DRG",
	250,	//"HRT",
	100,	//"GLD",
	11,	//"IVY",
	50	//"VLT"
};
// записи в журнал при сдаче грибов Константино
// в середину фразы вставляется цена из MR_Price
const string TOPIC_ConstantinoMushrooms_Comment[MR_Lists_DoubleLen] = 
{
	"За темные грибы Константино заплатит по ", " золотых.",	//"01",
	"Мясной гриб Константино оценил в ", " золотых монет.",	//"02",
	"За каменку можно получить ", " золотых.",	//"STN",
	"Зорьник, который Константино назвал “желтым трубачом“, стоит ", " золотых.",	//"SNR",
	"Туманник Константино не заинтересовал. И он советовал его не есть...","",	//"FOG",
	"Сосновый гриб стоит только ", " золотых.",	//"PIN",
	"Красный болтун Константино не нужен, но он все же даст за него по ", " золотых.",	//"RED",
	"Цена бутылочника - ", " золотых.",	//"BTL",
	"Коричневый масляк, что растет под елями, стоит всего ", " золотых.",	//"OIL",
	"Мне удалось найти гриб, который Константино никогда не видел. Это ракушечник. За открытие он дал мне 100 золотых, но за сами грибы только по ", ".",	//"SEA",
	"Крупный губернатор потянет на ", " золотых.",	//"GOV",
	"Константино будет покупать только молодые кабаньи грибы, но зато за ", " золотых.",	//"KL",
	"Константино охотно отдаст за веточник ", " золотых.",	//"BRCH",
	"Розовые дамские уши не очень нужны Константино, он платит только ", " золотых.",	//"EAR",
	"Трезубец Константино заинтересовал, но не сильно. Он заплатит ", " золотых за штуку.",	//"TRI",
	"Ночные искры - маленькие, но ценные. За каждую горсть Константино готов выложить ", " золотых.",	//"NSP",
	"Синие драконовы слезы стоят целых ", " золотых.",	//"DRG",
	"За редкий и необычный гриб-сердце я могу получить целых ", " зололтых. Константино был очень удивлен.",	//"HRT",
	"Золотая чаша - очень ценный гриб, он стоит ", " золотых.",	//"GLD",
	"Плющевик можно продать Константино за ", " золотых.",	//"IVY",
	"Ядовитая фиолетовая поганка стоит немало, ", " золотых."	//"VLT"
};
//*/

//списки
const int SP_MR_Lists[MR_Lists_DoubleLen] =	{
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0
};
const int SP_FOOD_List[2] = {0,0};	//список точек СП для еды

var int SP_MR_InWorldCount[MR_Count];


// --------------------------------------

var int SP_NightSparkles_Night;

// --------------------------------------
// для еды <имя> ::= FOOD
const string SP_Food_name = "FOOD";
//MainFlag
const int SP_Food	= 2;
//flag
const int SP_Food_Rich = 1;	
const int SP_Food_Tavern = 2;
const int SP_Food_Poor = 4; 
const int SP_Food_Bau = 8;
const int SP_Food_Flag_Names_Count = 4;
const string SP_Food_Flag_Names[SP_Food_Flag_Names_Count] = {	
	"RICH",
	"TAVERN",
	"POOR",
	"BAU"
};
//список не сохраняется, засев в начале игры (сопли: нехорошо портить VobTree при его обходе!)

//список того, что нужно удалить
var int SP_Delete_List[2];	//zCListHead <oCItem>



