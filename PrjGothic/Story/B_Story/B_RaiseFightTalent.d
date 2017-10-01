
func void Print_RaiseFightTalent(var int talent, var int percent)
{
	var string concatText; // сообщение
	var int Y_Pos;	Y_Pos = YPOS_RaiseFTal;
	if (percent >= 0)	{
		if(talent == NPC_TALENT_1H)		{
			concatText = PRINT_Raise1H;
			Y_Pos += 0;
		}
		else if(talent == NPC_TALENT_2H)		{
			concatText = PRINT_Raise2H;
			Y_Pos += 2;
		}
		else if(talent == NPC_TALENT_BOW)		{
			concatText = PRINT_RaiseBow;
			Y_Pos += 4;
		}
		else if(talent == NPC_TALENT_CROSSBOW)		{
			concatText = PRINT_RaiseCBow;
			Y_Pos += 6;
		};
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText,"%");
		if (percent == 0)	{
			concatText = ConcatStrings(concatText,PRINT_Raise_Limit);
		};
		AI_PrintScreen(concatText,XPOS_Left,Y_Pos,FONT_ScreenSmall,4);
	};
};

// увеличить реальный навык сражения
func void B_RaiseRealFightTalentPercent(var C_Npc oth,var int talent,var int percent)
{
	if(talent == NPC_TALENT_1H)
	{
		oth.aivar[REAL_TALENT_1H] = oth.aivar[REAL_TALENT_1H] + percent;
	}
	else if(talent == NPC_TALENT_2H)
	{
		oth.aivar[REAL_TALENT_2H] = oth.aivar[REAL_TALENT_2H] + percent;
	}
	else if(talent == NPC_TALENT_BOW)
	{
		oth.aivar[REAL_TALENT_BOW] = oth.aivar[REAL_TALENT_BOW] + percent;
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		oth.aivar[REAL_TALENT_CROSSBOW] = oth.aivar[REAL_TALENT_CROSSBOW] + percent;
	};
};

// увеличить реальный и текущий навык сражения
func void B_RaiseFightTalent(var C_Npc oth,var int talent,var int percent)
{
	B_RaiseRealFightTalentPercent(oth,talent,percent);
	B_AddFightSkill(oth,talent,percent);
};

// увеличить реальный и текущий навык сражения (с сообщением)
func void B_RaiseFightTalent_Print(var C_Npc oth,var int talent,var int percent)
{
	var int CurPercent;	//сколько сейчас навыка
	CurPercent = Npc_GetTalentValue(oth,talent);
	//MEM_Debug(ConcatStrings("B_RaiseFightTalent_Print: CurPercent = ",IntToString(CurPercent)));
	if (CurPercent + percent > 100)	{
		percent = 100 - CurPercent;
		
	};
	B_RaiseRealFightTalentPercent(oth,talent,percent);
	B_AddFightSkill(oth,talent,percent);
	if (Npc_IsPlayer(oth))	{
		Print_RaiseFightTalent(talent, percent);
	};
};

