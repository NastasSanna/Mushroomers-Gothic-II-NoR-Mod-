
// обучить навыку сражени€
func int B_TeachFightTalentPercent(var C_Npc slf,var C_Npc oth,var int talent,var int percent,var int teacherMAX)
{
	// если неверный навык
	if((talent != NPC_TALENT_1H) && (talent != NPC_TALENT_2H) && (talent != NPC_TALENT_BOW) && (talent != NPC_TALENT_CROSSBOW))
	{
		// вывести сообщение и боьше ничего не делать
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	var string concatText;
	var int kosten;
	var int realHitChance;
	// сколько очков нужно дл€ обучени€
	kosten = B_GetLearnCostTalent(oth,talent,percent);
	// проверить реальную величину навыка
	if(talent == NPC_TALENT_1H)
	{
		realHitChance = oth.HitChance[NPC_TALENT_1H];
	}
	else if(talent == NPC_TALENT_2H)
	{
		realHitChance = oth.HitChance[NPC_TALENT_2H];
	}
	else if(talent == NPC_TALENT_BOW)
	{
		realHitChance = oth.HitChance[NPC_TALENT_BOW];
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		realHitChance = oth.HitChance[NPC_TALENT_CROSSBOW];
	};
	
	// ќ“ ј«ј“№—я ”„»“№ --------------------------------------------------------
	
	// если навык уже превышает возможности учител€
	if(realHitChance >= teacherMAX)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
		B_Say(slf,oth,"$NOLEARNYOUREBETTER");
		return FALSE;
	};
	
	// если навык после обучени€ превышает возможности учител€
	if((realHitChance + percent) > teacherMAX)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
		B_Say(slf,oth,"$NOLEARNOVERPERSONALMAX");
		return FALSE;
	};
	
	// если у обучаемого недостаточно очков обучени€
	if(C_NotEnoughLP(slf,oth,kosten))
	{
		return FALSE;
	};
	
	// иначе - ќЅ”„»“№ ----------------------------------------------------------
	
	// сн€ть очки обучени€
	oth.lp = oth.lp - kosten;
	// повысить навык
	if(talent == NPC_TALENT_1H)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_1H,percent);
		if(oth.aivar[REAL_TALENT_1H] >= (oth.aivar[REAL_TALENT_2H] + 30))
		{
			B_RaiseFightTalent(oth,NPC_TALENT_2H,percent);
			PrintScreen(PRINT_Learn1H_and_2H,-1,-1,FONT_Screen,2);
		}
		else
		{
			PrintScreen(PRINT_Learn1H,-1,-1,FONT_Screen,2);
		};
		return TRUE;
	};
	if(talent == NPC_TALENT_2H)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_2H,percent);
		if(oth.aivar[REAL_TALENT_2H] >= (oth.aivar[REAL_TALENT_1H] + 30))
		{
			B_RaiseFightTalent(oth,NPC_TALENT_1H,percent);
			PrintScreen(PRINT_Learn2H_and_1H,-1,-1,FONT_Screen,2);
		}
		else
		{
			PrintScreen(PRINT_Learn2H,-1,-1,FONT_Screen,2);
		};
		return TRUE;
	};
	if(talent == NPC_TALENT_BOW)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_BOW,percent);
		if(oth.aivar[REAL_TALENT_BOW] >= (oth.aivar[REAL_TALENT_CROSSBOW] + 30))
		{
			B_RaiseFightTalent(oth,NPC_TALENT_CROSSBOW,percent);
			PrintScreen(PRINT_LearnBow_and_Crossbow,-1,-1,FONT_Screen,2);
		}
		else
		{
			PrintScreen(PRINT_LearnBow,-1,-1,FONT_Screen,2);
		};
		return TRUE;
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_CROSSBOW,percent);
		if(oth.aivar[REAL_TALENT_CROSSBOW] >= (oth.aivar[REAL_TALENT_BOW] + 30))
		{
			B_RaiseFightTalent(oth,NPC_TALENT_BOW,percent);
			PrintScreen(PRINT_LearnCrossbow_and_Bow,-1,-1,FONT_Screen,2);
		}
		else
		{
			PrintScreen(PRINT_LearnCrossbow,-1,-1,FONT_Screen,2);
		};
		return TRUE;
	};
	return FALSE;
};

