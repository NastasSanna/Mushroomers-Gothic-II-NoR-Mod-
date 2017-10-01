/**************************************************************************

							ЖАРИТЬ ПАДАЛЬЩИКА
  
  Набор восприятий - обычный.
  Режим перемещения - ходьба.

***************************************************************************/

func void ZS_Roast_Scavenger()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
};

func int ZS_Roast_Scavenger_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BARBQ"))
	{
		AI_UseMob(self,"BARBQ",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Roast_Scavenger_End()
{
	AI_UseMob(self,"BARBQ",-1);
};

