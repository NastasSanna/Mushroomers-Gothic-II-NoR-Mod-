
const int SPL_Cost_SummonGuardian = 60;

instance Spell_SummonGuardian(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonGuardian(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_SummonGuardian);
};

func void Spell_Cast_SummonGuardian()
{
	Spell_Cast_Proto(SPL_Cost_SummonGuardian);
	self.aivar[AIV_SelectSpell] += 1;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,Summoned_Guardian,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,Stoneguardian,1,500);
	};
};

