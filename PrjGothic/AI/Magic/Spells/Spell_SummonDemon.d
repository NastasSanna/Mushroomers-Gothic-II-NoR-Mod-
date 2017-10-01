
const int SPL_Cost_SummonDemon = 120;

instance Spell_SummonDemon(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonDemon(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_SummonDemon);
};

func void Spell_Cast_SummonDemon()
{
	Spell_Cast_Proto(SPL_Cost_SummonDemon);
	self.aivar[AIV_SelectSpell] += 1;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,Summoned_Demon,1,1000);
	}
	else
	{
		Wld_SpawnNpcRange(self,Demon,1,1000);
	};
};

