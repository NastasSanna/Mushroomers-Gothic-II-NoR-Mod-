
const int SPL_Cost_SummonGoblinSkeleton = 20;

instance Spell_SummonGoblinSkeleton(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonGoblinSkeleton(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_SummonGoblinSkeleton);
};

func void Spell_Cast_SummonGoblinSkeleton()
{
	Spell_Cast_Proto(SPL_Cost_SummonGoblinSkeleton);
	self.aivar[AIV_SelectSpell] += 1;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,Summoned_Gobbo_Skeleton,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,Gobbo_Skeleton,1,500);
	};
};

