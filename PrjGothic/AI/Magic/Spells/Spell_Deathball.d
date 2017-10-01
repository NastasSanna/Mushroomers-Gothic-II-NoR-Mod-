
const int SPL_COST_Deathball = 35;
const int SPL_DAMAGE_Deathball = 165;

instance Spell_Deathball(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Deathball;
};


func int Spell_Logic_Deathball(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_COST_Deathball);
};

func void Spell_Cast_Deathball()
{
	Spell_Cast_Proto(SPL_COST_Deathball);

};

