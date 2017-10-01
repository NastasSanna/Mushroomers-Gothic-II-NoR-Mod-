/**************************************************************************

                                КЛАССЫ
							   
  В этом файле прописаны основные классы - персонаж, предмет, заклинание,
фокус и несколько неиспользующихся классов, а также несколько глобальных
констант и ссылки на героя предмет и т.п.
  Есть "мертвые" декларации.
  
  РУКАМИ НЕ ТРОГАТЬ!!!
  
  Связанные файлы:
 индексы массивов и флаги 						Constants.d
 константы ИИ									AI\AI_Intern\AI_Constants.d

***************************************************************************/


// КОНСТАНТЫ ------------------------------------------------------------------

const int MAX_CHAPTER = 5;	//макс. кол-во глав (не исп.)
const int MAX_MISSIO = 5;	//макс. кол-во выполняемых миссий (не исп.)
const int MAX_HITCHANCE = 5;//размерность массива навыков владения оружием (=кол-ву типов оружия)


// ПЕРСОНАЖ (НПС) ---------------------------------------------------------------
class C_Npc
{
	var int id;						//уникальный идентифкатор
	var string name[5];				//имя (отображается над ним), исп. только name[0]
	var string slot;				//(свободно)
	var string effect;				//имя визуального эффекта
	var int npcType;				//тип персонажа для ИИ (=NPCTYPE_x)
	var int flags;					//флаги (=NPC_FLAG_x, 0 если отсутствуют)
	//
	var int attribute[ATR_INDEX_MAX];//атрибуты
	var int HitChance[MAX_HITCHANCE];//навык владения видами оружия (вероятность крит. удара)
	var int protection[PROT_INDEX_MAX];//защита от поврежедений
	var int damage[DAM_INDEX_MAX];  //уровни наносимых поверждений по типам
	var int damagetype;				//флаги типов повреждений
	//
	var int guild;					//гильдия (=GIL_x)
	var int level;					//уровень 
	var func mission[5];			//миссия (не исп.)
	//
	var int fight_tactic;			//тактика боя для ИИ (=FAI_x)
	var int weapon;					//оружие (не исп.)
	//
	var int voice;					//номер голоса (=1..16)
	var int voicePitch;				//тональность голоса (не исп.)
	//
	var int bodymass;				//масса тела (не исп.)
	//
	var func daily_routine;			//функция распорядка дня (Rtn_x)
	var func start_aistate;			//функция начального состоянии ИИ (=ZS_x)
	//возрождение
	var string spawnPoint;			//точка, в которой создается, явно не исп., см. функцию Wld_InsertNpcAndRespawn
	var int spawnDelay;				//пауза между смертью и возрождением, секунд, явно не исп., см. функцию Wld_InsertNpcAndRespawn
	//чувства
	var int senses;					//флаги чувств (=SEE_x)
	var int senses_range;			//диапазон чувствительности в см
	//
	var int aivar[100];				//значения переменных ИИ (=AIV_x)
	//
	var string wp;					//привязка к месту
	//опыт
	var int exp;					//опыт (только у ГГ)
	var int exp_next;				//опыт до след. уровня (только у ГГ)
	var int lp;						//очки опыта (только у ГГ)
	//прочее
	var int bodyStateInterruptableOverride; //запрет на прерывание действия персонажа (перекрывает флаг BS_FLAG_INTERRUPTABLE)
	var int noFocus;				//в фокусе не показывать имя и полоску жизни
};


// МИССИЯ (не исп.)--------------------------------------------------------------
class C_Mission
{
	var string name;
	var string description;
	var int duration;
	var int important;
	var func offerConditions;
	var func offer;
	var func successConditions;
	var func success;
	var func failureConditions;
	var func failure;
	var func obsoleteConditions;
	var func obsolete;
	var func running;
};

// ПРЕДМЕТ ----------------------------------------------------------------------
class C_Item
{
	//общее
	var int id;						//уникальный идентификатор (не исп.)
	var string name;				//название
	var string nameID;				//(свободно)
	var int hp;						//(не исп.)
	var int hp_max;					//(внутр.) //NS: не использовать! иначе цена предмета будет = 0
	var int mainflag;				//флаги категории предмета (=ITEM_KAT_x)
	var int flags;					//другие флаги (=ITEM_x)
	var int weight;					//вес (не исп.)
	var int value;					//стоимость
	//оружие
	var int damagetype;				//флаги типов повреждения (=DAM_x)
	var int damageTotal;			//общая величина повреждения
	var int damage[DAM_INDEX_MAX];	//величина повреждений по типам
	//надевание
	var int wear;					//флаги при надевании (=WEAR_x)
	var int protection[PROT_INDEX_MAX]; //защита от повреждений по типам
	//пища
	var int nutrition;				//питательность (не исп.)
	//условия для использования
	var int cond_atr[3];			//какие атрибуты нужны для применения (=ATR_x), не больше 3, в скриптах всегда cond_atr[2]
	var int cond_value[3];			//мин. значения атрибутов для применения
	//изменение атрибутов
	var int change_atr[3];			//какие атрибуты изменяет (не исп., но работает), прописывать в on_equip/on_unequip/on_state
	var int change_value[3];		//на сколько изменяет атрибуты (не исп., но работает), прописывать в on_equip/on_unequip/on_state
	//при ношении
	var func magic;					//магия (нет прим.)
	var func on_equip;				//вызывается при надевании
	var func on_unequip;			//вызывается при снятии
	var func on_state[4];			//вызывается при использовании, (до 4 разных, см. соотв. анимацию, чаще всего 0)
	//владелец
	var func owner;					//владелец, непосредственная ссылка на конкретного NPC (не его ID)
	var int ownerGuild;				//гильдия владельца (=GIL_x)
	var int disguiseGuild;			//фальшивая гильдия (нет прим.)
	//внешний вид
	var string visual;				//3D-модель предмета(x.3DS)
	var string visual_change;		//3D-модель надетого предмета (брони) (x.ASC)
	var string effect;				//имя визуального эффекта при ношении
	var int visual_skin;			//номер текстуры
	var string scemeName;			//название схемы анимации использования предмета
	var int material;				//материал (=MAT_x)
	//заряд
	var int munition;				//тип заряда (стрела, арбалетный болт)
	//магия
	var int spell;					//заклинание (=SPL_x)
	var int range;					//радиус поражения (=RANGE_x_)
	var int mag_circle;				//круг магии
	//описание
	var string description;			//название предмета в инвентаре (часто =name)
	var string text[6];				//строки текста, отображающиеся в инвентаре
	var int count[6];				//соответствующие тексту значения
	//камера
	var int inv_zbias;				//масштаб камеры при отображении предмета в инвентаре
	var int inv_rotx;				//поворот камеры по оси X при отображении в инвентаре
	var int inv_roty;				//поворот камеры по оси Y при отображении в инвентаре
	var int inv_rotz;				//поворот камеры по оси Z при отображении в инвентаре
	var int inv_animate;			//анимация при отображении в инвентаре (нет прим.)
};

