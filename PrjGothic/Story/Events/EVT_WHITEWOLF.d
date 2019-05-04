

func int EVT_WhiteWolf_Trace_Cond()
{
	if (C_HeroIs_Talbin() && (MIS_Talbin_WhiteWolf > 0))	{
		//только в обычных режимах
		if (C_BodyStateContains(hero,BS_STAND) || C_BodyStateContains(hero,BS_RUN)
			 || C_BodyStateContains(hero,BS_SNEAK) || C_BodyStateContains(hero,BS_WALK)) {
			MEM_Debug("EVT_WhiteWolf_Check+");
			return TRUE;
		};
	};
	return FALSE;
};

var int EVT_WhiteWolf_LakeTrace_Once;
var int EVT_WhiteWolf_Fight_Once;
var int EVT_WhiteWolf_Fur_Once;
var int EVT_WhiteWolf_StairsTrace_Once;

func void EVT_WhiteWolf_Check()
{
	MEM_Debug("EVT_WhiteWolf_Check");
	if (EVT_WhiteWolf_Trace_Cond()) {
		var oCNpc h;	h = Hlp_GetNpc(hero);
		if (h.focus_vob)	{
			var zCVob fv;	fv = _^(h.focus_vob);
			if (Hlp_StrCmp(fv._zCObject_objectName,"WHITEWOLF_LAKETRACE") && !EVT_WhiteWolf_LakeTrace_Once) {
				EVT_WhiteWolf_LakeTrace_Once = TRUE;
				B_LogEntry_Status(TOPIC_Talbin_WhiteWolf,MIS_Talbin_WhiteWolf,TOPIC_Talbin_WhiteWolf_TraceLake);
				B_GivePlayerXP(XP_Talbin_WhiteWolf_Trace);
			};
			if (Hlp_StrCmp(fv._zCObject_objectName,"WHITEWOLF_FUR") && !EVT_WhiteWolf_Fur_Once) {
				EVT_WhiteWolf_Fur_Once = TRUE;
				B_LogEntry_Status(TOPIC_Talbin_WhiteWolf,MIS_Talbin_WhiteWolf,TOPIC_Talbin_WhiteWolf_TraceFur);
				B_GivePlayerXP(XP_Talbin_WhiteWolf_Trace);
			};
			if (Hlp_StrCmp(fv._zCObject_objectName,"WHITEWOLF_STAIRSTRACE") && !EVT_WhiteWolf_StairsTrace_Once) {
				EVT_WhiteWolf_StairsTrace_Once = TRUE;
				B_LogEntry_Status(TOPIC_Talbin_WhiteWolf,MIS_Talbin_WhiteWolf,TOPIC_Talbin_WhiteWolf_TraceStairs);
				B_GivePlayerXP(XP_Talbin_WhiteWolf_Trace);
			};
		};
		if ((Npc_GetDistToWP(hero,"NW_FARM3_BIGWOOD_03") < 500) && !EVT_WhiteWolf_Fight_Once) {
			EVT_WhiteWolf_Fight_Once = TRUE;
			AI_Wait(hero,1);
			B_LogEntry_Status(TOPIC_Talbin_WhiteWolf,MIS_Talbin_WhiteWolf,TOPIC_Talbin_WhiteWolf_TraceFight);
			B_GivePlayerXP(XP_Talbin_WhiteWolf_Trace);
		};
	};
};
