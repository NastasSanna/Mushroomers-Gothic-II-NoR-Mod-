/**************************************************************************

								АТАКА
  
  Персонаж self (я) атакует цель other (он).
  Набор восприятий - минимальный + неожиданность. Добавлено восприятие
другого.
  Режим перемещения - бег.
  
  Смысл AIV_TAPOSITION:
	0 - я не звал стражу на помощь
	1 - звал 1 раз
	2 - звал 2 раза
 
***************************************************************************/

func void B_AssessSurprise()
{
	Npc_SetTarget(self,other);
	self.aivar[AIV_ATTACKREASON] = AR_GuildEnemy;
};


// НАЧАЛО =================================================================

func void ZS_Attack()
{
	////PrintSelfVsOther("Attack 1");
	// набор восприятий
	Perception_Set_Minimal();
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,B_AssessSurprise);
	// установить цель
	B_ValidateOther();
	// если не было загрузки игры 
	if(self.aivar[AIV_LOADGAME] == FALSE)
	{
		// пояснить причину атаки
		B_Say_AttackReason();
		// подумать, не лучше ли сбежать от него
		if(C_WantToFlee(self,other))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			Npc_SetTarget(self,other);
			AI_StartState(self,ZS_Flee,0,"");
			return;
		};
	};
	// если я еще не дерусь
	if(Npc_IsInFightMode(self,FMODE_NONE))
	{
		// приготовить оружие (еще не обнажить)
		AI_EquipBestRangedWeapon(self);
		AI_EquipBestMeleeWeapon(self);
	};
	// прекратить все, что делал до этого
	AI_Standup(self);
	B_StopLookAt(self);
	// повернуться к цели
	B_TurnToNpc(self,other);
	// перейти на бег
	AI_SetWalkMode(self,NPC_RUN);
	// сбросить счетчик предупреждений
	B_GuardPassageStatusReset(self);
	// запомнить криминальную репутацию ГГ на начало драки
	self.aivar[AIV_LastAbsolutionLevel] = B_GetCurrentAbsolutionLevel(self);
	// сбросить переменные состояний
	self.aivar[AIV_PursuitEnd] = FALSE;
	self.aivar[AIV_StateTime] = 0;
	self.aivar[AIV_TAPOSITION] = 0;
	self.aivar[AIV_HitByOtherNpc] = 0;
	self.aivar[AIV_SelectSpell] = 0;
	Npc_SetStateTime(self,0);
};

// ЦИКЛ ===================================================================

