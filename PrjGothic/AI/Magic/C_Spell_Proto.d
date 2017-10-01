
// протитип заклинания
prototype C_Spell_Proto(C_Spell)
{
	time_per_mana = 500;
	damage_per_level = 1;
	damagetype = DAM_MAGIC;
	spellType = SPELL_BAD;
	canTurnDuringInvest = 1;
	canChangeTargetDuringInvest = 1;
	isMultiEffect = 0;
	targetCollectAlgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType = TARGET_TYPE_NPCS;
	targetCollectRange = 10000;
	targetCollectAzi = 60;
	targetCollectElev = 60;
};

// прототип функции проверки уровня маны (для заклинаний без инвестирования)
func int Spell_Logic_Proto(var int SPL_Cost_Rune)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
			|| (self.attribute[ATR_MANA] >= SPL_Cost_Rune))
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

// прототип функции применения заклинания
func void Spell_Cast_Proto(var int SPL_Cost_Rune)
{
	var int Cost;
	if(Npc_GetActiveSpellIsScroll(self))
	{
		Cost = SPL_Cost_Scroll;
	}
	else
	{
		Cost = SPL_Cost_Rune;
	};
	self.attribute[ATR_MANA] -= Cost;
	if (Npc_IsPlayer(self))	{
		B_HeroCountUsage_Magic();
	};
};

// прототип функции проверки уровня маны (для заклинаний с инвестированием)

//   реурсивный вызов проверки уровней инвестирования
func int Spell_Logic_Invest_Proto_Rec(var int manaInvested, var int StepCost, var int MaxLevels, var int Level)
{
	if (Level < MaxLevels)
	{
		if((manaInvested > (StepCost * Level)) && (self.aivar[AIV_SpellLevel] <= Level))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - StepCost;
			if(self.attribute[ATR_MANA] < 0)
			{
				self.attribute[ATR_MANA] = 0;
			};
			self.aivar[AIV_SpellLevel] = Level + 1;
			return SPL_NEXTLEVEL;
		}
		else 
		{
			return Spell_Logic_Invest_Proto_Rec(manaInvested, StepCost, MaxLevels, Level + 1);
		};
	}
	else 
	{
		if((manaInvested > (StepCost * (MaxLevels - 1))) && (self.aivar[AIV_SpellLevel] == MaxLevels))
		{
			return SPL_DONTINVEST;
		};
	};
	return SPL_STATUS_CANINVEST_NO_MANADEC;
};

//  общий вызов проверки
func int Spell_Logic_Invest_Proto(var int manaInvested, var int StepCost, var int MaxLevels)
{
	if(self.attribute[ATR_MANA] < StepCost)
	{
		return SPL_DONTINVEST;
	};
	if(manaInvested <= (StepCost * 1))
	{
		self.aivar[AIV_SpellLevel] = 1;
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	};
	return Spell_Logic_Invest_Proto_Rec(manaInvested, StepCost, MaxLevels, 1);
	/* ORIGINAL
	if((manaInvested > (StepCost * 1)) && (self.aivar[AIV_SpellLevel] <= 1))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - StepCost;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 2;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (StepCost * 2)) && (self.aivar[AIV_SpellLevel] <= 2))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - StepCost;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 3;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (StepCost * 3)) && (self.aivar[AIV_SpellLevel] <= 3))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - StepCost;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 4;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (StepCost * 3)) && (self.aivar[AIV_SpellLevel] == 4))
	{
		return SPL_DONTINVEST;
	};
	return SPL_STATUS_CANINVEST_NO_MANADEC;
	//*/
};
