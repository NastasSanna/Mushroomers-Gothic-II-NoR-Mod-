
const int SPL_COST_Icebolt = 10;
const int SPL_DAMAGE_Icebolt = 50;

instance Spell_IceBolt(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Icebolt;
};


func int Spell_Logic_IceBolt(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_COST_Icebolt);
};

func void Spell_Cast_IceBolt()
{
	Spell_Cast_Proto(SPL_COST_Icebolt);
	self.aivar[AIV_SelectSpell] += 1;
};

