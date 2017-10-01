/**************************************************************************

							ѕ–я“ј“№—я
  
  NPC в этом режиме "не виден" другим - на него не нападают и он не нападает
(NoFightParker). ћожно сто€ть на WP или на FP HIDE.
  Ќабор воспри€тий - обычный.
  –ежим перемещени€ - бег.
 
***************************************************************************/

func void ZS_Hide()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_RUN);
	B_MM_DeSynchronize();
	NS_GoToMyWP(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
};

func int ZS_Hide_Loop()
{
	if(Npc_IsOnFP(self,"HIDE"))
	{
		AI_AlignToFP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"HIDE"))
	{
		AI_GotoFP(self,"HIDE");
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
		AI_Standup(self);
		AI_PlayAni(self,"T_STAND_2_LGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
		self.aivar[AIV_Behaviour] = self.aivar[AIV_Behaviour] | BEHAV_Hidden;
	};
	return LOOP_CONTINUE;
};

func void ZS_Hide_End()
{
	self.aivar[AIV_Behaviour] = self.aivar[AIV_Behaviour] & ~BEHAV_Hidden;
};
