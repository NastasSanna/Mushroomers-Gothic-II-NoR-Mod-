
func void B_GivePlayerXPPerVictory(var C_NPC slf, var C_NPC oth)
{
	if((Npc_IsPlayer(oth) || (oth.aivar[AIV_PARTYMEMBER] == TRUE) || (slf.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID(hero))) 
		&& (slf.aivar[AIV_VictoryXPGiven] == FALSE))
	{
		B_GivePlayerXP(slf.level * XP_PER_VICTORY);
		slf.aivar[AIV_VictoryXPGiven] = TRUE;
	};
};
