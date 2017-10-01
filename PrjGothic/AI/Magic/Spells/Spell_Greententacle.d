
const int SPL_Cost_Greententacle = 50;
const int SPL_TIME_Greententacle = 20;

instance Spell_Greententacle(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = 0;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	targetCollectRange = 1500;
	spellType = SPELL_NEUTRAL;
};


func int Spell_Logic_Greententacle(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_Greententacle);
};

func void Spell_Cast_Greententacle()
{
	Spell_Cast_Proto(SPL_Cost_Greententacle);
	self.aivar[AIV_SelectSpell] += 1;
};

