/**************************************************************************

						ПРОВЕРКА ЛОЖНОЙ ГИЛЬДИИ

  Обращает ли slf внимание на то, что у oth (ГГ) ложная (фальшивая) гильдия:
TRUE - обращает, FALSE - нет.
  
  Сюжетные особенности: переодевание в бандита, броня Кольца Воды.
 
***************************************************************************/


func int C_PlayerHasFakeGuild(var C_Npc slf,var C_Npc oth)
{
	//в моде отключено: всем плевать на одежду ГГ
	return FALSE;
	
	// внутренние переменные 
	var C_Item itm;		// одежда/броня ГГ
	itm = Npc_GetEquippedArmor(oth);
	
	// ТОЧНО НЕ ЗАМЕЧАТЬ, если --------------------------------------------
	
	// явно указано не замечать броню или ложную гильдию
	if(HasAnyFlags(slf.aivar[AIV_IgnoreFlags], IGNORE_Armor | IGNORE_FakeGuild))
	{
		return FALSE;
	};
	
	// я друг ГГ или в его команде
	if ((self.npcType == NPCTYPE_FRIEND) || (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return FALSE;
	};
	
	// я на страже ворот
	if(C_NpcIsGateGuard(self) == TRUE)
	{
		return FALSE;
	};
	
	// у меня нет гильдии
	if(self.guild == GIL_NONE)
	{
		return FALSE;
	};
	
	// ГГ НЕ ОДЕТ ----------------------------------------------------------
	
	if(Npc_HasEquippedArmor(oth) == FALSE)
	{
		return FALSE;					// не обращать на это внимания
	}
	
	// ГГ ОДЕТ -------------------------------------------------------------
	
	// если мы в одной гильдии
	else if(slf.guild == oth.guild || Wld_GetGuildAttitude(slf.guild, oth.guild) == ATT_FRIENDLY)
	{
		// ЗАМЕТИТЬ, если
		/* броня не соответствует гильдии ГГ */
		
		// у него нет гильдии, и он не в одежде горожанина/крестьянина/охотника
		if((oth.guild == GIL_NONE)
			&& !((Hlp_IsItem(itm,ITAR_Vlk_L) == TRUE)
				|| (Hlp_IsItem(itm,ITAR_Vlk_M) == TRUE)
				|| (Hlp_IsItem(itm,ITAR_Vlk_H) == TRUE)
				|| (Hlp_IsItem(itm,ITAR_Bau_L) == TRUE)
				|| (Hlp_IsItem(itm,ITAR_Bau_M) == TRUE)
				|| (Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)))
		{
			return TRUE;
		}
		// он ополченец и не одет в броню ополченца
		else if((oth.guild == GIL_MIL)
			&& !((Hlp_IsItem(itm,ITAR_Mil_L) == TRUE)
				|| (Hlp_IsItem(itm,ItAr_MIL_M) == TRUE)))
		{
			return TRUE;
		}
		// он паладин и не носит доспех паладина
		else if((oth.guild == GIL_PAL)
			&& !((Hlp_IsItem(itm,ItAr_PAL_M) == TRUE)
				|| (Hlp_IsItem(itm,ItAr_PAl_H) == TRUE)))
		{
			return TRUE;
		}
		// он наемник и не носит броню наемника или доспех из панциря ползунов
		else if((oth.guild == GIL_SLD)
			&& !((Hlp_IsItem(itm,ItAr_Sld_L) == TRUE) 
				|| (Hlp_IsItem(itm,itar_sld_M) == TRUE) 
				|| (Hlp_IsItem(itm,ItAr_Sld_H) == TRUE)
				|| (Hlp_IsItem(itm,ITAR_DJG_Crawler) == TRUE)))
		{
			return TRUE;
		}
		// он послушник и не носит одежду послушника
		else if((oth.guild == GIL_NOV)
			&& !((Hlp_IsItem(itm,ItAr_NOV_L) == TRUE)))
		{
			return TRUE;
		}
		// он маг огня и не носит мантию мага огня
		else if((oth.guild == GIL_KDF)
			&& !((Hlp_IsItem(itm,ItAr_KDF_L) == TRUE)
				|| (Hlp_IsItem(itm,ItAr_KDF_H) == TRUE)))
		{
			return TRUE;
		}
		
		// одежда соответствует гильдии
		else
		{
			return FALSE;
		};
	};
	
	// мы в разных гильдиях
	return FALSE;					// не обращать внимания на одежду ГГ
};


