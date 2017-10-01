/**************************************************************************

								ТРАНС
  
  Маг общается с высшими сферами и ничего не замечает.

***************************************************************************/

func void ZS_Trance()
{
	self.senses = SENSE_HEAR | SENSE_SEE;
	self.senses_range = PERC_DIST_ACTIVE_MAX;
	Npc_PercEnable(self,PERC_ASSESSMAGIC,		B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,		B_AssessDamage);
	AI_SetWalkMode(self,NPC_WALK);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Trance_Loop()
{
	// если еще не впали в транс
	if (self.aivar[AIV_TAPOSITION] != ISINPOS)
	{
		// если еще не дошли до места
		if ((Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX) || (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE))
		{
			// и если еще не идем
			if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
			{
				// то идти
				AI_GotoWP(self, self.wp);
				self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
			};
		}	
		else	
		{			
			AI_AlignToWP(self);
			// впасть со спецэффектами
			AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
			Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
			// запомнить, что впали
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	}
	// иначе - уже в трансе
	else
	{
		if (Npc_GetStateTime(self) > 0)
		{
			// в среднем раз в 2 сек.
			if (Hlp_Random(100) < 50)
			{
				// спецэффекты
				Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
			};
			Npc_SetStateTime(self, 0);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Trance_End()
{
	// выйти из транса
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};