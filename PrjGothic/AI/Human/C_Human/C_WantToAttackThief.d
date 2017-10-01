/**************************************************************************

  Хочет ли slf самостоятельно наказать oth за кражу.
 
***************************************************************************/

func int C_WantToAttackThief(var C_Npc slf,var C_Npc oth)
{
	// НЕ ХОЧУ, если
	
	// я ищущий, пленник или охотник на драконов
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_STRF))
	{
		return FALSE;
	};
	
	// явно указано не замечать это преступление
	if(HasFlags(slf.aivar[AIV_IgnoreFlags], IGNORE_Theft))
	{
		return FALSE;
	};
	
	// ГГ меня победил (в последней драке)
	if(slf.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		return FALSE;
	};
	
	// он ГГ, а я - его друг
	if(Npc_IsPlayer(oth) && (slf.npcType == NPCTYPE_FRIEND))
	{
		return FALSE;
	};
	
	// я охраняю вход
	if(C_NpcIsGateGuard(slf))
	{
		return FALSE;
	};
	
	//я прячусь
	if (HasFlags(slf.aivar[AIV_Behaviour], BEHAV_Hidden) || HasFlags(slf.aivar[AIV_Behaviour], BEHAV_Invisible))	{
		return FALSE;
	};

	// в оставльных случаях - ХОЧУ
	return TRUE;
};


