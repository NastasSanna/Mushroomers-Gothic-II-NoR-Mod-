
// задать таланты ГГ (когда он окончательно выбран)
func void B_Hero_SetTalents()
{
	Log_CreateTopic(TOPIC_Sleep,LOG_NOTE);
	if (C_HeroIs_Odo())	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
		PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
		Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
		Log_AddEntry(TOPIC_TalentAlchemy,"Чтобы сварить зелье, мне нужна пустая мензурка и необходимые для этого зелья ингредиенты. Из этих ингредиентов, я могу приготовить зелье на столе алхимика, если у меня хватит ловкости и опытности в алхимии.");
		Log_AddEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЭССЕНЦИИ МАНЫ': 2 огненных крапивы и 1 луговой горец.");
		Log_AddEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЗЕЛЬЯ УСКОРЕНИЯ': 1 снеппер-трава и 1 луговой горец");
		Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_Odo);
	}
	else if (C_HeroIs_Erol())	{
		player_talent_takeanimaltrophy[TROPHY_Teeth] = TRUE;
		player_talent_takeanimaltrophy[TROPHY_BFSting] = TRUE;
		Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"Я умею:");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...вырезать зубы.");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...вырезать жало у кровавых мух.");
		Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_Erol);
		Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_Orlan);
	}
	else if (C_HeroIs_Till())	{
		player_talent_takeanimaltrophy[TROPHY_BFWing] = TRUE;
		Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"Я умею:");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...вырезать крылья у кровавых мух.");
		Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_Till);
	}
	else if (C_HeroIs_Talbin())	{
		player_talent_takeanimaltrophy[TROPHY_Teeth] = TRUE;
		player_talent_takeanimaltrophy[TROPHY_Claws] = TRUE;
		player_talent_takeanimaltrophy[TROPHY_Fur] = TRUE;
		player_talent_takeanimaltrophy[TROPHY_Heart] = TRUE;
		player_talent_takeanimaltrophy[TROPHY_ShadowHorn] = TRUE;
		player_talent_takeanimaltrophy[TROPHY_ReptileSkin] = TRUE;
		player_talent_takeanimaltrophy[TROPHY_KeilerTusk] = TRUE;
		Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"Я умею:");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...снимать шкуры с животных и рептилий.");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...вырезать зубы.");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...снимать когти.");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...вырезать рог маркориса.");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...вынимать сердца магических существ.");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...извлекать клыки кабана. Для этого челюсть кабана нужно правильно обработать: очистить от жил, выварить 1,5 часа в чистой воде, сделать надрезы с обратной стороны и аккуратно выдавить клыки назад.");
		Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_Talbin);
	}
	else if (C_HeroIs_Sarah())	{
		Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_CityHotel);
	}
	else if (C_HeroIs_Elena())	{
		Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_Elena);
		Hero_Acrobat = TRUE;
	}
	else if (C_HeroIs_Rupert())	{
		Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_Rupert);
		Hero_Acrobat = TRUE;
	};
	Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_Firecamp);
};
