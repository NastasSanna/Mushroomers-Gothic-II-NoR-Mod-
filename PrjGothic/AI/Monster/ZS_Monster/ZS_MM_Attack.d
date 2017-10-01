/**************************************************************************

							МОНСТР АТАКУЕТ
  
  Монстр self (я) атакует цель other (он).
  Набор восприятий - специальный (тело, магия, повреждение, предупреждение,
неожиданность). Добавлено повреждение другого, для учета урона ГГ.
  Режим перемещения - бег.
  
  Овца всегда убегает.
 
***************************************************************************/

// Восприятие: неожиданность
func void B_MM_AssessSurprise()
{
	// переключиться на цель
	Npc_SetTarget(self,other);
};

// НАЧАЛО =================================================================

func void ZS_MM_Attack()
{
	// восприятия
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,B_MM_AssessSurprise);
	// проверка противника
	B_ValidateOther();
	// овца убегает
	if(self.guild == GIL_SHEEP)
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_MM_Flee,0,"");
		return;
	};
	// перейти на бег
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	// предупредить всех
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
	// сброс переменных
	self.aivar[AIV_PursuitEnd] = FALSE;
	self.aivar[AIV_StateTime] = 0;
	self.aivar[AIV_HitByOtherNpc] = 0;
	self.aivar[AIV_SelectSpell] = 0;
	self.aivar[AIV_TAPOSITION] = 0;
};

// ЦИКЛ ====================================================================

