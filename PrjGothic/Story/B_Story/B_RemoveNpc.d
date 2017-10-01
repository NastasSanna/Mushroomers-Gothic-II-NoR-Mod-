
// удалить NPC

func void B_RemoveNpc(var int npcInstance)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);
	// если указынный NPC существует
	if(Hlp_IsValidNpc(npc))
	{
		// снять все флаги
		npc.flags = 0;
		// переместить его в "могильник"
		AI_Teleport(npc,"TOT");
		B_StartOtherRoutine(npc,"TOT");
		// если он еще жив - убить
		if (!Npc_IsDead(npc))
		{
			Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
		};
	};
};

