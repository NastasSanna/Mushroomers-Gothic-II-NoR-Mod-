
const int SPL_Cost_Zap = 15;
const int SPL_Damage_Zap = 30;

instance Spell_Zap(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_Zap;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_Zap(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_Zap);
};

func void Spell_Cast_Zap(var int spellLevel)
{
	Spell_Cast_Proto(SPL_Cost_Zap);
	self.aivar[AIV_SelectSpell] += 1;
};

