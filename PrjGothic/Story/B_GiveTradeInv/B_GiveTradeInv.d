
//переписано на индивидуальные B_GiveTradeInv_xxx
//торговый инвентарь отдельно
func void B_GiveTradeInv(var C_Npc slf)
{
	/*
	var C_Npc Trd_Lutero;
	Trd_Lutero =	Hlp_GetNpc(VLK_404_Lutero);
	
	B_ClearRuneInv(slf);
	var C_ITEM weapon;
	if (Npc_HasEquippedMeleeWeapon(slf))
	{
		weapon = Npc_GetEquippedMeleeWeapon(slf);
		if (Npc_HasItems(slf, weapon) < 2)
		{
			CreateInvItem(slf, weapon);
		};
	};
	if (Npc_HasEquippedRangedWeapon(slf))
	{
		weapon = Npc_GetEquippedRangedWeapon(slf);
		if (Npc_HasItems(slf, weapon) < 2)
		{
			CreateInvItem(slf, weapon);
		};
	};
	
	/*if(slf.aivar[AIV_ChapterInv] <= Kapitel)
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Engor))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Engor(slf);
		};

		//slf.aivar[AIV_ChapterInv] = Kapitel + 1;
	};
	if(Npc_IsInState(slf,ZS_Dead) || Npc_IsInState(slf,ZS_Unconscious))
	{
		// unfinished универсальная очистка инвентаря
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Lutero))
		{
			B_ClearDeadTrader(slf);
		};
	};
	//*/
};