func int ZS_Attack_Loop()
{
	////PrintSelfVsOther("Attack Loop 1");
	// нацелиться на врага
	Npc_GetTarget(self);
	
	// Прекращение атаки ---------------------------------------------------
	
	// если он слишком далеко
	if ((self.aivar[AIV_FightDistCancel] > 0) && Npc_GetDistToNpc(self,other) > self.aivar[AIV_FightDistCancel]) 
	{
		// прекратить атаку и преследование
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		return LOOP_END;
	};

	////PrintSelfVsOther("Attack Loop 2");
	// Преследование -------------------------------------------------------
	
	// если я уже долго бегу за ним, но еще не прекратил преследование
	if((Npc_GetStateTime(self) > self.aivar[AIV_MM_FollowTime]) && (self.aivar[AIV_PursuitEnd] == FALSE))
	{
		// прекратить
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		// запомнить расстояние и длительность преследования
		self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
		self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
		// если он человек - прокоментировать
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			if (other.aivar[AIV_Gender] == MALE)	{
				B_Say(self,other,"$RUNCOWARD");
			}
			else	{
				B_Say(self,other,"$RUNCOWARD_F");
			};
		};
	};
	
	// если преследование завершено
	if(self.aivar[AIV_PursuitEnd] == TRUE)
	{
		// если я его не чувствую
		if(Npc_GetDistToNpc(self,other) > self.senses_range)
		{
			// прекратить атаку
			return LOOP_END;
		};
		// он в пределах видимости (слышимости, обоняемости) -----v
		// если я жду уже сколько-то времени
		if(Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
		{
			// если он приблизился или перестал убегать, но не спрятался в воде
			if(((Npc_GetDistToNpc(self,other) < self.aivar[AIV_Dist])
					|| (!C_BodyStateContains(other,BS_RUN) && !C_BodyStateContains(other,BS_JUMP)))
				&& (C_WantToFollowInWater(self, other)))
			{
				// отменить прекращение преследования
				self.aivar[AIV_PursuitEnd] = FALSE;
				// сброс времени ожидания
				Npc_SetStateTime(self,0);
				self.aivar[AIV_StateTime] = 0;
			}
			// иначе
			else
			{
				// повренуться к нему
				B_TurnToNpc(self,other);
				// запомнить, где он и сколько времени я жду
				self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
				self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
			};
		};
		// больше ничего не делать
		return LOOP_CONTINUE;
	};
	
	//PrintSelfVsOther("Attack Loop 3");
	// Криминал ---------------------------------------------------------------
	// если репутация ГГ повысилась
	if(C_NpcIsHero(other) && (B_GetCurrentAbsolutionLevel(self) > self.aivar[AIV_LastAbsolutionLevel]) )
	{
		// прекратить атаку
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	
	//PrintSelfVsOther("Attack Loop 4");
	// Плавание ----------------------------------------------------------------
	// если он плывет или нырнул, а я не хочу лезть в воду
	if(!C_WantToFollowInWater(self, other))
	{
		// прекратить преследование
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		return LOOP_CONTINUE;
	};
	
	// если я попал-таки в воду, но не хотел этого
	if((C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		&& (!HasFlags(self.aivar[AIV_MM_Behaviour], BEHAV_FollowInWater)))
	{
		// прекратить атаку и преследование
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		AI_StartState(self, ZS_MM_GetOutOfWater, 0, "");
		return LOOP_END;
	};
	
	//PrintSelfVsOther("Attack Loop 5");
	// Задержка атаки ----------------------------------------------------------
	// если надо, подождать перед атакой
	if(self.aivar[AIV_WaitBeforeAttack] >= 1)
	{
		AI_Wait(self,0.8);
		// больше ждать не надо
		self.aivar[AIV_WaitBeforeAttack] = 0;
	};
	
	// Расстояние до "дома" ----------------------------------------------------
	// если мне нельзя далеко уходить от дома
	if(self.aivar[AIV_MaxDistToWp] > 0)
	{
		// проверить, не ушли ли мы оба слишком далеко
		if((Npc_GetDistToWP(self,self.wp) > self.aivar[AIV_MaxDistToWp])
			&& (Npc_GetDistToWP(other,self.wp) > self.aivar[AIV_MaxDistToWp]))
		{
			// перейти в режим боя "на посту"
			self.fight_tactic = FAI_NAILED;
		}
		else
		{
			// если нет - вернуться к своему обычному стилю
			self.fight_tactic = self.aivar[AIV_OriginalFightTactic];
		};
	};

	// Амуниция ---------------------------------------------------------------
	// создать боеприпасы
	B_CreateAmmo(self);
	// выбрать подходящее оружие
	B_SelectWeapon(self,other);
	
	
	// арена -------------------------------------------------------------------
	// на арене все честно
	if((self.aivar[AIV_ArenaFight] == AF_RUNNING) && Npc_IsPlayer(other))
	{ 
		//сражаемся только правильным оружием
		if (Npc_IsInFightMode(other,FMODE_FAR) || Npc_IsInFightMode(other,FMODE_MAGIC))	{
			self.aivar[AIV_ArenaFight] = AF_WRONG_WEAPON;
			//попытаться остановить ГГ словом
			B_AssessTalk();
			if(self.aivar[AIV_NpcStartedTalk] == TRUE)	{
				self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_CANCEL;
				return LOOP_END;
			};
		};
		//ГГ убрал оружие, ждем, потом отменяем бой
		if (Npc_IsInFightMode(other,FMODE_NONE))	{
			if (Npc_GetStateTime(self) < 7)	{
				return LOOP_CONTINUE;
			}
			else	{
				self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_CANCEL;
				self.aivar[AIV_ArenaFight] = AF_AFTER;
				return LOOP_END;
			};
		};
		//*/
	};

	
	// Вызов стражи ------------------------------------------------------------
	/* Через 2 и 8 секунд бегства врага */
	
	// если он не спасается бегством
	if(!C_BodyStateContains(other,BS_RUN) && !C_BodyStateContains(other,BS_JUMP))
	{
		// сброс времени
		Npc_SetStateTime(self,0);
	};
	
	// если прошло уже больше 2 секунд, и я еще не звал стражу
	if((Npc_GetStateTime(self) > 2) && (self.aivar[AIV_TAPOSITION] == 0))
	{
		// позвать
		B_CallGuards();
		// запомнить, что звал 1 раз
		self.aivar[AIV_TAPOSITION] = 1;
	};
	
	// если прошло уже 8 секунд, и я уже один раз звал стражу
	if((Npc_GetStateTime(self) > 8) && (self.aivar[AIV_TAPOSITION] == 1))
	{
		// позвать еще раз
		B_CallGuards();
		// запомнить, что звал 2 раза
		self.aivar[AIV_TAPOSITION] = 2;
	};

	//PrintSelfVsOther("Attack Loop 6");
	// Атака ------------------------------------------------------------------
	// если он все еще здесь и не повержен
	if(Hlp_IsValidNpc(other) && (C_NpcIsDown(other) == FALSE))
	{
		if(other.aivar[AIV_INVINCIBLE] == FALSE)	// если он доступен
		{
			// напасть
			//PrintSelfVsOther("Attack 2");
			AI_Attack(self);
		}
		else	// если не доступен
		{
			//PrintSelfVsOther("Attack 3");
			// сбросить все задачи
			Npc_ClearAIQueue(self);
		};
		// запомнить, что я на него нападал
		self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
		// больше ничего не делать
		return LOOP_CONTINUE;
	};
	
	//PrintSelfVsOther("Attack Loop None");
	// Атаки НЕТ ---------------------------------------------------------------
	// он повержен, или его вообще нет 
	
	// сбросить все
	Npc_ClearAIQueue(self);
	
	// если он - поверженный ГГ
	if(Hlp_IsValidNpc(other) && Npc_IsPlayer(other) && C_NpcIsDown(other))
	{
		// сбросить временное отношение к ГГ на обычное
		Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	};
	
	// Поиск НОВОГО ВРАГА -------------------------------------------------------
	// если я не хочу немедленно убить поверженного
	if(self.aivar[AIV_ATTACKREASON] != AR_KILL)
	{
		// переключиться на следующего врага
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
	};
	
	// если		
	if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other)		// он есть и не повержен
		&& ((Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) || Npc_IsPlayer(other)) // и он близко или он ГГ
		&& (Npc_GetHeightToNpc(self,other) < PERC_DIST_HEIGHT)	// и он не слишком высоко (даже если ГГ)
		&& (other.aivar[AIV_INVINCIBLE] == FALSE))	// и он доступен
	{
		// если мы во враждебных гильдиях
		if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_HOSTILE)
		{
			// запомнить причну нападения
			self.aivar[AIV_ATTACKREASON] = AR_GuildEnemy;
			// если он ГГ
			if(Npc_IsPlayer(other))
			{
				// запомнить причину нападения на ГГ и что сражение отменено
				self.aivar[AIV_LastPlayerAR] = AR_GuildEnemy;
				self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_CANCEL;
				// запомнить, что драку надо прокомментировать
				self.aivar[AIV_LastFightComment] = FALSE;
			};
		}
		// иначе - мы не во враждебных гильдиях, но мы враги
		else if(C_NpcGetAttitude(self,other) == ATT_HOSTILE)
		{
			// причина атаки та же, что и причина драки с ГГ
			self.aivar[AIV_ATTACKREASON] = self.aivar[AIV_LastPlayerAR];
		};
		// больше ничего не надо, атака продолжается
		return LOOP_CONTINUE;
	};
	// иначе - нового врага нет, он повержен, далеко, недоступен или притворился моим другом-бандитом
	
	// сбросить все задачи
	Npc_ClearAIQueue(self);
	// если последняя драка с ГГ отменена и моя последняя цель - не ГГ
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		&& (self.aivar[AIV_LASTTARGET] != Hlp_GetInstanceID(hero)))
	{
		// не надо комментировать драку
		self.aivar[AIV_LastFightComment] = TRUE;
	};
	// прекратить атаку
	return LOOP_END;
};

