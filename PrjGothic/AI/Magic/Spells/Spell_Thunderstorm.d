
const int SPL_Cost_Thunderstorm = 100;
const int SPL_DAMAGE_Thunderstorm = 250;

instance Spell_Thunderstorm(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Thunderstorm;
	damagetype = DAM_MAGIC;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_Thunderstorm(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_Thunderstorm);
};

func void Spell_Cast_Thunderstorm()
{
	Spell_Cast_Proto(SPL_Cost_Thunderstorm);
	self.aivar[AIV_SelectSpell] += 1;
};

