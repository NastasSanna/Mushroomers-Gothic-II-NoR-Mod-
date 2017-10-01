/**************************************************************************

                              ВОСПРИЯТИЕ
							   
  Функции, связанные с восприятием (реакция на происходящее вокруг). 
  Активные восприятия (напр., игрока, врага) - действуют только через
чувства (зрение, слух, обоняние). Зона действия - около 180 градусов перед
персонажем, расстояние задается в поле senses_range класса C_NPC.
//NS: только для зрения и слуха! обоняние действует на 360 градусов
  Пассивные воприятия - во всех направлениях, расстояние определяется при 
инициализации (см. ниже).
//NS: пассивные восприятия ASSESSFIGHTSOUND и PERC_ASSESSQUIETSOUND
действуют, даже если слуха нет

  Связаные файлы:
 типы восприятий (PERC_ASSESSx)  				_Intern\Constants.d
 константы расстояний (PERC_DIST_x) 			AI_Constants.d
 функции обработки восприятий 
   для людей (B_ASSESSx)						AI\Human\Human\B_Human
   для монстров (B_MM_ASSESSx) 					AI\Monster\B_Monster
 
***************************************************************************/

// ИНИЦИАЛИЗАЦИЯ ВОСПРИЯТИЙ ------------------------------------------------
/* В скриптах не вызывается. */

func void InitPerceptions()
{ //устанавливается дальность действия для пассивных восприятий
	//NS: на этих расстояниях запускается соответствующий обработчик восприятия,
	//но в нем может быть дополнительная проверка и реально персонаж будет реагировать с меньшего расстояния
	// сражение
	Perc_SetRange	(PERC_ASSESSDAMAGE,			9999); //PB: дальность действия не учитывается движком!
	Perc_SetRange	(PERC_ASSESSOTHERSDAMAGE,	PERC_DIST_INTERMEDIAT);
	Perc_SetRange	(PERC_ASSESSDEFEAT,			WATCHFIGHT_DIST_MAX);
	Perc_SetRange	(PERC_ASSESSMURDER,			PERC_DIST_ACTIVE_MAX);
	Perc_SetRange	(PERC_ASSESSTHREAT,			PERC_DIST_INTERMEDIAT); //PB: БАГ! дальность действия, вероятно, не учитывается
	Perc_SetRange	(PERC_DRAWWEAPON,			PERC_DIST_DIALOG);
	// звуки
	Perc_SetRange	(PERC_ASSESSFIGHTSOUND,		3000); //PB: почти всегда сокращается до PERC_DIST_INTERMEDIAT
	Perc_SetRange	(PERC_ASSESSQUIETSOUND,		PERC_DIST_INTERMEDIAT);
	// действия
	Perc_SetRange	(PERC_ASSESSTHEFT,			PERC_DIST_INTERMEDIAT);
	Perc_SetRange	(PERC_ASSESSUSEMOB,			PERC_DIST_INTERMEDIAT);
	Perc_SetRange	(PERC_ASSESSENTERROOM,		PERC_DIST_INTERMEDIAT);
	// магия 
	Perc_SetRange	(PERC_ASSESSMAGIC,			9999); //PB: дальность действия не учитывается движком!
	Perc_SetRange	(PERC_ASSESSSTOPMAGIC,		9999); //PB: дальность действия не учитывается движком!
	// речь
	Perc_SetRange	(PERC_ASSESSTALK,			PERC_DIST_DIALOG);
	Perc_SetRange	(PERC_ASSESSWARN,			PERC_DIST_INTERMEDIAT); //PB: восприятие полностью реализовано в скриптах!
	// другие
	Perc_SetRange	(PERC_MOVEMOB,				PERC_DIST_DIALOG);
	Perc_SetRange	(PERC_ASSESSSURPRISE,		FIGHT_DIST_CANCEL);
	Perc_SetRange	(PERC_OBSERVEINTRUDER,		100);
	Perc_SetRange	(PERC_ASSESSREMOVEWEAPON,	100);
	Perc_SetRange	(PERC_CATCHTHIEF,			100);
	Perc_SetRange	(PERC_ASSESSCALL,			100);
	Perc_SetRange	(PERC_MOVENPC,				100);
	Perc_SetRange	(PERC_ASSESSCASTER,			100);
	Perc_SetRange	(PERC_NPCCOMMAND,			PERC_DIST_ACTIVE_MAX);
	Perc_SetRange	(PERC_OBSERVESUSPECT,		100);
};

// УСТАНОВКА ВОСПРИЯТИЙ --------------------------------------------------------
/* Устанавливаются для себя (self).
   Вызываются в функциях обработки поведения ZS_x */

