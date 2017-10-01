/**************************************************************************

							СОБИРАТЬ УРОЖАЙ
  
  Сбор некой растительности с земли. Для закапывания руками тоже подойдет.
  Набор восприятий - обычный.
  Режим перемещения - ходьба.

***************************************************************************/

func void ZS_Pick_FP()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
};

func int ZS_Pick_FP_Loop()
{
	if((Npc_GetStateTime(self) >= 7) && Hlp_Random(2))
	{
		if(Npc_IsOnFP(self,"PICK") && Wld_IsFPAvailable(self,"PICK"))
		{
			AI_GotoNextFP(self,"PICK");
			AI_StopLookAt(self);
			AI_PlayAni(self,"T_PLUNDER");
			Npc_SetStateTime(self,0);
		}
		else if(Npc_IsOnFP(self,"PICK"))
		{
			AI_PlayAni(self,"T_PLUNDER");
			Npc_SetStateTime(self,0);
		};
		AI_SetWalkMode(self,NPC_WALK);
	}
	else if(Npc_GetStateTime(self) >= 7)
	{
		if(Npc_IsOnFP(self,"PICK"))
		{
			AI_PlayAni(self,"T_PLUNDER");
		};
		AI_SetWalkMode(self,NPC_WALK);
	};
	if(!Npc_IsOnFP(self,"PICK") && Wld_IsFPAvailable(self,"PICK"))
	{
		AI_GotoFP(self,"PICK");
	};
	return LOOP_CONTINUE;
};

func void ZS_Pick_FP_End()
{
};

