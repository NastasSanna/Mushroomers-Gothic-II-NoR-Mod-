
const int SPL_Cost_Skull = 250;
const int SPL_Damage_Skull = 666;

instance Spell_Skull(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_Skull;
	damagetype = DAM_MAGIC;
	targetCollectAlgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
};


func int Spell_Logic_Skull(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_Skull);
};

func void Spell_Cast_Skull()
{
	Spell_Cast_Proto(self.attribute[ATR_MANA]);
	self.aivar[AIV_SelectSpell] += 1;
};

