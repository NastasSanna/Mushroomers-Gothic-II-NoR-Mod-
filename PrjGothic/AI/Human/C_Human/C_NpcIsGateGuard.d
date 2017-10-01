/**************************************************************************

  Ќесет ли slf охрану ворот (прохода): 
    TRUE - €вл€етс€ охранником, FALSE - нет.
 
***************************************************************************/

func int C_NpcIsGateGuard(var C_Npc slf)
{
	// если в состо€нии охраны прохода
	if(Npc_IsInState(slf,ZS_Guard_Passage))
	{
		return TRUE;		// €вл€етс€
	};
	// или если установлен AIV_Guardpassage_Status
	if(slf.aivar[AIV_Guardpassage_Status] != GP_NONE)
	{
		return TRUE;		// €вл€етс€
	};
	// иначе
	return FALSE;		// Ќ≈ €вл€етс€
};