//Нормальное восприятие (в обычном состоянии для людей)
func void Perception_Set_Normal()
{
	//Чувства
	self.senses = SENSE_HEAR | SENSE_SEE;		//слух, зрение
	self.senses_range = PERC_DIST_ACTIVE_MAX;	//дистанция восприятия - максимальная
	
	//Частота обработки восприятий
	if(Npc_KnowsInfo(self,1) || C_NpcIsGateGuard(self) || HasFlags(self.aivar[AIV_Temper], TEMPER_BodyGuard))
	//если персонаж	знает что-то важное или он охраниик у ворот
	{ //то
		Npc_SetPercTime(self,0.3);	//каждые 0.3 сек.
	}
	else
	{ //иначе
		Npc_SetPercTime(self,1);	//каждую 1 сек.
	};
	
	//Приоритет восприятий (задается порядком их активации)
	// активные
	Npc_PercEnable(self,PERC_ASSESSPLAYER,		B_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,		B_AssessEnemy);
	// пассивные
	Npc_PercEnable(self,PERC_ASSESSMAGIC,		B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,		B_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,		B_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,		B_AssessTheft);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,		B_AssessUseMob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,	B_AssessPortalCollision);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,		B_AssessThreat);
	Npc_PercEnable(self,PERC_DRAWWEAPON,		B_AssessDrawWeapon);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,	B_AssessFightSound);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,	B_AssessQuietSound);
	Npc_PercEnable(self,PERC_ASSESSWARN,		B_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSTALK,		B_AssessTalk);
	Npc_PercEnable(self,PERC_MOVEMOB,			B_MoveMob);
};

//Минимальный набор восприятий (человек на чем-то сосредоточен)
func void Perception_Set_Minimal()
{
	//Чувства
	self.senses = SENSE_HEAR | SENSE_SEE;		//слух, зрение
	self.senses_range = PERC_DIST_ACTIVE_MAX;	//дистанция восприятия - максимальная
	
	//Приоритет восприятий (задается порядком их активации)
	// пассивные
	Npc_PercEnable(self,PERC_ASSESSMAGIC,		B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,		B_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,		B_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,		B_AssessTheft);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,		B_AssessUseMob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,	B_AssessPortalCollision);
	Npc_PercEnable(self,PERC_MOVEMOB,			B_MoveMob);
};

//Отключение воприятий (напр., при магическом сне, во время атаки)
func void B_ClearPerceptions(var C_Npc slf)
{
	// активные
	Npc_PercDisable(slf,PERC_ASSESSPLAYER);
	Npc_PercDisable(slf,PERC_ASSESSENEMY);
	Npc_PercDisable(slf,PERC_ASSESSBODY);
	// пассивные
	Npc_PercDisable(slf,PERC_ASSESSMAGIC);
	Npc_PercDisable(slf,PERC_ASSESSDAMAGE);
	Npc_PercDisable(slf,PERC_ASSESSMURDER);
	Npc_PercDisable(slf,PERC_ASSESSTHEFT);
	Npc_PercDisable(slf,PERC_ASSESSUSEMOB);
	Npc_PercDisable(slf,PERC_ASSESSENTERROOM);
	Npc_PercDisable(slf,PERC_ASSESSTHREAT);
	Npc_PercDisable(slf,PERC_DRAWWEAPON);
	Npc_PercDisable(slf,PERC_ASSESSFIGHTSOUND);
	Npc_PercDisable(slf,PERC_ASSESSQUIETSOUND);
	Npc_PercDisable(slf,PERC_ASSESSWARN);
	Npc_PercDisable(slf,PERC_ASSESSTALK);
	Npc_PercDisable(slf,PERC_MOVEMOB);
	Npc_PercDisable(slf,PERC_ASSESSOTHERSDAMAGE);
	Npc_PercDisable(slf,PERC_ASSESSSTOPMAGIC);
	Npc_PercDisable(slf,PERC_ASSESSSURPRISE);
};

//Восприятие для монстров во время действий по расписанию и при охоте
func void Perception_Set_Monster_Rtn()
{
	// частота обработки восприятий 
	Npc_SetPercTime(self,1);		// 1 раз в сек.
	//Приоритет восприятий (задается порядком их активации)
	// активные
	Npc_PercEnable(self,PERC_ASSESSENEMY,		B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSBODY,		B_MM_AssessBody);
	//для "говорящих"
	if (HasFlags(self.aivar[AIV_Behaviour],BEHAV_MM_Talk))	{
		Npc_PercEnable(self,PERC_ASSESSTALK,		B_AssessTalk);
	};
	// пассивные
	Npc_PercEnable(self,PERC_ASSESSMAGIC,		B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,		B_MM_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_AssessOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,		B_MM_AssessOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSWARN,		B_MM_AssessWarn);
};


