
const int SPL_Cost_ArmyOfDarkness = 150;

instance Spell_ArmyOfDarkness(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_ArmyOfDarkness(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_ArmyOfDarkness);
};

func void Spell_Cast_ArmyOfDarkness(var int spellLevel)
{
	Spell_Cast_Proto(SPL_Cost_ArmyOfDarkness);
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,Summoned_Skeleton,6,800);
	}
	else
	{
		Wld_SpawnNpcRange(self,Skeleton,6,800);
	};
	self.aivar[AIV_SelectSpell] += 1;
};

