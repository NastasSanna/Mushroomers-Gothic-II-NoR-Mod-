/**************************************************************************

  Ћежит ли slf на полу (повержен): TRUE - лежит, FALSE - нет.
 
***************************************************************************/

func int C_NpcIsDown(var C_Npc slf)
{
	//если мен€ вообще нет
	if (!Hlp_IsValidNpc(slf))
	{
		return TRUE;		// то € повержен
	};
	
	// если € без сознани€, усыплен или умер
	if(Npc_IsInState(slf,ZS_Unconscious) || Npc_IsInState(slf,ZS_MagicSleep) || Npc_IsInState(slf,ZS_MagicSleep_Short) || Npc_IsDead(slf))
	{
		return TRUE;		// то € повержен
	};
	// иначе
	return FALSE;		// Ќ≈ повержен
};

