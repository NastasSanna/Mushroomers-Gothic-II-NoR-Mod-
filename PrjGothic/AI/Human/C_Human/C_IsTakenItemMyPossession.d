/**************************************************************************

  int C_IsTakenItemMyPossession	(slf,	oth,	item)
  Волнует ли self (меня) то, что other (он) взял вещь item (принадлежит
ли она мне): TRUE - принадлежит, FALSE - не принадлежит. Работает только
для ГГ.
  Используется при восприятии кражи B_AssessTheft.
  
  В общем случае - не принадлежит. 
 
***************************************************************************/

func int C_IsTakenItemMyPossession(var C_Npc slf,var C_Npc oth,var C_Item itm)
{
	// ПРИНАДЛЕЖИТ, если --------------------------------------------------
	
	// это моя личная вещь
	if(Npc_OwnedByNpc(itm,slf))
	{
		return TRUE;
	};
	
	// но не обращать внимания, если предмет уже вернули или, наоборот, уронили
	//NS: быстро поднятое упавшим не считается
	// а вот второй вариант не срабатывает, поэтому, что с возу упало...
	if((itm.flags & ITEM_DROPPED) == ITEM_DROPPED)
	{
		/* DEBUG INFO
		PrintSelf("Item's dropped");
		//*/
		return FALSE;
	};
	
	// меня касается, что происходит в помещении этой гильдии
	if(C_NpcIsBotheredByPlayerRoomGuild(self) || (C_GetPlayerPortalGuild() == GIL_PUBLIC))
	{
		return TRUE;
	};
	
	// эта вещь принадлежит дружественной гильдии
	if(Wld_GetGuildAttitude(slf.guild,itm.ownerGuild) == ATT_FRIENDLY)
	{
		return TRUE;
	};
	
	// Во всех остальных случаях -------------------------------------------
	
	// это не моя вещь, мне все равно, что с ней делает ГГ
	return FALSE;
};

