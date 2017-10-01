/**************************************************************************

							ВЫДАЧА ОПЫТА

B_GivePlayerXP	(add_xp)
  ГГ получает add_xp опыта. Если надо - переход на следующий уровень.
  
CheckLevel()
  Проверка перехода на следующий уровень при текущем кол-ве опыта. Рекурсивная.
  
***************************************************************************/

// прирост здоровья за уровень
func void B_GivePlayerHPperLevel()
{
	// прибавляем
	hero.attribute[ATR_HITPOINTS_MAX] += HP_PER_LEVEL;
	hero.aivar[REAL_HITPOINTS_MAX] += HP_PER_LEVEL;
	hero.attribute[ATR_HITPOINTS] += HP_PER_LEVEL;
};

// прирост навыков за уровень
func void B_GivePlayerSkillperLevel()
{
	// DEBUG INFO MEM_Debug("B_GivePlayerSkillperLevel");
	// каждый пропорционально использованиям
	var int STR_UpPoints;
	var int DEX_UpPoints;
	var int MANA_UpPoints;
	
	var int TAL1H_UpPoints;
	var int TAL2H_UpPoints;
	var int BOW_UpPoints;
	var int CBOW_UpPoints;
	var int sum; sum = Hero_Counter_STR+Hero_Counter_DEX+Hero_Counter_MANA+Hero_Counter_H1+Hero_Counter_H2+Hero_Counter_Bow+Hero_Counter_CBow;
	if (sum > 0)	{
		/* DEBUG INFO
		MEM_Debug(ConcatStrings("STR = ",IntToString(Hero_Counter_STR)));
		MEM_Debug(ConcatStrings("DEX = ",IntToString(Hero_Counter_DEX)));
		MEM_Debug(ConcatStrings("MANA = ",IntToString(Hero_Counter_MANA)));
		MEM_Debug(ConcatStrings("H1 = ",IntToString(Hero_Counter_H1)));
		MEM_Debug(ConcatStrings("H2 = ",IntToString(Hero_Counter_H2)));
		MEM_Debug(ConcatStrings("Bow = ",IntToString(Hero_Counter_Bow)));
		MEM_Debug(ConcatStrings("CBow = ",IntToString(Hero_Counter_CBow)));
		//*/
		// на сколько повысить?
		STR_UpPoints	= div_round(LP_PER_LEVEL * Hero_Counter_STR, sum);
		DEX_UpPoints	= div_round(LP_PER_LEVEL * Hero_Counter_DEX, sum);
		MANA_UpPoints	= div_round(LP_PER_LEVEL * Hero_Counter_MANA, sum);
		TAL1H_UpPoints	= div_round(LP_PER_LEVEL * Hero_Counter_H1, sum);
		TAL2H_UpPoints	= div_round(LP_PER_LEVEL * Hero_Counter_H2, sum);
		BOW_UpPoints	= div_round(LP_PER_LEVEL * Hero_Counter_Bow, sum);
		CBOW_UpPoints	= div_round(LP_PER_LEVEL * Hero_Counter_CBow, sum);
		// уменьшаем счетчики
		Hero_Counter_STR 	-= STR_UpPoints * sum * 9 / LP_PER_LEVEL / 10;
		Hero_Counter_DEX 	-= DEX_UpPoints * sum * 9 / LP_PER_LEVEL / 10;
		Hero_Counter_MANA 	-= MANA_UpPoints * sum * 9 / LP_PER_LEVEL / 10;
		Hero_Counter_H1 	-= TAL1H_UpPoints * sum * 9 / LP_PER_LEVEL / 10;
		Hero_Counter_H2 	-= TAL2H_UpPoints * sum * 9 / LP_PER_LEVEL / 10;
		Hero_Counter_Bow 	-= BOW_UpPoints * sum * 9 / LP_PER_LEVEL / 10;
		Hero_Counter_CBow 	-= CBOW_UpPoints * sum * 9 / LP_PER_LEVEL / 10;
		// даем бонусы
		if (STR_UpPoints > 0)	{B_RaiseAttribute(hero,ATR_STRENGTH,STR_UpPoints);};
		if (DEX_UpPoints > 0)	{B_RaiseAttribute(hero,ATR_DEXTERITY,DEX_UpPoints);};
		if (MANA_UpPoints > 0)	{B_RaiseAttribute(hero,ATR_MANA_MAX,MANA_UpPoints);};
		if (TAL1H_UpPoints > 0)	{B_RaiseFightTalent_Print(hero,NPC_TALENT_1H,TAL1H_UpPoints);};
		if (TAL2H_UpPoints > 0)	{B_RaiseFightTalent_Print(hero,NPC_TALENT_2H,TAL2H_UpPoints);};
		if (BOW_UpPoints > 0)	{B_RaiseFightTalent_Print(hero,NPC_TALENT_BOW,BOW_UpPoints);};
		if (CBOW_UpPoints > 0)	{B_RaiseFightTalent_Print(hero,NPC_TALENT_CROSSBOW,CBOW_UpPoints);};
	}
	//если ничего не использовали - поровну
	else
	{
		B_RaiseAttribute(hero,ATR_STRENGTH,2);
		B_RaiseAttribute(hero,ATR_DEXTERITY,2);
		B_RaiseAttribute(hero,ATR_MANA_MAX,2);
		B_RaiseFightTalent_Print(hero,NPC_TALENT_1H,1);
		B_RaiseFightTalent_Print(hero,NPC_TALENT_2H,1);
		B_RaiseFightTalent_Print(hero,NPC_TALENT_BOW,1);
		B_RaiseFightTalent_Print(hero,NPC_TALENT_CROSSBOW,1);
	};
};

