
const int SPL_Cost_PalRepelEvil = 30;
const int SPL_Damage_PalRepelEvil = 300;

instance Spell_PalRepelEvil(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_PalRepelEvil;
};


func int Spell_Logic_PalRepelEvil(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_PalRepelEvil);
};

func void Spell_Cast_PalRepelEvil()
{
	Spell_Cast_Proto(SPL_Cost_PalRepelEvil);
	self.aivar[AIV_SelectSpell] += 1;
};

