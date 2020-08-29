
func void B_RupertPayDebt_All(var int XP_sum)
{
	// все долги вернули?  -----------------------------
	if (MIS_Rupert_Debts_Paid[Creditor_Hanna]
		&& MIS_Rupert_Debts_Paid[Creditor_Matteo]
		&& MIS_Rupert_Debts_Paid[Creditor_Jora]
		&& MIS_Rupert_Debts_Paid[Creditor_Baltram]
		&& MIS_Rupert_Debts_Paid[Creditor_Canthar]
		&& MIS_Rupert_Debts_Paid[Creditor_Kardif]
		&& MIS_Rupert_Debts_Paid[Creditor_Lehmar])
	{
		// квест завершен!
		B_LogEntry_Status(TOPIC_Rupert_Debts,LOG_SUCCESS,TOPIC_Rupert_Debts_Success);
		MIS_Rupert_Debts = LOG_SUCCESS;
		XP_sum += XP_Rupert_Debts_All;
	};
	
	//выдать весь опыт
	B_GivePlayerXP(XP_sum);
};

//Руперт возвращает долг, Creditor = Creditor_XXX  - кому
func void B_RupertPayDebt(var int Creditor)
{
	var int XP_sum; XP_sum = 0;
	//возврат долга ----------------------------------
	//опыт, журнал, переменная
	if ((Creditor == Creditor_Hanna)
		&& !MIS_Rupert_Debts_Paid[Creditor_Hanna])	{
		MIS_Rupert_Debts_Paid[Creditor_Hanna] = TRUE;
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Hanna);
		XP_sum += XP_Rupert_Debts_Hanna;
	};
	
	if ((Creditor == Creditor_Matteo)
		&& !MIS_Rupert_Debts_Paid[Creditor_Matteo])	{
		MIS_Rupert_Debts_Paid[Creditor_Matteo] = TRUE;
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Matteo);
		XP_sum += XP_Rupert_Debts_Matteo;
	};
	
	if ((Creditor == Creditor_Jora)
		&& !MIS_Rupert_Debts_Paid[Creditor_Jora])	{
		MIS_Rupert_Debts_Paid[Creditor_Jora] = TRUE;
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Jora);
		XP_sum += XP_Rupert_Debts_Jora;
	};
	
	if ((Creditor == Creditor_Baltram)
		&& !MIS_Rupert_Debts_Paid[Creditor_Baltram])	{
		MIS_Rupert_Debts_Paid[Creditor_Baltram] = TRUE;
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Baltram);
		XP_sum += XP_Rupert_Debts_Baltram;
	};
	
	if ((Creditor == Creditor_Canthar)
		&& !MIS_Rupert_Debts_Paid[Creditor_Canthar])	{
		MIS_Rupert_Debts_Paid[Creditor_Canthar] = TRUE;
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Canthar);
		XP_sum += XP_Rupert_Debts_Canthar;
	};
	
	if ((Creditor == Creditor_Kardif)
		&& !MIS_Rupert_Debts_Paid[Creditor_Kardif])	{
		MIS_Rupert_Debts_Paid[Creditor_Kardif] = TRUE;
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Kardif);
		XP_sum += XP_Rupert_Debts_Kardif;
	};
	
	if ((Creditor == Creditor_Lehmar)
		&& !MIS_Rupert_Debts_Paid[Creditor_Lehmar])	{
		MIS_Rupert_Debts_Paid[Creditor_Lehmar] = TRUE;
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Lehmar);
		XP_sum += XP_Rupert_Debts_Lehmar;
	};
	
	B_RupertPayDebt_All(XP_sum);
};

