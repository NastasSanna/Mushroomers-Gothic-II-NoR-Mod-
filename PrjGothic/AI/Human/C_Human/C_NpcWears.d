
func int C_NpcWears(var C_NPC npc, var int armorInst)
{
	var C_ITEm armor;	armor = Npc_GetEquippedArmor(npc);
	if (Hlp_IsItem(armor, armorInst))	{
		return TRUE;
	};
	return FALSE;
};
