
var int FoundVinosKellerei;

// ГГ вперся в пещеру контрабандистов
func void evt_vinoskellerei_func_s1()
{
	if(FoundVinosKellerei == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		FoundVinosKellerei = TRUE;
		if (MIS_KhorinisPost == LOG_Running)	{
			PrintScreen("Думаю, это та пещера, о которой говорил Вино.", -1, 15, FONT_ScreenSmall,3);
		};
		//главнюк бежит встречать
		var C_Npc BootleggerChief;		BootleggerChief = Hlp_GetNpc(BDT_801_Chief);
		Npc_ClearAIQueue(BootleggerChief);
		AI_StandUpQuick(BootleggerChief);
		AI_SetWalkmode(BootleggerChief,NPC_RUN);
		AI_GotoWP(BootleggerChief,"NW_FOREST_VINOSKELLEREI_03");
		AI_GotoNpc(BootleggerChief,hero);
	};
};

