

// хочет ли slf (я) последовать за oth (он), если тот в воде
func int C_WantToFollowInWater(var C_NPC slf, var C_NPC oth)
{
	// если он плывет или нырнул, а я не хочу лезть в воду
	if ((C_BodyStateContains(oth,BS_SWIM) || C_BodyStateContains(oth,BS_DIVE))
		&& (!HasFlags(slf.aivar[AIV_MM_Behaviour], BEHAV_FollowInWater)))
	{
		return FALSE; // не хочу
	};
	
	return TRUE;
};