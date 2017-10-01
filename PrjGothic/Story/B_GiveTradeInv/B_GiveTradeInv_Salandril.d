
instance TRADER_Salandril(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Salandril(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Salandril))	{
		B_InsertNpc(TRADER_Salandril,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Salandril);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItPl_Speed_Herb_01,2);
		CreateInvItems(slf,ItPl_Temp_Herb,2);
		CreateInvItems(slf,ItPl_Mana_Herb_02,3);
		CreateInvItems(slf,ItPl_Health_Herb_03,2);
		
		CreateInvItems(slf,ItMi_Flask,5);
		
		CreateInvItems(slf,ItPo_Health_02,10);
		CreateInvItems(slf,ItPo_Health_03,8);
		CreateInvItems(slf,ItPo_Health_Addon_04,5);
		CreateInvItems(slf,ItPo_Mana_03,7);
		CreateInvItems(slf,ItPo_Mana_Addon_04,6);
		CreateInvItems(slf,ItPo_Speed,4);

		slf.aivar[AIV_ChapterInv] = 1;
	};
	if (Npc_HasItems(slf, ItPo_Health_03) < 3)
	{
		CreateInvItems(slf,ItPo_Health_03,3);
	};
	if (Npc_HasItems(slf, ItPo_Mana_03) < 1)
	{
		CreateInvItems(slf,ItPo_Mana_03,5);
	};
	if (Npc_HasItems(slf, ItPo_Speed) < 1)
	{
		CreateInvItems(slf,ItPo_Speed,5);
	};
};

func void B_CreateTradeItems_Salandril(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Salandril))	{
		B_InsertNpc(TRADER_Salandril,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Salandril,ItemInst,amount);
};

