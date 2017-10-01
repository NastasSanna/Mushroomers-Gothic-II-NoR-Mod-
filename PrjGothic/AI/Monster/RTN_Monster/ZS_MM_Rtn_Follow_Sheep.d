
func void ZS_MM_Rtn_Follow_Sheep()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	AI_SetWalkmode(self,NPC_RUN);
};

func int ZS_MM_Rtn_Follow_Sheep_Loop()
{
	var int randomMove;
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(Npc_GetDistToNpc(self,hero) > 500)
		{
			if(!C_BodyStateContains(self,BS_SWIM))
			{
				AI_SetWalkMode(self,NPC_RUN);
			};
			AI_GotoNpc(self,hero);
		}
		else
		{
			AI_TurnToNPC(self,hero);
			self.wp = Npc_GetNearestWP(self);
		};
	}
	else
	{
		randomMove = Hlp_Random(3);
		if(randomMove == 0)
		{
			AI_PlayAni(self,"R_ROAM1");
		};
		if(randomMove == 1)
		{
			AI_PlayAni(self,"R_ROAM2");
		};
		if(randomMove == 2)
		{
			AI_PlayAni(self,"R_ROAM3");
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Follow_Sheep_End()
{
};


