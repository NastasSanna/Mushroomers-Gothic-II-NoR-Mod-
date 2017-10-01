/**************************************************************************

						ОБНОВЛЕНИЕ ПРИ ВСТАВКЕ

  Функция B_RefreshAtInsert() обновляет персонажа self при его вставке в мир.
При необходимости экипирует подходящим оружием.
  
  Вызывается движком.  
 
***************************************************************************/

// получить подходящее оружие
func void B_GiveProperWeapon(var C_NPC npc)
{
	var int rnd;
	rnd = Hlp_Random(100);
	AI_EquipBestArmor(self);
	// выдать
	if(npc.guild == GIL_MIL)		//ополченцу (милиции)
	{
		if (rnd < 5) && (npc.attribute[ATR_STRENGTH] >= Condition_MilSchwert)
		{
			CreateInvItems(npc,ItMw_1h_MISC_Sword,1);	// грубый палаш - 5%
		}
		else if (rnd < 35) && (npc.attribute[ATR_STRENGTH] >= Condition_MiscSword)
		{
			CreateInvItems(npc,ItMw_1h_MISC_Sword,1);	// ржавый меч - 30%
		}
		else if (rnd < 85)
		{
			CreateInvItems(npc,ItMw_1h_MISC_Sword,1);	// короткий меч ополчения - 50%
		}
		else
		{
			CreateInvItems(npc,ItMw_1h_Vlk_Axe,1);		// топор - 15%
		};	
	}
	else if(npc.guild == GIL_PAL)		//паладину
	{
		if (rnd < 10)
		{
			CreateInvItems(npc,ItMw_1h_Pal_Sword,1); // меч паладина - 10%
		}
		else if (rnd < 70)
		{
			CreateInvItems(npc,ItMw_1h_MISC_Sword,1);	// ржавый меч - 60%
		}	
		else
		{
			CreateInvItems(npc,ItMw_2H_Sword_M_01,1);	// ржавый двуручник - 30%
		};
	}
	else if(npc.guild == GIL_SLD)		// наемнику или охотнику на драконов
	{
		if (rnd < 5) && (npc.attribute[ATR_STRENGTH] >= Condition_MiscSword)
		{
			CreateInvItems(npc,ItMw_2h_Sld_Sword,1); // грубый двуручник - 5%
		}
		else if (rnd < 10) && (npc.attribute[ATR_STRENGTH] >= Condition_Sld2hAxe)
		{
			CreateInvItems(npc,ItMw_2h_Sld_Axe,1);	// грубый боевой топор - 5%
		}	
		else if (rnd < 25) && (npc.attribute[ATR_STRENGTH] >= Condition_Sld1hAxt)
		{
			CreateInvItems(npc,ItMw_1h_Sld_Axe,1);	// грубый тесак - 15%
		}	
		else if (rnd < 40) && (npc.attribute[ATR_STRENGTH] >= Condition_Sld1hSchwert)
		{
			CreateInvItems(npc,ItMw_1h_Sld_Sword,1);	// грубый меч - 15%
		}	
		else if (rnd < 70)
		{
			CreateInvItems(npc,ItMw_1h_MISC_Sword,1);	// ржавый меч - 30%
		}	
		else
		{
			CreateInvItems(npc,ItMw_1h_MISC_Sword,1);	// крепкую палку - 30%
		};
	}
	else if((npc.guild == GIL_BAU) || (npc.guild == GIL_BAU2))		// крестьянину
	{
		if (rnd < 50)
		{
			CreateInvItems(npc,ItMw_1h_Bau_Mace,1);	// крепкую палку - 50%
		}
		else
		{
			CreateInvItems(npc,ItMw_1h_Bau_Axe,1);	// серп - 50%
		};
	}
	else if(npc.guild == GIL_NOV)		//послушнику
	{
		if (rnd < 60)
		{
			CreateInvItems(npc,ItMw_1h_Bau_Mace,1);	// крепкую палку - 60%
		}
		else
		{
			CreateInvItems(npc,ItMw_1h_Nov_Mace,1);	// боевой посох - 40%
		};
	}
	else if(npc.guild == GIL_KDF)		//Магу Огня
	{
		if (rnd < 20)
		{
			CreateInvItems(npc,ItMw_1h_Bau_Mace,1);	// крепкую палку - 20%
		}
		else if (rnd < 70)
		{
			CreateInvItems(npc,ItMw_1h_Nov_Mace,1);	// боевой посох - 50%
		}
		else
		{
			CreateInvItems(npc,ItMW_Addon_Stab01,1);	// посох мага - 30%
		};
	}	
	else // всем остальным
	{
		// если не маг и не ищущий
		if (!HasFlags(npc.aivar[AIV_Temper], TEMPER_MagicUser) && (npc.guild != GIL_DMT) && (npc.aivar[AIV_Gender] == MALE))
		{
			CreateInvItems(npc,ItMw_1h_Bau_Mace,1); // крепкую палку
		};
	};	
};

//задать индекс текущего имени из массива имен name[0..4]
//если Index < 0 или Index >= 5 - просто обновить
//Index == 0 не изменит имя
func void B_SetNameByIndex(var C_NPC slf,var int Index)
{
	if ((Index >= 0) && (Index < 5))	{
		slf.aivar[AIV_NameIndex] = Index;
	};
	//slf.name = MEM_ReadStatStringArr(slf.name,slf.aivar[AIV_NameIndex]);
	//*/
	var oCNpc s;	s = Hlp_GetNpc(slf);
	if (slf.aivar[AIV_NameIndex] == 1)	{	slf.name = s.name_1;	}	else
	if (slf.aivar[AIV_NameIndex] == 2)	{	slf.name = s.name_2;	}	else
	if (slf.aivar[AIV_NameIndex] == 3)	{	slf.name = s.name_3;	}	else
	if (slf.aivar[AIV_NameIndex] == 4)	{	slf.name = s.name_4;	};	
	//*/
};

var int START_DIA_Finished;

func void B_RefreshAtInsert()
{
	B_SetNameByIndex(self,-1);
	//если это человек и не ГГ
	if((self.guild < GIL_SEPERATOR_HUM) && (!Npc_IsPlayer(self)))
	{ 
		//восстановить здоровье до макс.
		if (self.attribute[ATR_HITPOINTS] > 0)	{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};
		
		/* движок автоматически экипирует персонажа лучшим оружием из инвентаря */
		
		// если оружия нет - выдать
		if(Npc_HasEquippedWeapon(self) == FALSE)
		{ 
			B_GiveProperWeapon(self);
		};
		
		//*запуск диалогов в начале игры
		if (START_DIA_Finished == FALSE)	{
			if (Npc_CheckInfo(self,1) && (CurrentLevel == NEWWORLD_ZEN) && Hlp_IsValidNpc(hero))
			{
				//START_DIA_Finished = TRUE;
				//Npc_SetTarget(self,hero);
				//AI_StartState(self,ZS_Talk,0,"");
				Npc_SendSinglePerc(hero,self,PERC_ASSESSTALK);
			};
		};
		//*/
	};
	
};