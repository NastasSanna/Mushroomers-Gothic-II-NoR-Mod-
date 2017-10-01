/**************************************************************************

                            РАСПОРЯДОК ДНЯ
							   
  Функции распорядка дня. Вызывают встроенную функцию TA_Min с
соответствующим параметром state для персонажа self.
  Шаблон функции:
  func void TA_x(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_x,waypoint);
};
  x - само состояние (действие);
  start_h,start_m - час и минута начала действия;
  stop_h,stop_m - час и минута прекращеняи действия;
  waypoint - место выполнения действия.  
  
  Функции с пометкой FP выполняются на freepoint.

***************************************************************************/


//Герольд зачитывает объявление
func void TA_Announce_Herold(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Announce_Herold,waypoint);
};

//Готовить в котле
func void TA_Cook_Cauldron(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Cook_Cauldron,waypoint);
};

//Готовить на сковородке
func void TA_Cook_Pan(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Cook_Pan,waypoint);
};

//Танцевать
func void TA_Dance(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Dance,waypoint);
};

//Спасаться бегством
func void TA_FleeToWp(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_FleeToWp,waypoint);
};

//Следовать за игроком
func void TA_Follow_Player(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Follow_Player,waypoint);
};

//Охранять проход
func void TA_Guard_Passage(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Guard_Passage,waypoint);
};

//Показывать путь игроку
func void TA_Guide_Player(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Guide_Player,waypoint);
};

//Охотиться
func void TA_Hunting(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Hunting,waypoint);
};

//Копаться в сундуке
func void TA_OpenChest(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_OpenChest,waypoint);
};

//Пи'сать (только для мужиков!)
func void TA_Pee(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Pee,waypoint);
};

//ПОдбирать с земли (собирать урожай)
func void TA_Pick_FP(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Pick_FP,waypoint);
};

//Добывать руду
func void TA_Pick_Ore(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Pick_Ore,waypoint);
};

//Играть на лютне
func void TA_Play_Lute(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Play_Lute,waypoint);
};

//Готовить зелье
func void TA_Potion_Alchemy(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Potion_Alchemy,waypoint);
};

//Практиковаться в магии со всполохами (кругами)
func void TA_Practice_Circle(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Practice_Circle,waypoint);
};

//Практиковаться в магии
func void TA_Practice_Magic(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Practice_Magic,waypoint);
};

//Упражняться с мечом
func void TA_Practice_Sword(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Practice_Sword,waypoint);
};

//Поклоняться Спящему (нет прим.)
func void TA_Pray_Sleeper_FP(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Pray_Sleeper_FP,waypoint);
};

//Молиться идолу Спящего (нет прим.)
func void TA_Pray_Sleeper(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Pray_Sleeper,waypoint);
};

//Молиться Инносу (или еще кому-нибудь), стоя на коленях
func void TA_Pray_Innos_FP(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Pray_Innos_FP,waypoint);
};

//Молиться Инносу (или еще кому-нибудь), припав на одно колено
func void TA_Pray_Innos(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Pray_Innos,waypoint);
};

//Ватрас (или еще кто) читает проповедь
func void TA_Preach_Vatras(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Preach_Vatras,waypoint);
};

//Читать книгу с книжного стенда
func void TA_Read_Bookstand(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Read_Bookstand,waypoint);
};

//Читать свиток
func void TA_Read_Scroll(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Read_Scroll,waypoint);
};

//Ремонтировать хижину (стучать молотком по чему-нибудь)
func void TA_Repair_Hut(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Repair_Hut,waypoint);
};

//Жарить падальжика на костре
func void TA_Roast_Scavenger(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Roast_Scavenger,waypoint);
};

//Бежать куда-то
func void TA_RunToWP(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_RunToWP,waypoint);
};

//Сидеть на лавке
func void TA_Sit_Bench(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Sit_Bench,waypoint);
};

//Сидеть у костра
func void TA_Sit_Campfire(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Sit_Campfire,waypoint);
};

//Сидеть на стуле
func void TA_Sit_Chair(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Sit_Chair,waypoint);
};

//Сидеть на троне (в кресле)
func void TA_Sit_Throne(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Sit_Throne,waypoint);
};

//Спать
func void TA_Sleep(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_GotoBed,waypoint);
};

