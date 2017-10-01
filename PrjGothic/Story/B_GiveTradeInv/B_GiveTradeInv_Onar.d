
instance TRADER_Onar(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Onar(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Onar))	{
		B_InsertNpc(TRADER_Onar,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Onar);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItFo_Bread,12);
		CreateInvItems(slf,ItFo_Milk,3);
		CreateInvItems(slf,ItFo_Cheese,2);
		CreateInvItems(slf,ItFo_Honey,2);
		CreateInvItems(slf,ItFo_Apple,6);
		slf.aivar[AIV_ChapterInv] = 1;
	};
};

func void B_CreateTradeItems_Onar(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Onar))	{
		B_InsertNpc(TRADER_Onar,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Onar,ItemInst,amount);
};

