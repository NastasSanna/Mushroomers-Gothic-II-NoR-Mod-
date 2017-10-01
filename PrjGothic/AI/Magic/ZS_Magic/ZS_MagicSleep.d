/*****************************************************************
						МАГИЧЕСКИЙ СОН
  Для Spell_Sleep
*****************************************************************/

//===========================================================
func void B_StopMagicSleep() //испр. - int на void
{
	Npc_PercDisable(self,PERC_ASSESSDAMAGE);
	B_Say_Overlay(self,other,"$WHATWASSTHAT");
	AI_PlayAniBS(self,"T_VICTIM_SLE_2_STAND", BS_STAND);
	if(C_NpcIsHero(self))
	{
		HERO_IsSleeping = FALSE;
	};
};

func void B_AssessMagicSleepTalk()
{
	B_Say(self,other,"$YOUDISTURBEDMYSLUMBER");
	AI_StartState(self,ZS_ObservePlayer,1,"");
};

func void B_AssessDamage_MagicSleep()
{
	B_OnDamage();
	// сообщить всем о драке
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	// проснуться
	B_StopMagicSleep();
};

//=============================================================

func void ZS_MagicSleep()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage_MagicSleep);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessMagicSleepTalk);
	B_GuardPassageStatusReset(self);
	Npc_SetRefuseTalk(self,0);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	B_StopLookAt(self);
	AI_StopPointAt(self);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	AI_PlayAniBS(self,"T_STAND_2_VICTIM_SLE",BS_LIE);
	if(C_NpcIsHero(self))
	{
		HERO_IsSleeping = TRUE;
	};
};

func int ZS_MagicSleep_Loop()
{
	if(Npc_GetStateTime(self) > SPL_TIME_Sleep)
	{
		Npc_ClearAIQueue(self);
		B_StopMagicSleep();
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_MagicSleep_End()
{
};

// MR ================================================================
// аналогично, но на короткий срок
func void ZS_MagicSleep_Short()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage_MagicSleep);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessMagicSleepTalk);
	B_GuardPassageStatusReset(self);
	Npc_SetRefuseTalk(self,0);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	B_StopLookAt(self);
	AI_StopPointAt(self);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	AI_PlayAniBS(self,"T_STAND_2_VICTIM_SLE",BS_LIE);
	if(C_NpcIsHero(self))
	{
		HERO_IsSleeping = TRUE;
	};
};

func int ZS_MagicSleep_Short_Loop()
{
	if(Npc_GetStateTime(self) > Sleep_Time_Ivy)
	{
		Npc_ClearAIQueue(self);
		B_StopMagicSleep();
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_MagicSleep_Short_End()
{
};

