
func int C_NpcHasMushrooms(var C_NPC npc)
{
	if (Npc_HasItems(npc,ItPl_Mushroom_01))	{return TRUE;};
	if (Npc_HasItems(npc,ItPl_Mushroom_02))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_Bottle))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_Branch))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_BrownOiler))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_DragonTears))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_Foggy))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_GoldPlate))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_Governor))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_Heart))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_Ivy))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_KeilBig))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_KeilSmall))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_LadysEar))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_NightSparkles))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_Oyster))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_Piny))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_Red))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_Stone))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_Sunrise))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_Trident))	{return TRUE;};
	if (Npc_HasItems(npc,ItMr_Violet))	{return TRUE;};
	return FALSE;
};