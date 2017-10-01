



func void ZS_ReactToWeapon()
{
	Perception_Set_Minimal();
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessPlayer_ImportantInfo);	//нет ли важной информации дл€ √√
	if(B_AssessEnemy())
	{
		return;
	};
	AI_Standup(self);
	B_LookAtNpc(self,other);
	B_SelectWeapon(self,other);
	B_TurnToNpc(self,other);
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) && (self.aivar[AIV_LastPlayerAR] != AR_NONE) && Npc_IsPlayer(other))
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say(self,other,"$LOOKINGFORTROUBLEAGAIN");
		}
		else	{
			B_Say(self,other,"$LOOKINGFORTROUBLEAGAIN_F");
		};
	}
	else if(Player_DrawWeaponComment == FALSE)
	{
		if(Npc_IsInFightMode(other,FMODE_MAGIC))
		{
			B_Say(self,other,"$STOPMAGIC");
		}
		else
		{
			B_Say(self,other,"$WEAPONDOWN");
		};
		Player_DrawWeaponComment = TRUE;
	};
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,other);
	self.aivar[AIV_TAPOSITION] = FALSE;
	self.aivar[AIV_StateTime] = 0;
};

func int ZS_ReactToWeapon_Loop()
{
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)
	{
		Npc_ClearAIQueue(self);
		B_RemoveWeapon(self);
		B_StopLookAt(self);
		return LOOP_END;
	};
	if(Npc_IsInFightMode(other,FMODE_NONE))
	{
		Npc_ClearAIQueue(self);
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say(self,other,"$WISEMOVE");
		}
		else	{
			B_Say(self,other,"$WISEMOVE_F");
		};
		B_RemoveWeapon(self);
		B_StopLookAt(self);
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
	{
		if(!Npc_CanSeeNpc(self,other))
		{
			B_TurnToNpc(self,other);
		};
		self.aivar[AIV_StateTime] = self.aivar[AIV_StateTime] + 1;
	};
	if((self.aivar[AIV_TAPOSITION] == FALSE) && (Npc_GetStateTime(self) > 5))
	{
		if(Npc_IsInFightMode(other,FMODE_MAGIC))
		{
			if (other.aivar[AIV_Gender] == MALE)	{
				B_Say(self,other,"$ISAIDSTOPMAGIC");
			}
			else	{
				B_Say(self,other,"$ISAIDSTOPMAGIC_F");
			};
		}
		else
		{
			if (other.aivar[AIV_Gender] == MALE)	{
				B_Say(self,other,"$ISAIDWEAPONDOWN");
			}
			else	{
				B_Say(self,other,"$ISAIDWEAPONDOWN_F");
			};
		};
		self.aivar[AIV_TAPOSITION] = TRUE;
	};
	//при нат€нутых отношени€х второго предупреждени€ не будет
	if(Npc_GetStateTime(self) > 4
		&& (C_NpcGetAttitude(self, other) == ATT_ANGRY
			|| ((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) && (self.aivar[AIV_LastPlayerAR] != AR_NONE) && Npc_IsPlayer(other)))
	)	{
		B_Attack(self,other,AR_ReactToWeapon,0);
	};
	if(Npc_GetStateTime(self) > 10)
	{
		B_Attack(self,other,AR_ReactToWeapon,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_ReactToWeapon_End()
{
	//NS - 28/08/15 чтобы не зависали с оружием
	B_RemoveWeapon(self);
	B_StopLookAt(self);
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)
	{
		AI_ContinueRoutine(self);
	}
	else	{
		AI_StartState(self,ZS_ObservePlayer,1,"");
	};
};

