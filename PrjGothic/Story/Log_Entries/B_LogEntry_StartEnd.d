
func void B_LogEntry_Start()
{
	B_LogEntry_Create(TOPIC_ConstantinoMushrooms,LOG_MISSION,TOPIC_ConstantinoMushrooms_Start);
	
	// индивидуальные квесты
	if (C_HeroIs_Rupert())	{
		B_LogEntry_Create(TOPIC_Rupert_Debts,LOG_MISSION,TOPIC_Rupert_Debts_Start);
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Creditors);
		MIS_Rupert_Debts = LOG_Running;
	};
	if (C_HeroIs_Elena())	{
		B_LogEntry_Create(TOPIC_Elena_Present,LOG_MISSION,TOPIC_Elena_Present_Start);
		MIS_Elena_Present = LOG_Running;
	};
	if (C_HeroIs_Till())	{
		B_LogEntry_Create(TOPIC_Till_Pet,LOG_MISSION,TOPIC_Till_Pet_Start);
		MIS_Till_Pet = LOG_Running;
	};
	if (C_HeroIs_Talbin())	{
		B_LogEntry_Create(TOPIC_Talbin_Hunt,LOG_MISSION,TOPIC_Talbin_Hunt_Start);
		MIS_Talbin_Hunt = LOG_Running;
	};
	if (C_HeroIs_Erol())	{
		B_LogEntry_Create(TOPIC_Erol_Plates,LOG_MISSION,TOPIC_Erol_Plates_Start);
		MIS_Erol_Plates = LOG_Running;
	};
	if (C_HeroIs_Sarah())	{
		B_LogEntry_Create(TOPIC_Sarah_OldFriends,LOG_MISSION,TOPIC_Sarah_OldFriends_Start);
		MIS_Sarah_OldFriends = LOG_Running;
	};
};

var int B_LogEntry_Weekend_Once;
func void B_LogEntry_Weekend()
{
	if (!B_LogEntry_Weekend_Once && (Competition_Result == Competition_Result_NONE))	{
		B_LogEntry(TOPIC_ConstantinoMushrooms, TOPIC_ConstantinoMushrooms_Time);
		B_LogEntry_Weekend_Once = TRUE;
	};
};

