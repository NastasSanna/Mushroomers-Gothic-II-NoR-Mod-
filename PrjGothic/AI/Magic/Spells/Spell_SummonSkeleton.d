
const int SPL_Cost_SummonSkeleton = 60;

instance Spell_SummonSkeleton(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonSkeleton(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_SummonSkeleton);
};

func void Spell_Cast_SummonSkeleton()
{
	Spell_Cast_Proto(SPL_Cost_SummonSkeleton);
	self.aivar[AIV_SelectSpell] += 1;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,Summoned_Skeleton,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,Skeleton,1,500);
	};
};

