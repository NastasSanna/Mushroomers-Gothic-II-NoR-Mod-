
const int SPL_Cost_SummonGolem = 80;

instance Spell_SummonGolem(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_BAD;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonGolem(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_SummonGolem);
};

func void Spell_Cast_SummonGolem()
{
	Spell_Cast_Proto(SPL_Cost_SummonGolem);
	self.aivar[AIV_SelectSpell] += 1;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,Summoned_Golem,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,StoneGolem,1,500);
	};
};

