/**************************************************************************

								НАПАДЕНИЕ
 
  B_Attack	(slf,	oth,	attack_reason,	wait)
  Персонаж slf (я) нападет на oth (он) по причине attack_reason немедленно
(wait = FALSE) или с задержкой 0.8 сек. (wait = TRUE)
  
  Выполняется обработка причины нападения и slf переводится в состояние
ZS_Attack.

  Если slf уже атаковал oth, то причина нападения может измениться на более
серьезную, напр. кража на убийство.
  
***************************************************************************/



func void B_Attack(var C_Npc slf,var C_Npc oth,var int attack_reason,var int wait)
{
	PrintSelfVsOther("B_Attack 1");
	// установить наличие задержки перед атакой (исп. в ZS_Attack и ZS_MM_Attack)
	slf.aivar[AIV_WaitBeforeAttack] = wait;
	
	// если причина нападения - ярость
	if(attack_reason == AR_SuddenEnemyInferno)
	{
		// отменить запрет на нападение
		slf.aivar[AIV_EnemyOverride] = FALSE;
		// послать окружающим восприятие шума сражения
		Npc_SendPassivePerc(slf,PERC_ASSESSFIGHTSOUND,slf,oth);
	};
	
	// если я сейчас разговариваю с ГГ
	if(Npc_IsInState(slf,ZS_Talk))
	{
		// сбросить флаги недоступности для обоих
		slf.aivar[AIV_INVINCIBLE] = FALSE;
		oth.aivar[AIV_INVINCIBLE] = FALSE; //PB: ОСТОРОЖНО! изредка в диалогах может быть другая цель - тогда проставить вручную (Сифер нападает на Дара)
	};
	
	// если я уже с ним сражаюсь
	if(Npc_IsInState(slf,ZS_Attack) && (Hlp_GetInstanceID(oth) == slf.aivar[AIV_LASTTARGET]))
	{
		// и если я не собираюсь его убить, а новая причина нападения серьезнее прежней
		if(!C_NpcHasAttackReasonToKill(slf) && (attack_reason > slf.aivar[AIV_ATTACKREASON]))
		{
			// запомнить новую причину нападения
			slf.aivar[AIV_ATTACKREASON] = attack_reason;
			// если он ГГ
			if(Npc_IsPlayer(oth))
			{
				// то запомнить причину нападения на ГГ
				slf.aivar[AIV_LastPlayerAR] = attack_reason;
			};
		};
	}
	else // если я до этого не сражался или сражался с кем-то другим
	{
		// запомнить причину нападения
		slf.aivar[AIV_ATTACKREASON] = attack_reason;
		// и, при необходимости, - причину нападения на ГГ
		if(Npc_IsPlayer(oth))
		{
			slf.aivar[AIV_LastPlayerAR] = attack_reason;
		};
	};
	
	// ПРЕСТУПЛЕНИЯ ---------------------------------------------------
	
	// запомнить преступление ГГ если
	if (NPC_IsPlayer(oth))
	{
		// причина нападения - убийство овцы
		if (slf.aivar[AIV_ATTACKREASON] == AR_SheepKiller)
		{
			B_MemorizePlayerCrime(slf,oth,CRIME_SHEEPKILLER);
		};
		
		// я отвечаю на нападение или угрозу
		if((slf.aivar[AIV_ATTACKREASON] == AR_ReactToDamage) || (slf.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)
			|| (slf.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight))	//NS - или стражник остановил драку
		{
			// но я не крутой, и ГГ не мой друг
			if(!C_NpcIsToughGuy(slf) && !(slf.npcType == NPCTYPE_FRIEND))
			{
				B_MemorizePlayerCrime(slf,oth,CRIME_ATTACK);
			};
		}; 
			
		// причина нападения - кража или ее попытка (ГГ влез в сундук)
		if((slf.aivar[AIV_ATTACKREASON] == AR_Theft) || (slf.aivar[AIV_ATTACKREASON] == AR_UseMob))
		{
			B_MemorizePlayerCrime(slf,oth,CRIME_THEFT);
		};
		
		// причина нападения - убийство
		if(slf.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
		{
			B_MemorizePlayerCrime(slf,oth,CRIME_MURDER);
		};
	};
	
	// -----------------------------------------------------------------
	
	// если я уже сражаюсь 
	if(Npc_IsInState(slf,ZS_Attack))
	{
		slf.aivar[AIV_PursuitEnd] = FALSE; // сбросить прекращение преследования
		return;// то больше ничего не делать
	};
	
	// если я напал, чтобы убить
	if(slf.aivar[AIV_ATTACKREASON] == AR_KILL)
	{
		// установить враждебное отношение
		B_SetAttitude(slf,ATT_HOSTILE);
	};
	
	// если он ГГ
	if(Npc_IsPlayer(oth))
	{
		// сбросить результаты последнего сражения
		slf.aivar[AIV_LastFightAgainstPlayer] = FIGHT_CANCEL;
		// и его комментарий
		slf.aivar[AIV_LastFightComment] = FALSE;
	};
	
	// если я не разговариваю, и не было диалога кражи во сне
	if(!Npc_IsInState(slf,ZS_Talk))
	{
		// если ГГ шарил по моим карманам (диалог уже прерван)
		if ((HERO_ACTION_Pickpocket == PICKPOCKET_Fail) && (HERO_ACTION_Pickpocket_Victim == Hlp_GetInstanceID(self)))
		{
			HERO_ACTION_Pickpocket = PICKPOCKET_None;	// сброс
		}
		else
		{
			// отменить все другие действия
			Npc_ClearAIQueue(slf);
		};
	};
	
	// сбросить все восприятия
	B_ClearPerceptions(slf);
	
	// прицелиться
	Npc_SetTarget(slf,oth);
	
	// если я лежу
	if(C_BodyStateContains(slf,BS_LIE))
	{
		// перейти в состояние атаки после того, как встану
		AI_StartState(slf,ZS_Attack,1,"");
	}
	else // если не лежу
	{
		// перейти в состояние атаки немедленно
		AI_StartState(slf,ZS_Attack,0,"");
	};
};

