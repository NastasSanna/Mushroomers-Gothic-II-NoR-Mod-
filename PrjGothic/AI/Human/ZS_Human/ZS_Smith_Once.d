/**************************************************************************

  Один полный цикл ковки. После этого, или при прерывании состояния,
 NPC вернется к обычному расписанию.
 
  TEST NEEDED !!!

****************************************************************************/

func void ZS_Smith_Once()
{
	Perception_Set_Minimal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
	self.aivar[AIV_TAPOSITION] = 0;
};

func int ZS_Smith_Once_Loop()
{
	// шаг 1 - горн
	if (self.aivar[AIV_TAPOSITION] == 0)	{
		if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSFIRE"))
		{
			AI_UseMob(self,"BSFIRE",1);
			self.aivar[AIV_TAPOSITION] = 1;
		}
		else	{
			Npc_SetStateTime(self,0);
		};
	}
	// шаг 2 - отлепляемся от горна
	else	if (self.aivar[AIV_TAPOSITION] == 1)	{
		if (Npc_GetStateTime(self) > 10)	{
			AI_UseMob(self,"BSFIRE",-1);
			self.aivar[AIV_TAPOSITION] = 2;
			Npc_SetStateTime(self,0);
		};
	}
	// шаг 3 - идем к наковальне
	else	if (self.aivar[AIV_TAPOSITION] == 2)	{
		if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
		{
			AI_UseMob(self,"BSANVIL",1);
			self.aivar[AIV_TAPOSITION] = 3;
		}
		else	{
			Npc_SetStateTime(self,0);
		};
	}
	// шаг 4 - отлепляемся от наковальни
	else	if (self.aivar[AIV_TAPOSITION] == 3)	{
		if (Npc_GetStateTime(self) > 10)	{
			AI_UseMob(self,"BSANVIL",-1);
			self.aivar[AIV_TAPOSITION] = 4;
			Npc_SetStateTime(self,0);
		};
	}
	// шаг 5 - идем к ведру с водой
	else	if (self.aivar[AIV_TAPOSITION] == 4)	{
		if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSCOOL"))
		{
			AI_UseMob(self,"BSCOOL",1);
			self.aivar[AIV_TAPOSITION] = 5;
		}
		else	{
			Npc_SetStateTime(self,0);
		};
	}
	// шаг 4 - отлепляемся от наковальни
	else	if (self.aivar[AIV_TAPOSITION] == 5)	{
		if (Npc_GetStateTime(self) > 10)	{
			AI_UseMob(self,"BSCOOL",-1);
			self.aivar[AIV_TAPOSITION] = 6;
			return LOOP_END;
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Smith_Once_End()
{
	AI_UseMob(self,"BSFIRE",-1);
};