func void LevelUp()
{
	// увеличить здоровье
	B_GivePlayerHPperLevel();
	B_GivePlayerSkillperLevel();
	
	// выдать очки обучения
	//hero.lp = hero.lp + LP_PER_LEVEL;
	
	// спецэффект
	AI_PrintScreen(PRINT_LevelUp,XPOS_Left,YPOS_LevelUp,FONT_Screen,4);
	AI_Snd_Play(hero,"LevelUp");
};

func int C_GetExp_Next(var int level)
{
	if (level < 0)	{
		return 0;
	};
	const int exp0 = 1000;
	const int d = 200;
	var int exp_next;	exp_next = (2 * exp0 + d * level) * (level + 1) / 2;
	return exp_next;
};

func void CheckLevel()
{
	// если опыта больше, чем надо для следующего уровня
	if(hero.exp >= hero.exp_next)
	{
		// добавить уровень
		hero.level = hero.level + 1;
		// установить опыт для следующего уровня
		hero.exp_next = C_GetExp_Next(hero.level);
		
		LevelUp();
		
		// проверить, не достигнут ли еще один уровень
		CheckLevel();
	};
};

var int YPOS_XPGained_Shift;

func void B_GivePlayerXP(var int add_xp)
{
	//бонус к опыту
	if (XP_Bonus_10)	{
		add_xp = add_xp * 110 / 100;
	};
	var string concatText;
	// опыт для 1 уровня
	if(hero.level == 0)
	{
		hero.exp_next = 1000;
	};
	// выдать опыт с соответсвующим сообщением
	hero.exp = hero.exp + add_xp;
	concatText = PRINT_XPGained;
	concatText = ConcatStrings(concatText,IntToString(add_xp));
	AI_PrintScreen(concatText,XPOS_Left,YPOS_XPGained + 3 * YPOS_XPGained_Shift,FONT_ScreenSmall,2);
	if (YPOS_XPGained_Shift < 3)
	{
		YPOS_XPGained_Shift += 1;
	}
	else
	{
		YPOS_XPGained_Shift = 0;
	};	
	// достигнут ли новый уровень
	CheckLevel();
};

