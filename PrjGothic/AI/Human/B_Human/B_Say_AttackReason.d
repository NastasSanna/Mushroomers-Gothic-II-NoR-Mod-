/**************************************************************************

						КОММЕНТАРИЙ ПРИЧИНЫ СРАЖЕНИЯ

  B_Say_AttackEnd	()
  Персонаж self (я) комментирует начало драки с other (он). 
  
  Конкретный комментарий зависит от:
   - причины драки;
   - отношений между гильдиями;
   - личных отношений;
   - он человек или монстр.
  Некоторые фразы выбираются случайно.
  В некоторых случаях нужно оповестить окружающих о начале драки
(если он из вражеской гильдии, если он убийца, если он монстр,
напавший на человека). Через восприятие PERC_ASSESSFIGHTSOUND.
  
  Сюжетные осоюенности: Фразы по поводу монстров отличаются от обычных
для определенного 9 голоса (аддон). Особые комментарии для ГГ, переодетого
бандитом или пиратом.
  
  Связаные файлы:
 стандартные фразы					 	Story\SVM.d
 функция B_Say_Overlay					AI\Human\B_Human\B_Say_Overlay.d
 
 //NS: блоки, в которых стоит только return можно и убрать

***************************************************************************/

func void B_Say_AttackReason()
{
	// внутренние переменные случайных чисел
	var int rnd;
	
	// ПО ПРИЧИНАМ НАПАДЕНИЯ ------------------------------------------------
	
	// мы НЕ во враждебных гильдиях, но он мой личный враг
	if((Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE) && (C_NpcGetAttitude(self,other) == ATT_HOSTILE))
	{
		// кроме случаев, когда я собираюсь его убить
		if(self.aivar[AIV_ATTACKREASON] == AR_KILL)
		{
			return;
		};
		if(self.aivar[AIV_ArenaFight] == AF_NONE)
		{
			return;
		};
		B_Say_Overlay(self,other,"$IGETYOUSTILL");	//заявить, что я ему покажу
		return;
	};
	
	// он из вражеской гильдии
	if(self.aivar[AIV_ATTACKREASON] == AR_GuildEnemy)
	{
		//если я в команде игрока
		if(self.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			// то комментарий выдается лишь с вероятностью 15%
			rnd = Hlp_Random(100);
			if(rnd >= 15)
			{
				return;
			};
		};
		// если он человек
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			// заявить, что он сейчас получит
			B_Say_Overlay(self,other,"$DIEENEMY");
		}
		// если он монстр
		else
		{
			// если у меня 9 голос
			if(self.voice == 9)
			{
				// с равной вероятностью выдать одну из фраз для монстров
				rnd = Hlp_Random(30);
				if(rnd < 10)
				{
					B_Say_Overlay(self,other,"$DIEMONSTER");		//(обычная)
				}
				else if(rnd < 20)
				{
					B_Say_Overlay(self,other,"$ADDON_DIEMONSTER");	//(аддон)
				}
				else
				{
					B_Say_Overlay(self,other,"$ADDON_DIEMONSTER2");	//(аддон 2)
				};
			}
			//если не 9 голос
			else
			{
				B_Say_Overlay(self,other,"$DIEMONSTER");		// фраза для монсров (обычная)
			};
			
		};
		
		// окружающие слышат, что драка началась (при любом комментарии)
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		return;
	};
	
	// он вор
	if(self.aivar[AIV_ATTACKREASON] == AR_Theft)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say_Overlay(self,other,"$DIRTYTHIEF");	//заявить, что он мерзкий ворюга
		}
		else	{
			B_Say_Overlay(self,other,"$DIRTYTHIEF_F");	//заявить, что она воровка
		};
		return;
	};
	
	// он влез ручками, куда не следовало
	if(self.aivar[AIV_ATTACKREASON] == AR_UseMob)
	{
		B_Say_Overlay(self,other,"$HANDSOFF");		//заорать "Руки прочь!"
		return;
	};
	
	// он убил овцу
	if(self.aivar[AIV_ATTACKREASON] == AR_SheepKiller)
	{
		// если он человек
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			if (other.aivar[AIV_Gender] == MALE)	{
				B_Say_Overlay(self,other,"$SHEEPKILLER");		//заорать, что он убивает овец
			}
			else	{
				B_Say_Overlay(self,other,"$SHEEPKILLER_F");		//заорать, что она убивает овец
			};
		}
		// если он монстр
		else
		{
			B_Say_Overlay(self,other,"$SHEEPKILLERMONSTER");//заорать, что он - монстр, таскающий овец
		};
		return;
	};
	
	// он убийца
	if(self.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
	{
		B_Say_Overlay(self,other,"$YOUMURDERER");			//заорать, что он убийца
		// окружающие слышат, что драка началась
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		return;
	};
	
	// он монстр, убивший человека
	if(self.aivar[AIV_ATTACKREASON] == AR_MonsterMurderedHuman)
	{
		return;												// без комментариев
	};
	
	// он монстр, напавший на человека
	if(self.aivar[AIV_ATTACKREASON] == AR_MonsterVsHuman)
	{
		B_Say_Overlay(self,other,"$DIEMONSTER");			//заорать "Умри, монстр!"
		// окружающие слышат, что драка началась
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		return;
	};
	
	// он монстр, приблизившийся к воротам
	if(self.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate)
	{
		B_Say_Overlay(self,other,"$DIESTUPIDBEAST");		//прокомментировать умственные способности монстра
		return;
	};
	
	// он первый начал
	if(self.aivar[AIV_ATTACKREASON] == AR_ReactToDamage)
	{
		// если он монстр
		if(other.guild > GIL_SEPERATOR_HUM)
		{
			B_Say_Overlay(self,other,"$YOUASKEDFORIT");		//заявить, что он сам напросился
			return;
		}
		// если он человек
		else
		{
			if (other.aivar[AIV_Gender] == MALE)	{
				B_Say_Overlay(self,other,"$YOUDAREHITME");		//спросить, как он посмел на меня руку поднять
			}
			else	{
				B_Say_Overlay(self,other,"$YOUDAREHITME_F");		//спросить, как она посмела на меня руку поднять
			};
			return;
		};
	};
	
	// он угрожал мне оружием
	if(self.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say_Overlay(self,other,"$YOUASKEDFORIT");			//заявить, что он сам напросился
		}
		else	{
			B_Say_Overlay(self,other,"$YOUASKEDFORIT_F");			//заявить, что он сам напросился
		};
		return;
	};
	
	// я собираюсь выставить его из моего дома
	if(self.aivar[AIV_ATTACKREASON] == AR_ClearRoom)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say_Overlay(self,other,"$THENIBEATYOUOUTOFHERE");	//сказать, чтоб убирался
		}
		else	{
			B_Say_Overlay(self,other,"$THENIBEATYOUOUTOFHERE_F");	//сказать, чтоб убиралась
		};
		return;
	};
	
	// он вышел из помещения с ограниченным доступом
	if(self.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom)
	{
		B_Say_Overlay(self,other,"$WHATDIDYOUDOINTHERE");	//спросить, что он там делал
		return;
	};
	
	// я стражник, прекращающий драку
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight)
	{
		B_Say_Overlay(self,other,"$WILLYOUSTOPFIGHTING");	//сказать, чтоб прекратил драться
		return;
	};
	
	// я стражник, вызванный для поимки вора
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToThief)
	{
		return;												// без комментариев
	};
	
	// я стражник, вызванный для очистки помещения от посторонних
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToRoom)
	{
		return;												// без комментариев
	};
};

