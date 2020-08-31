/**************************************************************************

							ВОСПРИЯТИЕ РАЗГОВОРА
 
  Персонаж self (я) услышал, что к нему обратился other (ГГ).

  B_AssessTalk() вызывается для обработки восприятия PERC_ASSESSTALK
и из др. скриптов. Вызывает обработчик восприятия врага.

  Обрабатывает восприятие и для монстров (орков).

  Обычная реакция: начать разговор.

  Тестирование: если ГГ - Рокфеллер или Инспектор уровня, то на
экран выводится отладочная информация, а разговор не состоится.

***************************************************************************/


func void B_AssessTalk()
{
	// ----------------------------------------------------------------
	
	// внутренние переменные
	var C_Npc pcl; //Инспектор уровня
	var C_Npc pcr; //Рокфеллер
	var int rnd;
	pcl = Hlp_GetNpc(PC_Levelinspektor);
	pcr = Hlp_GetNpc(PC_Rockefeller);
	
	// если ГГ - Инспектор уровня или Рокфеллер
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcr)))
	{ // то вывести отладочную информацию
		// мой номер голоса
		PrintScreen(ConcatStrings("Voice:",IntToString(self.voice)),-1,70,FONT_Screen,2); 
		// "Нет ГГ!"
		PrintScreen("NO HERO!",-1,-1,FONT_Screen,2); 
		// дистанция, на которой я должен следовать за ГГ
		PrintScreen(IntToString(self.aivar[AIV_FollowDist]),-1,70,FONT_Screen,2);
		// название квартала, в котором происходит разговор
 		if(C_NpcIsInQuarter(self) == Q_KASERNE)
		{
			PrintScreen("Q_BARRACKS",-1,30,FONT_Screen,2);
		};
		if(C_NpcIsInQuarter(self) == Q_GALGEN)
		{
			PrintScreen("Q_GALLOWS",-1,30,FONT_Screen,2);
		};
		if(C_NpcIsInQuarter(self) == Q_MARKT)
		{
			PrintScreen("Q_MARKET",-1,30,FONT_Screen,2);
		};
		if(C_NpcIsInQuarter(self) == Q_TEMPEL)
		{
			PrintScreen("Q_TEMPLE",-1,30,FONT_Screen,2);
		};
		if(C_NpcIsInQuarter(self) == Q_UNTERSTADT)
		{
			PrintScreen("Q_LOWER CITY",-1,30,FONT_Screen,2);
		};
		if(C_NpcIsInQuarter(self) == Q_HAFEN)
		{
			PrintScreen("Q_HARBOR",-1,30,FONT_Screen,2);
		};
		if(C_NpcIsInQuarter(self) == Q_OBERSTADT)
		{
			PrintScreen("Q_UPPER CITY",-1,30,FONT_Screen,2);
		};
		return; // не разговаривать
	};
	
	//NS - Mushroomers ----------------------------------------------------
	// потенциальные ГГ сразу разговаривают
	if (self.npcType == NPCTYPE_HERO)	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_Talk,0,"");
		return;
	};
	
	// --------------------------------------------------------------------
	
	// если я не человек
	if(self.guild > GIL_SEPERATOR_HUM)
	{
		// и у меня нет диалога с ГГ
		if ((Npc_CheckInfo(self,1) == FALSE) && (Npc_CheckInfo(self,0) == FALSE))
		{
			return; // не разговаривать
		};
	};
	
	// если я человек
	if(self.guild < GIL_SEPERATOR_HUM)
	{ // то
		// если ГГ - враг
		if(B_AssessEnemy())
		{
			return; // не разговаривать
		};
		// если ГГ - убийца, и я готов наказать убийцу
		if((B_GetPlayerCrime(self) == CRIME_MURDER) && C_WantToAttackMurder(self,other))
		{
			// то напасть на ГГ как на убийцу
			B_Attack(self,other,AR_HumanMurderedHuman,0);
			return; // и не разговаривать
		};
		// если я не хочу разговаривать с ГГ
		if(C_RefuseTalk(self,other))
		{ // то
			// если это потому, что он одет неподобающе (фальшивая гильдия)
			if(C_PlayerHasFakeGuild(self,other))
			{
				// отменить другие действия
				Npc_ClearAIQueue(self);
				// высказать ГГ свое мнение по этому поводу
				AI_StartState(self,ZS_CommentFakeGuild,1,"");
				return; // больше ничего не говорить
			}
			else  // если причина в другом
			{
				// сказать, чтоб отстал
				B_Say(self,other,"$NOTNOW");
				return; // больше ничего не говорить
			};
		};
	};
	
	// если не я начал беседу
	if(self.aivar[AIV_NpcStartedTalk] == FALSE)
	{
		// и если я иду или бегу
		if(C_BodyStateContains(self,BS_WALK) || C_BodyStateContains(self,BS_RUN))
		{
			// то ГГ просит подождать
			B_Say(other,self,"$SC_HEYWAITASECOND");
		}
		// в других состояниях, если я не смотрю на ГГ
		else if(!Npc_CanSeeNpc(self,other))
		{
			// то он просит повернуться, с равной вероятностью используя одну из 4 фраз
			//NS: некоторые фразы совпадают, так что по факту их только 2 
			//MR послушник Одо обращается к магам "Мастер"
			if (other.guild == GIL_NOV && self.guild == GIL_KDF) {
				B_Say(other,self,"$SC_HEYTURNAROUND04");
			}
			else {
				rnd = Hlp_Random(100);
				if(rnd <= 25)
				{
					B_Say(other,self,"$SC_HEYTURNAROUND");
				}
				else if(rnd <= 50)
				{
					B_Say(other,self,"$SC_HEYTURNAROUND02");
				}
				else if(rnd <= 75)
				{
					B_Say(other,self,"$SC_HEYTURNAROUND03");
				}
				else if(rnd <= 99)
				{
					B_Say(other,self,"$SC_HEYTURNAROUND04");
				};
			};
		};
	};
	
	// отменить все другие действия и восприятия
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	
	// если я сижу
	if(C_BodyStateContains(self,BS_SIT))
	{
		// встать
		if(self.aivar[AIV_NpcStartedTalk] == TRUE) // если я сам начал диалог
		{
			AI_StandupQuick(other); // то ГГ быстро вскакивает
		}
		else // иначе
		{
			AI_Standup(other); // ГГ встает, закончив предыдущее действие
		};
		// если я могу видеть ГГ
		if(Npc_CanSeeNpc(self,other))
		{
			// немедленно начать разговор (сидя)
			AI_StartState(self,ZS_Talk,0,"");
		}
		else // если не вижу
		{
			// встать, если я слежу за ГГ
			if(Npc_IsInState(self,ZS_ObservePlayer))
			{
				AI_Standup(self);
			};
			// начать разговор после того, как встану
			AI_StartState(self,ZS_Talk,1,"");
		};
		return; // больше ничего не делать
	};
	// если не сижу - встать (остановиться) обоим
	if(self.aivar[AIV_NpcStartedTalk] == TRUE) // если я сам начал разговор
	{
		// то быстро
		AI_StandupQuick(self);
		AI_StandupQuick(other);
	}
	else // если разговор начал ГГ
	{
		// то закончить предыдущее действие
		AI_Standup(self);
		AI_Standup(other);
	};
	// немедленно начать разговор
	AI_StartState(self,ZS_Talk,0,"");
	return;
};

