
func void B_StopShortZapped()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_OnDamage);
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		B_AssessDamage();
		AI_ContinueRoutine(self);
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_ContinueRoutine(self);
	};
};

func void ZS_ShortZapped() //испр. - int на void
{
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,B_StopShortZapped);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		AI_PlayAni(self,"T_STAND_2_LIGHTNING_VICTIM");
	};
};

func int ZS_ShortZapped_Loop()
{
	if(Npc_GetStateTime(self) > SPL_TIME_SHORTZAPPED)
	{
		B_StopShortZapped();
		return LOOP_END; //испр. - добавлено
	};
	return LOOP_CONTINUE;//испр. - добавлено
};

func void ZS_ShortZapped_End()
{
};

