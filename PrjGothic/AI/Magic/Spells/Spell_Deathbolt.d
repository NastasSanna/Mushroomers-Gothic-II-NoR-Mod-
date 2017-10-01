
const int SPL_COST_Deathbolt = 25;
const int SPL_DAMAGE_Deathbolt = 125;

instance Spell_Deathbolt(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Deathbolt;
};


func int Spell_Logic_Deathbolt(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_COST_Deathbolt);
};

func void Spell_Cast_Deathbolt()
{
	Spell_Cast_Proto(SPL_COST_Deathbolt);
};

