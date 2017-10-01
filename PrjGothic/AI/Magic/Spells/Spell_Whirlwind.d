
const int SPL_Cost_Whirlwind = 30;
const int SPL_Whirlwind_DAMAGE = 0;
const int SPL_TIME_WHIRLWIND = 10;

instance Spell_Whirlwind(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	damage_per_level = 60;
};


func int Spell_Logic_Whirlwind(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_Whirlwind);
};

func void Spell_Cast_Whirlwind()
{
	Spell_Cast_Proto(SPL_Cost_Whirlwind);
	self.aivar[AIV_SelectSpell] += 1;
};

