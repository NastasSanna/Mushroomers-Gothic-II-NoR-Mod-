/**************************************************************************

  явл€етс€ ли slf нежитью: TRUE - €вл€етс€, FALSE - нет.
 
***************************************************************************/

func int C_NpcIsUndead(var C_Npc slf)
{
	// я¬Ћяё“—я скелеты всех видов, зомби, орк-нежить, дракон-нежить
	if((slf.guild == GIL_GOBBO_SKELETON)
		|| (slf.guild == GIL_SUMMONED_GOBBO_SKELETON)
		|| (slf.guild == GIL_SKELETON)
		|| (slf.guild == GIL_SUMMONED_SKELETON)
		|| (slf.guild == GIL_SKELETON_MAGE)
		|| (slf.guild == GIL_ZOMBIE)
		|| (slf.guild == GIL_SHADOWBEAST_SKELETON)
		|| (slf.guild == GIL_UNDEADORC)
		|| (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD))
	{
		return TRUE;
	};
	// остальные Ќ≈ €вл€ютс€
	return FALSE;
};

