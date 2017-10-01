
const int SPL_Cost_Shrink = 300;

instance Spell_Shrink(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	targetCollectRange = 1000;
};


func int Spell_Logic_Shrink(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_Shrink);
};

func void Spell_Cast_Shrink()
{
	Spell_Cast_Proto(SPL_Cost_Shrink);
	if((other.flags != NPC_FLAG_IMMORTAL) && !C_NpcIsUndead(other) && (other.guild > GIL_SEPERATOR_HUM)
		&& (other.aivar[AIV_MM_ShrinkState] == 0))
	{
		Npc_ClearAIQueue(other);
		B_ClearPerceptions(other);
		AI_StartState(other,ZS_MagicShrink,0,"");
	};
	self.aivar[AIV_SelectSpell] += 1;
};

