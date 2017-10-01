
const int SPL_Cost_Energyball = 100;
const int SPL_DAMAGE_Energyball = 200;

instance Spell_EnergyBall(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Energyball;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_EnergyBall(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_Energyball);
};

func void Spell_Cast_Energyball()
{
	Spell_Cast_Proto(SPL_Cost_Energyball);
	self.aivar[AIV_SelectSpell] += 1;
};

