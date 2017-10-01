
// готова ли пещера к родам Крестика?
func int C_Till_Pet_CaveReady(var int Ready_Flag)
{
	MIS_Till_Pet_CaveReady = MIS_Till_Pet_CaveReady | Ready_Flag;
	//гоблинов нет
	if (HasFlags(MIS_Till_Pet_CaveReady, MIS_Till_Pet_CaveReady_Gobbo1 | MIS_Till_Pet_CaveReady_Gobbo2)
		&& HasAnyFlags(Ready_Flag,MIS_Till_Pet_CaveReady_Gobbo1 | MIS_Till_Pet_CaveReady_Gobbo2))	{
		B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_GobboRemoved);
		B_GivePlayerXP(XP_Till_GobbosRemoved);
	};
	//все готово
	if (MIS_Till_Pet_CaveReady == 7)	{
		B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_CaveReady);
		B_GivePlayerXP(XP_Till_CaveReady);
	};
};

