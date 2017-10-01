/**************************************************************************

int C_NpcBelongsTox	(slf)
  Проверяет, принадлежит ли slf к лагерю x: TRUE - принадлежит,
FALSE - не принадлежит. Зависит от гильдии и типа slf.

int C_GetNpcLocation	(slf)
  Возвращает индекс лагеря, к которой принадлежит slf: LOC_x.
 
***************************************************************************/

// СТАРЫЙ ЛАГЕРЬ ==========================================================

func int C_NpcBelongsToOldCamp(var C_Npc slf)
{
	// если это персонаж или массовка из Старого лагеря
	if((slf.npcType == NPCTYPE_OCMAIN) || (slf.npcType == NPCTYPE_OCAMBIENT))
	{
		// и это горожанин, ополченец или паладин
		if((slf.guild == GIL_VLK) || (slf.guild == GIL_MIL) || (slf.guild == GIL_PAL))
		{
			return TRUE; // то принадлежит
		};
	};
	// иначе не принадлежит
	return FALSE;
};

// ГОРОД ===================================================================

func int C_NpcBelongsToCity(var C_Npc slf)
{
	// если не из Старого лагеря
	if(!C_NpcBelongsToOldCamp(slf))
	{
		// и это горожанин, ополченец или паладин
		if((slf.guild == GIL_VLK) || (slf.guild == GIL_MIL) || (slf.guild == GIL_PAL))
		{
			return TRUE; // то принадлежит
		};
	};
	// иначе не принадлежит
	return FALSE;
};

// МОНАСТЫРЬ ================================================================

func int C_NpcBelongsToMonastery(var C_Npc slf)
{
	// если это маг огня или послушник
	if((slf.guild == GIL_KDF) || (slf.guild == GIL_NOV))
	{
		if (!HasFlags(slf.aivar[AIV_StoryFlags], STORY_OutOfCamp))	{	//не покинул Монастырь
			return TRUE; // то принадлежит
		};
	};
	// иначе не принадлежит
	return FALSE;
};

// ФЕРМА =====================================================================

func int C_NpcBelongsToFarm(var C_Npc slf)
{
	// если это крестьянин или наемник
	if((slf.guild == GIL_BAU) || (slf.guild == GIL_SLD))
	{
		return TRUE; // то принадлежит
	};
	// иначе не принадлежит
	return FALSE;
};

// ЛАГЕРЬ БАНДИТОВ ===========================================================

func int C_NpcBelongsToBL(var C_Npc slf)
{
	// если это персонаж или массовка из лагеря бандитов
	if((slf.npcType == NPCTYPE_BL_AMBIENT) || (slf.npcType == NPCTYPE_BL_MAIN))
	{
		return TRUE; // то принадлежит
	};
	// иначе не принадлежит
	return FALSE;
};

// УЗНАТЬ ЛАГЕРЬ ===========================================================

func int C_GetNpcLocation (var C_Npc slf)
{
	// проверка принадлежности к каждому лагерю
	if (C_NpcBelongsToOldCamp(slf))
	{
		return LOC_OLDCAMP;
	}
	else if (C_NpcBelongsToCity(slf))
	{
		return LOC_CITY;
	}
	else if (C_NpcBelongsToMonastery(slf))
	{
		return LOC_MONASTERY;
	}
	else if (C_NpcBelongsToFarm(slf))
	{
		return LOC_FARM;
	}
	else if (C_NpcBelongsToBL(slf))
	{
		return LOC_BL;
	};
	// иначе - ни к какому
	return LOC_NONE;	
};
