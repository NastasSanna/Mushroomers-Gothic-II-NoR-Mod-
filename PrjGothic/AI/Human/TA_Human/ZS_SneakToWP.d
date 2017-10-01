/**************************************************************************

							КРАСТЬСЯ
  
  Для воров.
  
  Набор восприятий - обычный.
  Режим перемещения - бег.

***************************************************************************/

func void ZS_SneakToWp()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_SNEAK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	AI_AlignToWP(self);
};

func int ZS_SneakToWp_Loop()
{
	var int random;
	if((Npc_GetStateTime(self) > 5) && (Npc_GetDistToWP(self,self.wp) < PERC_DIST_INTERMEDIAT))
	{
		random = Hlp_Random(4);
		if(random == 0)
		{
			AI_PlayAni(self,"T_SEARCH");
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_SneakToWp_End()
{
};

