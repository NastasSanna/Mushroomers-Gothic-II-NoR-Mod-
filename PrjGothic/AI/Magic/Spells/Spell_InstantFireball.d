
const int SPL_COST_InstantFireball = 15;
const int SPL_DAMAGE_InstantFireball = 75;

instance Spell_InstantFireball(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_InstantFireball;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_InstantFireball(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_COST_InstantFireball);
};

func void Spell_Cast_InstantFireball()
{
	Spell_Cast_Proto(SPL_COST_InstantFireball);
	self.aivar[AIV_SelectSpell] += 1;
};

