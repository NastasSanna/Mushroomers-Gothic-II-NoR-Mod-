
const int SPL_Cost_Charm = 50;
const int SPL_Damage_Charm = 0;

instance Spell_Charm(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	damage_per_level = SPL_Damage_Charm;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_Charm(var int manaInvested)
{
	if(Spell_Logic_Proto(SPL_Cost_Charm) == SPL_SENDCAST)
	{
		B_DeletePetzCrime(other);
		other.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
		other.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
		if(Wld_GetGuildAttitude(other.guild,self.guild) != ATT_HOSTILE)
		{
			if(Npc_GetAttitude(other,self) == ATT_HOSTILE)
			{
				Npc_SetTempAttitude(other,Wld_GetGuildAttitude(other.guild,self.guild));
			};
		};
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_Charm()
{
	Spell_Cast_Proto(SPL_Cost_Charm);
	self.aivar[AIV_SelectSpell] += 1;
};

