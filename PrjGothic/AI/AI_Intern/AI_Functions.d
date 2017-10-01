
//                              WORLD

// персонаж npc идет на свой wp, если надо
func void NS_GotoMyWP (var C_NPC npc)
{
	if ((Npc_GetDistToWP(npc,npc.wp) > TA_DIST_SELFWP_MAX) || (Hlp_StrCmp(Npc_GetNearestWP(npc),npc.wp) == FALSE))
	{
		AI_GotoWP(npc, npc.wp);
	};
};

// персонаж npc идет на свой wp и выравнивается на нем
func void NS_GoAndAlignToMyWP (var C_NPC npc)
{
	NS_GotoMyWP(npc);
	AI_AlignToWP(npc);
};

// =======================================================================

// перестать смотреть на того, на кого смотрел раньше
func void B_StopLookAt(var C_Npc slf)
{
	var C_Npc target; // на кого я смотрю
	target = Npc_GetLookAtTarget(slf);
	// если он существует
	if(Hlp_IsValidNpc(target))
	{
		// перестать на него смотреть
		AI_StopLookAt(slf);
	};
};

// перестать смотреть
func void B_LookAtNpc(var C_Npc slf,var C_Npc oth)
{
	B_StopLookAt(slf);
	// начать смотреть на него
	AI_LookAtNpc(slf,oth);
};

func void B_TurnToNpc(var C_Npc slf,var C_Npc oth)
{
	// повернуться к нему, если я могу
	if ((Npc_GetBodyState(slf) & BS_MAX) == (BS_MAX & BS_STAND)
		|| (Npc_GetBodyState(slf) & BS_MAX) == (BS_MAX &  BS_WALK)
		|| (Npc_GetBodyState(slf) & BS_MAX) == (BS_MAX &  BS_RUN)
		|| (Npc_GetBodyState(slf) & BS_MAX) == (BS_MAX &  BS_SNEAK)
		|| (Npc_GetBodyState(slf) & BS_MAX) == (BS_MAX &  BS_SIT) && Npc_CanSeeNpc(slf, oth))
	{
		AI_TurnToNPC(slf,oth);
	};
};
