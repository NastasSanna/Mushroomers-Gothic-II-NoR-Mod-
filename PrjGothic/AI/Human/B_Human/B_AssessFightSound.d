/**************************************************************************

						ВОСПРИЯТИЕ ШУМА СРАЖЕНИЯ
 
  Персонаж self (я) слышит, что other (напавший) напал на victim (жертва).

  B_AssessFightSound() вызывается для обработки восприятия 
PERC_ASSESSFIGHTSOUND и из др. скриптов.

  Обычная реакция: начать наблюдать за дракой.
  Если я охранник (телохранитель) - напасть на обидчика.

  Сюжетные особенности: при переодевании в бандита - драка с Эстебаном
и его охраной, нападение на "квестовых" овец не считается преступлением.

***************************************************************************/

//телохранитель защищает
func void B_Attack_BodyGuard(var C_NPC slf, var C_NPC oth)
{
	if (oth.guild < GIL_SEPERATOR_HUM)	{
		B_Attack(slf, oth, AR_ReactToDamage, 0);
	}
	else {
		B_Attack(slf, oth, AR_MonsterVsHuman, 0);
	};
};

//напали на того, кого я охраняю?
func int B_AssessGuardedDamage()
{
	//MEM_Debug("B_AssessGuardedDamage");
	//MEM_Debug(self.name);
	//MEM_Debug(victim.name);
	//MEM_Debug(other.name);
	// я уже сражаюсь - не реагировать
	if (Npc_IsInState(self, ZS_Attack))	{
		return FALSE;
	};

	// если я охранник
	if (HasFlags(self.aivar[AIV_Temper], TEMPER_BodyGuard)) {
		//и я охраняю жертву
		if (C_IsBodyGuard(self,victim)) {
			//то напасть на обидчика
			B_Attack_BodyGuard(self, other);
			return TRUE;
		};
		//а если я охраняю обидчика  и не являюсь другом жертвы
		if (C_IsBodyGuard(self,other)) {
			if (C_NpcGetAttitude(self,victim) != ATT_FRIENDLY)	{
				//то напасть на жертву
				B_Attack_BodyGuard(self, victim);
			}
			else	{
				AI_StartState(self,ZS_WatchFight,0,"");
			};
			return TRUE;
		};
	};
	//если обидчик охранник
	if (HasFlags(other.aivar[AIV_Temper], TEMPER_BodyGuard)) {
		//и он охраняет меня и я не являюсь другом жертвы
		if (C_IsBodyGuard(other, self)) {
			if (C_NpcGetAttitude(self,victim) != ATT_FRIENDLY)	{
				//то напасть на жертву
				B_Attack_BodyGuard(self, victim);
			}
			else	{
				AI_StartState(self,ZS_WatchFight,0,"");
			};
			return TRUE;
		};
	};
	//если жертва охранник
	if (HasFlags(victim.aivar[AIV_Temper], TEMPER_BodyGuard)) {
		//и он охраняет меня
		if (C_IsBodyGuard(victim, self)) {
			//то напасть на обидчика
			B_Attack_BodyGuard(self, other);
			return TRUE;
		};
	};
	//иначе - нет
	return FALSE;
};

