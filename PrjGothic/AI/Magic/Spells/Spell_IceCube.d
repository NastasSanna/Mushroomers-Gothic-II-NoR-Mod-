
const int SPL_Cost_IceCube = 40;
const int SPL_FREEZE_DAMAGE = 2;
const int SPL_TIME_FREEZE = 19;

instance Spell_IceCube(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = 60;
};


func int Spell_Logic_IceCube(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_IceCube);
};

func void Spell_Cast_IceCube()
{
	Spell_Cast_Proto(SPL_Cost_IceCube);
	self.aivar[AIV_SelectSpell] += 1;
};

