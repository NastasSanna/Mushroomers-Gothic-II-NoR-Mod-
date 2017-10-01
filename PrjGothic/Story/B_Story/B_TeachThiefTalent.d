
func int B_TeachThiefTalent(var C_Npc slf,var C_Npc oth,var int talent)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,talent,1);
	if((talent != NPC_TALENT_PICKLOCK) && (talent != NPC_TALENT_SNEAK) && (talent != NPC_TALENT_ACROBAT)
		&& (talent != NPC_TALENT_PICKPOCKET))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	// если у обучаемого недостаточно очков обучения
	if(C_NotEnoughLP(slf,oth,kosten))
	{
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	if(talent == NPC_TALENT_PICKLOCK)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_PICKLOCK,1);
		PrintScreen(PRINT_LearnPicklock,-1,-1,FONT_Screen,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_SNEAK)
	{
		Hero_CanSneak = 1;
		Npc_SetTalentSkill(oth,NPC_TALENT_SNEAK,1);
		PrintScreen(PRINT_LearnSneak,-1,-1,FONT_Screen,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_ACROBAT)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ACROBAT,1);
		PrintScreen(PRINT_LearnAcrobat,-1,-1,FONT_Screen,2);
		Hero_Acrobat = TRUE;
		return TRUE;
	};
	if(talent == NPC_TALENT_PICKPOCKET)
	{
		if (Npc_GetTalentSkill(oth,NPC_TALENT_PICKPOCKET) == 0)
		{
			Npc_SetTalentSkill(oth,NPC_TALENT_PICKPOCKET,1);
		}
		else
		{
			Npc_SetTalentSkill(oth,NPC_TALENT_PICKPOCKET,3);
		};
		PrintScreen(PRINT_LearnPickpocket,-1,-1,FONT_Screen,2);
		return TRUE;
	};
	return FALSE;
};

