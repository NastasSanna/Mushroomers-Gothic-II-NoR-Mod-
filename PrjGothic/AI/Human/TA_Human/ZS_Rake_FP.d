/**************************************************************************

							РЫХЛИТЬ ЗЕМЛЮ
  
  Если нужно, будет создана мотыга.
  Набор восприятий - обычный.
  Режим перемещения - ходьба.
 
***************************************************************************/

func void ZS_Rake_FP()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
	if(Npc_HasItems(self,ItMi_Rake) == 0)
	{
		CreateInvItem(self,ItMi_Rake);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Rake_FP_Loop()
{
	if(Npc_IsOnFP(self,"PICK"))
	{
		AI_AlignToFP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"PICK"))
	{
		AI_GotoFP(self,"PICK");
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
		AI_UseItemToState(self,ItMi_Rake,1);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_Rake_FP_End()
{
	AI_UseItemToState(self,ItMi_Rake,-1);
};