func int ZS_MM_Attack_Loop()
{
	Npc_GetTarget(self);
	// Проверка времени жизни призванного существа
	//NS: перепроверить, счетчики времени в этом цикле часто сбрасываются!
	if(HasFlags(self.aivar[AIV_Behaviour], BEHAV_Summoned) && (Npc_GetStateTime(self) > 0))
	{
		// если self.aivar[AIV_SummonedTime] == -1, то время призыва не ограничено
		if (self.aivar[AIV_SummonedTime] >= 0)	{
			//время вышло?
			if (self.aivar[AIV_SummonedTime] <= Npc_GetStateTime(self))	{
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS]);
			};
		};
	};
	// Проверка расстояния до цели
	if((Npc_GetDistToNpc(self,other) > FIGHT_DIST_CANCEL) || (Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT))
		// если слишком далеко
	{
		// прекратить атаку
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		return LOOP_END;
	};
	// Проверка длительности преследования
	if((Npc_GetStateTime(self) > self.aivar[AIV_MM_FollowTime])	&& (self.aivar[AIV_PursuitEnd] == FALSE))
		// если время преследования истекло
	{
		// остановиться
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
		self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
		// и угрожать
		AI_PlayAni(self,"T_WARN");
	};
	// Преследование завершено
	if(self.aivar[AIV_PursuitEnd] == TRUE)
	{
		// если я потерял его, закончить атаку
		if(Npc_GetDistToNpc(self,other) > self.senses_range)
		{
			return LOOP_END;
		};
		// если прошло сколько-то времени
		if(Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
		{
			// если он все еще прячется в воде
			if (!C_WantToFollowInWater(self, other))
			{
				// если он приблизился (с точностью до дм)
				if (Npc_GetDistToNpc(self,other) / 10 < self.aivar[AIV_Dist] / 10)
				{
					// сбросить время ожидания
					Npc_SetStateTime(self, 1);
				};
				// если я жду уже долго
				if (Npc_GetStateTime(self) > self.aivar[AIV_MM_FollowTime])
				{
					// остановиться и угрожать
					Npc_ClearAIQueue(self);
					AI_Standup(self);
					B_MM_DeSynchronize();
					AI_PlayAni(self,"T_WARN");
					// прекратить атаку
					return LOOP_END;
				};
				// иначе 
				// повернуться к нему, засечь дистанцию и время
				AI_TurnToNPC(self,other);
				self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
				self.aivar[AIV_StateTime] = Npc_GetStateTime(self);			
			}
			// если он приблизился или не спасается бегством, и не прячется в воде
			else if ((Npc_GetDistToNpc(self,other) < self.aivar[AIV_Dist])
					|| (!C_BodyStateContains(other,BS_RUN) && !C_BodyStateContains(other,BS_JUMP)))
			{
				// продолжить преследование/атаку
				self.aivar[AIV_PursuitEnd] = FALSE;
				Npc_SetStateTime(self,0);
				self.aivar[AIV_StateTime] = 0;
			}
			else // иначе
			{
				// повернуться к нему, засечь расстояние и время
				AI_TurnToNPC(self,other);
				self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
				self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
			};
		};
		return LOOP_CONTINUE;
	};
	// Проверка преследования в воде
	// если он плывет или нырнул, а я не хочу лезть в воду
	if(!C_WantToFollowInWater(self, other))
	{
		// прекратить преследование
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		Npc_SetStateTime(self, 0);
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
		// выбраться из воды
		AI_StartState(self, ZS_MM_GetOutOfWater, 0, "");
		return LOOP_END;
	};
	// Задержка перед атакой
	if(self.aivar[AIV_WaitBeforeAttack] == TRUE)
	{
		AI_Wait(self,0.8);
		self.aivar[AIV_WaitBeforeAttack] = FALSE;
	};
	// сбросить счетчик времени, если он не спасается бегством
	if(!C_BodyStateContains(other,BS_RUN) && !C_BodyStateContains(other,BS_JUMP) && (Npc_GetStateTime(self) > 0))
	{
		Npc_SetStateTime(self,0);
		self.aivar[AIV_StateTime] = 0;
	};
	// Проверка на привязку к дому
	if(self.aivar[AIV_MaxDistToWp] > 0)
		// если мне нельзя далеко уходить
	{
		if((Npc_GetDistToWP(self,self.wp) > self.aivar[AIV_MaxDistToWp])
			&& (Npc_GetDistToWP(other,self.wp) > self.aivar[AIV_MaxDistToWp]))
			// если мы слишком далеко ушел от дома
		{
			self.fight_tactic = FAI_NAILED; // сражаться, не сходя с места
		}
		else // иначе
		{
			self.fight_tactic = self.aivar[AIV_OriginalFightTactic]; // вернуться к обычному бою
		};
	};
	// Перезарядка и выбор оружия
	// если я сражаюсь магией или я скелет или орк
	if(C_NpcIsMonsterMage(self)
		|| (self.guild == GIL_SKELETON) || (self.guild == GIL_SUMMONED_SKELETON) || (self.guild > GIL_SEPERATOR_ORC))
	{
		// создать заряды, восстановить ману и выбрать оружие (заклинание)
		B_CreateAmmo(self);
		Npc_ChangeAttribute(self,ATR_MANA,ATR_MANA_MAX);
		B_SelectWeapon(self,other);
	};
	
	// Атака
	// если он еще не повержен
	if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
	{
		// и он доступен
		if(other.aivar[AIV_INVINCIBLE] == FALSE)
		{
			// напасть
			AI_Attack(self);
		}
		else // если недоступен
		{
			// сброс
			Npc_ClearAIQueue(self);
		};
		// запомнить, на кого нападали
		self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
		// больше ничего не надо
		return LOOP_CONTINUE;
	}
	else // если он повержен или не определен
	{
		// если мне хочется его скушать
		if((!HasFlags(self.aivar[AIV_MM_Behaviour], BEHAV_AttackPriority)) && C_WantToEat(self,other))
		{
			// закончить атаку
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			return LOOP_END;
		};
		// если не хочется его есть
		// найти следующую цель
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
		// если цель подходящая
		if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other) 
			&& ((Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) 
		|| Npc_IsPlayer(other)) && (other.aivar[AIV_INVINCIBLE] == FALSE))
		{
			// запомнить новую цель и продолжить атаку
			self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
			return LOOP_CONTINUE;
		}
		else // если цель не подходящая
		{
			// закончить атаку
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			return LOOP_END;
		};
	};
	return LOOP_CONTINUE;
};

// ЗАВЕРШЕНИЕ ================================================================

func void ZS_MM_Attack_End()
{
	// нацелиться на последнюю жертву 
	other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	// если я монстр с оружием - убрать
	if(C_NpcIsMonsterMage(self)
		|| (self.guild == GIL_SKELETON) || (self.guild == GIL_SUMMONED_SKELETON) || (self.guild > GIL_SEPERATOR_ORC))
	{
		AI_RemoveWeapon(self);
	};
	// если я его убил и хочу съесть
	if(Npc_IsDead(other) && C_WantToEat(self,other))
	{
		// приступить к трапезе
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MM_EatBody,0,"");
		return;
	};
};


