/**************************************************************************

							ИГРАТЬ НА ГИТАРЕ
  
  Если гитары нет, она будет создана.
  Набор восприятий - обычный.
  Режим перемещения - ходьба.
  Выполняется на fp STAND.

***************************************************************************/


func void ZS_Play_Guitar()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
	if(Npc_HasItems(self,ItMi_Guitar) == 0)
	{
		CreateInvItem(self,ItMi_Guitar);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Play_Guitar_Loop()
{
	if(Npc_IsOnFP(self,"STAND"))
	{
		AI_AlignToFP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP(self,"STAND");
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
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_UseItemToState(self,ItMi_Guitar,1);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if (self.aivar[AIV_TAPOSITION] == ISINPOS)
	{
		if (Npc_GetStateTime(self) > 61)
		{
			Use_Guitar();
			Npc_SetStateTime(self, 0);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Play_Guitar_End()
{
	AI_UseItemToState(self,ItMi_Guitar,-1);
};

