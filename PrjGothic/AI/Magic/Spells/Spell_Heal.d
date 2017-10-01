
const int SPL_Cost_PalLightHeal = 10;
const int SPL_Cost_PalMediumHeal = 25;
const int SPL_Cost_PalFullHeal = 50;
const int SPL_Cost_LightHeal = 10;
const int SPL_Cost_MediumHeal = 25;
const int SPL_Cost_FullHeal = 50;
const int SPL_Heal_PalLightHeal = 200;
const int SPL_Heal_PalMediumHeal = 400;
const int SPL_Heal_PalFullHeal = 800;
const int SPL_Heal_LightHeal = 200;
const int SPL_Heal_MediumHeal = 400;
const int SPL_Heal_FullHeal = 800;

instance Spell_Heal(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_CASTER;
	canTurnDuringInvest = 0;
};

instance Spell_PalHeal(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_CASTER;
	canTurnDuringInvest = 0;
};


func int Spell_Logic_PalLightHeal(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_PalLightHeal);
};

func int Spell_Logic_PalMediumHeal(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_PalMediumHeal);
};

func int Spell_Logic_PalFullHeal(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_PalFullHeal);
};

func int Spell_Logic_LightHeal(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_LightHeal);
};

func int Spell_Logic_MediumHeal(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_MediumHeal);
};

func int Spell_Logic_FullHeal(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_FullHeal);
};

func void Spell_Cast_DoHeal(var int SPL_Cost_Rune, var int SPL_Heal_HP)
{
	Spell_Cast_Proto(SPL_Cost_Rune);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_HP);
	
};

func void Spell_Cast_Heal()
{
	if(Npc_GetActiveSpell(self) == SPL_LightHeal)
	{
		Spell_Cast_DoHeal(SPL_Cost_LightHeal, SPL_Heal_LightHeal);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_MediumHeal)
	{
		Spell_Cast_DoHeal(SPL_Cost_MediumHeal, SPL_Heal_MediumHeal);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_FullHeal)
	{
		Spell_Cast_DoHeal(SPL_Cost_FullHeal, SPL_Heal_FullHeal);
	};
	self.aivar[AIV_SelectSpell] += 1;
};

func void Spell_Cast_PalHeal()
{
	if(Npc_GetActiveSpell(self) == SPL_PalLightHeal)
	{
		Spell_Cast_DoHeal(SPL_Cost_PalLightHeal, SPL_Heal_PalLightHeal);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_PalMediumHeal)
	{
		Spell_Cast_DoHeal(SPL_Cost_PalMediumHeal, SPL_Heal_PalMediumHeal);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_PalFullHeal)
	{
		Spell_Cast_DoHeal(SPL_Cost_PalFullHeal, SPL_Heal_PalFullHeal);
		return;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

