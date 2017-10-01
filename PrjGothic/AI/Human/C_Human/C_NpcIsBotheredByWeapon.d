/**************************************************************************

  Волнует ли slf, что oth (обычно ГГ) достал оружие: TRUE - волнует,
FALSE - нет.
 
***************************************************************************/

func int C_NpcIsBotheredByWeapon(var C_Npc slf,var C_Npc oth)
{
	// НЕ ВОЛНУЕТ, если ---------------------------------------------------
	//явно указано игнорировать
	if (HasFlags(slf.aivar[AIV_IgnoreFlags], IGNORE_DrawWeapon))	{
		return FALSE;
	};
	
	// я в одной команде с ГГ (кто бы ни достал оружие)
	if(slf.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return FALSE;
	};
	
	// я друг ГГ и оружие достал ГГ
	if((slf.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(other))
	{
		return FALSE;
	};
	
	// я крутой парень, а он достал оружие ближнего боя
	if(C_NpcIsToughGuy(slf) && Npc_IsInFightMode(oth,FMODE_MELEE))
	{
		return FALSE;
	};
	
	// мы друзья
	if(C_NpcGetAttitude(slf,oth) == ATT_FRIENDLY)
	{
		return FALSE;
	};
	
	// я несу охрану ворот
	if(C_NpcIsGateGuard(slf))
	{
		return FALSE;
	};
	
	// он дерется на кулаках
	if(Npc_IsInFightMode(oth,FMODE_FIST))
	{
		return FALSE;
	};
	
	// он колдует, но заклинание не опасное
	if(Npc_IsInFightMode(oth,FMODE_MAGIC) && (Npc_GetActiveSpellCat(oth) != SPELL_BAD))
	{
		return FALSE;
	};
	
	// я ищущий или орк
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_ORC))
	{
		return FALSE;
	};
	
	//я прячусть
	if (HasFlags(slf.aivar[AIV_Behaviour], BEHAV_Hidden | BEHAV_Invisible))	{
		return FALSE;
	};

	// иначе ВОЛНУЕТ ------------------------------------------------------
	
	return TRUE;
};

