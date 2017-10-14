
const int XP_Ambient = 50;
const int XP_TargetHit = 1;
const int XP_Bookstand = 25;	//прочитали книжку
const int XP_Harad_Nugget = 50;	//принесли руду Гараду
const int XP_Moe_Respect = 50;	//заслужили уважение Мо
const int XP_Adanos50 = 50;	//пожертвовали Аданосу
const int XP_Adanos100 = 100;	//пожертвовали Аданосу
const int XP_Adanos_4Good = 200;	//сделали доброе дело и Аданос - покровитель
const int XP_IgnazEarPotion = 75;	//выпили зелье Игнаца на дамских ушах

var int XP_Bonus_10;	//бонус к опыту 10% (амулет из акульего зуба)

// КВЕСТЫ =========================================

const int XP_ConstantinoMushroom_Once = 10;	//дает Константино за 1 стоимости гриба

const int XP_OldShepherd_Count6 = 200;
const int XP_OldShepherd_Count7 = 150;
const int XP_OldShepherd_Count_NiceTry = 50;


// Одо ---------------------------------------
//Sum: 2000..2500
const int XP_Odo_Herbs_KeyGot = 100;
const int XP_Odo_Herbs_WineSecret = 200;
const int XP_Odo_Herbs_Success = 1000;

const int XP_Odo_Straw_Onar = 100;
const int XP_Odo_Straw_Sekob = 100;
const int XP_Odo_Straw_Bengar = 100;
const int XP_Odo_Straw_Akil = 100;
const int XP_Odo_Straw_Lobart = 100;
const int XP_Odo_Straw_Right1 = 150;
const int XP_Odo_Straw_Right2 = 150;
const int XP_Odo_Straw_Success = 500;

// Талбин ---------------------------------------
//Sum: 2200..2300
const int XP_Talbin_Hunt_ShadowFur = 200;
const int XP_Talbin_Hunt_ShadowHorn = 200;
const int XP_Talbin_Hunt_Mandibles = 500;
const int XP_Talbin_Hunt_Mandibles_Vatras = 400;
const int XP_Talbin_Hunt_KeilsMeasured = 200;
const int XP_Talbin_Hunt_KeilsSold = 200;
const int XP_Talbin_WhiteWolf_Trace = 50;
const int XP_Talbin_WhiteWolf_MalakTold = 500;
const int XP_Talbin_WhiteWolf_GaanTold = 100;

// Руперт ---------------------------------------
//Sum: 2200..2300
const int XP_Rupert_Debts_Hanna		= 100;
const int XP_Rupert_Debts_Matteo	= 100;
const int XP_Rupert_Debts_Jora		= 100;
const int XP_Rupert_Debts_Baltram	= 100;
const int XP_Rupert_Debts_Kardif	= 100;
const int XP_Rupert_Debts_Canthar	= 200;
const int XP_Rupert_Debts_Lehmar	= 500;
const int XP_Rupert_Debts_Lehmar_Sword	= 100;
const int XP_Rupert_Debts_All		= 1000;

// Тилл -----------------------------------------
//Sum: 2200..2300 + кормление
const int XP_Till_PetFeed			= 10;	//кормление Крестика
const int XP_Till_PetFeed_Like		= 50;	//за любимую еду
const int XP_Till_WolfsDead			= 200;
const int XP_Till_SagittaFound		= 200;
const int XP_Till_BurnteaGot 		= 200;
const int XP_Till_GobbosRemoved		= 500;
const int XP_Till_Straw 			= 100;
const int XP_Till_CaveReady			= 100;
const int XP_Till_ChildBorn 		= 1000;

//Эрол ------------------------------------------
//Sum: ~3000
const int XP_Erol_Plate				= 50;	//за одну табличку * 15
const int XP_Erol_NumbersSolved		= 500;	//за разгадку задачки с числами
const int XP_Erol_AmulGiven			= 200;	//принесли амулет Ватрасу
const int XP_Erol_AmulCharged		= 500;	//зарядили амулет
const int XP_Erol_Gold				= 500;	//нашли золотую табличку
const int XP_Erol_Silver			= 200;	//нашли серебряную табличку
const int XP_Erol_SilverPiece		= 300;	//нашли кусок серебряной таблички
const int XP_Erol_Success			= 1000;	//все сделали

const int XP_Erol_RingInGrave = 500;	//не взял кольцо из могилы

//Елена ------------------------------------------
//Sum: 900..3000
const int XP_Elena_PresentFound1	= 100;	//нашли 1й вариант подарка
const int XP_Elena_PresentFound2	= 150;	//нашли 2й вариант подарка
const int XP_Elena_PresentFound3	= 200;	//нашли 3й вариант подарка

