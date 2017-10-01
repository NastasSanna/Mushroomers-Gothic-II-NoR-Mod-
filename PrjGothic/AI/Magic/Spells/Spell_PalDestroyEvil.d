
const int SPL_Cost_PalDestroyEvil = 60;
const int SPL_Damage_PalDestroyEvil = 600;

instance Spell_PalDestroyEvil(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_PalDestroyEvil;
	spellType = SPELL_NEUTRAL;
};


func int Spell_Logic_PalDestroyEvil(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_PalDestroyEvil);
};

func void Spell_Cast_PalDestroyEvil()
{
	Spell_Cast_Proto(SPL_Cost_PalDestroyEvil);
	self.aivar[AIV_SelectSpell] += 1;
};

