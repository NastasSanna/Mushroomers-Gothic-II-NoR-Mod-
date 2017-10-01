
func void ZS_Dead()
{
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_StopLookAt(self);
	AI_StopPointAt(self);
	B_GivePlayerXPPerVictory(self, other);
	if (self.aivar[AIV_DeathTime] <= 0)
	{
		self.aivar[AIV_DeathTime] = (Wld_GetDay() * 24 + C_GetHour());
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	{
		PoisonDeadSwampDrone();
	};
	if(Npc_IsPlayer(other))
	{
		self.aivar[AIV_KilledByPlayer] = TRUE;
		if(C_DropUnconscious())
		{
			MadKillerCount = MadKillerCount + 1;
		};
	};
	B_GiveTradeInv(self);
	B_GiveDeathInv(self, other);
	B_ClearRuneInv(self);
	B_OnDeath(self);
	B_DeletePetzCrime(self);
	self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
	AI_UnequipWeapons(self);
	self.aivar[AIV_TAPOSITION] = FALSE;
};

func int ZS_Dead_loop()
{
	if (self.aivar[AIV_TAPOSITION] == FALSE)	{
		self.aivar[AIV_TAPOSITION] = TRUE;
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Noone))	{
			AI_Wait(self, 2);
			B_RemoveNpc(self);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Dead_End()
{
};
