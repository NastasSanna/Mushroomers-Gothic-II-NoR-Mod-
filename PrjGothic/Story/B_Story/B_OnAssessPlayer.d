
func void B_OnAssessPlayer()
{
	// РУПЕРТ - долг Лемару
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4941_Thug))	{
		if (!MIS_Rupert_Debts_Paid[Creditor_Lehmar])	{
			AI_GotoNpc(self,other);
		};
	};
};