/**************************************************************************

							ПРИЗВАННЫЙ МОНСТР
  
  Следовать за ГГ и охранять его. Управление временем жизни через 
AIV_SummonedTime:
    -1 - бесконечно
    0 - смерть
    иное - сколько осталось сек.

  Набор восприятий - особый.
  Режим перемещения - бег.
 
***************************************************************************/


//ДИАЛОГИ ================================
instance DIA_Summoned_EXIT(DIA_Proto_End)
{
};

//-------------------------------------------

instance DIA_Summoned_FREE(C_Info)
{
	nr = 1;
	condition = DIA_Summoned_FREE_Condition;
	information = DIA_Summoned_FREE_Info;
	permanent = TRUE;
	description = "Прогнать";
};


func int DIA_Summoned_FREE_Condition()
{
	return TRUE;
};

func void DIA_Summoned_FREE_Info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_SummonedTime] = 0;
};


//ТЕЛЕПОРТ К ГГ =========================
//для борьбы с застреваниями

//невидимка - точка телепортации
instance HELPER_Teleport(C_NPC)
{
	name[0] = "Телепорт к ГГ";
	guild = GIL_MEATBUG;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_HITPOINTS_MAX] = 10;
	npcType = npctype_main;
	noFocus = TRUE;
    Mdl_SetVisual(self,"Bloodfly.mds");
	Mdl_SetVisualBody(self,"",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Npc_SetToFistMode(self);
	start_aistate = ZS_Follow_Player;
};
//телепорт
func void B_Summoned_TeleportToPlayer()
{
	//если ГГ слишком далеко
	if (Npc_GetDistToNpc(self,hero) > 1000)	{
		//телепортироваться к нему
		var string wp;	wp = Npc_GetNearestWP(hero);
		//если рядом с ГГ нет WP, то будем телепортироваться к вспомогательному невидимому NPC
		if (Npc_GetDistToWP(hero, wp) > 500)	{
			if (!Hlp_IsValidNpc(HELPER_Teleport))	{
				var C_NPC slf;	slf = Hlp_GetNpc(self);
				Wld_SpawnNpcRange(hero,HELPER_Teleport,1,1000);
				self = Hlp_GetNpc(slf);
			};
			wp = "HELPER_TELEPORT";
		};
		Npc_ClearAIQueue(self);
		AI_Teleport(self,wp);
	};
};

//ВОСПРИЯТИЯ =========================================

func void B_SummonedAssessTalk()
{
	DIA_Summoned_EXIT.npc = Hlp_GetInstanceID(self);
	DIA_Summoned_FREE.npc = Hlp_GetInstanceID(self);
	AI_ProcessInfos(self);
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
};

// ----------------------------------------

func void B_SummonedAssessPlayer()
{
	B_Summoned_TeleportToPlayer();
	B_MM_AssessPlayer();
};

//СОСТОЯНИЕ =========================================

func void ZS_MM_Rtn_Summoned()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_SummonedAssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_MM_AssessOthersDamage);
	//особые диалоги для ищущего огонька
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wisp_Detector))
	{
		Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	}
	else
	{
		Npc_PercEnable(self,PERC_ASSESSTALK,B_SummonedAssessTalk);
	};
	//дружелюбны к ГГ
	B_SetAttitude(self,ATT_FRIENDLY);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	self.aivar[AIV_Behaviour] = self.aivar[AIV_Behaviour] | BEHAV_Summoned;
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	//время призыва по умолчанию - если не задано иное
	if (self.aivar[AIV_SummonedTime] == 0)	{
		// слугам Белиара в 3 раза дольше!
		if (PATRONGOD == PATRONGOD_Beliar)	{
			self.aivar[AIV_SummonedTime] = 3 * MONSTER_SUMMON_TIME;
		}
		else	{
			self.aivar[AIV_SummonedTime] = MONSTER_SUMMON_TIME;
		};
	};
};

func int ZS_MM_Rtn_Summoned_Loop()
{
	B_MM_WispDetect();
	B_Summoned_TeleportToPlayer();
	if(Npc_GetDistToNpc(self,hero) > 500)
	{
		AI_GotoNpc(self,hero);
	}
	else if(Npc_GetStateTime(self) >= 1)
	{
		//убираем вспомогательный телепорт
		if(Hlp_IsValidNpc(HELPER_Teleport))	{
			Wld_RemoveNpc(HELPER_Teleport);
		};
		//если не видим ГГ - повернуться к нему
		if(!Npc_CanSeeNpc(self,hero))
		{
			AI_TurnToNPC(self,hero);
		};
		// если self.aivar[AIV_SummonedTime] == -1, то время призыва не ограничено
		if (self.aivar[AIV_SummonedTime] >= 0)	{
			self.aivar[AIV_SummonedTime] -= Npc_GetStateTime(self);
			//время вышло?
			if (self.aivar[AIV_SummonedTime] <= 0)	{
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS]);
			};
		};
		Npc_SetStateTime(self,0);
	};
	self.wp = Npc_GetNearestWP(self);
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Summoned_End()
{
};


