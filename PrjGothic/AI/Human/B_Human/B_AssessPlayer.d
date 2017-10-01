/**************************************************************************

							ВОСПРИЯТИЕ ИГРОКА
 
  Персонаж self (я) увидел игрока other (ГГ).

  B_AssessPlayer() вызывается для  обработки восприятия PERC_ASSESSPLAYER
и в скриптах, связанных со следованием за ГГ за персонажем, и наоборот.
Вызывает обработчики восприятий музыки, врага, входа в помещение, угрозы
оружием.

  Обычная реакция: зависит от действий ГГ и свойств персонажа - заговорить,
напасть, начать следить и др. Много вызвов других обработчиков восприятий.

  Тестрование: на Инспектора уровня в роли ГГ никто не обращает внимания.

  Охрана ворот заговорит с ГГ, даже если он плывет, падает, переодет,
преступник. Остальные в этих случаях разговаривать не начнут. Также 
учитывается отказ от диалога (см. C_RefuseTalk). 
Проходящему мимо ГГ соратники по гильдии могут бросить приветствие, 
все прочие - замечание о погоде, но не чаще, чем раз в 20 сек.

***************************************************************************/

//надо ли поговорить?
func void B_AssessPlayer_ImportantInfo()
{
	B_SetNameByIndex(self,-1);
	// если ГГ достаточно близко и у меня есть для него важное сообщение
		/* DEBUG INFO
		PrintSelf("Check important info");
		//*/
	B_AssignAmbientInfos(self);	//тоже могут быть важными!
	if((Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG) && Npc_CheckInfo(self,1))
	{ 
		/* DEBUG INFO
		PrintSelf("I have important info");
		//*/
		// если я охраняю ворота
		if(C_NpcIsGateGuard(self))
		{
			// начать разговор, установив соответствующий флаг
			self.aivar[AIV_NpcStartedTalk] = TRUE;
			B_AssessTalk();
			return; // больше ничего не делать
		}
		// если не охраняю и ГГ 
		else if(!C_BodyStateContains(other,BS_FALL)		// не падает,
			&& !C_BodyStateContains(other,BS_SWIM)		// и не плывет,
			&& !C_BodyStateContains(other,BS_DIVE)  	// и не нырнул,
			&& !C_BodyStateContains(other,BS_CLIMB)  	// и не взбирается,
//			&& (B_GetPlayerCrime(self) == CRIME_NONE)	// и не преступник,
//			&& (C_RefuseTalk(self,other) == FALSE)		// и нет причины отказаться от разговора,
			&& (C_PlayerHasFakeGuild(self,other) == FALSE))	//и у ГГ не ложная гильдия
		{
			// начать разговор, установив соответствующий флаг
			self.aivar[AIV_NpcStartedTalk] = TRUE;
			B_AssessTalk();
			return; // больше ничего не делать
		};
		/* DEBUG INFO
		PrintScreen(IntToString(C_BodyStateContains(other,BS_FALL)), 30, 20, FONT_ScreenSmall, 3);
		PrintScreen(IntToString(C_BodyStateContains(other,BS_SWIM)), 30, 22, FONT_ScreenSmall, 3);
		PrintScreen(IntToString(C_BodyStateContains(other,BS_DIVE)), 30, 24, FONT_ScreenSmall, 3);
		PrintScreen(IntToString(B_GetPlayerCrime(self)), 30, 30, FONT_ScreenSmall, 3);
		PrintScreen(IntToString(C_RefuseTalk(self,other)), 30, 32, FONT_ScreenSmall, 3);
		PrintScreen(IntToString(C_PlayerHasFakeGuild(self,other)), 30, 34, FONT_ScreenSmall, 3);
		//*/
	};	
};

