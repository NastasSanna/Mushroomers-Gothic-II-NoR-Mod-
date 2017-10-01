
instance TRADER_Baltram(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Baltram(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Baltram))	{
		B_InsertNpc(TRADER_Baltram,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Baltram);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItFo_Bread,7);
		CreateInvItems(slf,ItFo_Apple,4);
		CreateInvItems(slf,ItFo_Cheese,3);
		CreateInvItems(slf,ItFo_Honey,2);
		CreateInvItems(slf,ItFo_Milk,6);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,ItFo_Water,10);
		CreateInvItems(slf,ItFo_Wine,5);
		CreateInvItems(slf,ItMi_Pliers,1);
		slf.aivar[AIV_ChapterInv] = 1;
	};
	if (Npc_HasItems(slf, ItFo_Bread) < 2)
	{
		CreateInvItems(slf,ItFo_Bread,3);
	};
	if (Npc_HasItems(slf, ItFo_Sausage) < 2)
	{
		CreateInvItems(slf,ItFo_Sausage,2);
	};
	if (Npc_HasItems(slf, ItFo_Water) < 5)
	{
		CreateInvItems(slf,ItFo_Water,5);
	};
};

func void B_CreateTradeItems_Baltram(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Baltram))	{
		B_InsertNpc(TRADER_Baltram,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Baltram,ItemInst,amount);
};

