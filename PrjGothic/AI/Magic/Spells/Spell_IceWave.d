
const int SPL_Cost_IceWave = 120;

instance Spell_IceWave(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = 60;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_IceWave(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_IceWave);
};

func void Spell_Cast_IceWave()
{
	Spell_Cast_Proto(SPL_Cost_IceWave);
	self.aivar[AIV_SelectSpell] += 1;
};