//Поболтать
func void TA_Smalltalk(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Smalltalk,waypoint);
};

//Ковка на наковальне
func void TA_Smith_Anvil(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Smith_Anvil,waypoint);
};

//Ковка - охладить клинок
func void TA_Smith_Cool(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Smith_Cool,waypoint);
};

//Ковка - накалить клинок
func void TA_Smith_Fire(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Smith_Fire,waypoint);
};

//Ковка - заточить клинок
func void TA_Smith_Sharp(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Smith_Sharp,waypoint);
};

//Курить косяк
func void TA_Smoke_Joint(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Smoke_Joint,waypoint);
};

//Курить кальян
func void TA_Smoke_Waterpipe(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Smoke_Waterpipe,waypoint);
};

//Красться
func void TA_SneakToWp(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_SneakToWp,waypoint);
};

//Жонглировать факелами (нет прим., осталось от InExtremo, на тестовой модели работает кривовато)
func void TA_Spit_Fire(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Spit_Fire,waypoint);
};

//Стоять, скрестив руки
func void TA_Stand_ArmsCrossed(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Stand_ArmsCrossed,waypoint);
};

//Выпивать стоя
func void TA_Stand_Drinking(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Stand_Drinking,waypoint);
};

//Закусывать стоя
func void TA_Stand_Eating(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Stand_Eating,waypoint);
};

//Стоять на страже
func void TA_Stand_Guarding(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Stand_Guarding,waypoint);
};

//Стоять на месте
func void TA_Stand_WP(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Stand_WP,waypoint);
};

//Толочь траву (в чане)
func void TA_Stomp_Herb(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Stomp_Herb,waypoint);
};

//Подметать щеткой
func void TA_Sweep_FP(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Sweep_FP,waypoint);
};

//В трансе
func void TA_Trance(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Trance,waypoint);
};

//Умываться (нет прим., после обвала Барьера никто не моется)
func void TA_Wash_FP(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Wash_FP,waypoint);
};

//Подметать стоя (метлой)
func void TA_Stand_Sweeping(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Stand_Sweeping,waypoint);
};

//Рыхлить землю (мотыгой)
func void TA_Rake_FP(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Rake_FP,waypoint);
};


//Готовить на плите
func void TA_Cook_Stove(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Cook_Stove,waypoint);
};

//Пилить бревно
func void TA_Saw(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Saw,waypoint);
};

//Колдовать в магическом круге
func void TA_Circle(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Circle,waypoint);
};

//Ищущий (дементор) стоит
func void TA_Stand_Dementor(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Stand_Dementor,waypoint);
};

//Охранять Святой молот (для чего-то другого надо править ZS_Guard_Hammer)
func void TA_Guard_Hammer(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Guard_Hammer,waypoint);
};

//Изучать документ. Также вызывает землетрясения :-0
func void TA_Study_WP(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Study_WP,waypoint);
};

//Крепко спать - не реагирует на речь и тихие звуки (нет прим.)
func void TA_Sleep_Deep(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_GotoBed_Deep,waypoint);
};

//Будни призрака (стой на месте, жди пока придет ГГ)
func void TA_Ghost(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Ghost,waypoint);
};

//Беспокойный призрак - ходит туда-сюда
func void TA_GhostWusel(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_GhostWusel,waypoint);
};

//Смотреть концерт (ZS_Fire_Spit)
func void TA_WatchConcert(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_WatchConcert,waypoint);
};

//собирать грибы
func void TA_PickMushrooms(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_PickMushrooms,waypoint);
};

//тихо поболтать
func void TA_Silenttalk(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Silenttalk,waypoint);
};

//стрельба по мишени
func void TA_Practice_RangedWeapon(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Practice_RangedWeapon,waypoint);
};

//прятаться
func void TA_Hide(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Hide,waypoint);
};

//Поболтать
func void TA_Smalltalk_Drinking(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Smalltalk_Drinking,waypoint);
};

//Играть на гитаре
func void TA_Play_Guitar(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_Play_Guitar,waypoint);
};

//Охранять другого NPC
func void TA_GuardNpc(var int start_h,var int start_m,var int stop_h,var int stop_m,var string waypoint)
{
	TA_Min(self,start_h,start_m,stop_h,stop_m,ZS_GuardNpc,waypoint);
};
