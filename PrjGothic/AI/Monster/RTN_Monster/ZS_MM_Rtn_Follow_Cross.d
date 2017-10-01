
func void ZS_MM_Rtn_Follow_Cross()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	AI_SetWalkmode(self,NPC_RUN);
};

func int ZS_MM_Rtn_Follow_Cross_Loop()
{
	if (B_CrossSearchItem())	{
		return LOOP_END;
	};
	if(Npc_GetDistToNpc(self,hero) > 500)
	{
		if(!C_BodyStateContains(self,BS_SWIM))
		{
			AI_SetWalkMode(self,NPC_RUN);
		};
		AI_GotoNpc(self,hero);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else
	{
		if (!Npc_CanSeeNpc(self,hero))	{
			AI_TurnToNPC(self,hero);
		};
		self.wp = Npc_GetNearestWP(self);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Follow_Cross_End()
{
};


