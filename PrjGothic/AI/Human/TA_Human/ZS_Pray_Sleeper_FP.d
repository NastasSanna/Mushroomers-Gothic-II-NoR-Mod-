/**************************************************************************

						ћќЋ»“№—я —ѕяў≈ћ”
  
  ќдин в один ZS_Pray_Innos_FP.
  Ќабор воспри€тий - обычный.
  –ежим перемещени€ - ходьба.

***************************************************************************/

func void ZS_Pray_Sleeper_FP()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
};

func int ZS_Pray_Sleeper_FP_Loop()
{
	if(Npc_IsOnFP(self,"PRAY"))
	{
		if(!C_BodyStateContains(self,BS_SIT))
		{
			AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		}
		else
		{
			AI_PlayAniBS(self,"T_PRAY_RANDOM",BS_SIT);
		};
	}
	else if(Wld_IsFPAvailable(self,"PRAY"))
	{
		AI_GotoFP(self,"PRAY");
		AI_Standup(self);
		AI_AlignToFP(self);
	};
	return LOOP_CONTINUE;
};

func void ZS_Pray_Sleeper_FP_End()
{
	Npc_StopAni(self,"T_PRAY_RANDOM");
	AI_PlayAni(self,"T_PRAY_2_STAND");
};

