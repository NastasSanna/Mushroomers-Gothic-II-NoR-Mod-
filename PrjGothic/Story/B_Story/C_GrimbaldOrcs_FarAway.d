// разные квестовые проверки

//смогли увести орков со стоянки
func int _C_GrimbaldOrc_FarAway(var C_NPC orc)
{
	if (!Hlp_IsValidNpc(orc))	{
		return TRUE;
	}
	else if (Npc_IsDead(orc))	{
		return TRUE;
	}
	else if ((Npc_GetDistToWP(orc,"NW_XARDAS_GOBBO_01") > 4400) 
		&&	((Npc_GetDistToWP(orc,"NW_XARDAS_GOBBO_01") > Npc_GetDistToWP(orc,"NW_XARDAS_PATH_FARM1_07")) || (Npc_GetDistToWP(orc,"NW_XARDAS_GOBBO_01") > Npc_GetDistToWP(orc,"NW_XARDAS_PATH_FARM1_11")))
		&&	(Npc_GetDistToNpc(orc,OUT_1210_Grimbald) > PERC_DIST_ACTIVE_MAX))	{
		return TRUE;
	};
	return FALSE;
};
func int C_GrimbaldOrcs_FarAway()
{
	var int orc1_faraway; orc1_faraway = _C_GrimbaldOrc_FarAway(OrcWarrior_Grimbald1);
	var int orc2_faraway; orc2_faraway = _C_GrimbaldOrc_FarAway(OrcWarrior_Grimbald3);
	var int orc3_faraway; orc3_faraway = _C_GrimbaldOrc_FarAway(OrcWarrior_Grimbald3);
	if ((orc1_faraway == TRUE) && (orc2_faraway == TRUE) && (orc3_faraway == TRUE))	{
		return TRUE;
	};
	return FALSE;	
};

