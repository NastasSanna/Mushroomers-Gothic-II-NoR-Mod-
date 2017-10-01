
const int SPL_Cost_Waterfist = 25;
const int SPL_DAMAGE_Waterfist = 125;

instance Spell_Waterfist(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Waterfist;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_Waterfist(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_Waterfist);
};

func void Spell_Cast_Waterfist()
{
	Spell_Cast_Proto(SPL_Cost_Waterfist);
	self.aivar[AIV_SelectSpell] += 1;
};

