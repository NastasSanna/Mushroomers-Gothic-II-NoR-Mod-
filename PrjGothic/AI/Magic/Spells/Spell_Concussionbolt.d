
const int SPL_COST_Concussionbolt = 40;
const int SPL_DAMAGE_Concussionbolt = 200;

instance Spell_Concussionbolt(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Concussionbolt;
};


func int Spell_Logic_Concussionbolt(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_COST_Concussionbolt);
};

func void Spell_Cast_Concussionbolt()
{
	Spell_Cast_Proto(SPL_COST_Concussionbolt);
	self.aivar[AIV_SelectSpell] += 1;
};

