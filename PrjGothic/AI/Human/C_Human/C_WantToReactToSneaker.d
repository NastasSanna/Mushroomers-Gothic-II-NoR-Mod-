/**************************************************************************

  Обращает ли slf внимание на то, что oth крадется.
 
***************************************************************************/

func int C_WantToReactToSneaker(var C_Npc slf,var C_Npc oth)
{
	// НЕ ОБРАЩАЮ, если
	
	// он слишкорм далеко (больше 7м)
	if(Npc_GetDistToNpc(slf,oth) > 700)
	{
		return FALSE;
	};
	
	// я ищущий или пленник, или я бандит, а он не из лагеря бандитов
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_STRF)
		|| ((slf.guild == GIL_BDT) && !C_NpcBelongsToBL(slf)))
	{
		return FALSE;
	};
	
	// он ГГ, а я его друг
	if((slf.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(oth))
	{
		return FALSE;
	};
	
	// мы друзья
	if(C_NpcGetAttitude(slf,oth) == ATT_FRIENDLY)
	{
		return FALSE;
	};
	
	// я охраняю вход
	if(C_NpcIsGateGuard(self))
	{
		return FALSE;
	};
	
	// В других случаях - ОБРАЩАЮ
	return TRUE;
};

