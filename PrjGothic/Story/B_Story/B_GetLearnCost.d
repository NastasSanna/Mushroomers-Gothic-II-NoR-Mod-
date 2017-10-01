
// точное значение стоимости обучения для навыков с прогрессивной стоимостью
func int B_GetLearnCost_Progressive(var int skill, var int Real_Value)
{
	// шаг, при котором изменяется стоимость обучения
	const int step = 30;
	var int Cost;
	var int Skill_Overflow;
	// базовая стоимость (при текущем уровне обучения) - по 1 пункту за каждый шаг
	Cost = 1 + Real_Value / step;
	/* DEBUG INFO
	var string txt;
	txt = IntToString(Cost);
	//*/
	// если после обучения уровень не изменится
	if (Cost == 1 + (Real_Value + skill) / step)
	{
		/* DEBUG INFO
		txt = ConcatStrings(txt, "=");
		txt = ConcatStrings(txt, IntToString(1 + (Real_Value + skill) / step));
		//*/
		// обычная формула стоимости
		Cost = Cost * skill;
	}
	// иначе - изменится
	else
	{
		/* DEBUG INFO
		txt = ConcatStrings(txt, "<");
		txt = ConcatStrings(txt, IntToString(1 + (Real_Value + skill) / step));
		//*/
		// сколько пунктов обучения превышают порог?
		Skill_Overflow = (Real_Value + skill) % step;
		/* DEBUG INFO
		txt = ConcatStrings(txt, " на ");
		txt = ConcatStrings(txt, IntToString(Skill_Overflow));
		//*/
		// те, что не прывышают - по базовой стоимости, остальные - по увеличенной на 1
		Cost = Cost * (skill - Skill_overflow) + (Cost + 1) * Skill_Overflow;
	};
	/* DEBUG INFO
	Print(txt);
	//*/
	return Cost;
};

// стоимость повышения атрибута (LP)
func int B_GetLearnCostAttribute(var C_Npc oth, var int attribut, var int Skill)
{
	var int kosten;
	kosten = 0;
	if(attribut == ATR_STRENGTH)
	{
		/* REWRITTEN
		if(oth.aivar[REAL_STRENGTH] >= 120)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_STRENGTH] >= 90)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_STRENGTH] >= 60)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_STRENGTH] >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};//*/
		kosten = B_GetLearnCost_Progressive(skill, oth.aivar[REAL_STRENGTH]);
	};
	if(attribut == ATR_DEXTERITY)
	{
		/* REWRITTEN
		if(oth.aivar[REAL_DEXTERITY] >= 120)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 90)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 60)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};//*/
		kosten = B_GetLearnCost_Progressive(skill, oth.aivar[REAL_DEXTERITY]);
	};
	if(attribut == ATR_MANA_MAX)
	{
		/* REWRITTEN
		if(oth.aivar[REAL_MANA_MAX] >= 120)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_MANA_MAX] >= 90)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_MANA_MAX] >= 60)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_MANA_MAX] >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};//*/
		kosten = B_GetLearnCost_Progressive(skill, oth.aivar[REAL_MANA_MAX]);
	};
	return kosten;
};

