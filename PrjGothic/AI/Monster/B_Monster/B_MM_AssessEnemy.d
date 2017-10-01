
func void B_MM_AssessEnemy()
{
	var C_Npc pcl;
	var C_Npc mgo;
	var C_Npc lar;
	if(HasFlags(self.aivar[AIV_Temper] | other.aivar[AIV_Temper], TEMPER_NoFightParker))
	{
		return;
	};
	if((self.aivar[AIV_EnemyOverride] == TRUE) && (other.guild < GIL_SEPERATOR_HUM))
	{
		return;
	};
	// один из нас прячется
	if (HasFlags(self.aivar[AIV_Behaviour] | other.aivar[AIV_Behaviour], BEHAV_Hidden)
		 && (Npc_GetDistToNpc(self,other) > 100))	// но с очень близкого расстояния все же заметен
	{
		return;
	};
	// он невидимый
	if (HasFlags(other.aivar[AIV_Behaviour], BEHAV_Invisible))
	{
		return;
	};
	pcl = Hlp_GetNpc(PC_Levelinspektor);
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl))
	{
		return;
	};
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	// он плывет или нырнул, а я не хочу лезть в воду
	if (!C_WantToFollowInWater(self, other))
	{
		AI_TurnToNPC(self,other);
		AI_PlayAni(self,"T_WARN");
		return;
	};
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	if(Npc_IsPlayer(other) && (other.guild > GIL_SEPERATOR_HUM))
	{
		if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)
		{
			return;
		};
	};
	if(self.senses_range > PERC_DIST_MONSTER_ACTIVE_MAX)
	{
		if(Npc_GetDistToNpc(self,other) > PERC_DIST_MONSTER_ACTIVE_MAX)
		{
			if(!Npc_CanSeeNpc(self,other))
			{
				return;
			};
		};
	};
	if((self.guild == GIL_ORC) || (self.guild == GIL_FRIENDLY_ORC))
	{
		if(C_BodyStateContains(other,BS_SNEAK) || C_BodyStateContains(other,BS_STAND))
		{
			if(!Npc_CanSeeNpc(self,other))
			{
				return;
			};
		};
	};
	if(!Npc_CanSeeNpcFreeLOS(self,other))
	{
		return;
	};
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(other.npcType == NPCTYPE_FRIEND)
		{
			return;
		};
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	if (C_MM_WantToFlee(self, other))
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Flee,0,"");
		return;
	};
	if(!HasFlags(self.aivar[AIV_MM_Behaviour], BEHAV_ThreatenBeforeAttack))
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	if(Npc_IsInState(self,ZS_MM_EatBody))
	{
		if(Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MONSTER_ATTACKRANGE)
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		};
		return;
	};
	if(Npc_IsInState(self,ZS_MM_Hunt))
	{
		if(Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MONSTER_ATTACKRANGE)
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		}
		else
		{
			return;
		};
	};
	if(C_PredatorFoundPrey(self,other))
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Hunt,0,"");
		return;
	};
	if(C_PredatorFoundPrey(other,self))
	{
		if(!Npc_IsInState(other,ZS_MM_Hunt) && (Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MONSTER_FLEE))
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_MM_Flee,0,"");
			return;
		};
		return;
	};
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_MM_ThreatenEnemy,0,"");
};



