
const int SPL_Cost_SuckEnergy = 30;
const int SPL_SuckEnergy_Damage = 100;
const int SPL_TIME_SuckEnergy = 9;

instance Spell_SuckEnergy(C_Spell_Proto)
{
	time_per_mana = 50;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	targetCollectRange = 1000;
};


func int Spell_Logic_SuckEnergy(var int manaInvested)
{
	if(manaInvested == 0)
	{
		return SPL_RECEIVEINVEST;
	};
	return Spell_Logic_Proto(SPL_Cost_SuckEnergy);
};

func void Spell_Cast_SuckEnergy()
{
	Spell_Cast_Proto(SPL_Cost_SuckEnergy);
	self.aivar[AIV_SelectSpell] += 1;
};


