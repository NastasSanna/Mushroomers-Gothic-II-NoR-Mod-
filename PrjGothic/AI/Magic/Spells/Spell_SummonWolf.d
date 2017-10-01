
const int SPL_Cost_SummonWolf = 40;

instance Spell_SummonWolf(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonWolf(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_SummonWolf);
};

func void Spell_Cast_SummonWolf()
{
	Spell_Cast_Proto(SPL_Cost_SummonWolf);
	self.aivar[AIV_SelectSpell] += 1;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,Summoned_Wolf,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,Wolf,1,500);
	};
};

