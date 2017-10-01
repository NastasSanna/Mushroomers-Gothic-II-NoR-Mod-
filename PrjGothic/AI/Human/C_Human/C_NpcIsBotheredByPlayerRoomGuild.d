/**************************************************************************

  Волнует ли slf, что вытворяет ГГ в данном помещении (данной гильдии): 
TRUE - волнует, FALSE - нет.
 
***************************************************************************/


func int C_NpcIsBotheredByPlayerRoomGuild(var C_Npc slf)
{
	// гильдия, владеющая помещением
	var int portalguild;
	portalguild = C_GetPlayerPortalGuild();

	// ВОЛНУЕТ, если
	if((portalguild > GIL_NONE) && (portalguild < GIL_SEPERATOR_HUM) // помещением владеет какая-то гильдия
		&& ((slf.guild == portalguild) || (Wld_GetGuildAttitude(slf.guild,portalguild) == ATT_FRIENDLY))) // и это моя или дружественная гильдия
	{
		return TRUE;
	};
	
	// иначе НЕ ВОЛНУЕТ
	return FALSE;
};

