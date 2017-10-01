
func int B_TeachPlayerTalentTakeAnimalTrophy(var C_Npc slf,var C_Npc oth,var int trophy)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_TAKEANIMALTROPHY,trophy);
	// если у обучаемого недостаточно очков обучения
	if(C_NotEnoughLP(slf,oth,kosten))
	{
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAnimalTrophy,"Я умею:");
	if(trophy == TROPHY_Teeth)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вынимать клыки.");
	};
	if(trophy == TROPHY_Claws)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать когти.");
	};
	if(trophy == TROPHY_Fur)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать шкуры с животных.");
	};
	if(trophy == TROPHY_ReptileSkin)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать шкуры с рептилий.");
	};
	if(trophy == TROPHY_Heart)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вынимать сердца магических существ.");
	};
	if(trophy == TROPHY_ShadowHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать рог у мракорисов.");
	};
	if(trophy == TROPHY_FireTongue)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вынимать язык у огненных ящеров.");
	};
	if(trophy == TROPHY_BFWing)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать крылья у кровавых мух.");
	};
	if(trophy == TROPHY_BFSting)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вынимать жало у кровавых мух.");
	};
	if(trophy == TROPHY_Mandibles)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать жвалы.");
	};
	if(trophy == TROPHY_CrawlerPlate)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать панцири с краулеров.");
	};
	if(trophy == TROPHY_DrgSnapperHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать рога у драконьих снепперов.");
	};
	PrintScreen(PRINT_LearnTakeAnimalTrophy,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_TAKEANIMALTROPHY,1);
	return TRUE;
};

