
//Гримбальд вынимает лук, когда слышит, что кто-то вошел в пещеру
func void EVT_HUNTER_READY()
{
	if (!Npc_KnowsInfo(hero,DIA_Grimbald_Start))	{
		var C_NPC Grimbald;		Grimbald = Hlp_GetNpc(OUT_1210_Grimbald);
		Npc_ClearAIQueue(Grimbald);
		Npc_SetTarget(Grimbald,hero);
		AI_StartState(Grimbald,ZS_AimTo,0,"");
	/* РЕШЕНО БЕЗ ТРИГГЕРА
		AI_StandUpQuick(Grimbald);
//		AI_TurnToNpc(Grimbald,hero);
//		Npc_SendSinglePerc(hero,Grimbald,PERC_ASSESSPLAYER);
//		Npc_SendSinglePerc(hero,Grimbald,PERC_ASSESSENTERROOM);
		MEM_Debug("EVT_HUNTER_READY");
		if (Npc_HasItems(Grimbald,ItRw_Arrow) < 10)	{
			CreateInvItems(Grimbald,ItRw_Arrow, 10);
		};
		AI_SetWalkMode(Grimbald,NPC_WALK);
		AI_ReadyRangedWeapon(Grimbald);
		AI_AimAt(Grimbald,hero);
		AI_Wait(Grimbald,1.5);
	//*/
	};	
};