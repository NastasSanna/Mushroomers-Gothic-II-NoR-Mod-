/**************************************************************************

						КОММЕНТАРИЙ ПОСЛЕ СРАЖЕНИЯ

  B_Say_AttackEnd	()
  Персонаж self (я) комментирует завершение драки с other (он, побежденый). 
  
  Я обязательно принимал участие в драке, не не обязательно я нанес последний удар.
  Конкретный комментарий зависит от:
   - причины драки;
   - убит он или нет;
   - он человек или монстр.
  Некоторые фразы выбираются случайно.
  
  Сюжетные особенности: Фразы по поводу смерти монстров отличаются от обычных
для определенного персонажа/голоса (9, 12 - Горн).
  
  Связаные файлы:
 стандартные фразы					 				Story\SVM.d
 функция B_Say										AI\Human\B_Human\B_say.d

***************************************************************************/


func void B_Say_AttackEnd()
{
	var int rnd;
	
	// ПО ПРИЧИНАМ НАПАДЕНИЯ ------------------------------------------------
	
	// мы враги
	if((self.aivar[AIV_ATTACKREASON] == AR_GuildEnemy) || (self.aivar[AIV_ATTACKREASON] == AR_MonsterMurderedHuman))
	{
		// если он человек
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			// и если он не умер
			if(!Npc_IsDead(other))
			{
				// и если я с ним сражался 
				if(self.aivar[AIV_LASTTARGET] == Hlp_GetInstanceID(other))
				{
					if (other.aivar[AIV_Gender] == MALE)	{
						B_Say(self,other,"$KILLENEMY");	// сказать, что я его убью
					}
					else	{
						B_Say(self,other,"$KILLENEMY_F");	// сказать, что я ее убью
					};
				}
				else
				{
					if (other.aivar[AIV_Gender] == MALE)	{
						B_Say(self,other,"$GOODKILL");	// сказать, что он получил по заслугам
					}
					else	{
						B_Say(self,other,"$GOODKILL_F");	// сказать, что она получила по заслугам
					};
				};
			}
			// если он убит
			else 
			{
				if (other.aivar[AIV_Gender] == MALE)	{
					B_Say(self,other,"$ENEMYKILLED");	// сказать, что он заслужил смерть
				}
				else	{
					B_Say(self,other,"$ENEMYKILLED_F");	// сказать, что она заслужила смерть
				};
			};
		}
		// если он монстр
		else 
		{
			// если я в команде ГГ
			if(self.aivar[AIV_PARTYMEMBER] == TRUE)
			{
				// с вероятностью 85% комментария не будет,
				// кроме случаев, когда он - дракон (для них комментарий обязателен)
				rnd = Hlp_Random(100);
				if((rnd >= 15) && (other.guild != GIL_DRAGON))
				{
					return; // не комментировать
				};
			};
			
			// если его убил не ГГ
			if(other.aivar[AIV_KilledByPlayer] == FALSE)
			{
				// и если мой голос - 9 (есть нужная фраза)
				if(self.voice == 9)
				{
					// с равной вероятностью выдать одну из фраз по поводу смерти монстра
					rnd = Hlp_Random(100);
					if(rnd < 50)
					{
						B_Say(self,other,"$ADDON_MONSTERKILLED");
					}
					else
					{
						B_Say(self,other,"$ADDON_MONSTERKILLED2");
					};
				}
				// или если мой голос - 12 (есть нужная фраза)
				else if(self.voice == 12)
				{
					B_Say(self,other,"$ADDON_MONSTERKILLED"); // порадоваться смерти монстра (аддон)
				}
				else // для всех остальных голосов
				{
					B_Say(self,other,"$MONSTERKILLED"); // порадоваться смерти монстра (обычный)
				};
			}
			else // если его (монстра) убил ГГ
			{
				B_Say(self,other,"$GOODMONSTERKILL");
			};
		};
		return;  // больше никаких комментариев
	};
	
	// он вор
	if(self.aivar[AIV_ATTACKREASON] == AR_Theft)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say(self,other,"$THIEFDOWN");			//сказать, чтоб больше не воровал
		}
		else	{
			B_Say(self,other,"$THIEFDOWN_F");			//сказать, чтоб больше не воровала
		};
		return;  // больше никаких комментариев
	};
	
	// он воспользовался чужим объектом (влез в сундук)
	if(self.aivar[AIV_ATTACKREASON] == AR_UseMob)
	{
		B_Say(self,other,"$RUMFUMMLERDOWN");	//сказать, чтоб держал руки при себе
		return;  // больше никаких комментариев
	};
	
	// он убил овцу
	if(self.aivar[AIV_ATTACKREASON] == AR_SheepKiller)
	{
		// если он человек
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			B_Say(self,other,"$SHEEPATTACKERDOWN");	//сказать, чтоб не трогал овец
		}
		else // если он монстр
		{
			B_Say(self,other,"$MONSTERKILLED");		//порадоваться смерти монстра
		};
		return;  // больше никаких комментариев
	};
	
	// убийство
	if(self.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
	{
		// если он не мертв
		if(!Npc_IsDead(other))
		{
			// и я сражался с ним
			if(self.aivar[AIV_LASTTARGET] == Hlp_GetInstanceID(other))
			{
				B_Say(self,other,"$KILLMURDERER");	//сказать, что убийца должен умереть
			}
			else
			{
				if (other.aivar[AIV_Gender] == MALE)	{
					B_Say(self,other,"$GOODKILL");	// сказать, что он получил по заслугам
				}
				else	{
					B_Say(self,other,"$GOODKILL_F");	// сказать, что она получила по заслугам
				};
			};
		}
		else // если он мертв
		{
			if (other.aivar[AIV_Gender] == MALE)	{
				B_Say(self,other,"$ENEMYKILLED");	// сказать, что он заслужил смерть
			}
			else	{
				B_Say(self,other,"$ENEMYKILLED_F");	// сказать, что она заслужила смерть
			};
		};
		return;  // больше никаких комментариев
	};
	
	// монстр напал на человека
	if(self.aivar[AIV_ATTACKREASON] == AR_MonsterVsHuman)
	{
		// если мой голос 9 или 12 (есть нужная фраза)
		if((self.voice == 9) || (self.voice == 12))
		{
			B_Say(self,other,"$ADDON_MONSTERKILLED");	//порадоваться, что монстр убит (аддон)
		}
		else
		{
			B_Say(self,other,"$MONSTERKILLED");		//порадоваться, что монстр убит (обычный)
		};
		return;  // больше никаких комментариев
	};
	
	// монстр приблизился к воротам
	if(self.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate)
	{
		B_Say(self,other,"$STUPIDBEASTKILLED");		//прокомментировать умственные способности монстра
		return;
	};
	
	// он первый начал
	if(self.aivar[AIV_ATTACKREASON] == AR_ReactToDamage)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say(self,other,"$NEVERHITMEAGAIN");	//сказать, чтоб больше так не делал
		}
		else	{
			B_Say(self,other,"$NEVERHITMEAGAIN_F");	//сказать, чтоб больше так не делала
		};
		return;
	};
	
	// угроза оружием
	if(self.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)
	{
		B_Say(self,other,"$YOUBETTERSHOULDHAVELISTENED");	//сказать,что стоило подчиниться
		return;
	};
	
	// я выставлял непрошенного гостя из дома (как хозяин или стражник)
	if((self.aivar[AIV_ATTACKREASON] == AR_ClearRoom) || (self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToRoom))
	{
		// если это помещение моей или дружественной гильдии
		if(C_NpcIsBotheredByPlayerRoomGuild(self) || (C_GetPlayerPortalGuild() == GIL_PUBLIC))
		{
			B_Say(self,other,"$GETUPANDBEGONE");		//сказть, чтоб вставал и убирался
		}
		else
		{
			if (other.aivar[AIV_Gender] == MALE)	{
				B_Say(self,other,"$NEVERENTERROOMAGAIN");	//сказать, чтоб больше сюда не приходил
			}
			else	{
				B_Say(self,other,"$NEVERENTERROOMAGAIN_F");	//сказать, чтоб больше сюда не приходила
			};
		};
		return;
	};
	
	// он вышел из помещения, доступ в которое ограничен
	if(self.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say(self,other,"$NEVERENTERROOMAGAIN");	//сказать, чтоб больше сюда не приходил
		}
		else	{
			B_Say(self,other,"$NEVERENTERROOMAGAIN_F");	//сказать, чтоб больше сюда не приходила
		};
		return;
	};
	
	// я стражник, который останавливал вторжение
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say(self,other,"$KILLENEMY");	// сказать, что я его убью
		}
		else	{
			B_Say(self,other,"$KILLENEMY_F");	// сказать, что я ее убью
		};
		return;
	};
	
	// я стражник, который  останавливал драку
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight)
	{
		// кроме случаев, когда он наемник 
		if((other.guild == GIL_SLD))
		{
		}
		else
		{
			if (other.aivar[AIV_Gender] == MALE)	{
				B_Say(self,other,"$THEREISNOFIGHTINGHERE");	//сказать, что драки здесь запрещены
			}
			else	{
				B_Say(self,other,"$THEREISNOFIGHTINGHERE_F");	//сказать, что драки здесь запрещены
			};
		};
		return;
	};
	
	// я стражник, который поймал вора
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToThief)
	{
		B_Say(self,other,"$RUMFUMMLERDOWN");	//сказать, чтоб не распускал руки
		return;
	};
};

