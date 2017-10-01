
const int SPL_Cost_PalHolyBolt = 10;
const int SPL_Damage_PalHolyBolt = 100;

instance Spell_PalHolyBolt(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_PalHolyBolt;
};


func int Spell_Logic_PalHolyBolt(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_PalHolyBolt);
};

func void Spell_Cast_PalHolyBolt()
{
	Spell_Cast_Proto(SPL_Cost_PalHolyBolt);
	self.aivar[AIV_SelectSpell] += 1;
};

