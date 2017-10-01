
instance TRADER_Fenia(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Fenia(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Fenia))	{
		B_InsertNpc(TRADER_Fenia,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Fenia);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Bread,3);
		CreateInvItems(slf,ItFo_FishSoup,5);
		CreateInvItems(slf,ItFo_Fish,5);
		slf.aivar[AIV_ChapterInv] = 1;
	};
	if (Npc_HasItems(slf, ItFo_FishSoup) < 3)
	{
		CreateInvItems(slf,ItFo_FishSoup,3);
	};
	if (Npc_HasItems(slf, ItFo_Fish) < 5)
	{
		CreateInvItems(slf,ItFo_Fish,2);
	};
};

func void B_CreateTradeItems_Fenia(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Fenia))	{
		B_InsertNpc(TRADER_Fenia,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Fenia,ItemInst,amount);
};

