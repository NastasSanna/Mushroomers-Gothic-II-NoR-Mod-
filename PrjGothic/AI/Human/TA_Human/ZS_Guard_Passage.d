/**************************************************************************

							ОХРАНА ПРОХОДА
  
  Стоять смирно, никого не пускать, по сторонам не смотреть. Проход, в данном
случае, - любой, а не только в Долину рудников.
  Набор восприятий - обычный, частота обработки сверхвысокая.
  Режим перемещения - ходьба.
   
  AIV_TAPOSITION:
   ISINPOS	- еще не охраняю
   NOTINPOS	- охраняю

***************************************************************************/

func void ZS_Guard_Passage()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	Npc_SetPercTime(self,0.1);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	if(Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG)
	{
		AI_AlignToWP(self);
	};
};

func int ZS_Guard_Passage_Loop()
{
	if(Npc_GetStateTime(self) >= 3)
	{
		if(Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG)
		{
			AI_AlignToWP(self);
			Npc_SetStateTime(self,0);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Guard_Passage_End()
{
};

