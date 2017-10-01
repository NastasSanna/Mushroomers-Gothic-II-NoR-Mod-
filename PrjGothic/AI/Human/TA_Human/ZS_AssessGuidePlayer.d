/**************************************************************************

							ВЕСТИ ГГ
  
  Включает специальные обработчики восприятия (игрока, шума сражения). Ждать
ГГ, если он отстал больше, чем на 8м. Считается, что дошли, если до места 
назначения меньше 3м.
  Если ГГ следует за врагом, которому запрещено нападать, и уйдет от такого
врага дальше, чем на 12м, то запрет на нападение будет снят.
  Набор восприятий - минимальный с дополнениями, частота нормальная.
  Режим перемещения - бег.

  Похоже на ZS_Follow_Player.
  
//PB: Особый случай: если ГГ не следует за врагом, AIV_EnemyOverride отключается!
//NS: не знаю, где реально используется проверка AIV_EnemyOverride
для врагов ГГ, но теоретически она нужна. Т.е. если ГГ следует куда-то
за врагом, то чтобы они не цапались, нужно установить AIV_EnemyOverride.
А если при этом ГГ куда-то смотался, то нужно опять разрешить нападение
Проблема возникает, если AIV_EnemyOverride был установлен где-то еще

***************************************************************************/


// ВОСПРИЯТИЕ ГГ ===========================================================

func void B_AssessGuidePlayer()
{
	// подождать, если ГГ отстал больше, чем на 8м
	if(Npc_GetDistToNpc(self,hero) > 800)
	{
		if(Npc_GetDistToWP(self,self.wp) < Npc_GetDistToWP(hero,self.wp))
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			B_TurnToNpc(self,hero);
		};
		// если мы враги, а ГГ совсем куда-то смылся, снять запрет на атаку
		if((Npc_GetDistToNpc(self,hero) > 1200) && (self.aivar[AIV_EnemyOverride] == TRUE)
			&& (C_NpcGetAttitude(self,hero) == ATT_HOSTILE))
		{
			self.aivar[AIV_EnemyOverride] = FALSE;
		};
	}
	// если не отстал - обычное восприятие
	else
	{
		B_AssessPlayer();
	};
};

// ВОСПРИЯТИЕ ШУМА СРАЖЕНИЯ ==============================================

func void B_AssessGuideFightSound()
{
	// обращать внимание, только если сражается ГГ
	if(Npc_IsPlayer(other) || Npc_IsPlayer(victim))
	{
		B_AssessFightSound();
	};
};

// НАЧАЛО =================================================================

func void ZS_Guide_Player()
{
	// набор восприятий
	Perception_Set_Minimal();
	B_ResetAll(self);
	self.senses_range = 2000;
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessGuidePlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessGuideFightSound);
};

// ЦИКЛ ===================================================================

func int ZS_Guide_Player_Loop()
{
	// вызвать обработчик, если ГГ отстал
	if((Npc_GetDistToNpc(self,hero) > 800) && (Npc_GetDistToWP(self,self.wp) < Npc_GetDistToWP(hero,self.wp)))
	{
		if (Npc_GetStateTime(self) > 0)	{
			B_AssessGuidePlayer();
			Npc_SetStateTime(self,0);
		};
	}
	// ГГ не отстал -----v
	// если еще не пришли - бегом к цели
	else if(Npc_GetDistToWP(self,self.wp) > 300)
	{
		if(!C_BodyStateContains(self,BS_SWIM))
		{
			AI_SetWalkMode(self,NPC_RUN);
		};
		AI_GotoWP(self,self.wp);
	}
	// уже пришли - повернуться к ГГ
	else
	{
		if (Npc_GetStateTime(self) > 0)	{
			B_TurnToNpc(self,hero);
			Npc_SetStateTime(self,0);
		};
	};
	return LOOP_CONTINUE;
};

// ЗАВЕРШЕНИЕ =============================================================

func void ZS_Guide_Player_End()
{
};

