/**************************************************************************

							ВЫБРАТЬСЯ ИЗ ВОДЫ

  Неводоплавающий монстр self попал в воду (скорее всего, во время атаки
other) и пытается выбраться.

  Нуждается в доработке!!!
  
***************************************************************************/

func void ZS_MM_GetOutOfWater()
{
	// минимум восприятий, как при Flee
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	// дернуться и повернуть назад
	AI_Dodge(self);
	Npc_GetTarget(self);
	if (Hlp_IsValidNpc(other))
	{
		AI_TurnAway(self, other);
	};
};


func int ZS_MM_GetOutOfWater_Loop()
{
	// если я все еще плыву или под водой
	if (C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE))
	{
		// попытаться сбежать
		if (Hlp_IsValidNpc(other))
		{
			AI_Flee(self);
		}
		else
		{
			AI_GotoWP(self, Npc_GetNearestWP(self));
		};
		return LOOP_CONTINUE;
	};
	// иначе - конец состояния
	return LOOP_END;
};

func void ZS_MM_GetOutOfWater_End()
{
};
