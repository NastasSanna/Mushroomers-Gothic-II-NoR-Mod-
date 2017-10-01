/**************************************************************************

							МАГИ КОЛДУЮТ В КРУГЕ
  
  Набор восприятий - обычный с повышенной частотой.
  Режим перемещения - ходьба.
   
  Сюжетные особенности: восстановление Глаза Инноса (Ксардас, Пирокар,
кто-то еще). Отдельно для Магов Воды и Ищущих. Не будет работать для
др. гильдий после восстановления Глаза.

***************************************************************************/


// НАЧАЛО =================================================================

func void ZS_Circle()
{
	// обычный набор восприятий
	Perception_Set_Normal();
	B_ResetAll(self);
	Npc_SetPercTime(self,0.3);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoAndAlignToMyWP(self);
	self.aivar[AIV_StateTime] = 0;
};

// ЦИКЛ ===================================================================

func int ZS_Circle_Loop()
{
	var int rndTime;
	
	// ИЩУЩИЕ -------------------------------------------------------------
	// спецэфекты: землетрясение, красные всполохи, магические пассы
	// частота эффектов - раз в 5-9 сек.
	if(self.guild == GIL_DMT)
	{
		if (Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
		{
			rndTime = Hlp_Random(5) + 5;
			if(Npc_GetStateTime(self) > rndTime)
			{
				Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
				Npc_SetStateTime(self,0);
				Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
				AI_PlayAni(self,"T_PRACTICEMAGIC5");
			};
			self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
		};
	}
	
	// МАГИ ВОДЫ ----------------------------------------------------------
	// спецэфекты: землетрясение, магические пассы, всполохи и вспышки
	// частота эффектов - раз в 4-7 сек.
	else if(self.guild == GIL_KDW)
	{
		if (Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
		{
			rndTime = Hlp_Random(4) + 4;
			if(Npc_GetStateTime(self) > rndTime)
			{
				AI_AlignToWP(self);
				Npc_SetStateTime(self,0);
				Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
				AI_PlayAni(self,"T_PRACTICEMAGIC5");
				Wld_PlayEffect("spellFX_RingRitual2",ItMi_AmbossEffekt_Addon,ItMi_AmbossEffekt_Addon,0,0,0,FALSE);
				var int randyKDW_Lightstar;
				randyKDW_Lightstar = Hlp_Random(2);
				if(randyKDW_Lightstar == 0)
				{
					Wld_PlayEffect("spellFX_RingRitual1",ItMi_AmbossEffekt_Addon,ItMi_AmbossEffekt_Addon,0,0,0,FALSE);
				}
				else
				{
					Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",ItMi_AmbossEffekt_Addon,ItMi_AmbossEffekt_Addon,0,0,0,FALSE);
				};
			};
			self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
		};
	}
	
	// -------------------------------------------------------
	// спецэфекты: землетрясение, магические пассы, всполохи соответствующего магу цвета
	// частота эффектов - раз в 3-5 сек.
	else
	{
		if (Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
		{
			rndTime = Hlp_Random(3) + 3;
			if(Npc_GetStateTime(self) > rndTime)
			{
				Npc_SetStateTime(self,0);
				Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
				AI_PlayAni(self,"T_PRACTICEMAGIC5");
				if(self.guild == GIL_KDF)
				{
					Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
				}
				else if(self.guild == GIL_KDW)
				{
					Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
				}
				else
				{
					Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
				};
			};
			self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
		};
	};
	// больше никто не колдует в круге
	return LOOP_CONTINUE;
};

// ЗАВЕРШЕНИЕ =============================================================

func void ZS_Circle_End()
{
};

