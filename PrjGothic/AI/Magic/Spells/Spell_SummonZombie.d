
const int SPL_Cost_SummonZombie = 80;

instance Spell_SummonZombie(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_BAD;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonZombie(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_SummonZombie);
};

func void Spell_Cast_SummonZombie()
{
	Spell_Cast_Proto(SPL_Cost_SummonZombie);
	self.aivar[AIV_SelectSpell] += 1;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,Summoned_ZOMBIE,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,Zombie01,1,500);
	};
};

