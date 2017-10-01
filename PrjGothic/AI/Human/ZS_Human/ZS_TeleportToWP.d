
//переместить NPC на TOT, когда ГГ не видит

func void ZS_TeleportToWP()
{
	Perception_Set_Minimal();
	AI_SetWalkmode(self,NPC_WALK);
};

func int ZS_TeleportToWP_Loop()
{
	if (C_NpcIs(self, VLK_494_Attila))
	{
		AI_GotoWP(self, "NW_CITY_TO_KANAL_07");
	};
	if ((Npc_GetDistToNpc(self, hero) > PERC_DIST_DIALOG) && !Npc_CanSeeNpc(hero,self))
	{
		if (Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)	{
			Npc_ClearAIQueue(self);
			AI_Teleport(self,self.wp);
			return LOOP_END;
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_TeleportToWP_End()
{
};
