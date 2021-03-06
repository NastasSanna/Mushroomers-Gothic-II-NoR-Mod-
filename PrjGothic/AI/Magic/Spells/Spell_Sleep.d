
const int SPL_Cost_Sleep = 30;
const int SPL_TIME_Sleep = 30;

instance Spell_Sleep(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
};


func int Spell_Logic_Sleep(var int manaInvested)
{
	if(Spell_Logic_Proto(SPL_Cost_Sleep) == SPL_SENDCAST)
	{
		Spell_Cast_Proto(SPL_Cost_Sleep);
		if(!C_BodyStateContains(other,BS_SWIM) && !C_BodyStateContains(other,BS_DIVE) && !C_NpcIsDown(other)
			&& (other.guild < GIL_SEPERATOR_HUM) && (other.flags != NPC_FLAG_IMMORTAL)
			&& (Npc_GetDistToNpc(self,other) <= 1000)
			&& (other.guild != GIL_KDF) && (other.guild != GIL_DMT) && (other.guild != GIL_PAL))
		{
			Npc_ClearAIQueue(other);
			B_ClearPerceptions(other);
			AI_StartState(other,ZS_MagicSleep,0,"");
		};
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_Sleep()
{
	self.aivar[AIV_SelectSpell] += 1;
	if (Npc_IsPlayer(self))	{
		B_HeroCountUsage_Magic();
	};
};

