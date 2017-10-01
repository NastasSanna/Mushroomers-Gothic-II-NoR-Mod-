
instance TRADER_Coragon(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Coragon(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Coragon))	{
		B_InsertNpc(TRADER_Coragon,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Coragon);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItFo_Wine,8);
		CreateInvItems(slf,ItFo_Booze,3);
		CreateInvItems(slf,ItFo_Beer,5);
		CreateInvItems(slf,ItFo_Apple,7);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_Cheese,4);
		CreateInvItems(slf,ItFo_Bacon,6);
		CreateInvItems(slf,ItFo_Sausage,4);
		CreateInvItems(slf,ItFo_Honey,3);
		slf.aivar[AIV_ChapterInv] = 1;
	};
	if (Npc_HasItems(slf, ItFo_Booze) < 2)
	{
		CreateInvItems(slf,ItFo_Booze,3);
	};
	if (Npc_HasItems(slf, ItFo_Beer) < 3)
	{
		CreateInvItems(slf,ItFo_Beer,3 + Hlp_Random(4));
	};
	if (Npc_HasItems(slf, ItFo_Stew) < 2)
	{
		CreateInvItems(slf,ItFo_Stew,2);
	};
};

func void B_CreateTradeItems_Coragon(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Coragon))	{
		B_InsertNpc(TRADER_Coragon,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Coragon,ItemInst,amount);
};

