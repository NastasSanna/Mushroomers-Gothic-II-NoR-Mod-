

//мне запрещено идти туда, куда идет ГГ?
func int C_FollowPlayerForbidden(var C_NPC slf)
{
	if (slf.guild != GIL_NOV && slf.guild != GIL_KDF && slf.guild != GIL_PAL) {
		if (Npc_GetDistToWP(hero,"NW_MONASTERY_PLACE_01") < 500 || Npc_GetDistToWP(hero,"NW_MONASTERY_PLACE_04") < 3000)	{
			return TRUE;
		};
	};
	if (C_NpcIs(self, PC_HelenDream)) {
		if (Npc_GetDistToWP(self, "NW_MAGECAVE_NS_IN") > 2500) {
			return TRUE;
		};
	};
	return FALSE;
};