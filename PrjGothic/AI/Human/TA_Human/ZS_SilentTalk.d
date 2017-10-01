/**************************************************************************

						ТИХАЯ БЕСЕДА
  
  Почти как SilentTalk, но без фраз вслух.
  Набор восприятий - обычный.
  Режим перемещения - ходьба.

***************************************************************************/

const int SilentTalkFreq = 3;

func void ZS_SilentTalk()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
};

func int ZS_SilentTalk_Loop()
{
	if(Npc_IsOnFP(self,"SILENTTALK") || Npc_IsOnFP(self,"TALK"))
	{
		if(Npc_GetStateTime(self) >= (SilentTalkFreq * 2))
		{
			Npc_PerceiveAll(self);
			if(Wld_DetectNpc(self,-1,ZS_SilentTalk,-1))
			{
				if(Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG)
				{
					Npc_SetStateTime(other,SilentTalkFreq);
					B_TurnToNpc(self,other);
					B_LookAtNpc(self,other);
					B_Say(self,other,"XXX");
				};
			};
			Npc_SetStateTime(self,0);
		};
	}
	else if(Wld_IsFPAvailable(self,"SILENTTALK"))
	{
		AI_GotoFP(self,"SILENTTALK");
		AI_Standup(self);
		AI_AlignToFP(self);
	}
	else if(Wld_IsFPAvailable(self,"TALK"))
	{
		AI_GotoFP(self,"TALK");
		AI_Standup(self);
		AI_AlignToFP(self);
	};
	return LOOP_CONTINUE;
};

func void ZS_SilentTalk_End()
{
};