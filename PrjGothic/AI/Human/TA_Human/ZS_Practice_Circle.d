/**************************************************************************

							ПРАКТИКА С КРУГАМИ
  
  Набор восприятий - обычный.
  Режим перемещения - ходьба.
   
  Цвет магических всполохов (кругов) зависит от гильдии или случайности.

***************************************************************************/


// НАЧАЛО =================================================================

func void ZS_Practice_Circle()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoAndAlignToMyWP(self);
};

// ЦИКЛ ===================================================================

func int ZS_Practice_Circle_Loop()
{
	if (Npc_GetStateTime(self) > 0)	// проверка раз в 1 сек.
	{
		if (Hlp_Random(100) < 30) // в среднем раз в 3 сек.
		{
			AI_PlayAni(self,"T_PRACTICEMAGIC5"); // пассы
			// спецэффекты
			if (self.guild == GIL_DMT) // у ищущих
			{
				Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);	// красные всполохи
				Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);	// и землетрясение
			}
			else if (self.guild == GIL_KDF) // у Магов Огня
			{
				Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);	// только красные всполохи
			}
			else if (self.guild == GIL_KDW) // у Магов Воды
			{
				if (Hlp_Random(100) < 60)
				{
					Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);	// скорее всего синие
				}
				else
				{
					Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);	// или белые всполохи
				};
			}
			else	// у всех остальных
			{
				Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);	// белые всполохи
			};
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

// ЗАВЕРШЕНИЕ =============================================================

func void ZS_Practice_Circle_End()
{
};