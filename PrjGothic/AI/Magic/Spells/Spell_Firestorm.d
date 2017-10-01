
const int SPL_Cost_InstantFireStorm = 25;
const int SPL_Damage_InstantFireStorm = 100;

instance Spell_Firestorm(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_InstantFireStorm;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_Firestorm(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_InstantFireStorm);
};

func void Spell_Cast_Firestorm()
{
	Spell_Cast_Proto(SPL_Cost_InstantFireStorm);
	self.aivar[AIV_SelectSpell] += 1;
};