// ФОКУС ---------------------------------------------------------------------------
/* значения для разных состояний заданы в AI\AI_Intern\Focus.d */
class C_Focus
{
	//в фокусе - персонаж
	var float npc_longrange;		//дальность (без оружия)
	var float npc_range1;			//миним. диапазон	
	var float npc_range2;			//макс. диапазон
	var float npc_azi;				//азимут
	var float npc_elevdo;			//макс. угол захвата (тангажа) (вниз,	>0)	
	var float npc_elevup;			//мин. угол захвата (тангажа) (вверх, <0)
	var int npc_prio;				//приоритет выделения персонажа
	//в фокусе - предмет
	var float item_range1;			//миним. диапазон	
	var float item_range2;			//макс. диапазон
	var float item_azi;				//азимут
	var float item_elevdo;			//макс. угол захвата (тангажа) (вниз,	>0)	
	var float item_elevup;			//мин. угол захвата (тангажа) (вверх, <0)
	var int item_prio;				//приоритет выделения предмета
	//в фокусе - объект
	var float mob_range1;			//миним. диапазон
	var float mob_range2;			//макс. диапазон
	var float mob_azi;				//азимут
	var float mob_elevdo;			//макс. угол захвата (тангажа) (вниз,	>0)
	var float mob_elevup;			//мин. угол захвата (тангажа) (вверх, <0)
	var int mob_prio;				//приоритет выделения объекта
};


// ДИАЛОГ --------------------------------------------------------------------
/* Ветвь диалога
   см. папку Story\Dialoge\ и Story\Dialog_Mobsis\ */
class C_Info
{
	var int npc;				//кто говорит (ID)
	var int nr;					//номер реплики (чем он больше, тем ниже в списке вариантов данный пункт)
	var int important;			//флаг важности (=TRUE/FALSE) - если установлен, персонаж сам обратится к ГГ
	var func condition;			//условие, при выполнении которого появляется диалог (имя функции = имя диалога + _Condition)
	var func information;		//вывод самого диалога и все, что при этом происходит (имя функции = имя диалога + _Info)
	var string description;		//текст, отображаетмый в списке вариантов
	var int trade;				//диалог для торговли (=TRUE/FALSE)
	var int permanent;			//постоянный диалог, не исчезает после прочтения (=TRUE/FALSE)
};


// РЕАКЦИЯ НА ПРЕДМЕТ (не исп.) -----------------------------------------------------
class C_ITEMREACT
{
	var int npc;
	var int trade_item;
	var int trade_amount;
	var int requested_cat;
	var int requested_item;
	var int requested_amount;
	var func reaction;
};


// ЗАКЛИНАНИЕ ------------------------------------------------------------------------
/* Все заклинания описаны в AI\Magic\Spells\ через прототип из 
   AI\Magic\C_Spell_Proto.d.
   Не путать с описанием рун. */
class C_Spell
{
	var float time_per_mana;			//время, необходимое для инвестирования маны, в мс
	var int damage_per_level;			//урон за уровень инвестирования
	var int damagetype;					//тип повреждения (=DAM_x)
	var int spellType;					//тип заклинания (=SPELL_GOOD|SPELL_NEUTRAL|SPELL_BAD)
	var int canTurnDuringInvest;		//можно ли повернуться во время инвестирования маны (=TRUE/FALSE)
	var int canChangeTargetDuringInvest;//можно ли сменить цель во время инвестирования маны (=TRUE/FALSE)
	var int isMultiEffect;				//множественный эффект, по факту для всех заклинаний =0
	var int targetCollectAlgo;			//цель заклинания (=TARGET_COLLECT_x)
	var int targetCollectType;			//тип цели (=TARGET_TYPE_x), в скриптах только TARGET_TYPE_NPCS
	var int targetCollectRange;			//дальность действия в см
	var int targetCollectAzi;			//угол азимута (горизонт. угол атаки)
	var int targetCollectElev;			//угол тангажа (верт. угол атаки)
};



instance self(C_Npc)	// Сам - активный персонаж
{
};
instance other(C_Npc)	//Другой - тот, с кем активный персонаж взаимодействует
{
};
instance victim(C_Npc)	//Жертва - третье лицо во взаимодействии, жертва другого
{
};
instance item(C_Item)	//Предмет (в фокусе)
{
};
instance hero(C_Npc)	//Герой (ГГ, игрок)
{
};




