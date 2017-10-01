/**************************************************************************

                              СОСТОЯНИЯ ТЕЛА
  
  Флаги различный состояний персонажей и связанных предметов.
  Значительная часть перечисленных состояний в скриптах не используется.

***************************************************************************/

// ФЛАГИ -------------------------------------------------------------------

const int BS_FLAG_INTERRUPTABLE		= 1 << 15;		//текущее действие можно прервать
const int BS_FLAG_FREEHANDS			= 1 << 16;		//руки свободны


// СОСТОЯНИЯ ---------------------------------------------------------------
/* Индексы + для некоторых состояний установлены флаги */

const int BS_STAND					=  0 + BS_FLAG_INTERRUPTABLE + BS_FLAG_FREEHANDS;		//стоит
const int BS_WALK					=  1 + BS_FLAG_INTERRUPTABLE;		//идет
const int BS_SNEAK					=  2 + BS_FLAG_INTERRUPTABLE;		//крадется
const int BS_RUN					=  3;								//бежит
const int BS_SPRINT					=  4;								//быстро бежит (нет прим.)
const int BS_SWIM					=  5;								//плывет
const int BS_CRAWL					=  6;								//ползет (нет прим.)
const int BS_DIVE					=  7;								//ныряет
const int BS_JUMP					=  8;								//прыгает
const int BS_CLIMB					=  9 + BS_FLAG_INTERRUPTABLE;		//взбирается  (нет прим.)
const int BS_FALL					= 10;								//падает
const int BS_SIT					= 11 + BS_FLAG_FREEHANDS;			//сидит 
const int BS_LIE					= 12;								//лежит
const int BS_INVENTORY				= 13;								//открыт инвентарь
const int BS_ITEMINTERACT			= 14 + BS_FLAG_INTERRUPTABLE;		//действие с предметом 
const int BS_MOBINTERACT			= 15;								//действие с объектом
const int BS_MOBINTERACT_INTERRUPT	= 16 + BS_FLAG_INTERRUPTABLE;		//прерываемое действие с объектом 
const int BS_TAKEITEM				= 17;								//берет предмет (нет прим.)
const int BS_DROPITEM				= 18;								//роняет предмет (нет прим.)
const int BS_THROWITEM				= 19;								//бросает предмет (нет прим.)
const int BS_PICKPOCKET				= 20 + BS_FLAG_INTERRUPTABLE;		//ворует  (нет прим.)
const int BS_STUMBLE				= 21;								//споткнулся (нет прим.)
const int BS_UNCONSCIOUS			= 22;								//без сознания
const int BS_DEAD					= 23;								//умер
const int BS_AIMNEAR				= 24;								//цель близко (не исп., при стрельбе состояние BS_STAND)
const int BS_AIMFAR					= 25;								//цель далеко (не исп.)
const int BS_HIT					= 26 + BS_FLAG_INTERRUPTABLE;		//наносит удар  (нет прим.)
const int BS_PARADE					= 27;								//отступает (нет прим.)
const int BS_CASTING				= 28;								//читает заклинание (нет прим.)
const int BS_PETRIFIED				= 29;								//ошеломлен (нет прим.)
const int BS_CONTROLLING			= 30 + BS_FLAG_INTERRUPTABLE;		//контролирует кого-то (нет прим.)
const int BS_MAX					= 31;				//кол-во состояний тела (внутр.)


//Модификаторы состояний (свободные флаги 7-14)
const int BS_MOD_HIDDEN				= 1 << 7;		//скрытый 
const int BS_MOD_DRUNK				= 1 << 8;		//пьяный (не исп.)
const int BS_MOD_NUTS				= 1 << 9;		//чокнутый 
const int BS_MOD_BURNING			= 1 << 10;		//горящий
const int BS_MOD_CONTROLLED			= 1 << 11;		//под контролем
const int BS_MOD_TRANSFORMED		= 1 << 12;		//трансформированный


//Непрерываемые действия с объектами по типам (внутр.)
// чтобы сидеть - лавка,стул,земля,трон
const string MOB_SIT				= "BENCH,CHAIR,GROUND,THRONE";
// чтобы лежать - кровать,высокая кровать,низкая кровать
const string MOB_LIE				= "BED,BEDHIGH,BEDLOW";
// чтобы взбираться - подъем,приставная лестница,верерка
const string MOB_CLIMB				= "CLIMB,LADDER,RANKE";
// прочие непрерываемые - дверь,рычаг,кнопка,переключатель,ворот,большой сундук,маленький сундук,трава,
//идол,сковорода,кальян,статуя Инноса
const string MOB_NOTINTERRUPTABLE	= "DOOR,LEVER,TOUCHPLATE,TURWITCH,VWHEEL,CHESTBIG,CHESTSMALL,HERB,IDOL,PAN,SMOKE,INNOS";


//все остальные действия с объектами являются прерываемыми
//книга,наковальня,ведро,горн,точило,котел,барабан,могила,
//BOOK,BSANVIL,BSCOOL,BSFIRE,BSSHARP,CAULDRON,DRUM,GRAVE,
//алх.стол,жила руды,ремонт,руннный стол,бревно,плита,каменная табличка
//LAB,ORE,REPAIR,RMAKER,BAUMSAEGE,STOVE,SDW
