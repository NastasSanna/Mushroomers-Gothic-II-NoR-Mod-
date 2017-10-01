
instance TRADER_Lobart(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Lobart(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Lobart))	{
		B_InsertNpc(TRADER_Lobart,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Lobart);

	if (Npc_HasItems(slf, ItFo_Bread) < 5)
	{
		CreateInvItems(slf,ItFo_Bread,9);
	};
	if (Npc_HasItems(slf, ItFo_Milk) < 4)
	{
		CreateInvItems(slf,ItFo_Milk,7);
	};
	if (Npc_HasItems(slf, ItFo_Sausage) < 3)
	{
		CreateInvItems(slf,ItFo_Sausage,4);
	};
	if (Npc_HasItems(slf, ItFo_Cheese) < 4)
	{
		CreateInvItems(slf,ItFo_Cheese,7);
	};
};

func void B_CreateTradeItems_Lobart(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Lobart))	{
		B_InsertNpc(TRADER_Lobart,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Lobart,ItemInst,amount);
};

