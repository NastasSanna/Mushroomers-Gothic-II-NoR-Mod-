/**************************************************************************

						ВОСПРИЯТИЕ ПОВРЕЖДЕНИЯ

  Персонаж self (я) почувствовал, что other (он) сделал мне больно.
  
  Функции:

  B_AssessDamage() обрабатывает восприятие PERC_ASSESSDAMAGE и вызывается
в др. скриптах. Вызывает обработчик восприятия врага.

  Обычная реакция: напасть на атаковавшего.
  
  Друзья ГГ в сражении не обращают внимания, если он их бьет.
  Во время сражения нужно сменить прицел на напавшего.
  Если в поле зрения есть враги - не реагировать.
  
***************************************************************************/


func void B_AssessDamage()
{
	/* DEBUG INFO
	if (!Hlp_IsValidNpc(other))
	{
		PrintSelf("No damager");
		return;
	};
	//*/
	
	B_OnDamage();
	
	// сообщить всем о драке
	//Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	
	// Я ПРИЗРАК ---------------------------------------------------------
	
	//если я призрак, и получил соответствующие повреждения
	if(B_GhostSpecialDamage(other,self))
	{
		return; //больше ничего не надо
	};
	
	//я НЕ призрак -----v
	
	// АРЕНА ---------------------------------------------------------------
	
	//если поврежедние получено, когда сражение на арене уже закончено
	if((self.aivar[AIV_ArenaFight] == AF_AFTER) && Npc_IsPlayer(other))
	{ 
		self.aivar[AIV_ArenaFight] = AF_AFTER_PLUS_DAMAGE; //запоминаю некорректное поведение ГГ
		//попытаться остановить ГГ словом
		B_AssessTalk();
		if(self.aivar[AIV_NpcStartedTalk] == TRUE)	{
			return;
		};
	};
	
	//никакого дальнобоя и магии!
	if((self.aivar[AIV_ArenaFight] == AF_RUNNING) && Npc_IsPlayer(other))
	{ 
		if (Npc_IsInFightMode(other,FMODE_FAR) || Npc_IsInFightMode(other,FMODE_MAGIC))	{
			self.aivar[AIV_ArenaFight] = AF_WRONG_WEAPON;
			//попытаться остановить ГГ словом
			B_AssessTalk();
			if(self.aivar[AIV_NpcStartedTalk] == TRUE)	{
				self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_CANCEL;
				return;
			};
		};
	};
	
	// если я не могу драться
	if HasFlags(self.aivar[AIV_MM_Behaviour], BEHAV_NoDamageReaction)
	{
		return;	// ничего не делать
	};
	
	//может, лучше бежать?
	PrintSelfVsOther("Assess Damage - Want to flee?");
	if (C_WantToFlee(self, other))	{
		if (!Npc_IsInState(self,ZS_Flee))	{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			Npc_SetTarget(self,other);
			AI_StartState(self,ZS_Flee,0,"");
		};
		return;
	};
	
	// В ДРАКЕ --------------------------------------------------------------
	
	if(Npc_IsInState(self,ZS_Attack)) // я в режиме борьбы
	{ 		
		/* друзьям все прощают */
		if(Npc_IsPlayer(other)			//если ударил ГГ 
			&& ((self.npcType == NPCTYPE_FRIEND) //и если я друг ГГ 
				|| (self.aivar[AIV_PARTYMEMBER] == TRUE))) //или я с ГГ в одной команде
		{ 
			return; //ничего не делать
		};
		
		/* Персонаж нацелится на ГГ только после второго попадания */
		if(Hlp_GetInstanceID(other) != self.aivar[AIV_LASTTARGET]) //если повреждение нанес не тот, кого я бил перед этим
		{ 
			if((self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID(other)) || (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(hero)))
			{
				//запоминаю причину
				if (other.guild < GIL_SEPERATOR_HUM)
				{
					// для людей
					if (Wld_GetGuildAttitude(self.guild, other.guild) != ATT_HOSTILE)
					{
						// либо реакция на повреждение
						self.aivar[AIV_ATTACKREASON] = AR_ReactToDamage;
					}
					else
					{
						// либо на врага
						self.aivar[AIV_ATTACKREASON] = AR_GuildEnemy;
					};
					// для игрока запоминаем, только если
					if (Npc_IsPlayer(other))
					{
						// до этого не было причины напасть, или прошлая драка уже кончилась
						if ((self.aivar[AIV_LastPlayerAR] == AR_NONE)
							|| (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_CANCEL))
						//м.б. косяк, если когда-то давно дрался с ГГ, но он сбежал
						{
							self.aivar[AIV_LastPlayerAR] = self.aivar[AIV_ATTACKREASON];
						}
						// а если причина есть - возвращаемся к ней
						else
						{
							self.aivar[AIV_ATTACKREASON] = self.aivar[AIV_LastPlayerAR];
						};
					};
				}
				else
				{
					// для монстров
					self.aivar[AIV_ATTACKREASON] = AR_MonsterVsHuman;
				};
				Npc_SetTarget(self,other);
			}
			//в противном случае (ГГ попал по мне первый раз)
			else
			{ 
				self.aivar[AIV_HitByOtherNpc] = Hlp_GetInstanceID(other); //запоминаю, кто на меня напал
			};
		};
		return; //вернуться к драке
	};
	
	// я еще НЕ дерусь ---v
	
	// если я среагировал на врага
	if(B_AssessEnemy())
	{ 
		return; // то больше ничего не надо
	};

	// врагов не видно ---v
	
	//если напавший не игрок и напал он без причины
	if(!Npc_IsPlayer(other) && (other.aivar[AIV_ATTACKREASON] == AR_NONE))
	{ 
		B_Attack(self,other,AR_NONE,0); //тоже напасть без причины и без задержки
		return; //конец
	};
	
	// напал ГГ или у него был повод ---v
	
	// если НЕ дальний бой
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
	
	// во всех остальных случаях
	
	//напасть на атаковавшего по понятной причине
	B_Attack(self,other,AR_ReactToDamage,0);	//немедленная атака в ответ на повреждение
};