// стоимость обучения (LP)
func int B_GetLearnCostTalent(var C_Npc oth,var int talent,var int skill)
{
	var int kosten;
	kosten = 0;
	if(talent == NPC_TALENT_MAGE)
	{
		if((skill >= 1) && (skill <= 6))
		{
			kosten = 5;
		};
	}
	else if(talent == NPC_TALENT_1H)
	{
		/* REWRITTEN
		if(oth.aivar[REAL_TALENT_1H] >= 120)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 90)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 60)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};//*/
		kosten = B_GetLearnCost_Progressive(skill, oth.aivar[REAL_TALENT_1H]);
	}
	else if(talent == NPC_TALENT_2H)
	{
		/* REWRITTEN
		if(oth.aivar[REAL_TALENT_2H] >= 120)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 90)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 60)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
		kosten = kosten * skill;
		//*/
		kosten = B_GetLearnCost_Progressive(skill, oth.aivar[REAL_TALENT_2H]);
	}
	else if(talent == NPC_TALENT_BOW)
	{
		/* REWRITTEN
		if(oth.aivar[REAL_TALENT_BOW] >= 120)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_TALENT_BOW] >= 90)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_TALENT_BOW] >= 60)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_TALENT_BOW] >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
		kosten = kosten * skill;
		//*/
		kosten = B_GetLearnCost_Progressive(skill, oth.aivar[REAL_TALENT_BOW]);
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		/* REWRITTEN
		if(oth.aivar[REAL_TALENT_CROSSBOW] >= 120)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_TALENT_CROSSBOW] >= 90)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_TALENT_CROSSBOW] >= 60)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_TALENT_CROSSBOW] >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
		kosten = kosten * skill;
		//*/
		kosten = B_GetLearnCost_Progressive(skill, oth.aivar[REAL_TALENT_CROSSBOW]);
	}
	else if((talent == NPC_TALENT_SNEAK) || (talent == NPC_TALENT_ACROBAT))
	{
		kosten = 5;
	}
	else if(talent == NPC_TALENT_PICKLOCK)
	{
		kosten = 10;
	}
	else if(talent == NPC_TALENT_PICKPOCKET)
	{
		kosten = 10;
	}
	else if(talent == NPC_TALENT_SMITH)
	{
		if(skill == WEAPON_Common)
		{
			kosten = 2;
		}
		else if(skill == WEAPON_1H_Special_01)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_2H_Special_01)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_1H_Special_02)
		{
			kosten = 6;
		}
		else if(skill == WEAPON_2H_Special_02)
		{
			kosten = 6;
		}
		else if(skill == WEAPON_1H_Special_03)
		{
			kosten = 8;
		}
		else if(skill == WEAPON_2H_Special_03)
		{
			kosten = 8;
		}
		else if(skill == WEAPON_1H_Special_04)
		{
			kosten = 10;
		}
		else if(skill == WEAPON_2H_Special_04)
		{
			kosten = 10;
		}
		else if(skill == WEAPON_1H_Harad_01)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_1H_Harad_02)
		{
			kosten = 6;
		}
		else if(skill == WEAPON_1H_Harad_03)
		{
			kosten = 8;
		}
		else if(skill == WEAPON_1H_Harad_04)
		{
			kosten = 10;
		};
	}
	else if(talent == NPC_TALENT_ALCHEMY)
	{
		if(skill == POTION_Health_01)
		{
			kosten = 1;
		}
		else if(skill == POTION_Health_02)
		{
			kosten = 3;
		}
		else if(skill == POTION_Health_03)
		{
			kosten = 5;
		}
		else if(skill == POTION_Health_04)
		{
			kosten = 8;
		}
		else if(skill == POTION_Mana_01)
		{
			kosten = 1;
		}
		else if(skill == POTION_Mana_02)
		{
			kosten = 3;
		}
		else if(skill == POTION_Mana_03)
		{
			kosten = 5;
		}
		else if(skill == POTION_Mana_04)
		{
			kosten = 8;
		}
		else if(skill == POTION_Speed)
		{
			kosten = 5;
		}
		else if(skill == POTION_Perm_STR)
		{
			kosten = 20;
		}
		else if(skill == POTION_Perm_DEX)
		{
			kosten = 20;
		}
		else if(skill == POTION_Perm_Mana)
		{
			kosten = 10;
		}
		else if(skill == POTION_Perm_Health)
		{
			kosten = 10;
		}
		else if(skill == POTION_MegaDrink)
		{
			kosten = 20;
		};
	}
	else if(talent == NPC_TALENT_TAKEANIMALTROPHY)
	{
		if(skill == TROPHY_Teeth)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_Claws)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_Fur)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_Heart)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_ShadowHorn)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_FireTongue)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_BFWing)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_BFSting)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_Mandibles)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_CrawlerPlate)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_DrgSnapperHorn)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_DragonScale)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_DragonBlood)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_ReptileSkin)
		{
			kosten = 3;
		};
	}
	else if(talent == NPC_TALENT_FOREIGNLANGUAGE)
	{
		if(skill == LANGUAGE_1)
		{
			kosten = 5;
		}
		else if(skill == LANGUAGE_2)
		{
			kosten = 10;
		}
		else if(skill == LANGUAGE_3)
		{
			kosten = 15;
		};
	}
	else if(talent == NPC_TALENT_WISPDETECTOR)
	{
		if(skill == WISPSKILL_NF)
		{
			kosten = 0;
		}
		else if(skill == WISPSKILL_FF)
		{
			kosten = 1;
		}
		else if(skill == WISPSKILL_NONE)
		{
			kosten = 2;
		}
		else if(skill == WISPSKILL_RUNE)
		{
			kosten = 3;
		}
		else if(skill == WISPSKILL_MAGIC)
		{
			kosten = 4;
		}
		else if(skill == WISPSKILL_FOOD)
		{
			kosten = 5;
		}
		else if(skill == WISPSKILL_POTIONS)
		{
			kosten = 5;
		};
	}
	else if(talent == NPC_TALENT_RUNES)
	{
		if(skill == SPL_PalLight)
		{
			kosten = 1;
		}
		else if(skill == SPL_PalLightHeal)
		{
			kosten = 3;
		}
		else if(skill == SPL_PalHolyBolt)
		{
			kosten = 3;
		}
		else if(skill == SPL_PalMediumHeal)
		{
			kosten = 5;
		}
		else if(skill == SPL_PalRepelEvil)
		{
			kosten = 5;
		}
		else if(skill == SPL_PalFullHeal)
		{
			kosten = 10;
		}
		else if(skill == SPL_PalDestroyEvil)
		{
			kosten = 10;
		}
		else if(skill == SPL_PalTeleportSecret)
		{
			kosten = 5;
		}
		else if(skill == SPL_Light)
		{
			kosten = 1;
		}
		else if(skill == SPL_Firebolt)
		{
			kosten = 5;
		}
		else if(skill == SPL_LightHeal)
		{
			kosten = 3;
		}
		else if(skill == SPL_SummonGoblinSkeleton)
		{
			kosten = 3;
		}
		else if(skill == SPL_Zap)
		{
			kosten = 3;
		}
		else if(skill == SPL_Icebolt)
		{
			kosten = 5;
		}
		else if(skill == SPL_InstantFireball)
		{
			kosten = 10;
		}
		else if(skill == SPL_SummonWolf)
		{
			kosten = 5;
		}
		else if(skill == SPL_WindFist)
		{
			kosten = 5;
		}
		else if(skill == SPL_Sleep)
		{
			kosten = 5;
		}
		else if(skill == SPL_Charm)
		{
			kosten = 5;
		}
		else if(skill == SPL_IceLance)
		{
			kosten = 5;
		}
		else if(skill == SPL_Whirlwind)
		{
			kosten = 5;
		}
		else if(skill == SPL_MediumHeal)
		{
			kosten = 5;
		}
		else if(skill == SPL_LightningFlash)
		{
			kosten = 5;
		}
		else if(skill == SPL_ChargeFireball)
		{
			kosten = 10;
		}
		else if(skill == SPL_SummonSkeleton)
		{
			kosten = 10;
		}
		else if(skill == SPL_Fear)
		{
			kosten = 5;
		}
		else if(skill == SPL_IceCube)
		{
			kosten = 10;
		}
		else if(skill == SPL_Thunderstorm)
		{
			kosten = 5;
		}
		else if(skill == SPL_Geyser)
		{
			kosten = 10;
		}
		else if(skill == SPL_ChargeZap)
		{
			kosten = 10;
		}
		else if(skill == SPL_SummonGolem)
		{
			kosten = 15;
		}
		else if(skill == SPL_DestroyUndead)
		{
			kosten = 10;
		}
		else if(skill == SPL_Pyrokinesis)
		{
			kosten = 10;
		}
		else if(skill == SPL_WaterFist)
		{
			kosten = 10;
		}
		else if(skill == SPL_Firestorm)
		{
			kosten = 15;
		}
		else if(skill == SPL_IceWave)
		{
			kosten = 20;
		}
		else if(skill == SPL_SummonDemon)
		{
			kosten = 20;
		}
		else if(skill == SPL_FullHeal)
		{
			kosten = 10;
		}
		else if(skill == SPL_MasterOfDisaster)
		{
			kosten = 15;
		}
		else if(skill == SPL_Firerain)
		{
			kosten = 20;
		}
		else if(skill == SPL_BreathOfDeath)
		{
			kosten = 20;
		}
		else if(skill == SPL_MassDeath)
		{
			kosten = 20;
		}
		else if(skill == SPL_ArmyOfDarkness)
		{
			kosten = 20;
		}
		else if(skill == SPL_Shrink)
		{
			kosten = 20;
		}
		else
		{
			kosten = 5;
		};
	};
	return kosten;
};

