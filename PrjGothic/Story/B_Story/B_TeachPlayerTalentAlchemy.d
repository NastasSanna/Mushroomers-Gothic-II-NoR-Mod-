
func int B_TeachPlayerTalentAlchemy(var C_Npc slf,var C_Npc oth,var int potion)
{
	/* LP не используютс€!
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_ALCHEMY,potion);
	// если у обучаемого недостаточно очков обучени€
	if(C_NotEnoughLP(slf,oth,kosten))
	{
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	//*/
	Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
	B_LogNote(TOPIC_TalentAlchemy,"„тобы сварить зелье, мне нужна пуста€ мензурка и необходимые дл€ этого зель€ ингредиенты. »з этих ингредиентов, € могу приготовить зелье на столе алхимика, если у мен€ хватит ловкости и опытности в алхимии.");
	if(potion == POTION_Health_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'Ћ≈„≈ЅЌќ… Ё——≈Ќ÷»»': 2 лечебные травы и 1 луговой горец.");
		PrintScreen(PRINT_LearnAlchemy_Health_01,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Health_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_02] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'Ћ≈„≈ЅЌќ√ќ Ё —“–ј “ј': 2 лечебных растени€ и 1 луговой горец.");
		PrintScreen(PRINT_LearnAlchemy_Health_02,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Health_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_03] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'Ћ≈„≈ЅЌќ√ќ ЁЋ» —»–ј': 2 лечебных корн€ и 1 луговой горец.");
		PrintScreen(PRINT_LearnAlchemy_Health_03,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Mana_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'Ё——≈Ќ÷»» ћјЌџ': 2 огненных крапивы и 1 луговой горец.");
		PrintScreen(PRINT_LearnAlchemy_Mana_01,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Mana_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'Ё —“–ј “ј ћјЌџ': 2 огненных травы и 1 луговой горец.");
		PrintScreen(PRINT_LearnAlchemy_Mana_02,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Mana_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'ЁЋ» —»–ј ћјЌџ': 2 огненных корн€ и 1 луговой горец");
		PrintScreen(PRINT_LearnAlchemy_Mana_03,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Speed)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"»нгредиенты дл€ '«≈Ћ№я ”— ќ–≈Ќ»я': 1 снеппер-трава и 1 луговой горец");
		PrintScreen(PRINT_LearnAlchemy_Speed,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Perm_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'ЁЋ» —»–ј —»Ћџ': 1 драконий корень и 1 царский щавель.");
		PrintScreen(PRINT_LearnAlchemy_Perm_STR,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Perm_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'ЁЋ» —»–ј Ћќ¬ ќ—“»': 1 гоблинские €годы и 1 царский щавель.");
		PrintScreen(PRINT_LearnAlchemy_Perm_DEX,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Perm_Mana)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'ЁЋ» —»–ј ƒ”’ј': 1 огненный корень и 1 царский щавель.");
		PrintScreen(PRINT_LearnAlchemy_Perm_Mana,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Perm_Health)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'ЁЋ» —»–ј ∆»«Ќ»': 1 лечебный корень и 1 царский щавель.");
		PrintScreen(PRINT_LearnAlchemy_Perm_Health,-1,-1,FONT_ScreenSmall,2);
	};
	return TRUE;
};