func void B_AssessPlayer()
{

	// НЕ обращать внимания, если ------------------------------------------
	
	// ГГ - Инспектор уровня
	var C_Npc pcl;
	pcl = Hlp_GetNpc(PC_Levelinspektor);
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl))
	{
		/* DEBUG INFO
		PrintSelf("B_AssessPlayer: PC_Levelinspektor");
		//*/
		return;
	};
	
	// ГГ недоступен
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		/* DEBUG INFO
		PrintSelf("B_AssessPlayer: AIV_INVINCIBLE");
		//*/
		return;
	};
	
	// ГГ в отключке
	if(C_NpcIsDown(other))
	{
		/* DEBUG INFO
		PrintSelf("B_AssessPlayer: C_NpcIsDown");
		//*/
		return;
	};
	
	// еще не выбрали ГГ
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PC_Noone))
	{
		/* DEBUG INFO
		PrintSelf("B_AssessPlayer: PC_Noone");
		//*/
		return;
	};
	
	// ПРЕВРАЩЕНИЯ ---------------------------------------------------------
	
	// если ГГ - не человек	
	if(other.guild > GIL_SEPERATOR_HUM)
	{ 
		/* DEBUG INFO
		PrintSelf("B_AssessPlayer: other.guild > GIL_SEPERATOR_HUM");
		//*/
		// если я на страже ворот
		if(C_NpcIsGateGuard(self))
		{
			//вскочить
			AI_StandupQuick(self);
			//и напасть на ГГ как на монстра
			B_Attack(self,other,AR_MonsterCloseToGate,0);
			return; //больше ничего не делать
		}
		// если я не на страже и ГГ во враждебной гильдии
		else if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_HOSTILE)
		{
			// и если я не друг ГГ и мы не в одной команде
			if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (self.npcType != NPCTYPE_FRIEND))
			{
				// напасть на ГГ как на врага по гильдии
				B_Attack(self,other,AR_GuildEnemy,0);
				return; //больше ничего не делать
			};
		};
	};
	
	// ВРАГИ ----------------------------------------------------------------
	
	// если ГГ - враг
	if(B_AssessEnemy())
	{
		/* DEBUG INFO
		PrintSelf("B_AssessPlayer: B_AssessEnemy");
		//*/
		return; // больше ничего не делать
	};
	// если я знаю, что ГГ - убийца, и я готов напасть на убийцу, и расстояние до ГГ меньше среднего
	if((B_GetPlayerCrime(self) == CRIME_MURDER) && C_WantToAttackMurder(self,other)
		&& (Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT))
	{
		// то напасть на ГГ как на убийцу
		B_Attack(self,other,AR_HumanMurderedHuman,0);
		return; //больше ничего не делать
	};
	
	// ДЕЙСТВИЯ ГГ -------------------------------------------------------------

	// если ГГ шарит по карманам у спящего
	if (HERO_ACTION_Pickpocket == PICKPOCKET_Sleep)
	{
		// если я не хочу наказывать вора, то не надо
		if(!C_WantToAttackThief(self,other))
		{ 
			// но если это потому, что я несу охрану входа,
			if(C_NpcIsGateGuard(self))
			{
				B_MemorizePlayerCrime(self,other,CRIME_THEFT);	// запомнить преступление ГГ
			};
		}
		else	//иначе - хочу наказать
		{
			HERO_ACTION_Pickpocket = PICKPOCKET_Fail;	// отметить, что ГГ провалил кражу
			B_Attack(self,other,AR_Theft,1);	// напасть на ГГ как на вора
			return;	// больше ничего
			//NS: ВНИМАНИЕ! Прерывание диалога и пробуждение в цикле сна ЖЕРТВЫ
		};
	};
	
	// реакция на вход в помещение
	if(B_AssessEnterRoom())
	{
		/* DEBUG INFO
		PrintSelf("B_AssessPlayer: B_AssessEnterRoom");
		//*/
		return;
	};
	
	// реакция на обнаженное оружие
	if(B_AssessDrawWeapon())
	{
		/* DEBUG INFO
		PrintSelf("B_AssessPlayer: B_AssessDrawWeapon");
		//*/
		return;
	}
	else // если реакции на обнаженое оружие нет
	{
		// запомнить, что я не просил ГГ убрать оружие
		Player_DrawWeaponComment = FALSE;
	};
	
	// если ГГ крадется
	if(C_BodyStateContains(other,BS_SNEAK))
	{
		// и если я еще не слежу за ГГ, но хочу последить за ним
		if(!Npc_IsInState(self,ZS_ObservePlayer) && C_WantToReactToSneaker(self,other))
		{
			// отказатсья от других действий
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			// начать следить за ГГ
			AI_StartState(self,ZS_ObservePlayer,1,"");
			return; //больше ничего не делать
		};
	}
	// а если не крадется и не стоит
	else if(!C_BodyStateContains(other,BS_STAND))
	{
		// запомнить, что я не спрашивал ГГ, почему он крадется
		Player_SneakerComment = FALSE;
	};
	
	// ТЕСТ если я крадусь
	if (Npc_IsInState(self,ZS_SneakToWp))	{
		if(C_GetNpcPortalGuild(self) <= GIL_OUTDOOR)	{
			Npc_ClearAIQueue(self);
			AI_StartState(self,ZS_ObservePlayer,0,"");
			return;
		}
		else	{
			Npc_ClearAIQueue(self);
			AI_StartState(self,ZS_Flee,0,"");
			return;
		};
	};
	
	// если ГГ не лежит
	if(!C_BodyStateContains(other,BS_LIE))
	{
		// запомнить, что я не требовал, чтобы ГГ убирался из моей кровати
		Player_GetOutOfMyBedComment = FALSE;
	};
	
	// РАЗГОВОРЫ --------------------------------------------------------------

	B_AssessPlayer_ImportantInfo();
	
	//MR ГГ - преступник ----------------------------------------
	//в моде многие запоминают действия ГГ и нападут на него, чтобы доставить на суд
	var int crime;	crime = B_GetKnownPlayerCrime(self);
	if ((crime != CRIME_NONE) && !C_NpcIsGateGuard(self) && (HERO_Imprisoned == 0)
		&& (C_NpcBelongsToCity(self) || C_NpcBelongsToFarm(self) || C_NpcBelongsToMonastery(self)))	{
		if (crime == CRIME_MURDER)	{
			if (C_WantToAttackMurder(self,other))	{
				B_Attack(self,other,AR_HumanMurderedHuman,0);
				return;
			};
		}
		else	if (crime == CRIME_THEFT)	{
			if (C_WantToAttackThief(self,other))	{
				B_Attack(self,other,AR_GuardCalledToThief,0);
				return;
			};
		}
		else	if (crime == CRIME_ATTACK)	{
			if (C_NpcBelongsToMonastery(self) || (self.guild == GIL_MIL))	{
				B_Attack(self,other,AR_GuardStopsFight,0);
				return;
			};
		}
		else	if (crime == CRIME_SHEEPKILLER)	{
			if (C_WantToAttackSheepKiller(self,other))	{
				B_Attack(self,other,AR_SheepKiller,0);
				return;
			};
		};
	};
	
	// если  
	if(C_BodyStateContains(self,BS_WALK) 						// ГГ идет,
		&& (Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG)	// и он достаточно близко,
		&& (Npc_RefuseTalk(other) == FALSE) 					// и не установлена временная задержка диалога,
		&& !C_NpcIsGateGuard(self)								// и я не на страже ворот,
		&& (C_PlayerHasFakeGuild(self,other) == FALSE))			// и ГГ не в ложной гильдии
	{ // то
		// посмотреть на ГГ
		B_LookAtNpc(self,other);
		// поприветствовать его
		B_Say_GuildGreetings(self,other);
		// перестать смотреть на ГГ
		B_StopLookAt(self);
		// установить задержку диалога на 20 сек.
		Npc_SetRefuseTalk(other,20);
	};
	
	// ОХРАНА ВОРОТ ------------------------------------------------------------
	
	// если я на страже ворот и ГГ отошел подальше
	if(C_NpcIsGateGuard(self) && (Npc_GetDistToNpc(self,other) > PERC_DIST_DIALOG))
	{
		// то сбросить счетчик предупреждений
		B_GuardPassageStatusReset(self);
	};
	
	// ГГ странно себя ведет ---------------------------------------------------
	// голый или прыгает как лягушка
	if ((Npc_HasEquippedArmor(other) == FALSE)
		 || (C_BodyStateContains(other,BS_JUMP) || C_BodyStateContains(other,BS_CLIMB))
		 && (Npc_GetTalentSkill(other,NPC_TALENT_ACROBAT) > 0))
	{
		// если мне не все равно и я его вижу 
		if (!HasFlags(self.aivar[AIV_IgnoreFlags],IGNORE_Armor) && !HasFlags(self.flags,NPC_FLAG_FRIEND) && (Hlp_Random(5) == 0)
			&& (Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) && Npc_CanSeeNpc(self,other))	{
			AI_StartState(self,ZS_ObservePlayer,1,"");
		};
	};
	
	//квестовые
	B_OnAssessPlayer();
};