// КОНЕЦ ==================================================================

func void ZS_Attack_End()
{
	// верификация цели
	other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	
	// если я прекратил преследование
	if(self.aivar[AIV_PursuitEnd] == TRUE)
	{
		// если он ГГ, и я не его друг
		if(Hlp_IsValidNpc(other) && Npc_IsPlayer(other) && (self.npcType != NPCTYPE_FRIEND))
		{
			// запомнить, что мы враги
			Npc_SetTempAttitude(self,ATT_HOSTILE);
		};
		// если было сражение на арене, запомнить, что оно закончилось
		if(self.aivar[AIV_ArenaFight] == AF_RUNNING)
		{
			self.aivar[AIV_ArenaFight] = AF_AFTER;
		};
	}
	// Комментарий --------------------------------------------------------------------
	else	// иначе
	{
		// если он исправился
		if(B_GetCurrentAbsolutionLevel(self) > self.aivar[AIV_LastAbsolutionLevel])
		{
			// сказать, что он молодец
			if (other.aivar[AIV_Gender] == MALE)	{
				B_Say(self,other,"$WISEMOVE");
			}
			else	{
				B_Say(self,other,"$WISEMOVE_F");
			};
		}
		else	// иначе - обычный комментарий к драке
		{
			B_Say_AttackEnd();
		};
	};
	//запоминаем результат драки с ГГ (нужно, т.к. могут нападать группой - а победили все)
	if (Hlp_IsValidNpc(other) && Npc_IsPlayer(other))	{
		//если ГГ побежден - я считаю себя победителем, даже если не я нанес последний удар
		if (C_NpcIsDown(other))	{
			self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_WON;
		}
		//иначе - драка с ГГ отменена
		else	{
			self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_CANCEL;
		};
	};
	// если его убил ГГ и мы не с ГГ не во вражеских гильдиях
	if((other.aivar[AIV_KilledByPlayer] == TRUE) && (Wld_GetGuildAttitude(self.guild,hero.guild) != ATT_HOSTILE))
	{
		// сделать его другом
		B_SetAttitude(self,ATT_FRIENDLY);
	};
	// если он упал без сознания, а у меня был повод убить его
	if(Npc_IsInState(other,ZS_Unconscious) && C_NpcHasAttackReasonToKill(self))
	{
		// добить поверженного
		B_FinishingMove(self,other);
	};
	// убрать оружие
	B_RemoveWeapon(self);
	// Трофеи --------------------------------------------------------------------
	// если он повержен, и я хочу его обобрать, и он не слишком далеко
	if(C_NpcIsDown(other) && C_WantToRansack(self)
		&& ((other.aivar[AIV_RANSACKED] == FALSE) || C_NpcRansacksAlways(self))
		&& (!HasFlags(self.aivar[AIV_Behaviour], BEHAV_NeverRansack))
		&& (Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT))
	{
		// отметить, что уже обобрал
		other.aivar[AIV_RANSACKED] = TRUE;
		// если он человек
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			// начать обшаривать
			AI_StartState(self,ZS_RansackBody,0,"");
			// больше ничего
			return;
		}
		// иначе - он не человек
		// и если я Аллигатор Джек, и у него есть мясо
		else if(C_NpcIs(self,OUT_1230_Trocar) && (Npc_HasItems(other,ItFoMuttonRaw) > 0))
		{
			// начать добывать мясо
			AI_StartState(self,ZS_GetMeat,0,"");
			// больше ничего
			return;
		};
	};
	// если у меня меньше половины здоровья
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		// вылечиться
		AI_StartState(self,ZS_HealSelf,0,"");
		// больше ничего
		return;
	};
};




