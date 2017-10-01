
const int SPL_Cost_Icelance = 20;
const int SPL_DAMAGE_Icelance = 100;

instance Spell_Icelance(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Icelance;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_Icelance(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_Icelance);
};

func void Spell_Cast_Icelance()
{
	Spell_Cast_Proto(SPL_Cost_Icelance);
	self.aivar[AIV_SelectSpell] += 1;
};

