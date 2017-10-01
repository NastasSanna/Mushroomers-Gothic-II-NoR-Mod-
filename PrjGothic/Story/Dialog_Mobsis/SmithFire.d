
/*
func int canusesmithfire()
{
	return TRUE;
};
//*/

func void smithfire_s1()
{
	if (Npc_IsPlayer(self))
	{
		if ((self.protection[PROT_FIRE] < 15) && (C_Random(self.protection[PROT_FIRE]) < 5))
		{
			AI_StandUpQuick(self);
			PrintOnMob(PRINT_BurntSelf);
			Wld_PlayEffect("SPELLFX_FIREARMOR", ItMiSwordrawhot,self,0,0,0,FALSE);
			Npc_RemoveInvItem(self, ItMiSwordrawhot);
			CreateInvItem(self, ItMiSwordraw);
		};
	};
};