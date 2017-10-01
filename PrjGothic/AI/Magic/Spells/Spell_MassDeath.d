
const int SPL_Cost_MassDeath = 150;
const int SPL_Damage_MassDeath = 500;

instance Spell_MassDeath(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_MassDeath;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_Massdeath(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_MassDeath);
};

func void Spell_Cast_Massdeath()
{
	Spell_Cast_Proto(SPL_Cost_MassDeath);
	self.aivar[AIV_SelectSpell] += 1;
};

