/**************************************************************************

  Хочет ли slf самостоятельно наказать oth за убийство овцы.
 
***************************************************************************/

func int C_WantToAttackSheepKiller(var C_Npc slf,var C_Npc oth)
{
	// НЕ ХОЧУ, если
	
	// я ищущий, пленник, бандит или охотник на драконов
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_STRF) || (slf.guild == GIL_BDT))
	{
		return FALSE;
	};
	
	// явно указано не замечать это преступление
	if(HasFlags(slf.aivar[AIV_IgnoreFlags], IGNORE_Sheepkiller))
	{
		return FALSE;
	};
	
	// он ГГ, а я его друг
	if(Npc_IsPlayer(oth) && (slf.npcType == NPCTYPE_FRIEND))
	{
		return FALSE;
	};
	
	// у него был повод убить овечку //NS: баран решил забодать ГГ? овца из вражеской гильдии?
	if(C_NpcHasAttackReasonToKill(oth))
	{
		return FALSE;
	};
	
	// он человек и у него был повод напасть (см. предыдущее)
	if((other.guild < GIL_SEPERATOR_HUM) && (other.aivar[AIV_ATTACKREASON] != AR_NONE))
	{
		return FALSE;
	};
	
	// я охраняю вход
	if(C_NpcIsGateGuard(slf))
	{
		return FALSE;
	};
	
	// в остальных случаях - ХОЧУ
	return TRUE;
};


