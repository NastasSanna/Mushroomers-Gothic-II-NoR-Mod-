/**************************************************************************

							ЗАДАТЬ AIVAR

  Разные функции, записывающие aivar с проверкой условий и т.п.
  
***************************************************************************/


// сброс счетчика предупреждений, если это необходимо (проход запрещен)
func void B_GuardPassageStatusReset(var C_NPC npc)
{
	if (npc.aivar[AIV_Guardpassage_Status] > GP_NONE)
	{
		npc.aivar[AIV_Guardpassage_Status] = GP_NONE;
	};
};

// увеличение счетчика предупреждений (если проход запрещен)
func void B_GuardPassageStatusUp(var C_NPC npc)
{
	if (npc.aivar[AIV_Guardpassage_Status] >= GP_NONE)
	{
		npc.aivar[AIV_Guardpassage_Status] += 1;
	};
};
