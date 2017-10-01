
const int SPL_Cost_PalLight = 10;
const int SPL_Cost_LIGHT = 10;
const int SPL_Duration_PalLIGHT = 5;
const int SPL_Duration_LIGHT = 5;

instance Spell_Light(C_Spell_Proto)
{
	time_per_mana = 500;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_NONE;
	targetCollectRange = 0;
	targetCollectAzi = 0;
	targetCollectElev = 0;
};

instance Spell_PalLight(C_Spell_Proto)
{
	time_per_mana = 500;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_NONE;
	targetCollectRange = 0;
	targetCollectAzi = 0;
	targetCollectElev = 0;
};


func int Spell_Logic_PalLight(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_PalLight);
};

func void Spell_Cast_PalLight()
{
	Spell_Cast_Proto(SPL_Cost_PalLight);
	self.aivar[AIV_SelectSpell] += 1;
};

func int Spell_Logic_Light(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_LIGHT);
};

func void Spell_Cast_Light()
{
	Spell_Cast_Proto(SPL_Cost_LIGHT);
	self.aivar[AIV_SelectSpell] += 1;
};

