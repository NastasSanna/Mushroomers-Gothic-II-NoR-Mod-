/**************************************************************************

							СЛЕДОВАТЬ ЗА ГГ
  
  Дальность следования по умолчанию - 50м. 
  Включает специальные обработчики восприятия (игрока, шума сражения).
  Набор восприятий - минимальный с дополнениями, частота повышенная.
  Режим перемещения - бег.
 
  Смысл AIV_TAPOSITION в данном случае:
   NOTINPOS	- бегу за ГГ
   ISINPOS	- стою на месте

***************************************************************************/

// ВОСПРИЯТИЕ ГГ ===========================================================

func void B_AssessFollowPlayer()
{
	// подождать ГГ, если он отстал
	if((Npc_GetDistToNpc(self,hero) < self.aivar[AIV_FollowDist]) && (self.aivar[AIV_TAPOSITION] == NOTINPOS)
		|| (self.aivar[AIV_MaxDistToWp] > 0 && Npc_GetDistToWP(hero,self.wp) > self.aivar[AIV_MaxDistToWp]))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	B_AssessPlayer();
};

// ВОСПРИЯТИЕ ШУМА СРАЖЕНИЯ ==============================================

func void B_AssessFollowFightSound()
{
	// выполнить обработку восприятия ТОЛЬКО, если
	if(Npc_IsPlayer(other) || Npc_IsPlayer(victim)		// сражается ГГ
		|| (other.aivar[AIV_PARTYMEMBER] == TRUE) || (victim.aivar[AIV_PARTYMEMBER] == TRUE)) // или кто-то из его команды
	{
		B_AssessFightSound();
	};
};


// НАЧАЛО =================================================================

func void ZS_Follow_Player()
{
	// восприятия
	self.senses_range = PERC_DIST_ACTIVE_MAX;
	Npc_SetPercTime(self,0.3);
	Perception_Set_Minimal();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessFollowPlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFollowFightSound);
	B_ResetAll(self);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	// дальность следования
	if(self.aivar[AIV_FollowDist] == 0)
	{
		self.aivar[AIV_FollowDist] = 500;
	};
};

// ЦИКЛ ===================================================================

func int ZS_Follow_Player_Loop()
{
	self.wp = Npc_GetNearestWP(self);
	if (C_FollowPlayerForbidden(self))	{
		return LOOP_CONTINUE;
	};
	// если ГГ слишком далеко (я отстал) 
	if(Npc_GetDistToNpc(self,hero) > self.aivar[AIV_FollowDist]
		// проверить, не ушел ли ГГ слишком далеко
		&& ((self.aivar[AIV_MaxDistToWp] == 0) || (Npc_GetDistToWP(hero,self.wp) <= self.aivar[AIV_MaxDistToWp])))
	{
		// для всех остальных ---------------------------------------------
		if(!C_BodyStateContains(self,BS_SWIM))
		{
			AI_SetWalkMode(self,NPC_RUN);
		};
		AI_GotoNpc(self,hero);
		self.aivar[AIV_TAPOSITION] = FALSE;
	}
	else // я не отстал
	// если уже прошло больше 1 сек.
	if(Npc_GetStateTime(self) > 1)
	{
		B_TurnToNpc(self,hero);
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

// ЗАВЕРШЕНИЕ =============================================================

func void ZS_Follow_Player_End()
{
};

