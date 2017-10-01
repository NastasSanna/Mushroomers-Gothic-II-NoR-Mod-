/**************************************************************************

						МОНСТР БЕЖИТ НА WP
  
  Набор восприятий - обычный.
  Режим перемещения - бег.
 
***************************************************************************/

func void ZS_MM_RunToWP()
{
	Perception_Set_Monster_Rtn();
	if (C_NpcIs(self,Molerat_Cross) && MIS_Till_Pet_RunAway)	{
		Npc_PercDisable(self,PERC_ASSESSTALK);
	};
	AI_SetWalkMode(self,NPC_RUN);
	B_MM_DeSynchronize();
	NS_GoAndAlignToMyWP(self);
};

func int ZS_MM_RunToWP_Loop()
{
	if (C_NpcIs(self,Molerat_Cross) && MIS_Till_Pet_RunAway)	{
		//Npc_SetRefuseTalk(Molerat_Cross,10);
		if ((Npc_GetDistToPlayer(self) > PERC_DIST_DIALOG) && !Npc_CanSeeNpc(hero, self))	{
			AI_Teleport(self,self.wp);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_RunToWP_End()
{
};

