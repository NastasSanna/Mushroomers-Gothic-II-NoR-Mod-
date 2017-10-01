
func void B_StopMagicFlee() //испр. - int на void
{
	// отключить особое восприятие повреждения
	Npc_PercDisable(self,PERC_ASSESSDAMAGE);
	// начать убегать
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Flee,0,"");
};

func void B_AssessDamage_MagicFlee()
{
	B_OnDamage();
	// сообщить всем о драке
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	// завершить состояние
	B_StopMagicFlee();
};


func void ZS_MagicFlee()
{
	var int randy;
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage_MagicFlee);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
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
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_PlayAniBS(self,"T_STAND_2_FEAR_VICTIM1",BS_STAND);
		};
		if(randy == 1)
		{
			AI_PlayAniBS(self,"T_STAND_2_FEAR_VICTIM2",BS_STAND);
		};
		if(randy == 2)
		{
			AI_PlayAniBS(self,"T_STAND_2_FEAR_VICTIM3",BS_STAND);
		};
	};
};

func int ZS_MagicFlee_Loop()
{
	if(Npc_GetStateTime(self) > SPL_TIME_Fear)
	{
		Npc_ClearAIQueue(self);
		B_StopMagicFlee();
		return LOOP_END; //испр. - добавлено
	};
	return LOOP_CONTINUE;//испр. - добавлено
};

func void ZS_MagicFlee_End()
{
};




