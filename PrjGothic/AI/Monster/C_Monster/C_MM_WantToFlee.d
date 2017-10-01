
// боится ли монстр slf (я) персонажа oth (он)
func int C_MM_WantToFlee (var C_NPC slf, var C_NPC oth)
{
	// НЕ боится -------------------------------------------------------------------
		
	// если некого бояться
	if (!Hlp_IsValidNpc(oth) || !Hlp_IsValidNpc(slf))
	{
		/* DEBUG INFO
		PrintSelfVsOther("No enemy. No fright.");
		//*/
		return FALSE; // то и не бояться
	};
	
	// если я помер -
	if (slf.attribute[ATR_HITPOINTS] == 0)
	{
		/* DEBUG INFO
		PrintSelfVsOther("I'm dead! How can I flee?");
		//*/
		return FALSE; // то мне уже все равно
	};
	
	// если я в команде ГГ
	if (slf.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		/* DEBUG INFO
		PrintSelfVsOther("I'm with hero! I can't flee");
		//*/
		return FALSE; // ничего не боюсь!
	};
	
	// если я крутой
	if (HasFlags(slf.aivar[AIV_Temper], TEMPER_ToughGuy)) 
	{
		/* DEBUG INFO
		PrintSelfVsOther("Tough guys never flee");
		//*/
		return FALSE; // не боюсь
	};
	
	// если я орк или являюсь злом
	if ((slf.guild > GIL_SEPERATOR_ORC) ||	C_NpcIsEvil(slf)) 
	{
		/* DEBUG INFO
		PrintSelfVsOther("Evil monsters and orcs never flee");
		//*/
		return FALSE; // не боюсь
	};
	
	// если он мирный
	if (HasFlags(oth.aivar[AIV_Temper], TEMPER_NoFightParker))
	{
		/* DEBUG INFO
		PrintSelfVsOther("He never fights. No reason to flee");
		//*/
		return FALSE; // не боюсь
	};
	
	// Боится ----------------------------------------------------------------------
	
	// если я мирный
	if (HasFlags(slf.aivar[AIV_Temper], TEMPER_NoFightParker))
	{
		/* DEBUG INFO
		PrintSelfVsOther("I never fight, so I'd better flee");
		//*/
		return TRUE; // боюсь
	};	
	
	// если он на меня охотится
	if (C_PredatorFoundPrey(oth, slf))
	{
		/* DEBUG INFO
		PrintSelfVsOther("I'm his prey! Flee only!");
		//*/
		return TRUE; // боюсь
	};	
	
	// если я гоблин, а у него отвар горичая
	if ((slf.guild == GIL_GOBBO) && Npc_HasItems(oth,ItPo_MR_AntiGobbo))
	{
		/* DEBUG INFO
		PrintSelfVsOther("Burntea! Run, gobbo, run!");
		//*/
		return TRUE; // боюсь
	};	

	//в настройках стоит - не сбегать
	if (MR_Opts_MM_Flee == MR_Opts_MM_Flee_Never)
	{
		return FALSE;
	};
	

	//в настройках стоит - всегда сбегать
	if (MR_Opts_MM_Flee == MR_Opts_MM_Flee_Always)
	{
		if ((100 * slf.attribute[ATR_HITPOINTS] / slf.attribute[ATR_HITPOINTS_MAX] < 20)
			 || (oth.attribute[ATR_HITPOINTS_MAX] > 10 * slf.attribute[ATR_HITPOINTS_MAX]))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	
	// в остальных случаях -----v
	
	// вероятность, что я испугаюсь и сбегу 
	var int p; // в %
	/* DEBUG INFO
	var string txt;
	//*/
	
	//сильно ли я ранен
	//p = (slf.attribute[ATR_HITPOINTS_MAX] / slf.attribute[ATR_HITPOINTS] - 2) * 2;
	p = (20 - slf.attribute[ATR_HITPOINTS] * 20 / slf.attribute[ATR_HITPOINTS_MAX]);
	/* DEBUG INFO
	txt = IntToString(p);
	PrintSelfVsOther(txt);
	//*/
	
	// сколько у каждого из нас союзников
	if (Npc_IsPlayer(oth))	{	//только для ГГ. NPCvNPC иногда вылетает - ???
		p = p + (Npc_GetComrades(oth) - Npc_GetComrades(slf)) * 10;	
	};
	
	/* DEBUG INFO
	txt = ConcatStrings(txt, " + (");
	txt = ConcatStrings(txt, IntToString(Npc_GetComrades(oth)));
	txt = ConcatStrings(txt, "-");
	txt = ConcatStrings(txt, IntToString(Npc_GetComrades(slf)));
	txt = ConcatStrings(txt, " )*10");
	//*/
	
	// если он здоровенный
	if (oth.attribute[ATR_HITPOINTS_MAX] > 10 * slf.attribute[ATR_HITPOINTS_MAX])
	{
		p = p + 20; // шанс бегства выше
		/* DEBUG INFO
		txt = ConcatStrings(txt, " + 20");
		//*/
	};
	
	// если он сильно ранен
	if (oth.attribute[ATR_HITPOINTS] < oth.attribute[ATR_HITPOINTS_MAX] / 10)
	{
		p = p - 20; // шанс бегства ниже
		/* DEBUG INFO
		txt = ConcatStrings(txt, " - 20");
		//*/
	};
	
	// если я трус
	if (slf.fight_tactic == FAI_MONSTER_COWARD)
	{
		p = p + 10; // шанс бегства выше
		/* DEBUG INFO
		txt = ConcatStrings(txt, " + 10");
		//*/
	};

	// если он зло (а я-то нет)
	if (C_NpcIsEvil(oth))
	{
		p = p + 10; // шанс бегства выше
		/* DEBUG INFO
		txt = ConcatStrings(txt, " + 10");
		//*/
	};
	
	/* DEBUG INFO
	txt = ConcatStrings(txt, " = ");
	txt = ConcatStrings(txt, IntToString(p));
	//*/
	
	// решение о бегстве с полученной вероятностью
	if (Hlp_Random(100) < p)
	{
		/* DEBUG INFO
		txt = ConcatStrings(txt, "\nI'll better flee...");
		PrintSelfVsOther(txt);
		//*/
		return TRUE;
	};
	
	/* DEBUG INFO
	PrintSelfVsOther(txt);
	//*/
	
	// иначе - не боюсь
	return FALSE;
};
