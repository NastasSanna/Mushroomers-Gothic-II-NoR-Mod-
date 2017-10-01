/**************************************************************************

  int C_NpcHasAttackReasonToKill	(slf)
  Есть ли у slf повод убить того, на кого он напал: TRUE - есть, FALSE - нет.
 
***************************************************************************/

func int C_NpcHasAttackReasonToKill(var C_Npc slf)
{
	// ЕСТЬ повод, если
	// причина нападения
	if((slf.aivar[AIV_ATTACKREASON] == AR_KILL)						// чтобы убить,
		|| (slf.aivar[AIV_ATTACKREASON] == AR_GuildEnemy)			// вражеская гильдия
		|| (slf.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)	// убийство
		|| (slf.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder)	// вторжение в закрытую зону
		|| (slf.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill))	// стража вызвана, чтобы убить нарушителя
	{
		return TRUE;
	};
	//я не человек
	if (slf.guild > GIL_SEPERATOR_HUM)	{
		return TRUE;
	};
	
	// иначе НЕТ повода
	return FALSE;
};

