
const int SPL_Cost_Geyser = 75;
const int SPL_DAMAGE_Geyser = 150;

instance Spell_Geyser(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Geyser;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_Geyser(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_Geyser);
};

func void Spell_Cast_Geyser()
{
	Spell_Cast_Proto(SPL_Cost_Geyser);
	self.aivar[AIV_SelectSpell] += 1;
};

