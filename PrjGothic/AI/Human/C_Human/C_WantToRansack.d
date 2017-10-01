/**************************************************************************

  Хочет ли slf обшарить поверженного oth.
  
  Не обыскивают друзья, маги, послушники, паладины, орки, ищущие.
  
  Сюжетная особенность: Ворон никогда не обыскивает побежденных врагов.
 
***************************************************************************/


func int C_WantToRansack(var C_Npc slf)
{
	// НЕ ХОЧУ, если
	
	// он ГГ, а я его друг
	if((slf.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(other))
	{
		return FALSE;
	};
	
	// я ищущий, орк, паладин, маг огня, послушник или маг воды
	if((slf.guild == GIL_DMT)
		|| (slf.guild == GIL_ORC)
		|| (slf.guild == GIL_PAL)
		|| (slf.guild == GIL_KDF)
		|| (slf.guild == GIL_NOV)
		|| (slf.guild == GIL_KDW))
	{
		return FALSE;
	};
	
	// на арене не принято обирать врагов
	if (slf.aivar[AIV_ArenaFight] != AF_NONE)	{
		return FALSE;
	};
	
	// в остальных случаях - ХОЧУ
	return TRUE;
};

