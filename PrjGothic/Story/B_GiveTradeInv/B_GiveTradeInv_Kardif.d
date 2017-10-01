
instance TRADER_Kardif(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Kardif(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Kardif))	{
		B_InsertNpc(TRADER_Kardif,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Kardif);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItFo_FishSoup,3);
		CreateInvItems(slf,ItFo_Booze,2);
		CreateInvItems(slf,ItFo_Beer,7);
		CreateInvItems(slf,ItFo_Wine,3);

		slf.aivar[AIV_ChapterInv] = 1;
	};
	if (Npc_HasItems(slf, ItFo_Booze) < 3)
	{
		CreateInvItems(slf,ItFo_Booze,3);
	};
	if (Npc_HasItems(slf, ItFo_Beer) < 5)
	{
		CreateInvItems(slf,ItFo_Beer,5);
	};
};

func void B_CreateTradeItems_Kardif(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Kardif))	{
		B_InsertNpc(TRADER_Kardif,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Kardif,ItemInst,amount);
};

