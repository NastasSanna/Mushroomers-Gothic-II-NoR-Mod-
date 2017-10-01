/**************************************************************************

						ћќЋ»“№—я »ƒќЋ” —ѕяў≈√ќ
  
  Ќабор воспри€тий - обычный.
  –ежим перемещени€ - ходьба.

***************************************************************************/

func void ZS_Pray_Sleeper()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
};

func int ZS_Pray_Sleeper_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"IDOL"))
	{
		AI_UseMob(self,"IDOL",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Pray_Sleeper_End()
{
	AI_UseMob(self,"IDOL",-1);
};

