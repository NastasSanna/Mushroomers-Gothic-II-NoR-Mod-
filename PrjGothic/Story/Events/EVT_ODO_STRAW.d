
func int EVT_Odo_StrawQuality_Cond()
{
	if (C_HeroIs_Odo() && (MIS_Odo_Straw == LOG_Running))	{
		//только в обычных режимах
		if (C_BodyStateContains(hero,BS_STAND) || C_BodyStateContains(hero,BS_RUN)
			 || C_BodyStateContains(hero,BS_SNEAK) || C_BodyStateContains(hero,BS_WALK)) {
			return TRUE;
		};
	};
	return FALSE;
};

var int EVT_Odo_StrawQuality_Onar_Once;
func void EVT_Odo_StrawQuality_Onar()
{
	if (((Npc_GetDistToWP(hero,"NW_BIGFARM_STABLE_05") < 400) || (Npc_GetDistToWP(hero,"NW_BIGFARM_STABLE_01") < 400))
			&& !EVT_Odo_StrawQuality_Onar_Once) {
		EVT_Odo_StrawQuality_Onar_Once = TRUE;
		MIS_Odo_Straw_Onar[Straw_Quality] = 1;
		B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Onar_Quality);
	};
};
var int EVT_Odo_StrawQuality_Sekob_Once;
func void EVT_Odo_StrawQuality_Sekob()
{
	if ((Npc_GetDistToWP(hero,"NW_FARM4_STABLE_01") < 400)
			&& !EVT_Odo_StrawQuality_Sekob_Once) {
		EVT_Odo_StrawQuality_Sekob_Once = TRUE;
		MIS_Odo_Straw_Sekob[Straw_Quality] = 1;
		B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Sekob_Quality);
	};
};
var int EVT_Odo_StrawQuality_Bengar_Once;
func void EVT_Odo_StrawQuality_Bengar()
{
	if ((Npc_GetDistToWP(hero,"NW_FARM3_STABLE_IN_01") < 400)
			&& !EVT_Odo_StrawQuality_Bengar_Once) {
		EVT_Odo_StrawQuality_Bengar_Once = TRUE;
		MIS_Odo_Straw_Bengar[Straw_Quality] = 1;
		B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Bengar_Quality);
	};
};
var int EVT_Odo_StrawQuality_Akil_Once;
func void EVT_Odo_StrawQuality_Akil()
{
	if (((Npc_GetDistToWP(hero,"NW_FARM2_FIELD_01") < 500) || (Npc_GetDistToWP(hero,"NW_FARM2_FIELD_TANOK") < 500) || (Npc_GetDistToWP(hero,"NW_FARM2_FIELD_TELBOR") < 500) || (Npc_GetDistToWP(hero,"NW_FARM2_FIELD_02") < 500))
			&& !EVT_Odo_StrawQuality_Akil_Once) {
		EVT_Odo_StrawQuality_Akil_Once = TRUE;
		MIS_Odo_Straw_Akil[Straw_Quality] = 1;
		B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Akil_Quality);
	};
};
var int EVT_Odo_StrawQuality_Lobart_Once;
func void EVT_Odo_StrawQuality_Lobart()
{
	if ((Npc_GetDistToWP(hero,"NW_FARM1_INSTABLE_02") < 500)
			&& !EVT_Odo_StrawQuality_Lobart_Once) {
		EVT_Odo_StrawQuality_Lobart_Once = TRUE;
		MIS_Odo_Straw_Lobart[Straw_Quality] = 1;
		B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Lobart_Quality);
	};
};
func void EVT_Odo_StrawQuality()
{
	if (EVT_Odo_StrawQuality_Cond())	{
		EVT_Odo_StrawQuality_Akil();
		EVT_Odo_StrawQuality_Bengar();
		EVT_Odo_StrawQuality_Lobart();
		EVT_Odo_StrawQuality_Onar();
		EVT_Odo_StrawQuality_Sekob();
	};
};

