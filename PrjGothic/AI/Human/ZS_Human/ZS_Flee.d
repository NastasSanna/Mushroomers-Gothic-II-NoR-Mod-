/**************************************************************************

								БЕГСТВО

  Персонаж self (я) убегает от other (он).
  
  Бегство прекращается, если удалось оторваться от преследователя или он 
упал (умер или без сознания). После бегства попытаться вылечиться.
  Добавлено: спустя некоторое время, есть вероятность прекратить 
бегство.
  
  Набор восприятий - только врага, магии, повреждения.
  Режим перемещения - бег, со специальной анимацией.
  
***************************************************************************/

// минимальная продолжительность бегства
const int FleeTimeMin = 3;	//сек.

func void ZS_Flee()
{
	PrintSelfVsOther("ZS_Flee");
	// инициализация
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	B_ValidateOther();
	self.aivar[AIV_StateTime] = 0;
	AI_StandUpQuick(self);
	// убрать оружие
	if (self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX] / 3)	{
		// если надо - сообщить о своих намерениях
		if(self.aivar[AIV_LOADGAME] == FALSE)
		{
			B_Say_Overlay(self,other,"$RUNAWAY");
		};
	};
	B_RemoveWeapon(self);
	// перейти на бег
	AI_SetWalkMode(self,NPC_RUN);
	if (self.guild < GIL_SEPERATOR_HUM)	{
		Mdl_ApplyOverlayMds(self,"HUMANS_FLEE.MDS");
	};
};

func int ZS_Flee_Loop()
{
	// определить, от кого бежим
	Npc_GetTarget(self);
	// если я убежал достаточно далеко
	if(Npc_GetDistToNpc(self,other) > FIGHT_DIST_CANCEL)
	{
		// остановиться
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	// если он упал
	if(C_NpcIsDown(other))
	{
		// тоже остановиться
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	// если я бегу уже довольно долго
	if (Npc_GetStateTime(self) > 0)
	{
		self.aivar[AIV_StateTime] += Npc_GetStateTime(self);
		if (self.aivar[AIV_StateTime] > FleeTimeMin)
		{
			// подумать - а не прекратить ли бегство
			if ((!C_WantToFlee(self, other)) && (Hlp_Random(100) < 20))
			{
				Npc_ClearAIQueue(self);
				return LOOP_END;
			};
		};
		Npc_SetStateTime(self,0);
	};
	// иначе - продолжить бегство
	AI_Flee(self);
	return LOOP_CONTINUE;
};

func void ZS_Flee_End()
{
	// перейти к нормальному способу перемещения
	Mdl_RemoveOverlayMds(self,"HUMANS_FLEE.MDS");
	AI_Standup(self);
	// попытаться вылечиться, если удалось сбежать
	if ((Npc_GetDistToNpc(self,other) > FIGHT_DIST_CANCEL) || C_NpcIsDown(other))
	{
		AI_StartState(self,ZS_HealSelf,1,"");
	};
};

