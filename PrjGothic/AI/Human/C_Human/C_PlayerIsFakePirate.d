/**************************************************************************

					ПРОВЕРКА ПЕРЕОДЕВАНИЯ В ПИРАТА

  Обращает ли slf внимание на то, что oth (ГГ) переодет пиратом:
TRUE - обращает, FALSE - нет.
  
  От гильдий не зависит!
  
  На переодетого пиратом ГГ будут нападать все гильдии.
  
//NS: И пираты тоже, если у них не прописаны нужные AIV.
 
***************************************************************************/

func int C_PlayerIsFakePirate(var C_Npc slf,var C_Npc oth)
{
	// внутренняя переменная - одежда ГГ
	var C_Item itm;
	
	// ТОЧНО НЕ ЗАМЕЧАТЬ, если --------------------------------------------
	
	// явно указано не замечать броню или ложную гильдию
	if(HasAnyFlags(slf.aivar[AIV_IgnoreFlags], IGNORE_Armor | IGNORE_FakeGuild))
	{
		return FALSE;
	};
	
	// ---------------------------------------------------------------------
	
	// если ГГ одет 
	
	if(Npc_HasEquippedArmor(other) == TRUE)
	{
		// в одежду пирата
		itm = Npc_GetEquippedArmor(oth);
		if((Hlp_IsItem(itm,ITAR_PIR_L_Addon) == TRUE)
			|| (Hlp_IsItem(itm,ITAR_PIR_M_Addon) == TRUE)
			|| (Hlp_IsItem(itm,ITAR_PIR_H_Addon) == TRUE))
		{
			return TRUE;	// то он фальшивый пират
		}
		else
		{
			return FALSE;	// то он НЕ фальшивый пират
		};
	};
	
	// если ГГ НЕ одет 
	
	return FALSE;		// то он НЕ фальшивый пират
};


