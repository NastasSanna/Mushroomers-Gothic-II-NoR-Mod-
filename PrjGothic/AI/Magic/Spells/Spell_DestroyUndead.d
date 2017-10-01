
const int SPL_Cost_DESTROYUNDEAD = 100;
const int SPL_Damage_DESTROYUNDEAD = 1000;

instance Spell_DestroyUndead(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_DESTROYUNDEAD;
	spellType = SPELL_NEUTRAL;
};


func int Spell_Logic_DestroyUndead(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_DESTROYUNDEAD);
};

func void Spell_Cast_DestroyUndead()
{
	Spell_Cast_Proto(SPL_Cost_DESTROYUNDEAD);
	self.aivar[AIV_SelectSpell] += 1;
};

