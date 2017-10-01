/**************************************************************************

  Хочет ли slf самостоятельно наказать убийцу oth.
 
***************************************************************************/


func int C_WantToAttackMurder(var C_Npc slf,var C_Npc oth)
{
	// НЕ ХОЧУ, если
	
	// я ищущий, пленник, охотник на драконов или бандит
	if((slf.guild == GIL_DMT)
		|| (slf.guild == GIL_STRF)
		|| (slf.guild == GIL_BDT))
	{
		return FALSE;
	};
	
	// явно указано не замечать убийств
	if(HasFlags(slf.aivar[AIV_IgnoreFlags], IGNORE_Murder))
	{
		return FALSE;
	};
	
	// он ГГ, а я его друг
	if(Npc_IsPlayer(oth) && (slf.npcType == NPCTYPE_FRIEND))
	{
		return FALSE;
	};
	
	// у убийцы был серьезный повод
	if(C_NpcHasAttackReasonToKill(oth))
	{
		return FALSE;
	};
	
	// я несу охрану входа
	if(C_NpcIsGateGuard(slf))
	{
		return FALSE;
	};
	
	// в остальных случаях - ХОЧУ
	return TRUE;
};


