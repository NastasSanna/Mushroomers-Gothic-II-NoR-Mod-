
const int SPL_Cost_Firerain = 150;
const int SPL_Damage_FireRain = 500;

instance Spell_FireRain(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_FireRain;
	damagetype = DAM_MAGIC;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_Firerain(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_Firerain);
};

func void Spell_Cast_Firerain()
{
	Spell_Cast_Proto(SPL_Cost_Firerain);
	self.aivar[AIV_SelectSpell] += 1;
};

