
const int SPL_Cost_SummonMud = 10;

instance Spell_SummonMud(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_BAD;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonMud(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_SummonMud);
};

func void Spell_Cast_SummonMud()
{
	Spell_Cast_Proto(SPL_Cost_SummonMud);
	self.aivar[AIV_SelectSpell] += 1;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,Summoned_Mud,1,1000);
	}
	else
	{
		Wld_SpawnNpcRange(self,Undead_Mud,1,1000);
	};
};

