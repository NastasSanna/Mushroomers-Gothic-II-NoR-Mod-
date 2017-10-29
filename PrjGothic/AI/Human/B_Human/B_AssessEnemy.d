/**************************************************************************

							ВОСПРИЯТИЕ ВРАГА
 
  Персонаж self (я) заметил врага other (он).

  B_AssessEnemy() возвращает TRUE, если я перешел в атаку, если нет - FALSE.
Вызывается для обрабтки восприятия PERC_ASSESSENEMY и из др. скриптов.

  Обычное поведение: напасть на врага.

  Тестирование: на Инспектора уровня никто не нападает

***************************************************************************/

func int B_AssessEnemy()
{
	//внутренние переменные персонажей
	var C_Npc pcl;	//Инспектор уровня
	var C_Npc mgo;	//магический голем
	var C_Npc lar;	//Ларс
	
	/* DEBUG INFO
	var string txt;
	//*/
	
	//НЕ нападать, если ----------------------------------------------------
	
	// он Инспектор (уровня)
	pcl = Hlp_GetNpc(PC_Levelinspektor);
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl))
	{
		/* DEBUG INFO
		txt = "No attack - PC_Levelinspektor.";
		PrintSelfVsOther(txt);
		//*/
		return FALSE;
	};
	
	// один из нас безобиден
	if(((!Npc_IsPlayer(other)) && (other.guild < GIL_SEPERATOR_HUM) // враг - человек, но не ГГ
		&& (HasFlags(self.aivar[AIV_Temper] | other.aivar[AIV_Temper], TEMPER_NoFightParker))) // и один из нас - пацифист,
		|| ((other.guild > GIL_SEPERATOR_HUM) && HasFlags(other.aivar[AIV_Temper], TEMPER_NoFightParker))) // или враг - безобидный монстр
	{
		/* DEBUG INFO
		txt = "No attack - NoFightParker.";
		PrintSelfVsOther(txt);
		//*/
		return FALSE;
	};
	
	// один из нас прячется
	if (HasFlags(self.aivar[AIV_Behaviour] | other.aivar[AIV_Behaviour], BEHAV_Hidden)
		 && (Npc_GetDistToNpc(self,other) > 100))	// но с очень близкого расстояния все же заметен
	{
		return FALSE;
	};
	
	// он невидимый
	if (HasFlags(other.aivar[AIV_Behaviour], BEHAV_Invisible))
	{
		return FALSE;
	};
	
	// мне велено игнорировать врагов
	if (HasFlags(other.aivar[AIV_IgnoreFlags], IGNORE_Enemy))
	{
		return FALSE;
	};
	
	// он плывет или нырнул или я сам угодил-таки в воду, а я не хочу туда лезть
	if(!C_WantToFollowInWater(self, other))
	{
		/* DEBUG INFO
		txt = "No attack - no water, please!";
		PrintSelfVsOther(txt);
		//*/
		return FALSE;
	};
		
	// он слишком высоко
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		/* DEBUG INFO
		txt = "No attack - too high.";
		PrintSelfVsOther(txt);
		//*/
		return FALSE;
	};
	
	/* не отвлекаться в отряде ГГ */
	if(self.aivar[AIV_PARTYMEMBER] == TRUE) // я в команде с ГГ, а
	{
		if(Npc_GetDistToNpc(self,other) > 1500) // он (враг) дальше 15м
		{
			return FALSE;
		};
		if(!Npc_CanSeeNpc(self,other)) // я его (врага) не вижу
		{
			return FALSE;
		};
	};
	
	// есть запрет на нападение
	if(((self.aivar[AIV_EnemyOverride] == TRUE) || (other.aivar[AIV_EnemyOverride] == TRUE)) //мне или ему запрещено нападть
		&& (other.guild < GIL_SEPERATOR_HUM)) //и он человек
	{
		/* DEBUG INFO
		txt = "No attack - EnemyOverride.";
		PrintSelfVsOther(txt);
		//*/
		return FALSE;
	};
	
	// он вовсе и не враг //PB: уловитель, на случай вызова функции не из-за восприятия
	if(C_NpcGetAttitude(self,other) != ATT_HOSTILE)
	{
		/* DEBUG INFO
		txt = "No attack - no enemy.";
		PrintSelfVsOther(txt);
		//*/
		return FALSE;
	};
	
	// я охраняю ворота //NS: пост не покидать ни при каких обстоятельствах!
	if(C_NpcIsGateGuard(self))
	{
		/* DEBUG INFO
		txt = "No attack - I'm gate guard.";
		PrintSelfVsOther(txt);
		//*/
		return FALSE;
	};
	
	// он ГГ, а я его друг
	if(Npc_IsPlayer(other) && (self.npcType == NPCTYPE_FRIEND))
	{
		/* DEBUG INFO
		txt = "No attack - this is my friend Hero!";
		PrintSelfVsOther(txt);
		//*/
		return FALSE;
	};
	
	//может, лучше бежать?
	//PrintSelfVsOther("Assess Enemy - Want to flee?");
	if (C_WantToFlee(self, other))	{
		if (!Npc_IsInState(self,ZS_Flee))	{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			Npc_SetTarget(self,other);
			AI_StartState(self,ZS_Flee,0,"");
		};
		return TRUE;
	};

	//------------------------------------------------------------------------
	
	/* проверка личной неприязни к ГГ */
	
	// мы не во враждебных гильдиях
	if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)
	{
		/* DEBUG INFO
		txt = "Guilds are not hostile...";
		PrintSelfVsOther(txt);
		//*/
		//но в данный момнет - мы близкие враги
		if((C_NpcGetAttitude(self,other) == ATT_HOSTILE)						// но он мой личный враг (только для ГГ)
			// && Npc_IsPlayer(other) 										// и он ГГ (закомментированно пираньями)			
			&& ((Npc_GetStateTime(self) > 2)								// и я уже сделал паузу 2сек.
				|| Npc_IsInState(self,ZS_ObservePlayer))	 					//или я наблюдаю за ГГ
			&& (Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT))		// и расстояние между нами меньше среднего
		{ 
			//немедленно напасть на него по той же причине, что и до этого
			B_Attack(self,other,self.aivar[AIV_LastPlayerAR],0); 
			return TRUE;
		}
		// в противном случае - не нападать или подождать
		else
		{
			return FALSE;
		};
	};
	
	/* DEBUG INFO
	txt = "Attack!!!";
	PrintSelfvsOther(txt);
	//*/
	
	// во всех остальных случаях
	B_Attack(self,other,AR_GuildEnemy,0); //немедленно напасть на него как на представителя враждебной гильдии
	return TRUE;
};




