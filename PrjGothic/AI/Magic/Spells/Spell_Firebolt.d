
const int SPL_Cost_Firebolt = 5;
const int SPL_Damage_Firebolt = 25;

instance Spell_Firebolt(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_Firebolt;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_Firebolt(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_Firebolt);
};

func void Spell_Cast_Firebolt()
{
	Spell_Cast_Proto(SPL_Cost_Firebolt);
	self.aivar[AIV_SelectSpell] += 1;
};

