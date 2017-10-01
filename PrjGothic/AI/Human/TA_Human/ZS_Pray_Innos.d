/**************************************************************************

						МОЛИТЬСЯ ИННОСУ У СТАТУИ
  
  Набор восприятий - обычный.
  Режим перемещения - ходьба.

***************************************************************************/

func void ZS_Pray_Innos()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
};

func int ZS_Pray_Innos_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"INNOS"))
	{
		AI_UseMob(self,"INNOS",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Pray_Innos_End()
{
	AI_UseMob(self,"INNOS",-1);
};

