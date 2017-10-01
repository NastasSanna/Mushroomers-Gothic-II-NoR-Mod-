
//кто кого охраняет
func int C_GetGuardedNpc(var C_NPC slf)
{
	if (C_NpcIs(slf, Mil_336_Rick)) {
		return CMP_Sarah;
	};
	if (C_NpcIs(slf, Mil_335_Rumbold)) {
		return CMP_Rupert;
	};
	if (C_NpcIs(slf, Bau_903_Bodo)) {
		return CMP_Elena;
	};
	if (C_NpcIs(slf, BAU_935_Bronko)) {
		return CMP_Till;
	};
	if (C_NpcIs(slf, OUT_1200_Engrom)) {
		return CMP_Talbin;
	};
	if (C_NpcIs(slf, OUT_1240_Patric)) {
		return CMP_Erol;
	};
	if (C_NpcIs(slf, Summoned_Skeleton_Odo)) {
		return CMP_Odo;
	};
	if (C_NpcIs(slf, Summoned_Gobbo_Skeleton)
		|| C_NpcIs(slf, Summoned_Golem)
		|| C_NpcIs(slf, Summoned_Guardian)
		|| C_NpcIs(slf, Summoned_Mud)
		|| C_NpcIs(slf, Summoned_Skeleton)
	) {
		return hero;
	};
};

func int C_IsBodyGuard(var C_NPC slf, var C_NPC oth)
{
	var C_NPC body;	body = Hlp_GetNpc(C_GetGuardedNpc(slf));
	if (C_NpcIs(oth, body)) {
		return TRUE;
	};
	return FALSE;
};

