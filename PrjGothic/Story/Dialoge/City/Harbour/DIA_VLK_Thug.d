
// –”ѕ≈–“ ==============================================
instance DIA_Thug_Rupert_Attack(C_INFO)
{
	nr = 0;
	npc = VLK_4941_Thug;
	condition = DIA_Thug_Rupert_Attack_cond;
	information = DIA_Thug_Rupert_Attack_info;
	important = TRUE;
};
func int DIA_Thug_Rupert_Attack_cond()
{
	if (C_HeroIs_Rupert() && 
		((MIS_Rupert_Debts_Lehmar_Day < Wld_GetDay()) && !MIS_Rupert_Debts_Paid[Creditor_Lehmar]))	{
		return TRUE;
	};
};
func void DIA_Thug_Rupert_Attack_info()
{
	AI_Output(self,other,"DIA_Thug_Rupert_Attack_13_00");	//Ёй, ты! Ћемар просил напомнить тебе, что долги нужно возвращать.
	AI_StopProcessInfos(self);
	B_Attack(self, other,AR_NONE,0);
	MIS_Rupert_Debts_Paid[Creditor_Lehmar] = TRUE;
};