func void B_AssessFightSound()
{
	//НЕ обращать внимания, если -------------------------------------------
	
	// нет жертвы
	if(!Hlp_IsValidNpc(victim))
	{
		return;
	};
	
	//игнорировать драку
	if (HasFlags(self.aivar[AIV_IgnoreFlags], IGNORE_FightSound)) {
		return;
	};

	// если расстояние до дерущихся больше среднего, 
	if((Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT))
	{
		//за исключением случаев, когда	я - чужак или бандит, а один из дерущихся - мой соратник
		//NS: вот у кого взаимовыручка!
		if(((self.guild == GIL_OUT)	|| (self.guild == GIL_BDT))
			&& ((victim.guild == self.guild) || (other.guild == self.guild)))
		{
		}
		else
		{
			return;
		};
	};
	
	// если я не люблю залезать в воду,
	if(!HasFlags(self.aivar[AIV_MM_Behaviour], BEHAV_FollowInWater))
	{
		// а один из дерущихся плывет или нырнул
		if(C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE)
			|| C_BodyStateContains(victim,BS_SWIM) || C_BodyStateContains(victim,BS_DIVE))
		{
			return;
		};
	};
	
	// если один из дерущихся на посту
	if((other.fight_tactic == FAI_NAILED) || (victim.fight_tactic == FAI_NAILED))
	{
		return;
	};
	
	// если дерущиеся слишком высоко
	if((Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT) && (Npc_GetHeightToNpc(self,victim) > PERC_DIST_HEIGHT))
	{
		return;
	};
	
	// если я в помещении, а они - нет, и я их не вижу
	if((C_GetNpcPortalGuild(self) != GIL_OUTDOOR) && 
		((C_GetNpcPortalGuild(self) != C_GetNpcPortalGuild(other)) && (C_GetNpcPortalGuild(self) != C_GetNpcPortalGuild(victim))) ||
		((Npc_GetHeightToNpc(self,other) > 500) && (Npc_GetHeightToNpc(self,victim) > 500)) &&
		(!Npc_CanSeeNpc(self,other) && !Npc_CanSeeNpc(self,victim)))
	{
		return;
	};
	
	// если дело происходит в монастыре и напавший дальше 5м по вертикали //NS: видимо, для подземелий монастыря
	if((Npc_GetHeightToNpc(self,other) > 500) && (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_04") <= 3000))
	{
		return;
	};
	
	// я сам - жертва или напавший
	if((Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(self)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(self)))
	{
		return;
	};
	
	
	// ОВЦЫ ----------------------------------------------------------------
	
	// если жертва - овца, но не квестовая
	if((victim.guild == GIL_SHEEP) && (!HasFlags(victim.aivar[AIV_StoryFlags], STORY_Sheep)))
	{
		// и если я не потерплю нападения на овцу,
		if(C_WantToAttackSheepKiller(self,other))
		{
			// то напасть на обидчика
			B_Attack(self,other,AR_SheepKiller,0);
			return;
		}
		// а если потерплю, но потому что я несу охрану ворот,
		else if(C_NpcIsGateGuard(self))
		{
			// то запомнить, что напавший совершил преступление
			B_MemorizePlayerCrime(self,other,CRIME_SHEEPKILLER);
			return; // и больше ничего не делать
		};
		// в остальных случаях - не обращать на овцу внимания
		return;
	};
		
	//еще НЕ обращать внимания, если ----------------------------------------
	
	//я несу охрану ворот или я прячусь
	if(C_NpcIsGateGuard(self) || HasFlags(self.aivar[AIV_Behaviour], BEHAV_Hidden))
	{
		return;
	};
	
	// оба дерущихся - не люди (монстры)
	if((other.guild > GIL_SEPERATOR_HUM) && (victim.guild > GIL_SEPERATOR_HUM))
	{
		return;
	};
	
	// жертва - безобидный монстр
	if((victim.guild > GIL_SEPERATOR_HUM) &&
		(HasAnyFlags(victim.aivar[AIV_TEMPER], TEMPER_NoFightParker) || (C_NpcGetAttitude(self,victim) != ATT_HOSTILE)))
	{
		return;
	};
	
	// ----------------------------------------------------------------------
	
	// если напавший - монстр, и я не враг жертвы
	if((other.guild > GIL_SEPERATOR_HUM) && (C_NpcGetAttitude(self,victim) != ATT_HOSTILE))
	{
		// то напасть на монстра
		B_Attack(self,other,AR_MonsterVsHuman,0);
		return;
	};
	
	// если жертва - монстр, и я не враг нападавшему, и жерва еще не убита
	if((victim.guild > GIL_SEPERATOR_HUM) && (C_NpcGetAttitude(self,other) != ATT_HOSTILE) && !Npc_IsDead(victim))
	{
		// то присоединиться к атаке на монстра
		B_Attack(self,victim,AR_MonsterVsHuman,0);
		return;
	};
	
	// если мне запрещено нападать на врагов
	if ((self.aivar[AIV_EnemyOverride] == TRUE)
		&& ((C_NpcGetAttitude(self,other) == ATT_HOSTILE) || (C_NpcGetAttitude(self,victim) == ATT_FRIENDLY))) //NS: добавлено
	{
		// снять запрет
		self.aivar[AIV_EnemyOverride] = FALSE;
		// прицелиться
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
		// и если напавший еще в игре
		if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
		{
			// атаковать его как врага по гильдии
			B_Attack(self,other,AR_GuildEnemy,0);
			return;
		};
		return;
	};
	
	// ЕЩЕ НЕ ДЕРУТСЯ ----------------------------------------------------------
	
	
	// жертва - мой друг, но он еще не ответил напавшему
	if (C_NpcGetAttitude(self,victim) == ATT_FRIENDLY)
	{
		if (Npc_IsInState(victim,ZS_ReactToDamage))
		{
			return;
		};
		if(Npc_IsInFightMode(other,FMODE_MELEE)		//если противник готов к бою на кулаках 
			|| Npc_IsInFightMode(other,FMODE_FIST) 	//или с оружием ближнего боя
			|| Npc_IsInFightMode(other,FMODE_NONE))	//или не готов к бою
		{ 
			//и напавший - мой друг ГГ
			if((C_NpcGetAttitude(self,other) == ATT_FRIENDLY) || ((self.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(other)))
			{ 
				//и я еще не среагировал на нападение 
				if(!Npc_IsInState(self,ZS_ReactToDamage))
				{ 
					// сброс других действий и восприятий
					Npc_ClearAIQueue(self);		
					B_ClearPerceptions(self);	
					// перейти к устной разборке
					AI_StartState(self,ZS_ReactToDamage,0,"");	//немедленная реакция на повреждение, не сходя с места
					return; //конец
				};
			};
		};
	};
	
	// ОХРАНА ------------------------------------------------------------------
	/* действует сообща */
	
	// если у нападавшего был серьезный повод убить жертву: 
	if(((other.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder)	//вторжение,
		|| (other.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate)	//приближение монстра,
		|| (other.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)	//убийство,
		|| (other.aivar[AIV_ATTACKREASON] == AR_GuildEnemy)			//враг по гильдии,
		|| (other.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill))	//охранник собирается убить жертву,
		&& (C_NpcGetAttitude(self,other) == ATT_FRIENDLY)) // и я друг напавшего,
	{
		// то присоединиться к нападению, чтобы убить жертву
		B_Attack(self,victim,AR_GuardCalledToKill,0);
		return;
	};
	
	// при аналогичных условиях для жертвы
	if(((victim.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder)
		|| (victim.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate)
		|| (victim.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
		|| (victim.aivar[AIV_ATTACKREASON] == AR_GuildEnemy)
		|| (victim.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill))
		&& (C_NpcGetAttitude(self,victim) == ATT_FRIENDLY))
	{
		// присоединиться к жертве, чтобы убить нападавшего
		B_Attack(self,other,AR_GuardCalledToKill,0);
		return;
	};
	
	// если повод напасть был, но не такой серьезный:	
	if(((other.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight)	//прекращение драки,
		|| (other.aivar[AIV_ATTACKREASON] == AR_ReactToDamage)	//ответ на повреждение,
		|| (other.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon))	//ответ на угрозу оружием,
		&& (C_NpcGetAttitude(self,other) == ATT_FRIENDLY)) // и я друг напавшего
	{ // то
		// кроме случаев, когда
		if(((other.guild == GIL_SLD) || (other.guild == GIL_NONE))
			&& ((victim.guild == GIL_SLD) || (victim.guild == GIL_NONE)))
		{  // оба дерущихся из гильдий наемников, охотников на драконов или без гильдии,
		}
		else if(!Npc_IsPlayer(other) && !Npc_IsPlayer(victim)) 
		{  // или в драке не участвует ГГ,
		}
		else if (Npc_IsInState(other,ZS_ReactToDamage))
		{	// пока еще не деремся 
		}
		//иначе
		else 
		{
			// присоединиться к нападению, но жертву не убивать
			B_Attack(self,victim,AR_GuardStopsFight,0);
			return;
		};
	};
	
	// аналогично для жертвы
	if(((victim.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight)
		|| (victim.aivar[AIV_ATTACKREASON] == AR_ReactToDamage)
		|| (victim.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon))
		&& (C_NpcGetAttitude(self,victim) == ATT_FRIENDLY))
	{
		if(((other.guild == GIL_SLD) || (other.guild == GIL_NONE))
			&& ((victim.guild == GIL_SLD) || (victim.guild == GIL_NONE)))
		{
		}
		else if(!Npc_IsPlayer(other) && !Npc_IsPlayer(victim))
		{
		}
		else if (Npc_IsInState(victim,ZS_ReactToDamage))
		{
		}
		else
		{
			// присоединиться к жертве, но напавшего не убивать
			B_Attack(self,other,AR_GuardStopsFight,0);
			return;
		};
	};
	
	// ОХРАННИКИ -----------------------------------------------------------
	if (B_AssessGuardedDamage()) {
		return;
	};
	
	// ОПОЛЧЕНИЕ ---------------------------------------------------------------
	
	// если у нападавшего и у жертвы не было причины для драки, или один хочет другого убить,
	if (self.guild == GIL_MIL)	{
		if(((other.aivar[AIV_ATTACKREASON] == AR_NONE) || (other.aivar[AIV_ATTACKREASON] == AR_KILL))
			&& ((victim.aivar[AIV_ATTACKREASON] == AR_NONE) || (victim.aivar[AIV_ATTACKREASON] == AR_KILL)))
		{ // то
			// если я друг напавшего, но не друг жертвы
			if((C_NpcGetAttitude(self,other) == ATT_FRIENDLY) && (C_NpcGetAttitude(self,victim) != ATT_FRIENDLY))
			{
				// остановить жертву
				B_Attack(self,victim,AR_GuardStopsFight,0);
				return;
			}
			// если я друг жертвы, но не друг напавшего
			else if((C_NpcGetAttitude(self,victim) == ATT_FRIENDLY) && (C_NpcGetAttitude(self,other) != ATT_FRIENDLY))
			{
				// остановить напавшего
				B_Attack(self,other,AR_GuardStopsFight,0);
				return;
			}
			/* если напавший - ГГ
			else if(Npc_IsPlayer(other))
			{
				// остановить жертву
				B_Attack(self,victim,AR_GuardStopsFight,0);
				return;
			}
			// если ГГ - жертва
			else if(Npc_IsPlayer(victim))
			{
				// остановить напавшего
				B_Attack(self,other,AR_GuardStopsFight,0);
				return;
			}
			//*/
			// во всех остальных случаях
			else
			{
				// остановить напавшего
				B_Attack(self,other,AR_GuardStopsFight,0);
				return;
			};
		};
	};
	
	// ЗАЩИТА СОБСТВЕННОСТИ --------------------------------------------
	
	// если напавший защищал собственность:
	if(((other.aivar[AIV_ATTACKREASON] == AR_UseMob)		//от запрещенного использования
		|| (other.aivar[AIV_ATTACKREASON] == AR_Theft)		//от воровства
		|| (other.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom))	//от вторжения
	&& (C_NpcGetAttitude(self,other) == ATT_FRIENDLY)) // и я его друг
	{
		// и если я готов напасть на вора-жертву
		if(C_WantToAttackThief(self,victim))
		{
			// то напасть
			B_Attack(self,victim,AR_GuardCalledToThief,0);
		};
		return; // больше ничего не делать
	};
	// аналогично для жертвы
	if(((victim.aivar[AIV_ATTACKREASON] == AR_UseMob)
		|| (victim.aivar[AIV_ATTACKREASON] == AR_Theft)
		|| (victim.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom))
	&& (C_NpcGetAttitude(self,victim) == ATT_FRIENDLY))
	{
		if(C_WantToAttackThief(self,other))
		{
			B_Attack(self,other,AR_GuardCalledToThief,0);
		};
		return;
	};
	
	
	// если напавший выгоняет непрошенного гостя и я его друг,
	if((other.aivar[AIV_ATTACKREASON] == AR_ClearRoom) && (C_NpcGetAttitude(self,other) == ATT_FRIENDLY))
	{
		// то напасть, как охраннику помещения (вне зависимости от реальной гильдии и статуса)
		B_Attack(self,victim,AR_GuardCalledToRoom,0);
		return;
	};
	// аналогично для жертвы
	if((victim.aivar[AIV_ATTACKREASON] == AR_ClearRoom) && (C_NpcGetAttitude(self,victim) == ATT_FRIENDLY))
	{
		B_Attack(self,other,AR_GuardCalledToRoom,0);
		return;
	};
	
	// ----------------------------------------------------------------
	
	// если расстояние до дерущихся больше среднего
	//NS: проверка расстояния уже была, но теперь и для бандитов тоже
	if((Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT))
	{
		return; // ничего не делать
	};
	
	// если я враг жертвы или нападавшего
	if((C_NpcGetAttitude(self,other) == ATT_HOSTILE) || (C_NpcGetAttitude(self,victim) == ATT_HOSTILE))
	{
		// и если я не бандит
		if(self.guild != GIL_BDT)
		{ 
			return; // ничего не делать
		};
	};
	
	
	// если я не могу засечь жертву по прямой 
	if(!Npc_CanSeeNpcFreeLOS(self,victim))
	{
		return; // ничего не делать
	};
		
	// в всех остальных случаях
	// отложить остальные дела
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	// и начать наблюдать за дракой
	AI_StartState(self,ZS_WatchFight,0,"");
};




