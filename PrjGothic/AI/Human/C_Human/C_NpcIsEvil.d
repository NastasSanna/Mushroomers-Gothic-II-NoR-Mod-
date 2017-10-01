/**************************************************************************

  явл€етс€ ли slf злом: TRUE - €вл€етс€, FALSE - нет.
 
***************************************************************************/

func int C_NpcIsEvil(var C_Npc slf)
{
	// злом €вл€ютс€ ищущие, драконы, орки, люди-€щеры, демоны (в том числе призванные), черные тролли и нежить
	if((slf.guild == GIL_DMT)
		|| (slf.guild == GIL_DRAGON)
	|| (slf.guild == GIL_ORC)
	|| (slf.guild == GIL_DRACONIAN)
	|| (slf.guild == GIL_DEMON)
	|| (slf.guild == GIL_SUMMONED_DEMON)
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK)
	|| C_NpcIsUndead(slf))
	
	{
		return TRUE;
	};
	
	// остальные Ќ≈ €вл€ютс€
	return FALSE;
};

