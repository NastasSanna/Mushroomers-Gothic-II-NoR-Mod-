/**************************************************************************

								БЕГСТВО

  Монстр self (я) спасается бегством от other (он).
  
  Бегство прекращается, если удалось оторваться от преследователя. Монстр
будет предупреждать окружающих об угрозе.
  Добавлено: спустя некоторое время, есть вероятность, что монстр прекратит 
бегство.
  
  Набор восприятий - только врага, магии, повреждения.
  Режим перемещения - бег.
  
***************************************************************************/

// минимальная продолжительность бегства монстра
const int MM_FleeTimeMin = 7;	//сек.

func void ZS_MM_Flee()
{
	// инициализация
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	B_ValidateOther();
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	self.aivar[AIV_StateTime] = 0;
	// предупредить всех вокруг об опасности
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
	// небольшая пауза
	B_MM_DeSynchronize();
};

// ЦИКЛ -------------------------------------------------------------------

func int ZS_MM_Flee_Loop()
{
	// найти обидчика
	Npc_GetTarget(self);
	// если мне еще не удалось сбежать - продолжить бегство
	if((Npc_GetDistToNpc(self,other) < PERC_DIST_ACTIVE_MAX) && (Npc_GetHeightToNpc(self,other) < PERC_DIST_HEIGHT))
	{
		// не чаще, чем раз в 1 сек.
		if(Npc_GetStateTime(self) > 0)
		{
			// если я бегу уже довольно долго
			self.aivar[AIV_StateTime] += Npc_GetStateTime(self);
			if (self.aivar[AIV_StateTime] > MM_FleeTimeMin)
			{
				// подумать - а не прекратить ли бегство
				if (!C_MM_WantToFlee(self, other) && (Hlp_Random(100) < 20))
				{
					Npc_ClearAIQueue(self);
					return LOOP_END;
				};
			};
			// если продолжил бежать - снова предупредить всех об опасности
			Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
			Npc_SetStateTime(self,0);
		};
		// бежать
		AI_Flee(self);
		return LOOP_CONTINUE;
	};
	// если удалось - остановиться
	Npc_ClearAIQueue(self);
	return LOOP_END;
};

func void ZS_MM_Flee_End()
{
};

