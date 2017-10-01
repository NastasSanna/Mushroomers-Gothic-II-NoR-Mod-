/**************************************************************************

								П'ИСАТЬ
  
  Только для мужиков и только в специально отведенных местах. Если туалета
на горизонте нет, будем терпеть.
  
  Набор восприятий - обычный.
  Режим перемещения - ходьба.

  AIV_TAPOSITION:
   ISINPOS	- еще не в процессе
   NOTINPOS	- процесс пошел

***************************************************************************/

func void ZS_Pee()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Pee_loop()
{
	if(Npc_IsOnFP(self,"PEE"))
	{
		AI_AlignToFP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"PEE"))
	{
		AI_GotoFP(self,"PEE");
		AI_Standup(self);
		AI_AlignToFP(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else
	{
		AI_AlignToWP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	};
	if((self.aivar[AIV_TAPOSITION] == NOTINPOS) && Npc_IsOnFP(self,"PEE"))
	{
		AI_AlignToFP(self);
		AI_Standup(self);
		AI_PlayAni(self,"T_STAND_2_PEE");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_Pee_end()
{
	AI_PlayAni(self,"T_PEE_2_STAND");
};