const int XP_Elena_CupLuteroGot		= 100;	//получили кубок Верности Лютеро
const int XP_Elena_CupLehmarGot		= 200;	//получили кубок Верности Лемара
const int XP_Elena_CupsGot			= 500;	//достали оба кубка
const int XP_Elena_CupReterned		= 100;	//вернули Лемару его кубок
const int XP_Elena_Cup2ReternedFree	= 200;	//вернули Лемару втрой кубок за так
const int XP_Elena_Cup2ReternedPayed= 100;	//вернули Лемару втрой кубок за небольшие деньги (за большие опыта не будет)

const int XP_Elena_ShadowFurFound	= 300;	//где-то достали шкуру мракориса
const int XP_Elena_ShadowFurReady	= 500;	//выделали шкуру у Боспера

const int XP_Elena_RingsGot			= 100;	//достали обычные золотые кольца
const int XP_Elena_RingsReady		= 400;	//Брайан выковал кольца
const int XP_Elena_PortretGot		= 100;	//достали портрет родителей
const int XP_Elena_PortretsInserted	= 100;	//портреты в кольцах (готово!)
const int XP_Elena_PortretReturned	= 50;	//вернули портрет Василию

//Сара ------------------------------------------
//Sum: 900..1200
const int XP_Sarah_Talked		= 50;	//поговорили с одним из друзей
const int XP_Sarah_EddaAboutFishers	= 50;	//рассказали Эдде про рыбаков
const int XP_Sarah_NadjaHello		= 50;	//поздоровались с Надей
const int XP_Sarah_MetBerny			= 200;	//повидались с душой Берни
const int XP_Sarah_OldFriends_Success	= 500;

//Sum: 1250
const int XP_Sarah_Nadja_EddaTalked		= 50;	//поговорили с Эддой о Наде
const int XP_Sarah_Nadja_MoeTalked		= 50;	//Мо поговорил с Надей
const int XP_Sarah_Nadja_LuciaTalked	= 200;	//Люсия согласилась поспорить с Надей
const int XP_Sarah_Nadja_ItWorked		= 300;	//Надя решила бросить
const int XP_Sarah_Nadja_PotionFree		= 200;	//добыли очищающее зелье и отдали бесплатно
const int XP_Sarah_Nadja_Potion			= 100;	//добыли очищающее зелье иотдали за деньги
const int XP_Sarah_Nadja_Salve			= 50;	//добыли мазь
const int XP_Sarah_BadHabit_Success	= 500;


// ОБЩИЕ ====================================================


const int XP_VinoFound = 100;

const int XP_MalethWolves = 200;
const int XP_SnowStudio = 50;


// Охотник против орков ---------------------------------------
const int XP_GrimbaldOrcs_MakeLaugh = 100;	//рассмешили Гримбальда
const int XP_GrimbaldOrcs_OrcsGone = 500;	//увели орков
const int XP_GrimbaldOrcs_OrcsDead = 500;

// Почта Хориниса ---------------------------------------
const int XP_KhorinisPost_BootleggerDelivered	= 250;	//доставка письма Вино
const int XP_KhorinisPost_HalvorDelivered		= 150;	//посылка Халвору от честного торговца
const int XP_KhorinisPost_FernandoDelivered		= 100;	//
const int XP_KhorinisPost_ValentinoDelivered	= 100;	//
const int XP_KhorinisPost_HakonDelivered		= 100;	//
const int XP_KhorinisPost_HalvorToAll			= 200;	//
const int XP_KhorinisPost_HaradDelivered		= 100;	//
const int XP_KhorinisPost_HalvorShare			= 200;	//отнесли Халвору его долю
const int XP_KhorinisPost_Success				= 500;	//все сдюжили!

const int XP_KhorinisPost_ValentinoMoneyBack	= 50;	//вернули лишние деньги Валентино
const int XP_KhorinisPost_FernandoMoney			= 50;	//Фернандо доплатил забытые 50 золотых
const int XP_KhorinisPost_HakonAnti				= -100;	//не доставили руду Халвора


// Кулинарные изыски -------------------------------------
const int XP_Cookery_ToldEatableRaw				= 50;	//сказали Грому, что съедобны в сыром виде
const int XP_Cookery_ConstantinoTold			= 100;
const int XP_Cookery_TheklaTold					= 100;
const int XP_Cookery_HildaTold					= 100;
const int XP_Cookery_SagittaTold				= 100;
const int XP_Cookery_SpicesGiven				= 200;
const int XP_Cookery_HildaSharpen				= 50;	//заточили нож для Хильды
const int XP_Cookery_Success					= 500;

// Феллан ------------------------------------------------
const int XP_Fellan_YewGot						= 100;
const int XP_Fellan_HammerRepaired				= 200;
const int XP_Fellan_Returned					= 1000; //вернулся
const int XP_Fellan_Success						= 200; //поговорили с Ириной

// Трокар ------------------------------------------------
const int XP_Trocar_Found						= 200;
const int XP_Trocar_Told						= 50;

