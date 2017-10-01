/***************************************************************************
						ВЛАДЕЛЬЦЫ ПОМЕЩЕНИЙ

  C_GetPlayerPortalGuild() - в помещении какой гильдии находится ГГ в данный
момент
  C_GetFormerPlayerPortalGuild() - в помещении какой гильдии находился ГГ до
этого.
  C_GetNpcPortalGuild(npc) - в помещении какой гильдии находится сейчас npc.
  
  Возвращают:
    GIL_ROOMNONE	- помещение обитаемо, но никому конкретно не принадлежит,
		вход свободный, можно брать вещи, у которых нет хозяина; за ГГ не следят
	GIL_OUTDOOR		- внешний мир (улица), можно делать все
	GIL_NONE		- не исп., в оригинале могла быть и улица, и ничье помещение
	GIL_PUBLIC		- общественное место, можно входить, но брать ничего нельзя;
		за ГГ будут следить
	GIL_DUNGEON		- прохладное подземелье, склеп, подземный храм; необитаемое
	GIL_CAVE		- естественная пещера, возможно, обитаемая
	другие			- помещение принадлежит конкретной гильдии, входить и
		брать вещи могут только члены гильдии или дружественных ей
 
***************************************************************************/

// какой гильдии принадлежит помещение, в котором находится ГГ
func int C_GetPlayerPortalGuild()
{
	// если у помещения есть конкретный владелец
	var C_NPC owner;
	owner = Wld_GetPlayerPortalOwner();
	if (Hlp_IsValidNpc(owner))
	{
		// если владелец все еще жив, и он друг ГГ или разрешил ему жить у себя
		if (!Npc_IsDead(owner) && (HasFlags(owner.aivar[AIV_IgnoreFlags], IGNORE_PortalRoom) || (owner.npcType == NPCTYPE_FRIEND)))
		{
			return GIL_ROOMNONE;		// как ничье
		};
		// если он владеет публичным помещением (остается публичным даже после смерти владельца)
		if (HasFlags(owner.aivar[AIV_IgnoreFlags], IGNORE_PortalRoom_Public))
		{
			return GIL_PUBLIC;			// публичное
		};
		// если у владельца нет гильдии
		if (owner.guild == GIL_NONE)
		{
			return GIL_ROOMNONE;		// как ничье
		};
		// иначе принадлежит его гильдии
		return owner.guild;	
	};
	
	// если нет владельца - стандартная проверка 
	//NS: когда назначен владелец, Wld_GetPlayerPortalGuild ВСЕГДА возвращает -1
	var int OwnerGuild;
	OwnerGuild = Wld_GetPlayerPortalGuild();
	if (OwnerGuild == GIL_NONE)
	{
		return GIL_OUTDOOR;
	};
	if (OwnerGuild == -1)
	{
		return GIL_ROOMNONE;
	};
	return OwnerGuild;
};


// какой гильдии принадлежит помещение, в котором находился ГГ
func int C_GetFormerPlayerPortalGuild()
{
	var C_NPC owner;
	owner = Wld_GetFormerPlayerPortalOwner();
	if (Hlp_IsValidNpc(owner))
	{
		if (!Npc_IsDead(owner) && (HasFlags(owner.aivar[AIV_IgnoreFlags], IGNORE_PortalRoom) || (owner.npcType == NPCTYPE_FRIEND)))
		{
			return GIL_ROOMNONE;
		};
		if (HasFlags(owner.aivar[AIV_IgnoreFlags], IGNORE_PortalRoom_Public))
		{
			return GIL_PUBLIC;
		};
		if (owner.guild == GIL_NONE)
		{
			return GIL_ROOMNONE;
		};
		return owner.guild;	
	};
	var int OwnerGuild;
	OwnerGuild = Wld_GetFormerPlayerPortalGuild();
	if (OwnerGuild == GIL_NONE)
	{
		return GIL_OUTDOOR;
	};
	if (OwnerGuild == -1)
	{
		return GIL_ROOMNONE;
	};
	return OwnerGuild;
};

// какой гильдии принадлежит помещение, в котором находится npc
func int C_GetNpcPortalGuild(var C_NPC npc)
{
	var C_NPC owner;
	owner = Npc_GetPortalOwner(npc);
	if (Hlp_IsValidNpc(owner))
	{
		// данное разрешение действует только на ГГ!
		if (C_NpcIsHero(npc) && !Npc_IsDead(owner)
			&& (HasFlags(owner.aivar[AIV_IgnoreFlags], IGNORE_PortalRoom) || (owner.npcType == NPCTYPE_FRIEND)))
		{
			return GIL_ROOMNONE;
		};
		if (HasFlags(owner.aivar[AIV_IgnoreFlags], IGNORE_PortalRoom_Public))
		{
			return GIL_PUBLIC;
		};
		if (owner.guild == GIL_NONE)
		{
			return GIL_ROOMNONE;
		};
		return owner.guild;	
	};
	var int OwnerGuild;
	OwnerGuild = Npc_GetPortalGuild(npc);
	if (OwnerGuild == GIL_NONE)
	{
		return GIL_ROOMNONE;
	};
	if (OwnerGuild == -1)
	{
		return GIL_OUTDOOR;
	};
	return OwnerGuild;
};

// находится ли ГГ в доме, принадлежащем npc
func int C_HeroIsInNpcsRoom(var C_NPC npc)
{
	if (!Hlp_IsValidNpc(npc))	{return FALSE;};
	var C_NPC RoomOwner;	RoomOwner = Wld_GetPlayerPortalOwner();
	if (Hlp_GetInstanceID(RoomOwner) == Hlp_GetInstanceID(npc))	{
		return TRUE;
	};
	return FALSE;
};

//
func string Wld_GetPlayerPortalName()
{
	var oCPortalRoomManager PortalMen;	PortalMen = _^(MEM_Game.portalman);
	return MEM_ReadString(PortalMen.curPlayerPortal);
};
//является ли npc владельцем помещения, в котором находится ГГ
func int C_IsPlayerInNpcRoom(var C_NPC slf)
{
	//владелаец
	var C_NPC owner;
	owner = Wld_GetPlayerPortalOwner();
	//есть?
	if (Hlp_IsValidNpc(owner))	{
		//совпадают?
		if (C_NpcIs(owner,slf))		{
			return TRUE;		// да
		};
	};
	return FALSE;
};
