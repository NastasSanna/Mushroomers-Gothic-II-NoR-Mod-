
instance TRADER_Matteo(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Matteo(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Matteo))	{
		B_InsertNpc(TRADER_Matteo,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Matteo);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItLsTorch,5);
		CreateInvItems(slf,ItPo_Health_01,3);
		CreateInvItems(slf,ItPo_Health_03,1);
		CreateInvItems(slf,ItFo_Cheese,3);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItFo_Water,1);
		CreateInvItems(slf,ItFo_Beer,4);
		CreateInvItems(slf,ItRw_Arrow,25);
		CreateInvItems(slf,ItRw_Bow_L_01,1);
		CreateInvItems(slf,ItMw_1h_Vlk_Dagger,1);
		CreateInvItems(slf,ItMw_1H_Mace_L_01,1);
		CreateInvItems(slf,ItMw_1h_Vlk_Mace,1);
		CreateInvItems(slf,ItMw_Nagelkeule2,1);
		slf.aivar[AIV_ChapterInv] = 1;
	};
	if (Npc_HasItems(slf, ItFo_Bread) < 5)
	{
		CreateInvItems(slf,ItFo_Bread,1 + Hlp_Random(6));
	};
	if (Npc_HasItems(slf, ItFo_Cheese) < 3)
	{
		CreateInvItems(slf,ItFo_Cheese,1 + Hlp_Random(4));
	};
	if (Npc_HasItems(slf, ItFo_Water) < 2)
	{
		CreateInvItems(slf,ItFo_Water,1 + Hlp_Random(3));
	};
};

func void B_CreateTradeItems_Matteo(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Matteo))	{
		B_InsertNpc(TRADER_Matteo,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Matteo,ItemInst,amount);
};

