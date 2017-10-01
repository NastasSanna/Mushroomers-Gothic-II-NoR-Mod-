func void ZS_WatchConcert()
{
	Perception_Set_Normal();
	AI_StopLookAt(self);
	AI_SetWalkmode(self,NPC_WALK);
	AI_Standup(self);
	AI_GotoWP(self,self.wp);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_WatchConcert_Loop()
{
	if(self.aivar[AIV_TAPOSITION] == ISINPOS)	{
		// ищем выступающего
		Npc_PerceiveAll(self);
		if (Wld_DetectNpc(self,-1,ZS_Spit_Fire,-1))	{
			if (!Wld_DetectNpc(self,-1,ZS_Dance,-1))	{
				if (!Wld_DetectNpc(self,-1,ZS_Play_Lute,-1))	{
					return LOOP_CONTINUE;	//не нашли - ничего не надо
				};
			};
		};
			
		//поворачиваемся к нему и подбадриваем
		AI_TurnToNpc(self,other);
		AI_LookAtNpc(self,other);
		if (Npc_GetStateTime(self) > 5)	{
			if (Hlp_Random(5) == 0)	{
				B_MM_DeSynchronize();
				AI_PlayAni(self,"T_WATCHFIGHT_YEAH");
				AI_StandUp(self);
			};
			Npc_SetStateTime(self,0);
		};
	}
	//идем на FP STAND или остаемся на WP
	else	{
		if (!Wld_IsFPAvailable(self,"STAND") || Npc_IsOnFP(self,"STAND"))	{
			AI_AlignToFP(self);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		}
		else	{
			AI_GotoFP(self,"STAND");
			self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_WatchConcert_End()
{
};
